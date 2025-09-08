use libc::{c_int, c_uchar, c_void};
use std::{ptr::copy_nonoverlapping, slice};

use revm_interpreter::{Host as RevmHost, Interpreter, StateLoad, AccountLoad, SStoreResult, SelfDestructResult, Contract};
use revm_primitives::{Address as H160, B256 as H256, U256, Bytes, Env, Log};
use revm_interpreter::analysis;
use revm_primitives::Bytecode;

use revmc_context::{extern_revmc, EvmCompilerFn};
extern_revmc! { fn custom; }

// 强制链接 revmc 内置符号，确保静态库中带入 __revmc_builtin_*
extern "C" {
    fn __revmc_builtin_sload();
    fn __revmc_builtin_sstore();
    fn __revmc_builtin_log();
    fn __revmc_builtin_call();
    fn __revmc_builtin_balance();
    fn __revmc_builtin_keccak256();
}
#[used]
static __FORCE_LINK_BUILTIN_0: unsafe extern "C" fn() = __revmc_builtin_sload;
#[used]
static __FORCE_LINK_BUILTIN_1: unsafe extern "C" fn() = __revmc_builtin_sstore;
#[used]
static __FORCE_LINK_BUILTIN_2: unsafe extern "C" fn() = __revmc_builtin_log;
#[used]
static __FORCE_LINK_BUILTIN_3: unsafe extern "C" fn() = __revmc_builtin_call;
#[used]
static __FORCE_LINK_BUILTIN_4: unsafe extern "C" fn() = __revmc_builtin_balance;
#[used]
static __FORCE_LINK_BUILTIN_5: unsafe extern "C" fn() = __revmc_builtin_keccak256;

// --------- C ABI 对齐（与 evm_host.h 一致）---------
#[repr(C)]
pub struct evm_address { pub bytes: [u8; 20] }

#[repr(C)]
#[derive(Copy, Clone)]
pub struct evm_uint256 { pub bytes: [u8; 32] }

#[repr(C)]
pub struct evm_host_vtable {
    pub sload: Option<extern "C" fn(user_ctx: usize, addr: *const evm_address, key: *const evm_uint256, value_out: *mut evm_uint256)>,
    pub sstore: Option<extern "C" fn(user_ctx: usize, addr: *const evm_address, key: *const evm_uint256, value: *const evm_uint256)>,
    pub log: Option<extern "C" fn(user_ctx: usize, addr: *const evm_address, data: *const u8, data_len: usize,
                                   topic0: *const evm_uint256, topic1: *const evm_uint256,
                                   topic2: *const evm_uint256, topic3: *const evm_uint256, num_topics: usize)>,
    pub call: Option<extern "C" fn(user_ctx: usize, to: *const evm_address, input: *const u8, input_len: usize,
                                    out_ptr: *mut *mut u8, out_len: *mut usize, gas_left: *mut u64,
                                    value: *const evm_uint256, is_static: i32) -> i32>,
    pub get_caller: Option<extern "C" fn(user_ctx: usize, out: *mut evm_address)>,
    pub get_address: Option<extern "C" fn(user_ctx: usize, out: *mut evm_address)>,
    pub get_value: Option<extern "C" fn(user_ctx: usize, out: *mut evm_uint256)>,
    pub get_gas_left: Option<extern "C" fn(user_ctx: usize) -> u64>,
    pub get_block_info: Option<extern "C" fn(user_ctx: usize, number: *mut u64, timestamp: *mut u64,
                                              coinbase: *mut evm_address, basefee: *mut evm_uint256)>,
}

// --------- 辅助转换 ----------
fn h160_from_c(a: &evm_address) -> H160 { H160::from_slice(&a.bytes) }
fn h160_to_c(a: &H160) -> evm_address { let mut out=[0u8;20]; out.copy_from_slice(a.as_slice()); evm_address{ bytes: out } }
fn u256_from_c(x: &evm_uint256) -> U256 { U256::from_be_bytes(x.bytes) }
fn u256_to_c(x: &U256) -> evm_uint256 { evm_uint256 { bytes: x.to_be_bytes() } }
fn h256_from_c(x: &evm_uint256) -> H256 { H256::from_slice(&x.bytes) }
fn h256_to_c(x: &H256) -> evm_uint256 { let mut out=[0u8;32]; out.copy_from_slice(x.as_slice()); evm_uint256 { bytes: out } }

// --------- HostBridge：把 revm 的 Host 行为桥接到 Go 的 vtable ---------
pub struct HostBridge {
    vtable: *const evm_host_vtable,
    user_ctx: usize,
    env: Env,
    code_bytes: Bytes,
}

impl HostBridge {
    pub fn new(vtable: *const evm_host_vtable, user_ctx: usize, env: Env, code_bytes: Bytes) -> Self {
        Self { vtable, user_ctx, env, code_bytes }
    }
    fn v(&self) -> &evm_host_vtable {
        assert!(!self.vtable.is_null(), "vtable is null");
        unsafe { &*self.vtable }
    }

    fn sload_bridge(&mut self, address: H160, key: U256) -> U256 {
        let cb = self.v().sload.expect("sload not set");
        let c_addr = h160_to_c(&address);
        let c_key = u256_to_c(&key);
        let mut out = evm_uint256 { bytes: [0u8; 32] };
        cb(self.user_ctx, &c_addr as *const _, &c_key as *const _, &mut out as *mut _);
        u256_from_c(&out)
    }
    fn sstore_bridge(&mut self, address: H160, key: U256, value: U256) {
        let cb = self.v().sstore.expect("sstore not set");
        let c_addr = h160_to_c(&address);
        let c_key = u256_to_c(&key);
        let c_val = u256_to_c(&value);
        cb(self.user_ctx, &c_addr as *const _, &c_key as *const _, &c_val as *const _);
    }
    fn log_bridge(&mut self, address: H160, topics: &[H256], data: &[u8]) {
        let cb = self.v().log.expect("log not set");
        let c_addr = h160_to_c(&address);
        let mut c_topics: [evm_uint256; 4] = core::array::from_fn(|_| evm_uint256{bytes:[0;32]});
        let n = topics.len().min(4);
        for i in 0..n { c_topics[i] = h256_to_c(&topics[i]); }
        let t0 = if n>0 { &c_topics[0] as *const _ } else { std::ptr::null() };
        let t1 = if n>1 { &c_topics[1] as *const _ } else { std::ptr::null() };
        let t2 = if n>2 { &c_topics[2] as *const _ } else { std::ptr::null() };
        let t3 = if n>3 { &c_topics[3] as *const _ } else { std::ptr::null() };
        let data_ptr = if data.is_empty() { std::ptr::null() } else { data.as_ptr() };
        cb(self.user_ctx, &c_addr as *const _, data_ptr, data.len(), t0, t1, t2, t3, n);
    }
}

impl RevmHost for HostBridge {
    fn env(&self) -> &Env { &self.env }
    fn env_mut(&mut self) -> &mut Env { &mut self.env }

    fn load_account_delegated(&mut self, _address: H160) -> Option<AccountLoad> {
        Some(core::default::Default::default())
    }
    fn block_hash(&mut self, _number: u64) -> Option<H256> { None }

    fn sload(&mut self, address: H160, key: U256) -> Option<StateLoad<U256>> {
        let v = self.sload_bridge(address, key);
        Some(StateLoad::new(v, false))
    }
    fn sstore(&mut self, address: H160, key: U256, value: U256) -> Option<StateLoad<SStoreResult>> {
        self.sstore_bridge(address, key, value);
        Some(StateLoad::new(SStoreResult::default(), false))
    }

    fn tload(&mut self, _address: H160, _key: U256) -> U256 { U256::ZERO }
    fn tstore(&mut self, _address: H160, _key: U256, _value: U256) {}

    fn log(&mut self, l: Log) {
        let topics = l.topics();
        let data_slice = l.data.data.as_ref();
        self.log_bridge(l.address, topics, data_slice);
    }

    fn code(&mut self, _address: H160) -> Option<StateLoad<Bytes>> {
        Some(StateLoad::new(self.code_bytes.clone(), false))
    }
    fn code_hash(&mut self, _address: H160) -> Option<StateLoad<H256>> {
        Some(StateLoad::new(H256::ZERO, false))
    }
    fn balance(&mut self, _address: H160) -> Option<StateLoad<U256>> {
        Some(StateLoad::new(U256::ZERO, false))
    }
    fn selfdestruct(&mut self, _address: H160, _target: H160) -> Option<StateLoad<SelfDestructResult>> {
        Some(StateLoad::new(SelfDestructResult::default(), false))
    }
}

fn fill_env_from_vtable(host: *const evm_host_vtable, user_ctx: usize, calldata: &[u8]) -> Env {
    let v = unsafe { &*host };
    let mut c_caller = evm_address { bytes: [0;20] };
    let mut c_address = evm_address { bytes: [0;20] };
    let mut c_value   = evm_uint256 { bytes: [0;32] };
    if let Some(f) = v.get_caller { f(user_ctx, &mut c_caller as *mut _) }
    if let Some(f) = v.get_address { f(user_ctx, &mut c_address as *mut _) }
    if let Some(f) = v.get_value { f(user_ctx, &mut c_value as *mut _) }

    let caller  = h160_from_c(&c_caller);
    let address = h160_from_c(&c_address);
    let value   = u256_from_c(&c_value);

    let mut exec_env = Env::default();
    exec_env.tx.caller = caller;
    exec_env.tx.transact_to = revm_primitives::TransactTo::Call(address);
    exec_env.tx.data = Bytes::copy_from_slice(calldata);
    exec_env.tx.value = value;
    exec_env.tx.gas_limit = 10_000_000;
    exec_env
}

#[no_mangle]
pub extern "C" fn evm_run_with_host(
    bytecode_ptr: *const u8,
    bytecode_len: usize,
    calldata_ptr: *const u8,
    calldata_len: usize,
    host: *const evm_host_vtable,
    user_ctx: usize,
    out_ptr: *mut *mut u8,
    out_len: *mut usize,
    status_code: *mut i32,
    gas_used: *mut u64,
) -> c_int {
    let bytecode = unsafe { slice::from_raw_parts(bytecode_ptr, bytecode_len) };
    let calldata = unsafe { slice::from_raw_parts(calldata_ptr, calldata_len) };

    let exec_env = fill_env_from_vtable(host, user_ctx, calldata);

    let analysed = analysis::to_analysed(Bytecode::new_raw(Bytes::copy_from_slice(bytecode)));
    let contract_obj = Contract::new_env(&exec_env, analysed, None);

    let mut bridge = HostBridge::new(host, user_ctx, exec_env, Bytes::copy_from_slice(bytecode));
    let mut interpreter = Interpreter::new(contract_obj, 10_000_000, false);

    let f = EvmCompilerFn::new(custom);
    let _ = unsafe { f.call_with_interpreter(&mut interpreter, &mut bridge) };

    let ret_slice: &[u8] = &interpreter.return_data_buffer;
    unsafe {
        if !status_code.is_null() { *status_code = 0; }
        if !gas_used.is_null() { *gas_used = 10_000_000 - interpreter.gas.remaining(); }
        let buf = if ret_slice.is_empty() {
            std::ptr::null_mut()
        } else {
            let p = libc::malloc(ret_slice.len()) as *mut u8;
            if !p.is_null() { copy_nonoverlapping(ret_slice.as_ptr(), p, ret_slice.len()); }
            p
        };
        *out_ptr = buf;
        *out_len = ret_slice.len();
    }
    0
}

#[no_mangle]
pub extern "C" fn evm_run(
    bytecode_ptr: *const c_uchar,
    bytecode_len: usize,
    calldata_ptr: *const c_uchar,
    calldata_len: usize,
    out_ptr: *mut *mut c_uchar,
    out_len: *mut usize,
) -> c_int {
    let bytecode = unsafe { slice::from_raw_parts(bytecode_ptr, bytecode_len) };
    let calldata = unsafe { slice::from_raw_parts(calldata_ptr, calldata_len) };

    let mut env = Env::default();
    env.tx.data = Bytes::copy_from_slice(calldata);
    env.tx.gas_limit = 10_000_000;

    let analysed = analysis::to_analysed(Bytecode::new_raw(Bytes::copy_from_slice(bytecode)));
    let contract_obj = Contract::new_env(&env, analysed, None);

    struct NoopHost { env: Env }
    impl RevmHost for NoopHost {
        fn env(&self) -> &Env { &self.env }
        fn env_mut(&mut self) -> &mut Env { &mut self.env }
        fn load_account_delegated(&mut self, _a: H160) -> Option<AccountLoad> { Some(core::default::Default::default()) }
        fn block_hash(&mut self, _n: u64) -> Option<H256> { None }
        fn sload(&mut self, _a: H160, _k: U256) -> Option<StateLoad<U256>> { Some(StateLoad::new(U256::ZERO, false)) }
        fn sstore(&mut self, _a: H160, _k: U256, _v: U256) -> Option<StateLoad<SStoreResult>> { Some(StateLoad::new(SStoreResult::default(), false)) }
        fn tload(&mut self, _a: H160, _k: U256) -> U256 { U256::ZERO }
        fn tstore(&mut self, _a: H160, _k: U256, _v: U256) {}
        fn log(&mut self, _l: Log) {}
        fn code(&mut self, _a: H160) -> Option<StateLoad<Bytes>> { None }
        fn code_hash(&mut self, _a: H160) -> Option<StateLoad<H256>> { None }
        fn balance(&mut self, _a: H160) -> Option<StateLoad<U256>> { None }
        fn selfdestruct(&mut self, _a: H160, _t: H160) -> Option<StateLoad<SelfDestructResult>> { Some(StateLoad::new(SelfDestructResult::default(), false)) }
    }

    let mut host = NoopHost { env };
    let mut interpreter = Interpreter::new(contract_obj, 10_000_000, false);
    let f = EvmCompilerFn::new(custom);
    let _ = unsafe { f.call_with_interpreter(&mut interpreter, &mut host) };

    let ret_slice: &[u8] = &interpreter.return_data_buffer;
    unsafe {
        let buf = if ret_slice.is_empty() {
            std::ptr::null_mut()
        } else {
            let p = libc::malloc(ret_slice.len()) as *mut c_uchar;
            if !p.is_null() { copy_nonoverlapping(ret_slice.as_ptr(), p, ret_slice.len()); }
            p
        };
        *out_ptr = buf;
        *out_len = ret_slice.len();
    }
    0
}

#[no_mangle]
pub extern "C" fn evm_free(ptr: *mut c_void) {
    unsafe { if !ptr.is_null() { libc::free(ptr) } }
}
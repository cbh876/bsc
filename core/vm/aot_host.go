package vm

/*
#cgo CFLAGS: -I${SRCDIR}/../../aot_out/wbnb
#cgo LDFLAGS: -L${SRCDIR}/../../aot_out/wbnb/target/release -L${SRCDIR}/../../aot_out/wbnb/target/release/deps -levmwrap -lrevmc_builtins -ldl -lm -lc++
#include "evm_host.h"
#include <stdlib.h>
#include <string.h>

// Functions implemented in Go (exported to C)
extern void go_host_sload(uintptr_t user_ctx, evm_address* addr, evm_uint256* key, evm_uint256* value_out);
extern void go_host_sstore(uintptr_t user_ctx, evm_address* addr, evm_uint256* key, evm_uint256* value);
extern void go_host_log(uintptr_t user_ctx, evm_address* addr, uint8_t* data, size_t data_len,
                        evm_uint256* topic0, evm_uint256* topic1, evm_uint256* topic2, evm_uint256* topic3, size_t num_topics);
extern int  go_host_call(uintptr_t user_ctx, evm_address* to, uint8_t* input, size_t input_len,
                        uint8_t** out_ptr, size_t* out_len, uint64_t* gas_left, evm_uint256* value, int is_static);
extern void go_host_get_caller(uintptr_t user_ctx, evm_address* out);
extern void go_host_get_address(uintptr_t user_ctx, evm_address* out);
extern void go_host_get_value(uintptr_t user_ctx, evm_uint256* out);
extern uint64_t go_host_get_gas_left(uintptr_t user_ctx);
extern void go_host_get_block_info(uintptr_t user_ctx, uint64_t* number, uint64_t* timestamp, evm_address* coinbase, evm_uint256* basefee);

static inline void init_evm_vtable(evm_host_vtable* vt) {
    vt->sload = go_host_sload;
    vt->sstore = go_host_sstore;
    vt->log = go_host_log;
    vt->call = go_host_call;
    vt->get_caller = go_host_get_caller;
    vt->get_address = go_host_get_address;
    vt->get_value = go_host_get_value;
    vt->get_gas_left = go_host_get_gas_left;
    vt->get_block_info = go_host_get_block_info;
}

// Forward declarations from the native library
int evm_run_with_host(const uint8_t* bytecode, size_t bytecode_len,
                      const uint8_t* calldata, size_t calldata_len,
                      const evm_host_vtable* host, uintptr_t user_ctx,
                      uint8_t** out_ptr, size_t* out_len, int* status_code, uint64_t* gas_used);
void evm_free(void* p);
*/
import "C"

import (
	"runtime/cgo"
	"unsafe"

	"github.com/ethereum/go-ethereum/common"
	coretypes "github.com/ethereum/go-ethereum/core/types"
	"github.com/holiman/uint256"
)

// AOTHostContext carries execution context for host callbacks
type AOTHostContext struct {
	interpreter *EVMInterpreter
	contract    *Contract
	inExec      bool
	sstoreCount int
}

// runWbnbAOT runs the precompiled WBNB bytecode via the native engine with host callbacks
func runWbnbAOT(in *EVMInterpreter, contract *Contract, input []byte, bytecode []byte) ([]byte, error) {
	var vtable C.evm_host_vtable
	C.init_evm_vtable(&vtable)

	// Create a handle to pass opaque user context into C
	ctx := &AOTHostContext{interpreter: in, contract: contract}
	handle := cgo.NewHandle(ctx)
	defer handle.Delete()

	var outPtr *C.uchar
	var outLen C.size_t
	var status C.int
	var gasUsed C.uint64_t

	var bcPtr *C.uint8_t
	if len(bytecode) > 0 {
		bcPtr = (*C.uint8_t)(unsafe.Pointer(&bytecode[0]))
	}
	var cdPtr *C.uint8_t
	if len(input) > 0 {
		cdPtr = (*C.uint8_t)(unsafe.Pointer(&input[0]))
	}

	// Mark execution window and reset counters
	ctx.sstoreCount = 0
	ctx.inExec = true
	rc := C.evm_run_with_host(bcPtr, C.size_t(len(bytecode)),
		cdPtr, C.size_t(len(input)),
		&vtable, (C.uintptr_t)(handle),
		(**C.uint8_t)(unsafe.Pointer(&outPtr)), (*C.size_t)(unsafe.Pointer(&outLen)),
		(*C.int)(unsafe.Pointer(&status)), (*C.uint64_t)(unsafe.Pointer(&gasUsed)))
	ctx.inExec = false
	if rc != 0 {
		return nil, ErrExecutionReverted
	}
	if outPtr != nil {
		defer C.evm_free(unsafe.Pointer(outPtr))
	}
	out := C.GoBytes(unsafe.Pointer(outPtr), C.int(outLen))
	return out, nil
}

//export go_host_sload
func go_host_sload(user_ctx C.uintptr_t, addr *C.evm_address, key *C.evm_uint256, value_out *C.evm_uint256) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	a := cAddrToGo(addr)
	k := cU256ToHash(key)
	v := ctx.interpreter.evm.StateDB.GetState(a, k)
	hashToCU256(&v, value_out)
}

//export go_host_sstore
func go_host_sstore(user_ctx C.uintptr_t, addr *C.evm_address, key *C.evm_uint256, value *C.evm_uint256) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	a := cAddrToGo(addr)
	k := cU256ToHash(key)
	v := cU256ToHash(value)
	ctx.interpreter.evm.StateDB.SetState(a, k, v)
	if ctx.inExec {
		ctx.sstoreCount++
	}
}

//export go_host_log
func go_host_log(user_ctx C.uintptr_t, addr *C.evm_address, data *C.uint8_t, data_len C.size_t,
	topic0 *C.evm_uint256, topic1 *C.evm_uint256, topic2 *C.evm_uint256, topic3 *C.evm_uint256, num_topics C.size_t) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	a := cAddrToGo(addr)
	var payload []byte
	if data != nil && data_len > 0 {
		payload = C.GoBytes(unsafe.Pointer(data), C.int(data_len))
	}
	topics := make([]common.Hash, 0, int(num_topics))
	if num_topics > 0 {
		t0 := cU256ToHash(topic0)
		topics = append(topics, t0)
	}
	if num_topics > 1 {
		t1 := cU256ToHash(topic1)
		topics = append(topics, t1)
	}
	if num_topics > 2 {
		t2 := cU256ToHash(topic2)
		topics = append(topics, t2)
	}
	if num_topics > 3 {
		t3 := cU256ToHash(topic3)
		topics = append(topics, t3)
	}
	log := &coretypes.Log{
		Address: a,
		Topics:  topics,
		Data:    payload,
	}
	ctx.interpreter.evm.StateDB.AddLog(log)
}

//export go_host_call
func go_host_call(user_ctx C.uintptr_t, to *C.evm_address, input *C.uint8_t, input_len C.size_t,
	out_ptr **C.uint8_t, out_len *C.size_t, gas_left *C.uint64_t, value *C.evm_uint256, is_static C.int) C.int {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)

	var in []byte
	if input != nil && input_len > 0 {
		in = C.GoBytes(unsafe.Pointer(input), C.int(input_len))
	}
	addr := cAddrToGo(to)

	var ret []byte
	var leftGas uint64
	var err error

	if is_static != 0 {
		ret, leftGas, err = ctx.interpreter.evm.StaticCall(ctx.contract.Address(), addr, in, uint64(*gas_left))
	} else {
		valHash := cU256ToHash(value)
		val := new(uint256.Int).SetBytes(valHash[:])
		ret, leftGas, err = ctx.interpreter.evm.Call(ctx.contract.Address(), addr, in, uint64(*gas_left), val)
	}

	if err != nil {
		return 1
	}
	if len(ret) > 0 {
		*out_len = C.size_t(len(ret))
		*out_ptr = (*C.uint8_t)(C.malloc(*out_len))
		if *out_ptr != nil {
			C.memcpy(unsafe.Pointer(*out_ptr), unsafe.Pointer(&ret[0]), *out_len)
		}
	} else {
		*out_ptr = nil
		*out_len = 0
	}
	*gas_left = C.uint64_t(leftGas)
	return 0
}

//export go_host_get_caller
func go_host_get_caller(user_ctx C.uintptr_t, out *C.evm_address) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	a := ctx.contract.Caller()
	goAddrToC(&a, out)
}

//export go_host_get_address
func go_host_get_address(user_ctx C.uintptr_t, out *C.evm_address) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	a := ctx.contract.Address()
	goAddrToC(&a, out)
}

//export go_host_get_value
func go_host_get_value(user_ctx C.uintptr_t, out *C.evm_uint256) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	v := ctx.contract.Value().Bytes32()
	// v is [32]byte big endian
	copy((*[32]byte)(unsafe.Pointer(&out.bytes[0]))[:], v[:])
}

//export go_host_get_gas_left
func go_host_get_gas_left(user_ctx C.uintptr_t) C.uint64_t {
	// For now we cannot query precisely here; return a large allowance
	return C.uint64_t(10_000_000)
}

//export go_host_get_block_info
func go_host_get_block_info(user_ctx C.uintptr_t, number *C.uint64_t, timestamp *C.uint64_t, coinbase *C.evm_address, basefee *C.evm_uint256) {
	handle := cgo.Handle(user_ctx)
	ctx := handle.Value().(*AOTHostContext)
	if number != nil {
		*number = C.uint64_t(ctx.interpreter.evm.Context.BlockNumber.Uint64())
	}
	if timestamp != nil {
		*timestamp = C.uint64_t(ctx.interpreter.evm.Context.Time)
	}
	if coinbase != nil {
		cb := ctx.interpreter.evm.Context.Coinbase
		goAddrToC(&cb, coinbase)
	}
	if basefee != nil {
		bf := ctx.interpreter.evm.Context.BaseFee
		if bf != nil {
			var be [32]byte
			b := bf.Bytes()
			if len(b) > 32 {
				b = b[len(b)-32:]
			}
			copy(be[32-len(b):], b)
			copy((*[32]byte)(unsafe.Pointer(&basefee.bytes[0]))[:], be[:])
		}
	}
}

// Helpers for type conversion
func cAddrToGo(a *C.evm_address) common.Address {
	var out common.Address
	copy(out[:], C.GoBytes(unsafe.Pointer(&a.bytes[0]), 20))
	return out
}

func goAddrToC(a *common.Address, out *C.evm_address) {
	b := (*[20]byte)(unsafe.Pointer(&out.bytes[0]))
	copy(b[:], a[:])
}

func cU256ToHash(u *C.evm_uint256) common.Hash {
	var h common.Hash
	copy(h[:], C.GoBytes(unsafe.Pointer(&u.bytes[0]), 32))
	return h
}

func hashToCU256(h *common.Hash, u *C.evm_uint256) {
	b := (*[32]byte)(unsafe.Pointer(&u.bytes[0]))
	copy(b[:], h[:])
}

#ifndef EVM_HOST_H
#define EVM_HOST_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct evm_address { uint8_t bytes[20]; } evm_address;
typedef struct evm_uint256 { uint8_t bytes[32]; } evm_uint256;

typedef struct {
    const uint8_t* data;
    size_t len;
} evm_bytes;

typedef struct {
    int status_code;               // 0 = success, non-zero = error
    uint8_t* return_data;          // owned by callee; freed via host-provided free or library's free
    size_t return_data_len;
    uint64_t gas_used;
} evm_result;

// Host callbacks vtable. The callee will invoke these to interact with the host node (Go EVM).
typedef struct evm_host_vtable {
    // storage
    void (*sload)(uintptr_t user_ctx, evm_address* addr, evm_uint256* key, evm_uint256* value_out);
    void (*sstore)(uintptr_t user_ctx, evm_address* addr, evm_uint256* key, evm_uint256* value);

    // logs
    void (*log)(uintptr_t user_ctx, evm_address* addr, uint8_t* data, size_t data_len,
                evm_uint256* topic0, evm_uint256* topic1, evm_uint256* topic2, evm_uint256* topic3, size_t num_topics);

    // calls
    int (*call)(uintptr_t user_ctx, evm_address* to, uint8_t* input, size_t input_len,
                uint8_t** out_ptr, size_t* out_len, uint64_t* gas_left, evm_uint256* value, int is_static);

    // environment queries
    void (*get_caller)(uintptr_t user_ctx, evm_address* out);
    void (*get_address)(uintptr_t user_ctx, evm_address* out);
    void (*get_value)(uintptr_t user_ctx, evm_uint256* out);
    uint64_t (*get_gas_left)(uintptr_t user_ctx);
    void (*get_block_info)(uintptr_t user_ctx, uint64_t* number, uint64_t* timestamp, evm_address* coinbase, evm_uint256* basefee);
} evm_host_vtable;

// Extended run function which accepts a host vtable and opaque user context pointer.
int evm_run_with_host(const uint8_t* bytecode, size_t bytecode_len,
                      const uint8_t* calldata, size_t calldata_len,
                      const evm_host_vtable* host, uintptr_t user_ctx,
                      uint8_t** out_ptr, size_t* out_len, int* status_code, uint64_t* gas_used);

#ifdef __cplusplus
}
#endif

#endif // EVM_HOST_H


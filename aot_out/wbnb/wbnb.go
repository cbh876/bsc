package wbnb

/*
#cgo LDFLAGS: -L${SRCDIR}/target/release -levmwrap -ldl -lm -lc++
#include <stdint.h>
#include <stdlib.h>

int evm_run(const unsigned char* bytecode, size_t bytecode_len,
            const unsigned char* calldata, size_t calldata_len,
            unsigned char** out_ptr, size_t* out_len);
void evm_free(void* p);
*/
import "C"

import (
	_ "embed"
	"unsafe"
)

//go:embed wbnb.bin
var wbnbBin []byte

// Bytecode returns the embedded WBNB bytecode
func Bytecode() []byte {
	return wbnbBin
}

func Wbnb(calldata []byte) []byte {
	bytecode := wbnbBin

	var bytecodePtr *C.uchar
	if len(bytecode) > 0 {
		bytecodePtr = (*C.uchar)(unsafe.Pointer(&bytecode[0]))
	}
	var calldataPtr *C.uchar
	if len(calldata) > 0 {
		calldataPtr = (*C.uchar)(unsafe.Pointer(&calldata[0]))
	}

	var outPtr *C.uchar
	var outLen C.size_t
	rc := C.evm_run(bytecodePtr, C.size_t(len(bytecode)),
		calldataPtr, C.size_t(len(calldata)),
		(**C.uchar)(unsafe.Pointer(&outPtr)), (*C.size_t)(unsafe.Pointer(&outLen)))
	if rc != 0 {
		panic("evm_run failed")
	}
	defer C.evm_free(unsafe.Pointer(outPtr))

	out := C.GoBytes(unsafe.Pointer(outPtr), C.int(outLen))
	return out
}

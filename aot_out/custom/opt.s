	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0
	.section	__DATA,__const
	.p2align	3, 0x0                          ; -- Begin function custom
lCPI0_0:
	.quad	Ltmp0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_custom
	.p2align	2
_custom:                                ; @custom
; %bb.0:                                ; %entry
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #560
	mov	x19, sp
	mov	x17, x5
	mov	x26, x2
	mov	x21, x1
	mov	x28, x0
	ldr	x8, [x5, #32]
	stp	x5, x1, [x19, #136]             ; 16-byte Folded Spill
	str	x0, [x19, #160]                 ; 8-byte Folded Spill
	str	x4, [x19, #128]                 ; 8-byte Folded Spill
	str	x2, [x19, #56]                  ; 8-byte Folded Spill
	cbz	x8, LBB0_12
; %bb.1:                                ; %resume
	ldr	x12, [x26]
Ltmp0:                                  ; Block address taken
; %bb.2:                                ; %OP1318.SWAP4
	ldur	x9, [x28, #8]
	subs	x27, x9, #30
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.3:                                ; %OP1318.SWAP4.contd
	subs	x20, x12, #5
	b.lo	LBB0_201
; %bb.4:                                ; %OP1318.SWAP4.contd4716
	add	x8, x21, x12, lsl #5
	ldp	x11, x12, [x8, #-16]
	ldp	x13, x14, [x8, #-32]
	mov	x1, x8
	ldr	q0, [x1, #-160]!
	ldp	x15, x10, [x8, #-144]
	stp	x15, x10, [x8, #-16]
	stur	q0, [x8, #-32]
	add	x10, x21, x20, lsl #5
	orr	x12, x14, x12
	orr	x11, x13, x11
	stp	xzr, xzr, [x10, #16]
	orr	x11, x11, x12
	cmp	x11, #0
	cset	w12, ne
	stp	x12, xzr, [x10]
	cbz	x11, LBB0_33
; %bb.5:
	mov	x12, x20
	subs	x8, x27, #1199
	stur	x8, [x28, #8]
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	str	x20, [x19, #152]                ; 8-byte Folded Spill
	b.lo	LBB0_734
LBB0_6:                                 ; %OP1330.JUMPDEST.contd
	sub	x8, x12, #1018
	subs	x11, x12, #2
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1016
	b.lo	LBB0_691
; %bb.7:                                ; %OP1331.CALLER
	str	x11, [x19, #120]                ; 8-byte Folded Spill
	ldur	x8, [x10, #148]
	ldr	w9, [x10, #164]
	ldur	x10, [x10, #156]
	rev	x10, x10
	rev	x9, x9
	extr	x9, x10, x9, #32
	rev	x8, x8
	extr	x10, x8, x10, #32
	lsr	x8, x8, #32
	add	x1, x21, x12, lsl #5
	stp	x8, xzr, [x1, #16]
	stp	x9, x10, [x1]
	mov	x8, #42715                      ; =0xa6db
	movk	x8, #5616, lsl #16
	movk	x8, #21292, lsl #32
	movk	x8, #32719, lsl #48
	mov	x9, #42781                      ; =0xa71d
	movk	x9, #14526, lsl #16
	movk	x9, #53472, lsl #32
	movk	x9, #3030, lsl #48
	stp	x9, x8, [x1, #48]
	mov	x8, #46015                      ; =0xb3bf
	movk	x8, #55692, lsl #16
	movk	x8, #2247, lsl #32
	movk	x8, #12504, lsl #48
	mov	x9, #7013                       ; =0x1b65
	movk	x9, #62728, lsl #16
	movk	x9, #43355, lsl #32
	movk	x9, #29288, lsl #48
	stp	x9, x8, [x1, #32]
	ldp	x15, x24, [x1, #-32]
	ldp	x25, x26, [x1, #-16]
	stp	x25, x26, [x1, #80]
	stp	x15, x24, [x1, #64]
	add	x14, x12, #4
	stp	xzr, xzr, [x1, #112]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x1, #96]
	mov	x13, x21
	ldr	x21, [x17, #40]
	ldr	x8, [x21, #16]
	ldr	x20, [x21, #48]
	sub	x8, x8, x20
	mov	x27, x21
	cmp	x8, #95
	b.ls	LBB0_76
LBB0_8:                                 ; %OP1337.MLOAD.contd
	ldr	x8, [x21, #8]
	add	x8, x8, x20
	ldp	x10, x9, [x8, #64]
	ldp	x8, x11, [x8, #80]
	rev	x8, x8
	rev	x21, x11
	rev	x10, x10
	rev	x9, x9
	stp	x9, x10, [x1, #112]
	stp	x21, x8, [x1, #96]
	add	x20, x12, #5
	add	x22, x13, x14, lsl #5
	stp	x9, x10, [x22, #16]
	stp	x21, x8, [x22]
	add	x28, x13, x20, lsl #5
	stp	x25, x26, [x28, #16]
	stp	x15, x24, [x28]
	stp	x9, x10, [x1, #208]
	stp	x21, x8, [x1, #192]
	ldr	x11, [x27, #16]
	ldr	x23, [x27, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x21, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x21, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x8, x8, xzr, eq
	sub	x9, x11, x23
	cmp	x8, x9
	b.hi	LBB0_80
LBB0_9:                                 ; %OP1342.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x23
	add	x8, x8, x21
	rev	x9, x26
	rev	x10, x25
	rev	x11, x24
	rev	x12, x15
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x28, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x28]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldr	q0, [x1, #64]
	ldp	x13, x12, [x1, #80]
	stp	x11, x10, [x1, #64]
	stp	x9, x8, [x1, #80]
	stp	x13, x12, [x22, #16]
	str	q0, [x22]
	stp	xzr, xzr, [x1, #112]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x1, #96]
	ldr	x20, [x17, #40]
	ldr	x12, [x20, #16]
	ldr	x21, [x20, #48]
	sub	x12, x12, x21
	cmp	x12, #95
	b.ls	LBB0_82
LBB0_10:                                ; %OP1348.MLOAD.contd
	ldr	x12, [x20, #8]
	add	x12, x12, x21
	ldp	x14, x13, [x12, #80]
	ldp	x12, x15, [x12, #64]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x9, x8, [x22, #16]
	stp	x11, x10, [x22]
	subs	x11, x11, x13
	sbcs	x10, x10, x14
	sbcs	x9, x9, x15
	sbc	x8, x8, x12
	stp	x11, x10, [x1, #64]
	stp	x9, x8, [x1, #80]
	stp	x15, x12, [x1, #112]
	stp	x13, x14, [x1, #96]
	mov	x0, x17
	mov	w2, #2                          ; =0x2
	bl	___revmc_builtin_log
	tst	w0, #0xff
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_187
; %bb.11:                               ; %OP1354.POP
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x12, [x19, #120]                ; 8-byte Folded Reload
	b	LBB0_32
LBB0_12:                                ; %no_resume
	ldur	x8, [x28, #8]
	subs	x8, x8, #30
	stur	x8, [x28, #8]
	b.lo	LBB0_92
; %bb.13:                               ; %OP0.PUSH1.contd1
	movi.2d	v0, #0000000000000000
	stur	q0, [x21, #8]
	mov	w8, #96                         ; =0x60
	str	x8, [x21]
	str	xzr, [x21, #56]
	stur	q0, [x21, #40]
	mov	w8, #64                         ; =0x40
	stp	xzr, x8, [x21, #24]
	ldr	x20, [x17, #40]
	ldr	x8, [x20, #16]
	mov	x22, x21
	ldr	x21, [x20, #48]
	sub	x8, x8, x21
	cmp	x8, #95
	b.ls	LBB0_93
LBB0_14:                                ; %OP3.PUSH1
	ldr	x8, [x20, #8]
	add	x8, x8, x21
	mov	x9, #6917529027641081856        ; =0x6000000000000000
	stp	xzr, x9, [x8, #80]
	stp	xzr, xzr, [x8, #64]
	ldr	x5, [x4, #80]
	stp	x5, xzr, [x22, #32]
	stp	xzr, xzr, [x22, #48]
	stp	xzr, xzr, [x22, #16]
	ldur	x27, [x28, #8]
	cmp	x5, #4
	cset	w8, lo
	stp	x8, xzr, [x22]
	mov	x21, x22
	b.hs	LBB0_36
; %bb.15:
	mov	x12, #0                         ; =0x0
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	b.lo	LBB0_734
LBB0_16:                                ; %OP70.JUMPDEST.contd
	mov	w9, #183                        ; =0xb7
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_17:
	mov	x8, #0                          ; =0x0
LBB0_18:                                ; %OP687.JUMPDEST.sink.split
	add	x10, x21, x12, lsl #5
	stp	x9, x8, [x10]
	add	x12, x12, #1
	stp	x8, x8, [x10, #16]
	subs	x8, x27, #108
	stur	x8, [x28, #8]
	b.lo	LBB0_552
LBB0_19:                                ; %OP687.JUMPDEST.contd
	cmp	x12, #1019
	b.hi	LBB0_598
; %bb.20:                               ; %OP688.CALLVALUE
	add	x13, x12, #1
	ldp	x8, x9, [x4, #96]
	ldp	x10, x11, [x4, #112]
	add	x25, x21, x12, lsl #5
	stp	x11, x10, [x19, #88]            ; 16-byte Folded Spill
	stp	x10, x11, [x25, #16]
	stp	x9, x8, [x19, #104]             ; 16-byte Folded Spill
	stp	x8, x9, [x25]
	add	x9, x12, #2
	stp	x9, x13, [x19, #40]             ; 16-byte Folded Spill
	add	x27, x21, x13, lsl #5
	str	xzr, [x27, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x27, #8]
	mov	w8, #3                          ; =0x3
	str	x8, [x27]
	add	x28, x12, #3
	add	x20, x21, x9, lsl #5
	stp	q0, q0, [x20]
	add	x11, x12, #4
	ldur	x8, [x4, #148]
	ldr	w9, [x4, #164]
	ldur	x10, [x4, #156]
	rev	x10, x10
	rev	x9, x9
	extr	x13, x10, x9, #32
	rev	x8, x8
	extr	x10, x8, x10, #32
	lsr	x9, x8, #32
	add	x24, x21, x28, lsl #5
	add	x8, x12, #5
	str	x8, [x19, #120]                 ; 8-byte Folded Spill
	str	x11, [x19, #32]                 ; 8-byte Folded Spill
	add	x26, x21, x11, lsl #5
	stp	x9, xzr, [x24, #16]
	stp	x13, x10, [x24]
	stp	q0, q0, [x26]
	ldr	x21, [x17, #40]
	ldr	x8, [x21, #16]
	ldr	x22, [x21, #48]
	sub	x8, x8, x22
	cmp	x8, #31
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	stp	x10, x13, [x19, #72]            ; 16-byte Folded Spill
	b.ls	LBB0_74
LBB0_21:                                ; %OP698.PUSH1
	ldr	x8, [x21, #8]
	add	x8, x8, x22
	str	x9, [x19, #64]                  ; 8-byte Folded Spill
	rev	x9, x9
	rev	x10, x10
	rev	x11, x13
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x28, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x13, x12, [x27]
	ldp	x14, x22, [x27, #16]
	stp	x28, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x14, x22, [x20, #16]
	stp	x13, x12, [x20]
	stp	x28, x10, [x24]
	stp	x9, x8, [x24, #16]
	ldr	x23, [x17, #40]
	ldr	x11, [x23, #16]
	ldr	x21, [x23, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x28, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x28, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x21
	cmp	x1, x8
	b.hi	LBB0_78
LBB0_22:                                ; %OP703.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x21
	add	x8, x8, x28
	rev	x9, x22
	rev	x10, x14
	rev	x11, x12
	rev	x12, x13
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x27, #16]
	ldp	x11, x10, [x27]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x17
	mov	x1, x27
	mov	x21, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_79
; %bb.23:                               ; %OP707.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	q0, [x25]
	ldp	x8, x9, [x25, #16]
	stp	x8, x9, [x24, #16]
	str	q0, [x24]
	ldr	q0, [x27]
	ldp	x8, x9, [x27, #16]
	stp	x8, x9, [x26, #16]
	str	q0, [x26]
	mov	x0, x21
	mov	x1, x26
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_369
; %bb.24:                               ; %OP711.ADD
	ldp	x9, x8, [x26, #16]
	ldp	x11, x10, [x26]
	ldp	x13, x12, [x24, #16]
	ldp	x15, x14, [x24]
	adds	x11, x15, x11
	adcs	x10, x14, x10
	adcs	x9, x13, x9
	adc	x8, x12, x8
	ldr	q0, [x25]
	ldp	x13, x12, [x25, #16]
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x13, x12, [x24, #16]
	str	q0, [x24]
	ldr	q0, [x27]
	ldp	x12, x13, [x27, #16]
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x12, x13, [x20, #16]
	str	q0, [x20]
	mov	x0, x21
	mov	x1, x27
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sstore
	tst	w0, #0xff
	b.ne	LBB0_85
; %bb.25:                               ; %OP718.POP
	ldur	x8, [x28, #8]
	subs	x8, x8, #1197
	stur	x8, [x28, #8]
	ldr	x9, [x19, #152]                 ; 8-byte Folded Reload
	ldp	x13, x12, [x19, #104]           ; 16-byte Folded Reload
	ldp	x15, x14, [x19, #88]            ; 16-byte Folded Reload
	ldr	x17, [x19, #120]                ; 8-byte Folded Reload
	b.lo	LBB0_84
; %bb.26:                               ; %OP718.POP.contd
	sub	x8, x9, #1018
	cmp	x9, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1017
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	b.lo	LBB0_85
; %bb.27:                               ; %OP718.POP.contd2517
	ldp	x8, x9, [x19, #72]              ; 16-byte Folded Reload
	stp	x9, x8, [x25]
	ldr	x8, [x19, #64]                  ; 8-byte Folded Reload
	stp	x8, xzr, [x25, #16]
	mov	x8, #1205                       ; =0x4b5
	movk	x8, #37437, lsl #16
	movk	x8, #64708, lsl #32
	movk	x8, #57855, lsl #48
	mov	x9, #27866                      ; =0x6cda
	movk	x9, #35836, lsl #16
	movk	x9, #53914, lsl #32
	movk	x9, #23028, lsl #48
	stp	x9, x8, [x27, #16]
	mov	x8, #1873                       ; =0x751
	movk	x8, #15430, lsl #16
	movk	x8, #23309, lsl #32
	movk	x8, #1259, lsl #48
	mov	x9, #4252                       ; =0x109c
	movk	x9, #23753, lsl #16
	movk	x9, #11356, lsl #32
	movk	x9, #49728, lsl #48
	stp	x9, x8, [x27]
	stp	x12, x13, [x20]
	stp	x14, x15, [x20, #16]
	stp	xzr, xzr, [x24, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x24]
	ldr	x22, [x16, #40]
	ldr	x8, [x22, #16]
	ldr	x23, [x22, #48]
	sub	x8, x8, x23
	mov	x21, x22
	cmp	x8, #95
	b.ls	LBB0_86
LBB0_28:                                ; %OP725.MLOAD.contd
	ldr	x8, [x22, #8]
	add	x8, x8, x23
	ldp	x10, x9, [x8, #64]
	ldp	x8, x11, [x8, #80]
	rev	x8, x8
	rev	x23, x11
	rev	x10, x10
	rev	x9, x9
	stp	x9, x10, [x24, #16]
	stp	x23, x8, [x24]
	stp	x9, x10, [x26, #16]
	stp	x23, x8, [x26]
	ldr	x11, [x19, #144]                ; 8-byte Folded Reload
	add	x22, x11, x17, lsl #5
	stp	x14, x15, [x22, #16]
	stp	x12, x13, [x22]
	stp	x9, x10, [x25, #208]
	stp	x23, x8, [x25, #192]
	ldr	x11, [x21, #16]
	ldr	x27, [x21, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x27
	cmp	x1, x8
	b.hi	LBB0_88
LBB0_29:                                ; %OP730.PUSH1
	ldr	x8, [x21, #8]
	add	x8, x8, x27
	add	x8, x8, x23
	rev	x9, x15
	rev	x10, x14
	rev	x11, x13
	rev	x12, x12
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x22, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x22]
	ldp	x9, x8, [x26, #16]
	ldp	x11, x10, [x26]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldr	q0, [x20]
	ldp	x13, x12, [x20, #16]
	stp	x11, x10, [x20]
	stp	x9, x8, [x20, #16]
	stp	x13, x12, [x26, #16]
	str	q0, [x26]
	stp	xzr, xzr, [x24, #16]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x24]
	ldr	x21, [x16, #40]
	ldr	x12, [x21, #16]
	ldr	x22, [x21, #48]
	sub	x12, x12, x22
	cmp	x12, #95
	b.ls	LBB0_90
LBB0_30:                                ; %OP736.MLOAD.contd
	ldr	x12, [x21, #8]
	add	x12, x12, x22
	ldp	x14, x13, [x12, #80]
	ldp	x12, x15, [x12, #64]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x9, x8, [x26, #16]
	stp	x11, x10, [x26]
	subs	x11, x11, x13
	sbcs	x10, x10, x14
	sbcs	x9, x9, x15
	sbc	x8, x8, x12
	stp	x11, x10, [x20]
	stp	x9, x8, [x20, #16]
	stp	x15, x12, [x24, #16]
	stp	x13, x14, [x24]
	mov	x0, x16
	mov	x1, x25
	mov	w2, #2                          ; =0x2
	bl	___revmc_builtin_log
	tst	w0, #0xff
	b.ne	LBB0_187
; %bb.31:                               ; %OP742.JUMP
	ldp	x21, x8, [x19, #144]            ; 16-byte Folded Reload
	sub	x12, x8, #1
LBB0_32:                                ; %dynamic_jump_table.preheader
	add	x8, x21, x12, lsl #5
	ldp	x9, x11, [x8, #16]
	ldp	x8, x10, [x8]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	b	LBB0_616
LBB0_33:                                ; %OP1327.PUSH1
	sub	x9, x9, #36
	stur	x9, [x28, #8]
	cmp	x27, #6
	b.lo	LBB0_95
; %bb.34:                               ; %OP1327.PUSH1.contd
	cmp	x20, #1022
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.hi	LBB0_96
; %bb.35:                               ; %OP1327.PUSH1.contd4738
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x10]
	stp	q0, q0, [x8, #-128]
	mov	w21, #16                        ; =0x10
	mov	x0, x17
	mov	w2, #16                         ; =0x10
	bl	___revmc_builtin_do_return
	tst	w0, #0xff
	csel	w0, w21, w0, eq
	mov	x12, x20
	b	LBB0_101
LBB0_36:                                ; %OP8.PUSH1
	subs	x20, x27, #45
	stur	x20, [x28, #8]
	b.lo	LBB0_97
; %bb.37:                               ; %OP8.PUSH1.contd22
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x21]
	ldr	x4, [x4, #72]
	mov	x0, #0                          ; =0x0
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	l___revmc_ir_builtin_calldataload
	movi.2d	v0, #0000000000000000
	stur	q0, [x21, #8]
	lsr	x8, x3, #32
	str	x8, [x21]
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w9, #56835                      ; =0xde03
	movk	w9, #1789, lsl #16
	stp	xzr, x9, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x9
	cset	w9, eq
	stp	xzr, x9, [x21, #24]
	b.ne	LBB0_41
; %bb.38:                               ; %OP76.JUMPDEST.thread
	sub	x27, x27, #64
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x20, #19
	b.lo	LBB0_734
; %bb.39:
	ldp	x11, x17, [x19, #128]           ; 16-byte Folded Reload
LBB0_40:                                ; %OP77.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldp	x10, x11, [x11, #96]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_111
	b	LBB0_102
LBB0_41:                                ; %OP20.DUP1
	sub	x9, x27, #67
	stur	x9, [x28, #8]
	cmp	x20, #22
	b.lo	LBB0_98
; %bb.42:                               ; %OP20.DUP1.contd63
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w10, #42931                     ; =0xa7b3
	movk	w10, #2398, lsl #16
	stp	xzr, x10, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x10
	cset	w10, eq
	str	x10, [x21, #32]
	ldp	x11, x17, [x19, #128]           ; 16-byte Folded Reload
	b.ne	LBB0_44
; %bb.43:                               ; %OP192.JUMPDEST.thread
	sub	x27, x27, #86
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x9, #19
	b.hs	LBB0_216
	b	LBB0_734
LBB0_44:                                ; %OP25.DUP1
	sub	x10, x27, #89
	stur	x10, [x28, #8]
	cmp	x9, #22
	b.lo	LBB0_98
; %bb.45:                               ; %OP25.DUP1.contd80
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w9, #3549                       ; =0xddd
	movk	w9, #6166, lsl #16
	stp	xzr, x9, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x9
	cset	w9, eq
	str	x9, [x21, #32]
	b.ne	LBB0_47
; %bb.46:                               ; %OP249.JUMPDEST.thread
	sub	x27, x27, #108
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x10, #19
	b.hs	LBB0_260
	b	LBB0_734
LBB0_47:                                ; %OP30.DUP1
	sub	x9, x27, #111
	stur	x9, [x28, #8]
	cmp	x10, #22
	b.lo	LBB0_98
; %bb.48:                               ; %OP30.DUP1.contd97
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w10, #29405                     ; =0x72dd
	movk	w10, #9144, lsl #16
	stp	xzr, x10, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x10
	cset	w10, eq
	str	x10, [x21, #32]
	b.ne	LBB0_50
; %bb.49:                               ; %OP280.JUMPDEST.thread
	sub	x27, x27, #130
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x9, #19
	b.hs	LBB0_274
	b	LBB0_734
LBB0_50:                                ; %OP35.DUP1
	sub	x10, x27, #133
	stur	x10, [x28, #8]
	cmp	x9, #22
	b.lo	LBB0_98
; %bb.51:                               ; %OP35.DUP1.contd114
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w9, #32077                      ; =0x7d4d
	movk	w9, #11802, lsl #16
	stp	xzr, x9, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x9
	cset	w9, eq
	str	x9, [x21, #32]
	b.ne	LBB0_53
; %bb.52:                               ; %OP347.JUMPDEST.thread
	sub	x27, x27, #152
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x10, #19
	b.hs	LBB0_385
	b	LBB0_734
LBB0_53:                                ; %OP40.DUP1
	sub	x9, x27, #155
	stur	x9, [x28, #8]
	cmp	x10, #22
	b.lo	LBB0_98
; %bb.54:                               ; %OP40.DUP1.contd131
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w10, #58727                     ; =0xe567
	movk	w10, #12604, lsl #16
	stp	xzr, x10, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x10
	cset	w10, eq
	str	x10, [x21, #32]
	b.ne	LBB0_56
; %bb.55:                               ; %OP373.JUMPDEST.thread
	sub	x27, x27, #174
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x9, #19
	b.hs	LBB0_430
	b	LBB0_734
LBB0_56:                                ; %OP45.DUP1
	sub	x10, x27, #177
	stur	x10, [x28, #8]
	cmp	x9, #22
	b.lo	LBB0_98
; %bb.57:                               ; %OP45.DUP1.contd148
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w9, #33329                      ; =0x8231
	movk	w9, #28832, lsl #16
	stp	xzr, x9, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x9
	cset	w9, eq
	str	x9, [x21, #32]
	b.ne	LBB0_59
; %bb.58:                               ; %OP408.JUMPDEST.thread
	sub	x27, x27, #196
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x10, #19
	b.hs	LBB0_452
	b	LBB0_734
LBB0_59:                                ; %OP50.DUP1
	sub	x9, x27, #199
	stur	x9, [x28, #8]
	cmp	x10, #22
	b.lo	LBB0_98
; %bb.60:                               ; %OP50.DUP1.contd165
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w10, #39745                     ; =0x9b41
	movk	w10, #38360, lsl #16
	stp	xzr, x10, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x10
	cset	w10, eq
	str	x10, [x21, #32]
	b.ne	LBB0_62
; %bb.61:                               ; %OP453.JUMPDEST.thread
	sub	x27, x27, #218
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x9, #19
	b.hs	LBB0_469
	b	LBB0_734
LBB0_62:                                ; %OP55.DUP1
	sub	x10, x27, #221
	stur	x10, [x28, #8]
	cmp	x9, #22
	b.lo	LBB0_98
; %bb.63:                               ; %OP55.DUP1.contd182
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w9, #40123                      ; =0x9cbb
	movk	w9, #43269, lsl #16
	stp	xzr, x9, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x9
	cset	w9, eq
	str	x9, [x21, #32]
	b.ne	LBB0_65
; %bb.64:                               ; %OP569.JUMPDEST.thread
	sub	x27, x27, #240
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x10, #19
	b.hs	LBB0_579
	b	LBB0_552
LBB0_65:                                ; %OP60.DUP1
	sub	x11, x27, #243
	stur	x11, [x28, #8]
	cmp	x10, #22
	b.lo	LBB0_98
; %bb.66:                               ; %OP60.DUP1.contd199
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w9, #3504                       ; =0xdb0
	movk	w9, #53475, lsl #16
	stp	xzr, x9, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x9
	cset	w9, eq
	str	x9, [x21, #32]
	b.ne	LBB0_69
; %bb.67:                               ; %OP626.JUMPDEST.thread
	sub	x27, x27, #258
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x11, #15
	b.lo	LBB0_552
; %bb.68:
	mov	x8, #0                          ; =0x0
	mov	w9, #978                        ; =0x3d2
	ldr	x4, [x19, #128]                 ; 8-byte Folded Reload
	b	LBB0_18
LBB0_69:                                ; %OP65.DUP1
	sub	x9, x27, #265
	stur	x9, [x28, #8]
	cmp	x11, #22
	b.lo	LBB0_98
; %bb.70:                               ; %OP65.DUP1.contd216
	str	xzr, [x21, #88]
	stur	q0, [x21, #72]
	mov	w10, #60734                     ; =0xed3e
	movk	w10, #56674, lsl #16
	stp	xzr, x10, [x21, #56]
	stur	q0, [x21, #40]
	cmp	x8, x10
	cset	w8, eq
	str	x8, [x21, #32]
	b.ne	LBB0_73
; %bb.71:                               ; %OP632.JUMPDEST.thread
	sub	x27, x27, #284
	stur	x27, [x28, #8]
	mov	w12, #1                         ; =0x1
	cmp	x9, #19
	b.lo	LBB0_552
; %bb.72:
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	b	LBB0_602
LBB0_73:
	mov	w12, #1                         ; =0x1
	mov	x27, x9
	b	LBB0_106
LBB0_74:                                ; %resize.i7596
	mov	x0, x17
	mov	w1, #32                         ; =0x20
	mov	x23, x9
	bl	___revmc_builtin_resize_memory
	ldp	x10, x13, [x19, #72]            ; 16-byte Folded Reload
	mov	x9, x23
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_21
; %bb.75:
	mov	x12, x28
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_76:                                ; %resize.i8280
	mov	x28, x14
	mov	x23, x12
	mov	x22, x1
	mov	x0, x17
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_100
; %bb.77:                               ; %resize.i8280.OP1337.MLOAD.contd_crit_edge
	mov	x1, x22
	ldp	x25, x26, [x22, #80]
	ldp	x15, x24, [x22, #64]
	ldp	x17, x13, [x19, #136]           ; 16-byte Folded Reload
	ldr	x27, [x17, #40]
	mov	x12, x23
	mov	x14, x28
	b	LBB0_8
LBB0_78:                                ; %resize.i7611
	mov	x0, x17
	stp	x13, x12, [x19, #16]            ; 16-byte Folded Spill
	str	x14, [x19, #8]                  ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x13, [x19, #8]             ; 16-byte Folded Reload
	ldr	x12, [x19, #24]                 ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_22
LBB0_79:
	ldr	x12, [x19, #40]                 ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_80:                                ; %resize.i8295
	mov	x0, x17
	stp	x14, x1, [x19, #104]            ; 16-byte Folded Spill
	mov	x1, x8
	str	x15, [x19, #96]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x15, x14, [x19, #96]            ; 16-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	ldr	x1, [x19, #112]                 ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_9
; %bb.81:
	mov	x12, x20
	b	LBB0_691
LBB0_82:                                ; %resize.i8311
	mov	x24, x14
	mov	x23, x1
	mov	x0, x17
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_202
; %bb.83:                               ; %resize.i8311.OP1348.MLOAD.contd_crit_edge
	mov	x1, x23
	ldp	x9, x8, [x23, #80]
	ldp	x11, x10, [x23, #64]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b	LBB0_10
LBB0_84:
	mov	w0, #80                         ; =0x50
LBB0_85:
	ldp	x12, x26, [x19, #48]            ; 16-byte Folded Reload
	b	LBB0_101
LBB0_86:                                ; %resize.i7627
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_99
; %bb.87:                               ; %resize.i7627.OP725.MLOAD.contd_crit_edge
	ldp	x14, x15, [x20, #16]
	ldp	x12, x13, [x20]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	ldr	x21, [x16, #40]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldr	x17, [x19, #120]                ; 8-byte Folded Reload
	b	LBB0_28
LBB0_88:                                ; %resize.i7642
	mov	x0, x16
	stp	x13, x12, [x19, #104]           ; 16-byte Folded Spill
	stp	x15, x14, [x19, #88]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x12, x8, [x19, #112]            ; 16-byte Folded Reload
	ldp	x15, x14, [x19, #88]            ; 16-byte Folded Reload
	ldr	x13, [x19, #104]                ; 8-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_29
; %bb.89:
	mov	x12, x8
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_90:                                ; %resize.i7658
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_99
; %bb.91:                               ; %resize.i7658.OP736.MLOAD.contd_crit_edge
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b	LBB0_30
LBB0_92:
	mov	x12, #0                         ; =0x0
	mov	w0, #80                         ; =0x50
	b	LBB0_101
LBB0_93:                                ; %resize.i
	mov	x0, x17
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	ldp	x4, x17, [x19, #128]            ; 16-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_14
; %bb.94:
	mov	x12, #0                         ; =0x0
	b	LBB0_691
LBB0_95:
	mov	x12, x20
	mov	w0, #80                         ; =0x50
	b	LBB0_691
LBB0_96:
	mov	x12, x20
	mov	w0, #92                         ; =0x5c
	b	LBB0_101
LBB0_97:
	mov	x12, #0                         ; =0x0
	mov	w0, #80                         ; =0x50
	b	LBB0_691
LBB0_98:
	mov	w0, #80                         ; =0x50
	mov	w12, #1                         ; =0x1
	b	LBB0_691
LBB0_99:
	ldr	x12, [x19, #32]                 ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_100:
	mov	x12, x28
	b	LBB0_691
LBB0_101:                               ; %return
	str	x12, [x26]
	sub	sp, x29, #80
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB0_102:                               ; %OP81.PUSH1
	mov	x21, x12
	subs	x8, x27, #6
	stur	x8, [x28, #8]
	b.hs	LBB0_217
; %bb.103:
	mov	w0, #80                         ; =0x50
LBB0_104:                               ; %return
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	mov	x12, x21
	b	LBB0_101
LBB0_105:                               ; %OP70.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_106:                               ; %OP70.JUMPDEST
	ldr	x4, [x19, #128]                 ; 8-byte Folded Reload
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	b.hs	LBB0_16
	b	LBB0_734
LBB0_107:                               ; %OP76.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_185
; %bb.108:                              ; %OP76.JUMPDEST.contd
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cmp	x12, #1022
	b.ls	LBB0_40
LBB0_109:
	mov	w0, #92                         ; =0x5c
	b	LBB0_691
LBB0_110:                               ; %OP84.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_111:                               ; %OP84.JUMPDEST
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.112:                              ; %OP84.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
; %bb.113:                              ; %OP85.PUSH2
	add	x8, x21, x12, lsl #5
	add	x12, x12, #1
	stp	xzr, xzr, [x8, #16]
	mov	w10, #204                       ; =0xcc
	stp	x10, xzr, [x8]
LBB0_114:                               ; %OP743.JUMPDEST
	subs	x8, x27, #194
	stur	x8, [x28, #8]
	b.lo	LBB0_552
; %bb.115:                              ; %OP743.JUMPDEST.contd
	cmp	x12, #1015
	b.hi	LBB0_598
; %bb.116:                              ; %OP744.PUSH1
	add	x8, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	mov	x25, x8
	str	q0, [x25, #32]!
	str	q0, [x8, #48]
	add	x20, x12, #2
	stp	q0, q0, [x8]
	str	x8, [x19, #120]                 ; 8-byte Folded Spill
	mov	x0, x17
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	mov	x24, x17
	mov	x22, x21
	mov	x21, x12
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_162
; %bb.117:                              ; %OP747.PUSH1
	add	x1, x21, #3
	add	x23, x22, x20, lsl #5
	str	x21, [x19, #152]                ; 8-byte Folded Spill
	add	x2, x21, #4
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	add	x17, x22, x1, lsl #5
	add	x21, x22, x2, lsl #5
	mov	w12, #-1                        ; =0xffffffff
	eor	w12, w12, w11, lsl #8
	and	x12, x12, #0x100
	subs	x12, x12, #1
	mov	x13, #-1                        ; =0xffffffffffffffff
	adcs	x14, xzr, x13
	adcs	x15, xzr, x13
	adc	x13, xzr, x13
	and	x10, x14, x10
	and	x9, x15, x9
	and	x8, x13, x8
	extr	x13, x8, x9, #1
	extr	x9, x9, x10, #1
	and	x11, x12, x11
	extr	x10, x10, x11, #1
	lsr	x8, x8, #1
	stp	x10, x9, [x25]
	stp	x13, x8, [x25, #16]
	adds	x10, x10, #31
	adcs	x9, x9, xzr
	adcs	x12, x13, xzr
	cinc	x8, x8, hs
	stp	x10, x9, [x21]
	stp	x12, x8, [x21, #16]
	and	x10, x10, #0xffffffffffffffe0
	adds	x11, x10, #32
	adcs	x10, x9, xzr
	adcs	x9, x12, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x23]
	stp	x9, x8, [x23, #16]
	stp	xzr, xzr, [x17, #16]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x17]
	ldr	x22, [x24, #40]
	ldr	x12, [x22, #16]
	ldr	x26, [x22, #48]
	sub	x12, x12, x26
	mov	x27, x22
	cmp	x12, #95
	mov	x16, x24
	b.ls	LBB0_152
LBB0_118:                               ; %OP770.MLOAD.contd
	ldr	x12, [x22, #8]
	add	x12, x12, x26
	ldp	x14, x13, [x12, #64]
	ldp	x12, x15, [x12, #80]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x13, x14, [x23, #16]
	stp	x15, x12, [x23]
	adds	x22, x11, x15
	adcs	x26, x10, x12
	adcs	x28, x9, x13
	adc	x24, x8, x14
	stp	x22, x26, [x17]
	stp	x28, x24, [x17, #16]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x21]
	ldr	x8, [x27, #16]
	ldr	x20, [x27, #48]
	sub	x8, x8, x20
	cmp	x8, #95
	str	x17, [x19, #104]                ; 8-byte Folded Spill
	b.ls	LBB0_154
LBB0_119:                               ; %OP776.DUP1
	ldr	x8, [x27, #8]
	add	x8, x8, x20
	rev	x9, x24
	rev	x10, x28
	rev	x11, x26
	rev	x12, x22
	stp	x11, x12, [x8, #80]
	stp	x9, x10, [x8, #64]
	ldp	x27, x8, [x23]
	ldp	x10, x9, [x23, #16]
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	ldr	q0, [x1]
	ldp	x12, x11, [x1, #16]
	stp	x10, x9, [x1, #16]
	stp	x27, x8, [x1]
	str	x27, [x1, #160]!
	ldp	x24, x22, [x1, #-128]
	ldp	x28, x26, [x1, #-112]
	stp	x12, x11, [x1, #-112]
	stur	q0, [x1, #-128]
	stp	x28, x26, [x23, #16]
	stp	x24, x22, [x23]
	stp	x10, x9, [x17, #16]
	stp	x27, x8, [x17]
	stp	x28, x26, [x21, #16]
	stp	x24, x22, [x21]
	ldr	x11, [x19, #152]                ; 8-byte Folded Reload
	add	x11, x11, #6
	str	x11, [x19, #112]                ; 8-byte Folded Spill
	stp	x10, x9, [x1, #16]
	cmp	xzr, x8
	str	x8, [x1, #8]
	ldr	x23, [x16, #40]
	ngcs	xzr, x10
	ngcs	xzr, x9
	add	x8, x27, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ldr	x10, [x23, #16]
	ldr	x20, [x23, #48]
	ccmp	x27, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x8, x8, xzr, eq
	sub	x9, x10, x20
	cmp	x8, x9
	b.hi	LBB0_155
LBB0_120:                               ; %OP783.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x20
	add	x8, x8, x27
	rev	x9, x26
	rev	x10, x22
	rev	x11, x24
	stp	x10, x11, [x8, #16]
	rev	x10, x28
	stp	x9, x10, [x8]
	ldp	x9, x8, [x17, #16]
	ldp	x11, x10, [x17]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x17]
	stp	x9, x8, [x17, #16]
	ldp	x9, x8, [x25]
	ldp	x11, x10, [x25, #16]
	stp	x11, x10, [x21, #16]
	stp	x9, x8, [x21]
	stp	x11, x10, [x1, #16]
	stp	x9, x8, [x1]
	mov	x0, x16
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_367
; %bb.121:                              ; %OP788.PUSH1
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldp	x16, x20, [x19, #112]           ; 16-byte Folded Reload
	add	x25, x21, x16, lsl #5
	ldp	x10, x11, [x20, #176]
	ldp	x8, x9, [x20, #160]
	add	x1, x20, #256
	str	xzr, [x20, #280]
	movi.2d	v0, #0000000000000000
	stur	q0, [x1, #8]
	mov	w12, #256                       ; =0x100
	mov	w13, #-1                        ; =0xffffffff
	eor	w13, w13, w8, lsl #8
	and	x13, x13, #0x100
	stp	xzr, x12, [x20, #248]
	stur	q0, [x20, #232]
	str	x13, [x20, #224]
	subs	x12, x13, #1
	mov	x13, #-1                        ; =0xffffffffffffffff
	adcs	x14, xzr, x13
	adcs	x15, xzr, x13
	adc	x13, xzr, x13
	and	x8, x12, x8
	and	x9, x14, x9
	and	x10, x15, x10
	and	x11, x13, x11
	extr	x12, x11, x10, #1
	extr	x13, x10, x9, #1
	extr	x14, x9, x8, #1
	lsr	x15, x11, #1
	stp	x14, x13, [x20, #160]
	stp	x12, x15, [x20, #176]
	cmp	x8, #2
	sbcs	xzr, x9, xzr
	sbcs	xzr, x10, xzr
	sbcs	xzr, x11, xzr
	cset	w12, lo
	str	xzr, [x25, #24]
	stur	q0, [x25, #8]
	str	x12, [x25]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldur	x12, [x28, #8]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b.hs	LBB0_123
; %bb.122:
	mov	x27, x12
	subs	x8, x12, #22
	stur	x8, [x28, #8]
	b.hs	LBB0_150
	b	LBB0_728
LBB0_123:                               ; %OP804.DUP1
	subs	x27, x12, #22
	stur	x27, [x28, #8]
	b.lo	LBB0_728
; %bb.124:                              ; %OP804.DUP1.contd2858
	stp	xzr, xzr, [x20, #240]
	mov	w13, #31                        ; =0x1f
	stp	x13, xzr, [x20, #224]
	mov	w13, #63                        ; =0x3f
	cmp	x13, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	ngcs	xzr, x11
	cset	w8, lo
	stp	xzr, xzr, [x25, #16]
	stp	x8, xzr, [x25]
	b.hs	LBB0_139
; %bb.125:
	mov	x12, x16
	subs	x8, x27, #58
	stur	x8, [x28, #8]
	b.lo	LBB0_552
LBB0_126:                               ; %OP823.JUMPDEST.contd
	sub	x8, x12, #1024
	cmp	x12, #3
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1021
	b.lo	LBB0_691
; %bb.127:                              ; %OP824.DUP3
	add	x20, x21, x12, lsl #5
	ldp	x9, x8, [x20, #-80]
	ldp	x11, x10, [x20, #-96]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	sub	x22, x12, #1
	add	x21, x21, x22, lsl #5
	ldp	x13, x12, [x21, #16]
	ldp	x15, x14, [x21]
	adds	x15, x15, x11
	adcs	x14, x14, x10
	adcs	x13, x13, x9
	adc	x12, x12, x8
	mov	x1, x20
	ldp	x23, x24, [x20, #-64]
	str	x23, [x1, #-32]!
	stp	x15, x14, [x20, #-96]
	stp	x13, x12, [x20, #-80]
	ldp	x26, x25, [x20, #-48]
	stp	x9, x8, [x20, #-48]
	stp	x11, x10, [x20, #-64]
	stp	x26, x25, [x20, #-16]
	stur	x24, [x20, #-24]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	x27, [x17, #40]
	ldr	x8, [x27, #16]
	ldr	x28, [x27, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	b.ls	LBB0_157
LBB0_128:                               ; %OP830.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	rev	x9, x25
	rev	x10, x26
	rev	x11, x24
	rev	x12, x23
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_187
; %bb.129:                              ; %OP833.SWAP1
	ldp	q0, q1, [x20, #-32]
	ldur	q2, [x20, #-64]
	ldp	x9, x8, [x20, #-48]
	stp	q0, q1, [x20, #-64]
	stp	x9, x8, [x20, #-16]
	stur	q2, [x20, #-32]
	ldp	x17, x21, [x19, #136]           ; 16-byte Folded Reload
	ldp	x12, x28, [x19, #152]           ; 16-byte Folded Reload
LBB0_130:                               ; %OP834.JUMPDEST.preheader
	sub	x8, x12, #1023
	cmn	x8, #1020
	b.lo	LBB0_156
; %bb.131:
	add	x8, x12, #1
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x25, x21, x12, lsl #5
	str	x8, [x19, #120]                 ; 8-byte Folded Spill
	add	x21, x21, x8, lsl #5
LBB0_132:                               ; %OP834.JUMPDEST
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x28, #8]
	subs	x8, x8, #50
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.133:                              ; %OP834.JUMPDEST.contd
                                        ;   in Loop: Header=BB0_132 Depth=1
	ldur	q0, [x25, #-64]
	ldp	x8, x9, [x25, #-48]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	mov	x0, x17
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	mov	x24, x17
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_369
; %bb.134:                              ; %OP837.DUP2
                                        ;   in Loop: Header=BB0_132 Depth=1
	ldp	x23, x8, [x25, #-32]
	ldp	x9, x10, [x25, #-16]
	stp	x9, x10, [x21, #16]
	stp	x23, x8, [x21]
	ldp	x26, x12, [x25, #16]
	ldp	x28, x27, [x25]
	ldr	x20, [x24, #40]
	ldr	x11, [x20, #16]
	ldr	x22, [x20, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x22
	cmp	x1, x8
	mov	x17, x24
	b.hi	LBB0_136
LBB0_135:                               ; %OP839.SWAP1
                                        ;   in Loop: Header=BB0_132 Depth=1
	ldr	x8, [x20, #8]
	add	x8, x8, x22
	add	x8, x8, x23
	rev	x9, x12
	rev	x10, x26
	rev	x11, x27
	rev	x12, x28
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x10, x9, [x25, #-16]
	ldp	x8, x11, [x25, #-32]
	ldp	x13, x12, [x25, #-48]
	ldp	x15, x14, [x25, #-64]
	adds	x15, x15, #1
	adcs	x14, x14, xzr
	adcs	x13, x13, xzr
	cinc	x12, x12, hs
	stp	x15, x14, [x25, #-64]
	stp	x13, x12, [x25, #-48]
	adds	x13, x8, #32
	adcs	x14, x11, xzr
	adcs	x15, x10, xzr
	cinc	x16, x9, hs
	stp	x13, x14, [x25, #-32]
	stp	x15, x16, [x25, #-16]
	ldp	x11, x9, [x25, #-96]
	ldp	x12, x10, [x25, #-80]
	stp	x12, x10, [x21, #16]
	stp	x11, x9, [x21]
	cmp	x13, x11
	sbcs	xzr, x14, x9
	sbcs	xzr, x15, x12
	sbcs	xzr, x16, x10
	cset	w13, lo
	stp	xzr, xzr, [x25, #16]
	stp	x13, xzr, [x25]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.lo	LBB0_132
	b	LBB0_137
LBB0_136:                               ; %resize.i7748
                                        ;   in Loop: Header=BB0_132 Depth=1
	mov	x0, x17
	mov	x24, x12
	bl	___revmc_builtin_resize_memory
	mov	x12, x24
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_135
	b	LBB0_187
LBB0_137:                               ; %OP850.DUP3
	ldur	x13, [x28, #8]
	subs	x27, x13, #24
	stur	x27, [x28, #8]
	b.lo	LBB0_185
; %bb.138:                              ; %OP850.DUP3.contd3031
	sub	w8, w8, w11
	and	x8, x8, #0x1f
	stp	x11, x9, [x25]
	stp	x12, x10, [x25, #16]
	adds	x8, x8, x11
	adcs	x13, x9, xzr
	adcs	x14, x12, xzr
	cinc	x15, x10, hs
	stp	x8, x13, [x25, #-96]
	stp	x14, x15, [x25, #-80]
	stp	x11, x9, [x25, #-32]
	stp	x12, x10, [x25, #-16]
	ldp	x21, x16, [x19, #144]           ; 16-byte Folded Reload
	subs	x8, x27, #22
	stur	x8, [x28, #8]
	b.hs	LBB0_150
	b	LBB0_728
LBB0_139:                               ; %OP809.PUSH2
	sub	x8, x12, #70
	stur	x8, [x28, #8]
	cmp	x27, #48
	b.lo	LBB0_728
; %bb.140:                              ; %OP809.PUSH2.contd2875
	stp	xzr, xzr, [x25, #16]
	mov	w8, #256                        ; =0x100
	stp	x8, xzr, [x25]
	stp	xzr, xzr, [x20, #240]
	stp	x8, xzr, [x20, #224]
	ldr	q0, [x20, #128]
	ldp	x8, x9, [x20, #144]
	stp	x8, x9, [x20, #272]
	str	q0, [x20, #256]
	mov	x0, x17
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_159
; %bb.141:                              ; %OP813.DIV_udiv-special-cases
	ldp	x5, x3, [x20, #256]
	ldp	x6, x4, [x20, #272]
	ldp	x9, x8, [x20, #224]
	ldp	x11, x10, [x20, #240]
	orr	x12, x8, x10
	orr	x13, x9, x11
	orr	x12, x13, x12
	cmp	x12, #0
	orr	x12, x3, x4
	orr	x13, x5, x6
	orr	x12, x13, x12
	ccmp	x12, #0, #4, ne
	cset	w12, eq
	clz	x13, x10
	clz	x14, x11
	add	x14, x14, #64
	cmp	x10, #0
	csel	x13, x13, x14, ne
	clz	x14, x8
	clz	x15, x9
	add	x15, x15, #64
	cmp	x8, #0
	csel	x14, x14, x15, ne
	add	x14, x14, #128
	orr	x15, x11, x10
	cmp	x15, #0
	csel	x13, x13, x14, ne
	clz	x14, x4
	clz	x15, x6
	add	x15, x15, #64
	cmp	x4, #0
	csel	x14, x14, x15, ne
	clz	x15, x3
	clz	x16, x5
	add	x16, x16, #64
	cmp	x3, #0
	csel	x15, x15, x16, ne
	add	x15, x15, #128
	orr	x16, x6, x4
	cmp	x16, #0
	csel	x14, x14, x15, ne
	subs	x14, x13, x14
	ngcs	x16, xzr
	ngcs	x1, xzr
	ngc	x2, xzr
	mov	w13, #255                       ; =0xff
	cmp	x13, x14
	ngcs	xzr, x16
	ngcs	xzr, x1
	ngcs	xzr, x2
	csinc	w0, w12, wzr, hs
	cmp	w0, #0
	csel	x17, xzr, x4, ne
	csel	x15, xzr, x6, ne
	csel	x13, xzr, x3, ne
	csel	x12, xzr, x5, ne
	tbnz	w0, #0, LBB0_148
; %bb.142:                              ; %OP813.DIV_udiv-special-cases
	eor	x0, x14, #0xff
	orr	x0, x0, x1
	orr	x7, x16, x2
	orr	x0, x0, x7
	cbz	x0, LBB0_148
; %bb.143:                              ; %udiv-bb19567
	movi.2d	v0, #0000000000000000
	stur	q0, [x19, #248]
	stur	q0, [x19, #232]
	stp	x5, x3, [x19, #264]
	stp	x6, x4, [x19, #280]
	mov	w13, #255                       ; =0xff
	sub	x13, x13, x14
	and	x7, x13, #0x7
	ubfx	x13, x13, #3, #5
	add	x15, x19, #232
	add	x15, x15, #32
	sub	x15, x15, x13
	ldp	x17, x13, [x15, #16]
	lsl	x13, x13, x7
	mvn	w0, w7
	lsr	x20, x17, #1
	lsr	x20, x20, x0
	orr	x13, x13, x20
	lsl	x17, x17, x7
	ldp	x21, x20, [x15]
	lsr	x15, x20, #1
	lsr	x15, x15, x0
	orr	x15, x17, x15
	lsr	x17, x21, #1
	lsr	x22, x17, x0
	adds	x17, x14, #1
	adcs	x0, x16, xzr
	adcs	x1, x1, xzr
	cinc	x2, x2, hs
	lsl	x14, x20, x7
	orr	x16, x14, x22
	lsl	x14, x21, x7
	orr	x7, x0, x2
	orr	x20, x17, x1
	mov	x12, #0                         ; =0x0
	orr	x7, x20, x7
	cbz	x7, LBB0_146
; %bb.144:                              ; %udiv-preheader9566
	mov	x7, #0                          ; =0x0
	stur	q0, [x19, #216]
	stur	q0, [x19, #200]
	stp	x5, x3, [x19, #168]
	stp	x6, x4, [x19, #184]
	and	x3, x17, #0x7
	mvn	w4, w3
	ubfx	x5, x17, #3, #5
	add	x6, x19, #168
	add	x5, x6, x5
	ldp	x20, x6, [x5, #16]
	lsl	x21, x6, #1
	lsl	x21, x21, x4
	lsr	x22, x20, x3
	orr	x23, x21, x22
	lsl	x20, x20, #1
	lsl	x20, x20, x4
	ldp	x5, x21, [x5]
	lsr	x22, x21, x3
	orr	x28, x22, x20
	lsl	x20, x21, #1
	lsl	x4, x20, x4
	lsr	x5, x5, x3
	orr	x27, x4, x5
	lsr	x30, x6, x3
	subs	x3, x9, #1
	mov	x4, #-1                         ; =0xffffffffffffffff
	adcs	x5, x8, x4
	adcs	x21, x11, x4
	adc	x22, x10, x4
LBB0_145:                               ; %udiv-do-while9565
                                        ; =>This Inner Loop Header: Depth=1
	mov	x6, #0                          ; =0x0
	extr	x20, x30, x23, #63
	extr	x23, x23, x28, #63
	extr	x24, x28, x27, #63
	extr	x26, x27, x13, #63
	extr	x13, x13, x15, #63
	extr	x15, x15, x16, #63
	extr	x16, x16, x14, #63
	orr	x14, x12, x14, lsl #1
	orr	x16, x7, x16
	orr	x15, x7, x15
	orr	x13, x7, x13
	cmp	x3, x26
	sbcs	xzr, x5, x24
	sbcs	xzr, x21, x23
	sbc	x12, x22, x20
	asr	x7, x12, #63
	and	x12, x7, #0x1
	and	x30, x7, x10
	and	x27, x7, x9
	subs	x27, x26, x27
	and	x26, x7, x11
	and	x7, x7, x8
	sbcs	x28, x24, x7
	sbcs	x23, x23, x26
	sbc	x30, x20, x30
	subs	x17, x17, #1
	adcs	x0, x0, x4
	adcs	x1, x1, x4
	adc	x2, x2, x4
	orr	x20, x0, x2
	orr	x24, x17, x1
	mov	x7, #0                          ; =0x0
	orr	x20, x24, x20
	cbnz	x20, LBB0_145
	b	LBB0_147
LBB0_146:
	mov	x6, x12
LBB0_147:                               ; %udiv-loop-exit9564
	extr	x8, x13, x15, #63
	extr	x9, x15, x16, #63
	extr	x10, x16, x14, #63
	orr	x13, x6, x10
	orr	x15, x6, x9
	orr	x17, x6, x8
	orr	x12, x12, x14, lsl #1
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldr	x20, [x19, #120]                ; 8-byte Folded Reload
LBB0_148:                               ; %udiv-end9563
	ldp	x8, x9, [x25]
	ldp	x10, x11, [x25, #16]
	umulh	x14, x12, x10
	madd	x11, x12, x11, x14
	madd	x11, x13, x10, x11
	umulh	x14, x15, x8
	madd	x14, x15, x9, x14
	madd	x14, x17, x8, x14
	mul	x10, x12, x10
	mul	x15, x15, x8
	adds	x10, x15, x10
	adc	x11, x14, x11
	umulh	x14, x9, x12
	umulh	x15, x8, x12
	mul	x16, x9, x12
	adds	x15, x16, x15
	cinc	x14, x14, hs
	umulh	x16, x8, x13
	mul	x17, x8, x13
	adds	x21, x17, x15
	cinc	x15, x16, hs
	adds	x14, x14, x15
	cset	w15, hs
	umulh	x16, x9, x13
	mul	x9, x9, x13
	adds	x9, x9, x14
	adc	x13, x16, x15
	adds	x22, x9, x10
	adc	x24, x13, x11
	mul	x23, x8, x12
	stp	x23, x21, [x25]
	stp	x22, x24, [x25, #16]
	ldp	x26, x8, [x20, #96]
	ldp	x9, x10, [x20, #112]
	stp	x9, x10, [x20, #240]
	stp	x26, x8, [x20, #224]
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	ldr	x20, [x0, #40]
	ldr	x11, [x20, #16]
	ldr	x27, [x20, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x26, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x26, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x27
	cmp	x1, x8
	b.hi	LBB0_160
LBB0_149:                               ; %OP817.SWAP2
	ldr	x8, [x20, #8]
	add	x8, x8, x27
	add	x8, x8, x26
	rev	x9, x24
	rev	x10, x22
	rev	x11, x21
	rev	x12, x23
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x13, x16, [x19, #104]           ; 16-byte Folded Reload
	ldp	x9, x8, [x13, #16]
	ldp	x11, x10, [x13]
	stp	xzr, xzr, [x25, #16]
	mov	w12, #32                        ; =0x20
	stp	x12, xzr, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x13]
	stp	x9, x8, [x13, #16]
	ldur	x27, [x28, #8]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	subs	x8, x27, #22
	stur	x8, [x28, #8]
	b.lo	LBB0_728
LBB0_150:                               ; %OP858.JUMPDEST.contd
	cmp	x16, #7
	b.hs	LBB0_510
; %bb.151:
	mov	w0, #91                         ; =0x5b
	mov	x12, x16
	b	LBB0_691
LBB0_152:                               ; %resize.i7674
	mov	x28, x1
	mov	x24, x2
	mov	x20, x17
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_161
; %bb.153:                              ; %resize.i7674.OP770.MLOAD.contd_crit_edge
	ldp	x9, x8, [x23, #16]
	ldp	x11, x10, [x23]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	ldr	x27, [x16, #40]
	mov	x17, x20
	mov	x2, x24
	mov	x1, x28
	b	LBB0_118
LBB0_154:                               ; %resize.i7689
	mov	x0, x16
	str	x1, [x19, #112]                 ; 8-byte Folded Spill
	mov	w1, #96                         ; =0x60
	str	x2, [x19, #96]                  ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x17, x12, [x19, #104]           ; 16-byte Folded Reload
	ldr	x2, [x19, #96]                  ; 8-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_119
	b	LBB0_691
LBB0_155:                               ; %resize.i7704
	mov	x0, x16
	stp	x1, x2, [x19, #88]              ; 16-byte Folded Spill
	mov	x1, x8
	bl	___revmc_builtin_resize_memory
	ldp	x12, x17, [x19, #96]            ; 16-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	ldr	x1, [x19, #88]                  ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_120
	b	LBB0_691
LBB0_156:                               ; %OP834.JUMPDEST.us
	ldur	x8, [x28, #8]
	subs	x8, x8, #50
	stur	x8, [x28, #8]
	b.hs	LBB0_517
	b	LBB0_552
LBB0_157:                               ; %resize.i7733
	mov	x0, x17
	str	x1, [x19, #120]                 ; 8-byte Folded Spill
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_128
LBB0_158:
	mov	x12, x22
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_159:
	ldr	x8, [x19, #152]                 ; 8-byte Folded Reload
	add	x12, x8, #9
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_160:                               ; %resize.i7719
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.eq	LBB0_149
	b	LBB0_367
LBB0_161:
	mov	x12, x24
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_162:
	mov	x12, x20
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_163:                               ; %OP88.JUMPDEST
	subs	x8, x27, #93
	stur	x8, [x28, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.164:                              ; %OP88.JUMPDEST.contd
	sub	x8, x12, #1016
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1015
	b.lo	LBB0_691
; %bb.165:                              ; %OP89.PUSH1
	add	x21, x12, #1
	ldr	x27, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x27, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x24, sp, #32
	mov	sp, x24
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x24
	mov	x5, x17
	mov	x26, x17
	mov	x25, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_524
; %bb.166:                              ; %OP90.MLOAD.contd
	ldp	x0, x1, [x24]
	ldp	x2, x3, [x24, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x8, x27, x21, lsl #5
	stp	x2, x3, [x8, #16]
	stp	x0, x1, [x8]
	add	x22, x25, #3
	add	x21, x27, x22, lsl #5
	adds	x8, x0, #32
	adcs	x9, x1, xzr
	adcs	x10, x2, xzr
	cinc	x11, x3, hs
	stp	x8, x9, [x20, #64]
	stp	x10, x11, [x20, #80]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	stp	x2, x3, [x20, #144]
	stp	x0, x1, [x20, #128]
	str	x26, [sp, #-16]!
	mov	w4, #32                         ; =0x20
	mov	x5, #0                          ; =0x0
	mov	x6, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.ne	LBB0_525
; %bb.167:                              ; %OP100.DUP4
	add	x23, x25, #5
	ldp	x0, x1, [x20, #-32]
	ldp	x2, x3, [x20, #-16]
	stp	x2, x3, [x21, #16]
	stp	x0, x1, [x21]
	ldr	q0, [x20, #64]
	ldp	x8, x9, [x20, #80]
	stp	x8, x9, [x20, #144]
	str	q0, [x20, #128]
	add	x25, x25, #6
	add	x22, x27, x23, lsl #5
	stp	x2, x3, [x22, #16]
	stp	x0, x1, [x22]
	sub	x24, sp, #32
	mov	sp, x24
	mov	x4, x24
	mov	x5, x26
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_186
; %bb.168:                              ; %OP103.MLOAD.contd
	ldp	x4, x5, [x24]
	ldp	x6, x7, [x24, #16]
	stp	x6, x7, [x22, #16]
	stp	x4, x5, [x22]
	ldp	x0, x1, [x20, #128]
	ldp	x2, x3, [x20, #144]
	add	x25, x27, x25, lsl #5
	stp	x2, x3, [x25, #16]
	stp	x0, x1, [x25]
	str	x26, [sp, #-16]!
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.ne	LBB0_534
; %bb.169:                              ; %OP106.PUSH1
	stp	xzr, xzr, [x22, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x22]
	ldp	x9, x8, [x20, #144]
	ldp	x11, x10, [x20, #128]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x20, #64]
	stp	x9, x8, [x20, #80]
	ldp	x0, x1, [x21]
	ldp	x2, x3, [x21, #16]
	stp	x2, x3, [x20, #144]
	stp	x0, x1, [x20, #128]
	sub	x24, sp, #32
	mov	sp, x24
	mov	x4, x24
	mov	x5, x26
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_534
; %bb.170:                              ; %OP111.MLOAD.contd
	ldp	x8, x9, [x24]
	ldp	x10, x11, [x24, #16]
	ldp	x13, x12, [x21, #16]
	ldp	x15, x14, [x21]
	adds	x15, x15, #32
	adcs	x14, x14, xzr
	adcs	x13, x13, xzr
	cinc	x12, x12, hs
	stp	x15, x14, [x21]
	stp	x13, x12, [x21, #16]
	stp	x10, x11, [x20, #144]
	stp	x8, x9, [x20, #128]
	stp	x10, x11, [x22, #16]
	stp	x8, x9, [x22]
	ldr	q0, [x20, #64]
	ldp	x8, x9, [x20, #80]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	stp	x15, x14, [x20, #224]
	stp	x13, x12, [x20, #240]
	ldp	x21, x12, [x19, #144]           ; 16-byte Folded Reload
	add	x12, x12, #9
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20, #256]
	ldur	x27, [x28, #8]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
LBB0_171:                               ; %OP120.JUMPDEST.preheader
	subs	x8, x27, #26
	stur	x8, [x28, #8]
	b.lo	LBB0_734
; %bb.172:                              ; %OP120.JUMPDEST.contd.lr.ph
	sub	x9, x12, #1023
	cmn	x9, #1019
	b.lo	LBB0_548
; %bb.173:                              ; %OP120.JUMPDEST.contd.lr.ph.split
	add	x2, x12, #1
	add	x20, x21, x12, lsl #5
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	sub	x9, x12, #1022
	cmn	x9, #1019
	b.lo	LBB0_183
; %bb.174:                              ; %OP120.JUMPDEST.contd.preheader
	ldp	x10, x9, [x20, #-16]
	add	x22, x21, x2, lsl #5
	mov	x3, #-33                        ; =0xffffffffffffffdf
	ldp	x12, x11, [x20, #-32]
LBB0_175:                               ; %OP120.JUMPDEST.contd
                                        ; =>This Inner Loop Header: Depth=1
	ldp	x14, x13, [x20, #-112]
	ldp	x16, x15, [x20, #-128]
	stp	x12, x11, [x22]
	stp	x10, x9, [x22, #16]
	cmp	x12, x16
	sbcs	xzr, x11, x15
	sbcs	xzr, x10, x14
	sbcs	xzr, x9, x13
	cset	w13, hs
	stp	xzr, xzr, [x20, #16]
	stp	x13, xzr, [x20]
	b.hs	LBB0_189
; %bb.176:                              ; %OP127.DUP1
                                        ;   in Loop: Header=BB0_175 Depth=1
	sub	x13, x27, #75
	stur	x13, [x28, #8]
	cmp	x8, #49
	b.lo	LBB0_185
; %bb.177:                              ; %OP127.DUP1.contd
                                        ;   in Loop: Header=BB0_175 Depth=1
	ldp	x8, x13, [x20, #-64]
	ldp	x14, x15, [x20, #-48]
	stp	x14, x15, [x22, #16]
	stp	x8, x13, [x22]
	adds	x25, x8, x12
	adcs	x8, x13, x11
	adcs	x13, x14, x10
	adc	x14, x15, x9
	stp	x25, x8, [x20]
	stp	x13, x14, [x20, #16]
	ldr	x26, [x17, #40]
	ldr	x15, [x26, #16]
	ldr	x27, [x26, #48]
	cmp	xzr, x8
	ngcs	xzr, x13
	ngcs	xzr, x14
	add	x8, x25, #32
	ccmp	x25, x3, #2, hs
	cset	w13, hi
	cmp	w13, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x15, x27
	cmp	x1, x8
	mov	x24, x26
	b.hi	LBB0_180
LBB0_178:                               ; %OP130.MLOAD.contd
                                        ;   in Loop: Header=BB0_175 Depth=1
	ldr	x8, [x26, #8]
	add	x8, x8, x27
	add	x8, x8, x25
	ldp	x26, x25, [x8]
	ldp	x28, x27, [x8, #16]
	rev	x8, x28
	rev	x13, x27
	rev	x14, x26
	rev	x15, x25
	stp	x15, x14, [x20, #16]
	stp	x13, x8, [x20]
	ldp	x13, x8, [x20, #-96]
	ldp	x15, x14, [x20, #-80]
	stp	x15, x14, [x20, #80]
	stp	x13, x8, [x20, #64]
	adds	x21, x13, x12
	adcs	x8, x8, x11
	adcs	x10, x15, x10
	adc	x9, x14, x9
	stp	x21, x8, [x22]
	stp	x10, x9, [x22, #16]
	ldr	x11, [x24, #16]
	ldr	x23, [x24, #48]
	cmp	xzr, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	add	x8, x21, #32
	ccmp	x21, x3, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x23
	cmp	x1, x8
	b.hi	LBB0_182
LBB0_179:                               ; %OP135.PUSH1
                                        ;   in Loop: Header=BB0_175 Depth=1
	ldr	x8, [x24, #8]
	add	x8, x8, x23
	add	x8, x8, x21
	stp	x28, x27, [x8, #16]
	stp	x26, x25, [x8]
	ldp	x13, x8, [x20, #-32]
	ldp	x15, x14, [x20, #-16]
	stp	x15, x14, [x22, #16]
	stp	x13, x8, [x22]
	adds	x12, x13, #32
	adcs	x11, x8, xzr
	adcs	x10, x15, xzr
	cinc	x9, x14, hs
	stp	x12, x11, [x20, #-32]
	stp	x10, x9, [x20, #-16]
	stp	x15, x14, [x20, #16]
	stp	x13, x8, [x20]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldur	x27, [x28, #8]
	subs	x8, x27, #26
	stur	x8, [x28, #8]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b.hs	LBB0_175
	b	LBB0_185
LBB0_180:                               ; %resize.i7442
                                        ;   in Loop: Header=BB0_175 Depth=1
	mov	x21, x2
	mov	x0, x17
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_524
; %bb.181:                              ; %resize.i7442.OP130.MLOAD.contd_crit_edge
                                        ;   in Loop: Header=BB0_175 Depth=1
	ldp	x10, x9, [x20, #-16]
	ldp	x12, x11, [x20, #-32]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	ldr	x24, [x17, #40]
	mov	x2, x21
	mov	x3, #-33                        ; =0xffffffffffffffdf
	b	LBB0_178
LBB0_182:                               ; %resize.i7456
                                        ;   in Loop: Header=BB0_175 Depth=1
	mov	x0, x17
	str	x2, [x19, #128]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	mov	x3, #-33                        ; =0xffffffffffffffdf
	ldp	x2, x17, [x19, #128]            ; 16-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_179
	b	LBB0_187
LBB0_183:                               ; %OP120.JUMPDEST.contd.us
	ldp	x10, x9, [x20, #-112]
	ldp	x12, x11, [x20, #-128]
	ldp	x13, x14, [x20, #-32]
	ldp	x15, x16, [x20, #-16]
	add	x17, x21, x2, lsl #5
	stp	x15, x16, [x17, #16]
	stp	x13, x14, [x17]
	cmp	x13, x12
	sbcs	xzr, x14, x11
	sbcs	xzr, x15, x10
	sbcs	xzr, x16, x9
	cset	w9, hs
	stp	xzr, xzr, [x20, #16]
	stp	x9, xzr, [x20]
	b.lo	LBB0_551
; %bb.184:
	mov	w12, #1022                      ; =0x3fe
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b	LBB0_190
LBB0_185:
	mov	w0, #80                         ; =0x50
	b	LBB0_187
LBB0_186:
	mov	x12, x25
	b	LBB0_691
LBB0_187:
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b	LBB0_101
LBB0_188:                               ; %OP142.JUMPDEST.loopexit9581
	mov	x8, x27
LBB0_189:                               ; %OP142.JUMPDEST
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_190:                               ; %OP142.JUMPDEST
	subs	x27, x8, #51
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.191:                              ; %OP142.JUMPDEST.contd
	cmp	x12, #7
	b.lo	LBB0_201
; %bb.192:                              ; %OP143.POP
	mov	x17, x21
	add	x21, x21, x12, lsl #5
	ldp	x11, x9, [x21, #-144]
	ldp	x14, x10, [x21, #-160]
	mov	x20, x12
	sub	x2, x12, #5
	ldp	x15, x12, [x21, #-208]
	ldp	x13, x16, [x21, #-224]
	add	x17, x17, x2, lsl #5
	adds	x13, x13, x14
	adcs	x10, x16, x10
	adcs	x11, x15, x11
	adc	x12, x12, x9
	stp	x13, x10, [x21, #-224]
	stp	x11, x12, [x21, #-208]
	ands	x9, x14, #0x1f
	stp	xzr, xzr, [x21, #-176]
	stp	x9, xzr, [x21, #-192]
	cset	w14, eq
	stp	xzr, xzr, [x17, #16]
	stp	x14, xzr, [x17]
	cbz	x9, LBB0_200
; %bb.193:                              ; %OP159.DUP1
	sub	x8, x8, #117
	stur	x8, [x28, #8]
	cmp	x27, #66
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b.lo	LBB0_572
; %bb.194:                              ; %OP159.DUP1.contd
	sub	x8, x20, #1025
	cmn	x8, #1018
	b.lo	LBB0_566
; %bb.195:                              ; %OP159.DUP1.contd533
	mov	x14, x20
	sub	x22, x20, #3
	subs	x23, x13, x9
	sbcs	x8, x10, xzr
	sbcs	x10, x11, xzr
	sbc	x11, x12, xzr
	stp	x23, x8, [x21, #-160]
	stp	x10, x11, [x21, #-144]
	stp	x23, x8, [x21, #-128]
	stp	x10, x11, [x21, #-112]
	ldr	x25, [x0, #40]
	ldr	x12, [x25, #16]
	ldr	x26, [x25, #48]
	cmp	xzr, x8
	ngcs	xzr, x10
	ngcs	xzr, x11
	add	x8, x23, #32
	mov	x10, #-33                       ; =0xffffffffffffffdf
	ccmp	x23, x10, #2, hs
	cset	w10, hi
	cmp	w10, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x12, x26
	cmp	x1, x8
	str	x2, [x19, #128]                 ; 8-byte Folded Spill
	b.hi	LBB0_203
; %bb.196:
	mov	x11, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
LBB0_197:                               ; %OP163.MLOAD.contd
	mov	x27, x20
	sub	x24, x20, #1
	ldr	x12, [x25, #8]
	add	x12, x12, x26
	add	x12, x12, x23
	ldp	x14, x13, [x12]
	ldp	x12, x15, [x12, #16]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	mov	w16, #32                        ; =0x20
	subs	x9, x16, x9
	mov	x1, x21
	str	x9, [x1, #-64]!
	stp	x13, x14, [x1, #-48]
	stp	x15, x12, [x1, #-64]
	ldr	x20, [x19, #144]                ; 8-byte Folded Reload
	add	x22, x20, x22, lsl #5
	stp	xzr, xzr, [x22, #16]
	mov	w9, #1                          ; =0x1
	stp	x9, xzr, [x22]
	add	x9, x20, x24, lsl #5
	ngcs	x11, x11
	ngcs	x10, x10
	ngc	x8, x8
	stp	x10, x8, [x1, #16]
	str	x11, [x1, #8]
	stp	xzr, xzr, [x9, #16]
	mov	w8, #256                        ; =0x100
	stp	x8, xzr, [x9]
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_exp
	tst	w0, #0xff
	b.ne	LBB0_202
; %bb.198:                              ; %OP170.SUB
	ldp	x8, x9, [x21, #-64]
	ldp	x10, x11, [x21, #-48]
	ldp	x13, x12, [x21, #-80]
	ldp	x15, x14, [x21, #-96]
	mvn	x11, x11
	mvn	x10, x10
	mvn	x9, x9
	mvn	x8, x8
	sub	x27, x27, #4
	add	x23, x20, x27, lsl #5
	ldp	x16, x17, [x23]
	adds	x8, x15, x8
	and	x24, x16, x8
	adcs	x8, x14, x9
	adcs	x9, x13, x10
	adc	x10, x12, x11
	ldp	x11, x12, [x23, #16]
	and	x26, x12, x10
	and	x25, x11, x9
	mov	x12, x27
	and	x27, x17, x8
	stp	x24, x27, [x23]
	stp	x25, x26, [x23, #16]
	ldp	x28, x8, [x21, #-160]
	ldp	x10, x9, [x21, #-144]
	stp	x10, x9, [x22, #16]
	stp	x28, x8, [x22]
	ldp	x2, x17, [x19, #128]            ; 16-byte Folded Reload
	ldr	x22, [x17, #40]
	ldr	x11, [x22, #16]
	ldr	x20, [x22, #48]
	cmp	xzr, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	add	x8, x28, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x28, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x20
	cmp	x1, x8
	b.hi	LBB0_205
LBB0_199:                               ; %OP175.PUSH1
	ldr	x8, [x22, #8]
	add	x8, x8, x20
	add	x8, x8, x28
	rev	x9, x26
	rev	x10, x27
	rev	x11, x24
	stp	x10, x11, [x8, #16]
	rev	x10, x25
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x23, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x23]
	ldp	x9, x8, [x21, #-144]
	ldp	x11, x10, [x21, #-160]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldur	q0, [x21, #-224]
	ldp	x13, x12, [x21, #-208]
	stp	x11, x10, [x21, #-224]
	stp	x9, x8, [x21, #-208]
	stp	x13, x12, [x21, #-144]
	stur	q0, [x21, #-160]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldur	x27, [x28, #8]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b	LBB0_207
LBB0_200:
	ldp	x17, x21, [x19, #136]           ; 16-byte Folded Reload
	b	LBB0_207
LBB0_201:
	mov	w0, #91                         ; =0x5b
	b	LBB0_691
LBB0_202:
	mov	x12, x24
	b	LBB0_691
LBB0_203:                               ; %resize.i7472
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_525
; %bb.204:                              ; %resize.i7472.OP163.MLOAD.contd_crit_edge
	ldp	x10, x8, [x21, #-176]
	ldp	x9, x11, [x21, #-192]
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b	LBB0_197
LBB0_205:                               ; %resize.i7487
	mov	x0, x17
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldp	x2, x17, [x19, #128]            ; 16-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_199
	b	LBB0_691
LBB0_206:                               ; %OP179.JUMPDEST.loopexit
	mov	x2, x12
LBB0_207:                               ; %OP179.JUMPDEST
	subs	x8, x27, #30
	stur	x8, [x28, #8]
	b.lo	LBB0_572
; %bb.208:                              ; %OP179.JUMPDEST.contd
	subs	x24, x2, #5
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.lo	LBB0_576
LBB0_209:                               ; %OP180.POP
	add	x21, x21, x2, lsl #5
	ldp	x11, x9, [x21, #-64]
	ldp	x10, x8, [x21, #-48]
	mov	x1, x21
	ldr	q0, [x1, #-160]!
	ldp	x13, x12, [x21, #-144]
	str	x11, [x1]
	stp	x9, x10, [x21, #-152]
	stp	x13, x12, [x21, #-48]
	stur	q0, [x21, #-64]
	stp	xzr, xzr, [x21, #-120]
	stur	xzr, [x21, #-104]
	mov	w12, #64                        ; =0x40
	stp	x8, x12, [x21, #-136]
	ldr	x22, [x17, #40]
	ldr	x12, [x22, #16]
	ldr	x23, [x22, #48]
	sub	x12, x12, x23
	cmp	x12, #95
	b.ls	LBB0_211
LBB0_210:                               ; %OP186.MLOAD.contd
	ldr	x12, [x22, #8]
	add	x12, x12, x23
	ldp	x14, x13, [x12, #80]
	ldp	x12, x15, [x12, #64]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x10, x8, [x21, #-80]
	stp	x11, x9, [x21, #-96]
	subs	x11, x11, x13
	sbcs	x9, x9, x14
	sbcs	x10, x10, x15
	sbc	x8, x8, x12
	stp	x11, x9, [x21, #-160]
	stp	x10, x8, [x21, #-144]
	stp	x15, x12, [x21, #-112]
	stp	x13, x14, [x21, #-128]
	mov	w20, #2                         ; =0x2
	mov	x0, x17
	mov	w2, #2                          ; =0x2
	bl	___revmc_builtin_do_return
	tst	w0, #0xff
	csel	w0, w20, w0, eq
	mov	x12, x24
	b	LBB0_101
LBB0_211:                               ; %resize.i7503
	mov	x25, x2
	mov	x20, x1
	mov	x0, x17
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_213
; %bb.212:                              ; %resize.i7503.OP186.MLOAD.contd_crit_edge
	mov	x1, x20
	ldp	x10, x8, [x20, #16]
	ldp	x11, x9, [x20]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b	LBB0_210
LBB0_213:
	sub	x12, x25, #3
	b	LBB0_101
LBB0_214:                               ; %OP192.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_185
; %bb.215:                              ; %OP192.JUMPDEST.contd
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_216:                               ; %OP193.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldr	x10, [x11, #96]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	ldr	x11, [x11, #104]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_219
	b	LBB0_102
LBB0_217:                               ; %OP81.PUSH1.contd254
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x1, #32]
	stp	q0, q0, [x1]
	mov	w20, #16                        ; =0x10
	mov	x0, x17
	mov	w2, #16                         ; =0x10
	bl	___revmc_builtin_do_return
	tst	w0, #0xff
	csel	w0, w20, w0, eq
	b	LBB0_104
LBB0_218:                               ; %OP200.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_219:                               ; %OP200.JUMPDEST
	subs	x27, x27, #79
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.220:                              ; %OP200.JUMPDEST.contd
	cmp	x12, #1018
	b.hi	LBB0_109
; %bb.221:                              ; %OP201.PUSH2
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #391                        ; =0x187
	str	x8, [x20]
	stur	q0, [x20, #40]
	mov	x8, x21
	mov	w21, #4                         ; =0x4
	stp	xzr, x21, [x20, #24]
	add	x12, x12, #3
	str	xzr, [x20, #88]
	stur	q0, [x20, #72]
	stp	xzr, x21, [x20, #56]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x22, x8, x12, lsl #5
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	ldp	x25, x26, [x11, #72]
	mov	w0, #4                          ; =0x4
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	stp	x0, x1, [x20, #32]
	and	x8, x2, #0xffffffff
	stp	x8, xzr, [x20, #48]
	str	xzr, [x20, #88]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #72]
	str	x21, [x20, #64]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	mov	w8, #36                         ; =0x24
	str	x8, [x22]
	str	xzr, [x20, #152]
	stur	q0, [x20, #136]
	str	x8, [x20, #128]
	mov	w0, #36                         ; =0x24
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	str	xzr, [x20, #184]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #168]
	mov	w8, #32                         ; =0x20
	stp	x2, x3, [x20, #80]
	stp	x0, x1, [x20, #64]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	stp	xzr, x8, [x20, #152]
	stur	q0, [x20, #136]
	mov	w8, #68                         ; =0x44
	str	x8, [x20, #128]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
LBB0_222:                               ; %OP866.JUMPDEST
	subs	x8, x27, #171
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.223:                              ; %OP866.JUMPDEST.contd
	ldp	x10, x12, [x19, #144]           ; 16-byte Folded Reload
	sub	x8, x12, #1019
	subs	x13, x12, #2
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1017
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_691
; %bb.224:                              ; %OP867.PUSH1
	str	x13, [x19, #80]                 ; 8-byte Folded Spill
	add	x24, x10, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x24]
	add	x14, x12, #2
	ldp	x8, x9, [x24, #-16]
	ldur	q1, [x24, #-32]
	mov	x13, x24
	str	q1, [x13, #32]!
	str	x13, [x19, #120]                ; 8-byte Folded Spill
	stp	x8, x9, [x24, #48]
	add	x9, x12, #3
	stp	x9, x14, [x19, #64]             ; 16-byte Folded Spill
	add	x26, x10, x14, lsl #5
	str	xzr, [x26, #24]
	stur	q0, [x26, #8]
	mov	w8, #4                          ; =0x4
	str	x8, [x26]
	add	x14, x12, #4
	add	x22, x10, x9, lsl #5
	stp	q0, q0, [x22]
	ldr	w8, [x11, #164]
	ldur	x9, [x11, #156]
	rev	x9, x9
	rev	x8, x8
	extr	x13, x9, x8, #32
	ldur	x8, [x11, #148]
	rev	x8, x8
	extr	x11, x8, x9, #32
	lsr	x9, x8, #32
	str	x14, [x19, #48]                 ; 8-byte Folded Spill
	add	x27, x10, x14, lsl #5
	add	x8, x12, #6
	str	x8, [x19, #112]                 ; 8-byte Folded Spill
	stp	x9, xzr, [x27, #16]
	stp	x13, x11, [x27]
	stp	q0, q0, [x24, #160]
	ldr	x20, [x17, #40]
	ldr	x8, [x20, #16]
	ldr	x21, [x20, #48]
	sub	x8, x8, x21
	cmp	x8, #31
	b.ls	LBB0_238
LBB0_225:                               ; %OP878.PUSH1
	ldr	x8, [x20, #8]
	add	x8, x8, x21
	stp	x11, x9, [x19, #88]             ; 16-byte Folded Spill
	rev	x9, x9
	rev	x10, x11
	str	x13, [x19, #104]                ; 8-byte Folded Spill
	rev	x11, x13
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x25, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x13, x12, [x26]
	ldp	x21, x20, [x26, #16]
	stp	x25, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	x21, x20, [x22, #16]
	stp	x13, x12, [x22]
	stp	x25, x10, [x27]
	stp	x9, x8, [x27, #16]
	ldr	x23, [x17, #40]
	ldr	x11, [x23, #16]
	ldr	x28, [x23, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x25, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x25, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x28
	cmp	x1, x8
	b.hi	LBB0_239
LBB0_226:                               ; %OP883.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x28
	add	x8, x8, x25
	rev	x9, x20
	rev	x10, x21
	rev	x11, x12
	rev	x12, x13
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x26, #16]
	ldp	x11, x10, [x26]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x17
	mov	x1, x26
	mov	x20, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_242
; %bb.227:                              ; %OP887.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x22]
	ldur	w9, [x24, #-48]
	ldp	x21, x23, [x24, #-64]
	stp	x21, x23, [x27]
	stp	x9, xzr, [x27, #16]
	stp	q0, q0, [x24, #160]
	ldr	x25, [x20, #40]
	ldr	x8, [x25, #16]
	ldr	x28, [x25, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	mov	x13, x20
	b.ls	LBB0_240
LBB0_228:                               ; %OP895.PUSH1
	ldr	x8, [x25, #8]
	add	x8, x8, x28
	rev	x9, x9
	rev	x10, x23
	rev	x11, x21
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x25, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x26]
	ldp	x21, x20, [x26, #16]
	stp	x25, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	x21, x20, [x22, #16]
	stp	x14, x12, [x22]
	stp	x25, x10, [x27]
	stp	x9, x8, [x27, #16]
	ldr	x23, [x13, #40]
	ldr	x11, [x23, #16]
	ldr	x28, [x23, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x25, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x25, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x28
	cmp	x1, x8
	b.hi	LBB0_241
LBB0_229:                               ; %OP900.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x28
	add	x8, x8, x25
	rev	x9, x20
	rev	x10, x21
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x26, #16]
	ldp	x11, x10, [x26]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x13
	mov	x1, x26
	mov	x20, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_242
; %bb.230:                              ; %OP904.DUP2
	ldr	x9, [x19, #120]                 ; 8-byte Folded Reload
	ldr	q0, [x9]
	ldp	x9, x8, [x9, #16]
	ldr	q1, [x26]
	ldp	x10, x11, [x26, #16]
	stp	x9, x8, [x26, #16]
	str	q0, [x26]
	stp	x10, x11, [x22, #16]
	str	q1, [x22]
	mov	x0, x20
	mov	x1, x26
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sstore
	tst	w0, #0xff
	ldr	x9, [x19, #160]                 ; 8-byte Folded Reload
	b.ne	LBB0_244
; %bb.231:                              ; %OP907.POP
	ldur	x8, [x9, #8]
	subs	x8, x8, #1600
	stur	x8, [x9, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_243
; %bb.232:                              ; %OP907.POP.contd
	sub	x8, x12, #1016
	cmp	x12, #3
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1013
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	b.lo	LBB0_244
; %bb.233:                              ; %OP907.POP.contd3237
	ldur	w8, [x24, #-48]
	ldp	x9, x10, [x24, #-64]
	stp	x9, x10, [x24, #32]
	stp	x8, xzr, [x24, #48]
	ldr	x9, [x19, #104]                 ; 8-byte Folded Reload
	ldp	x10, x8, [x19, #88]             ; 16-byte Folded Reload
	stp	x9, x10, [x26]
	stp	x8, xzr, [x26, #16]
	mov	x8, #32091                      ; =0x7d5b
	movk	x8, #60396, lsl #16
	movk	x8, #57829, lsl #32
	movk	x8, #35931, lsl #48
	mov	x9, #34035                      ; =0x84f3
	movk	x9, #32030, lsl #16
	movk	x9, #28994, lsl #32
	movk	x9, #53583, lsl #48
	stp	x9, x8, [x22, #16]
	mov	x8, #10526                      ; =0x291e
	movk	x8, #63410, lsl #16
	movk	x8, #5312, lsl #32
	movk	x8, #56579, lsl #48
	mov	x9, #47397                      ; =0xb925
	movk	x9, #51139, lsl #16
	movk	x9, #2760, lsl #32
	movk	x9, #23328, lsl #48
	stp	x9, x8, [x22]
	ldp	x13, x14, [x24, #-32]
	ldp	x23, x26, [x24, #-16]
	stp	x23, x26, [x27, #16]
	stp	x13, x14, [x27]
	stp	xzr, xzr, [x24, #176]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x24, #160]
	ldr	x20, [x16, #40]
	ldr	x8, [x20, #16]
	ldr	x21, [x20, #48]
	sub	x8, x8, x21
	mov	x28, x20
	cmp	x8, #95
	b.ls	LBB0_245
LBB0_234:                               ; %OP917.MLOAD.contd
	ldr	x8, [x20, #8]
	add	x8, x8, x21
	ldp	x10, x9, [x8, #64]
	ldp	x8, x11, [x8, #80]
	rev	x8, x8
	rev	x21, x11
	rev	x10, x10
	rev	x9, x9
	stp	x9, x10, [x24, #176]
	stp	x21, x8, [x24, #160]
	add	x15, x12, #7
	ldr	x11, [x19, #144]                ; 8-byte Folded Reload
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	add	x20, x11, x12, lsl #5
	stp	x9, x10, [x20, #16]
	stp	x21, x8, [x20]
	add	x25, x11, x15, lsl #5
	stp	x23, x26, [x25, #16]
	stp	x13, x14, [x25]
	stp	x9, x10, [x24, #272]
	stp	x21, x8, [x24, #256]
	ldr	x11, [x28, #16]
	ldr	x22, [x28, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x21, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x21, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x22
	cmp	x1, x8
	b.hi	LBB0_247
LBB0_235:                               ; %OP922.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x22
	add	x8, x8, x21
	rev	x9, x26
	rev	x10, x23
	rev	x11, x14
	rev	x12, x13
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x25, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x25]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldr	q0, [x27]
	ldp	x13, x12, [x27, #16]
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x13, x12, [x20, #16]
	str	q0, [x20]
	stp	xzr, xzr, [x24, #176]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x24, #160]
	ldr	x21, [x16, #40]
	ldr	x12, [x21, #16]
	ldr	x22, [x21, #48]
	sub	x12, x12, x22
	cmp	x12, #95
	b.ls	LBB0_248
LBB0_236:                               ; %OP928.MLOAD.contd
	ldr	x12, [x21, #8]
	add	x12, x12, x22
	ldp	x14, x13, [x12, #80]
	ldp	x12, x15, [x12, #64]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x9, x8, [x20, #16]
	stp	x11, x10, [x20]
	subs	x11, x11, x13
	sbcs	x10, x10, x14
	sbcs	x9, x9, x15
	sbc	x8, x8, x12
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x15, x12, [x24, #176]
	stp	x13, x14, [x24, #160]
	ldr	x8, [x19, #152]                 ; 8-byte Folded Reload
	add	x20, x8, #1
	mov	x0, x16
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	mov	w2, #3                          ; =0x3
	bl	___revmc_builtin_log
	tst	w0, #0xff
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_162
; %bb.237:                              ; %OP934.PUSH1
	ldr	q0, [x24]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	add	x8, x21, x20, lsl #5
	ldp	x9, x10, [x24, #16]
	stp	x9, x10, [x8, #16]
	str	q0, [x8]
	ldp	x8, x10, [x24, #-96]
	ldp	x9, x11, [x24, #-80]
	stp	xzr, xzr, [x24, #-80]
	mov	w12, #1                         ; =0x1
	stp	x12, xzr, [x24, #-96]
	ldur	q0, [x24, #-64]
	ldp	x13, x12, [x24, #-48]
	stp	x9, x11, [x24, #-48]
	stp	x8, x10, [x24, #-64]
	stp	x13, x12, [x24, #16]
	ldr	x12, [x19, #80]                 ; 8-byte Folded Reload
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	str	q0, [x24]
	b	LBB0_616
LBB0_238:                               ; %resize.i7763
	mov	x0, x17
	mov	w1, #32                         ; =0x20
	mov	x23, x13
	mov	x25, x9
	mov	x28, x11
	bl	___revmc_builtin_resize_memory
	mov	x11, x28
	mov	x9, x25
	mov	x13, x23
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_225
	b	LBB0_85
LBB0_239:                               ; %resize.i7778
	mov	x0, x17
	stp	x13, x12, [x19, #32]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x13, x12, [x19, #32]            ; 16-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_226
	b	LBB0_242
LBB0_240:                               ; %resize.i7793
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	mov	x20, x9
	bl	___revmc_builtin_resize_memory
	mov	x9, x20
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_228
	b	LBB0_85
LBB0_241:                               ; %resize.i7808
	mov	x0, x13
	stp	x14, x12, [x19, #40]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #40]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_229
LBB0_242:
	ldp	x26, x12, [x19, #56]            ; 16-byte Folded Reload
	b	LBB0_101
LBB0_243:
	mov	w0, #80                         ; =0x50
LBB0_244:
	ldr	x12, [x19, #72]                 ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_245:                               ; %resize.i7824
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_367
; %bb.246:                              ; %resize.i7824.OP917.MLOAD.contd_crit_edge
	ldp	x23, x26, [x27, #16]
	ldp	x13, x14, [x27]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	ldr	x28, [x16, #40]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b	LBB0_234
LBB0_247:                               ; %resize.i7839
	mov	x0, x16
	stp	x14, x13, [x19, #96]            ; 16-byte Folded Spill
	str	x15, [x19, #88]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x12, x14, [x19, #88]            ; 16-byte Folded Reload
	ldr	x13, [x19, #104]                ; 8-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_235
	b	LBB0_691
LBB0_248:                               ; %resize.i7855
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_367
; %bb.249:                              ; %resize.i7855.OP928.MLOAD.contd_crit_edge
	ldp	x9, x8, [x27, #16]
	ldp	x11, x10, [x27]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	b	LBB0_236
LBB0_250:                               ; %OP226.JUMPDEST
	subs	x8, x27, #62
	stur	x8, [x28, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.251:                              ; %OP226.JUMPDEST.contd
	sub	x8, x12, #1021
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1020
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.lo	LBB0_101
; %bb.252:                              ; %OP227.PUSH1
	add	x21, x12, #1
	ldr	x25, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x25, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x23, sp, #32
	mov	sp, x23
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x23
	mov	x5, x17
	mov	x27, x17
	mov	x22, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.253:                              ; %OP228.MLOAD.contd
	ldp	x0, x1, [x23]
	ldp	x2, x3, [x23, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x22, x22, #2
	add	x24, x25, x21, lsl #5
	stp	x2, x3, [x24, #16]
	mov	x23, x20
	ldr	x8, [x23, #-32]!
	stp	x0, x1, [x24]
	ldp	x10, x9, [x23, #16]
	ldr	x11, [x23, #8]
	add	x25, x25, x22, lsl #5
	orr	x9, x11, x9
	orr	x8, x8, x10
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w4, ne
LBB0_254:                               ; %OP228.MLOAD.contd
	stp	xzr, xzr, [x25, #16]
	stp	x4, xzr, [x25]
	stp	x2, x3, [x23, #144]
	stp	x0, x1, [x23, #128]
	str	x27, [sp, #-16]!
	mov	x5, #0                          ; =0x0
	mov	x6, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.ne	LBB0_593
LBB0_255:                               ; %OP237.PUSH1
	stp	xzr, xzr, [x25, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x25]
	ldp	x9, x8, [x24, #16]
	ldp	x11, x10, [x24]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldur	q0, [x20, #-32]
	ldp	x13, x12, [x20, #-16]
	stp	x11, x10, [x20, #-32]
	stp	x9, x8, [x20, #-16]
	stp	x13, x12, [x24, #16]
	str	q0, [x24]
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x22, sp, #32
	mov	sp, x22
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x22
	mov	x5, x27
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.256:                              ; %OP243.MLOAD.contd
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	ldp	x12, x13, [x20, #-32]
	ldp	x14, x15, [x20, #-16]
	stp	x14, x15, [x24, #16]
	stp	x12, x13, [x24]
	subs	x12, x12, x11
	sbcs	x13, x13, x10
	sbcs	x14, x14, x9
	sbc	x15, x15, x8
	stp	x12, x13, [x20, #-32]
	stp	x14, x15, [x20, #-16]
	stp	x9, x8, [x20, #16]
	ldr	x21, [x19, #152]                ; 8-byte Folded Reload
	sub	x21, x21, #1
	stp	x11, x10, [x20]
	mov	w20, #2                         ; =0x2
	mov	x0, x27
	mov	x1, x23
	mov	w2, #2                          ; =0x2
	bl	___revmc_builtin_do_return
	mov	x12, x21
	tst	w0, #0xff
	csel	w0, w20, w0, eq
	b	LBB0_101
LBB0_257:
	mov	x12, x21
	b	LBB0_101
LBB0_258:                               ; %OP249.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.259:                              ; %OP249.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_260:                               ; %OP250.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldr	x10, [x11, #96]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	ldr	x11, [x11, #104]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_262
	b	LBB0_102
LBB0_261:                               ; %OP257.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
LBB0_262:                               ; %OP257.JUMPDEST
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.263:                              ; %OP257.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
; %bb.264:                              ; %OP258.PUSH2
	add	x8, x21, x12, lsl #5
	add	x12, x12, #1
	stp	xzr, xzr, [x8, #16]
	mov	w10, #436                       ; =0x1b4
	stp	x10, xzr, [x8]
	subs	x8, x27, #28
	stur	x8, [x28, #8]
	b.lo	LBB0_552
LBB0_265:                               ; %OP942.JUMPDEST.contd
	sub	x8, x12, #1022
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1021
	b.lo	LBB0_691
; %bb.266:                              ; %OP943.PUSH1
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	w8, [x11, #144]
	ldp	x9, x10, [x11, #128]
	rev	x10, x10
	rev	x8, x8
	extr	x8, x10, x8, #32
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	mov	x11, x21
	add	x21, x12, #2
	rev	x9, x9
	extr	x10, x9, x10, #32
	lsr	x9, x9, #32
	add	x11, x11, x21, lsl #5
	mov	w12, #-1                        ; =0xffffffff
	stp	x12, xzr, [x11, #16]
	mov	x12, #-1                        ; =0xffffffffffffffff
	stp	x12, x12, [x11]
	stp	x9, xzr, [x20, #48]
	str	x10, [x20, #40]
	mov	x1, x20
	str	x8, [x1, #32]!
	mov	x0, x17
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_balance
	tst	w0, #0xff
	b.ne	LBB0_547
; %bb.267:                              ; %OP948.SWAP1
	ldr	q0, [x20, #32]
	ldp	x13, x12, [x20, #48]
	ldr	q1, [x20]
	ldp	x9, x8, [x20, #16]
	stp	x9, x8, [x20, #48]
	str	q1, [x20, #32]
	ldp	x8, x10, [x20, #-32]
	ldp	x9, x11, [x20, #-16]
	stp	x13, x12, [x20, #-16]
	stur	q0, [x20, #-32]
	stp	x9, x11, [x20, #16]
	stp	x8, x10, [x20]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b	LBB0_616
LBB0_268:                               ; %OP261.JUMPDEST
	subs	x8, x27, #50
	stur	x8, [x28, #8]
	b.lo	LBB0_734
; %bb.269:                              ; %OP261.JUMPDEST.contd
	sub	x8, x12, #1021
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1020
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.lo	LBB0_101
; %bb.270:                              ; %OP262.PUSH1
	add	x21, x12, #1
	ldr	x25, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x25, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x23, sp, #32
	mov	sp, x23
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x23
	mov	x5, x17
	mov	x27, x17
	mov	x22, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.271:                              ; %OP263.MLOAD.contd
	ldp	x0, x1, [x23]
	ldp	x2, x3, [x23, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x22, x22, #2
	add	x24, x25, x21, lsl #5
	stp	x2, x3, [x24, #16]
	stp	x0, x1, [x24]
	mov	x23, x20
	ldp	x4, x5, [x23, #-32]!
	ldp	x6, x7, [x23, #16]
	add	x25, x25, x22, lsl #5
	stp	x6, x7, [x25, #16]
	stp	x4, x5, [x25]
	stp	x2, x3, [x23, #144]
	stp	x0, x1, [x23, #128]
	str	x27, [sp, #-16]!
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.eq	LBB0_255
	b	LBB0_593
LBB0_272:                               ; %OP280.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.273:                              ; %OP280.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_274:                               ; %OP281.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldr	x10, [x11, #96]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	ldr	x11, [x11, #104]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbnz	x8, LBB0_102
LBB0_275:                               ; %OP288.JUMPDEST
	subs	x27, x27, #109
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.276:                              ; %OP288.JUMPDEST.contd
	cmp	x12, #1017
	b.hi	LBB0_109
; %bb.277:                              ; %OP289.PUSH2
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #553                        ; =0x229
	str	x8, [x20]
	stur	q0, [x20, #40]
	mov	w21, #4                         ; =0x4
	stp	xzr, x21, [x20, #24]
	stur	q0, [x20, #72]
	stp	xzr, x21, [x20, #56]
	add	x23, x12, #4
	str	xzr, [x20, #120]
	stur	q0, [x20, #104]
	stp	xzr, x21, [x20, #88]
	ldp	x25, x26, [x11, #72]
	mov	w0, #4                          ; =0x4
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	stp	x0, x1, [x20, #32]
	ldr	x8, [x19, #144]                 ; 8-byte Folded Reload
	add	x22, x8, x23, lsl #5
	and	x8, x2, #0xffffffff
	stp	x8, xzr, [x20, #48]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #72]
	str	x21, [x20, #64]
	str	xzr, [x20, #120]
	stur	q0, [x20, #104]
	mov	w8, #36                         ; =0x24
	stp	xzr, x8, [x20, #88]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x8, [x22]
	mov	w0, #36                         ; =0x24
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	stp	x0, x1, [x20, #64]
	and	x8, x2, #0xffffffff
	stp	x8, xzr, [x20, #80]
	str	xzr, [x20, #120]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #104]
	str	x21, [x20, #96]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	mov	w8, #68                         ; =0x44
	str	x8, [x22]
	str	xzr, [x20, #184]
	stur	q0, [x20, #168]
	str	x8, [x20, #160]
	mov	w0, #68                         ; =0x44
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	mov	x12, x23
	str	xzr, [x20, #216]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #200]
	mov	w8, #32                         ; =0x20
	stp	x2, x3, [x20, #112]
	stp	x0, x1, [x20, #96]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	ldp	x17, x21, [x19, #136]           ; 16-byte Folded Reload
	stp	xzr, x8, [x20, #184]
	stur	q0, [x20, #168]
	mov	w8, #100                        ; =0x64
	str	x8, [x20, #160]
LBB0_278:                               ; %OP952.JUMPDEST
	subs	x8, x27, #113
	stur	x8, [x28, #8]
	b.lo	LBB0_552
; %bb.279:                              ; %OP952.JUMPDEST.contd
	sub	x8, x12, #1019
	cmp	x12, #3
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1016
	b.lo	LBB0_691
; %bb.280:                              ; %OP953.PUSH1
	add	x26, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x26]
	add	x10, x12, #1
	ldur	q1, [x26, #-32]
	ldp	x8, x9, [x26, #-16]
	str	x10, [x19, #152]                ; 8-byte Folded Spill
	add	x25, x21, x10, lsl #5
	stp	x8, x9, [x25, #16]
	str	q1, [x25]
	add	x10, x12, #3
	mov	w8, #3                          ; =0x3
	str	xzr, [x26, #88]
	stur	q0, [x26, #72]
	ldur	w20, [x26, #-80]
	mov	x9, x21
	ldp	x21, x24, [x26, #-96]
	stp	q0, q0, [x26, #160]
	str	x8, [x26, #64]!
	add	x11, x12, #4
	str	x10, [x19, #120]                ; 8-byte Folded Spill
	add	x22, x9, x10, lsl #5
	stp	q0, q0, [x22]
	add	x23, x9, x11, lsl #5
	stp	x21, x24, [x23]
	stp	x20, xzr, [x23, #16]
	ldr	x28, [x17, #40]
	ldr	x8, [x28, #16]
	ldr	x27, [x28, #48]
	sub	x8, x8, x27
	cmp	x8, #31
	b.ls	LBB0_352
LBB0_281:                               ; %OP964.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x27
	rev	x9, x20
	rev	x10, x24
	rev	x11, x21
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x24, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x28, x12, [x26]
	ldp	x20, x21, [x26, #16]
	stp	x24, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	x20, x21, [x22, #16]
	stp	x28, x12, [x22]
	stp	x24, x10, [x23]
	stp	x9, x8, [x23, #16]
	ldr	x23, [x17, #40]
	ldr	x11, [x23, #16]
	ldr	x27, [x23, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x24, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x24, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x27
	cmp	x1, x8
	b.hi	LBB0_353
LBB0_282:                               ; %OP969.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x27
	add	x8, x8, x24
	rev	x9, x21
	rev	x10, x20
	rev	x11, x12
	rev	x12, x28
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x26, #16]
	ldp	x11, x10, [x26]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x17
	mov	x1, x26
	mov	x20, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_369
; %bb.283:                              ; %OP973.SLOAD
	mov	x0, x20
	mov	x1, x26
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_369
; %bb.284:                              ; %OP974.LT
	ldp	x9, x8, [x25]
	ldr	x10, [x25, #56]
	ldr	x11, [x25, #40]
	ldr	x12, [x25, #24]
	ldr	d0, [x25, #16]
	mov.d	v0[1], x12
	fmov	x13, d0
	ldr	d0, [x25, #32]
	mov.d	v0[1], x11
	ldr	d1, [x25, #48]
	mov.d	v1[1], x10
	fmov	x14, d1
	fmov	x15, d0
	cmp	x15, x9
	sbcs	xzr, x11, x8
	sbcs	xzr, x14, x13
	sbcs	xzr, x10, x12
	cset	w8, hs
	stp	xzr, xzr, [x25, #16]
	stp	x8, xzr, [x25]
	ldur	x27, [x28, #8]
	b.lo	LBB0_346
; %bb.285:
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldp	x11, x13, [x19, #128]           ; 16-byte Folded Reload
	subs	x8, x27, #43
	stur	x8, [x28, #8]
	b.lo	LBB0_552
LBB0_286:                               ; %OP983.JUMPDEST.contd
	sub	x9, x12, #1022
	cmp	x12, #4
	mov	w10, #91                        ; =0x5b
	cinc	w0, w10, hs
	cmn	x9, #1018
	b.lo	LBB0_691
; %bb.287:                              ; %OP984.CALLER
	add	x14, x12, #1
	ldur	x9, [x11, #148]
	ldr	w10, [x11, #164]
	ldur	x11, [x11, #156]
	rev	x11, x11
	rev	x10, x10
	extr	x16, x11, x10, #32
	rev	x9, x9
	extr	x17, x9, x11, #32
	lsr	x0, x9, #32
	add	x24, x21, x12, lsl #5
	ldur	w28, [x24, #-112]
	ldp	x23, x26, [x24, #-128]
	add	x15, x12, #2
	add	x25, x21, x14, lsl #5
	add	x22, x21, x15, lsl #5
	mov	w9, #-1                         ; =0xffffffff
	stp	x9, xzr, [x22, #16]
	mov	x9, #-1                         ; =0xffffffffffffffff
	stp	x9, x9, [x22]
	eor	x9, x26, x17
	eor	x10, x23, x16
	eor	x11, x28, x0
	orr	x10, x10, x11
	stp	xzr, xzr, [x24, #16]
	stp	xzr, xzr, [x25, #16]
	orr	x9, x10, x9
	cmp	x9, #0
	cset	w10, eq
	cset	w11, ne
	stp	x11, xzr, [x24]
	stp	x10, xzr, [x25]
	cbz	x9, LBB0_299
; %bb.288:                              ; %OP996.POP
	sub	x9, x27, #212
	ldr	x10, [x19, #160]                ; 8-byte Folded Reload
	stur	x9, [x10, #8]
	cmp	x8, #169
	b.lo	LBB0_298
; %bb.289:                              ; %OP996.POP.contd
	cmp	x12, #1019
	b.hi	LBB0_375
; %bb.290:                              ; %OP996.POP.contd3550
	stp	x0, x17, [x19, #104]            ; 16-byte Folded Spill
	str	x16, [x19, #120]                ; 8-byte Folded Spill
	stp	x15, x14, [x19, #88]            ; 16-byte Folded Spill
	add	x12, x12, #3
	mov	x8, #-1                         ; =0xffffffffffffffff
	stp	x8, x8, [x24, #16]
	stp	x8, x8, [x24]
	str	xzr, [x25, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x25, #8]
	mov	w8, #4                          ; =0x4
	str	x8, [x25]
	stp	q0, q0, [x22]
	add	x27, x21, x12, lsl #5
	stp	x23, x26, [x27]
	stp	x28, xzr, [x27, #16]
	stp	q0, q0, [x24, #128]
	ldr	x20, [x13, #40]
	ldr	x8, [x20, #16]
	ldr	x21, [x20, #48]
	sub	x8, x8, x21
	cmp	x8, #31
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	b.ls	LBB0_377
LBB0_291:                               ; %OP1007.PUSH1
	ldr	x8, [x20, #8]
	add	x8, x8, x21
	rev	x9, x28
	rev	x10, x26
	rev	x11, x23
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x23, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x25]
	ldp	x20, x21, [x25, #16]
	stp	x23, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x20, x21, [x22, #16]
	stp	x14, x12, [x22]
	stp	x23, x10, [x27]
	stp	x9, x8, [x27, #16]
	ldr	x26, [x13, #40]
	ldr	x11, [x26, #16]
	ldr	x28, [x26, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x28
	cmp	x1, x8
	b.hi	LBB0_378
LBB0_292:                               ; %OP1012.PUSH1
	ldr	x8, [x26, #8]
	add	x8, x8, x28
	add	x8, x8, x23
	rev	x9, x21
	rev	x10, x20
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x13
	mov	x1, x25
	mov	x23, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_381
; %bb.293:                              ; %OP1016.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x22]
	ldp	x10, x11, [x19, #112]           ; 16-byte Folded Reload
	stp	x11, x10, [x27]
	ldr	x9, [x19, #104]                 ; 8-byte Folded Reload
	stp	x9, xzr, [x27, #16]
	stp	q0, q0, [x24, #128]
	ldr	x20, [x23, #40]
	ldr	x8, [x20, #16]
	ldr	x21, [x20, #48]
	sub	x8, x8, x21
	cmp	x8, #31
	mov	x13, x23
	b.ls	LBB0_379
LBB0_294:                               ; %OP1024.PUSH1
	ldr	x8, [x20, #8]
	add	x8, x8, x21
	rev	x9, x9
	rev	x10, x10
	rev	x11, x11
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x21, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x26, x12, [x25]
	ldp	x28, x20, [x25, #16]
	stp	x21, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x28, x20, [x22, #16]
	stp	x26, x12, [x22]
	stp	x21, x10, [x27]
	stp	x9, x8, [x27, #16]
	ldr	x27, [x13, #40]
	ldr	x11, [x27, #16]
	ldr	x23, [x27, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x21, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x21, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x23
	cmp	x1, x8
	b.hi	LBB0_380
LBB0_295:                               ; %OP1029.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x23
	add	x8, x8, x21
	rev	x9, x20
	rev	x10, x28
	rev	x11, x12
	rev	x12, x26
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x13
	mov	x1, x25
	mov	x20, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_381
; %bb.296:                              ; %OP1033.SLOAD
	mov	x0, x20
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_381
; %bb.297:                              ; %OP1034.EQ
	ldp	x9, x8, [x24]
	ldr	x10, [x24, #56]
	ldr	x11, [x24, #40]
	ldr	x12, [x24, #24]
	ldr	d0, [x24, #16]
	mov.d	v0[1], x12
	fmov	x13, d0
	ldr	d0, [x24, #32]
	mov.d	v0[1], x11
	ldr	d1, [x24, #48]
	mov.d	v1[1], x10
	fmov	x14, d1
	fmov	x15, d0
	cmp	x15, x9
	ccmp	x14, x13, #0, eq
	ccmp	x11, x8, #0, eq
	ccmp	x10, x12, #0, eq
	cset	w8, ne
	stp	xzr, xzr, [x24, #16]
	stp	x8, xzr, [x24]
	ldur	x27, [x28, #8]
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	ldr	x14, [x19, #96]                 ; 8-byte Folded Reload
	subs	x8, x27, #17
	stur	x8, [x28, #8]
	b.hs	LBB0_300
LBB0_298:
	mov	w0, #80                         ; =0x50
	b	LBB0_376
LBB0_299:
	mov	x27, x8
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	subs	x8, x8, #17
	stur	x8, [x28, #8]
	b.lo	LBB0_298
LBB0_300:                               ; %OP1036.JUMPDEST.contd
	sub	x9, x14, #1024
	cmp	x14, #0
	mov	w10, #91                        ; =0x5b
	cinc	w0, w10, ne
	cmn	x9, #1023
	b.lo	LBB0_376
; %bb.301:                              ; %OP1037.ISZERO
	sub	x9, x14, #1
	str	x9, [x19, #152]                 ; 8-byte Folded Spill
	add	x24, x21, x9, lsl #5
	ldp	x9, x10, [x24, #16]
	ldp	x11, x12, [x24]
	orr	x10, x12, x10
	orr	x9, x11, x9
	stp	xzr, xzr, [x24, #16]
	orr	x9, x9, x10
	cmp	x9, #0
	cset	w10, eq
	stp	x10, xzr, [x24]
	cbz	x9, LBB0_325
; %bb.302:                              ; %OP1040.DUP2
	sub	x9, x27, #203
	stur	x9, [x28, #8]
	cmp	x8, #186
	b.lo	LBB0_185
; %bb.303:                              ; %OP1040.DUP2.contd
	sub	x8, x14, #1021
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cmp	x12, #4
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1016
	b.lo	LBB0_691
; %bb.304:                              ; %OP1040.DUP2.contd3709
	add	x25, x21, x14, lsl #5
	ldur	q0, [x25, #-96]
	ldp	x8, x9, [x25, #-80]
	stp	x8, x9, [x24, #16]
	str	q0, [x24]
	add	x9, x14, #1
	str	xzr, [x25, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x25, #8]
	mov	w8, #4                          ; =0x4
	str	x8, [x25]
	add	x10, x14, #2
	stp	x10, x9, [x19, #112]            ; 16-byte Folded Spill
	add	x20, x21, x9, lsl #5
	stp	q0, q0, [x20]
	mov	x8, x21
	ldur	w21, [x25, #-144]
	ldp	x23, x26, [x25, #-160]
	add	x22, x8, x10, lsl #5
	stp	x23, x26, [x22]
	stp	x21, xzr, [x22, #16]
	stp	q0, q0, [x25, #96]
	ldr	x27, [x13, #40]
	ldr	x8, [x27, #16]
	ldr	x28, [x27, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	b.ls	LBB0_364
LBB0_305:                               ; %OP1050.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	rev	x9, x21
	rev	x10, x26
	rev	x11, x23
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x26, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x25]
	ldp	x23, x21, [x25, #16]
	stp	x26, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x23, x21, [x20, #16]
	stp	x14, x12, [x20]
	stp	x26, x10, [x22]
	stp	x9, x8, [x22, #16]
	ldr	x27, [x13, #40]
	ldr	x11, [x27, #16]
	ldr	x28, [x27, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x26, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x26, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x28
	cmp	x1, x8
	b.hi	LBB0_365
LBB0_306:                               ; %OP1055.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	add	x8, x8, x26
	rev	x9, x21
	rev	x10, x23
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x13
	mov	x1, x25
	mov	x21, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_369
; %bb.307:                              ; %OP1059.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	ldur	x8, [x10, #148]
	ldr	w9, [x10, #164]
	ldur	x10, [x10, #156]
	rev	x10, x10
	rev	x9, x9
	extr	x11, x10, x9, #32
	rev	x8, x8
	extr	x23, x8, x10, #32
	lsr	x26, x8, #32
	stp	x26, xzr, [x22, #16]
	stp	x11, x23, [x22]
	stp	q0, q0, [x25, #96]
	ldr	x27, [x21, #40]
	ldr	x8, [x27, #16]
	ldr	x28, [x27, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	mov	x13, x21
	b.ls	LBB0_366
LBB0_308:                               ; %OP1067.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	rev	x9, x26
	rev	x10, x23
	rev	x11, x11
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x23, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x27, x12, [x25]
	ldp	x28, x21, [x25, #16]
	stp	x23, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x28, x21, [x20, #16]
	stp	x27, x12, [x20]
	stp	x23, x10, [x22]
	stp	x9, x8, [x22, #16]
	ldr	x22, [x13, #40]
	ldr	x11, [x22, #16]
	ldr	x26, [x22, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x26
	cmp	x1, x8
	b.hi	LBB0_368
LBB0_309:                               ; %OP1072.PUSH1
	ldr	x8, [x22, #8]
	add	x8, x8, x26
	add	x8, x8, x23
	rev	x9, x21
	rev	x10, x28
	rev	x11, x12
	rev	x12, x27
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x13
	mov	x1, x25
	mov	x20, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_369
; %bb.310:                              ; %OP1076.SLOAD
	mov	x0, x20
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_369
; %bb.311:                              ; %OP1077.LT
	ldp	x9, x8, [x24]
	ldr	x10, [x24, #56]
	ldr	x11, [x24, #40]
	ldr	x12, [x24, #24]
	ldr	d0, [x24, #16]
	mov.d	v0[1], x12
	fmov	x13, d0
	ldr	d0, [x24, #32]
	mov.d	v0[1], x11
	ldr	d1, [x24, #48]
	mov.d	v1[1], x10
	fmov	x14, d1
	fmov	x15, d0
	cmp	x15, x9
	sbcs	xzr, x11, x8
	sbcs	xzr, x14, x13
	sbcs	xzr, x10, x12
	cset	w8, hs
	stp	xzr, xzr, [x24, #16]
	stp	x8, xzr, [x24]
	ldur	x27, [x28, #8]
	b.lo	LBB0_348
; %bb.312:
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
LBB0_313:                               ; %OP1086.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #187
	stur	x8, [x28, #8]
	b.lo	LBB0_552
; %bb.314:                              ; %OP1086.JUMPDEST.contd
	sub	x8, x12, #1020
	cmp	x12, #4
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1016
	b.lo	LBB0_691
; %bb.315:                              ; %OP1087.DUP2
	mov	x10, x21
	add	x21, x21, x12, lsl #5
	ldur	q0, [x21, #-64]
	add	x11, x12, #1
	ldp	x8, x9, [x21, #-48]
	stp	x8, x9, [x21, #16]
	str	q0, [x21]
	add	x9, x12, #2
	stp	x9, x11, [x19, #104]            ; 16-byte Folded Spill
	add	x25, x10, x11, lsl #5
	str	xzr, [x25, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x25, #8]
	mov	w8, #4                          ; =0x4
	str	x8, [x25]
	add	x8, x12, #3
	add	x22, x10, x9, lsl #5
	stp	q0, q0, [x22]
	ldur	w20, [x21, #-112]
	ldp	x24, x26, [x21, #-128]
	str	x8, [x19, #88]                  ; 8-byte Folded Spill
	add	x23, x10, x8, lsl #5
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x8, x12, #5
	str	x8, [x19, #96]                  ; 8-byte Folded Spill
	mov	x8, x21
	str	q0, [x8, #128]!
	str	x8, [x19, #120]                 ; 8-byte Folded Spill
	stp	x24, x26, [x23]
	stp	x20, xzr, [x23, #16]
	str	q0, [x21, #144]
	ldr	x27, [x13, #40]
	ldr	x8, [x27, #16]
	ldr	x28, [x27, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	b.ls	LBB0_370
LBB0_316:                               ; %OP1097.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	rev	x9, x20
	rev	x10, x26
	rev	x11, x24
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x28, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x25]
	ldp	x26, x27, [x25, #16]
	stp	x28, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x26, x27, [x22, #16]
	stp	x14, x12, [x22]
	stp	x28, x10, [x23]
	stp	x9, x8, [x23, #16]
	ldr	x20, [x13, #40]
	ldr	x11, [x20, #16]
	ldr	x24, [x20, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x28, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x28, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x24
	cmp	x1, x8
	b.hi	LBB0_371
LBB0_317:                               ; %OP1102.PUSH1
	ldr	x8, [x20, #8]
	add	x8, x8, x24
	add	x8, x8, x28
	rev	x9, x27
	rev	x10, x26
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x13
	mov	x1, x25
	mov	x20, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_374
; %bb.318:                              ; %OP1106.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x22]
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	ldur	x8, [x10, #148]
	ldr	w9, [x10, #164]
	ldur	x10, [x10, #156]
	rev	x10, x10
	rev	x9, x9
	extr	x11, x10, x9, #32
	rev	x8, x8
	extr	x24, x8, x10, #32
	lsr	x26, x8, #32
	stp	x26, xzr, [x23, #16]
	stp	x11, x24, [x23]
	ldr	x8, [x19, #120]                 ; 8-byte Folded Reload
	stp	q0, q0, [x8]
	ldr	x27, [x20, #40]
	ldr	x8, [x27, #16]
	ldr	x28, [x27, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	mov	x13, x20
	b.ls	LBB0_372
LBB0_319:                               ; %OP1114.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	rev	x9, x26
	rev	x10, x24
	rev	x11, x11
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x27, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x25]
	ldp	x28, x26, [x25, #16]
	stp	x27, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x28, x26, [x22, #16]
	stp	x14, x12, [x22]
	stp	x27, x10, [x23]
	stp	x9, x8, [x23, #16]
	ldr	x20, [x13, #40]
	ldr	x11, [x20, #16]
	ldr	x24, [x20, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x27, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x27, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x24
	cmp	x1, x8
	b.hi	LBB0_373
LBB0_320:                               ; %OP1119.PUSH1
	ldr	x8, [x20, #8]
	add	x8, x8, x24
	add	x8, x8, x27
	rev	x9, x26
	rev	x10, x28
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x13
	mov	x1, x25
	mov	x20, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_374
; %bb.321:                              ; %OP1123.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x22]
	ldr	q0, [x21]
	ldp	x8, x9, [x21, #16]
	stp	x8, x9, [x23, #16]
	str	q0, [x23]
	ldr	q0, [x25]
	ldp	x8, x9, [x25, #16]
	stp	x8, x9, [x21, #144]
	str	q0, [x21, #128]
	mov	x0, x20
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_350
; %bb.322:                              ; %OP1127.SUB
	ldp	x9, x8, [x21, #144]
	ldp	x11, x10, [x21, #128]
	ldp	x13, x12, [x23, #16]
	ldp	x15, x14, [x23]
	subs	x11, x11, x15
	sbcs	x10, x10, x14
	sbcs	x9, x9, x13
	sbc	x8, x8, x12
	ldr	q0, [x21]
	ldp	x13, x12, [x21, #16]
	stp	x11, x10, [x21]
	stp	x9, x8, [x21, #16]
	stp	x13, x12, [x23, #16]
	str	q0, [x23]
	ldr	q0, [x25]
	ldp	x12, x13, [x25, #16]
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x12, x13, [x22, #16]
	str	q0, [x22]
	mov	x0, x20
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sstore
	tst	w0, #0xff
	b.ne	LBB0_367
; %bb.323:                              ; %OP1134.POP
	ldur	x8, [x28, #8]
	subs	x27, x8, #2
	stur	x27, [x28, #8]
	ldp	x13, x21, [x19, #136]           ; 16-byte Folded Reload
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.hs	LBB0_326
; %bb.324:
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	b	LBB0_552
LBB0_325:
	mov	x27, x8
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_326:                               ; %OP1135.JUMPDEST
	subs	x8, x27, #110
	stur	x8, [x28, #8]
	b.lo	LBB0_552
; %bb.327:                              ; %OP1135.JUMPDEST.contd
	sub	x8, x12, #1020
	subs	x9, x12, #4
	str	x9, [x19, #104]                 ; 8-byte Folded Spill
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1016
	b.lo	LBB0_691
; %bb.328:                              ; %OP1136.DUP2
	add	x25, x21, x12, lsl #5
	ldur	q0, [x25, #-64]
	add	x10, x12, #1
	ldp	x8, x9, [x25, #-48]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	add	x9, x12, #2
	stp	x9, x10, [x19, #88]             ; 16-byte Folded Spill
	add	x27, x21, x10, lsl #5
	str	xzr, [x27, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x27, #8]
	mov	w8, #3                          ; =0x3
	str	x8, [x27]
	add	x10, x12, #3
	add	x20, x21, x9, lsl #5
	stp	q0, q0, [x20]
	mov	x8, x21
	ldur	w21, [x25, #-112]
	ldp	x22, x23, [x25, #-128]
	str	x10, [x19, #80]                 ; 8-byte Folded Spill
	add	x24, x8, x10, lsl #5
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x9, x12, #5
	mov	x8, x25
	str	q0, [x8, #128]!
	stp	x9, x8, [x19, #112]             ; 16-byte Folded Spill
	stp	x22, x23, [x24]
	stp	x21, xzr, [x24, #16]
	str	q0, [x25, #144]
	ldr	x26, [x13, #40]
	ldr	x8, [x26, #16]
	ldr	x28, [x26, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	b.ls	LBB0_354
LBB0_329:                               ; %OP1146.PUSH1
	ldr	x8, [x26, #8]
	add	x8, x8, x28
	rev	x9, x21
	rev	x10, x23
	rev	x11, x22
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x23, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x27]
	ldp	x21, x22, [x27, #16]
	stp	x23, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x21, x22, [x20, #16]
	stp	x14, x12, [x20]
	stp	x23, x10, [x24]
	stp	x9, x8, [x24, #16]
	ldr	x26, [x13, #40]
	ldr	x11, [x26, #16]
	ldr	x28, [x26, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x28
	cmp	x1, x8
	b.hi	LBB0_355
LBB0_330:                               ; %OP1151.PUSH1
	ldr	x8, [x26, #8]
	add	x8, x8, x28
	add	x8, x8, x23
	rev	x9, x22
	rev	x10, x21
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x27, #16]
	ldp	x11, x10, [x27]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x13
	mov	x1, x27
	mov	x21, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_381
; %bb.331:                              ; %OP1155.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	q0, [x25]
	ldp	x8, x9, [x25, #16]
	stp	x8, x9, [x24, #16]
	str	q0, [x24]
	ldr	q0, [x27]
	ldp	x8, x9, [x27, #16]
	stp	x8, x9, [x25, #144]
	str	q0, [x25, #128]
	mov	x0, x21
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x22, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_367
; %bb.332:                              ; %OP1159.SUB
	ldp	x9, x8, [x25, #144]
	ldp	x11, x10, [x25, #128]
	ldp	x13, x12, [x24, #16]
	ldp	x15, x14, [x24]
	subs	x11, x11, x15
	sbcs	x10, x10, x14
	sbcs	x9, x9, x13
	sbc	x8, x8, x12
	ldr	q0, [x25]
	ldp	x13, x12, [x25, #16]
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x13, x12, [x24, #16]
	str	q0, [x24]
	ldr	q0, [x27]
	ldp	x12, x13, [x27, #16]
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x12, x13, [x20, #16]
	str	q0, [x20]
	mov	x0, x21
	mov	x1, x27
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sstore
	tst	w0, #0xff
	b.ne	LBB0_350
; %bb.333:                              ; %OP1166.POP
	ldur	x8, [x22, #8]
	subs	x8, x8, #111
	stur	x8, [x22, #8]
	b.lo	LBB0_351
; %bb.334:                              ; %OP1166.POP.contd4168
	ldur	q0, [x25, #-64]
	ldp	x8, x9, [x25, #-48]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	str	xzr, [x27, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x27, #8]
	mov	w8, #3                          ; =0x3
	str	x8, [x27]
	stp	q0, q0, [x20]
	ldur	w21, [x25, #-80]
	ldp	x22, x23, [x25, #-96]
	stp	x22, x23, [x24]
	stp	x21, xzr, [x24, #16]
	stp	q0, q0, [x25, #128]
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	ldr	x26, [x13, #40]
	ldr	x8, [x26, #16]
	ldr	x28, [x26, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	b.ls	LBB0_356
LBB0_335:                               ; %OP1177.PUSH1
	ldr	x8, [x26, #8]
	add	x8, x8, x28
	rev	x9, x21
	rev	x10, x23
	rev	x11, x22
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x21, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x14, x12, [x27]
	ldp	x28, x22, [x27, #16]
	stp	x21, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x28, x22, [x20, #16]
	stp	x14, x12, [x20]
	stp	x21, x10, [x24]
	stp	x9, x8, [x24, #16]
	ldr	x23, [x13, #40]
	ldr	x11, [x23, #16]
	ldr	x26, [x23, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x21, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x21, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x26
	cmp	x1, x8
	b.hi	LBB0_358
LBB0_336:                               ; %OP1182.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x26
	add	x8, x8, x21
	rev	x9, x22
	rev	x10, x28
	rev	x11, x12
	rev	x12, x14
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x27, #16]
	ldp	x11, x10, [x27]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x13
	mov	x1, x27
	mov	x21, x13
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_381
; %bb.337:                              ; %OP1186.PUSH1
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	q0, [x25]
	ldp	x8, x9, [x25, #16]
	stp	x8, x9, [x24, #16]
	str	q0, [x24]
	ldr	q0, [x27]
	ldp	x8, x9, [x27, #16]
	stp	x8, x9, [x25, #144]
	str	q0, [x25, #128]
	mov	x0, x21
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x22, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_367
; %bb.338:                              ; %OP1190.ADD
	ldp	x9, x8, [x25, #144]
	ldp	x11, x10, [x25, #128]
	ldp	x13, x12, [x24, #16]
	ldp	x15, x14, [x24]
	adds	x11, x15, x11
	adcs	x10, x14, x10
	adcs	x9, x13, x9
	adc	x8, x12, x8
	ldr	q0, [x25]
	ldp	x13, x12, [x25, #16]
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x13, x12, [x24, #16]
	str	q0, [x24]
	ldr	q0, [x27]
	ldp	x12, x13, [x27, #16]
	stp	x11, x10, [x27]
	stp	x9, x8, [x27, #16]
	stp	x12, x13, [x20, #16]
	str	q0, [x20]
	mov	x0, x21
	mov	x1, x27
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sstore
	tst	w0, #0xff
	b.ne	LBB0_350
; %bb.339:                              ; %OP1197.POP
	ldur	x8, [x22, #8]
	subs	x8, x8, #1603
	stur	x8, [x22, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_351
; %bb.340:                              ; %OP1197.POP.contd
	sub	x8, x12, #1017
	cmp	x12, #5
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1012
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	b.lo	LBB0_350
; %bb.341:                              ; %OP1197.POP.contd4278
	ldur	w8, [x25, #-80]
	ldp	x9, x10, [x25, #-96]
	stp	x9, x10, [x25]
	stp	x8, xzr, [x25, #16]
	ldur	w8, [x25, #-112]
	ldp	x9, x10, [x25, #-128]
	stp	x9, x10, [x27]
	stp	x8, xzr, [x27, #16]
	mov	x8, #51355                      ; =0xc89b
	movk	x8, #7138, lsl #16
	movk	x8, #21165, lsl #32
	movk	x8, #56818, lsl #48
	mov	x9, #36266                      ; =0x8daa
	movk	x9, #64567, lsl #16
	movk	x9, #45160, lsl #32
	movk	x9, #27074, lsl #48
	stp	x9, x8, [x20, #16]
	mov	x8, #41238                      ; =0xa116
	movk	x8, #25540, lsl #16
	movk	x8, #42993, lsl #32
	movk	x8, #38187, lsl #48
	mov	x9, #46063                      ; =0xb3ef
	movk	x9, #62755, lsl #16
	movk	x9, #23117, lsl #32
	movk	x9, #10485, lsl #48
	stp	x9, x8, [x20]
	ldp	x13, x14, [x25, #-64]
	ldp	x23, x27, [x25, #-48]
	stp	x23, x27, [x24, #16]
	stp	x13, x14, [x24]
	stp	xzr, xzr, [x25, #144]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x25, #128]
	ldr	x20, [x16, #40]
	ldr	x8, [x20, #16]
	ldr	x21, [x20, #48]
	sub	x8, x8, x21
	mov	x28, x20
	cmp	x8, #95
	b.ls	LBB0_359
LBB0_342:                               ; %OP1207.MLOAD.contd
	ldr	x8, [x20, #8]
	add	x8, x8, x21
	ldp	x10, x9, [x8, #64]
	ldp	x8, x11, [x8, #80]
	rev	x8, x8
	rev	x21, x11
	rev	x10, x10
	rev	x9, x9
	stp	x9, x10, [x25, #144]
	stp	x21, x8, [x25, #128]
	add	x15, x12, #6
	ldr	x11, [x19, #144]                ; 8-byte Folded Reload
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	add	x20, x11, x12, lsl #5
	stp	x9, x10, [x20, #16]
	stp	x21, x8, [x20]
	add	x26, x11, x15, lsl #5
	stp	x23, x27, [x26, #16]
	stp	x13, x14, [x26]
	stp	x9, x10, [x25, #240]
	stp	x21, x8, [x25, #224]
	ldr	x11, [x28, #16]
	ldr	x22, [x28, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x21, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x21, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x22
	cmp	x1, x8
	b.hi	LBB0_361
LBB0_343:                               ; %OP1212.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x22
	add	x8, x8, x21
	rev	x9, x27
	rev	x10, x23
	rev	x11, x14
	rev	x12, x13
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x26, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x26]
	ldp	x9, x8, [x20, #16]
	ldp	x11, x10, [x20]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldr	q0, [x24]
	ldp	x13, x12, [x24, #16]
	stp	x11, x10, [x24]
	stp	x9, x8, [x24, #16]
	stp	x13, x12, [x20, #16]
	str	q0, [x20]
	ldr	x13, [x19, #120]                ; 8-byte Folded Reload
	stp	xzr, xzr, [x13, #16]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x13]
	ldr	x21, [x16, #40]
	ldr	x12, [x21, #16]
	ldr	x22, [x21, #48]
	sub	x12, x12, x22
	cmp	x12, #95
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ls	LBB0_362
LBB0_344:                               ; %OP1218.MLOAD.contd
	ldr	x12, [x21, #8]
	add	x12, x12, x22
	ldp	x14, x13, [x12, #80]
	ldp	x12, x15, [x12, #64]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x9, x8, [x20, #16]
	stp	x11, x10, [x20]
	subs	x11, x11, x13
	sbcs	x10, x10, x14
	sbcs	x9, x9, x15
	sbc	x8, x8, x12
	stp	x11, x10, [x24]
	stp	x9, x8, [x24, #16]
	stp	x15, x12, [x25, #144]
	stp	x13, x14, [x25, #128]
	mov	x0, x16
	mov	x1, x25
	mov	w2, #3                          ; =0x3
	bl	___revmc_builtin_log
	tst	w0, #0xff
	b.ne	LBB0_187
; %bb.345:                              ; %OP1224.PUSH1
	ldur	q0, [x25, #-32]
	ldp	x8, x9, [x25, #-16]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	ldp	x8, x10, [x25, #-160]
	ldp	x9, x11, [x25, #-144]
	stp	xzr, xzr, [x25, #-144]
	mov	w12, #1                         ; =0x1
	stp	x12, xzr, [x25, #-160]
	ldur	q0, [x25, #-128]
	ldp	x13, x12, [x25, #-112]
	stp	x9, x11, [x25, #-112]
	stp	x8, x10, [x25, #-128]
	stp	x13, x12, [x25, #-16]
	ldr	x12, [x19, #104]                ; 8-byte Folded Reload
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	stur	q0, [x25, #-32]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b	LBB0_616
LBB0_346:                               ; %OP980.PUSH1
	subs	x8, x27, #6
	stur	x8, [x28, #8]
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b.lo	LBB0_382
; %bb.347:                              ; %OP980.PUSH1.contd3492
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x25]
	stp	q0, q0, [x26]
	mov	w20, #16                        ; =0x10
	mov	x1, x25
	mov	w2, #16                         ; =0x10
	bl	___revmc_builtin_do_return
	tst	w0, #0xff
	csel	w0, w20, w0, eq
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b	LBB0_691
LBB0_348:                               ; %OP1083.PUSH1
	subs	x8, x27, #6
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.349:                              ; %OP1083.PUSH1.contd3870
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x24]
	sub	x1, x25, #32
	stp	q0, q0, [x25]
	mov	w20, #16                        ; =0x10
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b	LBB0_400
LBB0_350:
	ldr	x12, [x19, #96]                 ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_351:
	ldr	x12, [x19, #96]                 ; 8-byte Folded Reload
	b	LBB0_552
LBB0_352:                               ; %resize.i7870
	mov	x0, x17
	mov	w1, #32                         ; =0x20
	str	x11, [x19, #112]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_281
	b	LBB0_691
LBB0_353:                               ; %resize.i7885
	mov	x0, x17
	str	x12, [x19, #112]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_282
	b	LBB0_369
LBB0_354:                               ; %resize.i8080
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_329
	b	LBB0_357
LBB0_355:                               ; %resize.i8095
	mov	x0, x13
	stp	x14, x12, [x19, #64]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #64]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_330
	b	LBB0_381
LBB0_356:                               ; %resize.i8110
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_335
LBB0_357:
	ldr	x12, [x19, #80]                 ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_358:                               ; %resize.i8125
	mov	x0, x13
	stp	x14, x12, [x19, #72]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #72]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_336
	b	LBB0_381
LBB0_359:                               ; %resize.i8141
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	mov	x22, x16
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_367
; %bb.360:                              ; %resize.i8141.OP1207.MLOAD.contd_crit_edge
	ldp	x23, x27, [x24, #16]
	ldp	x13, x14, [x24]
	ldr	x28, [x22, #40]
	mov	x16, x22
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b	LBB0_342
LBB0_361:                               ; %resize.i8156
	mov	x0, x16
	stp	x14, x13, [x19, #88]            ; 16-byte Folded Spill
	str	x15, [x19, #80]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x12, x14, [x19, #80]            ; 16-byte Folded Reload
	ldr	x13, [x19, #96]                 ; 8-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_343
	b	LBB0_691
LBB0_362:                               ; %resize.i8172
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_367
; %bb.363:                              ; %resize.i8172.OP1218.MLOAD.contd_crit_edge
	ldp	x9, x8, [x24, #16]
	ldp	x11, x10, [x24]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	b	LBB0_344
LBB0_364:                               ; %resize.i7960
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_305
	b	LBB0_367
LBB0_365:                               ; %resize.i7975
	mov	x0, x13
	stp	x14, x12, [x19, #96]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #96]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_306
	b	LBB0_369
LBB0_366:                               ; %resize.i7990
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	mov	x21, x11
	bl	___revmc_builtin_resize_memory
	mov	x11, x21
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_308
LBB0_367:
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_368:                               ; %resize.i8005
	mov	x0, x13
	str	x12, [x19, #112]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_309
LBB0_369:
	ldr	x12, [x19, #120]                ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_370:                               ; %resize.i8020
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_316
	b	LBB0_381
LBB0_371:                               ; %resize.i8035
	mov	x0, x13
	stp	x14, x12, [x19, #72]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #72]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_317
	b	LBB0_374
LBB0_372:                               ; %resize.i8050
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	mov	x20, x11
	bl	___revmc_builtin_resize_memory
	mov	x11, x20
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_319
	b	LBB0_381
LBB0_373:                               ; %resize.i8065
	mov	x0, x13
	stp	x14, x12, [x19, #80]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #80]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_320
LBB0_374:
	ldr	x12, [x19, #104]                ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_375:
	mov	w0, #92                         ; =0x5c
LBB0_376:
	mov	x12, x14
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_377:                               ; %resize.i7900
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_291
	b	LBB0_691
LBB0_378:                               ; %resize.i7915
	mov	x0, x13
	stp	x14, x12, [x19, #72]            ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x12, [x19, #72]            ; 16-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_292
	b	LBB0_381
LBB0_379:                               ; %resize.i7930
	mov	x0, x13
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldp	x9, x10, [x19, #104]            ; 16-byte Folded Reload
	ldr	x11, [x19, #120]                ; 8-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_294
	b	LBB0_187
LBB0_380:                               ; %resize.i7945
	mov	x0, x13
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_295
LBB0_381:
	ldr	x12, [x19, #88]                 ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_382:
	mov	w0, #80                         ; =0x50
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_383:                               ; %OP347.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.384:                              ; %OP347.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_385:                               ; %OP348.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldp	x10, x11, [x11, #96]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbnz	x8, LBB0_102
	b	LBB0_387
LBB0_386:                               ; %OP355.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_387:                               ; %OP355.JUMPDEST
	subs	x27, x27, #49
	stur	x27, [x28, #8]
	ldr	x9, [x19, #128]                 ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.388:                              ; %OP355.JUMPDEST.contd
	cmp	x12, #1019
	b.hi	LBB0_109
; %bb.389:                              ; %OP356.PUSH2
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #612                        ; =0x264
	str	x8, [x20]
	add	x12, x12, #2
	str	xzr, [x20, #56]
	stur	q0, [x20, #40]
	mov	x8, x21
	mov	w21, #4                         ; =0x4
	stp	xzr, x21, [x20, #24]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x22, x8, x12, lsl #5
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	str	xzr, [x20, #120]
	stur	q0, [x20, #104]
	str	x21, [x20, #96]
	ldp	x4, x5, [x9, #72]
	mov	w0, #4                          ; =0x4
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	l___revmc_ir_builtin_calldataload
	str	xzr, [x20, #152]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #136]
	mov	w8, #32                         ; =0x20
	stp	x2, x3, [x20, #48]
	stp	x0, x1, [x20, #32]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	stp	xzr, x8, [x20, #120]
	stur	q0, [x20, #104]
	mov	w8, #36                         ; =0x24
	str	x8, [x20, #96]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
LBB0_390:                               ; %OP1233.JUMPDEST
	subs	x8, x27, #109
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.391:                              ; %OP1233.JUMPDEST.contd
	ldp	x10, x12, [x19, #144]           ; 16-byte Folded Reload
	sub	x8, x12, #1020
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1019
	b.lo	LBB0_691
; %bb.392:                              ; %OP1234.DUP1
	add	x25, x10, x12, lsl #5
	ldur	q0, [x25, #-32]
	ldp	x8, x9, [x25, #-16]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	add	x9, x12, #2
	mov	w8, #3                          ; =0x3
	mov	x26, x25
	str	x8, [x26, #32]!
	str	xzr, [x25, #56]
	movi.2d	v0, #0000000000000000
	stur	q0, [x25, #40]
	add	x12, x12, #3
	mov	x11, x10
	str	x9, [x19, #120]                 ; 8-byte Folded Spill
	add	x21, x10, x9, lsl #5
	stp	q0, q0, [x21]
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	ldur	x8, [x10, #148]
	ldr	w9, [x10, #164]
	ldur	x10, [x10, #156]
	rev	x10, x10
	rev	x9, x9
	extr	x23, x10, x9, #32
	rev	x8, x8
	extr	x24, x8, x10, #32
	lsr	x27, x8, #32
	add	x22, x11, x12, lsl #5
	stp	x27, xzr, [x22, #16]
	stp	x23, x24, [x22]
	stp	q0, q0, [x25, #128]
	ldr	x28, [x17, #40]
	ldr	x8, [x28, #16]
	ldr	x20, [x28, #48]
	sub	x8, x8, x20
	cmp	x8, #31
	b.ls	LBB0_401
LBB0_393:                               ; %OP1244.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x20
	rev	x9, x27
	rev	x10, x24
	rev	x11, x23
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x21, #16]
	ldp	x11, x10, [x21]
	adds	x23, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x27, x12, [x26]
	ldp	x20, x28, [x26, #16]
	stp	x23, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	x20, x28, [x21, #16]
	stp	x27, x12, [x21]
	stp	x23, x10, [x22]
	stp	x9, x8, [x22, #16]
	ldr	x22, [x17, #40]
	ldr	x11, [x22, #16]
	ldr	x24, [x22, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x24
	cmp	x1, x8
	b.hi	LBB0_402
LBB0_394:                               ; %OP1249.PUSH1
	ldr	x8, [x22, #8]
	add	x8, x8, x24
	add	x8, x8, x23
	rev	x9, x28
	rev	x10, x20
	rev	x11, x12
	rev	x12, x27
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x26, #16]
	ldp	x11, x10, [x26]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x26]
	stp	x9, x8, [x26, #16]
	stp	xzr, xzr, [x21, #16]
	stp	xzr, xzr, [x21]
	mov	x0, x17
	mov	x1, x26
	mov	x20, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_522
; %bb.395:                              ; %OP1253.SLOAD
	mov	x0, x20
	mov	x1, x26
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_522
; %bb.396:                              ; %OP1254.LT
	ldp	x9, x8, [x25]
	ldr	x10, [x25, #56]
	ldr	x11, [x25, #40]
	ldr	x12, [x25, #24]
	ldr	d0, [x25, #16]
	mov.d	v0[1], x12
	fmov	x13, d0
	ldr	d0, [x25, #32]
	mov.d	v0[1], x11
	ldr	d1, [x25, #48]
	mov.d	v1[1], x10
	fmov	x14, d1
	fmov	x15, d0
	cmp	x15, x9
	sbcs	xzr, x11, x8
	sbcs	xzr, x14, x13
	sbcs	xzr, x10, x12
	cset	w8, hs
	stp	xzr, xzr, [x25, #16]
	stp	x8, xzr, [x25]
	ldur	x27, [x28, #8]
	b.lo	LBB0_398
; %bb.397:
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b	LBB0_403
LBB0_398:                               ; %OP1260.PUSH1
	subs	x8, x27, #6
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.399:                              ; %OP1260.PUSH1.contd4502
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x25, #32]
	stp	q0, q0, [x25]
	mov	w20, #16                        ; =0x10
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	mov	x1, x25
LBB0_400:                               ; %return
	mov	w2, #16                         ; =0x10
	bl	___revmc_builtin_do_return
	tst	w0, #0xff
	csel	w0, w20, w0, eq
	b	LBB0_187
LBB0_401:                               ; %resize.i8187
	mov	x0, x17
	mov	w1, #32                         ; =0x20
	str	x12, [x19, #112]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_393
	b	LBB0_691
LBB0_402:                               ; %resize.i8202
	mov	x0, x17
	str	x12, [x19, #112]                ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_394
	b	LBB0_522
LBB0_403:                               ; %OP1263.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	subs	x8, x27, #109
	stur	x8, [x28, #8]
	b.lo	LBB0_734
; %bb.404:                              ; %OP1263.JUMPDEST.contd
	sub	x8, x12, #1020
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1019
	b.lo	LBB0_691
; %bb.405:                              ; %OP1264.DUP1
	add	x11, x12, #1
	add	x20, x21, x12, lsl #5
	ldur	q0, [x20, #-32]
	ldp	x8, x9, [x20, #-16]
	stp	x8, x9, [x20, #16]
	str	q0, [x20]
	add	x9, x12, #2
	stp	x11, x9, [x19, #88]             ; 16-byte Folded Spill
	add	x25, x21, x11, lsl #5
	str	xzr, [x25, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x25, #8]
	mov	w8, #3                          ; =0x3
	str	x8, [x25]
	add	x23, x12, #3
	add	x22, x21, x9, lsl #5
	stp	q0, q0, [x22]
	add	x11, x12, #4
	ldr	w8, [x10, #164]
	ldur	x9, [x10, #156]
	rev	x9, x9
	rev	x8, x8
	extr	x28, x9, x8, #32
	ldur	x8, [x10, #148]
	rev	x8, x8
	extr	x10, x8, x9, #32
	lsr	x9, x8, #32
	mov	x8, x21
	add	x21, x21, x23, lsl #5
	stp	x11, x10, [x19, #104]           ; 16-byte Folded Spill
	add	x24, x8, x11, lsl #5
	stp	x9, xzr, [x21, #16]
	stp	x28, x10, [x21]
	stp	q0, q0, [x24]
	ldr	x26, [x17, #40]
	ldr	x8, [x26, #16]
	ldr	x27, [x26, #48]
	sub	x8, x8, x27
	cmp	x8, #31
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	str	x9, [x19, #120]                 ; 8-byte Folded Spill
	b.ls	LBB0_416
LBB0_406:                               ; %OP1274.PUSH1
	ldr	x8, [x26, #8]
	add	x8, x8, x27
	rev	x9, x9
	rev	x10, x10
	str	x28, [x19, #128]                ; 8-byte Folded Spill
	rev	x11, x28
	stp	x10, x11, [x8, #16]
	stp	xzr, x9, [x8]
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	adds	x28, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldp	x13, x12, [x25]
	ldp	x26, x14, [x25, #16]
	stp	x28, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x26, x14, [x22, #16]
	stp	x13, x12, [x22]
	stp	x28, x10, [x21]
	stp	x9, x8, [x21, #16]
	ldr	x27, [x17, #40]
	ldr	x11, [x27, #16]
	ldr	x23, [x27, #48]
	cmp	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x8
	add	x8, x28, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x28, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x23
	cmp	x1, x8
	b.hi	LBB0_417
LBB0_407:                               ; %OP1279.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x23
	add	x8, x8, x28
	rev	x9, x14
	rev	x10, x26
	rev	x11, x12
	rev	x12, x13
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	xzr, xzr, [x22, #16]
	stp	xzr, xzr, [x22]
	mov	x0, x17
	mov	x1, x25
	mov	x23, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_418
; %bb.408:                              ; %OP1283.PUSH1
	ldr	x8, [x19, #152]                 ; 8-byte Folded Reload
	add	x8, x8, #5
	str	x8, [x19, #96]                  ; 8-byte Folded Spill
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x22]
	ldr	q0, [x20]
	ldp	x8, x9, [x20, #16]
	stp	x8, x9, [x21, #16]
	str	q0, [x21]
	ldr	q0, [x25]
	ldp	x8, x9, [x25, #16]
	stp	x8, x9, [x24, #16]
	str	q0, [x24]
	mov	x0, x23
	mov	x1, x24
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	ldr	x27, [x19, #160]                ; 8-byte Folded Reload
	ldr	x28, [x19, #128]                ; 8-byte Folded Reload
	b.ne	LBB0_419
; %bb.409:                              ; %OP1287.SUB
	ldp	x9, x8, [x24, #16]
	ldp	x11, x10, [x24]
	ldp	x13, x12, [x21, #16]
	ldp	x15, x14, [x21]
	subs	x11, x11, x15
	sbcs	x10, x10, x14
	sbcs	x9, x9, x13
	sbc	x8, x8, x12
	ldr	q0, [x20]
	ldp	x13, x12, [x20, #16]
	stp	x11, x10, [x20]
	stp	x9, x8, [x20, #16]
	stp	x13, x12, [x21, #16]
	str	q0, [x21]
	ldr	q0, [x25]
	ldp	x12, x13, [x25, #16]
	stp	x11, x10, [x25]
	stp	x9, x8, [x25, #16]
	stp	x12, x13, [x22, #16]
	str	q0, [x22]
	mov	x0, x23
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sstore
	tst	w0, #0xff
	b.ne	LBB0_420
; %bb.410:                              ; %OP1294.POP
	ldur	x8, [x27, #8]
	subs	x8, x8, #69
	stur	x8, [x27, #8]
	ldr	x8, [x19, #152]                 ; 8-byte Folded Reload
	ldp	x10, x9, [x19, #112]            ; 16-byte Folded Reload
	b.lo	LBB0_421
; %bb.411:                              ; %OP1294.POP.contd
	cmp	x8, #1013
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b.hi	LBB0_422
; %bb.412:                              ; %OP1294.POP.contd4622
	stp	x28, x10, [x20]
	stp	x9, xzr, [x20, #16]
	ldp	x8, x9, [x20, #-16]
	ldp	x10, x11, [x20, #-32]
	orr	x12, x11, x9
	orr	x13, x10, x8
	orr	x12, x13, x12
	mov	w13, #2300                      ; =0x8fc
	cmp	x12, #0
	csel	x12, x13, xzr, eq
	stp	xzr, xzr, [x25, #16]
	stp	x12, xzr, [x25]
	stp	x8, x9, [x22, #16]
	stp	x10, x11, [x22]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x21]
	ldr	x23, [x0, #40]
	ldr	x8, [x23, #16]
	ldr	x25, [x23, #48]
	sub	x8, x8, x25
	mov	x22, x23
	cmp	x8, #95
	b.ls	LBB0_423
LBB0_413:                               ; %OP1306.MLOAD.contd
	ldr	x8, [x23, #8]
	add	x8, x8, x25
	ldp	x12, x10, [x8, #64]
	ldp	x8, x11, [x8, #80]
	rev	x9, x8
	rev	x11, x11
	rev	x8, x12
	rev	x10, x10
	stp	x10, x8, [x21, #16]
	stp	x11, x9, [x21]
	stp	xzr, xzr, [x24, #16]
	stp	xzr, xzr, [x24]
	ldp	x12, x13, [x19, #144]           ; 16-byte Folded Reload
	add	x21, x13, #6
	ldr	x13, [x19, #96]                 ; 8-byte Folded Reload
	add	x23, x12, x13, lsl #5
	stp	xzr, xzr, [x23, #16]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x23]
	ldr	x12, [x22, #16]
	ldr	x24, [x22, #48]
	sub	x12, x12, x24
	cmp	x12, #95
	b.ls	LBB0_426
LBB0_414:                               ; %OP1309.MLOAD.contd
	ldr	x12, [x22, #8]
	add	x12, x12, x24
	ldp	x14, x13, [x12, #64]
	ldp	x12, x15, [x12, #80]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x13, x14, [x23, #16]
	stp	x15, x12, [x23]
	ldr	x16, [x19, #144]                ; 8-byte Folded Reload
	add	x16, x16, x21, lsl #5
	subs	x11, x11, x15
	sbcs	x9, x9, x12
	sbcs	x10, x10, x13
	sbc	x8, x8, x14
	stp	x11, x9, [x16]
	stp	x10, x8, [x16, #16]
	stp	x13, x14, [x20, #240]
	stp	x15, x12, [x20, #224]
	ldr	q0, [x20, #64]
	ldp	x9, x8, [x20, #80]
	stp	x9, x8, [x20, #272]
	str	q0, [x20, #256]
	ldp	q0, q1, [x20]
	stp	q0, q1, [x20, #288]
	ldr	q0, [x20, #32]
	ldp	x9, x8, [x20, #48]
	stp	x9, x8, [x20, #336]
	str	q0, [x20, #320]
	add	x1, x20, #128
	mov	w2, #19                         ; =0x13
	mov	w3, #0                          ; =0x0
	mov	x20, x0
	bl	___revmc_builtin_call
	tst	w0, #0xff
	b.ne	LBB0_425
; %bb.415:                              ; %suspend
Lloh0:
	adrp	x8, lCPI0_0@PAGE
Lloh1:
	ldr	x8, [x8, lCPI0_0@PAGEOFF]
	str	x8, [x20, #32]
	ldr	x12, [x19, #104]                ; 8-byte Folded Reload
	mov	w0, #32                         ; =0x20
	b	LBB0_101
LBB0_416:                               ; %resize.i8217
	mov	x0, x17
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldp	x10, x9, [x19, #112]            ; 16-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_406
	b	LBB0_534
LBB0_417:                               ; %resize.i8232
	mov	x0, x17
	stp	x13, x12, [x19, #72]            ; 16-byte Folded Spill
	str	x14, [x19, #64]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x14, x13, [x19, #64]            ; 16-byte Folded Reload
	ldr	x12, [x19, #80]                 ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_407
LBB0_418:
	ldr	x12, [x19, #96]                 ; 8-byte Folded Reload
	b	LBB0_691
LBB0_419:
	ldr	x12, [x19, #96]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_420:
	ldr	x12, [x19, #88]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_421:
	ldr	x12, [x19, #88]                 ; 8-byte Folded Reload
	mov	w0, #80                         ; =0x50
	b	LBB0_101
LBB0_422:
	ldr	x12, [x19, #88]                 ; 8-byte Folded Reload
	mov	w0, #92                         ; =0x5c
	b	LBB0_101
LBB0_423:                               ; %resize.i8248
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_425
; %bb.424:                              ; %resize.i8248.OP1306.MLOAD.contd_crit_edge
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	ldr	x22, [x0, #40]
	b	LBB0_413
LBB0_425:
	ldr	x12, [x19, #104]                ; 8-byte Folded Reload
	b	LBB0_101
LBB0_426:                               ; %resize.i8264
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.427:                              ; %resize.i8264.OP1309.MLOAD.contd_crit_edge
	ldp	x10, x8, [x20, #112]
	ldp	x11, x9, [x20, #96]
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b	LBB0_414
LBB0_428:                               ; %OP373.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_185
; %bb.429:                              ; %OP373.JUMPDEST.contd
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_430:                               ; %OP374.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldp	x10, x11, [x11, #96]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_432
	b	LBB0_102
LBB0_431:                               ; %OP381.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_432:                               ; %OP381.JUMPDEST
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.433:                              ; %OP381.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
; %bb.434:                              ; %OP382.PUSH2
	add	x8, x12, #1
	add	x9, x21, x12, lsl #5
	stp	xzr, xzr, [x9, #16]
	mov	w10, #633                       ; =0x279
	stp	x10, xzr, [x9]
	subs	x9, x27, #51
	stur	x9, [x28, #8]
	b.lo	LBB0_719
LBB0_435:                               ; %OP1356.JUMPDEST.contd
	sub	x9, x8, #1022
	cmp	x8, #0
	mov	w10, #91                        ; =0x5b
	cinc	w0, w10, ne
	cmn	x9, #1021
	b.lo	LBB0_445
; %bb.436:                              ; %OP1357.PUSH1
	add	x9, x8, #1
	add	x20, x21, x8, lsl #5
	mov	x23, x21
	add	x21, x8, #2
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	str	x9, [x19, #152]                 ; 8-byte Folded Spill
	add	x25, x23, x9, lsl #5
	stp	xzr, xzr, [x25, #16]
	mov	w8, #2                          ; =0x2
	stp	x8, xzr, [x25]
	mov	x0, x17
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	mov	x22, x17
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_524
; %bb.437:                              ; %OP1361.SWAP1
	ldr	q0, [x25]
	ldp	x9, x8, [x25, #16]
	ldr	q1, [x20]
	ldp	x11, x10, [x20, #16]
	stp	x9, x8, [x20, #16]
	str	q0, [x20]
	stp	x11, x10, [x25, #16]
	str	q1, [x25]
	add	x8, x23, x21, lsl #5
	stp	xzr, xzr, [x8, #16]
	mov	w9, #256                        ; =0x100
	stp	x9, xzr, [x8]
	mov	x0, x22
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_exp
	tst	w0, #0xff
	b.ne	LBB0_524
; %bb.438:                              ; %OP1364.SWAP1_udiv-special-cases
	ldp	x9, x8, [x25]
	ldp	x11, x10, [x25, #16]
	ldp	x6, x3, [x20]
	ldp	x7, x4, [x20, #16]
	orr	x12, x8, x10
	orr	x13, x9, x11
	orr	x12, x13, x12
	cmp	x12, #0
	orr	x12, x3, x4
	orr	x13, x6, x7
	orr	x12, x13, x12
	ccmp	x12, #0, #4, ne
	cset	w12, eq
	clz	x13, x10
	clz	x14, x11
	add	x14, x14, #64
	cmp	x10, #0
	csel	x13, x13, x14, ne
	clz	x14, x8
	clz	x15, x9
	add	x15, x15, #64
	cmp	x8, #0
	csel	x14, x14, x15, ne
	add	x14, x14, #128
	orr	x15, x11, x10
	cmp	x15, #0
	csel	x13, x13, x14, ne
	clz	x14, x4
	clz	x15, x7
	add	x15, x15, #64
	cmp	x4, #0
	csel	x14, x14, x15, ne
	clz	x15, x3
	clz	x16, x6
	add	x16, x16, #64
	cmp	x3, #0
	csel	x15, x15, x16, ne
	add	x15, x15, #128
	orr	x16, x7, x4
	cmp	x16, #0
	csel	x14, x14, x15, ne
	subs	x17, x13, x14
	ngcs	x14, xzr
	ngcs	x15, xzr
	ngc	x16, xzr
	mov	w13, #255                       ; =0xff
	cmp	x13, x17
	ngcs	xzr, x14
	ngcs	xzr, x15
	ngcs	xzr, x16
	csinc	w13, w12, wzr, hs
	cmp	w13, #0
	csel	x12, xzr, x6, ne
	tbnz	w13, #0, LBB0_444
; %bb.439:                              ; %OP1364.SWAP1_udiv-special-cases
	eor	x13, x17, #0xff
	orr	x13, x13, x15
	orr	x0, x14, x16
	orr	x13, x13, x0
	cbz	x13, LBB0_444
; %bb.440:                              ; %udiv-bb19562
	adds	x12, x17, #1
	adcs	x14, x14, xzr
	adcs	x15, x15, xzr
	cinc	x16, x16, hs
	movi.2d	v0, #0000000000000000
	add	x13, x19, #121
	stur	q0, [x13, #255]
	add	x13, x19, #105
	stur	q0, [x13, #255]
	stp	x6, x3, [x19, #392]
	stp	x7, x4, [x19, #408]
	mov	w0, #255                        ; =0xff
	sub	x17, x0, x17
	and	x2, x17, #0x7
	ubfx	x17, x17, #3, #5
	add	x0, x19, #360
	add	x0, x0, #32
	sub	x0, x0, x17
	ldr	x21, [x0]
	lsl	x17, x21, x2
	orr	x1, x14, x16
	orr	x5, x12, x15
	mov	x13, #0                         ; =0x0
	orr	x1, x5, x1
	cbz	x1, LBB0_443
; %bb.441:                              ; %udiv-preheader9561
	mov	x5, #0                          ; =0x0
	ldp	x22, x1, [x0, #16]
	lsl	x1, x1, x2
	ldr	x23, [x0, #8]
	lsr	x0, x22, #1
	mvn	w24, w2
	lsr	x0, x0, x24
	orr	x0, x1, x0
	lsl	x1, x22, x2
	lsr	x22, x23, #1
	lsr	x22, x22, x24
	orr	x1, x1, x22
	lsl	x2, x23, x2
	lsr	x21, x21, #1
	lsr	x21, x21, x24
	orr	x2, x2, x21
	add	x21, x19, #89
	stur	q0, [x21, #255]
	add	x21, x19, #73
	stur	q0, [x21, #255]
	stp	x6, x3, [x19, #296]
	stp	x7, x4, [x19, #312]
	and	x21, x12, #0x7
	mvn	w3, w21
	ubfx	x4, x12, #3, #5
	add	x6, x19, #296
	add	x4, x6, x4
	ldp	x6, x26, [x4, #16]
	lsl	x7, x26, #1
	lsl	x7, x7, x3
	lsr	x22, x6, x21
	orr	x22, x7, x22
	lsl	x6, x6, #1
	lsl	x6, x6, x3
	ldp	x4, x7, [x4]
	lsr	x23, x7, x21
	orr	x23, x23, x6
	lsl	x6, x7, #1
	lsl	x3, x6, x3
	lsr	x4, x4, x21
	orr	x24, x3, x4
	subs	x3, x9, #1
	mov	x4, #-1                         ; =0xffffffffffffffff
	adcs	x6, x8, x4
	adcs	x7, x11, x4
	lsr	x26, x26, x21
	adc	x21, x10, x4
LBB0_442:                               ; %udiv-do-while9560
                                        ; =>This Inner Loop Header: Depth=1
	extr	x26, x26, x22, #63
	extr	x22, x22, x23, #63
	extr	x23, x23, x24, #63
	extr	x24, x24, x0, #63
	extr	x0, x0, x1, #63
	extr	x1, x1, x2, #63
	extr	x2, x2, x17, #63
	orr	x17, x13, x17, lsl #1
	orr	x2, x5, x2
	orr	x1, x5, x1
	orr	x0, x5, x0
	cmp	x3, x24
	sbcs	xzr, x6, x23
	sbcs	xzr, x7, x22
	sbc	x13, x21, x26
	asr	x5, x13, #63
	and	x13, x5, #0x1
	and	x27, x5, x10
	and	x28, x5, x11
	and	x30, x5, x8
	and	x5, x5, x9
	subs	x24, x24, x5
	sbcs	x23, x23, x30
	sbcs	x22, x22, x28
	sbc	x26, x26, x27
	subs	x12, x12, #1
	adcs	x14, x14, x4
	adcs	x15, x15, x4
	adc	x16, x16, x4
	orr	x27, x14, x16
	orr	x28, x12, x15
	mov	x5, #0                          ; =0x0
	orr	x27, x28, x27
	cbnz	x27, LBB0_442
LBB0_443:                               ; %udiv-loop-exit9559
	orr	x12, x13, x17, lsl #1
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
LBB0_444:                               ; %udiv-end9558
	and	x8, x12, #0xff
	stp	xzr, xzr, [x20, #16]
	stp	x8, xzr, [x20]
	ldp	x8, x10, [x20, #-32]
	ldp	x9, x11, [x20, #-16]
	b	LBB0_464
LBB0_445:
	mov	x12, x8
	b	LBB0_691
LBB0_446:                               ; %OP385.JUMPDEST
	subs	x8, x27, #62
	stur	x8, [x28, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.447:                              ; %OP385.JUMPDEST.contd
	sub	x8, x12, #1021
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1020
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.lo	LBB0_101
; %bb.448:                              ; %OP386.PUSH1
	add	x21, x12, #1
	ldr	x25, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x25, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x23, sp, #32
	mov	sp, x23
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x23
	mov	x5, x17
	mov	x27, x17
	mov	x22, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.449:                              ; %OP387.MLOAD.contd
	ldp	x0, x1, [x23]
	ldp	x2, x3, [x23, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x22, x22, #2
	add	x24, x25, x21, lsl #5
	stp	x2, x3, [x24, #16]
	stp	x0, x1, [x24]
	mov	x23, x20
	ldrb	w4, [x23, #-32]!
	add	x25, x25, x22, lsl #5
	b	LBB0_254
LBB0_450:                               ; %OP408.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.451:                              ; %OP408.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_452:                               ; %OP409.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldr	x10, [x11, #96]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	ldr	x11, [x11, #104]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_454
	b	LBB0_102
LBB0_453:                               ; %OP416.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
LBB0_454:                               ; %OP416.JUMPDEST
	subs	x27, x27, #55
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.455:                              ; %OP416.JUMPDEST.contd
	cmp	x12, #1019
	b.hi	LBB0_109
; %bb.456:                              ; %OP417.PUSH2
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #716                        ; =0x2cc
	str	x8, [x20]
	add	x12, x12, #2
	str	xzr, [x20, #56]
	stur	q0, [x20, #40]
	mov	x8, x21
	mov	w21, #4                         ; =0x4
	stp	xzr, x21, [x20, #24]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x22, x8, x12, lsl #5
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	str	xzr, [x20, #120]
	stur	q0, [x20, #104]
	str	x21, [x20, #96]
	ldp	x4, x5, [x11, #72]
	mov	w0, #4                          ; =0x4
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	l___revmc_ir_builtin_calldataload
	str	xzr, [x20, #152]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #136]
	and	x8, x2, #0xffffffff
	mov	w9, #32                         ; =0x20
	stp	x0, x1, [x20, #32]
	stp	x8, xzr, [x20, #48]
	str	xzr, [x22, #24]
	stur	q0, [x22, #8]
	str	x21, [x22]
	stp	xzr, x9, [x20, #120]
	stur	q0, [x20, #104]
	mov	w8, #36                         ; =0x24
	str	x8, [x20, #96]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
LBB0_457:                               ; %OP1370.JUMPDEST
	subs	x8, x27, #79
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.458:                              ; %OP1370.JUMPDEST.contd
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	sub	x8, x12, #1023
	cmp	x12, #2
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1021
	ldr	x9, [x19, #144]                 ; 8-byte Folded Reload
	b.lo	LBB0_691
; %bb.459:                              ; %OP1371.PUSH1
	add	x10, x12, #1
	add	x25, x9, x12, lsl #5
	stp	xzr, xzr, [x25, #16]
	mov	w8, #3                          ; =0x3
	stp	x8, xzr, [x25]
	str	x10, [x19, #120]                ; 8-byte Folded Spill
	add	x21, x9, x10, lsl #5
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	ldr	x22, [x17, #40]
	ldr	x8, [x22, #16]
	ldr	x23, [x22, #48]
	sub	x8, x8, x23
	cmp	x8, #63
	b.ls	LBB0_465
LBB0_460:                               ; %OP1374.DUP1
	ldr	x8, [x22, #8]
	add	x8, x8, x23
	mov	x9, #216172782113783808         ; =0x300000000000000
	stp	xzr, x9, [x8, #48]
	stp	xzr, xzr, [x8, #32]
	mov	x26, x25
	ldr	x22, [x26, #-32]!
	ldp	x23, x24, [x25, #-16]
	ldur	x27, [x25, #-24]
	stp	x22, x27, [x25]
	stp	x23, x24, [x25, #16]
	stp	xzr, xzr, [x21]
	stp	xzr, xzr, [x21, #16]
	ldr	x28, [x17, #40]
	ldr	x8, [x28, #16]
	ldr	x20, [x28, #48]
	sub	x8, x8, x20
	cmp	x8, #31
	b.ls	LBB0_466
LBB0_461:                               ; %OP1377.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x20
	rev	x9, x24
	rev	x10, x23
	rev	x11, x27
	rev	x12, x22
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x25, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x25]
	stp	xzr, xzr, [x21, #16]
	stp	xzr, xzr, [x21]
	mov	x0, x17
	mov	x1, x25
	mov	x20, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_522
; %bb.462:                              ; %OP1380.PUSH1
	ldur	q0, [x25, #-32]
	ldp	x8, x9, [x25, #-16]
	stp	x8, x9, [x21, #16]
	str	q0, [x21]
	ldr	q0, [x25]
	ldp	x9, x8, [x25, #16]
	stp	x9, x8, [x25, #-16]
	stur	q0, [x25, #-32]
	stp	xzr, xzr, [x25, #16]
	stp	xzr, xzr, [x25]
	mov	x0, x20
	mov	x1, x26
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_187
; %bb.463:                              ; %OP1386.DUP2
	ldp	x8, x10, [x25, #-64]
	ldp	x9, x11, [x25, #-48]
LBB0_464:                               ; %dynamic_jump_table.preheader
	stp	x9, x11, [x25, #16]
	stp	x8, x10, [x25]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b	LBB0_616
LBB0_465:                               ; %resize.i8326
	mov	x0, x17
	mov	w1, #64                         ; =0x40
	bl	___revmc_builtin_resize_memory
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_460
	b	LBB0_691
LBB0_466:                               ; %resize.i8340
	mov	x0, x17
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_461
	b	LBB0_187
LBB0_467:                               ; %OP453.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_185
; %bb.468:                              ; %OP453.JUMPDEST.contd
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cmp	x12, #1022
	b.hi	LBB0_109
LBB0_469:                               ; %OP454.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldp	x10, x11, [x11, #96]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_471
	b	LBB0_102
LBB0_470:                               ; %OP461.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_471:                               ; %OP461.JUMPDEST
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.472:                              ; %OP461.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_109
; %bb.473:                              ; %OP462.PUSH2
	add	x8, x21, x12, lsl #5
	add	x12, x12, #1
	stp	xzr, xzr, [x8, #16]
	mov	w10, #757                       ; =0x2f5
	stp	x10, xzr, [x8]
	subs	x8, x27, #194
	stur	x8, [x28, #8]
	b.lo	LBB0_734
LBB0_474:                               ; %OP1388.JUMPDEST.contd
	cmp	x12, #1015
	b.hi	LBB0_109
; %bb.475:                              ; %OP1389.PUSH1
	add	x20, x21, x12, lsl #5
	str	xzr, [x20, #24]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #1                          ; =0x1
	str	x8, [x20]
	mov	x26, x21
	add	x21, x12, #2
	mov	x25, x20
	str	x8, [x25, #32]!
	str	xzr, [x20, #56]
	stur	q0, [x20, #40]
	mov	x0, x17
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	mov	x24, x17
	mov	x22, x12
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_524
; %bb.476:                              ; %OP1392.PUSH1
	add	x1, x22, #3
	add	x23, x26, x21, lsl #5
	str	x22, [x19, #152]                ; 8-byte Folded Spill
	add	x2, x22, #4
	ldp	x9, x8, [x25, #16]
	ldp	x11, x10, [x25]
	add	x17, x26, x1, lsl #5
	add	x21, x26, x2, lsl #5
	mov	w12, #-1                        ; =0xffffffff
	eor	w12, w12, w11, lsl #8
	and	x12, x12, #0x100
	subs	x12, x12, #1
	mov	x13, #-1                        ; =0xffffffffffffffff
	adcs	x14, xzr, x13
	adcs	x15, xzr, x13
	adc	x13, xzr, x13
	and	x10, x14, x10
	and	x9, x15, x9
	and	x8, x13, x8
	extr	x13, x8, x9, #1
	extr	x9, x9, x10, #1
	and	x11, x12, x11
	extr	x10, x10, x11, #1
	lsr	x8, x8, #1
	stp	x10, x9, [x25]
	stp	x13, x8, [x25, #16]
	adds	x10, x10, #31
	adcs	x9, x9, xzr
	adcs	x12, x13, xzr
	cinc	x8, x8, hs
	stp	x10, x9, [x21]
	stp	x12, x8, [x21, #16]
	and	x10, x10, #0xffffffffffffffe0
	adds	x11, x10, #32
	adcs	x10, x9, xzr
	adcs	x9, x12, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x23]
	stp	x9, x8, [x23, #16]
	stp	xzr, xzr, [x17, #16]
	mov	w12, #64                        ; =0x40
	stp	x12, xzr, [x17]
	ldr	x22, [x24, #40]
	ldr	x12, [x22, #16]
	ldr	x26, [x22, #48]
	sub	x12, x12, x26
	mov	x3, x22
	cmp	x12, #95
	mov	x16, x24
	b.ls	LBB0_512
LBB0_477:                               ; %OP1415.MLOAD.contd
	ldr	x12, [x22, #8]
	add	x12, x12, x26
	ldp	x14, x13, [x12, #64]
	ldp	x12, x15, [x12, #80]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	stp	x13, x14, [x23, #16]
	stp	x15, x12, [x23]
	adds	x22, x11, x15
	adcs	x26, x10, x12
	adcs	x28, x9, x13
	adc	x24, x8, x14
	stp	x22, x26, [x17]
	stp	x28, x24, [x17, #16]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x21]
	ldr	x8, [x3, #16]
	ldr	x27, [x3, #48]
	sub	x8, x8, x27
	cmp	x8, #95
	str	x17, [x19, #112]                ; 8-byte Folded Spill
	b.ls	LBB0_514
LBB0_478:                               ; %OP1421.DUP1
	ldr	x8, [x3, #8]
	add	x8, x8, x27
	rev	x9, x24
	rev	x10, x28
	rev	x11, x26
	rev	x12, x22
	stp	x11, x12, [x8, #80]
	stp	x9, x10, [x8, #64]
	ldp	x27, x8, [x23]
	ldp	x10, x9, [x23, #16]
	ldr	q0, [x20]
	ldp	x12, x11, [x20, #16]
	stp	x10, x9, [x20, #16]
	stp	x27, x8, [x20]
	mov	x1, x20
	str	x27, [x1, #160]!
	ldp	x24, x22, [x1, #-128]
	ldp	x13, x26, [x1, #-112]
	stp	x12, x11, [x1, #-112]
	stur	q0, [x1, #-128]
	stp	x13, x26, [x23, #16]
	stp	x24, x22, [x23]
	stp	x10, x9, [x17, #16]
	stp	x27, x8, [x17]
	stp	x13, x26, [x21, #16]
	stp	x24, x22, [x21]
	ldr	x11, [x19, #152]                ; 8-byte Folded Reload
	add	x11, x11, #6
	str	x11, [x19, #120]                ; 8-byte Folded Spill
	stp	x10, x9, [x1, #16]
	cmp	xzr, x8
	str	x8, [x1, #8]
	ldr	x23, [x16, #40]
	ngcs	xzr, x10
	ngcs	xzr, x9
	add	x8, x27, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ldr	x10, [x23, #16]
	ldr	x28, [x23, #48]
	ccmp	x27, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x8, x8, xzr, eq
	sub	x9, x10, x28
	cmp	x8, x9
	b.hi	LBB0_515
LBB0_479:                               ; %OP1428.PUSH1
	ldr	x8, [x23, #8]
	add	x8, x8, x28
	add	x8, x8, x27
	rev	x9, x26
	rev	x10, x22
	rev	x11, x24
	stp	x10, x11, [x8, #16]
	rev	x10, x13
	stp	x9, x10, [x8]
	ldp	x9, x8, [x17, #16]
	ldp	x11, x10, [x17]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x17]
	stp	x9, x8, [x17, #16]
	ldp	x9, x8, [x25]
	ldp	x11, x10, [x25, #16]
	stp	x11, x10, [x21, #16]
	stp	x9, x8, [x21]
	stp	x11, x10, [x1, #16]
	stp	x9, x8, [x1]
	mov	x0, x16
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_522
; %bb.480:                              ; %OP1433.PUSH1
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x16, [x19, #120]                ; 8-byte Folded Reload
	add	x25, x21, x16, lsl #5
	ldp	x10, x11, [x20, #176]
	ldp	x8, x9, [x20, #160]
	add	x1, x20, #256
	str	xzr, [x20, #280]
	movi.2d	v0, #0000000000000000
	stur	q0, [x1, #8]
	mov	w12, #256                       ; =0x100
	mov	w13, #-1                        ; =0xffffffff
	eor	w13, w13, w8, lsl #8
	and	x13, x13, #0x100
	stp	xzr, x12, [x20, #248]
	stur	q0, [x20, #232]
	str	x13, [x20, #224]
	subs	x12, x13, #1
	mov	x13, #-1                        ; =0xffffffffffffffff
	adcs	x14, xzr, x13
	adcs	x15, xzr, x13
	adc	x13, xzr, x13
	and	x8, x12, x8
	and	x9, x14, x9
	and	x10, x15, x10
	and	x11, x13, x11
	extr	x12, x11, x10, #1
	extr	x13, x10, x9, #1
	extr	x14, x9, x8, #1
	lsr	x15, x11, #1
	stp	x14, x13, [x20, #160]
	stp	x12, x15, [x20, #176]
	cmp	x8, #2
	sbcs	xzr, x9, xzr
	sbcs	xzr, x10, xzr
	sbcs	xzr, x11, xzr
	cset	w12, lo
	str	xzr, [x25, #24]
	stur	q0, [x25, #8]
	str	x12, [x25]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldur	x12, [x28, #8]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b.hs	LBB0_482
; %bb.481:
	mov	x27, x12
	subs	x8, x12, #22
	stur	x8, [x28, #8]
	b.hs	LBB0_509
	b	LBB0_736
LBB0_482:                               ; %OP1449.DUP1
	subs	x27, x12, #22
	stur	x27, [x28, #8]
	b.lo	LBB0_736
; %bb.483:                              ; %OP1449.DUP1.contd5191
	stp	xzr, xzr, [x20, #240]
	mov	w13, #31                        ; =0x1f
	stp	x13, xzr, [x20, #224]
	mov	w13, #63                        ; =0x3f
	cmp	x13, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	ngcs	xzr, x11
	cset	w8, lo
	stp	xzr, xzr, [x25, #16]
	stp	x8, xzr, [x25]
	b.hs	LBB0_498
; %bb.484:
	mov	x12, x16
	subs	x8, x27, #58
	stur	x8, [x28, #8]
	b.lo	LBB0_734
LBB0_485:                               ; %OP1468.JUMPDEST.contd
	sub	x8, x12, #1024
	cmp	x12, #3
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1021
	b.lo	LBB0_691
; %bb.486:                              ; %OP1469.DUP3
	add	x20, x21, x12, lsl #5
	ldp	x9, x8, [x20, #-80]
	ldp	x11, x10, [x20, #-96]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	sub	x22, x12, #1
	add	x21, x21, x22, lsl #5
	ldp	x13, x12, [x21, #16]
	ldp	x15, x14, [x21]
	adds	x15, x15, x11
	adcs	x14, x14, x10
	adcs	x13, x13, x9
	adc	x12, x12, x8
	mov	x1, x20
	ldp	x23, x24, [x20, #-64]
	str	x23, [x1, #-32]!
	stp	x15, x14, [x20, #-96]
	stp	x13, x12, [x20, #-80]
	ldp	x26, x25, [x20, #-48]
	stp	x9, x8, [x20, #-48]
	stp	x11, x10, [x20, #-64]
	stp	x26, x25, [x20, #-16]
	stur	x24, [x20, #-24]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20]
	ldr	x27, [x17, #40]
	ldr	x8, [x27, #16]
	ldr	x28, [x27, #48]
	sub	x8, x8, x28
	cmp	x8, #31
	b.ls	LBB0_519
LBB0_487:                               ; %OP1475.PUSH1
	ldr	x8, [x27, #8]
	add	x8, x8, x28
	rev	x9, x25
	rev	x10, x26
	rev	x11, x24
	rev	x12, x23
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	stp	xzr, xzr, [x20, #16]
	stp	xzr, xzr, [x20]
	mov	x0, x17
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_187
; %bb.488:                              ; %OP1478.SWAP1
	ldp	q0, q1, [x20, #-32]
	ldur	q2, [x20, #-64]
	ldp	x9, x8, [x20, #-48]
	stp	q0, q1, [x20, #-64]
	stp	x9, x8, [x20, #-16]
	stur	q2, [x20, #-32]
	ldp	x17, x21, [x19, #136]           ; 16-byte Folded Reload
	ldp	x12, x28, [x19, #152]           ; 16-byte Folded Reload
LBB0_489:                               ; %OP1479.JUMPDEST.preheader
	sub	x8, x12, #1023
	cmn	x8, #1020
	b.lo	LBB0_516
; %bb.490:
	add	x8, x12, #1
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	add	x25, x21, x12, lsl #5
	str	x8, [x19, #120]                 ; 8-byte Folded Spill
	add	x21, x21, x8, lsl #5
LBB0_491:                               ; %OP1479.JUMPDEST
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x28, #8]
	subs	x8, x8, #50
	stur	x8, [x28, #8]
	b.lo	LBB0_185
; %bb.492:                              ; %OP1479.JUMPDEST.contd
                                        ;   in Loop: Header=BB0_491 Depth=1
	ldur	q0, [x25, #-64]
	ldp	x8, x9, [x25, #-48]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	mov	x0, x17
	mov	x1, x25
	mov	w2, #19                         ; =0x13
	mov	x24, x17
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_522
; %bb.493:                              ; %OP1482.DUP2
                                        ;   in Loop: Header=BB0_491 Depth=1
	ldp	x23, x8, [x25, #-32]
	ldp	x9, x10, [x25, #-16]
	stp	x9, x10, [x21, #16]
	stp	x23, x8, [x21]
	ldp	x26, x12, [x25, #16]
	ldp	x28, x27, [x25]
	ldr	x20, [x24, #40]
	ldr	x11, [x20, #16]
	ldr	x22, [x20, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x23, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x23, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x22
	cmp	x1, x8
	mov	x17, x24
	b.hi	LBB0_495
LBB0_494:                               ; %OP1484.SWAP1
                                        ;   in Loop: Header=BB0_491 Depth=1
	ldr	x8, [x20, #8]
	add	x8, x8, x22
	add	x8, x8, x23
	rev	x9, x12
	rev	x10, x26
	rev	x11, x27
	rev	x12, x28
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x10, x9, [x25, #-16]
	ldp	x8, x11, [x25, #-32]
	ldp	x13, x12, [x25, #-48]
	ldp	x15, x14, [x25, #-64]
	adds	x15, x15, #1
	adcs	x14, x14, xzr
	adcs	x13, x13, xzr
	cinc	x12, x12, hs
	stp	x15, x14, [x25, #-64]
	stp	x13, x12, [x25, #-48]
	adds	x13, x8, #32
	adcs	x14, x11, xzr
	adcs	x15, x10, xzr
	cinc	x16, x9, hs
	stp	x13, x14, [x25, #-32]
	stp	x15, x16, [x25, #-16]
	ldp	x11, x9, [x25, #-96]
	ldp	x12, x10, [x25, #-80]
	stp	x12, x10, [x21, #16]
	stp	x11, x9, [x21]
	cmp	x13, x11
	sbcs	xzr, x14, x9
	sbcs	xzr, x15, x12
	sbcs	xzr, x16, x10
	cset	w13, lo
	stp	xzr, xzr, [x25, #16]
	stp	x13, xzr, [x25]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.lo	LBB0_491
	b	LBB0_496
LBB0_495:                               ; %resize.i8430
                                        ;   in Loop: Header=BB0_491 Depth=1
	mov	x0, x17
	mov	x24, x12
	bl	___revmc_builtin_resize_memory
	mov	x12, x24
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_494
	b	LBB0_187
LBB0_496:                               ; %OP1495.DUP3
	ldur	x13, [x28, #8]
	subs	x27, x13, #24
	stur	x27, [x28, #8]
	b.lo	LBB0_185
; %bb.497:                              ; %OP1495.DUP3.contd5364
	sub	w8, w8, w11
	and	x8, x8, #0x1f
	stp	x11, x9, [x25]
	stp	x12, x10, [x25, #16]
	adds	x8, x8, x11
	adcs	x13, x9, xzr
	adcs	x14, x12, xzr
	cinc	x15, x10, hs
	stp	x8, x13, [x25, #-96]
	stp	x14, x15, [x25, #-80]
	stp	x11, x9, [x25, #-32]
	stp	x12, x10, [x25, #-16]
	ldp	x21, x16, [x19, #144]           ; 16-byte Folded Reload
	subs	x8, x27, #22
	stur	x8, [x28, #8]
	b.hs	LBB0_509
	b	LBB0_736
LBB0_498:                               ; %OP1454.PUSH2
	sub	x8, x12, #70
	stur	x8, [x28, #8]
	cmp	x27, #48
	b.lo	LBB0_736
; %bb.499:                              ; %OP1454.PUSH2.contd5208
	stp	xzr, xzr, [x25, #16]
	mov	w8, #256                        ; =0x100
	stp	x8, xzr, [x25]
	stp	xzr, xzr, [x20, #240]
	stp	x8, xzr, [x20, #224]
	ldr	q0, [x20, #128]
	ldp	x8, x9, [x20, #144]
	stp	x8, x9, [x20, #272]
	str	q0, [x20, #256]
	mov	x0, x17
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	b.ne	LBB0_520
; %bb.500:                              ; %OP1458.DIV_udiv-special-cases
	ldp	x5, x3, [x20, #256]
	ldp	x6, x4, [x20, #272]
	ldp	x24, x8, [x20, #224]
	ldp	x11, x10, [x20, #240]
	orr	x12, x8, x10
	orr	x13, x24, x11
	orr	x12, x13, x12
	cmp	x12, #0
	orr	x12, x3, x4
	orr	x13, x5, x6
	orr	x12, x13, x12
	ccmp	x12, #0, #4, ne
	cset	w12, eq
	clz	x13, x10
	clz	x14, x11
	add	x14, x14, #64
	cmp	x10, #0
	csel	x13, x13, x14, ne
	clz	x14, x8
	clz	x15, x24
	add	x15, x15, #64
	cmp	x8, #0
	csel	x14, x14, x15, ne
	add	x14, x14, #128
	orr	x15, x11, x10
	cmp	x15, #0
	csel	x13, x13, x14, ne
	clz	x14, x4
	clz	x15, x6
	add	x15, x15, #64
	cmp	x4, #0
	csel	x14, x14, x15, ne
	clz	x15, x3
	clz	x16, x5
	add	x16, x16, #64
	cmp	x3, #0
	csel	x15, x15, x16, ne
	add	x15, x15, #128
	orr	x16, x6, x4
	cmp	x16, #0
	csel	x14, x14, x15, ne
	subs	x14, x13, x14
	ngcs	x16, xzr
	ngcs	x1, xzr
	ngc	x2, xzr
	mov	w13, #255                       ; =0xff
	cmp	x13, x14
	ngcs	xzr, x16
	ngcs	xzr, x1
	ngcs	xzr, x2
	csinc	w0, w12, wzr, hs
	cmp	w0, #0
	csel	x17, xzr, x4, ne
	csel	x15, xzr, x6, ne
	csel	x13, xzr, x3, ne
	csel	x12, xzr, x5, ne
	tbnz	w0, #0, LBB0_507
; %bb.501:                              ; %OP1458.DIV_udiv-special-cases
	eor	x0, x14, #0xff
	orr	x0, x0, x1
	orr	x7, x16, x2
	orr	x0, x0, x7
	cbz	x0, LBB0_507
; %bb.502:                              ; %udiv-bb1
	str	x25, [x19, #152]                ; 8-byte Folded Spill
	movi.2d	v0, #0000000000000000
	stur	q0, [x29, #-136]
	stur	q0, [x29, #-152]
	stp	x5, x3, [x29, #-120]
	stp	x6, x4, [x29, #-104]
	mov	w9, #255                        ; =0xff
	sub	x9, x9, x14
	and	x7, x9, #0x7
	ubfx	x9, x9, #3, #5
	sub	x13, x29, #152
	add	x13, x13, #32
	sub	x9, x13, x9
	ldp	x15, x13, [x9, #16]
	lsl	x13, x13, x7
	mvn	w17, w7
	lsr	x0, x15, #1
	lsr	x0, x0, x17
	orr	x13, x13, x0
	lsl	x15, x15, x7
	ldp	x9, x21, [x9]
	lsr	x0, x21, #1
	lsr	x0, x0, x17
	orr	x15, x15, x0
	lsr	x0, x9, #1
	lsr	x22, x0, x17
	adds	x17, x14, #1
	adcs	x0, x16, xzr
	adcs	x1, x1, xzr
	cinc	x2, x2, hs
	lsl	x14, x21, x7
	orr	x16, x14, x22
	lsl	x14, x9, x7
	orr	x9, x0, x2
	orr	x7, x17, x1
	mov	x12, #0                         ; =0x0
	orr	x9, x7, x9
	cbz	x9, LBB0_505
; %bb.503:                              ; %udiv-preheader
	mov	x7, #0                          ; =0x0
	stur	q0, [x29, #-168]
	stur	q0, [x29, #-184]
	stp	x5, x3, [x29, #-216]
	stp	x6, x4, [x29, #-200]
	and	x9, x17, #0x7
	mvn	w3, w9
	ubfx	x4, x17, #3, #5
	sub	x5, x29, #216
	add	x4, x5, x4
	ldp	x6, x5, [x4, #16]
	lsl	x21, x5, #1
	lsl	x21, x21, x3
	lsr	x22, x6, x9
	orr	x23, x21, x22
	lsl	x6, x6, #1
	lsl	x6, x6, x3
	ldp	x4, x21, [x4]
	lsr	x22, x21, x9
	orr	x28, x22, x6
	lsl	x6, x21, #1
	lsl	x3, x6, x3
	lsr	x4, x4, x9
	orr	x27, x3, x4
	lsr	x30, x5, x9
	subs	x3, x24, #1
	mov	x4, #-1                         ; =0xffffffffffffffff
	adcs	x5, x8, x4
	adcs	x21, x11, x4
	adc	x22, x10, x4
	mov	x25, x10
	mov	x10, x11
	mov	x11, x8
	mov	x8, x24
LBB0_504:                               ; %udiv-do-while
                                        ; =>This Inner Loop Header: Depth=1
	mov	x6, #0                          ; =0x0
	extr	x24, x30, x23, #63
	extr	x23, x23, x28, #63
	extr	x26, x28, x27, #63
	extr	x27, x27, x13, #63
	extr	x13, x13, x15, #63
	extr	x15, x15, x16, #63
	extr	x16, x16, x14, #63
	orr	x14, x12, x14, lsl #1
	orr	x16, x7, x16
	orr	x15, x7, x15
	orr	x13, x7, x13
	cmp	x3, x27
	sbcs	xzr, x5, x26
	sbcs	xzr, x21, x23
	sbc	x12, x22, x24
	asr	x7, x12, #63
	and	x12, x7, #0x1
	and	x30, x7, x25
	and	x28, x7, x8
	subs	x27, x27, x28
	and	x9, x7, x10
	and	x7, x7, x11
	sbcs	x28, x26, x7
	sbcs	x23, x23, x9
	sbc	x30, x24, x30
	subs	x17, x17, #1
	adcs	x0, x0, x4
	adcs	x1, x1, x4
	adc	x2, x2, x4
	orr	x9, x0, x2
	orr	x24, x17, x1
	mov	x7, #0                          ; =0x0
	orr	x9, x24, x9
	cbnz	x9, LBB0_504
	b	LBB0_506
LBB0_505:
	mov	x6, x12
LBB0_506:                               ; %udiv-loop-exit
	extr	x8, x13, x15, #63
	extr	x9, x15, x16, #63
	extr	x10, x16, x14, #63
	orr	x13, x6, x10
	orr	x15, x6, x9
	orr	x17, x6, x8
	orr	x12, x12, x14, lsl #1
	ldp	x25, x28, [x19, #152]           ; 16-byte Folded Reload
LBB0_507:                               ; %udiv-end
	ldp	x8, x9, [x25]
	ldp	x10, x11, [x25, #16]
	umulh	x14, x12, x10
	madd	x11, x12, x11, x14
	madd	x11, x13, x10, x11
	umulh	x14, x15, x8
	madd	x14, x15, x9, x14
	madd	x14, x17, x8, x14
	mul	x10, x12, x10
	mul	x15, x15, x8
	adds	x10, x15, x10
	adc	x11, x14, x11
	umulh	x14, x9, x12
	umulh	x15, x8, x12
	mul	x16, x9, x12
	adds	x15, x16, x15
	cinc	x14, x14, hs
	umulh	x16, x8, x13
	mul	x17, x8, x13
	adds	x21, x17, x15
	cinc	x15, x16, hs
	adds	x14, x14, x15
	cset	w15, hs
	umulh	x16, x9, x13
	mul	x9, x9, x13
	adds	x9, x9, x14
	adc	x13, x16, x15
	adds	x22, x9, x10
	adc	x24, x13, x11
	mul	x23, x8, x12
	stp	x23, x21, [x25]
	stp	x22, x24, [x25, #16]
	ldp	x26, x8, [x20, #96]
	ldp	x9, x10, [x20, #112]
	stp	x9, x10, [x20, #240]
	stp	x26, x8, [x20, #224]
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	ldr	x20, [x0, #40]
	ldr	x11, [x20, #16]
	ldr	x27, [x20, #48]
	cmp	xzr, x8
	ngcs	xzr, x9
	ngcs	xzr, x10
	add	x8, x26, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x26, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x27
	cmp	x1, x8
	b.hi	LBB0_521
LBB0_508:                               ; %OP1462.SWAP2
	ldr	x8, [x20, #8]
	add	x8, x8, x27
	add	x8, x8, x26
	rev	x9, x24
	rev	x10, x22
	rev	x11, x21
	rev	x12, x23
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	ldp	x13, x16, [x19, #112]           ; 16-byte Folded Reload
	ldp	x9, x8, [x13, #16]
	ldp	x11, x10, [x13]
	stp	xzr, xzr, [x25, #16]
	mov	w12, #32                        ; =0x20
	stp	x12, xzr, [x25]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x13]
	stp	x9, x8, [x13, #16]
	ldur	x27, [x28, #8]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	subs	x8, x27, #22
	stur	x8, [x28, #8]
	b.lo	LBB0_736
LBB0_509:                               ; %OP1503.JUMPDEST.contd
	cmp	x16, #7
	b.lo	LBB0_511
LBB0_510:                               ; %OP859.POP
	sub	x12, x16, #5
	add	x11, x21, x16, lsl #5
	ldp	x8, x10, [x11, #-224]
	ldp	x9, x11, [x11, #-208]
	add	x13, x21, x12, lsl #5
	stp	x9, x11, [x13, #16]
	stp	x8, x10, [x13]
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	b	LBB0_616
LBB0_511:
	mov	x12, x16
	mov	w0, #91                         ; =0x5b
	b	LBB0_691
LBB0_512:                               ; %resize.i8356
	mov	x28, x1
	mov	x27, x2
	mov	x24, x17
	mov	x0, x16
	mov	w1, #96                         ; =0x60
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_523
; %bb.513:                              ; %resize.i8356.OP1415.MLOAD.contd_crit_edge
	ldp	x9, x8, [x23, #16]
	ldp	x11, x10, [x23]
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	ldr	x3, [x16, #40]
	mov	x17, x24
	mov	x2, x27
	mov	x1, x28
	b	LBB0_477
LBB0_514:                               ; %resize.i8371
	mov	x0, x16
	str	x1, [x19, #120]                 ; 8-byte Folded Spill
	mov	w1, #96                         ; =0x60
	stp	x3, x2, [x19, #96]              ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x3, x2, [x19, #96]              ; 16-byte Folded Reload
	ldp	x17, x12, [x19, #112]           ; 16-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_478
	b	LBB0_691
LBB0_515:                               ; %resize.i8386
	mov	x0, x16
	stp	x1, x2, [x19, #96]              ; 16-byte Folded Spill
	mov	x1, x8
	str	x13, [x19, #88]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x13, x1, [x19, #88]             ; 16-byte Folded Reload
	ldp	x12, x17, [x19, #104]           ; 16-byte Folded Reload
	ldr	x16, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_479
	b	LBB0_691
LBB0_516:                               ; %OP1479.JUMPDEST.us
	ldur	x8, [x28, #8]
	subs	x8, x8, #50
	stur	x8, [x28, #8]
	b.lo	LBB0_734
LBB0_517:                               ; %return.loopexit.split.loop.exit8831
	cmp	x12, #3
LBB0_518:                               ; %return
	mov	w8, #91                         ; =0x5b
	cinc	w0, w8, hs
	b	LBB0_691
LBB0_519:                               ; %resize.i8415
	mov	x0, x17
	str	x1, [x19, #120]                 ; 8-byte Folded Spill
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_487
	b	LBB0_525
LBB0_520:
	ldr	x8, [x19, #152]                 ; 8-byte Folded Reload
	add	x12, x8, #9
	b	LBB0_691
LBB0_521:                               ; %resize.i8401
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.eq	LBB0_508
LBB0_522:
	ldr	x12, [x19, #120]                ; 8-byte Folded Reload
	b	LBB0_691
LBB0_523:
	mov	x12, x27
	b	LBB0_691
LBB0_524:
	mov	x12, x21
	b	LBB0_691
LBB0_525:
	mov	x12, x22
	b	LBB0_691
LBB0_526:                               ; %OP465.JUMPDEST
	subs	x8, x27, #93
	stur	x8, [x28, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_734
; %bb.527:                              ; %OP465.JUMPDEST.contd
	sub	x8, x12, #1016
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1015
	b.lo	LBB0_691
; %bb.528:                              ; %OP466.PUSH1
	add	x21, x12, #1
	ldr	x27, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x27, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x24, sp, #32
	mov	sp, x24
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x24
	mov	x5, x17
	mov	x26, x17
	mov	x25, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_524
; %bb.529:                              ; %OP467.MLOAD.contd
	ldp	x0, x1, [x24]
	ldp	x2, x3, [x24, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x8, x27, x21, lsl #5
	stp	x2, x3, [x8, #16]
	stp	x0, x1, [x8]
	add	x22, x25, #3
	add	x21, x27, x22, lsl #5
	adds	x8, x0, #32
	adcs	x9, x1, xzr
	adcs	x10, x2, xzr
	cinc	x11, x3, hs
	stp	x8, x9, [x20, #64]
	stp	x10, x11, [x20, #80]
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	stp	x2, x3, [x20, #144]
	stp	x0, x1, [x20, #128]
	str	x26, [sp, #-16]!
	mov	w4, #32                         ; =0x20
	mov	x5, #0                          ; =0x0
	mov	x6, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.ne	LBB0_525
; %bb.530:                              ; %OP477.DUP4
	add	x23, x25, #5
	ldp	x0, x1, [x20, #-32]
	ldp	x2, x3, [x20, #-16]
	stp	x2, x3, [x21, #16]
	stp	x0, x1, [x21]
	ldr	q0, [x20, #64]
	ldp	x8, x9, [x20, #80]
	stp	x8, x9, [x20, #144]
	str	q0, [x20, #128]
	add	x25, x25, #6
	add	x22, x27, x23, lsl #5
	stp	x2, x3, [x22, #16]
	stp	x0, x1, [x22]
	sub	x24, sp, #32
	mov	sp, x24
	mov	x4, x24
	mov	x5, x26
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_186
; %bb.531:                              ; %OP480.MLOAD.contd
	ldp	x4, x5, [x24]
	ldp	x6, x7, [x24, #16]
	stp	x6, x7, [x22, #16]
	stp	x4, x5, [x22]
	ldp	x0, x1, [x20, #128]
	ldp	x2, x3, [x20, #144]
	add	x25, x27, x25, lsl #5
	stp	x2, x3, [x25, #16]
	stp	x0, x1, [x25]
	str	x26, [sp, #-16]!
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.ne	LBB0_534
; %bb.532:                              ; %OP483.PUSH1
	stp	xzr, xzr, [x22, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x22]
	ldp	x9, x8, [x20, #144]
	ldp	x11, x10, [x20, #128]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	stp	x11, x10, [x20, #64]
	stp	x9, x8, [x20, #80]
	ldp	x0, x1, [x21]
	ldp	x2, x3, [x21, #16]
	stp	x2, x3, [x20, #144]
	stp	x0, x1, [x20, #128]
	sub	x24, sp, #32
	mov	sp, x24
	mov	x4, x24
	mov	x5, x26
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_534
; %bb.533:                              ; %OP488.MLOAD.contd
	ldp	x8, x9, [x24]
	ldp	x10, x11, [x24, #16]
	ldp	x13, x12, [x21, #16]
	ldp	x15, x14, [x21]
	adds	x15, x15, #32
	adcs	x14, x14, xzr
	adcs	x13, x13, xzr
	cinc	x12, x12, hs
	stp	x15, x14, [x21]
	stp	x13, x12, [x21, #16]
	stp	x10, x11, [x20, #144]
	stp	x8, x9, [x20, #128]
	stp	x10, x11, [x22, #16]
	stp	x8, x9, [x22]
	ldr	q0, [x20, #64]
	ldp	x8, x9, [x20, #80]
	stp	x8, x9, [x25, #16]
	str	q0, [x25]
	stp	x15, x14, [x20, #224]
	stp	x13, x12, [x20, #240]
	ldp	x21, x8, [x19, #144]            ; 16-byte Folded Reload
	add	x12, x8, #9
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x20, #256]
	ldur	x27, [x28, #8]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b	LBB0_535
LBB0_534:
	mov	x12, x23
	b	LBB0_691
LBB0_535:                               ; %OP497.JUMPDEST.preheader
	subs	x8, x27, #26
	stur	x8, [x28, #8]
	b.lo	LBB0_552
; %bb.536:                              ; %OP497.JUMPDEST.contd.lr.ph
	sub	x9, x12, #1023
	cmn	x9, #1019
	b.lo	LBB0_548
; %bb.537:                              ; %OP497.JUMPDEST.contd.lr.ph.split
	add	x2, x12, #1
	add	x20, x21, x12, lsl #5
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	sub	x9, x12, #1022
	cmn	x9, #1019
	b.lo	LBB0_549
; %bb.538:                              ; %OP497.JUMPDEST.contd.preheader
	ldp	x10, x9, [x20, #-16]
	add	x22, x21, x2, lsl #5
	mov	x3, #-33                        ; =0xffffffffffffffdf
	ldp	x12, x11, [x20, #-32]
LBB0_539:                               ; %OP497.JUMPDEST.contd
                                        ; =>This Inner Loop Header: Depth=1
	ldp	x14, x13, [x20, #-112]
	ldp	x16, x15, [x20, #-128]
	stp	x12, x11, [x22]
	stp	x10, x9, [x22, #16]
	cmp	x12, x16
	sbcs	xzr, x11, x15
	sbcs	xzr, x10, x14
	sbcs	xzr, x9, x13
	cset	w13, hs
	stp	xzr, xzr, [x20, #16]
	stp	x13, xzr, [x20]
	b.hs	LBB0_554
; %bb.540:                              ; %OP504.DUP1
                                        ;   in Loop: Header=BB0_539 Depth=1
	sub	x13, x27, #75
	stur	x13, [x28, #8]
	cmp	x8, #49
	b.lo	LBB0_185
; %bb.541:                              ; %OP504.DUP1.contd
                                        ;   in Loop: Header=BB0_539 Depth=1
	ldp	x8, x13, [x20, #-64]
	ldp	x14, x15, [x20, #-48]
	stp	x14, x15, [x22, #16]
	stp	x8, x13, [x22]
	adds	x25, x8, x12
	adcs	x8, x13, x11
	adcs	x13, x14, x10
	adc	x14, x15, x9
	stp	x25, x8, [x20]
	stp	x13, x14, [x20, #16]
	ldr	x26, [x17, #40]
	ldr	x15, [x26, #16]
	ldr	x27, [x26, #48]
	cmp	xzr, x8
	ngcs	xzr, x13
	ngcs	xzr, x14
	add	x8, x25, #32
	ccmp	x25, x3, #2, hs
	cset	w13, hi
	cmp	w13, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x15, x27
	cmp	x1, x8
	mov	x24, x26
	b.hi	LBB0_544
LBB0_542:                               ; %OP507.MLOAD.contd
                                        ;   in Loop: Header=BB0_539 Depth=1
	ldr	x8, [x26, #8]
	add	x8, x8, x27
	add	x8, x8, x25
	ldp	x26, x25, [x8]
	ldp	x28, x27, [x8, #16]
	rev	x8, x28
	rev	x13, x27
	rev	x14, x26
	rev	x15, x25
	stp	x15, x14, [x20, #16]
	stp	x13, x8, [x20]
	ldp	x13, x8, [x20, #-96]
	ldp	x15, x14, [x20, #-80]
	stp	x15, x14, [x20, #80]
	stp	x13, x8, [x20, #64]
	adds	x21, x13, x12
	adcs	x8, x8, x11
	adcs	x10, x15, x10
	adc	x9, x14, x9
	stp	x21, x8, [x22]
	stp	x10, x9, [x22, #16]
	ldr	x11, [x24, #16]
	ldr	x23, [x24, #48]
	cmp	xzr, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	add	x8, x21, #32
	ccmp	x21, x3, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x23
	cmp	x1, x8
	b.hi	LBB0_546
LBB0_543:                               ; %OP512.PUSH1
                                        ;   in Loop: Header=BB0_539 Depth=1
	ldr	x8, [x24, #8]
	add	x8, x8, x23
	add	x8, x8, x21
	stp	x28, x27, [x8, #16]
	stp	x26, x25, [x8]
	ldp	x13, x8, [x20, #-32]
	ldp	x15, x14, [x20, #-16]
	stp	x15, x14, [x22, #16]
	stp	x13, x8, [x22]
	adds	x12, x13, #32
	adcs	x11, x8, xzr
	adcs	x10, x15, xzr
	cinc	x9, x14, hs
	stp	x12, x11, [x20, #-32]
	stp	x10, x9, [x20, #-16]
	stp	x15, x14, [x20, #16]
	stp	x13, x8, [x20]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldur	x27, [x28, #8]
	subs	x8, x27, #26
	stur	x8, [x28, #8]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b.hs	LBB0_539
	b	LBB0_185
LBB0_544:                               ; %resize.i7519
                                        ;   in Loop: Header=BB0_539 Depth=1
	mov	x21, x2
	mov	x0, x17
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_547
; %bb.545:                              ; %resize.i7519.OP507.MLOAD.contd_crit_edge
                                        ;   in Loop: Header=BB0_539 Depth=1
	ldp	x10, x9, [x20, #-16]
	ldp	x12, x11, [x20, #-32]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	ldr	x24, [x17, #40]
	mov	x2, x21
	mov	x3, #-33                        ; =0xffffffffffffffdf
	b	LBB0_542
LBB0_546:                               ; %resize.i7534
                                        ;   in Loop: Header=BB0_539 Depth=1
	mov	x0, x17
	str	x2, [x19, #128]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	mov	x3, #-33                        ; =0xffffffffffffffdf
	ldp	x2, x17, [x19, #128]            ; 16-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_543
	b	LBB0_187
LBB0_547:
	mov	x12, x21
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_548:                               ; %return.loopexit8694.split.loop.exit8768
	cmp	x12, #4
	b	LBB0_518
LBB0_549:                               ; %OP497.JUMPDEST.contd.us
	ldp	x10, x9, [x20, #-112]
	ldp	x12, x11, [x20, #-128]
	ldp	x13, x14, [x20, #-32]
	ldp	x15, x16, [x20, #-16]
	add	x17, x21, x2, lsl #5
	stp	x15, x16, [x17, #16]
	stp	x13, x14, [x17]
	cmp	x13, x12
	sbcs	xzr, x14, x11
	sbcs	xzr, x15, x10
	sbcs	xzr, x16, x9
	cset	w9, hs
	stp	xzr, xzr, [x20, #16]
	stp	x9, xzr, [x20]
	b.lo	LBB0_551
; %bb.550:
	mov	w12, #1022                      ; =0x3fe
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b	LBB0_555
LBB0_551:                               ; %OP127.DUP1.us
	sub	x9, x27, #75
	ldr	x10, [x19, #160]                ; 8-byte Folded Reload
	stur	x9, [x10, #8]
	cmp	x8, #49
	mov	w8, #92                         ; =0x5c
	mov	w9, #80                         ; =0x50
	csel	w0, w9, w8, lo
	mov	w12, #1022                      ; =0x3fe
	b	LBB0_691
LBB0_552:
	mov	w0, #80                         ; =0x50
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_553:                               ; %OP519.JUMPDEST.loopexit9582
	mov	x8, x27
LBB0_554:                               ; %OP519.JUMPDEST
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_555:                               ; %OP519.JUMPDEST
	subs	x27, x8, #51
	stur	x27, [x28, #8]
	b.lo	LBB0_552
; %bb.556:                              ; %OP519.JUMPDEST.contd
	cmp	x12, #7
	b.lo	LBB0_567
; %bb.557:                              ; %OP520.POP
	mov	x17, x21
	add	x21, x21, x12, lsl #5
	ldp	x11, x9, [x21, #-144]
	ldp	x14, x10, [x21, #-160]
	mov	x20, x12
	sub	x2, x12, #5
	ldp	x15, x12, [x21, #-208]
	ldp	x13, x16, [x21, #-224]
	add	x17, x17, x2, lsl #5
	adds	x13, x13, x14
	adcs	x10, x16, x10
	adcs	x11, x15, x11
	adc	x12, x12, x9
	stp	x13, x10, [x21, #-224]
	stp	x11, x12, [x21, #-208]
	ands	x9, x14, #0x1f
	stp	xzr, xzr, [x21, #-176]
	stp	x9, xzr, [x21, #-192]
	cset	w14, eq
	stp	xzr, xzr, [x17, #16]
	stp	x14, xzr, [x17]
	cbz	x9, LBB0_565
; %bb.558:                              ; %OP536.DUP1
	sub	x8, x8, #117
	stur	x8, [x28, #8]
	cmp	x27, #66
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b.lo	LBB0_572
; %bb.559:                              ; %OP536.DUP1.contd
	sub	x8, x20, #1025
	cmn	x8, #1018
	b.lo	LBB0_566
; %bb.560:                              ; %OP536.DUP1.contd1869
	mov	x14, x20
	sub	x22, x20, #3
	subs	x23, x13, x9
	sbcs	x8, x10, xzr
	sbcs	x10, x11, xzr
	sbc	x11, x12, xzr
	stp	x23, x8, [x21, #-160]
	stp	x10, x11, [x21, #-144]
	stp	x23, x8, [x21, #-128]
	stp	x10, x11, [x21, #-112]
	ldr	x25, [x0, #40]
	ldr	x12, [x25, #16]
	ldr	x26, [x25, #48]
	cmp	xzr, x8
	ngcs	xzr, x10
	ngcs	xzr, x11
	add	x8, x23, #32
	mov	x10, #-33                       ; =0xffffffffffffffdf
	ccmp	x23, x10, #2, hs
	cset	w10, hi
	cmp	w10, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x12, x26
	cmp	x1, x8
	str	x2, [x19, #152]                 ; 8-byte Folded Spill
	b.hi	LBB0_568
; %bb.561:
	mov	x11, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
LBB0_562:                               ; %OP540.MLOAD.contd
	sub	x27, x20, #1
	ldr	x12, [x25, #8]
	add	x12, x12, x26
	add	x12, x12, x23
	ldp	x14, x13, [x12]
	ldp	x12, x15, [x12, #16]
	rev	x12, x12
	rev	x15, x15
	rev	x14, x14
	rev	x13, x13
	mov	w16, #32                        ; =0x20
	subs	x9, x16, x9
	mov	x1, x21
	str	x9, [x1, #-64]!
	stp	x13, x14, [x1, #-48]
	stp	x15, x12, [x1, #-64]
	ldr	x23, [x19, #144]                ; 8-byte Folded Reload
	add	x22, x23, x22, lsl #5
	stp	xzr, xzr, [x22, #16]
	mov	w9, #1                          ; =0x1
	stp	x9, xzr, [x22]
	add	x9, x23, x27, lsl #5
	ngcs	x11, x11
	ngcs	x10, x10
	ngc	x8, x8
	stp	x10, x8, [x1, #16]
	str	x11, [x1, #8]
	stp	xzr, xzr, [x9, #16]
	mov	w8, #256                        ; =0x100
	stp	x8, xzr, [x9]
	mov	w2, #19                         ; =0x13
	mov	x24, x0
	bl	___revmc_builtin_exp
	tst	w0, #0xff
	b.ne	LBB0_570
; %bb.563:                              ; %OP547.SUB
	ldp	x8, x9, [x21, #-64]
	ldp	x10, x11, [x21, #-48]
	ldp	x13, x12, [x21, #-80]
	ldp	x15, x14, [x21, #-96]
	mvn	x11, x11
	mvn	x10, x10
	mvn	x9, x9
	mvn	x8, x8
	sub	x3, x20, #4
	add	x23, x23, x3, lsl #5
	ldp	x16, x17, [x23]
	adds	x8, x15, x8
	and	x25, x16, x8
	adcs	x8, x14, x9
	adcs	x9, x13, x10
	adc	x10, x12, x11
	ldp	x11, x12, [x23, #16]
	and	x27, x12, x10
	and	x26, x11, x9
	and	x28, x17, x8
	stp	x25, x28, [x23]
	stp	x26, x27, [x23, #16]
	ldp	x20, x8, [x21, #-160]
	ldp	x10, x9, [x21, #-144]
	stp	x10, x9, [x22, #16]
	stp	x20, x8, [x22]
	mov	x17, x24
	ldr	x22, [x24, #40]
	ldr	x11, [x22, #16]
	ldr	x24, [x22, #48]
	cmp	xzr, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	add	x8, x20, #32
	mov	x9, #-33                        ; =0xffffffffffffffdf
	ccmp	x20, x9, #2, hs
	cset	w9, hi
	cmp	w9, #0
	csinv	x1, x8, xzr, eq
	sub	x8, x11, x24
	cmp	x1, x8
	ldr	x2, [x19, #152]                 ; 8-byte Folded Reload
	b.hi	LBB0_571
LBB0_564:                               ; %OP552.PUSH1
	ldr	x8, [x22, #8]
	add	x8, x8, x24
	add	x8, x8, x20
	rev	x9, x27
	rev	x10, x28
	rev	x11, x25
	stp	x10, x11, [x8, #16]
	rev	x10, x26
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x23, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x23]
	ldp	x9, x8, [x21, #-144]
	ldp	x11, x10, [x21, #-160]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldur	q0, [x21, #-224]
	ldp	x13, x12, [x21, #-208]
	stp	x11, x10, [x21, #-224]
	stp	x9, x8, [x21, #-208]
	stp	x13, x12, [x21, #-144]
	stur	q0, [x21, #-160]
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	ldur	x27, [x28, #8]
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	b	LBB0_574
LBB0_565:
	ldp	x17, x21, [x19, #136]           ; 16-byte Folded Reload
	b	LBB0_574
LBB0_566:
	mov	w0, #92                         ; =0x5c
	mov	x12, x2
	b	LBB0_691
LBB0_567:
	mov	w0, #91                         ; =0x5b
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_568:                               ; %resize.i7550
	bl	___revmc_builtin_resize_memory
	tst	w0, #0xff
	b.ne	LBB0_158
; %bb.569:                              ; %resize.i7550.OP540.MLOAD.contd_crit_edge
	ldp	x10, x8, [x21, #-176]
	ldp	x9, x11, [x21, #-192]
	ldr	x0, [x19, #136]                 ; 8-byte Folded Reload
	b	LBB0_562
LBB0_570:
	mov	x12, x27
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_571:                               ; %resize.i7565
	mov	x0, x17
	str	x3, [x19, #128]                 ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x12, x17, [x19, #128]           ; 16-byte Folded Reload
	ldr	x2, [x19, #152]                 ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_564
	b	LBB0_691
LBB0_572:
	mov	w0, #80                         ; =0x50
	mov	x12, x2
	b	LBB0_691
LBB0_573:                               ; %OP556.JUMPDEST.loopexit
	mov	x2, x12
LBB0_574:                               ; %OP556.JUMPDEST
	subs	x8, x27, #30
	stur	x8, [x28, #8]
	b.lo	LBB0_572
; %bb.575:                              ; %OP556.JUMPDEST.contd
	subs	x24, x2, #5
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.hs	LBB0_209
LBB0_576:
	mov	w0, #91                         ; =0x5b
	mov	x12, x2
	b	LBB0_101
LBB0_577:                               ; %OP569.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_185
; %bb.578:                              ; %OP569.JUMPDEST.contd
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cmp	x12, #1022
	b.hi	LBB0_598
LBB0_579:                               ; %OP570.CALLVALUE
	ldp	x8, x9, [x11, #112]
	ldr	x10, [x11, #96]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	ldr	x11, [x11, #104]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_583
LBB0_580:                               ; %OP574.PUSH1
	mov	x21, x12
	subs	x8, x27, #6
	stur	x8, [x28, #8]
	b.hs	LBB0_217
; %bb.581:
	mov	w0, #80                         ; =0x50
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	mov	x12, x21
	b	LBB0_101
LBB0_582:                               ; %OP577.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
LBB0_583:                               ; %OP577.JUMPDEST
	subs	x27, x27, #79
	stur	x27, [x28, #8]
	b.lo	LBB0_552
; %bb.584:                              ; %OP577.JUMPDEST.contd
	cmp	x12, #1018
	b.hi	LBB0_598
; %bb.585:                              ; %OP578.PUSH2
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #944                        ; =0x3b0
	str	x8, [x20]
	stur	q0, [x20, #40]
	mov	w22, #4                         ; =0x4
	stp	xzr, x22, [x20, #24]
	mov	x8, x21
	add	x21, x12, #3
	str	xzr, [x20, #88]
	stur	q0, [x20, #72]
	stp	xzr, x22, [x20, #56]
	add	x23, x8, x21, lsl #5
	str	xzr, [x23, #24]
	stur	q0, [x23, #8]
	str	x22, [x23]
	ldp	x25, x26, [x11, #72]
	mov	w0, #4                          ; =0x4
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	stp	x0, x1, [x20, #32]
	and	x8, x2, #0xffffffff
	stp	x8, xzr, [x20, #48]
	str	xzr, [x20, #88]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #72]
	str	x22, [x20, #64]
	str	xzr, [x23, #24]
	stur	q0, [x23, #8]
	mov	w8, #36                         ; =0x24
	str	x8, [x23]
	str	xzr, [x20, #152]
	stur	q0, [x20, #136]
	str	x8, [x20, #128]
	mov	w0, #36                         ; =0x24
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	str	xzr, [x20, #184]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #168]
	mov	w8, #32                         ; =0x20
	stp	x2, x3, [x20, #80]
	stp	x0, x1, [x20, #64]
	str	xzr, [x23, #24]
	stur	q0, [x23, #8]
	str	x22, [x23]
	stp	xzr, x8, [x20, #152]
	stur	q0, [x20, #136]
	mov	w8, #68                         ; =0x44
	mov	x12, x21
	str	x8, [x20, #128]
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
LBB0_586:                               ; %OP1511.JUMPDEST
	subs	x27, x27, #26
	stur	x27, [x28, #8]
	b.lo	LBB0_734
; %bb.587:                              ; %OP1511.JUMPDEST.contd
	sub	x8, x12, #1019
	cmp	x12, #2
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1017
	ldr	x21, [x19, #144]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_691
; %bb.588:                              ; %OP1512.PUSH1
	add	x8, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x8]
	stur	q0, [x8, #40]
	mov	w9, #3035                       ; =0xbdb
	str	x9, [x8, #32]
	ldur	x9, [x11, #148]
	ldr	w10, [x11, #164]
	ldur	x11, [x11, #156]
	rev	x11, x11
	rev	x10, x10
	extr	x10, x11, x10, #32
	rev	x9, x9
	extr	x11, x9, x11, #32
	lsr	x9, x9, #32
	stp	x9, xzr, [x8, #80]
	stp	x10, x11, [x8, #64]
	str	xzr, [x8, #56]
	ldp	q0, q1, [x8, #-64]
	stp	q0, q1, [x8, #96]
	add	x12, x12, #5
	ldur	q0, [x8, #-32]
	ldp	x10, x11, [x8, #-16]
	stp	x10, x11, [x8, #144]
	str	q0, [x8, #128]
	b	LBB0_278
LBB0_589:                               ; %OP603.JUMPDEST
	subs	x8, x27, #62
	stur	x8, [x28, #8]
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	b.lo	LBB0_552
; %bb.590:                              ; %OP603.JUMPDEST.contd
	sub	x8, x12, #1021
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1020
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.lo	LBB0_101
; %bb.591:                              ; %OP604.PUSH1
	add	x21, x12, #1
	ldr	x25, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x25, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x23, sp, #32
	mov	sp, x23
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x23
	mov	x5, x17
	mov	x27, x17
	mov	x22, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.592:                              ; %OP605.MLOAD.contd
	ldp	x0, x1, [x23]
	ldp	x2, x3, [x23, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x22, x22, #2
	add	x24, x25, x21, lsl #5
	stp	x2, x3, [x24, #16]
	mov	x23, x20
	ldr	x8, [x23, #-32]!
	stp	x0, x1, [x24]
	ldp	x10, x9, [x23, #16]
	ldr	x11, [x23, #8]
	add	x25, x25, x22, lsl #5
	orr	x9, x11, x9
	orr	x8, x8, x10
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w4, ne
	stp	xzr, xzr, [x25, #16]
	stp	x4, xzr, [x25]
	stp	x2, x3, [x23, #144]
	stp	x0, x1, [x23, #128]
	str	x27, [sp, #-16]!
	mov	x5, #0                          ; =0x0
	mov	x6, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.eq	LBB0_594
LBB0_593:
	mov	x12, x22
	b	LBB0_101
LBB0_594:                               ; %OP614.PUSH1
	stp	xzr, xzr, [x25, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x25]
	ldp	x9, x8, [x24, #16]
	ldp	x11, x10, [x24]
	adds	x11, x11, #32
	adcs	x10, x10, xzr
	adcs	x9, x9, xzr
	cinc	x8, x8, hs
	ldur	q0, [x20, #-32]
	ldp	x13, x12, [x20, #-16]
	stp	x11, x10, [x20, #-32]
	stp	x9, x8, [x20, #-16]
	stp	x13, x12, [x24, #16]
	str	q0, [x24]
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x22, sp, #32
	mov	sp, x22
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x22
	mov	x5, x27
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.595:                              ; %OP620.MLOAD.contd
	ldp	x9, x8, [x22, #16]
	ldp	x11, x10, [x22]
	ldp	x12, x13, [x20, #-32]
	ldp	x14, x15, [x20, #-16]
	stp	x14, x15, [x24, #16]
	stp	x12, x13, [x24]
	subs	x12, x12, x11
	sbcs	x13, x13, x10
	sbcs	x14, x14, x9
	sbc	x15, x15, x8
	stp	x12, x13, [x20, #-32]
	stp	x14, x15, [x20, #-16]
	stp	x9, x8, [x20, #16]
	ldr	x8, [x19, #152]                 ; 8-byte Folded Reload
	sub	x21, x8, #1
	stp	x11, x10, [x20]
	mov	w20, #2                         ; =0x2
	mov	x0, x27
	mov	x1, x23
	mov	w2, #2                          ; =0x2
	bl	___revmc_builtin_do_return
	tst	w0, #0xff
	csel	w0, w20, w0, eq
	mov	x12, x21
	b	LBB0_101
LBB0_596:                               ; %OP626.JUMPDEST
	subs	x27, x27, #15
	stur	x27, [x28, #8]
	ldr	x4, [x19, #128]                 ; 8-byte Folded Reload
	b.lo	LBB0_552
; %bb.597:                              ; %OP626.JUMPDEST.contd
	mov	w9, #978                        ; =0x3d2
	cmp	x12, #1022
	b.ls	LBB0_17
LBB0_598:
	mov	w0, #92                         ; =0x5c
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_599:                               ; %OP630.JUMPDEST
	sub	x8, x27, #1
	stur	x8, [x28, #8]
	cmp	x27, #0
	mov	w8, #80                         ; =0x50
	csinc	w0, w8, wzr, eq
	b	LBB0_187
LBB0_600:                               ; %OP632.JUMPDEST
	subs	x27, x27, #19
	stur	x27, [x28, #8]
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	b.lo	LBB0_552
; %bb.601:                              ; %OP632.JUMPDEST.contd
	cmp	x12, #1022
	b.hi	LBB0_598
LBB0_602:                               ; %OP633.CALLVALUE
	ldp	x8, x9, [x10, #112]
	ldr	x10, [x10, #96]
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	ldr	x11, [x11, #104]
	add	x1, x21, x12, lsl #5
	orr	x9, x11, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	orr	x8, x10, x8
	stp	xzr, xzr, [x1, #16]
	orr	x8, x8, x9
	cmp	x8, #0
	cset	w9, eq
	stp	x9, xzr, [x1]
	cbz	x8, LBB0_604
	b	LBB0_580
LBB0_603:                               ; %OP640.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
LBB0_604:                               ; %OP640.JUMPDEST
	subs	x27, x27, #85
	stur	x27, [x28, #8]
	b.lo	LBB0_552
; %bb.605:                              ; %OP640.JUMPDEST.contd
	cmp	x12, #1018
	b.hi	LBB0_598
; %bb.606:                              ; %OP641.PUSH2
	add	x20, x21, x12, lsl #5
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #8]
	mov	w8, #1066                       ; =0x42a
	str	x8, [x20]
	stur	q0, [x20, #40]
	mov	w22, #4                         ; =0x4
	stp	xzr, x22, [x20, #24]
	mov	x8, x21
	add	x21, x12, #3
	str	xzr, [x20, #88]
	stur	q0, [x20, #72]
	stp	xzr, x22, [x20, #56]
	add	x23, x8, x21, lsl #5
	str	xzr, [x23, #24]
	stur	q0, [x23, #8]
	str	x22, [x23]
	ldp	x25, x26, [x11, #72]
	mov	w0, #4                          ; =0x4
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	stp	x0, x1, [x20, #32]
	and	x8, x2, #0xffffffff
	stp	x8, xzr, [x20, #48]
	str	xzr, [x20, #88]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #72]
	str	x22, [x20, #64]
	str	xzr, [x23, #24]
	stur	q0, [x23, #8]
	mov	w8, #36                         ; =0x24
	str	x8, [x23]
	str	xzr, [x20, #152]
	stur	q0, [x20, #136]
	str	x8, [x20, #128]
	mov	w0, #36                         ; =0x24
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x25
	mov	x5, x26
	bl	l___revmc_ir_builtin_calldataload
	str	xzr, [x20, #184]
	movi.2d	v0, #0000000000000000
	stur	q0, [x20, #168]
	and	x8, x2, #0xffffffff
	mov	w9, #32                         ; =0x20
	stp	x0, x1, [x20, #64]
	stp	x8, xzr, [x20, #80]
	str	xzr, [x23, #24]
	stur	q0, [x23, #8]
	str	x22, [x23]
	stp	xzr, x9, [x20, #152]
	stur	q0, [x20, #136]
	mov	w8, #68                         ; =0x44
	mov	x12, x21
	str	x8, [x20, #128]
	ldr	x26, [x19, #136]                ; 8-byte Folded Reload
	subs	x8, x27, #132
	stur	x8, [x28, #8]
	b.lo	LBB0_734
LBB0_607:                               ; %OP1527.JUMPDEST.contd
	sub	x8, x12, #1023
	cmp	x12, #3
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, hs
	cmn	x8, #1020
	ldr	x9, [x19, #144]                 ; 8-byte Folded Reload
	b.lo	LBB0_691
; %bb.608:                              ; %OP1528.PUSH1
	add	x24, x12, #1
	add	x25, x9, x12, lsl #5
	stp	xzr, xzr, [x25, #16]
	mov	w8, #4                          ; =0x4
	stp	x8, xzr, [x25]
	add	x21, x9, x24, lsl #5
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	ldr	x22, [x26, #40]
	ldr	x8, [x22, #16]
	ldr	x23, [x22, #48]
	sub	x8, x8, x23
	cmp	x8, #63
	b.ls	LBB0_738
LBB0_609:                               ; %OP1531.DUP2
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	ldr	x8, [x22, #8]
	add	x8, x8, x23
	mov	x9, #288230376151711744         ; =0x400000000000000
	stp	xzr, x9, [x8, #48]
	stp	xzr, xzr, [x8, #32]
	mov	x8, x25
	ldr	x22, [x8, #-64]!
	stp	x24, x8, [x19, #112]            ; 16-byte Folded Spill
	ldp	x23, x24, [x25, #-48]
	ldur	x27, [x25, #-56]
	stp	x22, x27, [x25]
	stp	x23, x24, [x25, #16]
	stp	xzr, xzr, [x21]
	stp	xzr, xzr, [x21, #16]
	ldr	x28, [x26, #40]
	ldr	x8, [x28, #16]
	ldr	x20, [x28, #48]
	sub	x8, x8, x20
	cmp	x8, #31
	b.ls	LBB0_739
LBB0_610:                               ; %OP1534.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x20
	rev	x9, x24
	rev	x10, x23
	rev	x11, x27
	rev	x12, x22
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x25, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x25]
	stp	xzr, xzr, [x21, #16]
	stp	xzr, xzr, [x21]
	mov	x0, x26
	mov	x1, x25
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_737
; %bb.611:                              ; %OP1537.PUSH1
	stp	xzr, xzr, [x21, #16]
	mov	w8, #32                         ; =0x20
	stp	x8, xzr, [x21]
	ldp	x23, x22, [x25, #16]
	ldp	x27, x24, [x25]
	ldr	x28, [x26, #40]
	ldr	x8, [x28, #16]
	ldr	x20, [x28, #48]
	sub	x8, x8, x20
	cmp	x8, #63
	b.ls	LBB0_740
LBB0_612:                               ; %OP1539.DUP1
	ldr	x8, [x28, #8]
	add	x8, x8, x20
	rev	x9, x22
	rev	x10, x23
	rev	x11, x24
	rev	x12, x27
	stp	x11, x12, [x8, #48]
	stp	x9, x10, [x8, #32]
	ldp	x23, x22, [x25, #-32]
	ldp	x27, x24, [x25, #-16]
	stp	x27, x24, [x25, #16]
	stp	x23, x22, [x25]
	stp	xzr, xzr, [x21, #16]
	stp	xzr, xzr, [x21]
	ldr	x28, [x26, #40]
	ldr	x8, [x28, #16]
	ldr	x20, [x28, #48]
	sub	x8, x8, x20
	cmp	x8, #31
	b.ls	LBB0_741
LBB0_613:                               ; %OP1542.PUSH1
	ldr	x8, [x28, #8]
	add	x8, x8, x20
	rev	x9, x24
	rev	x10, x27
	rev	x11, x22
	rev	x12, x23
	stp	x11, x12, [x8, #16]
	stp	x9, x10, [x8]
	stp	xzr, xzr, [x25, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x25]
	stp	xzr, xzr, [x21, #16]
	stp	xzr, xzr, [x21]
	mov	x0, x26
	mov	x1, x25
	bl	___revmc_builtin_keccak256
	tst	w0, #0xff
	b.ne	LBB0_737
; %bb.614:                              ; %OP1545.PUSH1
	ldur	q0, [x25, #-32]
	ldp	x8, x9, [x25, #-16]
	stp	xzr, xzr, [x25, #-16]
	stp	xzr, xzr, [x25, #-32]
	stp	x8, x9, [x21, #16]
	str	q0, [x21]
	ldr	q0, [x25]
	ldp	x9, x8, [x25, #16]
	ldur	q1, [x25, #-64]
	ldp	x11, x10, [x25, #-48]
	stp	x9, x8, [x25, #-48]
	stur	q0, [x25, #-64]
	stp	x11, x10, [x25, #16]
	ldr	x21, [x19, #152]                ; 8-byte Folded Reload
	sub	x21, x21, #1
	str	q1, [x25]
	mov	x0, x26
	ldr	x1, [x19, #120]                 ; 8-byte Folded Reload
	mov	w2, #19                         ; =0x13
	bl	___revmc_builtin_sload
	tst	w0, #0xff
	ldr	x28, [x19, #160]                ; 8-byte Folded Reload
	b.ne	LBB0_104
; %bb.615:                              ; %OP1552.DUP2
	ldp	x8, x10, [x25, #-96]
	ldp	x9, x11, [x25, #-80]
	str	x21, [x19, #152]                ; 8-byte Folded Spill
	ldr	x13, [x19, #144]                ; 8-byte Folded Reload
	add	x12, x13, x21, lsl #5
	mov	x21, x13
	stp	x9, x11, [x12, #16]
	stp	x8, x10, [x12]
LBB0_616:                               ; %dynamic_jump_table.preheader
	mov	w12, #879                       ; =0x36f
	mov	w13, #1755                      ; =0x6db
	ldur	x27, [x28, #8]
	mov	w14, #2839                      ; =0xb17
	mov	w15, #3013                      ; =0xbc5
	mov	w16, #3034                      ; =0xbda
	mov	w17, #3035                      ; =0xbdb
	mov	w0, #89                         ; =0x59
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_623
LBB0_617:                               ; %dynamic_jump_table
	mov	w12, #552                       ; =0x228
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b.lt	LBB0_636
; %bb.618:                              ; %dynamic_jump_table
	mov	w12, #326                       ; =0x146
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_645
; %bb.619:                              ; %dynamic_jump_table
	mov	w12, #203                       ; =0xcb
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_658
; %bb.620:                              ; %dynamic_jump_table
	mov	w12, #184                       ; =0xb8
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_704
; %bb.621:                              ; %dynamic_jump_table
	mov	w12, #175                       ; =0xaf
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_105
; %bb.622:                              ; %dynamic_jump_table
	mov	w10, #183                       ; =0xb7
	b	LBB0_689
LBB0_623:                               ; %dynamic_jump_table
                                        ; =>This Inner Loop Header: Depth=1
	cmp	x13, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.ge	LBB0_631
; %bb.624:                              ; %dynamic_jump_table
                                        ;   in Loop: Header=BB0_623 Depth=1
	cmp	x14, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.ge	LBB0_653
; %bb.625:                              ; %dynamic_jump_table
                                        ;   in Loop: Header=BB0_623 Depth=1
	cmp	x15, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.ge	LBB0_679
; %bb.626:                              ; %dynamic_jump_table
                                        ;   in Loop: Header=BB0_623 Depth=1
	cmp	x16, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.ge	LBB0_722
; %bb.627:                              ; %dynamic_jump_table
                                        ;   in Loop: Header=BB0_623 Depth=1
	eor	x1, x8, x17
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x1, x9
	cbnz	x10, LBB0_724
; %bb.628:                              ; %OP1519.JUMPDEST
                                        ;   in Loop: Header=BB0_623 Depth=1
	subs	x27, x27, #24
	stur	x27, [x28, #8]
	b.lo	LBB0_185
; %bb.629:                              ; %OP1519.JUMPDEST.contd
                                        ;   in Loop: Header=BB0_623 Depth=1
	ldr	x3, [x19, #152]                 ; 8-byte Folded Reload
	cmp	x3, #5
	b.lo	LBB0_742
; %bb.630:                              ; %OP1520.SWAP1
                                        ;   in Loop: Header=BB0_623 Depth=1
	add	x0, x21, x3, lsl #5
	ldur	q0, [x0, #-32]
	ldp	x2, x1, [x0, #-16]
	ldur	q2, [x0, #-64]
	ldp	x9, x8, [x0, #-48]
	stp	x9, x8, [x0, #-16]
	ldp	x8, x10, [x0, #-160]
	ldp	x9, x11, [x0, #-144]
	stp	x2, x1, [x0, #-144]
	stur	q0, [x0, #-160]
	ldp	q0, q1, [x0, #-128]
	stp	x9, x11, [x0, #-112]
	stp	x8, x10, [x0, #-128]
	sub	x3, x3, #4
	str	x3, [x19, #152]                 ; 8-byte Folded Spill
	stp	q1, q2, [x0, #-48]
	stur	q0, [x0, #-64]
	mov	w0, #89                         ; =0x59
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_623
	b	LBB0_617
LBB0_631:                               ; %dynamic_jump_table
	mov	w12, #1087                      ; =0x43f
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_641
; %bb.632:                              ; %dynamic_jump_table
	mov	w12, #977                       ; =0x3d1
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b.lt	LBB0_664
; %bb.633:                              ; %dynamic_jump_table
	mov	w12, #943                       ; =0x3af
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_692
; %bb.634:                              ; %dynamic_jump_table
	mov	w12, #880                       ; =0x370
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_577
; %bb.635:                              ; %dynamic_jump_table
	mov	w10, #891                       ; =0x37b
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	cbz	x8, LBB0_582
	b	LBB0_187
LBB0_636:                               ; %dynamic_jump_table
	mov	w12, #671                       ; =0x29f
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_649
; %bb.637:                              ; %dynamic_jump_table
	mov	w12, #613                       ; =0x265
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_670
; %bb.638:                              ; %dynamic_jump_table
	mov	w12, #589                       ; =0x24d
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_687
; %bb.639:                              ; %dynamic_jump_table
	mov	w12, #553                       ; =0x229
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_250
; %bb.640:                              ; %dynamic_jump_table
	mov	w10, #579                       ; =0x243
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_383
	b	LBB0_691
LBB0_641:                               ; %dynamic_jump_table
	mov	w12, #1394                      ; =0x572
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b.lt	LBB0_667
; %bb.642:                              ; %dynamic_jump_table
	mov	w12, #1351                      ; =0x547
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_694
; %bb.643:                              ; %dynamic_jump_table
	mov	w12, #1088                      ; =0x440
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_726
; %bb.644:                              ; %dynamic_jump_table
	mov	w10, #1245                      ; =0x4dd
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_114
	b	LBB0_691
LBB0_645:                               ; %dynamic_jump_table
	mov	w12, #427                       ; =0x1ab
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_673
; %bb.646:                              ; %dynamic_jump_table
	mov	w12, #390                       ; =0x186
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_706
; %bb.647:                              ; %dynamic_jump_table
	mov	w12, #327                       ; =0x147
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_214
; %bb.648:                              ; %dynamic_jump_table
	mov	w10, #338                       ; =0x152
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	cbz	x8, LBB0_218
	b	LBB0_187
LBB0_649:                               ; %dynamic_jump_table
	mov	w12, #756                       ; =0x2f4
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_661
; %bb.650:                              ; %dynamic_jump_table
	mov	w12, #737                       ; =0x2e1
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_708
; %bb.651:                              ; %dynamic_jump_table
	mov	w12, #672                       ; =0x2a0
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_453
; %bb.652:                              ; %dynamic_jump_table
	mov	w10, #716                       ; =0x2cc
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_268
	b	LBB0_691
LBB0_653:                               ; %dynamic_jump_table
	mov	w12, #2520                      ; =0x9d8
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_676
; %bb.654:                              ; %dynamic_jump_table
	mov	w12, #2115                      ; =0x843
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	ldr	x13, [x19, #136]                ; 8-byte Folded Reload
	b.lt	LBB0_714
; %bb.655:                              ; %dynamic_jump_table
	mov	w12, #1756                      ; =0x6dc
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_731
; %bb.656:                              ; %dynamic_jump_table
	mov	w10, #1972                      ; =0x7b4
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbnz	x8, LBB0_691
; %bb.657:                              ; %OP1036.JUMPDEST.loopexit
	mov	x14, x12
	subs	x8, x27, #17
	stur	x8, [x28, #8]
	b.hs	LBB0_300
	b	LBB0_298
LBB0_658:                               ; %dynamic_jump_table
	mov	w12, #267                       ; =0x10b
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_683
; %bb.659:                              ; %dynamic_jump_table
	mov	w12, #204                       ; =0xcc
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_163
; %bb.660:                              ; %dynamic_jump_table
	mov	w10, #241                       ; =0xf1
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_171
	b	LBB0_691
LBB0_661:                               ; %dynamic_jump_table
	mov	w12, #820                       ; =0x334
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_685
; %bb.662:                              ; %dynamic_jump_table
	mov	w12, #757                       ; =0x2f5
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_526
; %bb.663:                              ; %dynamic_jump_table
	mov	w10, #794                       ; =0x31a
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_535
	b	LBB0_691
LBB0_664:                               ; %dynamic_jump_table
	mov	w12, #990                       ; =0x3de
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_696
; %bb.665:                              ; %dynamic_jump_table
	mov	w12, #978                       ; =0x3d2
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_599
; %bb.666:                              ; %dynamic_jump_table
	mov	w10, #980                       ; =0x3d4
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_600
	b	LBB0_691
LBB0_667:                               ; %dynamic_jump_table
	mov	w12, #1644                      ; =0x66c
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_702
; %bb.668:                              ; %dynamic_jump_table
	mov	w12, #1395                      ; =0x573
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_727
; %bb.669:                              ; %dynamic_jump_table
	mov	w10, #1403                      ; =0x57b
	eor	x8, x8, x10
	orr	x8, x8, x9
	cbz	x8, LBB0_222
	b	LBB0_187
LBB0_670:                               ; %dynamic_jump_table
	mov	w12, #632                       ; =0x278
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_710
; %bb.671:                              ; %dynamic_jump_table
	mov	w12, #614                       ; =0x266
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_428
; %bb.672:                              ; %dynamic_jump_table
	mov	w10, #625                       ; =0x271
	eor	x8, x8, x10
	orr	x8, x8, x9
	cbz	x8, LBB0_431
	b	LBB0_187
LBB0_673:                               ; %dynamic_jump_table
	mov	w12, #457                       ; =0x1c9
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_712
; %bb.674:                              ; %dynamic_jump_table
	mov	w12, #428                       ; =0x1ac
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_261
; %bb.675:                              ; %dynamic_jump_table
	mov	w10, #436                       ; =0x1b4
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_268
	b	LBB0_691
LBB0_676:                               ; %dynamic_jump_table
	mov	w12, #2739                      ; =0xab3
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	b.lt	LBB0_716
; %bb.677:                              ; %dynamic_jump_table
	mov	w12, #2521                      ; =0x9d9
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_390
; %bb.678:                              ; %dynamic_jump_table
	mov	w10, #2599                      ; =0xa27
	eor	x8, x8, x10
	orr	x8, x8, x9
	cbz	x8, LBB0_403
	b	LBB0_187
LBB0_679:                               ; %dynamic_jump_table
	mov	w12, #2970                      ; =0xb9a
	cmp	x12, x8
	ngcs	xzr, x10
	ngcs	xzr, x9
	ngcs	xzr, x11
	b.lt	LBB0_720
; %bb.680:                              ; %dynamic_jump_table
	mov	w12, #2840                      ; =0xb18
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	cbz	x10, LBB0_457
; %bb.681:                              ; %dynamic_jump_table
	mov	w10, #2864                      ; =0xb30
	eor	x8, x8, x10
	orr	x8, x8, x9
	cbnz	x8, LBB0_187
; %bb.682:                              ; %OP1388.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #194
	stur	x8, [x28, #8]
	b.hs	LBB0_474
	b	LBB0_734
LBB0_683:                               ; %dynamic_jump_table
	mov	w12, #268                       ; =0x10c
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_188
; %bb.684:                              ; %dynamic_jump_table
	mov	w10, #313                       ; =0x139
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_206
	b	LBB0_691
LBB0_685:                               ; %dynamic_jump_table
	mov	w12, #821                       ; =0x335
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_553
; %bb.686:                              ; %dynamic_jump_table
	mov	w10, #866                       ; =0x362
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_573
	b	LBB0_691
LBB0_687:                               ; %dynamic_jump_table
	mov	w12, #590                       ; =0x24e
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_386
; %bb.688:                              ; %dynamic_jump_table
	mov	w10, #612                       ; =0x264
LBB0_689:                               ; %dynamic_jump_table
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbnz	x8, LBB0_691
; %bb.690:                              ; %OP74.JUMPDEST
	sub	x8, x27, #1
	stur	x8, [x28, #8]
	cmp	x27, #0
	mov	w8, #80                         ; =0x50
	csinc	w0, w8, wzr, eq
LBB0_691:
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b	LBB0_101
LBB0_692:                               ; %dynamic_jump_table
	mov	w12, #944                       ; =0x3b0
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_589
; %bb.693:                              ; %dynamic_jump_table
	mov	w10, #970                       ; =0x3ca
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_596
	b	LBB0_691
LBB0_694:                               ; %dynamic_jump_table
	mov	w12, #1352                      ; =0x548
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_729
; %bb.695:                              ; %dynamic_jump_table
	mov	w10, #1366                      ; =0x556
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_130
	b	LBB0_691
LBB0_696:                               ; %dynamic_jump_table
	mov	w12, #991                       ; =0x3df
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_603
; %bb.697:                              ; %dynamic_jump_table
	mov	w10, #1066                      ; =0x42a
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbnz	x8, LBB0_691
; %bb.698:                              ; %OP668.JUMPDEST
	subs	x8, x27, #50
	stur	x8, [x28, #8]
	b.lo	LBB0_552
; %bb.699:                              ; %OP668.JUMPDEST.contd
	sub	x8, x12, #1021
	cmp	x12, #0
	mov	w9, #91                         ; =0x5b
	cinc	w0, w9, ne
	cmn	x8, #1020
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	b.lo	LBB0_101
; %bb.700:                              ; %OP669.PUSH1
	add	x21, x12, #1
	ldr	x25, [x19, #144]                ; 8-byte Folded Reload
	add	x20, x25, x12, lsl #5
	stp	xzr, xzr, [x20, #16]
	mov	w8, #64                         ; =0x40
	stp	x8, xzr, [x20]
	sub	x23, sp, #32
	mov	sp, x23
	mov	w0, #64                         ; =0x40
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	mov	x4, x23
	mov	x5, x17
	mov	x27, x17
	mov	x22, x12
	bl	l___revmc_ir_builtin_mload
	tst	w0, #0xff
	b.ne	LBB0_257
; %bb.701:                              ; %OP670.MLOAD.contd
	ldp	x0, x1, [x23]
	ldp	x2, x3, [x23, #16]
	stp	x2, x3, [x20, #16]
	stp	x0, x1, [x20]
	add	x22, x22, #2
	add	x24, x25, x21, lsl #5
	stp	x2, x3, [x24, #16]
	stp	x0, x1, [x24]
	mov	x23, x20
	ldp	x4, x5, [x23, #-32]!
	ldp	x6, x7, [x23, #16]
	add	x25, x25, x22, lsl #5
	stp	x6, x7, [x25, #16]
	stp	x4, x5, [x25]
	stp	x2, x3, [x23, #144]
	stp	x0, x1, [x23, #128]
	str	x27, [sp, #-16]!
	bl	l___revmc_ir_builtin_mstore
	add	sp, sp, #16
	tst	w0, #0xff
	b.eq	LBB0_594
	b	LBB0_593
LBB0_702:                               ; %dynamic_jump_table
	mov	w12, #1645                      ; =0x66d
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_730
; %bb.703:                              ; %dynamic_jump_table
	mov	w10, #1676                      ; =0x68c
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_278
	b	LBB0_691
LBB0_704:                               ; %dynamic_jump_table
	mov	w12, #185                       ; =0xb9
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_107
; %bb.705:                              ; %dynamic_jump_table
	mov	w10, #196                       ; =0xc4
	eor	x8, x8, x10
	orr	x8, x8, x9
	cbz	x8, LBB0_110
	b	LBB0_187
LBB0_706:                               ; %dynamic_jump_table
	mov	w12, #391                       ; =0x187
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_250
; %bb.707:                              ; %dynamic_jump_table
	mov	w10, #417                       ; =0x1a1
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_258
	b	LBB0_691
LBB0_708:                               ; %dynamic_jump_table
	mov	w12, #738                       ; =0x2e2
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_467
; %bb.709:                              ; %dynamic_jump_table
	mov	w10, #749                       ; =0x2ed
	eor	x8, x8, x10
	orr	x8, x8, x9
	cbz	x8, LBB0_470
	b	LBB0_187
LBB0_710:                               ; %dynamic_jump_table
	mov	w12, #633                       ; =0x279
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_446
; %bb.711:                              ; %dynamic_jump_table
	mov	w10, #661                       ; =0x295
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_450
	b	LBB0_691
LBB0_712:                               ; %dynamic_jump_table
	mov	w12, #458                       ; =0x1ca
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_272
; %bb.713:                              ; %dynamic_jump_table
	mov	w10, #469                       ; =0x1d5
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	cbz	x8, LBB0_275
	b	LBB0_691
LBB0_714:                               ; %dynamic_jump_table
	mov	w12, #2116                      ; =0x844
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_313
; %bb.715:                              ; %dynamic_jump_table
	mov	w10, #2255                      ; =0x8cf
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_326
	b	LBB0_691
LBB0_716:                               ; %dynamic_jump_table
	mov	w12, #2740                      ; =0xab4
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_732
; %bb.717:                              ; %dynamic_jump_table
	mov	w10, #2821                      ; =0xb05
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbnz	x8, LBB0_691
; %bb.718:                              ; %OP1356.JUMPDEST.loopexit
	mov	x8, x12
	subs	x9, x27, #51
	stur	x9, [x28, #8]
	b.hs	LBB0_435
LBB0_719:
	mov	x12, x8
	mov	w0, #80                         ; =0x50
	b	LBB0_691
LBB0_720:                               ; %dynamic_jump_table
	mov	w12, #2971                      ; =0xb9b
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	cbz	x10, LBB0_733
; %bb.721:                              ; %dynamic_jump_table
	mov	w10, #2985                      ; =0xba9
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_489
	b	LBB0_691
LBB0_722:                               ; %dynamic_jump_table
	mov	w12, #3014                      ; =0xbc6
	eor	x12, x8, x12
	orr	x10, x10, x11
	orr	x9, x9, x10
	orr	x10, x12, x9
	cbz	x10, LBB0_735
; %bb.723:                              ; %dynamic_jump_table
	mov	w10, #3022                      ; =0xbce
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x17, [x19, #136]                ; 8-byte Folded Reload
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	cbz	x8, LBB0_586
	b	LBB0_691
LBB0_724:                               ; %dynamic_jump_table
	mov	w10, #3043                      ; =0xbe3
	eor	x8, x8, x10
	orr	x8, x8, x9
	ldr	x26, [x19, #136]                ; 8-byte Folded Reload
	cbnz	x8, LBB0_187
; %bb.725:                              ; %OP1527.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #132
	stur	x8, [x28, #8]
	b.hs	LBB0_607
	b	LBB0_734
LBB0_726:                               ; %OP687.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x4, [x19, #128]                 ; 8-byte Folded Reload
	subs	x8, x27, #108
	stur	x8, [x28, #8]
	b.hs	LBB0_19
	b	LBB0_552
LBB0_727:                               ; %OP858.JUMPDEST.loopexit
	ldr	x16, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #22
	stur	x8, [x28, #8]
	b.hs	LBB0_150
LBB0_728:
	mov	w0, #80                         ; =0x50
	mov	x12, x16
	b	LBB0_691
LBB0_729:                               ; %OP823.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #58
	stur	x8, [x28, #8]
	b.hs	LBB0_126
	b	LBB0_552
LBB0_730:                               ; %OP942.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	subs	x8, x27, #28
	stur	x8, [x28, #8]
	b.hs	LBB0_265
	b	LBB0_552
LBB0_731:                               ; %OP983.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	ldr	x11, [x19, #128]                ; 8-byte Folded Reload
	subs	x8, x27, #43
	stur	x8, [x28, #8]
	b.hs	LBB0_286
	b	LBB0_552
LBB0_732:                               ; %OP1330.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #1199
	stur	x8, [x28, #8]
	ldr	x10, [x19, #128]                ; 8-byte Folded Reload
	str	x12, [x19, #152]                ; 8-byte Folded Spill
	b.hs	LBB0_6
	b	LBB0_734
LBB0_733:                               ; %OP1468.JUMPDEST.loopexit
	ldr	x12, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #58
	stur	x8, [x28, #8]
	b.hs	LBB0_485
LBB0_734:
	mov	w0, #80                         ; =0x50
	b	LBB0_691
LBB0_735:                               ; %OP1503.JUMPDEST.loopexit
	ldr	x16, [x19, #152]                ; 8-byte Folded Reload
	subs	x8, x27, #22
	stur	x8, [x28, #8]
	b.hs	LBB0_509
LBB0_736:
	mov	x12, x16
	mov	w0, #80                         ; =0x50
	b	LBB0_691
LBB0_737:
	ldr	x12, [x19, #112]                ; 8-byte Folded Reload
	b	LBB0_691
LBB0_738:                               ; %resize.i8445
	mov	x0, x26
	mov	w1, #64                         ; =0x40
	mov	x20, x12
	bl	___revmc_builtin_resize_memory
	mov	x12, x20
	ldr	x26, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_609
	b	LBB0_691
LBB0_739:                               ; %resize.i8459
	mov	x0, x26
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x26, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_610
	b	LBB0_187
LBB0_740:                               ; %resize.i8474
	mov	x0, x26
	mov	w1, #64                         ; =0x40
	bl	___revmc_builtin_resize_memory
	ldr	x26, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_612
	b	LBB0_187
LBB0_741:                               ; %resize.i8488
	mov	x0, x26
	mov	w1, #32                         ; =0x20
	bl	___revmc_builtin_resize_memory
	ldr	x26, [x19, #136]                ; 8-byte Folded Reload
	tst	w0, #0xff
	b.eq	LBB0_613
	b	LBB0_187
LBB0_742:
	mov	w0, #91                         ; =0x5b
	ldr	x26, [x19, #56]                 ; 8-byte Folded Reload
	mov	x12, x3
	b	LBB0_101
	.loh AdrpLdr	Lloh0, Lloh1
                                        ; -- End function
	.p2align	2                               ; -- Begin function __revmc_ir_builtin_mstore
l___revmc_ir_builtin_mstore:            ; @__revmc_ir_builtin_mstore
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	ldr	x8, [sp, #80]
	ldr	x9, [x8, #40]
	ldr	x11, [x9, #16]
	ldr	x10, [x9, #48]
	cmp	xzr, x1
	ngcs	xzr, x2
	ngcs	xzr, x3
	add	x12, x0, #32
	mov	x13, #-33                       ; =0xffffffffffffffdf
	ccmp	x0, x13, #2, hs
	cset	w13, hi
	cmp	w13, #0
	csinv	x1, x12, xzr, eq
	sub	x11, x11, x10
	cmp	x1, x11
	b.hi	LBB1_3
LBB1_1:                                 ; %contd
	mov	w8, #0                          ; =0x0
	ldr	x9, [x9, #8]
	add	x9, x9, x10
	add	x9, x9, x0
	rev	x10, x7
	rev	x11, x5
	rev	x12, x4
	stp	x11, x12, [x9, #16]
	rev	x11, x6
	stp	x10, x11, [x9]
LBB1_2:                                 ; %common.ret
	mov	x0, x8
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB1_3:                                 ; %resize
	stp	x6, x0, [sp, #48]               ; 16-byte Folded Spill
	mov	x0, x8
	stp	x7, x4, [sp, #16]               ; 16-byte Folded Spill
	stp	x9, x5, [sp, #32]               ; 16-byte Folded Spill
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x10, x7, [sp, #8]               ; 16-byte Folded Reload
	ldp	x9, x5, [sp, #32]               ; 16-byte Folded Reload
	ldr	x4, [sp, #24]                   ; 8-byte Folded Reload
	mov	x8, x0
	ldp	x6, x0, [sp, #48]               ; 16-byte Folded Reload
	tst	w8, #0xff
	b.eq	LBB1_1
	b	LBB1_2
                                        ; -- End function
	.p2align	2                               ; -- Begin function __revmc_ir_builtin_calldataload
l___revmc_ir_builtin_calldataload:      ; @__revmc_ir_builtin_calldataload
; %bb.0:                                ; %entry
	cmp	x0, x5
	sbcs	xzr, x1, xzr
	sbcs	xzr, x2, xzr
	sbcs	xzr, x3, xzr
	b.hs	LBB2_2
; %bb.1:                                ; %then
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	x8, x5, x0
	mov	w9, #32                         ; =0x20
	cmp	x8, #32
	csel	x2, x8, x9, lo
	mov	x19, sp
	sub	x8, x19, #32
	mov	sp, x8
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x19, #-32]
	add	x1, x4, x0
	mov	x0, x8
	bl	_memcpy
	ldp	x8, x9, [x19, #-32]
	ldp	x10, x11, [x19, #-16]
	rev	x0, x11
	rev	x1, x10
	rev	x2, x9
	rev	x3, x8
	sub	sp, x29, #16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB2_2:                                 ; %contd
	mov	x0, #0                          ; =0x0
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	ret
                                        ; -- End function
	.p2align	2                               ; -- Begin function __revmc_ir_builtin_mload
l___revmc_ir_builtin_mload:             ; @__revmc_ir_builtin_mload
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	ldr	x9, [x5, #40]
	ldr	x8, [x9, #16]
	ldr	x10, [x9, #48]
	cmp	xzr, x1
	ngcs	xzr, x2
	ngcs	xzr, x3
	add	x11, x0, #32
	mov	x12, #-33                       ; =0xffffffffffffffdf
	ccmp	x0, x12, #2, hs
	cset	w12, hi
	cmp	w12, #0
	csinv	x1, x11, xzr, eq
	sub	x8, x8, x10
	cmp	x1, x8
	b.hi	LBB3_3
LBB3_1:                                 ; %contd
	mov	w8, #0                          ; =0x0
	ldr	x9, [x9, #8]
	add	x9, x9, x10
	add	x9, x9, x0
	ldp	x10, x11, [x9]
	ldp	x12, x9, [x9, #16]
	rev	x9, x9
	rev	x12, x12
	rev	x11, x11
	rev	x10, x10
	stp	x11, x10, [x4, #16]
	stp	x9, x12, [x4]
LBB3_2:                                 ; %common.ret
	mov	x0, x8
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB3_3:                                 ; %resize
	stp	x4, x0, [sp, #16]               ; 16-byte Folded Spill
	mov	x0, x5
	stp	x9, x10, [sp]                   ; 16-byte Folded Spill
	bl	___revmc_builtin_resize_memory
	ldp	x9, x10, [sp]                   ; 16-byte Folded Reload
	mov	x8, x0
	ldp	x4, x0, [sp, #16]               ; 16-byte Folded Reload
	tst	w8, #0xff
	b.eq	LBB3_1
	b	LBB3_2
                                        ; -- End function
.subsections_via_symbols

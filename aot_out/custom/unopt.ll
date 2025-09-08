; ModuleID = 'custom'
source_filename = "evm"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin23.5.0"

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define i8 @custom(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef align 16 dereferenceable(672) %arg.env.addr, ptr noalias nocapture noundef align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %len.addr = alloca i64, align 8
  br label %entry.post

entry.post:                                       ; preds = %entry
  %ecx.resume_at.addr = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 32
  %ecx.resume_at = load ptr, ptr %ecx.resume_at.addr, align 8
  %0 = icmp eq ptr %ecx.resume_at, null
  br i1 %0, label %no_resume, label %resume

resume:                                           ; preds = %entry.post
  %stack_len5539 = load i64, ptr %arg.stack_len.addr, align 8
  store i64 %stack_len5539, ptr %len.addr, align 8
  indirectbr ptr %ecx.resume_at, [label %OP1318.SWAP4]

no_resume:                                        ; preds = %entry.post
  store i64 0, ptr %len.addr, align 8
  br label %OP0.PUSH1

unreachable:                                      ; No predecessors!
  unreachable

OP0.PUSH1:                                        ; preds = %no_resume
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %1 = sub i64 %gas.remaining, 30
  %2 = icmp ult i64 %gas.remaining, 30
  store i64 %1, ptr %gas.remaining.addr, align 8
  br i1 %2, label %return, label %OP0.PUSH1.contd, !prof !2, !annotation !3

OP0.PUSH1.contd:                                  ; preds = %OP0.PUSH1
  %stack_len = load i64, ptr %len.addr, align 8
  %3 = icmp ugt i64 %stack_len, 1022
  br i1 %3, label %return, label %OP0.PUSH1.contd1, !prof !2, !annotation !4

OP0.PUSH1.contd1:                                 ; preds = %OP0.PUSH1.contd
  %4 = add i64 %stack_len, 1
  store i64 %4, ptr %len.addr, align 8
  %sp = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len
  store i256 96, ptr %sp, align 16
  br label %OP1.PUSH1, !annotation !5

OP1.PUSH1:                                        ; preds = %OP0.PUSH1.contd1
  %stack_len2 = load i64, ptr %len.addr, align 8
  %5 = add i64 %stack_len2, 1
  store i64 %5, ptr %len.addr, align 8
  %sp3 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2
  store i256 64, ptr %sp3, align 16
  br label %OP2.MSTORE, !annotation !5

OP2.MSTORE:                                       ; preds = %OP1.PUSH1
  %stack_len4 = load i64, ptr %len.addr, align 8
  %6 = add i64 %stack_len4, -2
  store i64 %6, ptr %len.addr, align 8
  %7 = add i64 %stack_len4, -1
  %sp5 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %7
  %a = load i256, ptr %sp5, align 16
  %8 = add i64 %stack_len4, -2
  %sp6 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %8
  %b = load i256, ptr %sp6, align 16
  %9 = call i8 @__revmc_ir_builtin_mstore(i256 %a, i256 %b, ptr %arg.ecx.addr)
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %return, label %OP2.MSTORE.contd, !prof !2

OP2.MSTORE.contd:                                 ; preds = %OP2.MSTORE
  br label %OP3.PUSH1, !annotation !5

OP3.PUSH1:                                        ; preds = %OP2.MSTORE.contd
  %stack_len7 = load i64, ptr %len.addr, align 8
  %11 = add i64 %stack_len7, 1
  store i64 %11, ptr %len.addr, align 8
  %sp8 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len7
  store i256 4, ptr %sp8, align 16
  br label %OP4.CALLDATASIZE, !annotation !5

OP4.CALLDATASIZE:                                 ; preds = %OP3.PUSH1
  %stack_len9 = load i64, ptr %len.addr, align 8
  %12 = add i64 %stack_len9, 1
  store i64 %12, ptr %len.addr, align 8
  %contract.input.len.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %contract.input.len = load i64, ptr %contract.input.len.addr, align 8
  %13 = zext i64 %contract.input.len to i256
  %sp10 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len9
  store i256 %13, ptr %sp10, align 16
  br label %OP5.LT, !annotation !5

OP5.LT:                                           ; preds = %OP4.CALLDATASIZE
  %stack_len11 = load i64, ptr %len.addr, align 8
  %14 = add i64 %stack_len11, -1
  store i64 %14, ptr %len.addr, align 8
  %15 = add i64 %stack_len11, -1
  %sp12 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %15
  %a13 = load i256, ptr %sp12, align 16
  %16 = add i64 %stack_len11, -2
  %sp14 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %16
  %b15 = load i256, ptr %sp14, align 16
  %17 = icmp ult i256 %a13, %b15
  %18 = zext i1 %17 to i256
  %19 = add i64 %stack_len11, -2
  %sp16 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %19
  store i256 %18, ptr %sp16, align 16
  br label %OP6.PUSH2, !annotation !5

OP6.PUSH2:                                        ; preds = %OP5.LT
  br label %OP7.JUMPI, !annotation !6

OP7.JUMPI:                                        ; preds = %OP6.PUSH2
  %stack_len17 = load i64, ptr %len.addr, align 8
  %20 = add i64 %stack_len17, -1
  store i64 %20, ptr %len.addr, align 8
  %21 = add i64 %stack_len17, -1
  %sp18 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %21
  %a19 = load i256, ptr %sp18, align 16
  %22 = icmp ne i256 %a19, 0
  br i1 %22, label %OP70.JUMPDEST, label %OP8.PUSH1

OP8.PUSH1:                                        ; preds = %OP7.JUMPI
  %gas.remaining20 = load i64, ptr %gas.remaining.addr, align 8
  %23 = sub i64 %gas.remaining20, 45
  %24 = icmp ult i64 %gas.remaining20, 45
  store i64 %23, ptr %gas.remaining.addr, align 8
  br i1 %24, label %return, label %OP8.PUSH1.contd, !prof !2, !annotation !3

OP8.PUSH1.contd:                                  ; preds = %OP8.PUSH1
  %stack_len21 = load i64, ptr %len.addr, align 8
  %25 = icmp ugt i64 %stack_len21, 1021
  br i1 %25, label %return, label %OP8.PUSH1.contd22, !prof !2, !annotation !4

OP8.PUSH1.contd22:                                ; preds = %OP8.PUSH1.contd
  %26 = add i64 %stack_len21, 1
  store i64 %26, ptr %len.addr, align 8
  %sp23 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len21
  store i256 0, ptr %sp23, align 16
  br label %OP9.CALLDATALOAD, !annotation !5

OP9.CALLDATALOAD:                                 ; preds = %OP8.PUSH1.contd22
  %stack_len24 = load i64, ptr %len.addr, align 8
  %27 = add i64 %stack_len24, -1
  %sp25 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %27
  %a26 = load i256, ptr %sp25, align 16
  %28 = call i256 @__revmc_ir_builtin_calldataload(i256 %a26, ptr %arg.contract.addr)
  %29 = add i64 %stack_len24, -1
  %sp27 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %29
  store i256 %28, ptr %sp27, align 16
  br label %OP10.PUSH29, !annotation !5

OP10.PUSH29:                                      ; preds = %OP9.CALLDATALOAD
  %stack_len28 = load i64, ptr %len.addr, align 8
  %30 = add i64 %stack_len28, 1
  store i64 %30, ptr %len.addr, align 8
  %sp29 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len28
  store i256 26959946667150639794667015087019630673637144422540572481103610249216, ptr %sp29, align 16
  br label %OP11.SWAP1, !annotation !5

OP11.SWAP1:                                       ; preds = %OP10.PUSH29
  %stack_len30 = load i64, ptr %len.addr, align 8
  %31 = sub i64 %stack_len30, 1
  %sp31 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %31
  %swap.a = load i256, ptr %sp31, align 16
  %32 = sub i64 %stack_len30, 2
  %sp32 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %32
  %swap.b = load i256, ptr %sp32, align 16
  store i256 %swap.a, ptr %sp32, align 16
  store i256 %swap.b, ptr %sp31, align 16
  br label %OP12.DIV, !annotation !5

OP12.DIV:                                         ; preds = %OP11.SWAP1
  %stack_len33 = load i64, ptr %len.addr, align 8
  %33 = add i64 %stack_len33, -1
  store i64 %33, ptr %len.addr, align 8
  %34 = add i64 %stack_len33, -1
  %sp34 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %34
  %a35 = load i256, ptr %sp34, align 16
  %35 = add i64 %stack_len33, -2
  %sp36 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %35
  %b37 = load i256, ptr %sp36, align 16
  %36 = icmp eq i256 %b37, 0
  %37 = udiv i256 %a35, %b37
  %38 = select i1 %36, i256 0, i256 %37
  %39 = add i64 %stack_len33, -2
  %sp38 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %39
  store i256 %38, ptr %sp38, align 16
  br label %OP13.PUSH4, !annotation !5

OP13.PUSH4:                                       ; preds = %OP12.DIV
  %stack_len39 = load i64, ptr %len.addr, align 8
  %40 = add i64 %stack_len39, 1
  store i64 %40, ptr %len.addr, align 8
  %sp40 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len39
  store i256 4294967295, ptr %sp40, align 16
  br label %OP14.AND, !annotation !5

OP14.AND:                                         ; preds = %OP13.PUSH4
  %stack_len41 = load i64, ptr %len.addr, align 8
  %41 = add i64 %stack_len41, -1
  store i64 %41, ptr %len.addr, align 8
  %42 = add i64 %stack_len41, -1
  %sp42 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %42
  %a43 = load i256, ptr %sp42, align 16
  %43 = add i64 %stack_len41, -2
  %sp44 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %43
  %b45 = load i256, ptr %sp44, align 16
  %44 = and i256 %a43, %b45
  %45 = add i64 %stack_len41, -2
  %sp46 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %45
  store i256 %44, ptr %sp46, align 16
  br label %OP15.DUP1, !annotation !5

OP15.DUP1:                                        ; preds = %OP14.AND
  %stack_len47 = load i64, ptr %len.addr, align 8
  %46 = add i64 %stack_len47, 1
  store i64 %46, ptr %len.addr, align 8
  %47 = sub i64 %stack_len47, 1
  %sp48 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %47
  %dup1 = load i256, ptr %sp48, align 16
  %sp49 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len47
  store i256 %dup1, ptr %sp49, align 16
  br label %OP16.PUSH4, !annotation !5

OP16.PUSH4:                                       ; preds = %OP15.DUP1
  %stack_len50 = load i64, ptr %len.addr, align 8
  %48 = add i64 %stack_len50, 1
  store i64 %48, ptr %len.addr, align 8
  %sp51 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len50
  store i256 117300739, ptr %sp51, align 16
  br label %OP17.EQ, !annotation !5

OP17.EQ:                                          ; preds = %OP16.PUSH4
  %stack_len52 = load i64, ptr %len.addr, align 8
  %49 = add i64 %stack_len52, -1
  store i64 %49, ptr %len.addr, align 8
  %50 = add i64 %stack_len52, -1
  %sp53 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %50
  %a54 = load i256, ptr %sp53, align 16
  %51 = add i64 %stack_len52, -2
  %sp55 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %51
  %b56 = load i256, ptr %sp55, align 16
  %52 = icmp eq i256 %a54, %b56
  %53 = zext i1 %52 to i256
  %54 = add i64 %stack_len52, -2
  %sp57 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %54
  store i256 %53, ptr %sp57, align 16
  br label %OP18.PUSH2, !annotation !5

OP18.PUSH2:                                       ; preds = %OP17.EQ
  br label %OP19.JUMPI, !annotation !6

OP19.JUMPI:                                       ; preds = %OP18.PUSH2
  %stack_len58 = load i64, ptr %len.addr, align 8
  %55 = add i64 %stack_len58, -1
  store i64 %55, ptr %len.addr, align 8
  %56 = add i64 %stack_len58, -1
  %sp59 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %56
  %a60 = load i256, ptr %sp59, align 16
  %57 = icmp ne i256 %a60, 0
  br i1 %57, label %OP76.JUMPDEST, label %OP20.DUP1

OP20.DUP1:                                        ; preds = %OP19.JUMPI
  %gas.remaining61 = load i64, ptr %gas.remaining.addr, align 8
  %58 = sub i64 %gas.remaining61, 22
  %59 = icmp ult i64 %gas.remaining61, 22
  store i64 %58, ptr %gas.remaining.addr, align 8
  br i1 %59, label %return, label %OP20.DUP1.contd, !prof !2, !annotation !3

OP20.DUP1.contd:                                  ; preds = %OP20.DUP1
  %stack_len62 = load i64, ptr %len.addr, align 8
  %60 = icmp ult i64 %stack_len62, 1
  %61 = icmp ugt i64 %stack_len62, 1022
  %62 = or i1 %60, %61
  %63 = select i1 %60, i8 91, i8 92
  br i1 %62, label %return, label %OP20.DUP1.contd63, !prof !2

OP20.DUP1.contd63:                                ; preds = %OP20.DUP1.contd
  %64 = add i64 %stack_len62, 1
  store i64 %64, ptr %len.addr, align 8
  %65 = sub i64 %stack_len62, 1
  %sp64 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %65
  %dup165 = load i256, ptr %sp64, align 16
  %sp66 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len62
  store i256 %dup165, ptr %sp66, align 16
  br label %OP21.PUSH4, !annotation !5

OP21.PUSH4:                                       ; preds = %OP20.DUP1.contd63
  %stack_len67 = load i64, ptr %len.addr, align 8
  %66 = add i64 %stack_len67, 1
  store i64 %66, ptr %len.addr, align 8
  %sp68 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len67
  store i256 157198259, ptr %sp68, align 16
  br label %OP22.EQ, !annotation !5

OP22.EQ:                                          ; preds = %OP21.PUSH4
  %stack_len69 = load i64, ptr %len.addr, align 8
  %67 = add i64 %stack_len69, -1
  store i64 %67, ptr %len.addr, align 8
  %68 = add i64 %stack_len69, -1
  %sp70 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %68
  %a71 = load i256, ptr %sp70, align 16
  %69 = add i64 %stack_len69, -2
  %sp72 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %69
  %b73 = load i256, ptr %sp72, align 16
  %70 = icmp eq i256 %a71, %b73
  %71 = zext i1 %70 to i256
  %72 = add i64 %stack_len69, -2
  %sp74 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %72
  store i256 %71, ptr %sp74, align 16
  br label %OP23.PUSH2, !annotation !5

OP23.PUSH2:                                       ; preds = %OP22.EQ
  br label %OP24.JUMPI, !annotation !6

OP24.JUMPI:                                       ; preds = %OP23.PUSH2
  %stack_len75 = load i64, ptr %len.addr, align 8
  %73 = add i64 %stack_len75, -1
  store i64 %73, ptr %len.addr, align 8
  %74 = add i64 %stack_len75, -1
  %sp76 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %74
  %a77 = load i256, ptr %sp76, align 16
  %75 = icmp ne i256 %a77, 0
  br i1 %75, label %OP192.JUMPDEST, label %OP25.DUP1

OP25.DUP1:                                        ; preds = %OP24.JUMPI
  %gas.remaining78 = load i64, ptr %gas.remaining.addr, align 8
  %76 = sub i64 %gas.remaining78, 22
  %77 = icmp ult i64 %gas.remaining78, 22
  store i64 %76, ptr %gas.remaining.addr, align 8
  br i1 %77, label %return, label %OP25.DUP1.contd, !prof !2, !annotation !3

OP25.DUP1.contd:                                  ; preds = %OP25.DUP1
  %stack_len79 = load i64, ptr %len.addr, align 8
  %78 = icmp ult i64 %stack_len79, 1
  %79 = icmp ugt i64 %stack_len79, 1022
  %80 = or i1 %78, %79
  %81 = select i1 %78, i8 91, i8 92
  br i1 %80, label %return, label %OP25.DUP1.contd80, !prof !2

OP25.DUP1.contd80:                                ; preds = %OP25.DUP1.contd
  %82 = add i64 %stack_len79, 1
  store i64 %82, ptr %len.addr, align 8
  %83 = sub i64 %stack_len79, 1
  %sp81 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %83
  %dup182 = load i256, ptr %sp81, align 16
  %sp83 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len79
  store i256 %dup182, ptr %sp83, align 16
  br label %OP26.PUSH4, !annotation !5

OP26.PUSH4:                                       ; preds = %OP25.DUP1.contd80
  %stack_len84 = load i64, ptr %len.addr, align 8
  %84 = add i64 %stack_len84, 1
  store i64 %84, ptr %len.addr, align 8
  %sp85 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len84
  store i256 404098525, ptr %sp85, align 16
  br label %OP27.EQ, !annotation !5

OP27.EQ:                                          ; preds = %OP26.PUSH4
  %stack_len86 = load i64, ptr %len.addr, align 8
  %85 = add i64 %stack_len86, -1
  store i64 %85, ptr %len.addr, align 8
  %86 = add i64 %stack_len86, -1
  %sp87 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %86
  %a88 = load i256, ptr %sp87, align 16
  %87 = add i64 %stack_len86, -2
  %sp89 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %87
  %b90 = load i256, ptr %sp89, align 16
  %88 = icmp eq i256 %a88, %b90
  %89 = zext i1 %88 to i256
  %90 = add i64 %stack_len86, -2
  %sp91 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %90
  store i256 %89, ptr %sp91, align 16
  br label %OP28.PUSH2, !annotation !5

OP28.PUSH2:                                       ; preds = %OP27.EQ
  br label %OP29.JUMPI, !annotation !6

OP29.JUMPI:                                       ; preds = %OP28.PUSH2
  %stack_len92 = load i64, ptr %len.addr, align 8
  %91 = add i64 %stack_len92, -1
  store i64 %91, ptr %len.addr, align 8
  %92 = add i64 %stack_len92, -1
  %sp93 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %92
  %a94 = load i256, ptr %sp93, align 16
  %93 = icmp ne i256 %a94, 0
  br i1 %93, label %OP249.JUMPDEST, label %OP30.DUP1

OP30.DUP1:                                        ; preds = %OP29.JUMPI
  %gas.remaining95 = load i64, ptr %gas.remaining.addr, align 8
  %94 = sub i64 %gas.remaining95, 22
  %95 = icmp ult i64 %gas.remaining95, 22
  store i64 %94, ptr %gas.remaining.addr, align 8
  br i1 %95, label %return, label %OP30.DUP1.contd, !prof !2, !annotation !3

OP30.DUP1.contd:                                  ; preds = %OP30.DUP1
  %stack_len96 = load i64, ptr %len.addr, align 8
  %96 = icmp ult i64 %stack_len96, 1
  %97 = icmp ugt i64 %stack_len96, 1022
  %98 = or i1 %96, %97
  %99 = select i1 %96, i8 91, i8 92
  br i1 %98, label %return, label %OP30.DUP1.contd97, !prof !2

OP30.DUP1.contd97:                                ; preds = %OP30.DUP1.contd
  %100 = add i64 %stack_len96, 1
  store i64 %100, ptr %len.addr, align 8
  %101 = sub i64 %stack_len96, 1
  %sp98 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %101
  %dup199 = load i256, ptr %sp98, align 16
  %sp100 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len96
  store i256 %dup199, ptr %sp100, align 16
  br label %OP31.PUSH4, !annotation !5

OP31.PUSH4:                                       ; preds = %OP30.DUP1.contd97
  %stack_len101 = load i64, ptr %len.addr, align 8
  %102 = add i64 %stack_len101, 1
  store i64 %102, ptr %len.addr, align 8
  %sp102 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len101
  store i256 599290589, ptr %sp102, align 16
  br label %OP32.EQ, !annotation !5

OP32.EQ:                                          ; preds = %OP31.PUSH4
  %stack_len103 = load i64, ptr %len.addr, align 8
  %103 = add i64 %stack_len103, -1
  store i64 %103, ptr %len.addr, align 8
  %104 = add i64 %stack_len103, -1
  %sp104 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %104
  %a105 = load i256, ptr %sp104, align 16
  %105 = add i64 %stack_len103, -2
  %sp106 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %105
  %b107 = load i256, ptr %sp106, align 16
  %106 = icmp eq i256 %a105, %b107
  %107 = zext i1 %106 to i256
  %108 = add i64 %stack_len103, -2
  %sp108 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %108
  store i256 %107, ptr %sp108, align 16
  br label %OP33.PUSH2, !annotation !5

OP33.PUSH2:                                       ; preds = %OP32.EQ
  br label %OP34.JUMPI, !annotation !6

OP34.JUMPI:                                       ; preds = %OP33.PUSH2
  %stack_len109 = load i64, ptr %len.addr, align 8
  %109 = add i64 %stack_len109, -1
  store i64 %109, ptr %len.addr, align 8
  %110 = add i64 %stack_len109, -1
  %sp110 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %110
  %a111 = load i256, ptr %sp110, align 16
  %111 = icmp ne i256 %a111, 0
  br i1 %111, label %OP280.JUMPDEST, label %OP35.DUP1

OP35.DUP1:                                        ; preds = %OP34.JUMPI
  %gas.remaining112 = load i64, ptr %gas.remaining.addr, align 8
  %112 = sub i64 %gas.remaining112, 22
  %113 = icmp ult i64 %gas.remaining112, 22
  store i64 %112, ptr %gas.remaining.addr, align 8
  br i1 %113, label %return, label %OP35.DUP1.contd, !prof !2, !annotation !3

OP35.DUP1.contd:                                  ; preds = %OP35.DUP1
  %stack_len113 = load i64, ptr %len.addr, align 8
  %114 = icmp ult i64 %stack_len113, 1
  %115 = icmp ugt i64 %stack_len113, 1022
  %116 = or i1 %114, %115
  %117 = select i1 %114, i8 91, i8 92
  br i1 %116, label %return, label %OP35.DUP1.contd114, !prof !2

OP35.DUP1.contd114:                               ; preds = %OP35.DUP1.contd
  %118 = add i64 %stack_len113, 1
  store i64 %118, ptr %len.addr, align 8
  %119 = sub i64 %stack_len113, 1
  %sp115 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %119
  %dup1116 = load i256, ptr %sp115, align 16
  %sp117 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len113
  store i256 %dup1116, ptr %sp117, align 16
  br label %OP36.PUSH4, !annotation !5

OP36.PUSH4:                                       ; preds = %OP35.DUP1.contd114
  %stack_len118 = load i64, ptr %len.addr, align 8
  %120 = add i64 %stack_len118, 1
  store i64 %120, ptr %len.addr, align 8
  %sp119 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len118
  store i256 773487949, ptr %sp119, align 16
  br label %OP37.EQ, !annotation !5

OP37.EQ:                                          ; preds = %OP36.PUSH4
  %stack_len120 = load i64, ptr %len.addr, align 8
  %121 = add i64 %stack_len120, -1
  store i64 %121, ptr %len.addr, align 8
  %122 = add i64 %stack_len120, -1
  %sp121 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %122
  %a122 = load i256, ptr %sp121, align 16
  %123 = add i64 %stack_len120, -2
  %sp123 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %123
  %b124 = load i256, ptr %sp123, align 16
  %124 = icmp eq i256 %a122, %b124
  %125 = zext i1 %124 to i256
  %126 = add i64 %stack_len120, -2
  %sp125 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %126
  store i256 %125, ptr %sp125, align 16
  br label %OP38.PUSH2, !annotation !5

OP38.PUSH2:                                       ; preds = %OP37.EQ
  br label %OP39.JUMPI, !annotation !6

OP39.JUMPI:                                       ; preds = %OP38.PUSH2
  %stack_len126 = load i64, ptr %len.addr, align 8
  %127 = add i64 %stack_len126, -1
  store i64 %127, ptr %len.addr, align 8
  %128 = add i64 %stack_len126, -1
  %sp127 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %128
  %a128 = load i256, ptr %sp127, align 16
  %129 = icmp ne i256 %a128, 0
  br i1 %129, label %OP347.JUMPDEST, label %OP40.DUP1

OP40.DUP1:                                        ; preds = %OP39.JUMPI
  %gas.remaining129 = load i64, ptr %gas.remaining.addr, align 8
  %130 = sub i64 %gas.remaining129, 22
  %131 = icmp ult i64 %gas.remaining129, 22
  store i64 %130, ptr %gas.remaining.addr, align 8
  br i1 %131, label %return, label %OP40.DUP1.contd, !prof !2, !annotation !3

OP40.DUP1.contd:                                  ; preds = %OP40.DUP1
  %stack_len130 = load i64, ptr %len.addr, align 8
  %132 = icmp ult i64 %stack_len130, 1
  %133 = icmp ugt i64 %stack_len130, 1022
  %134 = or i1 %132, %133
  %135 = select i1 %132, i8 91, i8 92
  br i1 %134, label %return, label %OP40.DUP1.contd131, !prof !2

OP40.DUP1.contd131:                               ; preds = %OP40.DUP1.contd
  %136 = add i64 %stack_len130, 1
  store i64 %136, ptr %len.addr, align 8
  %137 = sub i64 %stack_len130, 1
  %sp132 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %137
  %dup1133 = load i256, ptr %sp132, align 16
  %sp134 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len130
  store i256 %dup1133, ptr %sp134, align 16
  br label %OP41.PUSH4, !annotation !5

OP41.PUSH4:                                       ; preds = %OP40.DUP1.contd131
  %stack_len135 = load i64, ptr %len.addr, align 8
  %138 = add i64 %stack_len135, 1
  store i64 %138, ptr %len.addr, align 8
  %sp136 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len135
  store i256 826074471, ptr %sp136, align 16
  br label %OP42.EQ, !annotation !5

OP42.EQ:                                          ; preds = %OP41.PUSH4
  %stack_len137 = load i64, ptr %len.addr, align 8
  %139 = add i64 %stack_len137, -1
  store i64 %139, ptr %len.addr, align 8
  %140 = add i64 %stack_len137, -1
  %sp138 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %140
  %a139 = load i256, ptr %sp138, align 16
  %141 = add i64 %stack_len137, -2
  %sp140 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %141
  %b141 = load i256, ptr %sp140, align 16
  %142 = icmp eq i256 %a139, %b141
  %143 = zext i1 %142 to i256
  %144 = add i64 %stack_len137, -2
  %sp142 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %144
  store i256 %143, ptr %sp142, align 16
  br label %OP43.PUSH2, !annotation !5

OP43.PUSH2:                                       ; preds = %OP42.EQ
  br label %OP44.JUMPI, !annotation !6

OP44.JUMPI:                                       ; preds = %OP43.PUSH2
  %stack_len143 = load i64, ptr %len.addr, align 8
  %145 = add i64 %stack_len143, -1
  store i64 %145, ptr %len.addr, align 8
  %146 = add i64 %stack_len143, -1
  %sp144 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %146
  %a145 = load i256, ptr %sp144, align 16
  %147 = icmp ne i256 %a145, 0
  br i1 %147, label %OP373.JUMPDEST, label %OP45.DUP1

OP45.DUP1:                                        ; preds = %OP44.JUMPI
  %gas.remaining146 = load i64, ptr %gas.remaining.addr, align 8
  %148 = sub i64 %gas.remaining146, 22
  %149 = icmp ult i64 %gas.remaining146, 22
  store i64 %148, ptr %gas.remaining.addr, align 8
  br i1 %149, label %return, label %OP45.DUP1.contd, !prof !2, !annotation !3

OP45.DUP1.contd:                                  ; preds = %OP45.DUP1
  %stack_len147 = load i64, ptr %len.addr, align 8
  %150 = icmp ult i64 %stack_len147, 1
  %151 = icmp ugt i64 %stack_len147, 1022
  %152 = or i1 %150, %151
  %153 = select i1 %150, i8 91, i8 92
  br i1 %152, label %return, label %OP45.DUP1.contd148, !prof !2

OP45.DUP1.contd148:                               ; preds = %OP45.DUP1.contd
  %154 = add i64 %stack_len147, 1
  store i64 %154, ptr %len.addr, align 8
  %155 = sub i64 %stack_len147, 1
  %sp149 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %155
  %dup1150 = load i256, ptr %sp149, align 16
  %sp151 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len147
  store i256 %dup1150, ptr %sp151, align 16
  br label %OP46.PUSH4, !annotation !5

OP46.PUSH4:                                       ; preds = %OP45.DUP1.contd148
  %stack_len152 = load i64, ptr %len.addr, align 8
  %156 = add i64 %stack_len152, 1
  store i64 %156, ptr %len.addr, align 8
  %sp153 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len152
  store i256 1889567281, ptr %sp153, align 16
  br label %OP47.EQ, !annotation !5

OP47.EQ:                                          ; preds = %OP46.PUSH4
  %stack_len154 = load i64, ptr %len.addr, align 8
  %157 = add i64 %stack_len154, -1
  store i64 %157, ptr %len.addr, align 8
  %158 = add i64 %stack_len154, -1
  %sp155 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %158
  %a156 = load i256, ptr %sp155, align 16
  %159 = add i64 %stack_len154, -2
  %sp157 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %159
  %b158 = load i256, ptr %sp157, align 16
  %160 = icmp eq i256 %a156, %b158
  %161 = zext i1 %160 to i256
  %162 = add i64 %stack_len154, -2
  %sp159 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %162
  store i256 %161, ptr %sp159, align 16
  br label %OP48.PUSH2, !annotation !5

OP48.PUSH2:                                       ; preds = %OP47.EQ
  br label %OP49.JUMPI, !annotation !6

OP49.JUMPI:                                       ; preds = %OP48.PUSH2
  %stack_len160 = load i64, ptr %len.addr, align 8
  %163 = add i64 %stack_len160, -1
  store i64 %163, ptr %len.addr, align 8
  %164 = add i64 %stack_len160, -1
  %sp161 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %164
  %a162 = load i256, ptr %sp161, align 16
  %165 = icmp ne i256 %a162, 0
  br i1 %165, label %OP408.JUMPDEST, label %OP50.DUP1

OP50.DUP1:                                        ; preds = %OP49.JUMPI
  %gas.remaining163 = load i64, ptr %gas.remaining.addr, align 8
  %166 = sub i64 %gas.remaining163, 22
  %167 = icmp ult i64 %gas.remaining163, 22
  store i64 %166, ptr %gas.remaining.addr, align 8
  br i1 %167, label %return, label %OP50.DUP1.contd, !prof !2, !annotation !3

OP50.DUP1.contd:                                  ; preds = %OP50.DUP1
  %stack_len164 = load i64, ptr %len.addr, align 8
  %168 = icmp ult i64 %stack_len164, 1
  %169 = icmp ugt i64 %stack_len164, 1022
  %170 = or i1 %168, %169
  %171 = select i1 %168, i8 91, i8 92
  br i1 %170, label %return, label %OP50.DUP1.contd165, !prof !2

OP50.DUP1.contd165:                               ; preds = %OP50.DUP1.contd
  %172 = add i64 %stack_len164, 1
  store i64 %172, ptr %len.addr, align 8
  %173 = sub i64 %stack_len164, 1
  %sp166 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %173
  %dup1167 = load i256, ptr %sp166, align 16
  %sp168 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len164
  store i256 %dup1167, ptr %sp168, align 16
  br label %OP51.PUSH4, !annotation !5

OP51.PUSH4:                                       ; preds = %OP50.DUP1.contd165
  %stack_len169 = load i64, ptr %len.addr, align 8
  %174 = add i64 %stack_len169, 1
  store i64 %174, ptr %len.addr, align 8
  %sp170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len169
  store i256 2514000705, ptr %sp170, align 16
  br label %OP52.EQ, !annotation !5

OP52.EQ:                                          ; preds = %OP51.PUSH4
  %stack_len171 = load i64, ptr %len.addr, align 8
  %175 = add i64 %stack_len171, -1
  store i64 %175, ptr %len.addr, align 8
  %176 = add i64 %stack_len171, -1
  %sp172 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %176
  %a173 = load i256, ptr %sp172, align 16
  %177 = add i64 %stack_len171, -2
  %sp174 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %177
  %b175 = load i256, ptr %sp174, align 16
  %178 = icmp eq i256 %a173, %b175
  %179 = zext i1 %178 to i256
  %180 = add i64 %stack_len171, -2
  %sp176 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %180
  store i256 %179, ptr %sp176, align 16
  br label %OP53.PUSH2, !annotation !5

OP53.PUSH2:                                       ; preds = %OP52.EQ
  br label %OP54.JUMPI, !annotation !6

OP54.JUMPI:                                       ; preds = %OP53.PUSH2
  %stack_len177 = load i64, ptr %len.addr, align 8
  %181 = add i64 %stack_len177, -1
  store i64 %181, ptr %len.addr, align 8
  %182 = add i64 %stack_len177, -1
  %sp178 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %182
  %a179 = load i256, ptr %sp178, align 16
  %183 = icmp ne i256 %a179, 0
  br i1 %183, label %OP453.JUMPDEST, label %OP55.DUP1

OP55.DUP1:                                        ; preds = %OP54.JUMPI
  %gas.remaining180 = load i64, ptr %gas.remaining.addr, align 8
  %184 = sub i64 %gas.remaining180, 22
  %185 = icmp ult i64 %gas.remaining180, 22
  store i64 %184, ptr %gas.remaining.addr, align 8
  br i1 %185, label %return, label %OP55.DUP1.contd, !prof !2, !annotation !3

OP55.DUP1.contd:                                  ; preds = %OP55.DUP1
  %stack_len181 = load i64, ptr %len.addr, align 8
  %186 = icmp ult i64 %stack_len181, 1
  %187 = icmp ugt i64 %stack_len181, 1022
  %188 = or i1 %186, %187
  %189 = select i1 %186, i8 91, i8 92
  br i1 %188, label %return, label %OP55.DUP1.contd182, !prof !2

OP55.DUP1.contd182:                               ; preds = %OP55.DUP1.contd
  %190 = add i64 %stack_len181, 1
  store i64 %190, ptr %len.addr, align 8
  %191 = sub i64 %stack_len181, 1
  %sp183 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %191
  %dup1184 = load i256, ptr %sp183, align 16
  %sp185 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len181
  store i256 %dup1184, ptr %sp185, align 16
  br label %OP56.PUSH4, !annotation !5

OP56.PUSH4:                                       ; preds = %OP55.DUP1.contd182
  %stack_len186 = load i64, ptr %len.addr, align 8
  %192 = add i64 %stack_len186, 1
  store i64 %192, ptr %len.addr, align 8
  %sp187 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len186
  store i256 2835717307, ptr %sp187, align 16
  br label %OP57.EQ, !annotation !5

OP57.EQ:                                          ; preds = %OP56.PUSH4
  %stack_len188 = load i64, ptr %len.addr, align 8
  %193 = add i64 %stack_len188, -1
  store i64 %193, ptr %len.addr, align 8
  %194 = add i64 %stack_len188, -1
  %sp189 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %194
  %a190 = load i256, ptr %sp189, align 16
  %195 = add i64 %stack_len188, -2
  %sp191 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %195
  %b192 = load i256, ptr %sp191, align 16
  %196 = icmp eq i256 %a190, %b192
  %197 = zext i1 %196 to i256
  %198 = add i64 %stack_len188, -2
  %sp193 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %198
  store i256 %197, ptr %sp193, align 16
  br label %OP58.PUSH2, !annotation !5

OP58.PUSH2:                                       ; preds = %OP57.EQ
  br label %OP59.JUMPI, !annotation !6

OP59.JUMPI:                                       ; preds = %OP58.PUSH2
  %stack_len194 = load i64, ptr %len.addr, align 8
  %199 = add i64 %stack_len194, -1
  store i64 %199, ptr %len.addr, align 8
  %200 = add i64 %stack_len194, -1
  %sp195 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %200
  %a196 = load i256, ptr %sp195, align 16
  %201 = icmp ne i256 %a196, 0
  br i1 %201, label %OP569.JUMPDEST, label %OP60.DUP1

OP60.DUP1:                                        ; preds = %OP59.JUMPI
  %gas.remaining197 = load i64, ptr %gas.remaining.addr, align 8
  %202 = sub i64 %gas.remaining197, 22
  %203 = icmp ult i64 %gas.remaining197, 22
  store i64 %202, ptr %gas.remaining.addr, align 8
  br i1 %203, label %return, label %OP60.DUP1.contd, !prof !2, !annotation !3

OP60.DUP1.contd:                                  ; preds = %OP60.DUP1
  %stack_len198 = load i64, ptr %len.addr, align 8
  %204 = icmp ult i64 %stack_len198, 1
  %205 = icmp ugt i64 %stack_len198, 1022
  %206 = or i1 %204, %205
  %207 = select i1 %204, i8 91, i8 92
  br i1 %206, label %return, label %OP60.DUP1.contd199, !prof !2

OP60.DUP1.contd199:                               ; preds = %OP60.DUP1.contd
  %208 = add i64 %stack_len198, 1
  store i64 %208, ptr %len.addr, align 8
  %209 = sub i64 %stack_len198, 1
  %sp200 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %209
  %dup1201 = load i256, ptr %sp200, align 16
  %sp202 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len198
  store i256 %dup1201, ptr %sp202, align 16
  br label %OP61.PUSH4, !annotation !5

OP61.PUSH4:                                       ; preds = %OP60.DUP1.contd199
  %stack_len203 = load i64, ptr %len.addr, align 8
  %210 = add i64 %stack_len203, 1
  store i64 %210, ptr %len.addr, align 8
  %sp204 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len203
  store i256 3504541104, ptr %sp204, align 16
  br label %OP62.EQ, !annotation !5

OP62.EQ:                                          ; preds = %OP61.PUSH4
  %stack_len205 = load i64, ptr %len.addr, align 8
  %211 = add i64 %stack_len205, -1
  store i64 %211, ptr %len.addr, align 8
  %212 = add i64 %stack_len205, -1
  %sp206 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %212
  %a207 = load i256, ptr %sp206, align 16
  %213 = add i64 %stack_len205, -2
  %sp208 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %213
  %b209 = load i256, ptr %sp208, align 16
  %214 = icmp eq i256 %a207, %b209
  %215 = zext i1 %214 to i256
  %216 = add i64 %stack_len205, -2
  %sp210 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %216
  store i256 %215, ptr %sp210, align 16
  br label %OP63.PUSH2, !annotation !5

OP63.PUSH2:                                       ; preds = %OP62.EQ
  br label %OP64.JUMPI, !annotation !6

OP64.JUMPI:                                       ; preds = %OP63.PUSH2
  %stack_len211 = load i64, ptr %len.addr, align 8
  %217 = add i64 %stack_len211, -1
  store i64 %217, ptr %len.addr, align 8
  %218 = add i64 %stack_len211, -1
  %sp212 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %218
  %a213 = load i256, ptr %sp212, align 16
  %219 = icmp ne i256 %a213, 0
  br i1 %219, label %OP626.JUMPDEST, label %OP65.DUP1

OP65.DUP1:                                        ; preds = %OP64.JUMPI
  %gas.remaining214 = load i64, ptr %gas.remaining.addr, align 8
  %220 = sub i64 %gas.remaining214, 22
  %221 = icmp ult i64 %gas.remaining214, 22
  store i64 %220, ptr %gas.remaining.addr, align 8
  br i1 %221, label %return, label %OP65.DUP1.contd, !prof !2, !annotation !3

OP65.DUP1.contd:                                  ; preds = %OP65.DUP1
  %stack_len215 = load i64, ptr %len.addr, align 8
  %222 = icmp ult i64 %stack_len215, 1
  %223 = icmp ugt i64 %stack_len215, 1022
  %224 = or i1 %222, %223
  %225 = select i1 %222, i8 91, i8 92
  br i1 %224, label %return, label %OP65.DUP1.contd216, !prof !2

OP65.DUP1.contd216:                               ; preds = %OP65.DUP1.contd
  %226 = add i64 %stack_len215, 1
  store i64 %226, ptr %len.addr, align 8
  %227 = sub i64 %stack_len215, 1
  %sp217 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %227
  %dup1218 = load i256, ptr %sp217, align 16
  %sp219 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len215
  store i256 %dup1218, ptr %sp219, align 16
  br label %OP66.PUSH4, !annotation !5

OP66.PUSH4:                                       ; preds = %OP65.DUP1.contd216
  %stack_len220 = load i64, ptr %len.addr, align 8
  %228 = add i64 %stack_len220, 1
  store i64 %228, ptr %len.addr, align 8
  %sp221 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len220
  store i256 3714247998, ptr %sp221, align 16
  br label %OP67.EQ, !annotation !5

OP67.EQ:                                          ; preds = %OP66.PUSH4
  %stack_len222 = load i64, ptr %len.addr, align 8
  %229 = add i64 %stack_len222, -1
  store i64 %229, ptr %len.addr, align 8
  %230 = add i64 %stack_len222, -1
  %sp223 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %230
  %a224 = load i256, ptr %sp223, align 16
  %231 = add i64 %stack_len222, -2
  %sp225 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %231
  %b226 = load i256, ptr %sp225, align 16
  %232 = icmp eq i256 %a224, %b226
  %233 = zext i1 %232 to i256
  %234 = add i64 %stack_len222, -2
  %sp227 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %234
  store i256 %233, ptr %sp227, align 16
  br label %OP68.PUSH2, !annotation !5

OP68.PUSH2:                                       ; preds = %OP67.EQ
  br label %OP69.JUMPI, !annotation !6

OP69.JUMPI:                                       ; preds = %OP68.PUSH2
  %stack_len228 = load i64, ptr %len.addr, align 8
  %235 = add i64 %stack_len228, -1
  store i64 %235, ptr %len.addr, align 8
  %236 = add i64 %stack_len228, -1
  %sp229 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %236
  %a230 = load i256, ptr %sp229, align 16
  %237 = icmp ne i256 %a230, 0
  br i1 %237, label %OP632.JUMPDEST, label %OP70.JUMPDEST

OP70.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP69.JUMPI, %OP7.JUMPI
  %gas.remaining231 = load i64, ptr %gas.remaining.addr, align 8
  %238 = sub i64 %gas.remaining231, 15
  %239 = icmp ult i64 %gas.remaining231, 15
  store i64 %238, ptr %gas.remaining.addr, align 8
  br i1 %239, label %return, label %OP70.JUMPDEST.contd, !prof !2, !annotation !3

OP70.JUMPDEST.contd:                              ; preds = %OP70.JUMPDEST
  %stack_len232 = load i64, ptr %len.addr, align 8
  %240 = icmp ugt i64 %stack_len232, 1022
  br i1 %240, label %return, label %OP70.JUMPDEST.contd233, !prof !2, !annotation !4

OP70.JUMPDEST.contd233:                           ; preds = %OP70.JUMPDEST.contd
  br label %OP71.PUSH2, !annotation !5

OP71.PUSH2:                                       ; preds = %OP70.JUMPDEST.contd233
  %stack_len234 = load i64, ptr %len.addr, align 8
  %241 = add i64 %stack_len234, 1
  store i64 %241, ptr %len.addr, align 8
  %sp235 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len234
  store i256 183, ptr %sp235, align 16
  br label %OP72.PUSH2, !annotation !5

OP72.PUSH2:                                       ; preds = %OP71.PUSH2
  br label %OP73.JUMP, !annotation !6

OP73.JUMP:                                        ; preds = %OP72.PUSH2
  %stack_len236 = load i64, ptr %len.addr, align 8
  br label %OP687.JUMPDEST

OP74.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining237 = load i64, ptr %gas.remaining.addr, align 8
  %242 = sub i64 %gas.remaining237, 1
  %243 = icmp ult i64 %gas.remaining237, 1
  store i64 %242, ptr %gas.remaining.addr, align 8
  br i1 %243, label %return, label %OP74.JUMPDEST.contd, !prof !2, !annotation !3

OP74.JUMPDEST.contd:                              ; preds = %OP74.JUMPDEST
  %stack_len238 = load i64, ptr %len.addr, align 8
  br label %OP75.STOP, !annotation !5

OP75.STOP:                                        ; preds = %OP74.JUMPDEST.contd
  %stack_len239 = load i64, ptr %len.addr, align 8
  br label %return, !annotation !7

OP76.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP19.JUMPI
  %gas.remaining240 = load i64, ptr %gas.remaining.addr, align 8
  %244 = sub i64 %gas.remaining240, 19
  %245 = icmp ult i64 %gas.remaining240, 19
  store i64 %244, ptr %gas.remaining.addr, align 8
  br i1 %245, label %return, label %OP76.JUMPDEST.contd, !prof !2, !annotation !3

OP76.JUMPDEST.contd:                              ; preds = %OP76.JUMPDEST
  %stack_len241 = load i64, ptr %len.addr, align 8
  %246 = icmp ugt i64 %stack_len241, 1022
  br i1 %246, label %return, label %OP76.JUMPDEST.contd242, !prof !2, !annotation !4

OP76.JUMPDEST.contd242:                           ; preds = %OP76.JUMPDEST.contd
  br label %OP77.CALLVALUE, !annotation !5

OP77.CALLVALUE:                                   ; preds = %OP76.JUMPDEST.contd242
  %stack_len243 = load i64, ptr %len.addr, align 8
  %247 = add i64 %stack_len243, 1
  store i64 %247, ptr %len.addr, align 8
  %contract.call_value.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value = load i256, ptr %contract.call_value.addr, align 16
  %sp244 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len243
  store i256 %contract.call_value, ptr %sp244, align 16
  br label %OP78.ISZERO, !annotation !5

OP78.ISZERO:                                      ; preds = %OP77.CALLVALUE
  %stack_len245 = load i64, ptr %len.addr, align 8
  %248 = add i64 %stack_len245, -1
  %sp246 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %248
  %a247 = load i256, ptr %sp246, align 16
  %249 = icmp eq i256 %a247, 0
  %250 = zext i1 %249 to i256
  %251 = add i64 %stack_len245, -1
  %sp248 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %251
  store i256 %250, ptr %sp248, align 16
  br label %OP79.PUSH2, !annotation !5

OP79.PUSH2:                                       ; preds = %OP78.ISZERO
  br label %OP80.JUMPI, !annotation !6

OP80.JUMPI:                                       ; preds = %OP79.PUSH2
  %stack_len249 = load i64, ptr %len.addr, align 8
  %252 = add i64 %stack_len249, -1
  store i64 %252, ptr %len.addr, align 8
  %253 = add i64 %stack_len249, -1
  %sp250 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %253
  %a251 = load i256, ptr %sp250, align 16
  %254 = icmp ne i256 %a251, 0
  br i1 %254, label %OP84.JUMPDEST, label %OP81.PUSH1

OP81.PUSH1:                                       ; preds = %OP80.JUMPI
  %gas.remaining252 = load i64, ptr %gas.remaining.addr, align 8
  %255 = sub i64 %gas.remaining252, 6
  %256 = icmp ult i64 %gas.remaining252, 6
  store i64 %255, ptr %gas.remaining.addr, align 8
  br i1 %256, label %return, label %OP81.PUSH1.contd, !prof !2, !annotation !3

OP81.PUSH1.contd:                                 ; preds = %OP81.PUSH1
  %stack_len253 = load i64, ptr %len.addr, align 8
  %257 = icmp ugt i64 %stack_len253, 1022
  br i1 %257, label %return, label %OP81.PUSH1.contd254, !prof !2, !annotation !4

OP81.PUSH1.contd254:                              ; preds = %OP81.PUSH1.contd
  %258 = add i64 %stack_len253, 1
  store i64 %258, ptr %len.addr, align 8
  %sp255 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len253
  store i256 0, ptr %sp255, align 16
  br label %OP82.DUP1, !annotation !5

OP82.DUP1:                                        ; preds = %OP81.PUSH1.contd254
  %stack_len256 = load i64, ptr %len.addr, align 8
  %259 = add i64 %stack_len256, 1
  store i64 %259, ptr %len.addr, align 8
  %260 = sub i64 %stack_len256, 1
  %sp257 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %260
  %dup1258 = load i256, ptr %sp257, align 16
  %sp259 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len256
  store i256 %dup1258, ptr %sp259, align 16
  br label %OP83.REVERT, !annotation !5

OP83.REVERT:                                      ; preds = %OP82.DUP1
  %stack_len260 = load i64, ptr %len.addr, align 8
  %261 = add i64 %stack_len260, -2
  store i64 %261, ptr %len.addr, align 8
  %262 = sub i64 %stack_len260, 2
  %sp261 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %262
  %263 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp261, i8 16)
  %264 = icmp ne i8 %263, 0
  br i1 %264, label %return, label %OP83.REVERT.contd, !prof !2

OP83.REVERT.contd:                                ; preds = %OP83.REVERT
  br label %return, !annotation !8

OP84.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP80.JUMPI
  %gas.remaining262 = load i64, ptr %gas.remaining.addr, align 8
  %265 = sub i64 %gas.remaining262, 15
  %266 = icmp ult i64 %gas.remaining262, 15
  store i64 %265, ptr %gas.remaining.addr, align 8
  br i1 %266, label %return, label %OP84.JUMPDEST.contd, !prof !2, !annotation !3

OP84.JUMPDEST.contd:                              ; preds = %OP84.JUMPDEST
  %stack_len263 = load i64, ptr %len.addr, align 8
  %267 = icmp ugt i64 %stack_len263, 1022
  br i1 %267, label %return, label %OP84.JUMPDEST.contd264, !prof !2, !annotation !4

OP84.JUMPDEST.contd264:                           ; preds = %OP84.JUMPDEST.contd
  br label %OP85.PUSH2, !annotation !5

OP85.PUSH2:                                       ; preds = %OP84.JUMPDEST.contd264
  %stack_len265 = load i64, ptr %len.addr, align 8
  %268 = add i64 %stack_len265, 1
  store i64 %268, ptr %len.addr, align 8
  %sp266 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len265
  store i256 204, ptr %sp266, align 16
  br label %OP86.PUSH2, !annotation !5

OP86.PUSH2:                                       ; preds = %OP85.PUSH2
  br label %OP87.JUMP, !annotation !6

OP87.JUMP:                                        ; preds = %OP86.PUSH2
  %stack_len267 = load i64, ptr %len.addr, align 8
  br label %OP743.JUMPDEST

OP88.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining268 = load i64, ptr %gas.remaining.addr, align 8
  %269 = sub i64 %gas.remaining268, 93
  %270 = icmp ult i64 %gas.remaining268, 93
  store i64 %269, ptr %gas.remaining.addr, align 8
  br i1 %270, label %return, label %OP88.JUMPDEST.contd, !prof !2, !annotation !3

OP88.JUMPDEST.contd:                              ; preds = %OP88.JUMPDEST
  %stack_len269 = load i64, ptr %len.addr, align 8
  %271 = icmp ult i64 %stack_len269, 1
  %272 = icmp ugt i64 %stack_len269, 1015
  %273 = or i1 %271, %272
  %274 = select i1 %271, i8 91, i8 92
  br i1 %273, label %return, label %OP88.JUMPDEST.contd270, !prof !2

OP88.JUMPDEST.contd270:                           ; preds = %OP88.JUMPDEST.contd
  br label %OP89.PUSH1, !annotation !5

OP89.PUSH1:                                       ; preds = %OP88.JUMPDEST.contd270
  %stack_len271 = load i64, ptr %len.addr, align 8
  %275 = add i64 %stack_len271, 1
  store i64 %275, ptr %len.addr, align 8
  %sp272 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len271
  store i256 64, ptr %sp272, align 16
  br label %OP90.MLOAD, !annotation !5

OP90.MLOAD:                                       ; preds = %OP89.PUSH1
  %stack_len273 = load i64, ptr %len.addr, align 8
  %276 = add i64 %stack_len273, -1
  %sp274 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %276
  %a275 = load i256, ptr %sp274, align 16
  %mload.out.slot = alloca i256, align 16
  %277 = call i8 @__revmc_ir_builtin_mload(i256 %a275, ptr %mload.out.slot, ptr %arg.ecx.addr)
  %278 = icmp ne i8 %277, 0
  br i1 %278, label %return, label %OP90.MLOAD.contd, !prof !2

OP90.MLOAD.contd:                                 ; preds = %OP90.MLOAD
  %mload.out = load i256, ptr %mload.out.slot, align 16
  %279 = add i64 %stack_len273, -1
  %sp276 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %279
  store i256 %mload.out, ptr %sp276, align 16
  br label %OP91.DUP1, !annotation !5

OP91.DUP1:                                        ; preds = %OP90.MLOAD.contd
  %stack_len277 = load i64, ptr %len.addr, align 8
  %280 = add i64 %stack_len277, 1
  store i64 %280, ptr %len.addr, align 8
  %281 = sub i64 %stack_len277, 1
  %sp278 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %281
  %dup1279 = load i256, ptr %sp278, align 16
  %sp280 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len277
  store i256 %dup1279, ptr %sp280, align 16
  br label %OP92.DUP1, !annotation !5

OP92.DUP1:                                        ; preds = %OP91.DUP1
  %stack_len281 = load i64, ptr %len.addr, align 8
  %282 = add i64 %stack_len281, 1
  store i64 %282, ptr %len.addr, align 8
  %283 = sub i64 %stack_len281, 1
  %sp282 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %283
  %dup1283 = load i256, ptr %sp282, align 16
  %sp284 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len281
  store i256 %dup1283, ptr %sp284, align 16
  br label %OP93.PUSH1, !annotation !5

OP93.PUSH1:                                       ; preds = %OP92.DUP1
  %stack_len285 = load i64, ptr %len.addr, align 8
  %284 = add i64 %stack_len285, 1
  store i64 %284, ptr %len.addr, align 8
  %sp286 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len285
  store i256 32, ptr %sp286, align 16
  br label %OP94.ADD, !annotation !5

OP94.ADD:                                         ; preds = %OP93.PUSH1
  %stack_len287 = load i64, ptr %len.addr, align 8
  %285 = add i64 %stack_len287, -1
  store i64 %285, ptr %len.addr, align 8
  %286 = add i64 %stack_len287, -1
  %sp288 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %286
  %a289 = load i256, ptr %sp288, align 16
  %287 = add i64 %stack_len287, -2
  %sp290 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %287
  %b291 = load i256, ptr %sp290, align 16
  %288 = add i256 %a289, %b291
  %289 = add i64 %stack_len287, -2
  %sp292 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %289
  store i256 %288, ptr %sp292, align 16
  br label %OP95.DUP3, !annotation !5

OP95.DUP3:                                        ; preds = %OP94.ADD
  %stack_len293 = load i64, ptr %len.addr, align 8
  %290 = add i64 %stack_len293, 1
  store i64 %290, ptr %len.addr, align 8
  %291 = sub i64 %stack_len293, 3
  %sp294 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %291
  %dup3 = load i256, ptr %sp294, align 16
  %sp295 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len293
  store i256 %dup3, ptr %sp295, align 16
  br label %OP96.DUP2, !annotation !5

OP96.DUP2:                                        ; preds = %OP95.DUP3
  %stack_len296 = load i64, ptr %len.addr, align 8
  %292 = add i64 %stack_len296, 1
  store i64 %292, ptr %len.addr, align 8
  %293 = sub i64 %stack_len296, 2
  %sp297 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %293
  %dup2 = load i256, ptr %sp297, align 16
  %sp298 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len296
  store i256 %dup2, ptr %sp298, align 16
  br label %OP97.SUB, !annotation !5

OP97.SUB:                                         ; preds = %OP96.DUP2
  %stack_len299 = load i64, ptr %len.addr, align 8
  %294 = add i64 %stack_len299, -1
  store i64 %294, ptr %len.addr, align 8
  %295 = add i64 %stack_len299, -1
  %sp300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %295
  %a301 = load i256, ptr %sp300, align 16
  %296 = add i64 %stack_len299, -2
  %sp302 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %296
  %b303 = load i256, ptr %sp302, align 16
  %297 = sub i256 %a301, %b303
  %298 = add i64 %stack_len299, -2
  %sp304 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %298
  store i256 %297, ptr %sp304, align 16
  br label %OP98.DUP3, !annotation !5

OP98.DUP3:                                        ; preds = %OP97.SUB
  %stack_len305 = load i64, ptr %len.addr, align 8
  %299 = add i64 %stack_len305, 1
  store i64 %299, ptr %len.addr, align 8
  %300 = sub i64 %stack_len305, 3
  %sp306 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %300
  %dup3307 = load i256, ptr %sp306, align 16
  %sp308 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len305
  store i256 %dup3307, ptr %sp308, align 16
  br label %OP99.MSTORE, !annotation !5

OP99.MSTORE:                                      ; preds = %OP98.DUP3
  %stack_len309 = load i64, ptr %len.addr, align 8
  %301 = add i64 %stack_len309, -2
  store i64 %301, ptr %len.addr, align 8
  %302 = add i64 %stack_len309, -1
  %sp310 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %302
  %a311 = load i256, ptr %sp310, align 16
  %303 = add i64 %stack_len309, -2
  %sp312 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %303
  %b313 = load i256, ptr %sp312, align 16
  %304 = call i8 @__revmc_ir_builtin_mstore(i256 %a311, i256 %b313, ptr %arg.ecx.addr)
  %305 = icmp ne i8 %304, 0
  br i1 %305, label %return, label %OP99.MSTORE.contd, !prof !2

OP99.MSTORE.contd:                                ; preds = %OP99.MSTORE
  br label %OP100.DUP4, !annotation !5

OP100.DUP4:                                       ; preds = %OP99.MSTORE.contd
  %stack_len314 = load i64, ptr %len.addr, align 8
  %306 = add i64 %stack_len314, 1
  store i64 %306, ptr %len.addr, align 8
  %307 = sub i64 %stack_len314, 4
  %sp315 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %307
  %dup4 = load i256, ptr %sp315, align 16
  %sp316 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len314
  store i256 %dup4, ptr %sp316, align 16
  br label %OP101.DUP2, !annotation !5

OP101.DUP2:                                       ; preds = %OP100.DUP4
  %stack_len317 = load i64, ptr %len.addr, align 8
  %308 = add i64 %stack_len317, 1
  store i64 %308, ptr %len.addr, align 8
  %309 = sub i64 %stack_len317, 2
  %sp318 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %309
  %dup2319 = load i256, ptr %sp318, align 16
  %sp320 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len317
  store i256 %dup2319, ptr %sp320, align 16
  br label %OP102.DUP2, !annotation !5

OP102.DUP2:                                       ; preds = %OP101.DUP2
  %stack_len321 = load i64, ptr %len.addr, align 8
  %310 = add i64 %stack_len321, 1
  store i64 %310, ptr %len.addr, align 8
  %311 = sub i64 %stack_len321, 2
  %sp322 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %311
  %dup2323 = load i256, ptr %sp322, align 16
  %sp324 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len321
  store i256 %dup2323, ptr %sp324, align 16
  br label %OP103.MLOAD, !annotation !5

OP103.MLOAD:                                      ; preds = %OP102.DUP2
  %stack_len325 = load i64, ptr %len.addr, align 8
  %312 = add i64 %stack_len325, -1
  %sp326 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %312
  %a327 = load i256, ptr %sp326, align 16
  %mload.out.slot328 = alloca i256, align 16
  %313 = call i8 @__revmc_ir_builtin_mload(i256 %a327, ptr %mload.out.slot328, ptr %arg.ecx.addr)
  %314 = icmp ne i8 %313, 0
  br i1 %314, label %return, label %OP103.MLOAD.contd, !prof !2

OP103.MLOAD.contd:                                ; preds = %OP103.MLOAD
  %mload.out329 = load i256, ptr %mload.out.slot328, align 16
  %315 = add i64 %stack_len325, -1
  %sp330 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %315
  store i256 %mload.out329, ptr %sp330, align 16
  br label %OP104.DUP2, !annotation !5

OP104.DUP2:                                       ; preds = %OP103.MLOAD.contd
  %stack_len331 = load i64, ptr %len.addr, align 8
  %316 = add i64 %stack_len331, 1
  store i64 %316, ptr %len.addr, align 8
  %317 = sub i64 %stack_len331, 2
  %sp332 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %317
  %dup2333 = load i256, ptr %sp332, align 16
  %sp334 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len331
  store i256 %dup2333, ptr %sp334, align 16
  br label %OP105.MSTORE, !annotation !5

OP105.MSTORE:                                     ; preds = %OP104.DUP2
  %stack_len335 = load i64, ptr %len.addr, align 8
  %318 = add i64 %stack_len335, -2
  store i64 %318, ptr %len.addr, align 8
  %319 = add i64 %stack_len335, -1
  %sp336 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %319
  %a337 = load i256, ptr %sp336, align 16
  %320 = add i64 %stack_len335, -2
  %sp338 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %320
  %b339 = load i256, ptr %sp338, align 16
  %321 = call i8 @__revmc_ir_builtin_mstore(i256 %a337, i256 %b339, ptr %arg.ecx.addr)
  %322 = icmp ne i8 %321, 0
  br i1 %322, label %return, label %OP105.MSTORE.contd, !prof !2

OP105.MSTORE.contd:                               ; preds = %OP105.MSTORE
  br label %OP106.PUSH1, !annotation !5

OP106.PUSH1:                                      ; preds = %OP105.MSTORE.contd
  %stack_len340 = load i64, ptr %len.addr, align 8
  %323 = add i64 %stack_len340, 1
  store i64 %323, ptr %len.addr, align 8
  %sp341 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len340
  store i256 32, ptr %sp341, align 16
  br label %OP107.ADD, !annotation !5

OP107.ADD:                                        ; preds = %OP106.PUSH1
  %stack_len342 = load i64, ptr %len.addr, align 8
  %324 = add i64 %stack_len342, -1
  store i64 %324, ptr %len.addr, align 8
  %325 = add i64 %stack_len342, -1
  %sp343 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %325
  %a344 = load i256, ptr %sp343, align 16
  %326 = add i64 %stack_len342, -2
  %sp345 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %326
  %b346 = load i256, ptr %sp345, align 16
  %327 = add i256 %a344, %b346
  %328 = add i64 %stack_len342, -2
  %sp347 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %328
  store i256 %327, ptr %sp347, align 16
  br label %OP108.SWAP2, !annotation !5

OP108.SWAP2:                                      ; preds = %OP107.ADD
  %stack_len348 = load i64, ptr %len.addr, align 8
  %329 = sub i64 %stack_len348, 1
  %sp349 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %329
  %swap.a350 = load i256, ptr %sp349, align 16
  %330 = sub i64 %stack_len348, 3
  %sp351 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %330
  %swap.b352 = load i256, ptr %sp351, align 16
  store i256 %swap.a350, ptr %sp351, align 16
  store i256 %swap.b352, ptr %sp349, align 16
  br label %OP109.POP, !annotation !5

OP109.POP:                                        ; preds = %OP108.SWAP2
  %stack_len353 = load i64, ptr %len.addr, align 8
  %331 = add i64 %stack_len353, -1
  store i64 %331, ptr %len.addr, align 8
  br label %OP110.DUP1, !annotation !5

OP110.DUP1:                                       ; preds = %OP109.POP
  %stack_len354 = load i64, ptr %len.addr, align 8
  %332 = add i64 %stack_len354, 1
  store i64 %332, ptr %len.addr, align 8
  %333 = sub i64 %stack_len354, 1
  %sp355 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %333
  %dup1356 = load i256, ptr %sp355, align 16
  %sp357 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len354
  store i256 %dup1356, ptr %sp357, align 16
  br label %OP111.MLOAD, !annotation !5

OP111.MLOAD:                                      ; preds = %OP110.DUP1
  %stack_len358 = load i64, ptr %len.addr, align 8
  %334 = add i64 %stack_len358, -1
  %sp359 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %334
  %a360 = load i256, ptr %sp359, align 16
  %mload.out.slot361 = alloca i256, align 16
  %335 = call i8 @__revmc_ir_builtin_mload(i256 %a360, ptr %mload.out.slot361, ptr %arg.ecx.addr)
  %336 = icmp ne i8 %335, 0
  br i1 %336, label %return, label %OP111.MLOAD.contd, !prof !2

OP111.MLOAD.contd:                                ; preds = %OP111.MLOAD
  %mload.out362 = load i256, ptr %mload.out.slot361, align 16
  %337 = add i64 %stack_len358, -1
  %sp363 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %337
  store i256 %mload.out362, ptr %sp363, align 16
  br label %OP112.SWAP1, !annotation !5

OP112.SWAP1:                                      ; preds = %OP111.MLOAD.contd
  %stack_len364 = load i64, ptr %len.addr, align 8
  %338 = sub i64 %stack_len364, 1
  %sp365 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %338
  %swap.a366 = load i256, ptr %sp365, align 16
  %339 = sub i64 %stack_len364, 2
  %sp367 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %339
  %swap.b368 = load i256, ptr %sp367, align 16
  store i256 %swap.a366, ptr %sp367, align 16
  store i256 %swap.b368, ptr %sp365, align 16
  br label %OP113.PUSH1, !annotation !5

OP113.PUSH1:                                      ; preds = %OP112.SWAP1
  %stack_len369 = load i64, ptr %len.addr, align 8
  %340 = add i64 %stack_len369, 1
  store i64 %340, ptr %len.addr, align 8
  %sp370 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len369
  store i256 32, ptr %sp370, align 16
  br label %OP114.ADD, !annotation !5

OP114.ADD:                                        ; preds = %OP113.PUSH1
  %stack_len371 = load i64, ptr %len.addr, align 8
  %341 = add i64 %stack_len371, -1
  store i64 %341, ptr %len.addr, align 8
  %342 = add i64 %stack_len371, -1
  %sp372 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %342
  %a373 = load i256, ptr %sp372, align 16
  %343 = add i64 %stack_len371, -2
  %sp374 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %343
  %b375 = load i256, ptr %sp374, align 16
  %344 = add i256 %a373, %b375
  %345 = add i64 %stack_len371, -2
  %sp376 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %345
  store i256 %344, ptr %sp376, align 16
  br label %OP115.SWAP1, !annotation !5

OP115.SWAP1:                                      ; preds = %OP114.ADD
  %stack_len377 = load i64, ptr %len.addr, align 8
  %346 = sub i64 %stack_len377, 1
  %sp378 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %346
  %swap.a379 = load i256, ptr %sp378, align 16
  %347 = sub i64 %stack_len377, 2
  %sp380 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %347
  %swap.b381 = load i256, ptr %sp380, align 16
  store i256 %swap.a379, ptr %sp380, align 16
  store i256 %swap.b381, ptr %sp378, align 16
  br label %OP116.DUP1, !annotation !5

OP116.DUP1:                                       ; preds = %OP115.SWAP1
  %stack_len382 = load i64, ptr %len.addr, align 8
  %348 = add i64 %stack_len382, 1
  store i64 %348, ptr %len.addr, align 8
  %349 = sub i64 %stack_len382, 1
  %sp383 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %349
  %dup1384 = load i256, ptr %sp383, align 16
  %sp385 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len382
  store i256 %dup1384, ptr %sp385, align 16
  br label %OP117.DUP4, !annotation !5

OP117.DUP4:                                       ; preds = %OP116.DUP1
  %stack_len386 = load i64, ptr %len.addr, align 8
  %350 = add i64 %stack_len386, 1
  store i64 %350, ptr %len.addr, align 8
  %351 = sub i64 %stack_len386, 4
  %sp387 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %351
  %dup4388 = load i256, ptr %sp387, align 16
  %sp389 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len386
  store i256 %dup4388, ptr %sp389, align 16
  br label %OP118.DUP4, !annotation !5

OP118.DUP4:                                       ; preds = %OP117.DUP4
  %stack_len390 = load i64, ptr %len.addr, align 8
  %352 = add i64 %stack_len390, 1
  store i64 %352, ptr %len.addr, align 8
  %353 = sub i64 %stack_len390, 4
  %sp391 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %353
  %dup4392 = load i256, ptr %sp391, align 16
  %sp393 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len390
  store i256 %dup4392, ptr %sp393, align 16
  br label %OP119.PUSH1, !annotation !5

OP119.PUSH1:                                      ; preds = %OP118.DUP4
  %stack_len394 = load i64, ptr %len.addr, align 8
  %354 = add i64 %stack_len394, 1
  store i64 %354, ptr %len.addr, align 8
  %sp395 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len394
  store i256 0, ptr %sp395, align 16
  br label %OP120.JUMPDEST, !annotation !5

OP120.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP141.JUMP, %OP119.PUSH1
  %gas.remaining396 = load i64, ptr %gas.remaining.addr, align 8
  %355 = sub i64 %gas.remaining396, 26
  %356 = icmp ult i64 %gas.remaining396, 26
  store i64 %355, ptr %gas.remaining.addr, align 8
  br i1 %356, label %return, label %OP120.JUMPDEST.contd, !prof !2, !annotation !3

OP120.JUMPDEST.contd:                             ; preds = %OP120.JUMPDEST
  %stack_len397 = load i64, ptr %len.addr, align 8
  %357 = icmp ult i64 %stack_len397, 4
  %358 = icmp ugt i64 %stack_len397, 1022
  %359 = or i1 %357, %358
  %360 = select i1 %357, i8 91, i8 92
  br i1 %359, label %return, label %OP120.JUMPDEST.contd398, !prof !2

OP120.JUMPDEST.contd398:                          ; preds = %OP120.JUMPDEST.contd
  br label %OP121.DUP4, !annotation !5

OP121.DUP4:                                       ; preds = %OP120.JUMPDEST.contd398
  %stack_len399 = load i64, ptr %len.addr, align 8
  %361 = add i64 %stack_len399, 1
  store i64 %361, ptr %len.addr, align 8
  %362 = sub i64 %stack_len399, 4
  %sp400 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %362
  %dup4401 = load i256, ptr %sp400, align 16
  %sp402 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len399
  store i256 %dup4401, ptr %sp402, align 16
  br label %OP122.DUP2, !annotation !5

OP122.DUP2:                                       ; preds = %OP121.DUP4
  %stack_len403 = load i64, ptr %len.addr, align 8
  %363 = add i64 %stack_len403, 1
  store i64 %363, ptr %len.addr, align 8
  %364 = sub i64 %stack_len403, 2
  %sp404 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %364
  %dup2405 = load i256, ptr %sp404, align 16
  %sp406 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len403
  store i256 %dup2405, ptr %sp406, align 16
  br label %OP123.LT, !annotation !5

OP123.LT:                                         ; preds = %OP122.DUP2
  %stack_len407 = load i64, ptr %len.addr, align 8
  %365 = add i64 %stack_len407, -1
  store i64 %365, ptr %len.addr, align 8
  %366 = add i64 %stack_len407, -1
  %sp408 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %366
  %a409 = load i256, ptr %sp408, align 16
  %367 = add i64 %stack_len407, -2
  %sp410 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %367
  %b411 = load i256, ptr %sp410, align 16
  %368 = icmp ult i256 %a409, %b411
  %369 = zext i1 %368 to i256
  %370 = add i64 %stack_len407, -2
  %sp412 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %370
  store i256 %369, ptr %sp412, align 16
  br label %OP124.ISZERO, !annotation !5

OP124.ISZERO:                                     ; preds = %OP123.LT
  %stack_len413 = load i64, ptr %len.addr, align 8
  %371 = add i64 %stack_len413, -1
  %sp414 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %371
  %a415 = load i256, ptr %sp414, align 16
  %372 = icmp eq i256 %a415, 0
  %373 = zext i1 %372 to i256
  %374 = add i64 %stack_len413, -1
  %sp416 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %374
  store i256 %373, ptr %sp416, align 16
  br label %OP125.PUSH2, !annotation !5

OP125.PUSH2:                                      ; preds = %OP124.ISZERO
  br label %OP126.JUMPI, !annotation !6

OP126.JUMPI:                                      ; preds = %OP125.PUSH2
  %stack_len417 = load i64, ptr %len.addr, align 8
  %375 = add i64 %stack_len417, -1
  store i64 %375, ptr %len.addr, align 8
  %376 = add i64 %stack_len417, -1
  %sp418 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %376
  %a419 = load i256, ptr %sp418, align 16
  %377 = icmp ne i256 %a419, 0
  br i1 %377, label %OP142.JUMPDEST, label %OP127.DUP1

OP127.DUP1:                                       ; preds = %OP126.JUMPI
  %gas.remaining420 = load i64, ptr %gas.remaining.addr, align 8
  %378 = sub i64 %gas.remaining420, 49
  %379 = icmp ult i64 %gas.remaining420, 49
  store i64 %378, ptr %gas.remaining.addr, align 8
  br i1 %379, label %return, label %OP127.DUP1.contd, !prof !2, !annotation !3

OP127.DUP1.contd:                                 ; preds = %OP127.DUP1
  %stack_len421 = load i64, ptr %len.addr, align 8
  %380 = icmp ult i64 %stack_len421, 3
  %381 = icmp ugt i64 %stack_len421, 1021
  %382 = or i1 %380, %381
  %383 = select i1 %380, i8 91, i8 92
  br i1 %382, label %return, label %OP127.DUP1.contd422, !prof !2

OP127.DUP1.contd422:                              ; preds = %OP127.DUP1.contd
  %384 = add i64 %stack_len421, 1
  store i64 %384, ptr %len.addr, align 8
  %385 = sub i64 %stack_len421, 1
  %sp423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %385
  %dup1424 = load i256, ptr %sp423, align 16
  %sp425 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len421
  store i256 %dup1424, ptr %sp425, align 16
  br label %OP128.DUP3, !annotation !5

OP128.DUP3:                                       ; preds = %OP127.DUP1.contd422
  %stack_len426 = load i64, ptr %len.addr, align 8
  %386 = add i64 %stack_len426, 1
  store i64 %386, ptr %len.addr, align 8
  %387 = sub i64 %stack_len426, 3
  %sp427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %387
  %dup3428 = load i256, ptr %sp427, align 16
  %sp429 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len426
  store i256 %dup3428, ptr %sp429, align 16
  br label %OP129.ADD, !annotation !5

OP129.ADD:                                        ; preds = %OP128.DUP3
  %stack_len430 = load i64, ptr %len.addr, align 8
  %388 = add i64 %stack_len430, -1
  store i64 %388, ptr %len.addr, align 8
  %389 = add i64 %stack_len430, -1
  %sp431 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %389
  %a432 = load i256, ptr %sp431, align 16
  %390 = add i64 %stack_len430, -2
  %sp433 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %390
  %b434 = load i256, ptr %sp433, align 16
  %391 = add i256 %a432, %b434
  %392 = add i64 %stack_len430, -2
  %sp435 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %392
  store i256 %391, ptr %sp435, align 16
  br label %OP130.MLOAD, !annotation !5

OP130.MLOAD:                                      ; preds = %OP129.ADD
  %stack_len436 = load i64, ptr %len.addr, align 8
  %393 = add i64 %stack_len436, -1
  %sp437 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %393
  %a438 = load i256, ptr %sp437, align 16
  %mload.out.slot439 = alloca i256, align 16
  %394 = call i8 @__revmc_ir_builtin_mload(i256 %a438, ptr %mload.out.slot439, ptr %arg.ecx.addr)
  %395 = icmp ne i8 %394, 0
  br i1 %395, label %return, label %OP130.MLOAD.contd, !prof !2

OP130.MLOAD.contd:                                ; preds = %OP130.MLOAD
  %mload.out440 = load i256, ptr %mload.out.slot439, align 16
  %396 = add i64 %stack_len436, -1
  %sp441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %396
  store i256 %mload.out440, ptr %sp441, align 16
  br label %OP131.DUP2, !annotation !5

OP131.DUP2:                                       ; preds = %OP130.MLOAD.contd
  %stack_len442 = load i64, ptr %len.addr, align 8
  %397 = add i64 %stack_len442, 1
  store i64 %397, ptr %len.addr, align 8
  %398 = sub i64 %stack_len442, 2
  %sp443 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %398
  %dup2444 = load i256, ptr %sp443, align 16
  %sp445 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len442
  store i256 %dup2444, ptr %sp445, align 16
  br label %OP132.DUP5, !annotation !5

OP132.DUP5:                                       ; preds = %OP131.DUP2
  %stack_len446 = load i64, ptr %len.addr, align 8
  %399 = add i64 %stack_len446, 1
  store i64 %399, ptr %len.addr, align 8
  %400 = sub i64 %stack_len446, 5
  %sp447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %400
  %dup5 = load i256, ptr %sp447, align 16
  %sp448 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len446
  store i256 %dup5, ptr %sp448, align 16
  br label %OP133.ADD, !annotation !5

OP133.ADD:                                        ; preds = %OP132.DUP5
  %stack_len449 = load i64, ptr %len.addr, align 8
  %401 = add i64 %stack_len449, -1
  store i64 %401, ptr %len.addr, align 8
  %402 = add i64 %stack_len449, -1
  %sp450 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %402
  %a451 = load i256, ptr %sp450, align 16
  %403 = add i64 %stack_len449, -2
  %sp452 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %403
  %b453 = load i256, ptr %sp452, align 16
  %404 = add i256 %a451, %b453
  %405 = add i64 %stack_len449, -2
  %sp454 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %405
  store i256 %404, ptr %sp454, align 16
  br label %OP134.MSTORE, !annotation !5

OP134.MSTORE:                                     ; preds = %OP133.ADD
  %stack_len455 = load i64, ptr %len.addr, align 8
  %406 = add i64 %stack_len455, -2
  store i64 %406, ptr %len.addr, align 8
  %407 = add i64 %stack_len455, -1
  %sp456 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %407
  %a457 = load i256, ptr %sp456, align 16
  %408 = add i64 %stack_len455, -2
  %sp458 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %408
  %b459 = load i256, ptr %sp458, align 16
  %409 = call i8 @__revmc_ir_builtin_mstore(i256 %a457, i256 %b459, ptr %arg.ecx.addr)
  %410 = icmp ne i8 %409, 0
  br i1 %410, label %return, label %OP134.MSTORE.contd, !prof !2

OP134.MSTORE.contd:                               ; preds = %OP134.MSTORE
  br label %OP135.PUSH1, !annotation !5

OP135.PUSH1:                                      ; preds = %OP134.MSTORE.contd
  %stack_len460 = load i64, ptr %len.addr, align 8
  %411 = add i64 %stack_len460, 1
  store i64 %411, ptr %len.addr, align 8
  %sp461 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len460
  store i256 32, ptr %sp461, align 16
  br label %OP136.DUP2, !annotation !5

OP136.DUP2:                                       ; preds = %OP135.PUSH1
  %stack_len462 = load i64, ptr %len.addr, align 8
  %412 = add i64 %stack_len462, 1
  store i64 %412, ptr %len.addr, align 8
  %413 = sub i64 %stack_len462, 2
  %sp463 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %413
  %dup2464 = load i256, ptr %sp463, align 16
  %sp465 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len462
  store i256 %dup2464, ptr %sp465, align 16
  br label %OP137.ADD, !annotation !5

OP137.ADD:                                        ; preds = %OP136.DUP2
  %stack_len466 = load i64, ptr %len.addr, align 8
  %414 = add i64 %stack_len466, -1
  store i64 %414, ptr %len.addr, align 8
  %415 = add i64 %stack_len466, -1
  %sp467 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %415
  %a468 = load i256, ptr %sp467, align 16
  %416 = add i64 %stack_len466, -2
  %sp469 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %416
  %b470 = load i256, ptr %sp469, align 16
  %417 = add i256 %a468, %b470
  %418 = add i64 %stack_len466, -2
  %sp471 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %418
  store i256 %417, ptr %sp471, align 16
  br label %OP138.SWAP1, !annotation !5

OP138.SWAP1:                                      ; preds = %OP137.ADD
  %stack_len472 = load i64, ptr %len.addr, align 8
  %419 = sub i64 %stack_len472, 1
  %sp473 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %419
  %swap.a474 = load i256, ptr %sp473, align 16
  %420 = sub i64 %stack_len472, 2
  %sp475 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %420
  %swap.b476 = load i256, ptr %sp475, align 16
  store i256 %swap.a474, ptr %sp475, align 16
  store i256 %swap.b476, ptr %sp473, align 16
  br label %OP139.POP, !annotation !5

OP139.POP:                                        ; preds = %OP138.SWAP1
  %stack_len477 = load i64, ptr %len.addr, align 8
  %421 = add i64 %stack_len477, -1
  store i64 %421, ptr %len.addr, align 8
  br label %OP140.PUSH2, !annotation !5

OP140.PUSH2:                                      ; preds = %OP139.POP
  br label %OP141.JUMP, !annotation !6

OP141.JUMP:                                       ; preds = %OP140.PUSH2
  %stack_len478 = load i64, ptr %len.addr, align 8
  br label %OP120.JUMPDEST

OP142.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP126.JUMPI
  %gas.remaining479 = load i64, ptr %gas.remaining.addr, align 8
  %422 = sub i64 %gas.remaining479, 51
  %423 = icmp ult i64 %gas.remaining479, 51
  store i64 %422, ptr %gas.remaining.addr, align 8
  br i1 %423, label %return, label %OP142.JUMPDEST.contd, !prof !2, !annotation !3

OP142.JUMPDEST.contd:                             ; preds = %OP142.JUMPDEST
  %stack_len480 = load i64, ptr %len.addr, align 8
  %424 = icmp ult i64 %stack_len480, 7
  br i1 %424, label %return, label %OP142.JUMPDEST.contd481, !prof !2, !annotation !9

OP142.JUMPDEST.contd481:                          ; preds = %OP142.JUMPDEST.contd
  br label %OP143.POP, !annotation !5

OP143.POP:                                        ; preds = %OP142.JUMPDEST.contd481
  %stack_len482 = load i64, ptr %len.addr, align 8
  %425 = add i64 %stack_len482, -1
  store i64 %425, ptr %len.addr, align 8
  br label %OP144.POP, !annotation !5

OP144.POP:                                        ; preds = %OP143.POP
  %stack_len483 = load i64, ptr %len.addr, align 8
  %426 = add i64 %stack_len483, -1
  store i64 %426, ptr %len.addr, align 8
  br label %OP145.POP, !annotation !5

OP145.POP:                                        ; preds = %OP144.POP
  %stack_len484 = load i64, ptr %len.addr, align 8
  %427 = add i64 %stack_len484, -1
  store i64 %427, ptr %len.addr, align 8
  br label %OP146.POP, !annotation !5

OP146.POP:                                        ; preds = %OP145.POP
  %stack_len485 = load i64, ptr %len.addr, align 8
  %428 = add i64 %stack_len485, -1
  store i64 %428, ptr %len.addr, align 8
  br label %OP147.SWAP1, !annotation !5

OP147.SWAP1:                                      ; preds = %OP146.POP
  %stack_len486 = load i64, ptr %len.addr, align 8
  %429 = sub i64 %stack_len486, 1
  %sp487 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %429
  %swap.a488 = load i256, ptr %sp487, align 16
  %430 = sub i64 %stack_len486, 2
  %sp489 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %430
  %swap.b490 = load i256, ptr %sp489, align 16
  store i256 %swap.a488, ptr %sp489, align 16
  store i256 %swap.b490, ptr %sp487, align 16
  br label %OP148.POP, !annotation !5

OP148.POP:                                        ; preds = %OP147.SWAP1
  %stack_len491 = load i64, ptr %len.addr, align 8
  %431 = add i64 %stack_len491, -1
  store i64 %431, ptr %len.addr, align 8
  br label %OP149.SWAP1, !annotation !5

OP149.SWAP1:                                      ; preds = %OP148.POP
  %stack_len492 = load i64, ptr %len.addr, align 8
  %432 = sub i64 %stack_len492, 1
  %sp493 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %432
  %swap.a494 = load i256, ptr %sp493, align 16
  %433 = sub i64 %stack_len492, 2
  %sp495 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %433
  %swap.b496 = load i256, ptr %sp495, align 16
  store i256 %swap.a494, ptr %sp495, align 16
  store i256 %swap.b496, ptr %sp493, align 16
  br label %OP150.DUP2, !annotation !5

OP150.DUP2:                                       ; preds = %OP149.SWAP1
  %stack_len497 = load i64, ptr %len.addr, align 8
  %434 = add i64 %stack_len497, 1
  store i64 %434, ptr %len.addr, align 8
  %435 = sub i64 %stack_len497, 2
  %sp498 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %435
  %dup2499 = load i256, ptr %sp498, align 16
  %sp500 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len497
  store i256 %dup2499, ptr %sp500, align 16
  br label %OP151.ADD, !annotation !5

OP151.ADD:                                        ; preds = %OP150.DUP2
  %stack_len501 = load i64, ptr %len.addr, align 8
  %436 = add i64 %stack_len501, -1
  store i64 %436, ptr %len.addr, align 8
  %437 = add i64 %stack_len501, -1
  %sp502 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %437
  %a503 = load i256, ptr %sp502, align 16
  %438 = add i64 %stack_len501, -2
  %sp504 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %438
  %b505 = load i256, ptr %sp504, align 16
  %439 = add i256 %a503, %b505
  %440 = add i64 %stack_len501, -2
  %sp506 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %440
  store i256 %439, ptr %sp506, align 16
  br label %OP152.SWAP1, !annotation !5

OP152.SWAP1:                                      ; preds = %OP151.ADD
  %stack_len507 = load i64, ptr %len.addr, align 8
  %441 = sub i64 %stack_len507, 1
  %sp508 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %441
  %swap.a509 = load i256, ptr %sp508, align 16
  %442 = sub i64 %stack_len507, 2
  %sp510 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %442
  %swap.b511 = load i256, ptr %sp510, align 16
  store i256 %swap.a509, ptr %sp510, align 16
  store i256 %swap.b511, ptr %sp508, align 16
  br label %OP153.PUSH1, !annotation !5

OP153.PUSH1:                                      ; preds = %OP152.SWAP1
  %stack_len512 = load i64, ptr %len.addr, align 8
  %443 = add i64 %stack_len512, 1
  store i64 %443, ptr %len.addr, align 8
  %sp513 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len512
  store i256 31, ptr %sp513, align 16
  br label %OP154.AND, !annotation !5

OP154.AND:                                        ; preds = %OP153.PUSH1
  %stack_len514 = load i64, ptr %len.addr, align 8
  %444 = add i64 %stack_len514, -1
  store i64 %444, ptr %len.addr, align 8
  %445 = add i64 %stack_len514, -1
  %sp515 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %445
  %a516 = load i256, ptr %sp515, align 16
  %446 = add i64 %stack_len514, -2
  %sp517 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %446
  %b518 = load i256, ptr %sp517, align 16
  %447 = and i256 %a516, %b518
  %448 = add i64 %stack_len514, -2
  %sp519 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %448
  store i256 %447, ptr %sp519, align 16
  br label %OP155.DUP1, !annotation !5

OP155.DUP1:                                       ; preds = %OP154.AND
  %stack_len520 = load i64, ptr %len.addr, align 8
  %449 = add i64 %stack_len520, 1
  store i64 %449, ptr %len.addr, align 8
  %450 = sub i64 %stack_len520, 1
  %sp521 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %450
  %dup1522 = load i256, ptr %sp521, align 16
  %sp523 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len520
  store i256 %dup1522, ptr %sp523, align 16
  br label %OP156.ISZERO, !annotation !5

OP156.ISZERO:                                     ; preds = %OP155.DUP1
  %stack_len524 = load i64, ptr %len.addr, align 8
  %451 = add i64 %stack_len524, -1
  %sp525 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %451
  %a526 = load i256, ptr %sp525, align 16
  %452 = icmp eq i256 %a526, 0
  %453 = zext i1 %452 to i256
  %454 = add i64 %stack_len524, -1
  %sp527 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %454
  store i256 %453, ptr %sp527, align 16
  br label %OP157.PUSH2, !annotation !5

OP157.PUSH2:                                      ; preds = %OP156.ISZERO
  br label %OP158.JUMPI, !annotation !6

OP158.JUMPI:                                      ; preds = %OP157.PUSH2
  %stack_len528 = load i64, ptr %len.addr, align 8
  %455 = add i64 %stack_len528, -1
  store i64 %455, ptr %len.addr, align 8
  %456 = add i64 %stack_len528, -1
  %sp529 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %456
  %a530 = load i256, ptr %sp529, align 16
  %457 = icmp ne i256 %a530, 0
  br i1 %457, label %OP179.JUMPDEST, label %OP159.DUP1

OP159.DUP1:                                       ; preds = %OP158.JUMPI
  %gas.remaining531 = load i64, ptr %gas.remaining.addr, align 8
  %458 = sub i64 %gas.remaining531, 66
  %459 = icmp ult i64 %gas.remaining531, 66
  store i64 %458, ptr %gas.remaining.addr, align 8
  br i1 %459, label %return, label %OP159.DUP1.contd, !prof !2, !annotation !3

OP159.DUP1.contd:                                 ; preds = %OP159.DUP1
  %stack_len532 = load i64, ptr %len.addr, align 8
  %460 = icmp ult i64 %stack_len532, 2
  %461 = icmp ugt i64 %stack_len532, 1019
  %462 = or i1 %460, %461
  %463 = select i1 %460, i8 91, i8 92
  br i1 %462, label %return, label %OP159.DUP1.contd533, !prof !2

OP159.DUP1.contd533:                              ; preds = %OP159.DUP1.contd
  %464 = add i64 %stack_len532, 1
  store i64 %464, ptr %len.addr, align 8
  %465 = sub i64 %stack_len532, 1
  %sp534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %465
  %dup1535 = load i256, ptr %sp534, align 16
  %sp536 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len532
  store i256 %dup1535, ptr %sp536, align 16
  br label %OP160.DUP3, !annotation !5

OP160.DUP3:                                       ; preds = %OP159.DUP1.contd533
  %stack_len537 = load i64, ptr %len.addr, align 8
  %466 = add i64 %stack_len537, 1
  store i64 %466, ptr %len.addr, align 8
  %467 = sub i64 %stack_len537, 3
  %sp538 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %467
  %dup3539 = load i256, ptr %sp538, align 16
  %sp540 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len537
  store i256 %dup3539, ptr %sp540, align 16
  br label %OP161.SUB, !annotation !5

OP161.SUB:                                        ; preds = %OP160.DUP3
  %stack_len541 = load i64, ptr %len.addr, align 8
  %468 = add i64 %stack_len541, -1
  store i64 %468, ptr %len.addr, align 8
  %469 = add i64 %stack_len541, -1
  %sp542 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %469
  %a543 = load i256, ptr %sp542, align 16
  %470 = add i64 %stack_len541, -2
  %sp544 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %470
  %b545 = load i256, ptr %sp544, align 16
  %471 = sub i256 %a543, %b545
  %472 = add i64 %stack_len541, -2
  %sp546 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %472
  store i256 %471, ptr %sp546, align 16
  br label %OP162.DUP1, !annotation !5

OP162.DUP1:                                       ; preds = %OP161.SUB
  %stack_len547 = load i64, ptr %len.addr, align 8
  %473 = add i64 %stack_len547, 1
  store i64 %473, ptr %len.addr, align 8
  %474 = sub i64 %stack_len547, 1
  %sp548 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %474
  %dup1549 = load i256, ptr %sp548, align 16
  %sp550 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len547
  store i256 %dup1549, ptr %sp550, align 16
  br label %OP163.MLOAD, !annotation !5

OP163.MLOAD:                                      ; preds = %OP162.DUP1
  %stack_len551 = load i64, ptr %len.addr, align 8
  %475 = add i64 %stack_len551, -1
  %sp552 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %475
  %a553 = load i256, ptr %sp552, align 16
  %mload.out.slot554 = alloca i256, align 16
  %476 = call i8 @__revmc_ir_builtin_mload(i256 %a553, ptr %mload.out.slot554, ptr %arg.ecx.addr)
  %477 = icmp ne i8 %476, 0
  br i1 %477, label %return, label %OP163.MLOAD.contd, !prof !2

OP163.MLOAD.contd:                                ; preds = %OP163.MLOAD
  %mload.out555 = load i256, ptr %mload.out.slot554, align 16
  %478 = add i64 %stack_len551, -1
  %sp556 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %478
  store i256 %mload.out555, ptr %sp556, align 16
  br label %OP164.PUSH1, !annotation !5

OP164.PUSH1:                                      ; preds = %OP163.MLOAD.contd
  %stack_len557 = load i64, ptr %len.addr, align 8
  %479 = add i64 %stack_len557, 1
  store i64 %479, ptr %len.addr, align 8
  %sp558 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len557
  store i256 1, ptr %sp558, align 16
  br label %OP165.DUP4, !annotation !5

OP165.DUP4:                                       ; preds = %OP164.PUSH1
  %stack_len559 = load i64, ptr %len.addr, align 8
  %480 = add i64 %stack_len559, 1
  store i64 %480, ptr %len.addr, align 8
  %481 = sub i64 %stack_len559, 4
  %sp560 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %481
  %dup4561 = load i256, ptr %sp560, align 16
  %sp562 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len559
  store i256 %dup4561, ptr %sp562, align 16
  br label %OP166.PUSH1, !annotation !5

OP166.PUSH1:                                      ; preds = %OP165.DUP4
  %stack_len563 = load i64, ptr %len.addr, align 8
  %482 = add i64 %stack_len563, 1
  store i64 %482, ptr %len.addr, align 8
  %sp564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len563
  store i256 32, ptr %sp564, align 16
  br label %OP167.SUB, !annotation !5

OP167.SUB:                                        ; preds = %OP166.PUSH1
  %stack_len565 = load i64, ptr %len.addr, align 8
  %483 = add i64 %stack_len565, -1
  store i64 %483, ptr %len.addr, align 8
  %484 = add i64 %stack_len565, -1
  %sp566 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %484
  %a567 = load i256, ptr %sp566, align 16
  %485 = add i64 %stack_len565, -2
  %sp568 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %485
  %b569 = load i256, ptr %sp568, align 16
  %486 = sub i256 %a567, %b569
  %487 = add i64 %stack_len565, -2
  %sp570 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %487
  store i256 %486, ptr %sp570, align 16
  br label %OP168.PUSH2, !annotation !5

OP168.PUSH2:                                      ; preds = %OP167.SUB
  %stack_len571 = load i64, ptr %len.addr, align 8
  %488 = add i64 %stack_len571, 1
  store i64 %488, ptr %len.addr, align 8
  %sp572 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len571
  store i256 256, ptr %sp572, align 16
  br label %OP169.EXP, !annotation !5

OP169.EXP:                                        ; preds = %OP168.PUSH2
  %stack_len573 = load i64, ptr %len.addr, align 8
  %489 = add i64 %stack_len573, -1
  store i64 %489, ptr %len.addr, align 8
  %490 = sub i64 %stack_len573, 2
  %sp574 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %490
  %491 = call i8 @__revmc_builtin_exp(ptr %arg.ecx.addr, ptr %sp574, i8 19)
  %492 = icmp ne i8 %491, 0
  br i1 %492, label %return, label %OP169.EXP.contd, !prof !2

OP169.EXP.contd:                                  ; preds = %OP169.EXP
  br label %OP170.SUB, !annotation !5

OP170.SUB:                                        ; preds = %OP169.EXP.contd
  %stack_len575 = load i64, ptr %len.addr, align 8
  %493 = add i64 %stack_len575, -1
  store i64 %493, ptr %len.addr, align 8
  %494 = add i64 %stack_len575, -1
  %sp576 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %494
  %a577 = load i256, ptr %sp576, align 16
  %495 = add i64 %stack_len575, -2
  %sp578 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %495
  %b579 = load i256, ptr %sp578, align 16
  %496 = sub i256 %a577, %b579
  %497 = add i64 %stack_len575, -2
  %sp580 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %497
  store i256 %496, ptr %sp580, align 16
  br label %OP171.NOT, !annotation !5

OP171.NOT:                                        ; preds = %OP170.SUB
  %stack_len581 = load i64, ptr %len.addr, align 8
  %498 = add i64 %stack_len581, -1
  %sp582 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %498
  %a583 = load i256, ptr %sp582, align 16
  %499 = xor i256 %a583, -1
  %500 = add i64 %stack_len581, -1
  %sp584 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %500
  store i256 %499, ptr %sp584, align 16
  br label %OP172.AND, !annotation !5

OP172.AND:                                        ; preds = %OP171.NOT
  %stack_len585 = load i64, ptr %len.addr, align 8
  %501 = add i64 %stack_len585, -1
  store i64 %501, ptr %len.addr, align 8
  %502 = add i64 %stack_len585, -1
  %sp586 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %502
  %a587 = load i256, ptr %sp586, align 16
  %503 = add i64 %stack_len585, -2
  %sp588 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %503
  %b589 = load i256, ptr %sp588, align 16
  %504 = and i256 %a587, %b589
  %505 = add i64 %stack_len585, -2
  %sp590 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %505
  store i256 %504, ptr %sp590, align 16
  br label %OP173.DUP2, !annotation !5

OP173.DUP2:                                       ; preds = %OP172.AND
  %stack_len591 = load i64, ptr %len.addr, align 8
  %506 = add i64 %stack_len591, 1
  store i64 %506, ptr %len.addr, align 8
  %507 = sub i64 %stack_len591, 2
  %sp592 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %507
  %dup2593 = load i256, ptr %sp592, align 16
  %sp594 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len591
  store i256 %dup2593, ptr %sp594, align 16
  br label %OP174.MSTORE, !annotation !5

OP174.MSTORE:                                     ; preds = %OP173.DUP2
  %stack_len595 = load i64, ptr %len.addr, align 8
  %508 = add i64 %stack_len595, -2
  store i64 %508, ptr %len.addr, align 8
  %509 = add i64 %stack_len595, -1
  %sp596 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %509
  %a597 = load i256, ptr %sp596, align 16
  %510 = add i64 %stack_len595, -2
  %sp598 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %510
  %b599 = load i256, ptr %sp598, align 16
  %511 = call i8 @__revmc_ir_builtin_mstore(i256 %a597, i256 %b599, ptr %arg.ecx.addr)
  %512 = icmp ne i8 %511, 0
  br i1 %512, label %return, label %OP174.MSTORE.contd, !prof !2

OP174.MSTORE.contd:                               ; preds = %OP174.MSTORE
  br label %OP175.PUSH1, !annotation !5

OP175.PUSH1:                                      ; preds = %OP174.MSTORE.contd
  %stack_len600 = load i64, ptr %len.addr, align 8
  %513 = add i64 %stack_len600, 1
  store i64 %513, ptr %len.addr, align 8
  %sp601 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len600
  store i256 32, ptr %sp601, align 16
  br label %OP176.ADD, !annotation !5

OP176.ADD:                                        ; preds = %OP175.PUSH1
  %stack_len602 = load i64, ptr %len.addr, align 8
  %514 = add i64 %stack_len602, -1
  store i64 %514, ptr %len.addr, align 8
  %515 = add i64 %stack_len602, -1
  %sp603 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %515
  %a604 = load i256, ptr %sp603, align 16
  %516 = add i64 %stack_len602, -2
  %sp605 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %516
  %b606 = load i256, ptr %sp605, align 16
  %517 = add i256 %a604, %b606
  %518 = add i64 %stack_len602, -2
  %sp607 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %518
  store i256 %517, ptr %sp607, align 16
  br label %OP177.SWAP2, !annotation !5

OP177.SWAP2:                                      ; preds = %OP176.ADD
  %stack_len608 = load i64, ptr %len.addr, align 8
  %519 = sub i64 %stack_len608, 1
  %sp609 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %519
  %swap.a610 = load i256, ptr %sp609, align 16
  %520 = sub i64 %stack_len608, 3
  %sp611 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %520
  %swap.b612 = load i256, ptr %sp611, align 16
  store i256 %swap.a610, ptr %sp611, align 16
  store i256 %swap.b612, ptr %sp609, align 16
  br label %OP178.POP, !annotation !5

OP178.POP:                                        ; preds = %OP177.SWAP2
  %stack_len613 = load i64, ptr %len.addr, align 8
  %521 = add i64 %stack_len613, -1
  store i64 %521, ptr %len.addr, align 8
  br label %OP179.JUMPDEST, !annotation !5

OP179.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP178.POP, %OP158.JUMPI
  %gas.remaining614 = load i64, ptr %gas.remaining.addr, align 8
  %522 = sub i64 %gas.remaining614, 30
  %523 = icmp ult i64 %gas.remaining614, 30
  store i64 %522, ptr %gas.remaining.addr, align 8
  br i1 %523, label %return, label %OP179.JUMPDEST.contd, !prof !2, !annotation !3

OP179.JUMPDEST.contd:                             ; preds = %OP179.JUMPDEST
  %stack_len615 = load i64, ptr %len.addr, align 8
  %524 = icmp ult i64 %stack_len615, 5
  br i1 %524, label %return, label %OP179.JUMPDEST.contd616, !prof !2, !annotation !9

OP179.JUMPDEST.contd616:                          ; preds = %OP179.JUMPDEST.contd
  br label %OP180.POP, !annotation !5

OP180.POP:                                        ; preds = %OP179.JUMPDEST.contd616
  %stack_len617 = load i64, ptr %len.addr, align 8
  %525 = add i64 %stack_len617, -1
  store i64 %525, ptr %len.addr, align 8
  br label %OP181.SWAP3, !annotation !5

OP181.SWAP3:                                      ; preds = %OP180.POP
  %stack_len618 = load i64, ptr %len.addr, align 8
  %526 = sub i64 %stack_len618, 1
  %sp619 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %526
  %swap.a620 = load i256, ptr %sp619, align 16
  %527 = sub i64 %stack_len618, 4
  %sp621 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %527
  %swap.b622 = load i256, ptr %sp621, align 16
  store i256 %swap.a620, ptr %sp621, align 16
  store i256 %swap.b622, ptr %sp619, align 16
  br label %OP182.POP, !annotation !5

OP182.POP:                                        ; preds = %OP181.SWAP3
  %stack_len623 = load i64, ptr %len.addr, align 8
  %528 = add i64 %stack_len623, -1
  store i64 %528, ptr %len.addr, align 8
  br label %OP183.POP, !annotation !5

OP183.POP:                                        ; preds = %OP182.POP
  %stack_len624 = load i64, ptr %len.addr, align 8
  %529 = add i64 %stack_len624, -1
  store i64 %529, ptr %len.addr, align 8
  br label %OP184.POP, !annotation !5

OP184.POP:                                        ; preds = %OP183.POP
  %stack_len625 = load i64, ptr %len.addr, align 8
  %530 = add i64 %stack_len625, -1
  store i64 %530, ptr %len.addr, align 8
  br label %OP185.PUSH1, !annotation !5

OP185.PUSH1:                                      ; preds = %OP184.POP
  %stack_len626 = load i64, ptr %len.addr, align 8
  %531 = add i64 %stack_len626, 1
  store i64 %531, ptr %len.addr, align 8
  %sp627 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len626
  store i256 64, ptr %sp627, align 16
  br label %OP186.MLOAD, !annotation !5

OP186.MLOAD:                                      ; preds = %OP185.PUSH1
  %stack_len628 = load i64, ptr %len.addr, align 8
  %532 = add i64 %stack_len628, -1
  %sp629 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %532
  %a630 = load i256, ptr %sp629, align 16
  %mload.out.slot631 = alloca i256, align 16
  %533 = call i8 @__revmc_ir_builtin_mload(i256 %a630, ptr %mload.out.slot631, ptr %arg.ecx.addr)
  %534 = icmp ne i8 %533, 0
  br i1 %534, label %return, label %OP186.MLOAD.contd, !prof !2

OP186.MLOAD.contd:                                ; preds = %OP186.MLOAD
  %mload.out632 = load i256, ptr %mload.out.slot631, align 16
  %535 = add i64 %stack_len628, -1
  %sp633 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %535
  store i256 %mload.out632, ptr %sp633, align 16
  br label %OP187.DUP1, !annotation !5

OP187.DUP1:                                       ; preds = %OP186.MLOAD.contd
  %stack_len634 = load i64, ptr %len.addr, align 8
  %536 = add i64 %stack_len634, 1
  store i64 %536, ptr %len.addr, align 8
  %537 = sub i64 %stack_len634, 1
  %sp635 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %537
  %dup1636 = load i256, ptr %sp635, align 16
  %sp637 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len634
  store i256 %dup1636, ptr %sp637, align 16
  br label %OP188.SWAP2, !annotation !5

OP188.SWAP2:                                      ; preds = %OP187.DUP1
  %stack_len638 = load i64, ptr %len.addr, align 8
  %538 = sub i64 %stack_len638, 1
  %sp639 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %538
  %swap.a640 = load i256, ptr %sp639, align 16
  %539 = sub i64 %stack_len638, 3
  %sp641 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %539
  %swap.b642 = load i256, ptr %sp641, align 16
  store i256 %swap.a640, ptr %sp641, align 16
  store i256 %swap.b642, ptr %sp639, align 16
  br label %OP189.SUB, !annotation !5

OP189.SUB:                                        ; preds = %OP188.SWAP2
  %stack_len643 = load i64, ptr %len.addr, align 8
  %540 = add i64 %stack_len643, -1
  store i64 %540, ptr %len.addr, align 8
  %541 = add i64 %stack_len643, -1
  %sp644 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %541
  %a645 = load i256, ptr %sp644, align 16
  %542 = add i64 %stack_len643, -2
  %sp646 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %542
  %b647 = load i256, ptr %sp646, align 16
  %543 = sub i256 %a645, %b647
  %544 = add i64 %stack_len643, -2
  %sp648 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %544
  store i256 %543, ptr %sp648, align 16
  br label %OP190.SWAP1, !annotation !5

OP190.SWAP1:                                      ; preds = %OP189.SUB
  %stack_len649 = load i64, ptr %len.addr, align 8
  %545 = sub i64 %stack_len649, 1
  %sp650 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %545
  %swap.a651 = load i256, ptr %sp650, align 16
  %546 = sub i64 %stack_len649, 2
  %sp652 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %546
  %swap.b653 = load i256, ptr %sp652, align 16
  store i256 %swap.a651, ptr %sp652, align 16
  store i256 %swap.b653, ptr %sp650, align 16
  br label %OP191.RETURN, !annotation !5

OP191.RETURN:                                     ; preds = %OP190.SWAP1
  %stack_len654 = load i64, ptr %len.addr, align 8
  %547 = add i64 %stack_len654, -2
  store i64 %547, ptr %len.addr, align 8
  %548 = sub i64 %stack_len654, 2
  %sp655 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %548
  %549 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp655, i8 2)
  %550 = icmp ne i8 %549, 0
  br i1 %550, label %return, label %OP191.RETURN.contd, !prof !2

OP191.RETURN.contd:                               ; preds = %OP191.RETURN
  br label %return, !annotation !10

OP192.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP24.JUMPI
  %gas.remaining656 = load i64, ptr %gas.remaining.addr, align 8
  %551 = sub i64 %gas.remaining656, 19
  %552 = icmp ult i64 %gas.remaining656, 19
  store i64 %551, ptr %gas.remaining.addr, align 8
  br i1 %552, label %return, label %OP192.JUMPDEST.contd, !prof !2, !annotation !3

OP192.JUMPDEST.contd:                             ; preds = %OP192.JUMPDEST
  %stack_len657 = load i64, ptr %len.addr, align 8
  %553 = icmp ugt i64 %stack_len657, 1022
  br i1 %553, label %return, label %OP192.JUMPDEST.contd658, !prof !2, !annotation !4

OP192.JUMPDEST.contd658:                          ; preds = %OP192.JUMPDEST.contd
  br label %OP193.CALLVALUE, !annotation !5

OP193.CALLVALUE:                                  ; preds = %OP192.JUMPDEST.contd658
  %stack_len659 = load i64, ptr %len.addr, align 8
  %554 = add i64 %stack_len659, 1
  store i64 %554, ptr %len.addr, align 8
  %contract.call_value.addr660 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value661 = load i256, ptr %contract.call_value.addr660, align 16
  %sp662 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len659
  store i256 %contract.call_value661, ptr %sp662, align 16
  br label %OP194.ISZERO, !annotation !5

OP194.ISZERO:                                     ; preds = %OP193.CALLVALUE
  %stack_len663 = load i64, ptr %len.addr, align 8
  %555 = add i64 %stack_len663, -1
  %sp664 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %555
  %a665 = load i256, ptr %sp664, align 16
  %556 = icmp eq i256 %a665, 0
  %557 = zext i1 %556 to i256
  %558 = add i64 %stack_len663, -1
  %sp666 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %558
  store i256 %557, ptr %sp666, align 16
  br label %OP195.PUSH2, !annotation !5

OP195.PUSH2:                                      ; preds = %OP194.ISZERO
  br label %OP196.JUMPI, !annotation !6

OP196.JUMPI:                                      ; preds = %OP195.PUSH2
  %stack_len667 = load i64, ptr %len.addr, align 8
  %559 = add i64 %stack_len667, -1
  store i64 %559, ptr %len.addr, align 8
  %560 = add i64 %stack_len667, -1
  %sp668 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %560
  %a669 = load i256, ptr %sp668, align 16
  %561 = icmp ne i256 %a669, 0
  br i1 %561, label %OP200.JUMPDEST, label %OP197.PUSH1

OP197.PUSH1:                                      ; preds = %OP196.JUMPI
  %gas.remaining670 = load i64, ptr %gas.remaining.addr, align 8
  %562 = sub i64 %gas.remaining670, 6
  %563 = icmp ult i64 %gas.remaining670, 6
  store i64 %562, ptr %gas.remaining.addr, align 8
  br i1 %563, label %return, label %OP197.PUSH1.contd, !prof !2, !annotation !3

OP197.PUSH1.contd:                                ; preds = %OP197.PUSH1
  %stack_len671 = load i64, ptr %len.addr, align 8
  %564 = icmp ugt i64 %stack_len671, 1022
  br i1 %564, label %return, label %OP197.PUSH1.contd672, !prof !2, !annotation !4

OP197.PUSH1.contd672:                             ; preds = %OP197.PUSH1.contd
  %565 = add i64 %stack_len671, 1
  store i64 %565, ptr %len.addr, align 8
  %sp673 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len671
  store i256 0, ptr %sp673, align 16
  br label %OP198.DUP1, !annotation !5

OP198.DUP1:                                       ; preds = %OP197.PUSH1.contd672
  %stack_len674 = load i64, ptr %len.addr, align 8
  %566 = add i64 %stack_len674, 1
  store i64 %566, ptr %len.addr, align 8
  %567 = sub i64 %stack_len674, 1
  %sp675 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %567
  %dup1676 = load i256, ptr %sp675, align 16
  %sp677 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len674
  store i256 %dup1676, ptr %sp677, align 16
  br label %OP199.REVERT, !annotation !5

OP199.REVERT:                                     ; preds = %OP198.DUP1
  %stack_len678 = load i64, ptr %len.addr, align 8
  %568 = add i64 %stack_len678, -2
  store i64 %568, ptr %len.addr, align 8
  %569 = sub i64 %stack_len678, 2
  %sp679 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %569
  %570 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp679, i8 16)
  %571 = icmp ne i8 %570, 0
  br i1 %571, label %return, label %OP199.REVERT.contd, !prof !2

OP199.REVERT.contd:                               ; preds = %OP199.REVERT
  br label %return, !annotation !8

OP200.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP196.JUMPI
  %gas.remaining680 = load i64, ptr %gas.remaining.addr, align 8
  %572 = sub i64 %gas.remaining680, 79
  %573 = icmp ult i64 %gas.remaining680, 79
  store i64 %572, ptr %gas.remaining.addr, align 8
  br i1 %573, label %return, label %OP200.JUMPDEST.contd, !prof !2, !annotation !3

OP200.JUMPDEST.contd:                             ; preds = %OP200.JUMPDEST
  %stack_len681 = load i64, ptr %len.addr, align 8
  %574 = icmp ugt i64 %stack_len681, 1018
  br i1 %574, label %return, label %OP200.JUMPDEST.contd682, !prof !2, !annotation !4

OP200.JUMPDEST.contd682:                          ; preds = %OP200.JUMPDEST.contd
  br label %OP201.PUSH2, !annotation !5

OP201.PUSH2:                                      ; preds = %OP200.JUMPDEST.contd682
  %stack_len683 = load i64, ptr %len.addr, align 8
  %575 = add i64 %stack_len683, 1
  store i64 %575, ptr %len.addr, align 8
  %sp684 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len683
  store i256 391, ptr %sp684, align 16
  br label %OP202.PUSH1, !annotation !5

OP202.PUSH1:                                      ; preds = %OP201.PUSH2
  %stack_len685 = load i64, ptr %len.addr, align 8
  %576 = add i64 %stack_len685, 1
  store i64 %576, ptr %len.addr, align 8
  %sp686 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len685
  store i256 4, ptr %sp686, align 16
  br label %OP203.DUP1, !annotation !5

OP203.DUP1:                                       ; preds = %OP202.PUSH1
  %stack_len687 = load i64, ptr %len.addr, align 8
  %577 = add i64 %stack_len687, 1
  store i64 %577, ptr %len.addr, align 8
  %578 = sub i64 %stack_len687, 1
  %sp688 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %578
  %dup1689 = load i256, ptr %sp688, align 16
  %sp690 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len687
  store i256 %dup1689, ptr %sp690, align 16
  br label %OP204.DUP1, !annotation !5

OP204.DUP1:                                       ; preds = %OP203.DUP1
  %stack_len691 = load i64, ptr %len.addr, align 8
  %579 = add i64 %stack_len691, 1
  store i64 %579, ptr %len.addr, align 8
  %580 = sub i64 %stack_len691, 1
  %sp692 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %580
  %dup1693 = load i256, ptr %sp692, align 16
  %sp694 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len691
  store i256 %dup1693, ptr %sp694, align 16
  br label %OP205.CALLDATALOAD, !annotation !5

OP205.CALLDATALOAD:                               ; preds = %OP204.DUP1
  %stack_len695 = load i64, ptr %len.addr, align 8
  %581 = add i64 %stack_len695, -1
  %sp696 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %581
  %a697 = load i256, ptr %sp696, align 16
  %582 = call i256 @__revmc_ir_builtin_calldataload(i256 %a697, ptr %arg.contract.addr)
  %583 = add i64 %stack_len695, -1
  %sp698 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %583
  store i256 %582, ptr %sp698, align 16
  br label %OP206.PUSH20, !annotation !5

OP206.PUSH20:                                     ; preds = %OP205.CALLDATALOAD
  %stack_len699 = load i64, ptr %len.addr, align 8
  %584 = add i64 %stack_len699, 1
  store i64 %584, ptr %len.addr, align 8
  %sp700 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len699
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp700, align 16
  br label %OP207.AND, !annotation !5

OP207.AND:                                        ; preds = %OP206.PUSH20
  %stack_len701 = load i64, ptr %len.addr, align 8
  %585 = add i64 %stack_len701, -1
  store i64 %585, ptr %len.addr, align 8
  %586 = add i64 %stack_len701, -1
  %sp702 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %586
  %a703 = load i256, ptr %sp702, align 16
  %587 = add i64 %stack_len701, -2
  %sp704 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %587
  %b705 = load i256, ptr %sp704, align 16
  %588 = and i256 %a703, %b705
  %589 = add i64 %stack_len701, -2
  %sp706 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %589
  store i256 %588, ptr %sp706, align 16
  br label %OP208.SWAP1, !annotation !5

OP208.SWAP1:                                      ; preds = %OP207.AND
  %stack_len707 = load i64, ptr %len.addr, align 8
  %590 = sub i64 %stack_len707, 1
  %sp708 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %590
  %swap.a709 = load i256, ptr %sp708, align 16
  %591 = sub i64 %stack_len707, 2
  %sp710 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %591
  %swap.b711 = load i256, ptr %sp710, align 16
  store i256 %swap.a709, ptr %sp710, align 16
  store i256 %swap.b711, ptr %sp708, align 16
  br label %OP209.PUSH1, !annotation !5

OP209.PUSH1:                                      ; preds = %OP208.SWAP1
  %stack_len712 = load i64, ptr %len.addr, align 8
  %592 = add i64 %stack_len712, 1
  store i64 %592, ptr %len.addr, align 8
  %sp713 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len712
  store i256 32, ptr %sp713, align 16
  br label %OP210.ADD, !annotation !5

OP210.ADD:                                        ; preds = %OP209.PUSH1
  %stack_len714 = load i64, ptr %len.addr, align 8
  %593 = add i64 %stack_len714, -1
  store i64 %593, ptr %len.addr, align 8
  %594 = add i64 %stack_len714, -1
  %sp715 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %594
  %a716 = load i256, ptr %sp715, align 16
  %595 = add i64 %stack_len714, -2
  %sp717 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %595
  %b718 = load i256, ptr %sp717, align 16
  %596 = add i256 %a716, %b718
  %597 = add i64 %stack_len714, -2
  %sp719 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %597
  store i256 %596, ptr %sp719, align 16
  br label %OP211.SWAP1, !annotation !5

OP211.SWAP1:                                      ; preds = %OP210.ADD
  %stack_len720 = load i64, ptr %len.addr, align 8
  %598 = sub i64 %stack_len720, 1
  %sp721 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %598
  %swap.a722 = load i256, ptr %sp721, align 16
  %599 = sub i64 %stack_len720, 2
  %sp723 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %599
  %swap.b724 = load i256, ptr %sp723, align 16
  store i256 %swap.a722, ptr %sp723, align 16
  store i256 %swap.b724, ptr %sp721, align 16
  br label %OP212.SWAP2, !annotation !5

OP212.SWAP2:                                      ; preds = %OP211.SWAP1
  %stack_len725 = load i64, ptr %len.addr, align 8
  %600 = sub i64 %stack_len725, 1
  %sp726 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %600
  %swap.a727 = load i256, ptr %sp726, align 16
  %601 = sub i64 %stack_len725, 3
  %sp728 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %601
  %swap.b729 = load i256, ptr %sp728, align 16
  store i256 %swap.a727, ptr %sp728, align 16
  store i256 %swap.b729, ptr %sp726, align 16
  br label %OP213.SWAP1, !annotation !5

OP213.SWAP1:                                      ; preds = %OP212.SWAP2
  %stack_len730 = load i64, ptr %len.addr, align 8
  %602 = sub i64 %stack_len730, 1
  %sp731 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %602
  %swap.a732 = load i256, ptr %sp731, align 16
  %603 = sub i64 %stack_len730, 2
  %sp733 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %603
  %swap.b734 = load i256, ptr %sp733, align 16
  store i256 %swap.a732, ptr %sp733, align 16
  store i256 %swap.b734, ptr %sp731, align 16
  br label %OP214.DUP1, !annotation !5

OP214.DUP1:                                       ; preds = %OP213.SWAP1
  %stack_len735 = load i64, ptr %len.addr, align 8
  %604 = add i64 %stack_len735, 1
  store i64 %604, ptr %len.addr, align 8
  %605 = sub i64 %stack_len735, 1
  %sp736 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %605
  %dup1737 = load i256, ptr %sp736, align 16
  %sp738 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len735
  store i256 %dup1737, ptr %sp738, align 16
  br label %OP215.CALLDATALOAD, !annotation !5

OP215.CALLDATALOAD:                               ; preds = %OP214.DUP1
  %stack_len739 = load i64, ptr %len.addr, align 8
  %606 = add i64 %stack_len739, -1
  %sp740 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %606
  %a741 = load i256, ptr %sp740, align 16
  %607 = call i256 @__revmc_ir_builtin_calldataload(i256 %a741, ptr %arg.contract.addr)
  %608 = add i64 %stack_len739, -1
  %sp742 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %608
  store i256 %607, ptr %sp742, align 16
  br label %OP216.SWAP1, !annotation !5

OP216.SWAP1:                                      ; preds = %OP215.CALLDATALOAD
  %stack_len743 = load i64, ptr %len.addr, align 8
  %609 = sub i64 %stack_len743, 1
  %sp744 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %609
  %swap.a745 = load i256, ptr %sp744, align 16
  %610 = sub i64 %stack_len743, 2
  %sp746 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %610
  %swap.b747 = load i256, ptr %sp746, align 16
  store i256 %swap.a745, ptr %sp746, align 16
  store i256 %swap.b747, ptr %sp744, align 16
  br label %OP217.PUSH1, !annotation !5

OP217.PUSH1:                                      ; preds = %OP216.SWAP1
  %stack_len748 = load i64, ptr %len.addr, align 8
  %611 = add i64 %stack_len748, 1
  store i64 %611, ptr %len.addr, align 8
  %sp749 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len748
  store i256 32, ptr %sp749, align 16
  br label %OP218.ADD, !annotation !5

OP218.ADD:                                        ; preds = %OP217.PUSH1
  %stack_len750 = load i64, ptr %len.addr, align 8
  %612 = add i64 %stack_len750, -1
  store i64 %612, ptr %len.addr, align 8
  %613 = add i64 %stack_len750, -1
  %sp751 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %613
  %a752 = load i256, ptr %sp751, align 16
  %614 = add i64 %stack_len750, -2
  %sp753 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %614
  %b754 = load i256, ptr %sp753, align 16
  %615 = add i256 %a752, %b754
  %616 = add i64 %stack_len750, -2
  %sp755 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %616
  store i256 %615, ptr %sp755, align 16
  br label %OP219.SWAP1, !annotation !5

OP219.SWAP1:                                      ; preds = %OP218.ADD
  %stack_len756 = load i64, ptr %len.addr, align 8
  %617 = sub i64 %stack_len756, 1
  %sp757 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %617
  %swap.a758 = load i256, ptr %sp757, align 16
  %618 = sub i64 %stack_len756, 2
  %sp759 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %618
  %swap.b760 = load i256, ptr %sp759, align 16
  store i256 %swap.a758, ptr %sp759, align 16
  store i256 %swap.b760, ptr %sp757, align 16
  br label %OP220.SWAP2, !annotation !5

OP220.SWAP2:                                      ; preds = %OP219.SWAP1
  %stack_len761 = load i64, ptr %len.addr, align 8
  %619 = sub i64 %stack_len761, 1
  %sp762 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %619
  %swap.a763 = load i256, ptr %sp762, align 16
  %620 = sub i64 %stack_len761, 3
  %sp764 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %620
  %swap.b765 = load i256, ptr %sp764, align 16
  store i256 %swap.a763, ptr %sp764, align 16
  store i256 %swap.b765, ptr %sp762, align 16
  br label %OP221.SWAP1, !annotation !5

OP221.SWAP1:                                      ; preds = %OP220.SWAP2
  %stack_len766 = load i64, ptr %len.addr, align 8
  %621 = sub i64 %stack_len766, 1
  %sp767 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %621
  %swap.a768 = load i256, ptr %sp767, align 16
  %622 = sub i64 %stack_len766, 2
  %sp769 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %622
  %swap.b770 = load i256, ptr %sp769, align 16
  store i256 %swap.a768, ptr %sp769, align 16
  store i256 %swap.b770, ptr %sp767, align 16
  br label %OP222.POP, !annotation !5

OP222.POP:                                        ; preds = %OP221.SWAP1
  %stack_len771 = load i64, ptr %len.addr, align 8
  %623 = add i64 %stack_len771, -1
  store i64 %623, ptr %len.addr, align 8
  br label %OP223.POP, !annotation !5

OP223.POP:                                        ; preds = %OP222.POP
  %stack_len772 = load i64, ptr %len.addr, align 8
  %624 = add i64 %stack_len772, -1
  store i64 %624, ptr %len.addr, align 8
  br label %OP224.PUSH2, !annotation !5

OP224.PUSH2:                                      ; preds = %OP223.POP
  br label %OP225.JUMP, !annotation !6

OP225.JUMP:                                       ; preds = %OP224.PUSH2
  %stack_len773 = load i64, ptr %len.addr, align 8
  br label %OP866.JUMPDEST

OP226.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining774 = load i64, ptr %gas.remaining.addr, align 8
  %625 = sub i64 %gas.remaining774, 62
  %626 = icmp ult i64 %gas.remaining774, 62
  store i64 %625, ptr %gas.remaining.addr, align 8
  br i1 %626, label %return, label %OP226.JUMPDEST.contd, !prof !2, !annotation !3

OP226.JUMPDEST.contd:                             ; preds = %OP226.JUMPDEST
  %stack_len775 = load i64, ptr %len.addr, align 8
  %627 = icmp ult i64 %stack_len775, 1
  %628 = icmp ugt i64 %stack_len775, 1020
  %629 = or i1 %627, %628
  %630 = select i1 %627, i8 91, i8 92
  br i1 %629, label %return, label %OP226.JUMPDEST.contd776, !prof !2

OP226.JUMPDEST.contd776:                          ; preds = %OP226.JUMPDEST.contd
  br label %OP227.PUSH1, !annotation !5

OP227.PUSH1:                                      ; preds = %OP226.JUMPDEST.contd776
  %stack_len777 = load i64, ptr %len.addr, align 8
  %631 = add i64 %stack_len777, 1
  store i64 %631, ptr %len.addr, align 8
  %sp778 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len777
  store i256 64, ptr %sp778, align 16
  br label %OP228.MLOAD, !annotation !5

OP228.MLOAD:                                      ; preds = %OP227.PUSH1
  %stack_len779 = load i64, ptr %len.addr, align 8
  %632 = add i64 %stack_len779, -1
  %sp780 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %632
  %a781 = load i256, ptr %sp780, align 16
  %mload.out.slot782 = alloca i256, align 16
  %633 = call i8 @__revmc_ir_builtin_mload(i256 %a781, ptr %mload.out.slot782, ptr %arg.ecx.addr)
  %634 = icmp ne i8 %633, 0
  br i1 %634, label %return, label %OP228.MLOAD.contd, !prof !2

OP228.MLOAD.contd:                                ; preds = %OP228.MLOAD
  %mload.out783 = load i256, ptr %mload.out.slot782, align 16
  %635 = add i64 %stack_len779, -1
  %sp784 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %635
  store i256 %mload.out783, ptr %sp784, align 16
  br label %OP229.DUP1, !annotation !5

OP229.DUP1:                                       ; preds = %OP228.MLOAD.contd
  %stack_len785 = load i64, ptr %len.addr, align 8
  %636 = add i64 %stack_len785, 1
  store i64 %636, ptr %len.addr, align 8
  %637 = sub i64 %stack_len785, 1
  %sp786 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %637
  %dup1787 = load i256, ptr %sp786, align 16
  %sp788 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len785
  store i256 %dup1787, ptr %sp788, align 16
  br label %OP230.DUP3, !annotation !5

OP230.DUP3:                                       ; preds = %OP229.DUP1
  %stack_len789 = load i64, ptr %len.addr, align 8
  %638 = add i64 %stack_len789, 1
  store i64 %638, ptr %len.addr, align 8
  %639 = sub i64 %stack_len789, 3
  %sp790 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %639
  %dup3791 = load i256, ptr %sp790, align 16
  %sp792 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len789
  store i256 %dup3791, ptr %sp792, align 16
  br label %OP231.ISZERO, !annotation !5

OP231.ISZERO:                                     ; preds = %OP230.DUP3
  %stack_len793 = load i64, ptr %len.addr, align 8
  %640 = add i64 %stack_len793, -1
  %sp794 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %640
  %a795 = load i256, ptr %sp794, align 16
  %641 = icmp eq i256 %a795, 0
  %642 = zext i1 %641 to i256
  %643 = add i64 %stack_len793, -1
  %sp796 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %643
  store i256 %642, ptr %sp796, align 16
  br label %OP232.ISZERO, !annotation !5

OP232.ISZERO:                                     ; preds = %OP231.ISZERO
  %stack_len797 = load i64, ptr %len.addr, align 8
  %644 = add i64 %stack_len797, -1
  %sp798 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %644
  %a799 = load i256, ptr %sp798, align 16
  %645 = icmp eq i256 %a799, 0
  %646 = zext i1 %645 to i256
  %647 = add i64 %stack_len797, -1
  %sp800 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %647
  store i256 %646, ptr %sp800, align 16
  br label %OP233.ISZERO, !annotation !5

OP233.ISZERO:                                     ; preds = %OP232.ISZERO
  %stack_len801 = load i64, ptr %len.addr, align 8
  %648 = add i64 %stack_len801, -1
  %sp802 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %648
  %a803 = load i256, ptr %sp802, align 16
  %649 = icmp eq i256 %a803, 0
  %650 = zext i1 %649 to i256
  %651 = add i64 %stack_len801, -1
  %sp804 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %651
  store i256 %650, ptr %sp804, align 16
  br label %OP234.ISZERO, !annotation !5

OP234.ISZERO:                                     ; preds = %OP233.ISZERO
  %stack_len805 = load i64, ptr %len.addr, align 8
  %652 = add i64 %stack_len805, -1
  %sp806 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %652
  %a807 = load i256, ptr %sp806, align 16
  %653 = icmp eq i256 %a807, 0
  %654 = zext i1 %653 to i256
  %655 = add i64 %stack_len805, -1
  %sp808 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %655
  store i256 %654, ptr %sp808, align 16
  br label %OP235.DUP2, !annotation !5

OP235.DUP2:                                       ; preds = %OP234.ISZERO
  %stack_len809 = load i64, ptr %len.addr, align 8
  %656 = add i64 %stack_len809, 1
  store i64 %656, ptr %len.addr, align 8
  %657 = sub i64 %stack_len809, 2
  %sp810 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %657
  %dup2811 = load i256, ptr %sp810, align 16
  %sp812 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len809
  store i256 %dup2811, ptr %sp812, align 16
  br label %OP236.MSTORE, !annotation !5

OP236.MSTORE:                                     ; preds = %OP235.DUP2
  %stack_len813 = load i64, ptr %len.addr, align 8
  %658 = add i64 %stack_len813, -2
  store i64 %658, ptr %len.addr, align 8
  %659 = add i64 %stack_len813, -1
  %sp814 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %659
  %a815 = load i256, ptr %sp814, align 16
  %660 = add i64 %stack_len813, -2
  %sp816 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %660
  %b817 = load i256, ptr %sp816, align 16
  %661 = call i8 @__revmc_ir_builtin_mstore(i256 %a815, i256 %b817, ptr %arg.ecx.addr)
  %662 = icmp ne i8 %661, 0
  br i1 %662, label %return, label %OP236.MSTORE.contd, !prof !2

OP236.MSTORE.contd:                               ; preds = %OP236.MSTORE
  br label %OP237.PUSH1, !annotation !5

OP237.PUSH1:                                      ; preds = %OP236.MSTORE.contd
  %stack_len818 = load i64, ptr %len.addr, align 8
  %663 = add i64 %stack_len818, 1
  store i64 %663, ptr %len.addr, align 8
  %sp819 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len818
  store i256 32, ptr %sp819, align 16
  br label %OP238.ADD, !annotation !5

OP238.ADD:                                        ; preds = %OP237.PUSH1
  %stack_len820 = load i64, ptr %len.addr, align 8
  %664 = add i64 %stack_len820, -1
  store i64 %664, ptr %len.addr, align 8
  %665 = add i64 %stack_len820, -1
  %sp821 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %665
  %a822 = load i256, ptr %sp821, align 16
  %666 = add i64 %stack_len820, -2
  %sp823 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %666
  %b824 = load i256, ptr %sp823, align 16
  %667 = add i256 %a822, %b824
  %668 = add i64 %stack_len820, -2
  %sp825 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %668
  store i256 %667, ptr %sp825, align 16
  br label %OP239.SWAP2, !annotation !5

OP239.SWAP2:                                      ; preds = %OP238.ADD
  %stack_len826 = load i64, ptr %len.addr, align 8
  %669 = sub i64 %stack_len826, 1
  %sp827 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %669
  %swap.a828 = load i256, ptr %sp827, align 16
  %670 = sub i64 %stack_len826, 3
  %sp829 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %670
  %swap.b830 = load i256, ptr %sp829, align 16
  store i256 %swap.a828, ptr %sp829, align 16
  store i256 %swap.b830, ptr %sp827, align 16
  br label %OP240.POP, !annotation !5

OP240.POP:                                        ; preds = %OP239.SWAP2
  %stack_len831 = load i64, ptr %len.addr, align 8
  %671 = add i64 %stack_len831, -1
  store i64 %671, ptr %len.addr, align 8
  br label %OP241.POP, !annotation !5

OP241.POP:                                        ; preds = %OP240.POP
  %stack_len832 = load i64, ptr %len.addr, align 8
  %672 = add i64 %stack_len832, -1
  store i64 %672, ptr %len.addr, align 8
  br label %OP242.PUSH1, !annotation !5

OP242.PUSH1:                                      ; preds = %OP241.POP
  %stack_len833 = load i64, ptr %len.addr, align 8
  %673 = add i64 %stack_len833, 1
  store i64 %673, ptr %len.addr, align 8
  %sp834 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len833
  store i256 64, ptr %sp834, align 16
  br label %OP243.MLOAD, !annotation !5

OP243.MLOAD:                                      ; preds = %OP242.PUSH1
  %stack_len835 = load i64, ptr %len.addr, align 8
  %674 = add i64 %stack_len835, -1
  %sp836 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %674
  %a837 = load i256, ptr %sp836, align 16
  %mload.out.slot838 = alloca i256, align 16
  %675 = call i8 @__revmc_ir_builtin_mload(i256 %a837, ptr %mload.out.slot838, ptr %arg.ecx.addr)
  %676 = icmp ne i8 %675, 0
  br i1 %676, label %return, label %OP243.MLOAD.contd, !prof !2

OP243.MLOAD.contd:                                ; preds = %OP243.MLOAD
  %mload.out839 = load i256, ptr %mload.out.slot838, align 16
  %677 = add i64 %stack_len835, -1
  %sp840 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %677
  store i256 %mload.out839, ptr %sp840, align 16
  br label %OP244.DUP1, !annotation !5

OP244.DUP1:                                       ; preds = %OP243.MLOAD.contd
  %stack_len841 = load i64, ptr %len.addr, align 8
  %678 = add i64 %stack_len841, 1
  store i64 %678, ptr %len.addr, align 8
  %679 = sub i64 %stack_len841, 1
  %sp842 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %679
  %dup1843 = load i256, ptr %sp842, align 16
  %sp844 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len841
  store i256 %dup1843, ptr %sp844, align 16
  br label %OP245.SWAP2, !annotation !5

OP245.SWAP2:                                      ; preds = %OP244.DUP1
  %stack_len845 = load i64, ptr %len.addr, align 8
  %680 = sub i64 %stack_len845, 1
  %sp846 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %680
  %swap.a847 = load i256, ptr %sp846, align 16
  %681 = sub i64 %stack_len845, 3
  %sp848 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %681
  %swap.b849 = load i256, ptr %sp848, align 16
  store i256 %swap.a847, ptr %sp848, align 16
  store i256 %swap.b849, ptr %sp846, align 16
  br label %OP246.SUB, !annotation !5

OP246.SUB:                                        ; preds = %OP245.SWAP2
  %stack_len850 = load i64, ptr %len.addr, align 8
  %682 = add i64 %stack_len850, -1
  store i64 %682, ptr %len.addr, align 8
  %683 = add i64 %stack_len850, -1
  %sp851 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %683
  %a852 = load i256, ptr %sp851, align 16
  %684 = add i64 %stack_len850, -2
  %sp853 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %684
  %b854 = load i256, ptr %sp853, align 16
  %685 = sub i256 %a852, %b854
  %686 = add i64 %stack_len850, -2
  %sp855 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %686
  store i256 %685, ptr %sp855, align 16
  br label %OP247.SWAP1, !annotation !5

OP247.SWAP1:                                      ; preds = %OP246.SUB
  %stack_len856 = load i64, ptr %len.addr, align 8
  %687 = sub i64 %stack_len856, 1
  %sp857 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %687
  %swap.a858 = load i256, ptr %sp857, align 16
  %688 = sub i64 %stack_len856, 2
  %sp859 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %688
  %swap.b860 = load i256, ptr %sp859, align 16
  store i256 %swap.a858, ptr %sp859, align 16
  store i256 %swap.b860, ptr %sp857, align 16
  br label %OP248.RETURN, !annotation !5

OP248.RETURN:                                     ; preds = %OP247.SWAP1
  %stack_len861 = load i64, ptr %len.addr, align 8
  %689 = add i64 %stack_len861, -2
  store i64 %689, ptr %len.addr, align 8
  %690 = sub i64 %stack_len861, 2
  %sp862 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %690
  %691 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp862, i8 2)
  %692 = icmp ne i8 %691, 0
  br i1 %692, label %return, label %OP248.RETURN.contd, !prof !2

OP248.RETURN.contd:                               ; preds = %OP248.RETURN
  br label %return, !annotation !10

OP249.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP29.JUMPI
  %gas.remaining863 = load i64, ptr %gas.remaining.addr, align 8
  %693 = sub i64 %gas.remaining863, 19
  %694 = icmp ult i64 %gas.remaining863, 19
  store i64 %693, ptr %gas.remaining.addr, align 8
  br i1 %694, label %return, label %OP249.JUMPDEST.contd, !prof !2, !annotation !3

OP249.JUMPDEST.contd:                             ; preds = %OP249.JUMPDEST
  %stack_len864 = load i64, ptr %len.addr, align 8
  %695 = icmp ugt i64 %stack_len864, 1022
  br i1 %695, label %return, label %OP249.JUMPDEST.contd865, !prof !2, !annotation !4

OP249.JUMPDEST.contd865:                          ; preds = %OP249.JUMPDEST.contd
  br label %OP250.CALLVALUE, !annotation !5

OP250.CALLVALUE:                                  ; preds = %OP249.JUMPDEST.contd865
  %stack_len866 = load i64, ptr %len.addr, align 8
  %696 = add i64 %stack_len866, 1
  store i64 %696, ptr %len.addr, align 8
  %contract.call_value.addr867 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value868 = load i256, ptr %contract.call_value.addr867, align 16
  %sp869 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len866
  store i256 %contract.call_value868, ptr %sp869, align 16
  br label %OP251.ISZERO, !annotation !5

OP251.ISZERO:                                     ; preds = %OP250.CALLVALUE
  %stack_len870 = load i64, ptr %len.addr, align 8
  %697 = add i64 %stack_len870, -1
  %sp871 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %697
  %a872 = load i256, ptr %sp871, align 16
  %698 = icmp eq i256 %a872, 0
  %699 = zext i1 %698 to i256
  %700 = add i64 %stack_len870, -1
  %sp873 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %700
  store i256 %699, ptr %sp873, align 16
  br label %OP252.PUSH2, !annotation !5

OP252.PUSH2:                                      ; preds = %OP251.ISZERO
  br label %OP253.JUMPI, !annotation !6

OP253.JUMPI:                                      ; preds = %OP252.PUSH2
  %stack_len874 = load i64, ptr %len.addr, align 8
  %701 = add i64 %stack_len874, -1
  store i64 %701, ptr %len.addr, align 8
  %702 = add i64 %stack_len874, -1
  %sp875 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %702
  %a876 = load i256, ptr %sp875, align 16
  %703 = icmp ne i256 %a876, 0
  br i1 %703, label %OP257.JUMPDEST, label %OP254.PUSH1

OP254.PUSH1:                                      ; preds = %OP253.JUMPI
  %gas.remaining877 = load i64, ptr %gas.remaining.addr, align 8
  %704 = sub i64 %gas.remaining877, 6
  %705 = icmp ult i64 %gas.remaining877, 6
  store i64 %704, ptr %gas.remaining.addr, align 8
  br i1 %705, label %return, label %OP254.PUSH1.contd, !prof !2, !annotation !3

OP254.PUSH1.contd:                                ; preds = %OP254.PUSH1
  %stack_len878 = load i64, ptr %len.addr, align 8
  %706 = icmp ugt i64 %stack_len878, 1022
  br i1 %706, label %return, label %OP254.PUSH1.contd879, !prof !2, !annotation !4

OP254.PUSH1.contd879:                             ; preds = %OP254.PUSH1.contd
  %707 = add i64 %stack_len878, 1
  store i64 %707, ptr %len.addr, align 8
  %sp880 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len878
  store i256 0, ptr %sp880, align 16
  br label %OP255.DUP1, !annotation !5

OP255.DUP1:                                       ; preds = %OP254.PUSH1.contd879
  %stack_len881 = load i64, ptr %len.addr, align 8
  %708 = add i64 %stack_len881, 1
  store i64 %708, ptr %len.addr, align 8
  %709 = sub i64 %stack_len881, 1
  %sp882 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %709
  %dup1883 = load i256, ptr %sp882, align 16
  %sp884 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len881
  store i256 %dup1883, ptr %sp884, align 16
  br label %OP256.REVERT, !annotation !5

OP256.REVERT:                                     ; preds = %OP255.DUP1
  %stack_len885 = load i64, ptr %len.addr, align 8
  %710 = add i64 %stack_len885, -2
  store i64 %710, ptr %len.addr, align 8
  %711 = sub i64 %stack_len885, 2
  %sp886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %711
  %712 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp886, i8 16)
  %713 = icmp ne i8 %712, 0
  br i1 %713, label %return, label %OP256.REVERT.contd, !prof !2

OP256.REVERT.contd:                               ; preds = %OP256.REVERT
  br label %return, !annotation !8

OP257.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP253.JUMPI
  %gas.remaining887 = load i64, ptr %gas.remaining.addr, align 8
  %714 = sub i64 %gas.remaining887, 15
  %715 = icmp ult i64 %gas.remaining887, 15
  store i64 %714, ptr %gas.remaining.addr, align 8
  br i1 %715, label %return, label %OP257.JUMPDEST.contd, !prof !2, !annotation !3

OP257.JUMPDEST.contd:                             ; preds = %OP257.JUMPDEST
  %stack_len888 = load i64, ptr %len.addr, align 8
  %716 = icmp ugt i64 %stack_len888, 1022
  br i1 %716, label %return, label %OP257.JUMPDEST.contd889, !prof !2, !annotation !4

OP257.JUMPDEST.contd889:                          ; preds = %OP257.JUMPDEST.contd
  br label %OP258.PUSH2, !annotation !5

OP258.PUSH2:                                      ; preds = %OP257.JUMPDEST.contd889
  %stack_len890 = load i64, ptr %len.addr, align 8
  %717 = add i64 %stack_len890, 1
  store i64 %717, ptr %len.addr, align 8
  %sp891 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len890
  store i256 436, ptr %sp891, align 16
  br label %OP259.PUSH2, !annotation !5

OP259.PUSH2:                                      ; preds = %OP258.PUSH2
  br label %OP260.JUMP, !annotation !6

OP260.JUMP:                                       ; preds = %OP259.PUSH2
  %stack_len892 = load i64, ptr %len.addr, align 8
  br label %OP942.JUMPDEST

OP261.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining893 = load i64, ptr %gas.remaining.addr, align 8
  %718 = sub i64 %gas.remaining893, 50
  %719 = icmp ult i64 %gas.remaining893, 50
  store i64 %718, ptr %gas.remaining.addr, align 8
  br i1 %719, label %return, label %OP261.JUMPDEST.contd, !prof !2, !annotation !3

OP261.JUMPDEST.contd:                             ; preds = %OP261.JUMPDEST
  %stack_len894 = load i64, ptr %len.addr, align 8
  %720 = icmp ult i64 %stack_len894, 1
  %721 = icmp ugt i64 %stack_len894, 1020
  %722 = or i1 %720, %721
  %723 = select i1 %720, i8 91, i8 92
  br i1 %722, label %return, label %OP261.JUMPDEST.contd895, !prof !2

OP261.JUMPDEST.contd895:                          ; preds = %OP261.JUMPDEST.contd
  br label %OP262.PUSH1, !annotation !5

OP262.PUSH1:                                      ; preds = %OP261.JUMPDEST.contd895
  %stack_len896 = load i64, ptr %len.addr, align 8
  %724 = add i64 %stack_len896, 1
  store i64 %724, ptr %len.addr, align 8
  %sp897 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len896
  store i256 64, ptr %sp897, align 16
  br label %OP263.MLOAD, !annotation !5

OP263.MLOAD:                                      ; preds = %OP262.PUSH1
  %stack_len898 = load i64, ptr %len.addr, align 8
  %725 = add i64 %stack_len898, -1
  %sp899 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %725
  %a900 = load i256, ptr %sp899, align 16
  %mload.out.slot901 = alloca i256, align 16
  %726 = call i8 @__revmc_ir_builtin_mload(i256 %a900, ptr %mload.out.slot901, ptr %arg.ecx.addr)
  %727 = icmp ne i8 %726, 0
  br i1 %727, label %return, label %OP263.MLOAD.contd, !prof !2

OP263.MLOAD.contd:                                ; preds = %OP263.MLOAD
  %mload.out902 = load i256, ptr %mload.out.slot901, align 16
  %728 = add i64 %stack_len898, -1
  %sp903 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %728
  store i256 %mload.out902, ptr %sp903, align 16
  br label %OP264.DUP1, !annotation !5

OP264.DUP1:                                       ; preds = %OP263.MLOAD.contd
  %stack_len904 = load i64, ptr %len.addr, align 8
  %729 = add i64 %stack_len904, 1
  store i64 %729, ptr %len.addr, align 8
  %730 = sub i64 %stack_len904, 1
  %sp905 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %730
  %dup1906 = load i256, ptr %sp905, align 16
  %sp907 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len904
  store i256 %dup1906, ptr %sp907, align 16
  br label %OP265.DUP3, !annotation !5

OP265.DUP3:                                       ; preds = %OP264.DUP1
  %stack_len908 = load i64, ptr %len.addr, align 8
  %731 = add i64 %stack_len908, 1
  store i64 %731, ptr %len.addr, align 8
  %732 = sub i64 %stack_len908, 3
  %sp909 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %732
  %dup3910 = load i256, ptr %sp909, align 16
  %sp911 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len908
  store i256 %dup3910, ptr %sp911, align 16
  br label %OP266.DUP2, !annotation !5

OP266.DUP2:                                       ; preds = %OP265.DUP3
  %stack_len912 = load i64, ptr %len.addr, align 8
  %733 = add i64 %stack_len912, 1
  store i64 %733, ptr %len.addr, align 8
  %734 = sub i64 %stack_len912, 2
  %sp913 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %734
  %dup2914 = load i256, ptr %sp913, align 16
  %sp915 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len912
  store i256 %dup2914, ptr %sp915, align 16
  br label %OP267.MSTORE, !annotation !5

OP267.MSTORE:                                     ; preds = %OP266.DUP2
  %stack_len916 = load i64, ptr %len.addr, align 8
  %735 = add i64 %stack_len916, -2
  store i64 %735, ptr %len.addr, align 8
  %736 = add i64 %stack_len916, -1
  %sp917 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %736
  %a918 = load i256, ptr %sp917, align 16
  %737 = add i64 %stack_len916, -2
  %sp919 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %737
  %b920 = load i256, ptr %sp919, align 16
  %738 = call i8 @__revmc_ir_builtin_mstore(i256 %a918, i256 %b920, ptr %arg.ecx.addr)
  %739 = icmp ne i8 %738, 0
  br i1 %739, label %return, label %OP267.MSTORE.contd, !prof !2

OP267.MSTORE.contd:                               ; preds = %OP267.MSTORE
  br label %OP268.PUSH1, !annotation !5

OP268.PUSH1:                                      ; preds = %OP267.MSTORE.contd
  %stack_len921 = load i64, ptr %len.addr, align 8
  %740 = add i64 %stack_len921, 1
  store i64 %740, ptr %len.addr, align 8
  %sp922 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len921
  store i256 32, ptr %sp922, align 16
  br label %OP269.ADD, !annotation !5

OP269.ADD:                                        ; preds = %OP268.PUSH1
  %stack_len923 = load i64, ptr %len.addr, align 8
  %741 = add i64 %stack_len923, -1
  store i64 %741, ptr %len.addr, align 8
  %742 = add i64 %stack_len923, -1
  %sp924 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %742
  %a925 = load i256, ptr %sp924, align 16
  %743 = add i64 %stack_len923, -2
  %sp926 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %743
  %b927 = load i256, ptr %sp926, align 16
  %744 = add i256 %a925, %b927
  %745 = add i64 %stack_len923, -2
  %sp928 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %745
  store i256 %744, ptr %sp928, align 16
  br label %OP270.SWAP2, !annotation !5

OP270.SWAP2:                                      ; preds = %OP269.ADD
  %stack_len929 = load i64, ptr %len.addr, align 8
  %746 = sub i64 %stack_len929, 1
  %sp930 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %746
  %swap.a931 = load i256, ptr %sp930, align 16
  %747 = sub i64 %stack_len929, 3
  %sp932 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %747
  %swap.b933 = load i256, ptr %sp932, align 16
  store i256 %swap.a931, ptr %sp932, align 16
  store i256 %swap.b933, ptr %sp930, align 16
  br label %OP271.POP, !annotation !5

OP271.POP:                                        ; preds = %OP270.SWAP2
  %stack_len934 = load i64, ptr %len.addr, align 8
  %748 = add i64 %stack_len934, -1
  store i64 %748, ptr %len.addr, align 8
  br label %OP272.POP, !annotation !5

OP272.POP:                                        ; preds = %OP271.POP
  %stack_len935 = load i64, ptr %len.addr, align 8
  %749 = add i64 %stack_len935, -1
  store i64 %749, ptr %len.addr, align 8
  br label %OP273.PUSH1, !annotation !5

OP273.PUSH1:                                      ; preds = %OP272.POP
  %stack_len936 = load i64, ptr %len.addr, align 8
  %750 = add i64 %stack_len936, 1
  store i64 %750, ptr %len.addr, align 8
  %sp937 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len936
  store i256 64, ptr %sp937, align 16
  br label %OP274.MLOAD, !annotation !5

OP274.MLOAD:                                      ; preds = %OP273.PUSH1
  %stack_len938 = load i64, ptr %len.addr, align 8
  %751 = add i64 %stack_len938, -1
  %sp939 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %751
  %a940 = load i256, ptr %sp939, align 16
  %mload.out.slot941 = alloca i256, align 16
  %752 = call i8 @__revmc_ir_builtin_mload(i256 %a940, ptr %mload.out.slot941, ptr %arg.ecx.addr)
  %753 = icmp ne i8 %752, 0
  br i1 %753, label %return, label %OP274.MLOAD.contd, !prof !2

OP274.MLOAD.contd:                                ; preds = %OP274.MLOAD
  %mload.out942 = load i256, ptr %mload.out.slot941, align 16
  %754 = add i64 %stack_len938, -1
  %sp943 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %754
  store i256 %mload.out942, ptr %sp943, align 16
  br label %OP275.DUP1, !annotation !5

OP275.DUP1:                                       ; preds = %OP274.MLOAD.contd
  %stack_len944 = load i64, ptr %len.addr, align 8
  %755 = add i64 %stack_len944, 1
  store i64 %755, ptr %len.addr, align 8
  %756 = sub i64 %stack_len944, 1
  %sp945 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %756
  %dup1946 = load i256, ptr %sp945, align 16
  %sp947 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len944
  store i256 %dup1946, ptr %sp947, align 16
  br label %OP276.SWAP2, !annotation !5

OP276.SWAP2:                                      ; preds = %OP275.DUP1
  %stack_len948 = load i64, ptr %len.addr, align 8
  %757 = sub i64 %stack_len948, 1
  %sp949 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %757
  %swap.a950 = load i256, ptr %sp949, align 16
  %758 = sub i64 %stack_len948, 3
  %sp951 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %758
  %swap.b952 = load i256, ptr %sp951, align 16
  store i256 %swap.a950, ptr %sp951, align 16
  store i256 %swap.b952, ptr %sp949, align 16
  br label %OP277.SUB, !annotation !5

OP277.SUB:                                        ; preds = %OP276.SWAP2
  %stack_len953 = load i64, ptr %len.addr, align 8
  %759 = add i64 %stack_len953, -1
  store i64 %759, ptr %len.addr, align 8
  %760 = add i64 %stack_len953, -1
  %sp954 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %760
  %a955 = load i256, ptr %sp954, align 16
  %761 = add i64 %stack_len953, -2
  %sp956 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %761
  %b957 = load i256, ptr %sp956, align 16
  %762 = sub i256 %a955, %b957
  %763 = add i64 %stack_len953, -2
  %sp958 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %763
  store i256 %762, ptr %sp958, align 16
  br label %OP278.SWAP1, !annotation !5

OP278.SWAP1:                                      ; preds = %OP277.SUB
  %stack_len959 = load i64, ptr %len.addr, align 8
  %764 = sub i64 %stack_len959, 1
  %sp960 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %764
  %swap.a961 = load i256, ptr %sp960, align 16
  %765 = sub i64 %stack_len959, 2
  %sp962 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %765
  %swap.b963 = load i256, ptr %sp962, align 16
  store i256 %swap.a961, ptr %sp962, align 16
  store i256 %swap.b963, ptr %sp960, align 16
  br label %OP279.RETURN, !annotation !5

OP279.RETURN:                                     ; preds = %OP278.SWAP1
  %stack_len964 = load i64, ptr %len.addr, align 8
  %766 = add i64 %stack_len964, -2
  store i64 %766, ptr %len.addr, align 8
  %767 = sub i64 %stack_len964, 2
  %sp965 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %767
  %768 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp965, i8 2)
  %769 = icmp ne i8 %768, 0
  br i1 %769, label %return, label %OP279.RETURN.contd, !prof !2

OP279.RETURN.contd:                               ; preds = %OP279.RETURN
  br label %return, !annotation !10

OP280.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP34.JUMPI
  %gas.remaining966 = load i64, ptr %gas.remaining.addr, align 8
  %770 = sub i64 %gas.remaining966, 19
  %771 = icmp ult i64 %gas.remaining966, 19
  store i64 %770, ptr %gas.remaining.addr, align 8
  br i1 %771, label %return, label %OP280.JUMPDEST.contd, !prof !2, !annotation !3

OP280.JUMPDEST.contd:                             ; preds = %OP280.JUMPDEST
  %stack_len967 = load i64, ptr %len.addr, align 8
  %772 = icmp ugt i64 %stack_len967, 1022
  br i1 %772, label %return, label %OP280.JUMPDEST.contd968, !prof !2, !annotation !4

OP280.JUMPDEST.contd968:                          ; preds = %OP280.JUMPDEST.contd
  br label %OP281.CALLVALUE, !annotation !5

OP281.CALLVALUE:                                  ; preds = %OP280.JUMPDEST.contd968
  %stack_len969 = load i64, ptr %len.addr, align 8
  %773 = add i64 %stack_len969, 1
  store i64 %773, ptr %len.addr, align 8
  %contract.call_value.addr970 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value971 = load i256, ptr %contract.call_value.addr970, align 16
  %sp972 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len969
  store i256 %contract.call_value971, ptr %sp972, align 16
  br label %OP282.ISZERO, !annotation !5

OP282.ISZERO:                                     ; preds = %OP281.CALLVALUE
  %stack_len973 = load i64, ptr %len.addr, align 8
  %774 = add i64 %stack_len973, -1
  %sp974 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %774
  %a975 = load i256, ptr %sp974, align 16
  %775 = icmp eq i256 %a975, 0
  %776 = zext i1 %775 to i256
  %777 = add i64 %stack_len973, -1
  %sp976 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %777
  store i256 %776, ptr %sp976, align 16
  br label %OP283.PUSH2, !annotation !5

OP283.PUSH2:                                      ; preds = %OP282.ISZERO
  br label %OP284.JUMPI, !annotation !6

OP284.JUMPI:                                      ; preds = %OP283.PUSH2
  %stack_len977 = load i64, ptr %len.addr, align 8
  %778 = add i64 %stack_len977, -1
  store i64 %778, ptr %len.addr, align 8
  %779 = add i64 %stack_len977, -1
  %sp978 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %779
  %a979 = load i256, ptr %sp978, align 16
  %780 = icmp ne i256 %a979, 0
  br i1 %780, label %OP288.JUMPDEST, label %OP285.PUSH1

OP285.PUSH1:                                      ; preds = %OP284.JUMPI
  %gas.remaining980 = load i64, ptr %gas.remaining.addr, align 8
  %781 = sub i64 %gas.remaining980, 6
  %782 = icmp ult i64 %gas.remaining980, 6
  store i64 %781, ptr %gas.remaining.addr, align 8
  br i1 %782, label %return, label %OP285.PUSH1.contd, !prof !2, !annotation !3

OP285.PUSH1.contd:                                ; preds = %OP285.PUSH1
  %stack_len981 = load i64, ptr %len.addr, align 8
  %783 = icmp ugt i64 %stack_len981, 1022
  br i1 %783, label %return, label %OP285.PUSH1.contd982, !prof !2, !annotation !4

OP285.PUSH1.contd982:                             ; preds = %OP285.PUSH1.contd
  %784 = add i64 %stack_len981, 1
  store i64 %784, ptr %len.addr, align 8
  %sp983 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len981
  store i256 0, ptr %sp983, align 16
  br label %OP286.DUP1, !annotation !5

OP286.DUP1:                                       ; preds = %OP285.PUSH1.contd982
  %stack_len984 = load i64, ptr %len.addr, align 8
  %785 = add i64 %stack_len984, 1
  store i64 %785, ptr %len.addr, align 8
  %786 = sub i64 %stack_len984, 1
  %sp985 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %786
  %dup1986 = load i256, ptr %sp985, align 16
  %sp987 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len984
  store i256 %dup1986, ptr %sp987, align 16
  br label %OP287.REVERT, !annotation !5

OP287.REVERT:                                     ; preds = %OP286.DUP1
  %stack_len988 = load i64, ptr %len.addr, align 8
  %787 = add i64 %stack_len988, -2
  store i64 %787, ptr %len.addr, align 8
  %788 = sub i64 %stack_len988, 2
  %sp989 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %788
  %789 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp989, i8 16)
  %790 = icmp ne i8 %789, 0
  br i1 %790, label %return, label %OP287.REVERT.contd, !prof !2

OP287.REVERT.contd:                               ; preds = %OP287.REVERT
  br label %return, !annotation !8

OP288.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP284.JUMPI
  %gas.remaining990 = load i64, ptr %gas.remaining.addr, align 8
  %791 = sub i64 %gas.remaining990, 109
  %792 = icmp ult i64 %gas.remaining990, 109
  store i64 %791, ptr %gas.remaining.addr, align 8
  br i1 %792, label %return, label %OP288.JUMPDEST.contd, !prof !2, !annotation !3

OP288.JUMPDEST.contd:                             ; preds = %OP288.JUMPDEST
  %stack_len991 = load i64, ptr %len.addr, align 8
  %793 = icmp ugt i64 %stack_len991, 1017
  br i1 %793, label %return, label %OP288.JUMPDEST.contd992, !prof !2, !annotation !4

OP288.JUMPDEST.contd992:                          ; preds = %OP288.JUMPDEST.contd
  br label %OP289.PUSH2, !annotation !5

OP289.PUSH2:                                      ; preds = %OP288.JUMPDEST.contd992
  %stack_len993 = load i64, ptr %len.addr, align 8
  %794 = add i64 %stack_len993, 1
  store i64 %794, ptr %len.addr, align 8
  %sp994 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len993
  store i256 553, ptr %sp994, align 16
  br label %OP290.PUSH1, !annotation !5

OP290.PUSH1:                                      ; preds = %OP289.PUSH2
  %stack_len995 = load i64, ptr %len.addr, align 8
  %795 = add i64 %stack_len995, 1
  store i64 %795, ptr %len.addr, align 8
  %sp996 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len995
  store i256 4, ptr %sp996, align 16
  br label %OP291.DUP1, !annotation !5

OP291.DUP1:                                       ; preds = %OP290.PUSH1
  %stack_len997 = load i64, ptr %len.addr, align 8
  %796 = add i64 %stack_len997, 1
  store i64 %796, ptr %len.addr, align 8
  %797 = sub i64 %stack_len997, 1
  %sp998 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %797
  %dup1999 = load i256, ptr %sp998, align 16
  %sp1000 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len997
  store i256 %dup1999, ptr %sp1000, align 16
  br label %OP292.DUP1, !annotation !5

OP292.DUP1:                                       ; preds = %OP291.DUP1
  %stack_len1001 = load i64, ptr %len.addr, align 8
  %798 = add i64 %stack_len1001, 1
  store i64 %798, ptr %len.addr, align 8
  %799 = sub i64 %stack_len1001, 1
  %sp1002 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %799
  %dup11003 = load i256, ptr %sp1002, align 16
  %sp1004 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1001
  store i256 %dup11003, ptr %sp1004, align 16
  br label %OP293.CALLDATALOAD, !annotation !5

OP293.CALLDATALOAD:                               ; preds = %OP292.DUP1
  %stack_len1005 = load i64, ptr %len.addr, align 8
  %800 = add i64 %stack_len1005, -1
  %sp1006 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %800
  %a1007 = load i256, ptr %sp1006, align 16
  %801 = call i256 @__revmc_ir_builtin_calldataload(i256 %a1007, ptr %arg.contract.addr)
  %802 = add i64 %stack_len1005, -1
  %sp1008 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %802
  store i256 %801, ptr %sp1008, align 16
  br label %OP294.PUSH20, !annotation !5

OP294.PUSH20:                                     ; preds = %OP293.CALLDATALOAD
  %stack_len1009 = load i64, ptr %len.addr, align 8
  %803 = add i64 %stack_len1009, 1
  store i64 %803, ptr %len.addr, align 8
  %sp1010 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1009
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp1010, align 16
  br label %OP295.AND, !annotation !5

OP295.AND:                                        ; preds = %OP294.PUSH20
  %stack_len1011 = load i64, ptr %len.addr, align 8
  %804 = add i64 %stack_len1011, -1
  store i64 %804, ptr %len.addr, align 8
  %805 = add i64 %stack_len1011, -1
  %sp1012 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %805
  %a1013 = load i256, ptr %sp1012, align 16
  %806 = add i64 %stack_len1011, -2
  %sp1014 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %806
  %b1015 = load i256, ptr %sp1014, align 16
  %807 = and i256 %a1013, %b1015
  %808 = add i64 %stack_len1011, -2
  %sp1016 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %808
  store i256 %807, ptr %sp1016, align 16
  br label %OP296.SWAP1, !annotation !5

OP296.SWAP1:                                      ; preds = %OP295.AND
  %stack_len1017 = load i64, ptr %len.addr, align 8
  %809 = sub i64 %stack_len1017, 1
  %sp1018 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %809
  %swap.a1019 = load i256, ptr %sp1018, align 16
  %810 = sub i64 %stack_len1017, 2
  %sp1020 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %810
  %swap.b1021 = load i256, ptr %sp1020, align 16
  store i256 %swap.a1019, ptr %sp1020, align 16
  store i256 %swap.b1021, ptr %sp1018, align 16
  br label %OP297.PUSH1, !annotation !5

OP297.PUSH1:                                      ; preds = %OP296.SWAP1
  %stack_len1022 = load i64, ptr %len.addr, align 8
  %811 = add i64 %stack_len1022, 1
  store i64 %811, ptr %len.addr, align 8
  %sp1023 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1022
  store i256 32, ptr %sp1023, align 16
  br label %OP298.ADD, !annotation !5

OP298.ADD:                                        ; preds = %OP297.PUSH1
  %stack_len1024 = load i64, ptr %len.addr, align 8
  %812 = add i64 %stack_len1024, -1
  store i64 %812, ptr %len.addr, align 8
  %813 = add i64 %stack_len1024, -1
  %sp1025 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %813
  %a1026 = load i256, ptr %sp1025, align 16
  %814 = add i64 %stack_len1024, -2
  %sp1027 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %814
  %b1028 = load i256, ptr %sp1027, align 16
  %815 = add i256 %a1026, %b1028
  %816 = add i64 %stack_len1024, -2
  %sp1029 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %816
  store i256 %815, ptr %sp1029, align 16
  br label %OP299.SWAP1, !annotation !5

OP299.SWAP1:                                      ; preds = %OP298.ADD
  %stack_len1030 = load i64, ptr %len.addr, align 8
  %817 = sub i64 %stack_len1030, 1
  %sp1031 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %817
  %swap.a1032 = load i256, ptr %sp1031, align 16
  %818 = sub i64 %stack_len1030, 2
  %sp1033 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %818
  %swap.b1034 = load i256, ptr %sp1033, align 16
  store i256 %swap.a1032, ptr %sp1033, align 16
  store i256 %swap.b1034, ptr %sp1031, align 16
  br label %OP300.SWAP2, !annotation !5

OP300.SWAP2:                                      ; preds = %OP299.SWAP1
  %stack_len1035 = load i64, ptr %len.addr, align 8
  %819 = sub i64 %stack_len1035, 1
  %sp1036 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %819
  %swap.a1037 = load i256, ptr %sp1036, align 16
  %820 = sub i64 %stack_len1035, 3
  %sp1038 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %820
  %swap.b1039 = load i256, ptr %sp1038, align 16
  store i256 %swap.a1037, ptr %sp1038, align 16
  store i256 %swap.b1039, ptr %sp1036, align 16
  br label %OP301.SWAP1, !annotation !5

OP301.SWAP1:                                      ; preds = %OP300.SWAP2
  %stack_len1040 = load i64, ptr %len.addr, align 8
  %821 = sub i64 %stack_len1040, 1
  %sp1041 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %821
  %swap.a1042 = load i256, ptr %sp1041, align 16
  %822 = sub i64 %stack_len1040, 2
  %sp1043 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %822
  %swap.b1044 = load i256, ptr %sp1043, align 16
  store i256 %swap.a1042, ptr %sp1043, align 16
  store i256 %swap.b1044, ptr %sp1041, align 16
  br label %OP302.DUP1, !annotation !5

OP302.DUP1:                                       ; preds = %OP301.SWAP1
  %stack_len1045 = load i64, ptr %len.addr, align 8
  %823 = add i64 %stack_len1045, 1
  store i64 %823, ptr %len.addr, align 8
  %824 = sub i64 %stack_len1045, 1
  %sp1046 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %824
  %dup11047 = load i256, ptr %sp1046, align 16
  %sp1048 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1045
  store i256 %dup11047, ptr %sp1048, align 16
  br label %OP303.CALLDATALOAD, !annotation !5

OP303.CALLDATALOAD:                               ; preds = %OP302.DUP1
  %stack_len1049 = load i64, ptr %len.addr, align 8
  %825 = add i64 %stack_len1049, -1
  %sp1050 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %825
  %a1051 = load i256, ptr %sp1050, align 16
  %826 = call i256 @__revmc_ir_builtin_calldataload(i256 %a1051, ptr %arg.contract.addr)
  %827 = add i64 %stack_len1049, -1
  %sp1052 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %827
  store i256 %826, ptr %sp1052, align 16
  br label %OP304.PUSH20, !annotation !5

OP304.PUSH20:                                     ; preds = %OP303.CALLDATALOAD
  %stack_len1053 = load i64, ptr %len.addr, align 8
  %828 = add i64 %stack_len1053, 1
  store i64 %828, ptr %len.addr, align 8
  %sp1054 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1053
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp1054, align 16
  br label %OP305.AND, !annotation !5

OP305.AND:                                        ; preds = %OP304.PUSH20
  %stack_len1055 = load i64, ptr %len.addr, align 8
  %829 = add i64 %stack_len1055, -1
  store i64 %829, ptr %len.addr, align 8
  %830 = add i64 %stack_len1055, -1
  %sp1056 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %830
  %a1057 = load i256, ptr %sp1056, align 16
  %831 = add i64 %stack_len1055, -2
  %sp1058 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %831
  %b1059 = load i256, ptr %sp1058, align 16
  %832 = and i256 %a1057, %b1059
  %833 = add i64 %stack_len1055, -2
  %sp1060 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %833
  store i256 %832, ptr %sp1060, align 16
  br label %OP306.SWAP1, !annotation !5

OP306.SWAP1:                                      ; preds = %OP305.AND
  %stack_len1061 = load i64, ptr %len.addr, align 8
  %834 = sub i64 %stack_len1061, 1
  %sp1062 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %834
  %swap.a1063 = load i256, ptr %sp1062, align 16
  %835 = sub i64 %stack_len1061, 2
  %sp1064 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %835
  %swap.b1065 = load i256, ptr %sp1064, align 16
  store i256 %swap.a1063, ptr %sp1064, align 16
  store i256 %swap.b1065, ptr %sp1062, align 16
  br label %OP307.PUSH1, !annotation !5

OP307.PUSH1:                                      ; preds = %OP306.SWAP1
  %stack_len1066 = load i64, ptr %len.addr, align 8
  %836 = add i64 %stack_len1066, 1
  store i64 %836, ptr %len.addr, align 8
  %sp1067 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1066
  store i256 32, ptr %sp1067, align 16
  br label %OP308.ADD, !annotation !5

OP308.ADD:                                        ; preds = %OP307.PUSH1
  %stack_len1068 = load i64, ptr %len.addr, align 8
  %837 = add i64 %stack_len1068, -1
  store i64 %837, ptr %len.addr, align 8
  %838 = add i64 %stack_len1068, -1
  %sp1069 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %838
  %a1070 = load i256, ptr %sp1069, align 16
  %839 = add i64 %stack_len1068, -2
  %sp1071 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %839
  %b1072 = load i256, ptr %sp1071, align 16
  %840 = add i256 %a1070, %b1072
  %841 = add i64 %stack_len1068, -2
  %sp1073 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %841
  store i256 %840, ptr %sp1073, align 16
  br label %OP309.SWAP1, !annotation !5

OP309.SWAP1:                                      ; preds = %OP308.ADD
  %stack_len1074 = load i64, ptr %len.addr, align 8
  %842 = sub i64 %stack_len1074, 1
  %sp1075 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %842
  %swap.a1076 = load i256, ptr %sp1075, align 16
  %843 = sub i64 %stack_len1074, 2
  %sp1077 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %843
  %swap.b1078 = load i256, ptr %sp1077, align 16
  store i256 %swap.a1076, ptr %sp1077, align 16
  store i256 %swap.b1078, ptr %sp1075, align 16
  br label %OP310.SWAP2, !annotation !5

OP310.SWAP2:                                      ; preds = %OP309.SWAP1
  %stack_len1079 = load i64, ptr %len.addr, align 8
  %844 = sub i64 %stack_len1079, 1
  %sp1080 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %844
  %swap.a1081 = load i256, ptr %sp1080, align 16
  %845 = sub i64 %stack_len1079, 3
  %sp1082 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %845
  %swap.b1083 = load i256, ptr %sp1082, align 16
  store i256 %swap.a1081, ptr %sp1082, align 16
  store i256 %swap.b1083, ptr %sp1080, align 16
  br label %OP311.SWAP1, !annotation !5

OP311.SWAP1:                                      ; preds = %OP310.SWAP2
  %stack_len1084 = load i64, ptr %len.addr, align 8
  %846 = sub i64 %stack_len1084, 1
  %sp1085 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %846
  %swap.a1086 = load i256, ptr %sp1085, align 16
  %847 = sub i64 %stack_len1084, 2
  %sp1087 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %847
  %swap.b1088 = load i256, ptr %sp1087, align 16
  store i256 %swap.a1086, ptr %sp1087, align 16
  store i256 %swap.b1088, ptr %sp1085, align 16
  br label %OP312.DUP1, !annotation !5

OP312.DUP1:                                       ; preds = %OP311.SWAP1
  %stack_len1089 = load i64, ptr %len.addr, align 8
  %848 = add i64 %stack_len1089, 1
  store i64 %848, ptr %len.addr, align 8
  %849 = sub i64 %stack_len1089, 1
  %sp1090 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %849
  %dup11091 = load i256, ptr %sp1090, align 16
  %sp1092 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1089
  store i256 %dup11091, ptr %sp1092, align 16
  br label %OP313.CALLDATALOAD, !annotation !5

OP313.CALLDATALOAD:                               ; preds = %OP312.DUP1
  %stack_len1093 = load i64, ptr %len.addr, align 8
  %850 = add i64 %stack_len1093, -1
  %sp1094 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %850
  %a1095 = load i256, ptr %sp1094, align 16
  %851 = call i256 @__revmc_ir_builtin_calldataload(i256 %a1095, ptr %arg.contract.addr)
  %852 = add i64 %stack_len1093, -1
  %sp1096 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %852
  store i256 %851, ptr %sp1096, align 16
  br label %OP314.SWAP1, !annotation !5

OP314.SWAP1:                                      ; preds = %OP313.CALLDATALOAD
  %stack_len1097 = load i64, ptr %len.addr, align 8
  %853 = sub i64 %stack_len1097, 1
  %sp1098 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %853
  %swap.a1099 = load i256, ptr %sp1098, align 16
  %854 = sub i64 %stack_len1097, 2
  %sp1100 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %854
  %swap.b1101 = load i256, ptr %sp1100, align 16
  store i256 %swap.a1099, ptr %sp1100, align 16
  store i256 %swap.b1101, ptr %sp1098, align 16
  br label %OP315.PUSH1, !annotation !5

OP315.PUSH1:                                      ; preds = %OP314.SWAP1
  %stack_len1102 = load i64, ptr %len.addr, align 8
  %855 = add i64 %stack_len1102, 1
  store i64 %855, ptr %len.addr, align 8
  %sp1103 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1102
  store i256 32, ptr %sp1103, align 16
  br label %OP316.ADD, !annotation !5

OP316.ADD:                                        ; preds = %OP315.PUSH1
  %stack_len1104 = load i64, ptr %len.addr, align 8
  %856 = add i64 %stack_len1104, -1
  store i64 %856, ptr %len.addr, align 8
  %857 = add i64 %stack_len1104, -1
  %sp1105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %857
  %a1106 = load i256, ptr %sp1105, align 16
  %858 = add i64 %stack_len1104, -2
  %sp1107 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %858
  %b1108 = load i256, ptr %sp1107, align 16
  %859 = add i256 %a1106, %b1108
  %860 = add i64 %stack_len1104, -2
  %sp1109 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %860
  store i256 %859, ptr %sp1109, align 16
  br label %OP317.SWAP1, !annotation !5

OP317.SWAP1:                                      ; preds = %OP316.ADD
  %stack_len1110 = load i64, ptr %len.addr, align 8
  %861 = sub i64 %stack_len1110, 1
  %sp1111 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %861
  %swap.a1112 = load i256, ptr %sp1111, align 16
  %862 = sub i64 %stack_len1110, 2
  %sp1113 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %862
  %swap.b1114 = load i256, ptr %sp1113, align 16
  store i256 %swap.a1112, ptr %sp1113, align 16
  store i256 %swap.b1114, ptr %sp1111, align 16
  br label %OP318.SWAP2, !annotation !5

OP318.SWAP2:                                      ; preds = %OP317.SWAP1
  %stack_len1115 = load i64, ptr %len.addr, align 8
  %863 = sub i64 %stack_len1115, 1
  %sp1116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %863
  %swap.a1117 = load i256, ptr %sp1116, align 16
  %864 = sub i64 %stack_len1115, 3
  %sp1118 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %864
  %swap.b1119 = load i256, ptr %sp1118, align 16
  store i256 %swap.a1117, ptr %sp1118, align 16
  store i256 %swap.b1119, ptr %sp1116, align 16
  br label %OP319.SWAP1, !annotation !5

OP319.SWAP1:                                      ; preds = %OP318.SWAP2
  %stack_len1120 = load i64, ptr %len.addr, align 8
  %865 = sub i64 %stack_len1120, 1
  %sp1121 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %865
  %swap.a1122 = load i256, ptr %sp1121, align 16
  %866 = sub i64 %stack_len1120, 2
  %sp1123 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %866
  %swap.b1124 = load i256, ptr %sp1123, align 16
  store i256 %swap.a1122, ptr %sp1123, align 16
  store i256 %swap.b1124, ptr %sp1121, align 16
  br label %OP320.POP, !annotation !5

OP320.POP:                                        ; preds = %OP319.SWAP1
  %stack_len1125 = load i64, ptr %len.addr, align 8
  %867 = add i64 %stack_len1125, -1
  store i64 %867, ptr %len.addr, align 8
  br label %OP321.POP, !annotation !5

OP321.POP:                                        ; preds = %OP320.POP
  %stack_len1126 = load i64, ptr %len.addr, align 8
  %868 = add i64 %stack_len1126, -1
  store i64 %868, ptr %len.addr, align 8
  br label %OP322.PUSH2, !annotation !5

OP322.PUSH2:                                      ; preds = %OP321.POP
  br label %OP323.JUMP, !annotation !6

OP323.JUMP:                                       ; preds = %OP322.PUSH2
  %stack_len1127 = load i64, ptr %len.addr, align 8
  br label %OP952.JUMPDEST

OP324.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1128 = load i64, ptr %gas.remaining.addr, align 8
  %869 = sub i64 %gas.remaining1128, 62
  %870 = icmp ult i64 %gas.remaining1128, 62
  store i64 %869, ptr %gas.remaining.addr, align 8
  br i1 %870, label %return, label %OP324.JUMPDEST.contd, !prof !2, !annotation !3

OP324.JUMPDEST.contd:                             ; preds = %OP324.JUMPDEST
  %stack_len1129 = load i64, ptr %len.addr, align 8
  %871 = icmp ult i64 %stack_len1129, 1
  %872 = icmp ugt i64 %stack_len1129, 1020
  %873 = or i1 %871, %872
  %874 = select i1 %871, i8 91, i8 92
  br i1 %873, label %return, label %OP324.JUMPDEST.contd1130, !prof !2

OP324.JUMPDEST.contd1130:                         ; preds = %OP324.JUMPDEST.contd
  br label %OP325.PUSH1, !annotation !5

OP325.PUSH1:                                      ; preds = %OP324.JUMPDEST.contd1130
  %stack_len1131 = load i64, ptr %len.addr, align 8
  %875 = add i64 %stack_len1131, 1
  store i64 %875, ptr %len.addr, align 8
  %sp1132 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1131
  store i256 64, ptr %sp1132, align 16
  br label %OP326.MLOAD, !annotation !5

OP326.MLOAD:                                      ; preds = %OP325.PUSH1
  %stack_len1133 = load i64, ptr %len.addr, align 8
  %876 = add i64 %stack_len1133, -1
  %sp1134 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %876
  %a1135 = load i256, ptr %sp1134, align 16
  %mload.out.slot1136 = alloca i256, align 16
  %877 = call i8 @__revmc_ir_builtin_mload(i256 %a1135, ptr %mload.out.slot1136, ptr %arg.ecx.addr)
  %878 = icmp ne i8 %877, 0
  br i1 %878, label %return, label %OP326.MLOAD.contd, !prof !2

OP326.MLOAD.contd:                                ; preds = %OP326.MLOAD
  %mload.out1137 = load i256, ptr %mload.out.slot1136, align 16
  %879 = add i64 %stack_len1133, -1
  %sp1138 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %879
  store i256 %mload.out1137, ptr %sp1138, align 16
  br label %OP327.DUP1, !annotation !5

OP327.DUP1:                                       ; preds = %OP326.MLOAD.contd
  %stack_len1139 = load i64, ptr %len.addr, align 8
  %880 = add i64 %stack_len1139, 1
  store i64 %880, ptr %len.addr, align 8
  %881 = sub i64 %stack_len1139, 1
  %sp1140 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %881
  %dup11141 = load i256, ptr %sp1140, align 16
  %sp1142 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1139
  store i256 %dup11141, ptr %sp1142, align 16
  br label %OP328.DUP3, !annotation !5

OP328.DUP3:                                       ; preds = %OP327.DUP1
  %stack_len1143 = load i64, ptr %len.addr, align 8
  %882 = add i64 %stack_len1143, 1
  store i64 %882, ptr %len.addr, align 8
  %883 = sub i64 %stack_len1143, 3
  %sp1144 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %883
  %dup31145 = load i256, ptr %sp1144, align 16
  %sp1146 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1143
  store i256 %dup31145, ptr %sp1146, align 16
  br label %OP329.ISZERO, !annotation !5

OP329.ISZERO:                                     ; preds = %OP328.DUP3
  %stack_len1147 = load i64, ptr %len.addr, align 8
  %884 = add i64 %stack_len1147, -1
  %sp1148 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %884
  %a1149 = load i256, ptr %sp1148, align 16
  %885 = icmp eq i256 %a1149, 0
  %886 = zext i1 %885 to i256
  %887 = add i64 %stack_len1147, -1
  %sp1150 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %887
  store i256 %886, ptr %sp1150, align 16
  br label %OP330.ISZERO, !annotation !5

OP330.ISZERO:                                     ; preds = %OP329.ISZERO
  %stack_len1151 = load i64, ptr %len.addr, align 8
  %888 = add i64 %stack_len1151, -1
  %sp1152 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %888
  %a1153 = load i256, ptr %sp1152, align 16
  %889 = icmp eq i256 %a1153, 0
  %890 = zext i1 %889 to i256
  %891 = add i64 %stack_len1151, -1
  %sp1154 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %891
  store i256 %890, ptr %sp1154, align 16
  br label %OP331.ISZERO, !annotation !5

OP331.ISZERO:                                     ; preds = %OP330.ISZERO
  %stack_len1155 = load i64, ptr %len.addr, align 8
  %892 = add i64 %stack_len1155, -1
  %sp1156 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %892
  %a1157 = load i256, ptr %sp1156, align 16
  %893 = icmp eq i256 %a1157, 0
  %894 = zext i1 %893 to i256
  %895 = add i64 %stack_len1155, -1
  %sp1158 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %895
  store i256 %894, ptr %sp1158, align 16
  br label %OP332.ISZERO, !annotation !5

OP332.ISZERO:                                     ; preds = %OP331.ISZERO
  %stack_len1159 = load i64, ptr %len.addr, align 8
  %896 = add i64 %stack_len1159, -1
  %sp1160 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %896
  %a1161 = load i256, ptr %sp1160, align 16
  %897 = icmp eq i256 %a1161, 0
  %898 = zext i1 %897 to i256
  %899 = add i64 %stack_len1159, -1
  %sp1162 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %899
  store i256 %898, ptr %sp1162, align 16
  br label %OP333.DUP2, !annotation !5

OP333.DUP2:                                       ; preds = %OP332.ISZERO
  %stack_len1163 = load i64, ptr %len.addr, align 8
  %900 = add i64 %stack_len1163, 1
  store i64 %900, ptr %len.addr, align 8
  %901 = sub i64 %stack_len1163, 2
  %sp1164 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %901
  %dup21165 = load i256, ptr %sp1164, align 16
  %sp1166 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1163
  store i256 %dup21165, ptr %sp1166, align 16
  br label %OP334.MSTORE, !annotation !5

OP334.MSTORE:                                     ; preds = %OP333.DUP2
  %stack_len1167 = load i64, ptr %len.addr, align 8
  %902 = add i64 %stack_len1167, -2
  store i64 %902, ptr %len.addr, align 8
  %903 = add i64 %stack_len1167, -1
  %sp1168 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %903
  %a1169 = load i256, ptr %sp1168, align 16
  %904 = add i64 %stack_len1167, -2
  %sp1170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %904
  %b1171 = load i256, ptr %sp1170, align 16
  %905 = call i8 @__revmc_ir_builtin_mstore(i256 %a1169, i256 %b1171, ptr %arg.ecx.addr)
  %906 = icmp ne i8 %905, 0
  br i1 %906, label %return, label %OP334.MSTORE.contd, !prof !2

OP334.MSTORE.contd:                               ; preds = %OP334.MSTORE
  br label %OP335.PUSH1, !annotation !5

OP335.PUSH1:                                      ; preds = %OP334.MSTORE.contd
  %stack_len1172 = load i64, ptr %len.addr, align 8
  %907 = add i64 %stack_len1172, 1
  store i64 %907, ptr %len.addr, align 8
  %sp1173 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1172
  store i256 32, ptr %sp1173, align 16
  br label %OP336.ADD, !annotation !5

OP336.ADD:                                        ; preds = %OP335.PUSH1
  %stack_len1174 = load i64, ptr %len.addr, align 8
  %908 = add i64 %stack_len1174, -1
  store i64 %908, ptr %len.addr, align 8
  %909 = add i64 %stack_len1174, -1
  %sp1175 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %909
  %a1176 = load i256, ptr %sp1175, align 16
  %910 = add i64 %stack_len1174, -2
  %sp1177 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %910
  %b1178 = load i256, ptr %sp1177, align 16
  %911 = add i256 %a1176, %b1178
  %912 = add i64 %stack_len1174, -2
  %sp1179 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %912
  store i256 %911, ptr %sp1179, align 16
  br label %OP337.SWAP2, !annotation !5

OP337.SWAP2:                                      ; preds = %OP336.ADD
  %stack_len1180 = load i64, ptr %len.addr, align 8
  %913 = sub i64 %stack_len1180, 1
  %sp1181 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %913
  %swap.a1182 = load i256, ptr %sp1181, align 16
  %914 = sub i64 %stack_len1180, 3
  %sp1183 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %914
  %swap.b1184 = load i256, ptr %sp1183, align 16
  store i256 %swap.a1182, ptr %sp1183, align 16
  store i256 %swap.b1184, ptr %sp1181, align 16
  br label %OP338.POP, !annotation !5

OP338.POP:                                        ; preds = %OP337.SWAP2
  %stack_len1185 = load i64, ptr %len.addr, align 8
  %915 = add i64 %stack_len1185, -1
  store i64 %915, ptr %len.addr, align 8
  br label %OP339.POP, !annotation !5

OP339.POP:                                        ; preds = %OP338.POP
  %stack_len1186 = load i64, ptr %len.addr, align 8
  %916 = add i64 %stack_len1186, -1
  store i64 %916, ptr %len.addr, align 8
  br label %OP340.PUSH1, !annotation !5

OP340.PUSH1:                                      ; preds = %OP339.POP
  %stack_len1187 = load i64, ptr %len.addr, align 8
  %917 = add i64 %stack_len1187, 1
  store i64 %917, ptr %len.addr, align 8
  %sp1188 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1187
  store i256 64, ptr %sp1188, align 16
  br label %OP341.MLOAD, !annotation !5

OP341.MLOAD:                                      ; preds = %OP340.PUSH1
  %stack_len1189 = load i64, ptr %len.addr, align 8
  %918 = add i64 %stack_len1189, -1
  %sp1190 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %918
  %a1191 = load i256, ptr %sp1190, align 16
  %mload.out.slot1192 = alloca i256, align 16
  %919 = call i8 @__revmc_ir_builtin_mload(i256 %a1191, ptr %mload.out.slot1192, ptr %arg.ecx.addr)
  %920 = icmp ne i8 %919, 0
  br i1 %920, label %return, label %OP341.MLOAD.contd, !prof !2

OP341.MLOAD.contd:                                ; preds = %OP341.MLOAD
  %mload.out1193 = load i256, ptr %mload.out.slot1192, align 16
  %921 = add i64 %stack_len1189, -1
  %sp1194 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %921
  store i256 %mload.out1193, ptr %sp1194, align 16
  br label %OP342.DUP1, !annotation !5

OP342.DUP1:                                       ; preds = %OP341.MLOAD.contd
  %stack_len1195 = load i64, ptr %len.addr, align 8
  %922 = add i64 %stack_len1195, 1
  store i64 %922, ptr %len.addr, align 8
  %923 = sub i64 %stack_len1195, 1
  %sp1196 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %923
  %dup11197 = load i256, ptr %sp1196, align 16
  %sp1198 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1195
  store i256 %dup11197, ptr %sp1198, align 16
  br label %OP343.SWAP2, !annotation !5

OP343.SWAP2:                                      ; preds = %OP342.DUP1
  %stack_len1199 = load i64, ptr %len.addr, align 8
  %924 = sub i64 %stack_len1199, 1
  %sp1200 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %924
  %swap.a1201 = load i256, ptr %sp1200, align 16
  %925 = sub i64 %stack_len1199, 3
  %sp1202 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %925
  %swap.b1203 = load i256, ptr %sp1202, align 16
  store i256 %swap.a1201, ptr %sp1202, align 16
  store i256 %swap.b1203, ptr %sp1200, align 16
  br label %OP344.SUB, !annotation !5

OP344.SUB:                                        ; preds = %OP343.SWAP2
  %stack_len1204 = load i64, ptr %len.addr, align 8
  %926 = add i64 %stack_len1204, -1
  store i64 %926, ptr %len.addr, align 8
  %927 = add i64 %stack_len1204, -1
  %sp1205 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %927
  %a1206 = load i256, ptr %sp1205, align 16
  %928 = add i64 %stack_len1204, -2
  %sp1207 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %928
  %b1208 = load i256, ptr %sp1207, align 16
  %929 = sub i256 %a1206, %b1208
  %930 = add i64 %stack_len1204, -2
  %sp1209 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %930
  store i256 %929, ptr %sp1209, align 16
  br label %OP345.SWAP1, !annotation !5

OP345.SWAP1:                                      ; preds = %OP344.SUB
  %stack_len1210 = load i64, ptr %len.addr, align 8
  %931 = sub i64 %stack_len1210, 1
  %sp1211 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %931
  %swap.a1212 = load i256, ptr %sp1211, align 16
  %932 = sub i64 %stack_len1210, 2
  %sp1213 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %932
  %swap.b1214 = load i256, ptr %sp1213, align 16
  store i256 %swap.a1212, ptr %sp1213, align 16
  store i256 %swap.b1214, ptr %sp1211, align 16
  br label %OP346.RETURN, !annotation !5

OP346.RETURN:                                     ; preds = %OP345.SWAP1
  %stack_len1215 = load i64, ptr %len.addr, align 8
  %933 = add i64 %stack_len1215, -2
  store i64 %933, ptr %len.addr, align 8
  %934 = sub i64 %stack_len1215, 2
  %sp1216 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %934
  %935 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1216, i8 2)
  %936 = icmp ne i8 %935, 0
  br i1 %936, label %return, label %OP346.RETURN.contd, !prof !2

OP346.RETURN.contd:                               ; preds = %OP346.RETURN
  br label %return, !annotation !10

OP347.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP39.JUMPI
  %gas.remaining1217 = load i64, ptr %gas.remaining.addr, align 8
  %937 = sub i64 %gas.remaining1217, 19
  %938 = icmp ult i64 %gas.remaining1217, 19
  store i64 %937, ptr %gas.remaining.addr, align 8
  br i1 %938, label %return, label %OP347.JUMPDEST.contd, !prof !2, !annotation !3

OP347.JUMPDEST.contd:                             ; preds = %OP347.JUMPDEST
  %stack_len1218 = load i64, ptr %len.addr, align 8
  %939 = icmp ugt i64 %stack_len1218, 1022
  br i1 %939, label %return, label %OP347.JUMPDEST.contd1219, !prof !2, !annotation !4

OP347.JUMPDEST.contd1219:                         ; preds = %OP347.JUMPDEST.contd
  br label %OP348.CALLVALUE, !annotation !5

OP348.CALLVALUE:                                  ; preds = %OP347.JUMPDEST.contd1219
  %stack_len1220 = load i64, ptr %len.addr, align 8
  %940 = add i64 %stack_len1220, 1
  store i64 %940, ptr %len.addr, align 8
  %contract.call_value.addr1221 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1222 = load i256, ptr %contract.call_value.addr1221, align 16
  %sp1223 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1220
  store i256 %contract.call_value1222, ptr %sp1223, align 16
  br label %OP349.ISZERO, !annotation !5

OP349.ISZERO:                                     ; preds = %OP348.CALLVALUE
  %stack_len1224 = load i64, ptr %len.addr, align 8
  %941 = add i64 %stack_len1224, -1
  %sp1225 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %941
  %a1226 = load i256, ptr %sp1225, align 16
  %942 = icmp eq i256 %a1226, 0
  %943 = zext i1 %942 to i256
  %944 = add i64 %stack_len1224, -1
  %sp1227 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %944
  store i256 %943, ptr %sp1227, align 16
  br label %OP350.PUSH2, !annotation !5

OP350.PUSH2:                                      ; preds = %OP349.ISZERO
  br label %OP351.JUMPI, !annotation !6

OP351.JUMPI:                                      ; preds = %OP350.PUSH2
  %stack_len1228 = load i64, ptr %len.addr, align 8
  %945 = add i64 %stack_len1228, -1
  store i64 %945, ptr %len.addr, align 8
  %946 = add i64 %stack_len1228, -1
  %sp1229 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %946
  %a1230 = load i256, ptr %sp1229, align 16
  %947 = icmp ne i256 %a1230, 0
  br i1 %947, label %OP355.JUMPDEST, label %OP352.PUSH1

OP352.PUSH1:                                      ; preds = %OP351.JUMPI
  %gas.remaining1231 = load i64, ptr %gas.remaining.addr, align 8
  %948 = sub i64 %gas.remaining1231, 6
  %949 = icmp ult i64 %gas.remaining1231, 6
  store i64 %948, ptr %gas.remaining.addr, align 8
  br i1 %949, label %return, label %OP352.PUSH1.contd, !prof !2, !annotation !3

OP352.PUSH1.contd:                                ; preds = %OP352.PUSH1
  %stack_len1232 = load i64, ptr %len.addr, align 8
  %950 = icmp ugt i64 %stack_len1232, 1022
  br i1 %950, label %return, label %OP352.PUSH1.contd1233, !prof !2, !annotation !4

OP352.PUSH1.contd1233:                            ; preds = %OP352.PUSH1.contd
  %951 = add i64 %stack_len1232, 1
  store i64 %951, ptr %len.addr, align 8
  %sp1234 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1232
  store i256 0, ptr %sp1234, align 16
  br label %OP353.DUP1, !annotation !5

OP353.DUP1:                                       ; preds = %OP352.PUSH1.contd1233
  %stack_len1235 = load i64, ptr %len.addr, align 8
  %952 = add i64 %stack_len1235, 1
  store i64 %952, ptr %len.addr, align 8
  %953 = sub i64 %stack_len1235, 1
  %sp1236 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %953
  %dup11237 = load i256, ptr %sp1236, align 16
  %sp1238 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1235
  store i256 %dup11237, ptr %sp1238, align 16
  br label %OP354.REVERT, !annotation !5

OP354.REVERT:                                     ; preds = %OP353.DUP1
  %stack_len1239 = load i64, ptr %len.addr, align 8
  %954 = add i64 %stack_len1239, -2
  store i64 %954, ptr %len.addr, align 8
  %955 = sub i64 %stack_len1239, 2
  %sp1240 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %955
  %956 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1240, i8 16)
  %957 = icmp ne i8 %956, 0
  br i1 %957, label %return, label %OP354.REVERT.contd, !prof !2

OP354.REVERT.contd:                               ; preds = %OP354.REVERT
  br label %return, !annotation !8

OP355.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP351.JUMPI
  %gas.remaining1241 = load i64, ptr %gas.remaining.addr, align 8
  %958 = sub i64 %gas.remaining1241, 49
  %959 = icmp ult i64 %gas.remaining1241, 49
  store i64 %958, ptr %gas.remaining.addr, align 8
  br i1 %959, label %return, label %OP355.JUMPDEST.contd, !prof !2, !annotation !3

OP355.JUMPDEST.contd:                             ; preds = %OP355.JUMPDEST
  %stack_len1242 = load i64, ptr %len.addr, align 8
  %960 = icmp ugt i64 %stack_len1242, 1019
  br i1 %960, label %return, label %OP355.JUMPDEST.contd1243, !prof !2, !annotation !4

OP355.JUMPDEST.contd1243:                         ; preds = %OP355.JUMPDEST.contd
  br label %OP356.PUSH2, !annotation !5

OP356.PUSH2:                                      ; preds = %OP355.JUMPDEST.contd1243
  %stack_len1244 = load i64, ptr %len.addr, align 8
  %961 = add i64 %stack_len1244, 1
  store i64 %961, ptr %len.addr, align 8
  %sp1245 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1244
  store i256 612, ptr %sp1245, align 16
  br label %OP357.PUSH1, !annotation !5

OP357.PUSH1:                                      ; preds = %OP356.PUSH2
  %stack_len1246 = load i64, ptr %len.addr, align 8
  %962 = add i64 %stack_len1246, 1
  store i64 %962, ptr %len.addr, align 8
  %sp1247 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1246
  store i256 4, ptr %sp1247, align 16
  br label %OP358.DUP1, !annotation !5

OP358.DUP1:                                       ; preds = %OP357.PUSH1
  %stack_len1248 = load i64, ptr %len.addr, align 8
  %963 = add i64 %stack_len1248, 1
  store i64 %963, ptr %len.addr, align 8
  %964 = sub i64 %stack_len1248, 1
  %sp1249 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %964
  %dup11250 = load i256, ptr %sp1249, align 16
  %sp1251 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1248
  store i256 %dup11250, ptr %sp1251, align 16
  br label %OP359.DUP1, !annotation !5

OP359.DUP1:                                       ; preds = %OP358.DUP1
  %stack_len1252 = load i64, ptr %len.addr, align 8
  %965 = add i64 %stack_len1252, 1
  store i64 %965, ptr %len.addr, align 8
  %966 = sub i64 %stack_len1252, 1
  %sp1253 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %966
  %dup11254 = load i256, ptr %sp1253, align 16
  %sp1255 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1252
  store i256 %dup11254, ptr %sp1255, align 16
  br label %OP360.CALLDATALOAD, !annotation !5

OP360.CALLDATALOAD:                               ; preds = %OP359.DUP1
  %stack_len1256 = load i64, ptr %len.addr, align 8
  %967 = add i64 %stack_len1256, -1
  %sp1257 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %967
  %a1258 = load i256, ptr %sp1257, align 16
  %968 = call i256 @__revmc_ir_builtin_calldataload(i256 %a1258, ptr %arg.contract.addr)
  %969 = add i64 %stack_len1256, -1
  %sp1259 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %969
  store i256 %968, ptr %sp1259, align 16
  br label %OP361.SWAP1, !annotation !5

OP361.SWAP1:                                      ; preds = %OP360.CALLDATALOAD
  %stack_len1260 = load i64, ptr %len.addr, align 8
  %970 = sub i64 %stack_len1260, 1
  %sp1261 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %970
  %swap.a1262 = load i256, ptr %sp1261, align 16
  %971 = sub i64 %stack_len1260, 2
  %sp1263 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %971
  %swap.b1264 = load i256, ptr %sp1263, align 16
  store i256 %swap.a1262, ptr %sp1263, align 16
  store i256 %swap.b1264, ptr %sp1261, align 16
  br label %OP362.PUSH1, !annotation !5

OP362.PUSH1:                                      ; preds = %OP361.SWAP1
  %stack_len1265 = load i64, ptr %len.addr, align 8
  %972 = add i64 %stack_len1265, 1
  store i64 %972, ptr %len.addr, align 8
  %sp1266 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1265
  store i256 32, ptr %sp1266, align 16
  br label %OP363.ADD, !annotation !5

OP363.ADD:                                        ; preds = %OP362.PUSH1
  %stack_len1267 = load i64, ptr %len.addr, align 8
  %973 = add i64 %stack_len1267, -1
  store i64 %973, ptr %len.addr, align 8
  %974 = add i64 %stack_len1267, -1
  %sp1268 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %974
  %a1269 = load i256, ptr %sp1268, align 16
  %975 = add i64 %stack_len1267, -2
  %sp1270 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %975
  %b1271 = load i256, ptr %sp1270, align 16
  %976 = add i256 %a1269, %b1271
  %977 = add i64 %stack_len1267, -2
  %sp1272 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %977
  store i256 %976, ptr %sp1272, align 16
  br label %OP364.SWAP1, !annotation !5

OP364.SWAP1:                                      ; preds = %OP363.ADD
  %stack_len1273 = load i64, ptr %len.addr, align 8
  %978 = sub i64 %stack_len1273, 1
  %sp1274 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %978
  %swap.a1275 = load i256, ptr %sp1274, align 16
  %979 = sub i64 %stack_len1273, 2
  %sp1276 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %979
  %swap.b1277 = load i256, ptr %sp1276, align 16
  store i256 %swap.a1275, ptr %sp1276, align 16
  store i256 %swap.b1277, ptr %sp1274, align 16
  br label %OP365.SWAP2, !annotation !5

OP365.SWAP2:                                      ; preds = %OP364.SWAP1
  %stack_len1278 = load i64, ptr %len.addr, align 8
  %980 = sub i64 %stack_len1278, 1
  %sp1279 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %980
  %swap.a1280 = load i256, ptr %sp1279, align 16
  %981 = sub i64 %stack_len1278, 3
  %sp1281 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %981
  %swap.b1282 = load i256, ptr %sp1281, align 16
  store i256 %swap.a1280, ptr %sp1281, align 16
  store i256 %swap.b1282, ptr %sp1279, align 16
  br label %OP366.SWAP1, !annotation !5

OP366.SWAP1:                                      ; preds = %OP365.SWAP2
  %stack_len1283 = load i64, ptr %len.addr, align 8
  %982 = sub i64 %stack_len1283, 1
  %sp1284 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %982
  %swap.a1285 = load i256, ptr %sp1284, align 16
  %983 = sub i64 %stack_len1283, 2
  %sp1286 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %983
  %swap.b1287 = load i256, ptr %sp1286, align 16
  store i256 %swap.a1285, ptr %sp1286, align 16
  store i256 %swap.b1287, ptr %sp1284, align 16
  br label %OP367.POP, !annotation !5

OP367.POP:                                        ; preds = %OP366.SWAP1
  %stack_len1288 = load i64, ptr %len.addr, align 8
  %984 = add i64 %stack_len1288, -1
  store i64 %984, ptr %len.addr, align 8
  br label %OP368.POP, !annotation !5

OP368.POP:                                        ; preds = %OP367.POP
  %stack_len1289 = load i64, ptr %len.addr, align 8
  %985 = add i64 %stack_len1289, -1
  store i64 %985, ptr %len.addr, align 8
  br label %OP369.PUSH2, !annotation !5

OP369.PUSH2:                                      ; preds = %OP368.POP
  br label %OP370.JUMP, !annotation !6

OP370.JUMP:                                       ; preds = %OP369.PUSH2
  %stack_len1290 = load i64, ptr %len.addr, align 8
  br label %OP1233.JUMPDEST

OP371.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1291 = load i64, ptr %gas.remaining.addr, align 8
  %986 = sub i64 %gas.remaining1291, 1
  %987 = icmp ult i64 %gas.remaining1291, 1
  store i64 %986, ptr %gas.remaining.addr, align 8
  br i1 %987, label %return, label %OP371.JUMPDEST.contd, !prof !2, !annotation !3

OP371.JUMPDEST.contd:                             ; preds = %OP371.JUMPDEST
  %stack_len1292 = load i64, ptr %len.addr, align 8
  br label %OP372.STOP, !annotation !5

OP372.STOP:                                       ; preds = %OP371.JUMPDEST.contd
  %stack_len1293 = load i64, ptr %len.addr, align 8
  br label %return, !annotation !7

OP373.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP44.JUMPI
  %gas.remaining1294 = load i64, ptr %gas.remaining.addr, align 8
  %988 = sub i64 %gas.remaining1294, 19
  %989 = icmp ult i64 %gas.remaining1294, 19
  store i64 %988, ptr %gas.remaining.addr, align 8
  br i1 %989, label %return, label %OP373.JUMPDEST.contd, !prof !2, !annotation !3

OP373.JUMPDEST.contd:                             ; preds = %OP373.JUMPDEST
  %stack_len1295 = load i64, ptr %len.addr, align 8
  %990 = icmp ugt i64 %stack_len1295, 1022
  br i1 %990, label %return, label %OP373.JUMPDEST.contd1296, !prof !2, !annotation !4

OP373.JUMPDEST.contd1296:                         ; preds = %OP373.JUMPDEST.contd
  br label %OP374.CALLVALUE, !annotation !5

OP374.CALLVALUE:                                  ; preds = %OP373.JUMPDEST.contd1296
  %stack_len1297 = load i64, ptr %len.addr, align 8
  %991 = add i64 %stack_len1297, 1
  store i64 %991, ptr %len.addr, align 8
  %contract.call_value.addr1298 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1299 = load i256, ptr %contract.call_value.addr1298, align 16
  %sp1300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1297
  store i256 %contract.call_value1299, ptr %sp1300, align 16
  br label %OP375.ISZERO, !annotation !5

OP375.ISZERO:                                     ; preds = %OP374.CALLVALUE
  %stack_len1301 = load i64, ptr %len.addr, align 8
  %992 = add i64 %stack_len1301, -1
  %sp1302 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %992
  %a1303 = load i256, ptr %sp1302, align 16
  %993 = icmp eq i256 %a1303, 0
  %994 = zext i1 %993 to i256
  %995 = add i64 %stack_len1301, -1
  %sp1304 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %995
  store i256 %994, ptr %sp1304, align 16
  br label %OP376.PUSH2, !annotation !5

OP376.PUSH2:                                      ; preds = %OP375.ISZERO
  br label %OP377.JUMPI, !annotation !6

OP377.JUMPI:                                      ; preds = %OP376.PUSH2
  %stack_len1305 = load i64, ptr %len.addr, align 8
  %996 = add i64 %stack_len1305, -1
  store i64 %996, ptr %len.addr, align 8
  %997 = add i64 %stack_len1305, -1
  %sp1306 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %997
  %a1307 = load i256, ptr %sp1306, align 16
  %998 = icmp ne i256 %a1307, 0
  br i1 %998, label %OP381.JUMPDEST, label %OP378.PUSH1

OP378.PUSH1:                                      ; preds = %OP377.JUMPI
  %gas.remaining1308 = load i64, ptr %gas.remaining.addr, align 8
  %999 = sub i64 %gas.remaining1308, 6
  %1000 = icmp ult i64 %gas.remaining1308, 6
  store i64 %999, ptr %gas.remaining.addr, align 8
  br i1 %1000, label %return, label %OP378.PUSH1.contd, !prof !2, !annotation !3

OP378.PUSH1.contd:                                ; preds = %OP378.PUSH1
  %stack_len1309 = load i64, ptr %len.addr, align 8
  %1001 = icmp ugt i64 %stack_len1309, 1022
  br i1 %1001, label %return, label %OP378.PUSH1.contd1310, !prof !2, !annotation !4

OP378.PUSH1.contd1310:                            ; preds = %OP378.PUSH1.contd
  %1002 = add i64 %stack_len1309, 1
  store i64 %1002, ptr %len.addr, align 8
  %sp1311 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1309
  store i256 0, ptr %sp1311, align 16
  br label %OP379.DUP1, !annotation !5

OP379.DUP1:                                       ; preds = %OP378.PUSH1.contd1310
  %stack_len1312 = load i64, ptr %len.addr, align 8
  %1003 = add i64 %stack_len1312, 1
  store i64 %1003, ptr %len.addr, align 8
  %1004 = sub i64 %stack_len1312, 1
  %sp1313 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1004
  %dup11314 = load i256, ptr %sp1313, align 16
  %sp1315 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1312
  store i256 %dup11314, ptr %sp1315, align 16
  br label %OP380.REVERT, !annotation !5

OP380.REVERT:                                     ; preds = %OP379.DUP1
  %stack_len1316 = load i64, ptr %len.addr, align 8
  %1005 = add i64 %stack_len1316, -2
  store i64 %1005, ptr %len.addr, align 8
  %1006 = sub i64 %stack_len1316, 2
  %sp1317 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1006
  %1007 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1317, i8 16)
  %1008 = icmp ne i8 %1007, 0
  br i1 %1008, label %return, label %OP380.REVERT.contd, !prof !2

OP380.REVERT.contd:                               ; preds = %OP380.REVERT
  br label %return, !annotation !8

OP381.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP377.JUMPI
  %gas.remaining1318 = load i64, ptr %gas.remaining.addr, align 8
  %1009 = sub i64 %gas.remaining1318, 15
  %1010 = icmp ult i64 %gas.remaining1318, 15
  store i64 %1009, ptr %gas.remaining.addr, align 8
  br i1 %1010, label %return, label %OP381.JUMPDEST.contd, !prof !2, !annotation !3

OP381.JUMPDEST.contd:                             ; preds = %OP381.JUMPDEST
  %stack_len1319 = load i64, ptr %len.addr, align 8
  %1011 = icmp ugt i64 %stack_len1319, 1022
  br i1 %1011, label %return, label %OP381.JUMPDEST.contd1320, !prof !2, !annotation !4

OP381.JUMPDEST.contd1320:                         ; preds = %OP381.JUMPDEST.contd
  br label %OP382.PUSH2, !annotation !5

OP382.PUSH2:                                      ; preds = %OP381.JUMPDEST.contd1320
  %stack_len1321 = load i64, ptr %len.addr, align 8
  %1012 = add i64 %stack_len1321, 1
  store i64 %1012, ptr %len.addr, align 8
  %sp1322 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1321
  store i256 633, ptr %sp1322, align 16
  br label %OP383.PUSH2, !annotation !5

OP383.PUSH2:                                      ; preds = %OP382.PUSH2
  br label %OP384.JUMP, !annotation !6

OP384.JUMP:                                       ; preds = %OP383.PUSH2
  %stack_len1323 = load i64, ptr %len.addr, align 8
  br label %OP1356.JUMPDEST

OP385.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1324 = load i64, ptr %gas.remaining.addr, align 8
  %1013 = sub i64 %gas.remaining1324, 62
  %1014 = icmp ult i64 %gas.remaining1324, 62
  store i64 %1013, ptr %gas.remaining.addr, align 8
  br i1 %1014, label %return, label %OP385.JUMPDEST.contd, !prof !2, !annotation !3

OP385.JUMPDEST.contd:                             ; preds = %OP385.JUMPDEST
  %stack_len1325 = load i64, ptr %len.addr, align 8
  %1015 = icmp ult i64 %stack_len1325, 1
  %1016 = icmp ugt i64 %stack_len1325, 1020
  %1017 = or i1 %1015, %1016
  %1018 = select i1 %1015, i8 91, i8 92
  br i1 %1017, label %return, label %OP385.JUMPDEST.contd1326, !prof !2

OP385.JUMPDEST.contd1326:                         ; preds = %OP385.JUMPDEST.contd
  br label %OP386.PUSH1, !annotation !5

OP386.PUSH1:                                      ; preds = %OP385.JUMPDEST.contd1326
  %stack_len1327 = load i64, ptr %len.addr, align 8
  %1019 = add i64 %stack_len1327, 1
  store i64 %1019, ptr %len.addr, align 8
  %sp1328 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1327
  store i256 64, ptr %sp1328, align 16
  br label %OP387.MLOAD, !annotation !5

OP387.MLOAD:                                      ; preds = %OP386.PUSH1
  %stack_len1329 = load i64, ptr %len.addr, align 8
  %1020 = add i64 %stack_len1329, -1
  %sp1330 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1020
  %a1331 = load i256, ptr %sp1330, align 16
  %mload.out.slot1332 = alloca i256, align 16
  %1021 = call i8 @__revmc_ir_builtin_mload(i256 %a1331, ptr %mload.out.slot1332, ptr %arg.ecx.addr)
  %1022 = icmp ne i8 %1021, 0
  br i1 %1022, label %return, label %OP387.MLOAD.contd, !prof !2

OP387.MLOAD.contd:                                ; preds = %OP387.MLOAD
  %mload.out1333 = load i256, ptr %mload.out.slot1332, align 16
  %1023 = add i64 %stack_len1329, -1
  %sp1334 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1023
  store i256 %mload.out1333, ptr %sp1334, align 16
  br label %OP388.DUP1, !annotation !5

OP388.DUP1:                                       ; preds = %OP387.MLOAD.contd
  %stack_len1335 = load i64, ptr %len.addr, align 8
  %1024 = add i64 %stack_len1335, 1
  store i64 %1024, ptr %len.addr, align 8
  %1025 = sub i64 %stack_len1335, 1
  %sp1336 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1025
  %dup11337 = load i256, ptr %sp1336, align 16
  %sp1338 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1335
  store i256 %dup11337, ptr %sp1338, align 16
  br label %OP389.DUP3, !annotation !5

OP389.DUP3:                                       ; preds = %OP388.DUP1
  %stack_len1339 = load i64, ptr %len.addr, align 8
  %1026 = add i64 %stack_len1339, 1
  store i64 %1026, ptr %len.addr, align 8
  %1027 = sub i64 %stack_len1339, 3
  %sp1340 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1027
  %dup31341 = load i256, ptr %sp1340, align 16
  %sp1342 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1339
  store i256 %dup31341, ptr %sp1342, align 16
  br label %OP390.PUSH1, !annotation !5

OP390.PUSH1:                                      ; preds = %OP389.DUP3
  %stack_len1343 = load i64, ptr %len.addr, align 8
  %1028 = add i64 %stack_len1343, 1
  store i64 %1028, ptr %len.addr, align 8
  %sp1344 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1343
  store i256 255, ptr %sp1344, align 16
  br label %OP391.AND, !annotation !5

OP391.AND:                                        ; preds = %OP390.PUSH1
  %stack_len1345 = load i64, ptr %len.addr, align 8
  %1029 = add i64 %stack_len1345, -1
  store i64 %1029, ptr %len.addr, align 8
  %1030 = add i64 %stack_len1345, -1
  %sp1346 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1030
  %a1347 = load i256, ptr %sp1346, align 16
  %1031 = add i64 %stack_len1345, -2
  %sp1348 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1031
  %b1349 = load i256, ptr %sp1348, align 16
  %1032 = and i256 %a1347, %b1349
  %1033 = add i64 %stack_len1345, -2
  %sp1350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1033
  store i256 %1032, ptr %sp1350, align 16
  br label %OP392.PUSH1, !annotation !5

OP392.PUSH1:                                      ; preds = %OP391.AND
  %stack_len1351 = load i64, ptr %len.addr, align 8
  %1034 = add i64 %stack_len1351, 1
  store i64 %1034, ptr %len.addr, align 8
  %sp1352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1351
  store i256 255, ptr %sp1352, align 16
  br label %OP393.AND, !annotation !5

OP393.AND:                                        ; preds = %OP392.PUSH1
  %stack_len1353 = load i64, ptr %len.addr, align 8
  %1035 = add i64 %stack_len1353, -1
  store i64 %1035, ptr %len.addr, align 8
  %1036 = add i64 %stack_len1353, -1
  %sp1354 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1036
  %a1355 = load i256, ptr %sp1354, align 16
  %1037 = add i64 %stack_len1353, -2
  %sp1356 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1037
  %b1357 = load i256, ptr %sp1356, align 16
  %1038 = and i256 %a1355, %b1357
  %1039 = add i64 %stack_len1353, -2
  %sp1358 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1039
  store i256 %1038, ptr %sp1358, align 16
  br label %OP394.DUP2, !annotation !5

OP394.DUP2:                                       ; preds = %OP393.AND
  %stack_len1359 = load i64, ptr %len.addr, align 8
  %1040 = add i64 %stack_len1359, 1
  store i64 %1040, ptr %len.addr, align 8
  %1041 = sub i64 %stack_len1359, 2
  %sp1360 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1041
  %dup21361 = load i256, ptr %sp1360, align 16
  %sp1362 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1359
  store i256 %dup21361, ptr %sp1362, align 16
  br label %OP395.MSTORE, !annotation !5

OP395.MSTORE:                                     ; preds = %OP394.DUP2
  %stack_len1363 = load i64, ptr %len.addr, align 8
  %1042 = add i64 %stack_len1363, -2
  store i64 %1042, ptr %len.addr, align 8
  %1043 = add i64 %stack_len1363, -1
  %sp1364 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1043
  %a1365 = load i256, ptr %sp1364, align 16
  %1044 = add i64 %stack_len1363, -2
  %sp1366 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1044
  %b1367 = load i256, ptr %sp1366, align 16
  %1045 = call i8 @__revmc_ir_builtin_mstore(i256 %a1365, i256 %b1367, ptr %arg.ecx.addr)
  %1046 = icmp ne i8 %1045, 0
  br i1 %1046, label %return, label %OP395.MSTORE.contd, !prof !2

OP395.MSTORE.contd:                               ; preds = %OP395.MSTORE
  br label %OP396.PUSH1, !annotation !5

OP396.PUSH1:                                      ; preds = %OP395.MSTORE.contd
  %stack_len1368 = load i64, ptr %len.addr, align 8
  %1047 = add i64 %stack_len1368, 1
  store i64 %1047, ptr %len.addr, align 8
  %sp1369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1368
  store i256 32, ptr %sp1369, align 16
  br label %OP397.ADD, !annotation !5

OP397.ADD:                                        ; preds = %OP396.PUSH1
  %stack_len1370 = load i64, ptr %len.addr, align 8
  %1048 = add i64 %stack_len1370, -1
  store i64 %1048, ptr %len.addr, align 8
  %1049 = add i64 %stack_len1370, -1
  %sp1371 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1049
  %a1372 = load i256, ptr %sp1371, align 16
  %1050 = add i64 %stack_len1370, -2
  %sp1373 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1050
  %b1374 = load i256, ptr %sp1373, align 16
  %1051 = add i256 %a1372, %b1374
  %1052 = add i64 %stack_len1370, -2
  %sp1375 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1052
  store i256 %1051, ptr %sp1375, align 16
  br label %OP398.SWAP2, !annotation !5

OP398.SWAP2:                                      ; preds = %OP397.ADD
  %stack_len1376 = load i64, ptr %len.addr, align 8
  %1053 = sub i64 %stack_len1376, 1
  %sp1377 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1053
  %swap.a1378 = load i256, ptr %sp1377, align 16
  %1054 = sub i64 %stack_len1376, 3
  %sp1379 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1054
  %swap.b1380 = load i256, ptr %sp1379, align 16
  store i256 %swap.a1378, ptr %sp1379, align 16
  store i256 %swap.b1380, ptr %sp1377, align 16
  br label %OP399.POP, !annotation !5

OP399.POP:                                        ; preds = %OP398.SWAP2
  %stack_len1381 = load i64, ptr %len.addr, align 8
  %1055 = add i64 %stack_len1381, -1
  store i64 %1055, ptr %len.addr, align 8
  br label %OP400.POP, !annotation !5

OP400.POP:                                        ; preds = %OP399.POP
  %stack_len1382 = load i64, ptr %len.addr, align 8
  %1056 = add i64 %stack_len1382, -1
  store i64 %1056, ptr %len.addr, align 8
  br label %OP401.PUSH1, !annotation !5

OP401.PUSH1:                                      ; preds = %OP400.POP
  %stack_len1383 = load i64, ptr %len.addr, align 8
  %1057 = add i64 %stack_len1383, 1
  store i64 %1057, ptr %len.addr, align 8
  %sp1384 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1383
  store i256 64, ptr %sp1384, align 16
  br label %OP402.MLOAD, !annotation !5

OP402.MLOAD:                                      ; preds = %OP401.PUSH1
  %stack_len1385 = load i64, ptr %len.addr, align 8
  %1058 = add i64 %stack_len1385, -1
  %sp1386 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1058
  %a1387 = load i256, ptr %sp1386, align 16
  %mload.out.slot1388 = alloca i256, align 16
  %1059 = call i8 @__revmc_ir_builtin_mload(i256 %a1387, ptr %mload.out.slot1388, ptr %arg.ecx.addr)
  %1060 = icmp ne i8 %1059, 0
  br i1 %1060, label %return, label %OP402.MLOAD.contd, !prof !2

OP402.MLOAD.contd:                                ; preds = %OP402.MLOAD
  %mload.out1389 = load i256, ptr %mload.out.slot1388, align 16
  %1061 = add i64 %stack_len1385, -1
  %sp1390 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1061
  store i256 %mload.out1389, ptr %sp1390, align 16
  br label %OP403.DUP1, !annotation !5

OP403.DUP1:                                       ; preds = %OP402.MLOAD.contd
  %stack_len1391 = load i64, ptr %len.addr, align 8
  %1062 = add i64 %stack_len1391, 1
  store i64 %1062, ptr %len.addr, align 8
  %1063 = sub i64 %stack_len1391, 1
  %sp1392 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1063
  %dup11393 = load i256, ptr %sp1392, align 16
  %sp1394 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1391
  store i256 %dup11393, ptr %sp1394, align 16
  br label %OP404.SWAP2, !annotation !5

OP404.SWAP2:                                      ; preds = %OP403.DUP1
  %stack_len1395 = load i64, ptr %len.addr, align 8
  %1064 = sub i64 %stack_len1395, 1
  %sp1396 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1064
  %swap.a1397 = load i256, ptr %sp1396, align 16
  %1065 = sub i64 %stack_len1395, 3
  %sp1398 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1065
  %swap.b1399 = load i256, ptr %sp1398, align 16
  store i256 %swap.a1397, ptr %sp1398, align 16
  store i256 %swap.b1399, ptr %sp1396, align 16
  br label %OP405.SUB, !annotation !5

OP405.SUB:                                        ; preds = %OP404.SWAP2
  %stack_len1400 = load i64, ptr %len.addr, align 8
  %1066 = add i64 %stack_len1400, -1
  store i64 %1066, ptr %len.addr, align 8
  %1067 = add i64 %stack_len1400, -1
  %sp1401 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1067
  %a1402 = load i256, ptr %sp1401, align 16
  %1068 = add i64 %stack_len1400, -2
  %sp1403 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1068
  %b1404 = load i256, ptr %sp1403, align 16
  %1069 = sub i256 %a1402, %b1404
  %1070 = add i64 %stack_len1400, -2
  %sp1405 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1070
  store i256 %1069, ptr %sp1405, align 16
  br label %OP406.SWAP1, !annotation !5

OP406.SWAP1:                                      ; preds = %OP405.SUB
  %stack_len1406 = load i64, ptr %len.addr, align 8
  %1071 = sub i64 %stack_len1406, 1
  %sp1407 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1071
  %swap.a1408 = load i256, ptr %sp1407, align 16
  %1072 = sub i64 %stack_len1406, 2
  %sp1409 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1072
  %swap.b1410 = load i256, ptr %sp1409, align 16
  store i256 %swap.a1408, ptr %sp1409, align 16
  store i256 %swap.b1410, ptr %sp1407, align 16
  br label %OP407.RETURN, !annotation !5

OP407.RETURN:                                     ; preds = %OP406.SWAP1
  %stack_len1411 = load i64, ptr %len.addr, align 8
  %1073 = add i64 %stack_len1411, -2
  store i64 %1073, ptr %len.addr, align 8
  %1074 = sub i64 %stack_len1411, 2
  %sp1412 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1074
  %1075 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1412, i8 2)
  %1076 = icmp ne i8 %1075, 0
  br i1 %1076, label %return, label %OP407.RETURN.contd, !prof !2

OP407.RETURN.contd:                               ; preds = %OP407.RETURN
  br label %return, !annotation !10

OP408.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP49.JUMPI
  %gas.remaining1413 = load i64, ptr %gas.remaining.addr, align 8
  %1077 = sub i64 %gas.remaining1413, 19
  %1078 = icmp ult i64 %gas.remaining1413, 19
  store i64 %1077, ptr %gas.remaining.addr, align 8
  br i1 %1078, label %return, label %OP408.JUMPDEST.contd, !prof !2, !annotation !3

OP408.JUMPDEST.contd:                             ; preds = %OP408.JUMPDEST
  %stack_len1414 = load i64, ptr %len.addr, align 8
  %1079 = icmp ugt i64 %stack_len1414, 1022
  br i1 %1079, label %return, label %OP408.JUMPDEST.contd1415, !prof !2, !annotation !4

OP408.JUMPDEST.contd1415:                         ; preds = %OP408.JUMPDEST.contd
  br label %OP409.CALLVALUE, !annotation !5

OP409.CALLVALUE:                                  ; preds = %OP408.JUMPDEST.contd1415
  %stack_len1416 = load i64, ptr %len.addr, align 8
  %1080 = add i64 %stack_len1416, 1
  store i64 %1080, ptr %len.addr, align 8
  %contract.call_value.addr1417 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1418 = load i256, ptr %contract.call_value.addr1417, align 16
  %sp1419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1416
  store i256 %contract.call_value1418, ptr %sp1419, align 16
  br label %OP410.ISZERO, !annotation !5

OP410.ISZERO:                                     ; preds = %OP409.CALLVALUE
  %stack_len1420 = load i64, ptr %len.addr, align 8
  %1081 = add i64 %stack_len1420, -1
  %sp1421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1081
  %a1422 = load i256, ptr %sp1421, align 16
  %1082 = icmp eq i256 %a1422, 0
  %1083 = zext i1 %1082 to i256
  %1084 = add i64 %stack_len1420, -1
  %sp1423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1084
  store i256 %1083, ptr %sp1423, align 16
  br label %OP411.PUSH2, !annotation !5

OP411.PUSH2:                                      ; preds = %OP410.ISZERO
  br label %OP412.JUMPI, !annotation !6

OP412.JUMPI:                                      ; preds = %OP411.PUSH2
  %stack_len1424 = load i64, ptr %len.addr, align 8
  %1085 = add i64 %stack_len1424, -1
  store i64 %1085, ptr %len.addr, align 8
  %1086 = add i64 %stack_len1424, -1
  %sp1425 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1086
  %a1426 = load i256, ptr %sp1425, align 16
  %1087 = icmp ne i256 %a1426, 0
  br i1 %1087, label %OP416.JUMPDEST, label %OP413.PUSH1

OP413.PUSH1:                                      ; preds = %OP412.JUMPI
  %gas.remaining1427 = load i64, ptr %gas.remaining.addr, align 8
  %1088 = sub i64 %gas.remaining1427, 6
  %1089 = icmp ult i64 %gas.remaining1427, 6
  store i64 %1088, ptr %gas.remaining.addr, align 8
  br i1 %1089, label %return, label %OP413.PUSH1.contd, !prof !2, !annotation !3

OP413.PUSH1.contd:                                ; preds = %OP413.PUSH1
  %stack_len1428 = load i64, ptr %len.addr, align 8
  %1090 = icmp ugt i64 %stack_len1428, 1022
  br i1 %1090, label %return, label %OP413.PUSH1.contd1429, !prof !2, !annotation !4

OP413.PUSH1.contd1429:                            ; preds = %OP413.PUSH1.contd
  %1091 = add i64 %stack_len1428, 1
  store i64 %1091, ptr %len.addr, align 8
  %sp1430 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1428
  store i256 0, ptr %sp1430, align 16
  br label %OP414.DUP1, !annotation !5

OP414.DUP1:                                       ; preds = %OP413.PUSH1.contd1429
  %stack_len1431 = load i64, ptr %len.addr, align 8
  %1092 = add i64 %stack_len1431, 1
  store i64 %1092, ptr %len.addr, align 8
  %1093 = sub i64 %stack_len1431, 1
  %sp1432 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1093
  %dup11433 = load i256, ptr %sp1432, align 16
  %sp1434 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1431
  store i256 %dup11433, ptr %sp1434, align 16
  br label %OP415.REVERT, !annotation !5

OP415.REVERT:                                     ; preds = %OP414.DUP1
  %stack_len1435 = load i64, ptr %len.addr, align 8
  %1094 = add i64 %stack_len1435, -2
  store i64 %1094, ptr %len.addr, align 8
  %1095 = sub i64 %stack_len1435, 2
  %sp1436 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1095
  %1096 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1436, i8 16)
  %1097 = icmp ne i8 %1096, 0
  br i1 %1097, label %return, label %OP415.REVERT.contd, !prof !2

OP415.REVERT.contd:                               ; preds = %OP415.REVERT
  br label %return, !annotation !8

OP416.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP412.JUMPI
  %gas.remaining1437 = load i64, ptr %gas.remaining.addr, align 8
  %1098 = sub i64 %gas.remaining1437, 55
  %1099 = icmp ult i64 %gas.remaining1437, 55
  store i64 %1098, ptr %gas.remaining.addr, align 8
  br i1 %1099, label %return, label %OP416.JUMPDEST.contd, !prof !2, !annotation !3

OP416.JUMPDEST.contd:                             ; preds = %OP416.JUMPDEST
  %stack_len1438 = load i64, ptr %len.addr, align 8
  %1100 = icmp ugt i64 %stack_len1438, 1019
  br i1 %1100, label %return, label %OP416.JUMPDEST.contd1439, !prof !2, !annotation !4

OP416.JUMPDEST.contd1439:                         ; preds = %OP416.JUMPDEST.contd
  br label %OP417.PUSH2, !annotation !5

OP417.PUSH2:                                      ; preds = %OP416.JUMPDEST.contd1439
  %stack_len1440 = load i64, ptr %len.addr, align 8
  %1101 = add i64 %stack_len1440, 1
  store i64 %1101, ptr %len.addr, align 8
  %sp1441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1440
  store i256 716, ptr %sp1441, align 16
  br label %OP418.PUSH1, !annotation !5

OP418.PUSH1:                                      ; preds = %OP417.PUSH2
  %stack_len1442 = load i64, ptr %len.addr, align 8
  %1102 = add i64 %stack_len1442, 1
  store i64 %1102, ptr %len.addr, align 8
  %sp1443 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1442
  store i256 4, ptr %sp1443, align 16
  br label %OP419.DUP1, !annotation !5

OP419.DUP1:                                       ; preds = %OP418.PUSH1
  %stack_len1444 = load i64, ptr %len.addr, align 8
  %1103 = add i64 %stack_len1444, 1
  store i64 %1103, ptr %len.addr, align 8
  %1104 = sub i64 %stack_len1444, 1
  %sp1445 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1104
  %dup11446 = load i256, ptr %sp1445, align 16
  %sp1447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1444
  store i256 %dup11446, ptr %sp1447, align 16
  br label %OP420.DUP1, !annotation !5

OP420.DUP1:                                       ; preds = %OP419.DUP1
  %stack_len1448 = load i64, ptr %len.addr, align 8
  %1105 = add i64 %stack_len1448, 1
  store i64 %1105, ptr %len.addr, align 8
  %1106 = sub i64 %stack_len1448, 1
  %sp1449 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1106
  %dup11450 = load i256, ptr %sp1449, align 16
  %sp1451 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1448
  store i256 %dup11450, ptr %sp1451, align 16
  br label %OP421.CALLDATALOAD, !annotation !5

OP421.CALLDATALOAD:                               ; preds = %OP420.DUP1
  %stack_len1452 = load i64, ptr %len.addr, align 8
  %1107 = add i64 %stack_len1452, -1
  %sp1453 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1107
  %a1454 = load i256, ptr %sp1453, align 16
  %1108 = call i256 @__revmc_ir_builtin_calldataload(i256 %a1454, ptr %arg.contract.addr)
  %1109 = add i64 %stack_len1452, -1
  %sp1455 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1109
  store i256 %1108, ptr %sp1455, align 16
  br label %OP422.PUSH20, !annotation !5

OP422.PUSH20:                                     ; preds = %OP421.CALLDATALOAD
  %stack_len1456 = load i64, ptr %len.addr, align 8
  %1110 = add i64 %stack_len1456, 1
  store i64 %1110, ptr %len.addr, align 8
  %sp1457 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1456
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp1457, align 16
  br label %OP423.AND, !annotation !5

OP423.AND:                                        ; preds = %OP422.PUSH20
  %stack_len1458 = load i64, ptr %len.addr, align 8
  %1111 = add i64 %stack_len1458, -1
  store i64 %1111, ptr %len.addr, align 8
  %1112 = add i64 %stack_len1458, -1
  %sp1459 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1112
  %a1460 = load i256, ptr %sp1459, align 16
  %1113 = add i64 %stack_len1458, -2
  %sp1461 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1113
  %b1462 = load i256, ptr %sp1461, align 16
  %1114 = and i256 %a1460, %b1462
  %1115 = add i64 %stack_len1458, -2
  %sp1463 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1115
  store i256 %1114, ptr %sp1463, align 16
  br label %OP424.SWAP1, !annotation !5

OP424.SWAP1:                                      ; preds = %OP423.AND
  %stack_len1464 = load i64, ptr %len.addr, align 8
  %1116 = sub i64 %stack_len1464, 1
  %sp1465 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1116
  %swap.a1466 = load i256, ptr %sp1465, align 16
  %1117 = sub i64 %stack_len1464, 2
  %sp1467 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1117
  %swap.b1468 = load i256, ptr %sp1467, align 16
  store i256 %swap.a1466, ptr %sp1467, align 16
  store i256 %swap.b1468, ptr %sp1465, align 16
  br label %OP425.PUSH1, !annotation !5

OP425.PUSH1:                                      ; preds = %OP424.SWAP1
  %stack_len1469 = load i64, ptr %len.addr, align 8
  %1118 = add i64 %stack_len1469, 1
  store i64 %1118, ptr %len.addr, align 8
  %sp1470 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1469
  store i256 32, ptr %sp1470, align 16
  br label %OP426.ADD, !annotation !5

OP426.ADD:                                        ; preds = %OP425.PUSH1
  %stack_len1471 = load i64, ptr %len.addr, align 8
  %1119 = add i64 %stack_len1471, -1
  store i64 %1119, ptr %len.addr, align 8
  %1120 = add i64 %stack_len1471, -1
  %sp1472 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1120
  %a1473 = load i256, ptr %sp1472, align 16
  %1121 = add i64 %stack_len1471, -2
  %sp1474 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1121
  %b1475 = load i256, ptr %sp1474, align 16
  %1122 = add i256 %a1473, %b1475
  %1123 = add i64 %stack_len1471, -2
  %sp1476 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1123
  store i256 %1122, ptr %sp1476, align 16
  br label %OP427.SWAP1, !annotation !5

OP427.SWAP1:                                      ; preds = %OP426.ADD
  %stack_len1477 = load i64, ptr %len.addr, align 8
  %1124 = sub i64 %stack_len1477, 1
  %sp1478 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1124
  %swap.a1479 = load i256, ptr %sp1478, align 16
  %1125 = sub i64 %stack_len1477, 2
  %sp1480 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1125
  %swap.b1481 = load i256, ptr %sp1480, align 16
  store i256 %swap.a1479, ptr %sp1480, align 16
  store i256 %swap.b1481, ptr %sp1478, align 16
  br label %OP428.SWAP2, !annotation !5

OP428.SWAP2:                                      ; preds = %OP427.SWAP1
  %stack_len1482 = load i64, ptr %len.addr, align 8
  %1126 = sub i64 %stack_len1482, 1
  %sp1483 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1126
  %swap.a1484 = load i256, ptr %sp1483, align 16
  %1127 = sub i64 %stack_len1482, 3
  %sp1485 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1127
  %swap.b1486 = load i256, ptr %sp1485, align 16
  store i256 %swap.a1484, ptr %sp1485, align 16
  store i256 %swap.b1486, ptr %sp1483, align 16
  br label %OP429.SWAP1, !annotation !5

OP429.SWAP1:                                      ; preds = %OP428.SWAP2
  %stack_len1487 = load i64, ptr %len.addr, align 8
  %1128 = sub i64 %stack_len1487, 1
  %sp1488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1128
  %swap.a1489 = load i256, ptr %sp1488, align 16
  %1129 = sub i64 %stack_len1487, 2
  %sp1490 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1129
  %swap.b1491 = load i256, ptr %sp1490, align 16
  store i256 %swap.a1489, ptr %sp1490, align 16
  store i256 %swap.b1491, ptr %sp1488, align 16
  br label %OP430.POP, !annotation !5

OP430.POP:                                        ; preds = %OP429.SWAP1
  %stack_len1492 = load i64, ptr %len.addr, align 8
  %1130 = add i64 %stack_len1492, -1
  store i64 %1130, ptr %len.addr, align 8
  br label %OP431.POP, !annotation !5

OP431.POP:                                        ; preds = %OP430.POP
  %stack_len1493 = load i64, ptr %len.addr, align 8
  %1131 = add i64 %stack_len1493, -1
  store i64 %1131, ptr %len.addr, align 8
  br label %OP432.PUSH2, !annotation !5

OP432.PUSH2:                                      ; preds = %OP431.POP
  br label %OP433.JUMP, !annotation !6

OP433.JUMP:                                       ; preds = %OP432.PUSH2
  %stack_len1494 = load i64, ptr %len.addr, align 8
  br label %OP1370.JUMPDEST

OP434.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1495 = load i64, ptr %gas.remaining.addr, align 8
  %1132 = sub i64 %gas.remaining1495, 50
  %1133 = icmp ult i64 %gas.remaining1495, 50
  store i64 %1132, ptr %gas.remaining.addr, align 8
  br i1 %1133, label %return, label %OP434.JUMPDEST.contd, !prof !2, !annotation !3

OP434.JUMPDEST.contd:                             ; preds = %OP434.JUMPDEST
  %stack_len1496 = load i64, ptr %len.addr, align 8
  %1134 = icmp ult i64 %stack_len1496, 1
  %1135 = icmp ugt i64 %stack_len1496, 1020
  %1136 = or i1 %1134, %1135
  %1137 = select i1 %1134, i8 91, i8 92
  br i1 %1136, label %return, label %OP434.JUMPDEST.contd1497, !prof !2

OP434.JUMPDEST.contd1497:                         ; preds = %OP434.JUMPDEST.contd
  br label %OP435.PUSH1, !annotation !5

OP435.PUSH1:                                      ; preds = %OP434.JUMPDEST.contd1497
  %stack_len1498 = load i64, ptr %len.addr, align 8
  %1138 = add i64 %stack_len1498, 1
  store i64 %1138, ptr %len.addr, align 8
  %sp1499 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1498
  store i256 64, ptr %sp1499, align 16
  br label %OP436.MLOAD, !annotation !5

OP436.MLOAD:                                      ; preds = %OP435.PUSH1
  %stack_len1500 = load i64, ptr %len.addr, align 8
  %1139 = add i64 %stack_len1500, -1
  %sp1501 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1139
  %a1502 = load i256, ptr %sp1501, align 16
  %mload.out.slot1503 = alloca i256, align 16
  %1140 = call i8 @__revmc_ir_builtin_mload(i256 %a1502, ptr %mload.out.slot1503, ptr %arg.ecx.addr)
  %1141 = icmp ne i8 %1140, 0
  br i1 %1141, label %return, label %OP436.MLOAD.contd, !prof !2

OP436.MLOAD.contd:                                ; preds = %OP436.MLOAD
  %mload.out1504 = load i256, ptr %mload.out.slot1503, align 16
  %1142 = add i64 %stack_len1500, -1
  %sp1505 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1142
  store i256 %mload.out1504, ptr %sp1505, align 16
  br label %OP437.DUP1, !annotation !5

OP437.DUP1:                                       ; preds = %OP436.MLOAD.contd
  %stack_len1506 = load i64, ptr %len.addr, align 8
  %1143 = add i64 %stack_len1506, 1
  store i64 %1143, ptr %len.addr, align 8
  %1144 = sub i64 %stack_len1506, 1
  %sp1507 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1144
  %dup11508 = load i256, ptr %sp1507, align 16
  %sp1509 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1506
  store i256 %dup11508, ptr %sp1509, align 16
  br label %OP438.DUP3, !annotation !5

OP438.DUP3:                                       ; preds = %OP437.DUP1
  %stack_len1510 = load i64, ptr %len.addr, align 8
  %1145 = add i64 %stack_len1510, 1
  store i64 %1145, ptr %len.addr, align 8
  %1146 = sub i64 %stack_len1510, 3
  %sp1511 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1146
  %dup31512 = load i256, ptr %sp1511, align 16
  %sp1513 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1510
  store i256 %dup31512, ptr %sp1513, align 16
  br label %OP439.DUP2, !annotation !5

OP439.DUP2:                                       ; preds = %OP438.DUP3
  %stack_len1514 = load i64, ptr %len.addr, align 8
  %1147 = add i64 %stack_len1514, 1
  store i64 %1147, ptr %len.addr, align 8
  %1148 = sub i64 %stack_len1514, 2
  %sp1515 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1148
  %dup21516 = load i256, ptr %sp1515, align 16
  %sp1517 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1514
  store i256 %dup21516, ptr %sp1517, align 16
  br label %OP440.MSTORE, !annotation !5

OP440.MSTORE:                                     ; preds = %OP439.DUP2
  %stack_len1518 = load i64, ptr %len.addr, align 8
  %1149 = add i64 %stack_len1518, -2
  store i64 %1149, ptr %len.addr, align 8
  %1150 = add i64 %stack_len1518, -1
  %sp1519 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1150
  %a1520 = load i256, ptr %sp1519, align 16
  %1151 = add i64 %stack_len1518, -2
  %sp1521 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1151
  %b1522 = load i256, ptr %sp1521, align 16
  %1152 = call i8 @__revmc_ir_builtin_mstore(i256 %a1520, i256 %b1522, ptr %arg.ecx.addr)
  %1153 = icmp ne i8 %1152, 0
  br i1 %1153, label %return, label %OP440.MSTORE.contd, !prof !2

OP440.MSTORE.contd:                               ; preds = %OP440.MSTORE
  br label %OP441.PUSH1, !annotation !5

OP441.PUSH1:                                      ; preds = %OP440.MSTORE.contd
  %stack_len1523 = load i64, ptr %len.addr, align 8
  %1154 = add i64 %stack_len1523, 1
  store i64 %1154, ptr %len.addr, align 8
  %sp1524 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1523
  store i256 32, ptr %sp1524, align 16
  br label %OP442.ADD, !annotation !5

OP442.ADD:                                        ; preds = %OP441.PUSH1
  %stack_len1525 = load i64, ptr %len.addr, align 8
  %1155 = add i64 %stack_len1525, -1
  store i64 %1155, ptr %len.addr, align 8
  %1156 = add i64 %stack_len1525, -1
  %sp1526 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1156
  %a1527 = load i256, ptr %sp1526, align 16
  %1157 = add i64 %stack_len1525, -2
  %sp1528 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1157
  %b1529 = load i256, ptr %sp1528, align 16
  %1158 = add i256 %a1527, %b1529
  %1159 = add i64 %stack_len1525, -2
  %sp1530 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1159
  store i256 %1158, ptr %sp1530, align 16
  br label %OP443.SWAP2, !annotation !5

OP443.SWAP2:                                      ; preds = %OP442.ADD
  %stack_len1531 = load i64, ptr %len.addr, align 8
  %1160 = sub i64 %stack_len1531, 1
  %sp1532 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1160
  %swap.a1533 = load i256, ptr %sp1532, align 16
  %1161 = sub i64 %stack_len1531, 3
  %sp1534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1161
  %swap.b1535 = load i256, ptr %sp1534, align 16
  store i256 %swap.a1533, ptr %sp1534, align 16
  store i256 %swap.b1535, ptr %sp1532, align 16
  br label %OP444.POP, !annotation !5

OP444.POP:                                        ; preds = %OP443.SWAP2
  %stack_len1536 = load i64, ptr %len.addr, align 8
  %1162 = add i64 %stack_len1536, -1
  store i64 %1162, ptr %len.addr, align 8
  br label %OP445.POP, !annotation !5

OP445.POP:                                        ; preds = %OP444.POP
  %stack_len1537 = load i64, ptr %len.addr, align 8
  %1163 = add i64 %stack_len1537, -1
  store i64 %1163, ptr %len.addr, align 8
  br label %OP446.PUSH1, !annotation !5

OP446.PUSH1:                                      ; preds = %OP445.POP
  %stack_len1538 = load i64, ptr %len.addr, align 8
  %1164 = add i64 %stack_len1538, 1
  store i64 %1164, ptr %len.addr, align 8
  %sp1539 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1538
  store i256 64, ptr %sp1539, align 16
  br label %OP447.MLOAD, !annotation !5

OP447.MLOAD:                                      ; preds = %OP446.PUSH1
  %stack_len1540 = load i64, ptr %len.addr, align 8
  %1165 = add i64 %stack_len1540, -1
  %sp1541 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1165
  %a1542 = load i256, ptr %sp1541, align 16
  %mload.out.slot1543 = alloca i256, align 16
  %1166 = call i8 @__revmc_ir_builtin_mload(i256 %a1542, ptr %mload.out.slot1543, ptr %arg.ecx.addr)
  %1167 = icmp ne i8 %1166, 0
  br i1 %1167, label %return, label %OP447.MLOAD.contd, !prof !2

OP447.MLOAD.contd:                                ; preds = %OP447.MLOAD
  %mload.out1544 = load i256, ptr %mload.out.slot1543, align 16
  %1168 = add i64 %stack_len1540, -1
  %sp1545 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1168
  store i256 %mload.out1544, ptr %sp1545, align 16
  br label %OP448.DUP1, !annotation !5

OP448.DUP1:                                       ; preds = %OP447.MLOAD.contd
  %stack_len1546 = load i64, ptr %len.addr, align 8
  %1169 = add i64 %stack_len1546, 1
  store i64 %1169, ptr %len.addr, align 8
  %1170 = sub i64 %stack_len1546, 1
  %sp1547 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1170
  %dup11548 = load i256, ptr %sp1547, align 16
  %sp1549 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1546
  store i256 %dup11548, ptr %sp1549, align 16
  br label %OP449.SWAP2, !annotation !5

OP449.SWAP2:                                      ; preds = %OP448.DUP1
  %stack_len1550 = load i64, ptr %len.addr, align 8
  %1171 = sub i64 %stack_len1550, 1
  %sp1551 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1171
  %swap.a1552 = load i256, ptr %sp1551, align 16
  %1172 = sub i64 %stack_len1550, 3
  %sp1553 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1172
  %swap.b1554 = load i256, ptr %sp1553, align 16
  store i256 %swap.a1552, ptr %sp1553, align 16
  store i256 %swap.b1554, ptr %sp1551, align 16
  br label %OP450.SUB, !annotation !5

OP450.SUB:                                        ; preds = %OP449.SWAP2
  %stack_len1555 = load i64, ptr %len.addr, align 8
  %1173 = add i64 %stack_len1555, -1
  store i64 %1173, ptr %len.addr, align 8
  %1174 = add i64 %stack_len1555, -1
  %sp1556 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1174
  %a1557 = load i256, ptr %sp1556, align 16
  %1175 = add i64 %stack_len1555, -2
  %sp1558 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1175
  %b1559 = load i256, ptr %sp1558, align 16
  %1176 = sub i256 %a1557, %b1559
  %1177 = add i64 %stack_len1555, -2
  %sp1560 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1177
  store i256 %1176, ptr %sp1560, align 16
  br label %OP451.SWAP1, !annotation !5

OP451.SWAP1:                                      ; preds = %OP450.SUB
  %stack_len1561 = load i64, ptr %len.addr, align 8
  %1178 = sub i64 %stack_len1561, 1
  %sp1562 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1178
  %swap.a1563 = load i256, ptr %sp1562, align 16
  %1179 = sub i64 %stack_len1561, 2
  %sp1564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1179
  %swap.b1565 = load i256, ptr %sp1564, align 16
  store i256 %swap.a1563, ptr %sp1564, align 16
  store i256 %swap.b1565, ptr %sp1562, align 16
  br label %OP452.RETURN, !annotation !5

OP452.RETURN:                                     ; preds = %OP451.SWAP1
  %stack_len1566 = load i64, ptr %len.addr, align 8
  %1180 = add i64 %stack_len1566, -2
  store i64 %1180, ptr %len.addr, align 8
  %1181 = sub i64 %stack_len1566, 2
  %sp1567 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1181
  %1182 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1567, i8 2)
  %1183 = icmp ne i8 %1182, 0
  br i1 %1183, label %return, label %OP452.RETURN.contd, !prof !2

OP452.RETURN.contd:                               ; preds = %OP452.RETURN
  br label %return, !annotation !10

OP453.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP54.JUMPI
  %gas.remaining1568 = load i64, ptr %gas.remaining.addr, align 8
  %1184 = sub i64 %gas.remaining1568, 19
  %1185 = icmp ult i64 %gas.remaining1568, 19
  store i64 %1184, ptr %gas.remaining.addr, align 8
  br i1 %1185, label %return, label %OP453.JUMPDEST.contd, !prof !2, !annotation !3

OP453.JUMPDEST.contd:                             ; preds = %OP453.JUMPDEST
  %stack_len1569 = load i64, ptr %len.addr, align 8
  %1186 = icmp ugt i64 %stack_len1569, 1022
  br i1 %1186, label %return, label %OP453.JUMPDEST.contd1570, !prof !2, !annotation !4

OP453.JUMPDEST.contd1570:                         ; preds = %OP453.JUMPDEST.contd
  br label %OP454.CALLVALUE, !annotation !5

OP454.CALLVALUE:                                  ; preds = %OP453.JUMPDEST.contd1570
  %stack_len1571 = load i64, ptr %len.addr, align 8
  %1187 = add i64 %stack_len1571, 1
  store i64 %1187, ptr %len.addr, align 8
  %contract.call_value.addr1572 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1573 = load i256, ptr %contract.call_value.addr1572, align 16
  %sp1574 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1571
  store i256 %contract.call_value1573, ptr %sp1574, align 16
  br label %OP455.ISZERO, !annotation !5

OP455.ISZERO:                                     ; preds = %OP454.CALLVALUE
  %stack_len1575 = load i64, ptr %len.addr, align 8
  %1188 = add i64 %stack_len1575, -1
  %sp1576 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1188
  %a1577 = load i256, ptr %sp1576, align 16
  %1189 = icmp eq i256 %a1577, 0
  %1190 = zext i1 %1189 to i256
  %1191 = add i64 %stack_len1575, -1
  %sp1578 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1191
  store i256 %1190, ptr %sp1578, align 16
  br label %OP456.PUSH2, !annotation !5

OP456.PUSH2:                                      ; preds = %OP455.ISZERO
  br label %OP457.JUMPI, !annotation !6

OP457.JUMPI:                                      ; preds = %OP456.PUSH2
  %stack_len1579 = load i64, ptr %len.addr, align 8
  %1192 = add i64 %stack_len1579, -1
  store i64 %1192, ptr %len.addr, align 8
  %1193 = add i64 %stack_len1579, -1
  %sp1580 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1193
  %a1581 = load i256, ptr %sp1580, align 16
  %1194 = icmp ne i256 %a1581, 0
  br i1 %1194, label %OP461.JUMPDEST, label %OP458.PUSH1

OP458.PUSH1:                                      ; preds = %OP457.JUMPI
  %gas.remaining1582 = load i64, ptr %gas.remaining.addr, align 8
  %1195 = sub i64 %gas.remaining1582, 6
  %1196 = icmp ult i64 %gas.remaining1582, 6
  store i64 %1195, ptr %gas.remaining.addr, align 8
  br i1 %1196, label %return, label %OP458.PUSH1.contd, !prof !2, !annotation !3

OP458.PUSH1.contd:                                ; preds = %OP458.PUSH1
  %stack_len1583 = load i64, ptr %len.addr, align 8
  %1197 = icmp ugt i64 %stack_len1583, 1022
  br i1 %1197, label %return, label %OP458.PUSH1.contd1584, !prof !2, !annotation !4

OP458.PUSH1.contd1584:                            ; preds = %OP458.PUSH1.contd
  %1198 = add i64 %stack_len1583, 1
  store i64 %1198, ptr %len.addr, align 8
  %sp1585 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1583
  store i256 0, ptr %sp1585, align 16
  br label %OP459.DUP1, !annotation !5

OP459.DUP1:                                       ; preds = %OP458.PUSH1.contd1584
  %stack_len1586 = load i64, ptr %len.addr, align 8
  %1199 = add i64 %stack_len1586, 1
  store i64 %1199, ptr %len.addr, align 8
  %1200 = sub i64 %stack_len1586, 1
  %sp1587 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1200
  %dup11588 = load i256, ptr %sp1587, align 16
  %sp1589 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1586
  store i256 %dup11588, ptr %sp1589, align 16
  br label %OP460.REVERT, !annotation !5

OP460.REVERT:                                     ; preds = %OP459.DUP1
  %stack_len1590 = load i64, ptr %len.addr, align 8
  %1201 = add i64 %stack_len1590, -2
  store i64 %1201, ptr %len.addr, align 8
  %1202 = sub i64 %stack_len1590, 2
  %sp1591 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1202
  %1203 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1591, i8 16)
  %1204 = icmp ne i8 %1203, 0
  br i1 %1204, label %return, label %OP460.REVERT.contd, !prof !2

OP460.REVERT.contd:                               ; preds = %OP460.REVERT
  br label %return, !annotation !8

OP461.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP457.JUMPI
  %gas.remaining1592 = load i64, ptr %gas.remaining.addr, align 8
  %1205 = sub i64 %gas.remaining1592, 15
  %1206 = icmp ult i64 %gas.remaining1592, 15
  store i64 %1205, ptr %gas.remaining.addr, align 8
  br i1 %1206, label %return, label %OP461.JUMPDEST.contd, !prof !2, !annotation !3

OP461.JUMPDEST.contd:                             ; preds = %OP461.JUMPDEST
  %stack_len1593 = load i64, ptr %len.addr, align 8
  %1207 = icmp ugt i64 %stack_len1593, 1022
  br i1 %1207, label %return, label %OP461.JUMPDEST.contd1594, !prof !2, !annotation !4

OP461.JUMPDEST.contd1594:                         ; preds = %OP461.JUMPDEST.contd
  br label %OP462.PUSH2, !annotation !5

OP462.PUSH2:                                      ; preds = %OP461.JUMPDEST.contd1594
  %stack_len1595 = load i64, ptr %len.addr, align 8
  %1208 = add i64 %stack_len1595, 1
  store i64 %1208, ptr %len.addr, align 8
  %sp1596 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1595
  store i256 757, ptr %sp1596, align 16
  br label %OP463.PUSH2, !annotation !5

OP463.PUSH2:                                      ; preds = %OP462.PUSH2
  br label %OP464.JUMP, !annotation !6

OP464.JUMP:                                       ; preds = %OP463.PUSH2
  %stack_len1597 = load i64, ptr %len.addr, align 8
  br label %OP1388.JUMPDEST

OP465.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1598 = load i64, ptr %gas.remaining.addr, align 8
  %1209 = sub i64 %gas.remaining1598, 93
  %1210 = icmp ult i64 %gas.remaining1598, 93
  store i64 %1209, ptr %gas.remaining.addr, align 8
  br i1 %1210, label %return, label %OP465.JUMPDEST.contd, !prof !2, !annotation !3

OP465.JUMPDEST.contd:                             ; preds = %OP465.JUMPDEST
  %stack_len1599 = load i64, ptr %len.addr, align 8
  %1211 = icmp ult i64 %stack_len1599, 1
  %1212 = icmp ugt i64 %stack_len1599, 1015
  %1213 = or i1 %1211, %1212
  %1214 = select i1 %1211, i8 91, i8 92
  br i1 %1213, label %return, label %OP465.JUMPDEST.contd1600, !prof !2

OP465.JUMPDEST.contd1600:                         ; preds = %OP465.JUMPDEST.contd
  br label %OP466.PUSH1, !annotation !5

OP466.PUSH1:                                      ; preds = %OP465.JUMPDEST.contd1600
  %stack_len1601 = load i64, ptr %len.addr, align 8
  %1215 = add i64 %stack_len1601, 1
  store i64 %1215, ptr %len.addr, align 8
  %sp1602 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1601
  store i256 64, ptr %sp1602, align 16
  br label %OP467.MLOAD, !annotation !5

OP467.MLOAD:                                      ; preds = %OP466.PUSH1
  %stack_len1603 = load i64, ptr %len.addr, align 8
  %1216 = add i64 %stack_len1603, -1
  %sp1604 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1216
  %a1605 = load i256, ptr %sp1604, align 16
  %mload.out.slot1606 = alloca i256, align 16
  %1217 = call i8 @__revmc_ir_builtin_mload(i256 %a1605, ptr %mload.out.slot1606, ptr %arg.ecx.addr)
  %1218 = icmp ne i8 %1217, 0
  br i1 %1218, label %return, label %OP467.MLOAD.contd, !prof !2

OP467.MLOAD.contd:                                ; preds = %OP467.MLOAD
  %mload.out1607 = load i256, ptr %mload.out.slot1606, align 16
  %1219 = add i64 %stack_len1603, -1
  %sp1608 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1219
  store i256 %mload.out1607, ptr %sp1608, align 16
  br label %OP468.DUP1, !annotation !5

OP468.DUP1:                                       ; preds = %OP467.MLOAD.contd
  %stack_len1609 = load i64, ptr %len.addr, align 8
  %1220 = add i64 %stack_len1609, 1
  store i64 %1220, ptr %len.addr, align 8
  %1221 = sub i64 %stack_len1609, 1
  %sp1610 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1221
  %dup11611 = load i256, ptr %sp1610, align 16
  %sp1612 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1609
  store i256 %dup11611, ptr %sp1612, align 16
  br label %OP469.DUP1, !annotation !5

OP469.DUP1:                                       ; preds = %OP468.DUP1
  %stack_len1613 = load i64, ptr %len.addr, align 8
  %1222 = add i64 %stack_len1613, 1
  store i64 %1222, ptr %len.addr, align 8
  %1223 = sub i64 %stack_len1613, 1
  %sp1614 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1223
  %dup11615 = load i256, ptr %sp1614, align 16
  %sp1616 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1613
  store i256 %dup11615, ptr %sp1616, align 16
  br label %OP470.PUSH1, !annotation !5

OP470.PUSH1:                                      ; preds = %OP469.DUP1
  %stack_len1617 = load i64, ptr %len.addr, align 8
  %1224 = add i64 %stack_len1617, 1
  store i64 %1224, ptr %len.addr, align 8
  %sp1618 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1617
  store i256 32, ptr %sp1618, align 16
  br label %OP471.ADD, !annotation !5

OP471.ADD:                                        ; preds = %OP470.PUSH1
  %stack_len1619 = load i64, ptr %len.addr, align 8
  %1225 = add i64 %stack_len1619, -1
  store i64 %1225, ptr %len.addr, align 8
  %1226 = add i64 %stack_len1619, -1
  %sp1620 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1226
  %a1621 = load i256, ptr %sp1620, align 16
  %1227 = add i64 %stack_len1619, -2
  %sp1622 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1227
  %b1623 = load i256, ptr %sp1622, align 16
  %1228 = add i256 %a1621, %b1623
  %1229 = add i64 %stack_len1619, -2
  %sp1624 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1229
  store i256 %1228, ptr %sp1624, align 16
  br label %OP472.DUP3, !annotation !5

OP472.DUP3:                                       ; preds = %OP471.ADD
  %stack_len1625 = load i64, ptr %len.addr, align 8
  %1230 = add i64 %stack_len1625, 1
  store i64 %1230, ptr %len.addr, align 8
  %1231 = sub i64 %stack_len1625, 3
  %sp1626 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1231
  %dup31627 = load i256, ptr %sp1626, align 16
  %sp1628 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1625
  store i256 %dup31627, ptr %sp1628, align 16
  br label %OP473.DUP2, !annotation !5

OP473.DUP2:                                       ; preds = %OP472.DUP3
  %stack_len1629 = load i64, ptr %len.addr, align 8
  %1232 = add i64 %stack_len1629, 1
  store i64 %1232, ptr %len.addr, align 8
  %1233 = sub i64 %stack_len1629, 2
  %sp1630 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1233
  %dup21631 = load i256, ptr %sp1630, align 16
  %sp1632 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1629
  store i256 %dup21631, ptr %sp1632, align 16
  br label %OP474.SUB, !annotation !5

OP474.SUB:                                        ; preds = %OP473.DUP2
  %stack_len1633 = load i64, ptr %len.addr, align 8
  %1234 = add i64 %stack_len1633, -1
  store i64 %1234, ptr %len.addr, align 8
  %1235 = add i64 %stack_len1633, -1
  %sp1634 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1235
  %a1635 = load i256, ptr %sp1634, align 16
  %1236 = add i64 %stack_len1633, -2
  %sp1636 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1236
  %b1637 = load i256, ptr %sp1636, align 16
  %1237 = sub i256 %a1635, %b1637
  %1238 = add i64 %stack_len1633, -2
  %sp1638 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1238
  store i256 %1237, ptr %sp1638, align 16
  br label %OP475.DUP3, !annotation !5

OP475.DUP3:                                       ; preds = %OP474.SUB
  %stack_len1639 = load i64, ptr %len.addr, align 8
  %1239 = add i64 %stack_len1639, 1
  store i64 %1239, ptr %len.addr, align 8
  %1240 = sub i64 %stack_len1639, 3
  %sp1640 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1240
  %dup31641 = load i256, ptr %sp1640, align 16
  %sp1642 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1639
  store i256 %dup31641, ptr %sp1642, align 16
  br label %OP476.MSTORE, !annotation !5

OP476.MSTORE:                                     ; preds = %OP475.DUP3
  %stack_len1643 = load i64, ptr %len.addr, align 8
  %1241 = add i64 %stack_len1643, -2
  store i64 %1241, ptr %len.addr, align 8
  %1242 = add i64 %stack_len1643, -1
  %sp1644 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1242
  %a1645 = load i256, ptr %sp1644, align 16
  %1243 = add i64 %stack_len1643, -2
  %sp1646 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1243
  %b1647 = load i256, ptr %sp1646, align 16
  %1244 = call i8 @__revmc_ir_builtin_mstore(i256 %a1645, i256 %b1647, ptr %arg.ecx.addr)
  %1245 = icmp ne i8 %1244, 0
  br i1 %1245, label %return, label %OP476.MSTORE.contd, !prof !2

OP476.MSTORE.contd:                               ; preds = %OP476.MSTORE
  br label %OP477.DUP4, !annotation !5

OP477.DUP4:                                       ; preds = %OP476.MSTORE.contd
  %stack_len1648 = load i64, ptr %len.addr, align 8
  %1246 = add i64 %stack_len1648, 1
  store i64 %1246, ptr %len.addr, align 8
  %1247 = sub i64 %stack_len1648, 4
  %sp1649 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1247
  %dup41650 = load i256, ptr %sp1649, align 16
  %sp1651 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1648
  store i256 %dup41650, ptr %sp1651, align 16
  br label %OP478.DUP2, !annotation !5

OP478.DUP2:                                       ; preds = %OP477.DUP4
  %stack_len1652 = load i64, ptr %len.addr, align 8
  %1248 = add i64 %stack_len1652, 1
  store i64 %1248, ptr %len.addr, align 8
  %1249 = sub i64 %stack_len1652, 2
  %sp1653 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1249
  %dup21654 = load i256, ptr %sp1653, align 16
  %sp1655 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1652
  store i256 %dup21654, ptr %sp1655, align 16
  br label %OP479.DUP2, !annotation !5

OP479.DUP2:                                       ; preds = %OP478.DUP2
  %stack_len1656 = load i64, ptr %len.addr, align 8
  %1250 = add i64 %stack_len1656, 1
  store i64 %1250, ptr %len.addr, align 8
  %1251 = sub i64 %stack_len1656, 2
  %sp1657 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1251
  %dup21658 = load i256, ptr %sp1657, align 16
  %sp1659 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1656
  store i256 %dup21658, ptr %sp1659, align 16
  br label %OP480.MLOAD, !annotation !5

OP480.MLOAD:                                      ; preds = %OP479.DUP2
  %stack_len1660 = load i64, ptr %len.addr, align 8
  %1252 = add i64 %stack_len1660, -1
  %sp1661 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1252
  %a1662 = load i256, ptr %sp1661, align 16
  %mload.out.slot1663 = alloca i256, align 16
  %1253 = call i8 @__revmc_ir_builtin_mload(i256 %a1662, ptr %mload.out.slot1663, ptr %arg.ecx.addr)
  %1254 = icmp ne i8 %1253, 0
  br i1 %1254, label %return, label %OP480.MLOAD.contd, !prof !2

OP480.MLOAD.contd:                                ; preds = %OP480.MLOAD
  %mload.out1664 = load i256, ptr %mload.out.slot1663, align 16
  %1255 = add i64 %stack_len1660, -1
  %sp1665 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1255
  store i256 %mload.out1664, ptr %sp1665, align 16
  br label %OP481.DUP2, !annotation !5

OP481.DUP2:                                       ; preds = %OP480.MLOAD.contd
  %stack_len1666 = load i64, ptr %len.addr, align 8
  %1256 = add i64 %stack_len1666, 1
  store i64 %1256, ptr %len.addr, align 8
  %1257 = sub i64 %stack_len1666, 2
  %sp1667 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1257
  %dup21668 = load i256, ptr %sp1667, align 16
  %sp1669 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1666
  store i256 %dup21668, ptr %sp1669, align 16
  br label %OP482.MSTORE, !annotation !5

OP482.MSTORE:                                     ; preds = %OP481.DUP2
  %stack_len1670 = load i64, ptr %len.addr, align 8
  %1258 = add i64 %stack_len1670, -2
  store i64 %1258, ptr %len.addr, align 8
  %1259 = add i64 %stack_len1670, -1
  %sp1671 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1259
  %a1672 = load i256, ptr %sp1671, align 16
  %1260 = add i64 %stack_len1670, -2
  %sp1673 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1260
  %b1674 = load i256, ptr %sp1673, align 16
  %1261 = call i8 @__revmc_ir_builtin_mstore(i256 %a1672, i256 %b1674, ptr %arg.ecx.addr)
  %1262 = icmp ne i8 %1261, 0
  br i1 %1262, label %return, label %OP482.MSTORE.contd, !prof !2

OP482.MSTORE.contd:                               ; preds = %OP482.MSTORE
  br label %OP483.PUSH1, !annotation !5

OP483.PUSH1:                                      ; preds = %OP482.MSTORE.contd
  %stack_len1675 = load i64, ptr %len.addr, align 8
  %1263 = add i64 %stack_len1675, 1
  store i64 %1263, ptr %len.addr, align 8
  %sp1676 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1675
  store i256 32, ptr %sp1676, align 16
  br label %OP484.ADD, !annotation !5

OP484.ADD:                                        ; preds = %OP483.PUSH1
  %stack_len1677 = load i64, ptr %len.addr, align 8
  %1264 = add i64 %stack_len1677, -1
  store i64 %1264, ptr %len.addr, align 8
  %1265 = add i64 %stack_len1677, -1
  %sp1678 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1265
  %a1679 = load i256, ptr %sp1678, align 16
  %1266 = add i64 %stack_len1677, -2
  %sp1680 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1266
  %b1681 = load i256, ptr %sp1680, align 16
  %1267 = add i256 %a1679, %b1681
  %1268 = add i64 %stack_len1677, -2
  %sp1682 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1268
  store i256 %1267, ptr %sp1682, align 16
  br label %OP485.SWAP2, !annotation !5

OP485.SWAP2:                                      ; preds = %OP484.ADD
  %stack_len1683 = load i64, ptr %len.addr, align 8
  %1269 = sub i64 %stack_len1683, 1
  %sp1684 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1269
  %swap.a1685 = load i256, ptr %sp1684, align 16
  %1270 = sub i64 %stack_len1683, 3
  %sp1686 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1270
  %swap.b1687 = load i256, ptr %sp1686, align 16
  store i256 %swap.a1685, ptr %sp1686, align 16
  store i256 %swap.b1687, ptr %sp1684, align 16
  br label %OP486.POP, !annotation !5

OP486.POP:                                        ; preds = %OP485.SWAP2
  %stack_len1688 = load i64, ptr %len.addr, align 8
  %1271 = add i64 %stack_len1688, -1
  store i64 %1271, ptr %len.addr, align 8
  br label %OP487.DUP1, !annotation !5

OP487.DUP1:                                       ; preds = %OP486.POP
  %stack_len1689 = load i64, ptr %len.addr, align 8
  %1272 = add i64 %stack_len1689, 1
  store i64 %1272, ptr %len.addr, align 8
  %1273 = sub i64 %stack_len1689, 1
  %sp1690 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1273
  %dup11691 = load i256, ptr %sp1690, align 16
  %sp1692 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1689
  store i256 %dup11691, ptr %sp1692, align 16
  br label %OP488.MLOAD, !annotation !5

OP488.MLOAD:                                      ; preds = %OP487.DUP1
  %stack_len1693 = load i64, ptr %len.addr, align 8
  %1274 = add i64 %stack_len1693, -1
  %sp1694 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1274
  %a1695 = load i256, ptr %sp1694, align 16
  %mload.out.slot1696 = alloca i256, align 16
  %1275 = call i8 @__revmc_ir_builtin_mload(i256 %a1695, ptr %mload.out.slot1696, ptr %arg.ecx.addr)
  %1276 = icmp ne i8 %1275, 0
  br i1 %1276, label %return, label %OP488.MLOAD.contd, !prof !2

OP488.MLOAD.contd:                                ; preds = %OP488.MLOAD
  %mload.out1697 = load i256, ptr %mload.out.slot1696, align 16
  %1277 = add i64 %stack_len1693, -1
  %sp1698 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1277
  store i256 %mload.out1697, ptr %sp1698, align 16
  br label %OP489.SWAP1, !annotation !5

OP489.SWAP1:                                      ; preds = %OP488.MLOAD.contd
  %stack_len1699 = load i64, ptr %len.addr, align 8
  %1278 = sub i64 %stack_len1699, 1
  %sp1700 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1278
  %swap.a1701 = load i256, ptr %sp1700, align 16
  %1279 = sub i64 %stack_len1699, 2
  %sp1702 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1279
  %swap.b1703 = load i256, ptr %sp1702, align 16
  store i256 %swap.a1701, ptr %sp1702, align 16
  store i256 %swap.b1703, ptr %sp1700, align 16
  br label %OP490.PUSH1, !annotation !5

OP490.PUSH1:                                      ; preds = %OP489.SWAP1
  %stack_len1704 = load i64, ptr %len.addr, align 8
  %1280 = add i64 %stack_len1704, 1
  store i64 %1280, ptr %len.addr, align 8
  %sp1705 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1704
  store i256 32, ptr %sp1705, align 16
  br label %OP491.ADD, !annotation !5

OP491.ADD:                                        ; preds = %OP490.PUSH1
  %stack_len1706 = load i64, ptr %len.addr, align 8
  %1281 = add i64 %stack_len1706, -1
  store i64 %1281, ptr %len.addr, align 8
  %1282 = add i64 %stack_len1706, -1
  %sp1707 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1282
  %a1708 = load i256, ptr %sp1707, align 16
  %1283 = add i64 %stack_len1706, -2
  %sp1709 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1283
  %b1710 = load i256, ptr %sp1709, align 16
  %1284 = add i256 %a1708, %b1710
  %1285 = add i64 %stack_len1706, -2
  %sp1711 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1285
  store i256 %1284, ptr %sp1711, align 16
  br label %OP492.SWAP1, !annotation !5

OP492.SWAP1:                                      ; preds = %OP491.ADD
  %stack_len1712 = load i64, ptr %len.addr, align 8
  %1286 = sub i64 %stack_len1712, 1
  %sp1713 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1286
  %swap.a1714 = load i256, ptr %sp1713, align 16
  %1287 = sub i64 %stack_len1712, 2
  %sp1715 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1287
  %swap.b1716 = load i256, ptr %sp1715, align 16
  store i256 %swap.a1714, ptr %sp1715, align 16
  store i256 %swap.b1716, ptr %sp1713, align 16
  br label %OP493.DUP1, !annotation !5

OP493.DUP1:                                       ; preds = %OP492.SWAP1
  %stack_len1717 = load i64, ptr %len.addr, align 8
  %1288 = add i64 %stack_len1717, 1
  store i64 %1288, ptr %len.addr, align 8
  %1289 = sub i64 %stack_len1717, 1
  %sp1718 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1289
  %dup11719 = load i256, ptr %sp1718, align 16
  %sp1720 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1717
  store i256 %dup11719, ptr %sp1720, align 16
  br label %OP494.DUP4, !annotation !5

OP494.DUP4:                                       ; preds = %OP493.DUP1
  %stack_len1721 = load i64, ptr %len.addr, align 8
  %1290 = add i64 %stack_len1721, 1
  store i64 %1290, ptr %len.addr, align 8
  %1291 = sub i64 %stack_len1721, 4
  %sp1722 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1291
  %dup41723 = load i256, ptr %sp1722, align 16
  %sp1724 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1721
  store i256 %dup41723, ptr %sp1724, align 16
  br label %OP495.DUP4, !annotation !5

OP495.DUP4:                                       ; preds = %OP494.DUP4
  %stack_len1725 = load i64, ptr %len.addr, align 8
  %1292 = add i64 %stack_len1725, 1
  store i64 %1292, ptr %len.addr, align 8
  %1293 = sub i64 %stack_len1725, 4
  %sp1726 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1293
  %dup41727 = load i256, ptr %sp1726, align 16
  %sp1728 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1725
  store i256 %dup41727, ptr %sp1728, align 16
  br label %OP496.PUSH1, !annotation !5

OP496.PUSH1:                                      ; preds = %OP495.DUP4
  %stack_len1729 = load i64, ptr %len.addr, align 8
  %1294 = add i64 %stack_len1729, 1
  store i64 %1294, ptr %len.addr, align 8
  %sp1730 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1729
  store i256 0, ptr %sp1730, align 16
  br label %OP497.JUMPDEST, !annotation !5

OP497.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP518.JUMP, %OP496.PUSH1
  %gas.remaining1731 = load i64, ptr %gas.remaining.addr, align 8
  %1295 = sub i64 %gas.remaining1731, 26
  %1296 = icmp ult i64 %gas.remaining1731, 26
  store i64 %1295, ptr %gas.remaining.addr, align 8
  br i1 %1296, label %return, label %OP497.JUMPDEST.contd, !prof !2, !annotation !3

OP497.JUMPDEST.contd:                             ; preds = %OP497.JUMPDEST
  %stack_len1732 = load i64, ptr %len.addr, align 8
  %1297 = icmp ult i64 %stack_len1732, 4
  %1298 = icmp ugt i64 %stack_len1732, 1022
  %1299 = or i1 %1297, %1298
  %1300 = select i1 %1297, i8 91, i8 92
  br i1 %1299, label %return, label %OP497.JUMPDEST.contd1733, !prof !2

OP497.JUMPDEST.contd1733:                         ; preds = %OP497.JUMPDEST.contd
  br label %OP498.DUP4, !annotation !5

OP498.DUP4:                                       ; preds = %OP497.JUMPDEST.contd1733
  %stack_len1734 = load i64, ptr %len.addr, align 8
  %1301 = add i64 %stack_len1734, 1
  store i64 %1301, ptr %len.addr, align 8
  %1302 = sub i64 %stack_len1734, 4
  %sp1735 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1302
  %dup41736 = load i256, ptr %sp1735, align 16
  %sp1737 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1734
  store i256 %dup41736, ptr %sp1737, align 16
  br label %OP499.DUP2, !annotation !5

OP499.DUP2:                                       ; preds = %OP498.DUP4
  %stack_len1738 = load i64, ptr %len.addr, align 8
  %1303 = add i64 %stack_len1738, 1
  store i64 %1303, ptr %len.addr, align 8
  %1304 = sub i64 %stack_len1738, 2
  %sp1739 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1304
  %dup21740 = load i256, ptr %sp1739, align 16
  %sp1741 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1738
  store i256 %dup21740, ptr %sp1741, align 16
  br label %OP500.LT, !annotation !5

OP500.LT:                                         ; preds = %OP499.DUP2
  %stack_len1742 = load i64, ptr %len.addr, align 8
  %1305 = add i64 %stack_len1742, -1
  store i64 %1305, ptr %len.addr, align 8
  %1306 = add i64 %stack_len1742, -1
  %sp1743 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1306
  %a1744 = load i256, ptr %sp1743, align 16
  %1307 = add i64 %stack_len1742, -2
  %sp1745 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1307
  %b1746 = load i256, ptr %sp1745, align 16
  %1308 = icmp ult i256 %a1744, %b1746
  %1309 = zext i1 %1308 to i256
  %1310 = add i64 %stack_len1742, -2
  %sp1747 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1310
  store i256 %1309, ptr %sp1747, align 16
  br label %OP501.ISZERO, !annotation !5

OP501.ISZERO:                                     ; preds = %OP500.LT
  %stack_len1748 = load i64, ptr %len.addr, align 8
  %1311 = add i64 %stack_len1748, -1
  %sp1749 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1311
  %a1750 = load i256, ptr %sp1749, align 16
  %1312 = icmp eq i256 %a1750, 0
  %1313 = zext i1 %1312 to i256
  %1314 = add i64 %stack_len1748, -1
  %sp1751 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1314
  store i256 %1313, ptr %sp1751, align 16
  br label %OP502.PUSH2, !annotation !5

OP502.PUSH2:                                      ; preds = %OP501.ISZERO
  br label %OP503.JUMPI, !annotation !6

OP503.JUMPI:                                      ; preds = %OP502.PUSH2
  %stack_len1752 = load i64, ptr %len.addr, align 8
  %1315 = add i64 %stack_len1752, -1
  store i64 %1315, ptr %len.addr, align 8
  %1316 = add i64 %stack_len1752, -1
  %sp1753 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1316
  %a1754 = load i256, ptr %sp1753, align 16
  %1317 = icmp ne i256 %a1754, 0
  br i1 %1317, label %OP519.JUMPDEST, label %OP504.DUP1

OP504.DUP1:                                       ; preds = %OP503.JUMPI
  %gas.remaining1755 = load i64, ptr %gas.remaining.addr, align 8
  %1318 = sub i64 %gas.remaining1755, 49
  %1319 = icmp ult i64 %gas.remaining1755, 49
  store i64 %1318, ptr %gas.remaining.addr, align 8
  br i1 %1319, label %return, label %OP504.DUP1.contd, !prof !2, !annotation !3

OP504.DUP1.contd:                                 ; preds = %OP504.DUP1
  %stack_len1756 = load i64, ptr %len.addr, align 8
  %1320 = icmp ult i64 %stack_len1756, 3
  %1321 = icmp ugt i64 %stack_len1756, 1021
  %1322 = or i1 %1320, %1321
  %1323 = select i1 %1320, i8 91, i8 92
  br i1 %1322, label %return, label %OP504.DUP1.contd1757, !prof !2

OP504.DUP1.contd1757:                             ; preds = %OP504.DUP1.contd
  %1324 = add i64 %stack_len1756, 1
  store i64 %1324, ptr %len.addr, align 8
  %1325 = sub i64 %stack_len1756, 1
  %sp1758 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1325
  %dup11759 = load i256, ptr %sp1758, align 16
  %sp1760 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1756
  store i256 %dup11759, ptr %sp1760, align 16
  br label %OP505.DUP3, !annotation !5

OP505.DUP3:                                       ; preds = %OP504.DUP1.contd1757
  %stack_len1761 = load i64, ptr %len.addr, align 8
  %1326 = add i64 %stack_len1761, 1
  store i64 %1326, ptr %len.addr, align 8
  %1327 = sub i64 %stack_len1761, 3
  %sp1762 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1327
  %dup31763 = load i256, ptr %sp1762, align 16
  %sp1764 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1761
  store i256 %dup31763, ptr %sp1764, align 16
  br label %OP506.ADD, !annotation !5

OP506.ADD:                                        ; preds = %OP505.DUP3
  %stack_len1765 = load i64, ptr %len.addr, align 8
  %1328 = add i64 %stack_len1765, -1
  store i64 %1328, ptr %len.addr, align 8
  %1329 = add i64 %stack_len1765, -1
  %sp1766 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1329
  %a1767 = load i256, ptr %sp1766, align 16
  %1330 = add i64 %stack_len1765, -2
  %sp1768 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1330
  %b1769 = load i256, ptr %sp1768, align 16
  %1331 = add i256 %a1767, %b1769
  %1332 = add i64 %stack_len1765, -2
  %sp1770 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1332
  store i256 %1331, ptr %sp1770, align 16
  br label %OP507.MLOAD, !annotation !5

OP507.MLOAD:                                      ; preds = %OP506.ADD
  %stack_len1771 = load i64, ptr %len.addr, align 8
  %1333 = add i64 %stack_len1771, -1
  %sp1772 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1333
  %a1773 = load i256, ptr %sp1772, align 16
  %mload.out.slot1774 = alloca i256, align 16
  %1334 = call i8 @__revmc_ir_builtin_mload(i256 %a1773, ptr %mload.out.slot1774, ptr %arg.ecx.addr)
  %1335 = icmp ne i8 %1334, 0
  br i1 %1335, label %return, label %OP507.MLOAD.contd, !prof !2

OP507.MLOAD.contd:                                ; preds = %OP507.MLOAD
  %mload.out1775 = load i256, ptr %mload.out.slot1774, align 16
  %1336 = add i64 %stack_len1771, -1
  %sp1776 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1336
  store i256 %mload.out1775, ptr %sp1776, align 16
  br label %OP508.DUP2, !annotation !5

OP508.DUP2:                                       ; preds = %OP507.MLOAD.contd
  %stack_len1777 = load i64, ptr %len.addr, align 8
  %1337 = add i64 %stack_len1777, 1
  store i64 %1337, ptr %len.addr, align 8
  %1338 = sub i64 %stack_len1777, 2
  %sp1778 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1338
  %dup21779 = load i256, ptr %sp1778, align 16
  %sp1780 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1777
  store i256 %dup21779, ptr %sp1780, align 16
  br label %OP509.DUP5, !annotation !5

OP509.DUP5:                                       ; preds = %OP508.DUP2
  %stack_len1781 = load i64, ptr %len.addr, align 8
  %1339 = add i64 %stack_len1781, 1
  store i64 %1339, ptr %len.addr, align 8
  %1340 = sub i64 %stack_len1781, 5
  %sp1782 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1340
  %dup51783 = load i256, ptr %sp1782, align 16
  %sp1784 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1781
  store i256 %dup51783, ptr %sp1784, align 16
  br label %OP510.ADD, !annotation !5

OP510.ADD:                                        ; preds = %OP509.DUP5
  %stack_len1785 = load i64, ptr %len.addr, align 8
  %1341 = add i64 %stack_len1785, -1
  store i64 %1341, ptr %len.addr, align 8
  %1342 = add i64 %stack_len1785, -1
  %sp1786 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1342
  %a1787 = load i256, ptr %sp1786, align 16
  %1343 = add i64 %stack_len1785, -2
  %sp1788 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1343
  %b1789 = load i256, ptr %sp1788, align 16
  %1344 = add i256 %a1787, %b1789
  %1345 = add i64 %stack_len1785, -2
  %sp1790 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1345
  store i256 %1344, ptr %sp1790, align 16
  br label %OP511.MSTORE, !annotation !5

OP511.MSTORE:                                     ; preds = %OP510.ADD
  %stack_len1791 = load i64, ptr %len.addr, align 8
  %1346 = add i64 %stack_len1791, -2
  store i64 %1346, ptr %len.addr, align 8
  %1347 = add i64 %stack_len1791, -1
  %sp1792 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1347
  %a1793 = load i256, ptr %sp1792, align 16
  %1348 = add i64 %stack_len1791, -2
  %sp1794 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1348
  %b1795 = load i256, ptr %sp1794, align 16
  %1349 = call i8 @__revmc_ir_builtin_mstore(i256 %a1793, i256 %b1795, ptr %arg.ecx.addr)
  %1350 = icmp ne i8 %1349, 0
  br i1 %1350, label %return, label %OP511.MSTORE.contd, !prof !2

OP511.MSTORE.contd:                               ; preds = %OP511.MSTORE
  br label %OP512.PUSH1, !annotation !5

OP512.PUSH1:                                      ; preds = %OP511.MSTORE.contd
  %stack_len1796 = load i64, ptr %len.addr, align 8
  %1351 = add i64 %stack_len1796, 1
  store i64 %1351, ptr %len.addr, align 8
  %sp1797 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1796
  store i256 32, ptr %sp1797, align 16
  br label %OP513.DUP2, !annotation !5

OP513.DUP2:                                       ; preds = %OP512.PUSH1
  %stack_len1798 = load i64, ptr %len.addr, align 8
  %1352 = add i64 %stack_len1798, 1
  store i64 %1352, ptr %len.addr, align 8
  %1353 = sub i64 %stack_len1798, 2
  %sp1799 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1353
  %dup21800 = load i256, ptr %sp1799, align 16
  %sp1801 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1798
  store i256 %dup21800, ptr %sp1801, align 16
  br label %OP514.ADD, !annotation !5

OP514.ADD:                                        ; preds = %OP513.DUP2
  %stack_len1802 = load i64, ptr %len.addr, align 8
  %1354 = add i64 %stack_len1802, -1
  store i64 %1354, ptr %len.addr, align 8
  %1355 = add i64 %stack_len1802, -1
  %sp1803 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1355
  %a1804 = load i256, ptr %sp1803, align 16
  %1356 = add i64 %stack_len1802, -2
  %sp1805 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1356
  %b1806 = load i256, ptr %sp1805, align 16
  %1357 = add i256 %a1804, %b1806
  %1358 = add i64 %stack_len1802, -2
  %sp1807 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1358
  store i256 %1357, ptr %sp1807, align 16
  br label %OP515.SWAP1, !annotation !5

OP515.SWAP1:                                      ; preds = %OP514.ADD
  %stack_len1808 = load i64, ptr %len.addr, align 8
  %1359 = sub i64 %stack_len1808, 1
  %sp1809 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1359
  %swap.a1810 = load i256, ptr %sp1809, align 16
  %1360 = sub i64 %stack_len1808, 2
  %sp1811 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1360
  %swap.b1812 = load i256, ptr %sp1811, align 16
  store i256 %swap.a1810, ptr %sp1811, align 16
  store i256 %swap.b1812, ptr %sp1809, align 16
  br label %OP516.POP, !annotation !5

OP516.POP:                                        ; preds = %OP515.SWAP1
  %stack_len1813 = load i64, ptr %len.addr, align 8
  %1361 = add i64 %stack_len1813, -1
  store i64 %1361, ptr %len.addr, align 8
  br label %OP517.PUSH2, !annotation !5

OP517.PUSH2:                                      ; preds = %OP516.POP
  br label %OP518.JUMP, !annotation !6

OP518.JUMP:                                       ; preds = %OP517.PUSH2
  %stack_len1814 = load i64, ptr %len.addr, align 8
  br label %OP497.JUMPDEST

OP519.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP503.JUMPI
  %gas.remaining1815 = load i64, ptr %gas.remaining.addr, align 8
  %1362 = sub i64 %gas.remaining1815, 51
  %1363 = icmp ult i64 %gas.remaining1815, 51
  store i64 %1362, ptr %gas.remaining.addr, align 8
  br i1 %1363, label %return, label %OP519.JUMPDEST.contd, !prof !2, !annotation !3

OP519.JUMPDEST.contd:                             ; preds = %OP519.JUMPDEST
  %stack_len1816 = load i64, ptr %len.addr, align 8
  %1364 = icmp ult i64 %stack_len1816, 7
  br i1 %1364, label %return, label %OP519.JUMPDEST.contd1817, !prof !2, !annotation !9

OP519.JUMPDEST.contd1817:                         ; preds = %OP519.JUMPDEST.contd
  br label %OP520.POP, !annotation !5

OP520.POP:                                        ; preds = %OP519.JUMPDEST.contd1817
  %stack_len1818 = load i64, ptr %len.addr, align 8
  %1365 = add i64 %stack_len1818, -1
  store i64 %1365, ptr %len.addr, align 8
  br label %OP521.POP, !annotation !5

OP521.POP:                                        ; preds = %OP520.POP
  %stack_len1819 = load i64, ptr %len.addr, align 8
  %1366 = add i64 %stack_len1819, -1
  store i64 %1366, ptr %len.addr, align 8
  br label %OP522.POP, !annotation !5

OP522.POP:                                        ; preds = %OP521.POP
  %stack_len1820 = load i64, ptr %len.addr, align 8
  %1367 = add i64 %stack_len1820, -1
  store i64 %1367, ptr %len.addr, align 8
  br label %OP523.POP, !annotation !5

OP523.POP:                                        ; preds = %OP522.POP
  %stack_len1821 = load i64, ptr %len.addr, align 8
  %1368 = add i64 %stack_len1821, -1
  store i64 %1368, ptr %len.addr, align 8
  br label %OP524.SWAP1, !annotation !5

OP524.SWAP1:                                      ; preds = %OP523.POP
  %stack_len1822 = load i64, ptr %len.addr, align 8
  %1369 = sub i64 %stack_len1822, 1
  %sp1823 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1369
  %swap.a1824 = load i256, ptr %sp1823, align 16
  %1370 = sub i64 %stack_len1822, 2
  %sp1825 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1370
  %swap.b1826 = load i256, ptr %sp1825, align 16
  store i256 %swap.a1824, ptr %sp1825, align 16
  store i256 %swap.b1826, ptr %sp1823, align 16
  br label %OP525.POP, !annotation !5

OP525.POP:                                        ; preds = %OP524.SWAP1
  %stack_len1827 = load i64, ptr %len.addr, align 8
  %1371 = add i64 %stack_len1827, -1
  store i64 %1371, ptr %len.addr, align 8
  br label %OP526.SWAP1, !annotation !5

OP526.SWAP1:                                      ; preds = %OP525.POP
  %stack_len1828 = load i64, ptr %len.addr, align 8
  %1372 = sub i64 %stack_len1828, 1
  %sp1829 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1372
  %swap.a1830 = load i256, ptr %sp1829, align 16
  %1373 = sub i64 %stack_len1828, 2
  %sp1831 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1373
  %swap.b1832 = load i256, ptr %sp1831, align 16
  store i256 %swap.a1830, ptr %sp1831, align 16
  store i256 %swap.b1832, ptr %sp1829, align 16
  br label %OP527.DUP2, !annotation !5

OP527.DUP2:                                       ; preds = %OP526.SWAP1
  %stack_len1833 = load i64, ptr %len.addr, align 8
  %1374 = add i64 %stack_len1833, 1
  store i64 %1374, ptr %len.addr, align 8
  %1375 = sub i64 %stack_len1833, 2
  %sp1834 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1375
  %dup21835 = load i256, ptr %sp1834, align 16
  %sp1836 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1833
  store i256 %dup21835, ptr %sp1836, align 16
  br label %OP528.ADD, !annotation !5

OP528.ADD:                                        ; preds = %OP527.DUP2
  %stack_len1837 = load i64, ptr %len.addr, align 8
  %1376 = add i64 %stack_len1837, -1
  store i64 %1376, ptr %len.addr, align 8
  %1377 = add i64 %stack_len1837, -1
  %sp1838 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1377
  %a1839 = load i256, ptr %sp1838, align 16
  %1378 = add i64 %stack_len1837, -2
  %sp1840 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1378
  %b1841 = load i256, ptr %sp1840, align 16
  %1379 = add i256 %a1839, %b1841
  %1380 = add i64 %stack_len1837, -2
  %sp1842 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1380
  store i256 %1379, ptr %sp1842, align 16
  br label %OP529.SWAP1, !annotation !5

OP529.SWAP1:                                      ; preds = %OP528.ADD
  %stack_len1843 = load i64, ptr %len.addr, align 8
  %1381 = sub i64 %stack_len1843, 1
  %sp1844 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1381
  %swap.a1845 = load i256, ptr %sp1844, align 16
  %1382 = sub i64 %stack_len1843, 2
  %sp1846 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1382
  %swap.b1847 = load i256, ptr %sp1846, align 16
  store i256 %swap.a1845, ptr %sp1846, align 16
  store i256 %swap.b1847, ptr %sp1844, align 16
  br label %OP530.PUSH1, !annotation !5

OP530.PUSH1:                                      ; preds = %OP529.SWAP1
  %stack_len1848 = load i64, ptr %len.addr, align 8
  %1383 = add i64 %stack_len1848, 1
  store i64 %1383, ptr %len.addr, align 8
  %sp1849 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1848
  store i256 31, ptr %sp1849, align 16
  br label %OP531.AND, !annotation !5

OP531.AND:                                        ; preds = %OP530.PUSH1
  %stack_len1850 = load i64, ptr %len.addr, align 8
  %1384 = add i64 %stack_len1850, -1
  store i64 %1384, ptr %len.addr, align 8
  %1385 = add i64 %stack_len1850, -1
  %sp1851 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1385
  %a1852 = load i256, ptr %sp1851, align 16
  %1386 = add i64 %stack_len1850, -2
  %sp1853 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1386
  %b1854 = load i256, ptr %sp1853, align 16
  %1387 = and i256 %a1852, %b1854
  %1388 = add i64 %stack_len1850, -2
  %sp1855 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1388
  store i256 %1387, ptr %sp1855, align 16
  br label %OP532.DUP1, !annotation !5

OP532.DUP1:                                       ; preds = %OP531.AND
  %stack_len1856 = load i64, ptr %len.addr, align 8
  %1389 = add i64 %stack_len1856, 1
  store i64 %1389, ptr %len.addr, align 8
  %1390 = sub i64 %stack_len1856, 1
  %sp1857 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1390
  %dup11858 = load i256, ptr %sp1857, align 16
  %sp1859 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1856
  store i256 %dup11858, ptr %sp1859, align 16
  br label %OP533.ISZERO, !annotation !5

OP533.ISZERO:                                     ; preds = %OP532.DUP1
  %stack_len1860 = load i64, ptr %len.addr, align 8
  %1391 = add i64 %stack_len1860, -1
  %sp1861 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1391
  %a1862 = load i256, ptr %sp1861, align 16
  %1392 = icmp eq i256 %a1862, 0
  %1393 = zext i1 %1392 to i256
  %1394 = add i64 %stack_len1860, -1
  %sp1863 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1394
  store i256 %1393, ptr %sp1863, align 16
  br label %OP534.PUSH2, !annotation !5

OP534.PUSH2:                                      ; preds = %OP533.ISZERO
  br label %OP535.JUMPI, !annotation !6

OP535.JUMPI:                                      ; preds = %OP534.PUSH2
  %stack_len1864 = load i64, ptr %len.addr, align 8
  %1395 = add i64 %stack_len1864, -1
  store i64 %1395, ptr %len.addr, align 8
  %1396 = add i64 %stack_len1864, -1
  %sp1865 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1396
  %a1866 = load i256, ptr %sp1865, align 16
  %1397 = icmp ne i256 %a1866, 0
  br i1 %1397, label %OP556.JUMPDEST, label %OP536.DUP1

OP536.DUP1:                                       ; preds = %OP535.JUMPI
  %gas.remaining1867 = load i64, ptr %gas.remaining.addr, align 8
  %1398 = sub i64 %gas.remaining1867, 66
  %1399 = icmp ult i64 %gas.remaining1867, 66
  store i64 %1398, ptr %gas.remaining.addr, align 8
  br i1 %1399, label %return, label %OP536.DUP1.contd, !prof !2, !annotation !3

OP536.DUP1.contd:                                 ; preds = %OP536.DUP1
  %stack_len1868 = load i64, ptr %len.addr, align 8
  %1400 = icmp ult i64 %stack_len1868, 2
  %1401 = icmp ugt i64 %stack_len1868, 1019
  %1402 = or i1 %1400, %1401
  %1403 = select i1 %1400, i8 91, i8 92
  br i1 %1402, label %return, label %OP536.DUP1.contd1869, !prof !2

OP536.DUP1.contd1869:                             ; preds = %OP536.DUP1.contd
  %1404 = add i64 %stack_len1868, 1
  store i64 %1404, ptr %len.addr, align 8
  %1405 = sub i64 %stack_len1868, 1
  %sp1870 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1405
  %dup11871 = load i256, ptr %sp1870, align 16
  %sp1872 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1868
  store i256 %dup11871, ptr %sp1872, align 16
  br label %OP537.DUP3, !annotation !5

OP537.DUP3:                                       ; preds = %OP536.DUP1.contd1869
  %stack_len1873 = load i64, ptr %len.addr, align 8
  %1406 = add i64 %stack_len1873, 1
  store i64 %1406, ptr %len.addr, align 8
  %1407 = sub i64 %stack_len1873, 3
  %sp1874 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1407
  %dup31875 = load i256, ptr %sp1874, align 16
  %sp1876 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1873
  store i256 %dup31875, ptr %sp1876, align 16
  br label %OP538.SUB, !annotation !5

OP538.SUB:                                        ; preds = %OP537.DUP3
  %stack_len1877 = load i64, ptr %len.addr, align 8
  %1408 = add i64 %stack_len1877, -1
  store i64 %1408, ptr %len.addr, align 8
  %1409 = add i64 %stack_len1877, -1
  %sp1878 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1409
  %a1879 = load i256, ptr %sp1878, align 16
  %1410 = add i64 %stack_len1877, -2
  %sp1880 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1410
  %b1881 = load i256, ptr %sp1880, align 16
  %1411 = sub i256 %a1879, %b1881
  %1412 = add i64 %stack_len1877, -2
  %sp1882 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1412
  store i256 %1411, ptr %sp1882, align 16
  br label %OP539.DUP1, !annotation !5

OP539.DUP1:                                       ; preds = %OP538.SUB
  %stack_len1883 = load i64, ptr %len.addr, align 8
  %1413 = add i64 %stack_len1883, 1
  store i64 %1413, ptr %len.addr, align 8
  %1414 = sub i64 %stack_len1883, 1
  %sp1884 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1414
  %dup11885 = load i256, ptr %sp1884, align 16
  %sp1886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1883
  store i256 %dup11885, ptr %sp1886, align 16
  br label %OP540.MLOAD, !annotation !5

OP540.MLOAD:                                      ; preds = %OP539.DUP1
  %stack_len1887 = load i64, ptr %len.addr, align 8
  %1415 = add i64 %stack_len1887, -1
  %sp1888 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1415
  %a1889 = load i256, ptr %sp1888, align 16
  %mload.out.slot1890 = alloca i256, align 16
  %1416 = call i8 @__revmc_ir_builtin_mload(i256 %a1889, ptr %mload.out.slot1890, ptr %arg.ecx.addr)
  %1417 = icmp ne i8 %1416, 0
  br i1 %1417, label %return, label %OP540.MLOAD.contd, !prof !2

OP540.MLOAD.contd:                                ; preds = %OP540.MLOAD
  %mload.out1891 = load i256, ptr %mload.out.slot1890, align 16
  %1418 = add i64 %stack_len1887, -1
  %sp1892 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1418
  store i256 %mload.out1891, ptr %sp1892, align 16
  br label %OP541.PUSH1, !annotation !5

OP541.PUSH1:                                      ; preds = %OP540.MLOAD.contd
  %stack_len1893 = load i64, ptr %len.addr, align 8
  %1419 = add i64 %stack_len1893, 1
  store i64 %1419, ptr %len.addr, align 8
  %sp1894 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1893
  store i256 1, ptr %sp1894, align 16
  br label %OP542.DUP4, !annotation !5

OP542.DUP4:                                       ; preds = %OP541.PUSH1
  %stack_len1895 = load i64, ptr %len.addr, align 8
  %1420 = add i64 %stack_len1895, 1
  store i64 %1420, ptr %len.addr, align 8
  %1421 = sub i64 %stack_len1895, 4
  %sp1896 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1421
  %dup41897 = load i256, ptr %sp1896, align 16
  %sp1898 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1895
  store i256 %dup41897, ptr %sp1898, align 16
  br label %OP543.PUSH1, !annotation !5

OP543.PUSH1:                                      ; preds = %OP542.DUP4
  %stack_len1899 = load i64, ptr %len.addr, align 8
  %1422 = add i64 %stack_len1899, 1
  store i64 %1422, ptr %len.addr, align 8
  %sp1900 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1899
  store i256 32, ptr %sp1900, align 16
  br label %OP544.SUB, !annotation !5

OP544.SUB:                                        ; preds = %OP543.PUSH1
  %stack_len1901 = load i64, ptr %len.addr, align 8
  %1423 = add i64 %stack_len1901, -1
  store i64 %1423, ptr %len.addr, align 8
  %1424 = add i64 %stack_len1901, -1
  %sp1902 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1424
  %a1903 = load i256, ptr %sp1902, align 16
  %1425 = add i64 %stack_len1901, -2
  %sp1904 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1425
  %b1905 = load i256, ptr %sp1904, align 16
  %1426 = sub i256 %a1903, %b1905
  %1427 = add i64 %stack_len1901, -2
  %sp1906 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1427
  store i256 %1426, ptr %sp1906, align 16
  br label %OP545.PUSH2, !annotation !5

OP545.PUSH2:                                      ; preds = %OP544.SUB
  %stack_len1907 = load i64, ptr %len.addr, align 8
  %1428 = add i64 %stack_len1907, 1
  store i64 %1428, ptr %len.addr, align 8
  %sp1908 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1907
  store i256 256, ptr %sp1908, align 16
  br label %OP546.EXP, !annotation !5

OP546.EXP:                                        ; preds = %OP545.PUSH2
  %stack_len1909 = load i64, ptr %len.addr, align 8
  %1429 = add i64 %stack_len1909, -1
  store i64 %1429, ptr %len.addr, align 8
  %1430 = sub i64 %stack_len1909, 2
  %sp1910 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1430
  %1431 = call i8 @__revmc_builtin_exp(ptr %arg.ecx.addr, ptr %sp1910, i8 19)
  %1432 = icmp ne i8 %1431, 0
  br i1 %1432, label %return, label %OP546.EXP.contd, !prof !2

OP546.EXP.contd:                                  ; preds = %OP546.EXP
  br label %OP547.SUB, !annotation !5

OP547.SUB:                                        ; preds = %OP546.EXP.contd
  %stack_len1911 = load i64, ptr %len.addr, align 8
  %1433 = add i64 %stack_len1911, -1
  store i64 %1433, ptr %len.addr, align 8
  %1434 = add i64 %stack_len1911, -1
  %sp1912 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1434
  %a1913 = load i256, ptr %sp1912, align 16
  %1435 = add i64 %stack_len1911, -2
  %sp1914 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1435
  %b1915 = load i256, ptr %sp1914, align 16
  %1436 = sub i256 %a1913, %b1915
  %1437 = add i64 %stack_len1911, -2
  %sp1916 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1437
  store i256 %1436, ptr %sp1916, align 16
  br label %OP548.NOT, !annotation !5

OP548.NOT:                                        ; preds = %OP547.SUB
  %stack_len1917 = load i64, ptr %len.addr, align 8
  %1438 = add i64 %stack_len1917, -1
  %sp1918 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1438
  %a1919 = load i256, ptr %sp1918, align 16
  %1439 = xor i256 %a1919, -1
  %1440 = add i64 %stack_len1917, -1
  %sp1920 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1440
  store i256 %1439, ptr %sp1920, align 16
  br label %OP549.AND, !annotation !5

OP549.AND:                                        ; preds = %OP548.NOT
  %stack_len1921 = load i64, ptr %len.addr, align 8
  %1441 = add i64 %stack_len1921, -1
  store i64 %1441, ptr %len.addr, align 8
  %1442 = add i64 %stack_len1921, -1
  %sp1922 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1442
  %a1923 = load i256, ptr %sp1922, align 16
  %1443 = add i64 %stack_len1921, -2
  %sp1924 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1443
  %b1925 = load i256, ptr %sp1924, align 16
  %1444 = and i256 %a1923, %b1925
  %1445 = add i64 %stack_len1921, -2
  %sp1926 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1445
  store i256 %1444, ptr %sp1926, align 16
  br label %OP550.DUP2, !annotation !5

OP550.DUP2:                                       ; preds = %OP549.AND
  %stack_len1927 = load i64, ptr %len.addr, align 8
  %1446 = add i64 %stack_len1927, 1
  store i64 %1446, ptr %len.addr, align 8
  %1447 = sub i64 %stack_len1927, 2
  %sp1928 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1447
  %dup21929 = load i256, ptr %sp1928, align 16
  %sp1930 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1927
  store i256 %dup21929, ptr %sp1930, align 16
  br label %OP551.MSTORE, !annotation !5

OP551.MSTORE:                                     ; preds = %OP550.DUP2
  %stack_len1931 = load i64, ptr %len.addr, align 8
  %1448 = add i64 %stack_len1931, -2
  store i64 %1448, ptr %len.addr, align 8
  %1449 = add i64 %stack_len1931, -1
  %sp1932 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1449
  %a1933 = load i256, ptr %sp1932, align 16
  %1450 = add i64 %stack_len1931, -2
  %sp1934 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1450
  %b1935 = load i256, ptr %sp1934, align 16
  %1451 = call i8 @__revmc_ir_builtin_mstore(i256 %a1933, i256 %b1935, ptr %arg.ecx.addr)
  %1452 = icmp ne i8 %1451, 0
  br i1 %1452, label %return, label %OP551.MSTORE.contd, !prof !2

OP551.MSTORE.contd:                               ; preds = %OP551.MSTORE
  br label %OP552.PUSH1, !annotation !5

OP552.PUSH1:                                      ; preds = %OP551.MSTORE.contd
  %stack_len1936 = load i64, ptr %len.addr, align 8
  %1453 = add i64 %stack_len1936, 1
  store i64 %1453, ptr %len.addr, align 8
  %sp1937 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1936
  store i256 32, ptr %sp1937, align 16
  br label %OP553.ADD, !annotation !5

OP553.ADD:                                        ; preds = %OP552.PUSH1
  %stack_len1938 = load i64, ptr %len.addr, align 8
  %1454 = add i64 %stack_len1938, -1
  store i64 %1454, ptr %len.addr, align 8
  %1455 = add i64 %stack_len1938, -1
  %sp1939 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1455
  %a1940 = load i256, ptr %sp1939, align 16
  %1456 = add i64 %stack_len1938, -2
  %sp1941 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1456
  %b1942 = load i256, ptr %sp1941, align 16
  %1457 = add i256 %a1940, %b1942
  %1458 = add i64 %stack_len1938, -2
  %sp1943 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1458
  store i256 %1457, ptr %sp1943, align 16
  br label %OP554.SWAP2, !annotation !5

OP554.SWAP2:                                      ; preds = %OP553.ADD
  %stack_len1944 = load i64, ptr %len.addr, align 8
  %1459 = sub i64 %stack_len1944, 1
  %sp1945 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1459
  %swap.a1946 = load i256, ptr %sp1945, align 16
  %1460 = sub i64 %stack_len1944, 3
  %sp1947 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1460
  %swap.b1948 = load i256, ptr %sp1947, align 16
  store i256 %swap.a1946, ptr %sp1947, align 16
  store i256 %swap.b1948, ptr %sp1945, align 16
  br label %OP555.POP, !annotation !5

OP555.POP:                                        ; preds = %OP554.SWAP2
  %stack_len1949 = load i64, ptr %len.addr, align 8
  %1461 = add i64 %stack_len1949, -1
  store i64 %1461, ptr %len.addr, align 8
  br label %OP556.JUMPDEST, !annotation !5

OP556.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP555.POP, %OP535.JUMPI
  %gas.remaining1950 = load i64, ptr %gas.remaining.addr, align 8
  %1462 = sub i64 %gas.remaining1950, 30
  %1463 = icmp ult i64 %gas.remaining1950, 30
  store i64 %1462, ptr %gas.remaining.addr, align 8
  br i1 %1463, label %return, label %OP556.JUMPDEST.contd, !prof !2, !annotation !3

OP556.JUMPDEST.contd:                             ; preds = %OP556.JUMPDEST
  %stack_len1951 = load i64, ptr %len.addr, align 8
  %1464 = icmp ult i64 %stack_len1951, 5
  br i1 %1464, label %return, label %OP556.JUMPDEST.contd1952, !prof !2, !annotation !9

OP556.JUMPDEST.contd1952:                         ; preds = %OP556.JUMPDEST.contd
  br label %OP557.POP, !annotation !5

OP557.POP:                                        ; preds = %OP556.JUMPDEST.contd1952
  %stack_len1953 = load i64, ptr %len.addr, align 8
  %1465 = add i64 %stack_len1953, -1
  store i64 %1465, ptr %len.addr, align 8
  br label %OP558.SWAP3, !annotation !5

OP558.SWAP3:                                      ; preds = %OP557.POP
  %stack_len1954 = load i64, ptr %len.addr, align 8
  %1466 = sub i64 %stack_len1954, 1
  %sp1955 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1466
  %swap.a1956 = load i256, ptr %sp1955, align 16
  %1467 = sub i64 %stack_len1954, 4
  %sp1957 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1467
  %swap.b1958 = load i256, ptr %sp1957, align 16
  store i256 %swap.a1956, ptr %sp1957, align 16
  store i256 %swap.b1958, ptr %sp1955, align 16
  br label %OP559.POP, !annotation !5

OP559.POP:                                        ; preds = %OP558.SWAP3
  %stack_len1959 = load i64, ptr %len.addr, align 8
  %1468 = add i64 %stack_len1959, -1
  store i64 %1468, ptr %len.addr, align 8
  br label %OP560.POP, !annotation !5

OP560.POP:                                        ; preds = %OP559.POP
  %stack_len1960 = load i64, ptr %len.addr, align 8
  %1469 = add i64 %stack_len1960, -1
  store i64 %1469, ptr %len.addr, align 8
  br label %OP561.POP, !annotation !5

OP561.POP:                                        ; preds = %OP560.POP
  %stack_len1961 = load i64, ptr %len.addr, align 8
  %1470 = add i64 %stack_len1961, -1
  store i64 %1470, ptr %len.addr, align 8
  br label %OP562.PUSH1, !annotation !5

OP562.PUSH1:                                      ; preds = %OP561.POP
  %stack_len1962 = load i64, ptr %len.addr, align 8
  %1471 = add i64 %stack_len1962, 1
  store i64 %1471, ptr %len.addr, align 8
  %sp1963 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1962
  store i256 64, ptr %sp1963, align 16
  br label %OP563.MLOAD, !annotation !5

OP563.MLOAD:                                      ; preds = %OP562.PUSH1
  %stack_len1964 = load i64, ptr %len.addr, align 8
  %1472 = add i64 %stack_len1964, -1
  %sp1965 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1472
  %a1966 = load i256, ptr %sp1965, align 16
  %mload.out.slot1967 = alloca i256, align 16
  %1473 = call i8 @__revmc_ir_builtin_mload(i256 %a1966, ptr %mload.out.slot1967, ptr %arg.ecx.addr)
  %1474 = icmp ne i8 %1473, 0
  br i1 %1474, label %return, label %OP563.MLOAD.contd, !prof !2

OP563.MLOAD.contd:                                ; preds = %OP563.MLOAD
  %mload.out1968 = load i256, ptr %mload.out.slot1967, align 16
  %1475 = add i64 %stack_len1964, -1
  %sp1969 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1475
  store i256 %mload.out1968, ptr %sp1969, align 16
  br label %OP564.DUP1, !annotation !5

OP564.DUP1:                                       ; preds = %OP563.MLOAD.contd
  %stack_len1970 = load i64, ptr %len.addr, align 8
  %1476 = add i64 %stack_len1970, 1
  store i64 %1476, ptr %len.addr, align 8
  %1477 = sub i64 %stack_len1970, 1
  %sp1971 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1477
  %dup11972 = load i256, ptr %sp1971, align 16
  %sp1973 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1970
  store i256 %dup11972, ptr %sp1973, align 16
  br label %OP565.SWAP2, !annotation !5

OP565.SWAP2:                                      ; preds = %OP564.DUP1
  %stack_len1974 = load i64, ptr %len.addr, align 8
  %1478 = sub i64 %stack_len1974, 1
  %sp1975 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1478
  %swap.a1976 = load i256, ptr %sp1975, align 16
  %1479 = sub i64 %stack_len1974, 3
  %sp1977 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1479
  %swap.b1978 = load i256, ptr %sp1977, align 16
  store i256 %swap.a1976, ptr %sp1977, align 16
  store i256 %swap.b1978, ptr %sp1975, align 16
  br label %OP566.SUB, !annotation !5

OP566.SUB:                                        ; preds = %OP565.SWAP2
  %stack_len1979 = load i64, ptr %len.addr, align 8
  %1480 = add i64 %stack_len1979, -1
  store i64 %1480, ptr %len.addr, align 8
  %1481 = add i64 %stack_len1979, -1
  %sp1980 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1481
  %a1981 = load i256, ptr %sp1980, align 16
  %1482 = add i64 %stack_len1979, -2
  %sp1982 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1482
  %b1983 = load i256, ptr %sp1982, align 16
  %1483 = sub i256 %a1981, %b1983
  %1484 = add i64 %stack_len1979, -2
  %sp1984 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1484
  store i256 %1483, ptr %sp1984, align 16
  br label %OP567.SWAP1, !annotation !5

OP567.SWAP1:                                      ; preds = %OP566.SUB
  %stack_len1985 = load i64, ptr %len.addr, align 8
  %1485 = sub i64 %stack_len1985, 1
  %sp1986 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1485
  %swap.a1987 = load i256, ptr %sp1986, align 16
  %1486 = sub i64 %stack_len1985, 2
  %sp1988 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1486
  %swap.b1989 = load i256, ptr %sp1988, align 16
  store i256 %swap.a1987, ptr %sp1988, align 16
  store i256 %swap.b1989, ptr %sp1986, align 16
  br label %OP568.RETURN, !annotation !5

OP568.RETURN:                                     ; preds = %OP567.SWAP1
  %stack_len1990 = load i64, ptr %len.addr, align 8
  %1487 = add i64 %stack_len1990, -2
  store i64 %1487, ptr %len.addr, align 8
  %1488 = sub i64 %stack_len1990, 2
  %sp1991 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1488
  %1489 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1991, i8 2)
  %1490 = icmp ne i8 %1489, 0
  br i1 %1490, label %return, label %OP568.RETURN.contd, !prof !2

OP568.RETURN.contd:                               ; preds = %OP568.RETURN
  br label %return, !annotation !10

OP569.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP59.JUMPI
  %gas.remaining1992 = load i64, ptr %gas.remaining.addr, align 8
  %1491 = sub i64 %gas.remaining1992, 19
  %1492 = icmp ult i64 %gas.remaining1992, 19
  store i64 %1491, ptr %gas.remaining.addr, align 8
  br i1 %1492, label %return, label %OP569.JUMPDEST.contd, !prof !2, !annotation !3

OP569.JUMPDEST.contd:                             ; preds = %OP569.JUMPDEST
  %stack_len1993 = load i64, ptr %len.addr, align 8
  %1493 = icmp ugt i64 %stack_len1993, 1022
  br i1 %1493, label %return, label %OP569.JUMPDEST.contd1994, !prof !2, !annotation !4

OP569.JUMPDEST.contd1994:                         ; preds = %OP569.JUMPDEST.contd
  br label %OP570.CALLVALUE, !annotation !5

OP570.CALLVALUE:                                  ; preds = %OP569.JUMPDEST.contd1994
  %stack_len1995 = load i64, ptr %len.addr, align 8
  %1494 = add i64 %stack_len1995, 1
  store i64 %1494, ptr %len.addr, align 8
  %contract.call_value.addr1996 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1997 = load i256, ptr %contract.call_value.addr1996, align 16
  %sp1998 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1995
  store i256 %contract.call_value1997, ptr %sp1998, align 16
  br label %OP571.ISZERO, !annotation !5

OP571.ISZERO:                                     ; preds = %OP570.CALLVALUE
  %stack_len1999 = load i64, ptr %len.addr, align 8
  %1495 = add i64 %stack_len1999, -1
  %sp2000 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1495
  %a2001 = load i256, ptr %sp2000, align 16
  %1496 = icmp eq i256 %a2001, 0
  %1497 = zext i1 %1496 to i256
  %1498 = add i64 %stack_len1999, -1
  %sp2002 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1498
  store i256 %1497, ptr %sp2002, align 16
  br label %OP572.PUSH2, !annotation !5

OP572.PUSH2:                                      ; preds = %OP571.ISZERO
  br label %OP573.JUMPI, !annotation !6

OP573.JUMPI:                                      ; preds = %OP572.PUSH2
  %stack_len2003 = load i64, ptr %len.addr, align 8
  %1499 = add i64 %stack_len2003, -1
  store i64 %1499, ptr %len.addr, align 8
  %1500 = add i64 %stack_len2003, -1
  %sp2004 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1500
  %a2005 = load i256, ptr %sp2004, align 16
  %1501 = icmp ne i256 %a2005, 0
  br i1 %1501, label %OP577.JUMPDEST, label %OP574.PUSH1

OP574.PUSH1:                                      ; preds = %OP573.JUMPI
  %gas.remaining2006 = load i64, ptr %gas.remaining.addr, align 8
  %1502 = sub i64 %gas.remaining2006, 6
  %1503 = icmp ult i64 %gas.remaining2006, 6
  store i64 %1502, ptr %gas.remaining.addr, align 8
  br i1 %1503, label %return, label %OP574.PUSH1.contd, !prof !2, !annotation !3

OP574.PUSH1.contd:                                ; preds = %OP574.PUSH1
  %stack_len2007 = load i64, ptr %len.addr, align 8
  %1504 = icmp ugt i64 %stack_len2007, 1022
  br i1 %1504, label %return, label %OP574.PUSH1.contd2008, !prof !2, !annotation !4

OP574.PUSH1.contd2008:                            ; preds = %OP574.PUSH1.contd
  %1505 = add i64 %stack_len2007, 1
  store i64 %1505, ptr %len.addr, align 8
  %sp2009 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2007
  store i256 0, ptr %sp2009, align 16
  br label %OP575.DUP1, !annotation !5

OP575.DUP1:                                       ; preds = %OP574.PUSH1.contd2008
  %stack_len2010 = load i64, ptr %len.addr, align 8
  %1506 = add i64 %stack_len2010, 1
  store i64 %1506, ptr %len.addr, align 8
  %1507 = sub i64 %stack_len2010, 1
  %sp2011 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1507
  %dup12012 = load i256, ptr %sp2011, align 16
  %sp2013 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2010
  store i256 %dup12012, ptr %sp2013, align 16
  br label %OP576.REVERT, !annotation !5

OP576.REVERT:                                     ; preds = %OP575.DUP1
  %stack_len2014 = load i64, ptr %len.addr, align 8
  %1508 = add i64 %stack_len2014, -2
  store i64 %1508, ptr %len.addr, align 8
  %1509 = sub i64 %stack_len2014, 2
  %sp2015 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1509
  %1510 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp2015, i8 16)
  %1511 = icmp ne i8 %1510, 0
  br i1 %1511, label %return, label %OP576.REVERT.contd, !prof !2

OP576.REVERT.contd:                               ; preds = %OP576.REVERT
  br label %return, !annotation !8

OP577.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP573.JUMPI
  %gas.remaining2016 = load i64, ptr %gas.remaining.addr, align 8
  %1512 = sub i64 %gas.remaining2016, 79
  %1513 = icmp ult i64 %gas.remaining2016, 79
  store i64 %1512, ptr %gas.remaining.addr, align 8
  br i1 %1513, label %return, label %OP577.JUMPDEST.contd, !prof !2, !annotation !3

OP577.JUMPDEST.contd:                             ; preds = %OP577.JUMPDEST
  %stack_len2017 = load i64, ptr %len.addr, align 8
  %1514 = icmp ugt i64 %stack_len2017, 1018
  br i1 %1514, label %return, label %OP577.JUMPDEST.contd2018, !prof !2, !annotation !4

OP577.JUMPDEST.contd2018:                         ; preds = %OP577.JUMPDEST.contd
  br label %OP578.PUSH2, !annotation !5

OP578.PUSH2:                                      ; preds = %OP577.JUMPDEST.contd2018
  %stack_len2019 = load i64, ptr %len.addr, align 8
  %1515 = add i64 %stack_len2019, 1
  store i64 %1515, ptr %len.addr, align 8
  %sp2020 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2019
  store i256 944, ptr %sp2020, align 16
  br label %OP579.PUSH1, !annotation !5

OP579.PUSH1:                                      ; preds = %OP578.PUSH2
  %stack_len2021 = load i64, ptr %len.addr, align 8
  %1516 = add i64 %stack_len2021, 1
  store i64 %1516, ptr %len.addr, align 8
  %sp2022 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2021
  store i256 4, ptr %sp2022, align 16
  br label %OP580.DUP1, !annotation !5

OP580.DUP1:                                       ; preds = %OP579.PUSH1
  %stack_len2023 = load i64, ptr %len.addr, align 8
  %1517 = add i64 %stack_len2023, 1
  store i64 %1517, ptr %len.addr, align 8
  %1518 = sub i64 %stack_len2023, 1
  %sp2024 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1518
  %dup12025 = load i256, ptr %sp2024, align 16
  %sp2026 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2023
  store i256 %dup12025, ptr %sp2026, align 16
  br label %OP581.DUP1, !annotation !5

OP581.DUP1:                                       ; preds = %OP580.DUP1
  %stack_len2027 = load i64, ptr %len.addr, align 8
  %1519 = add i64 %stack_len2027, 1
  store i64 %1519, ptr %len.addr, align 8
  %1520 = sub i64 %stack_len2027, 1
  %sp2028 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1520
  %dup12029 = load i256, ptr %sp2028, align 16
  %sp2030 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2027
  store i256 %dup12029, ptr %sp2030, align 16
  br label %OP582.CALLDATALOAD, !annotation !5

OP582.CALLDATALOAD:                               ; preds = %OP581.DUP1
  %stack_len2031 = load i64, ptr %len.addr, align 8
  %1521 = add i64 %stack_len2031, -1
  %sp2032 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1521
  %a2033 = load i256, ptr %sp2032, align 16
  %1522 = call i256 @__revmc_ir_builtin_calldataload(i256 %a2033, ptr %arg.contract.addr)
  %1523 = add i64 %stack_len2031, -1
  %sp2034 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1523
  store i256 %1522, ptr %sp2034, align 16
  br label %OP583.PUSH20, !annotation !5

OP583.PUSH20:                                     ; preds = %OP582.CALLDATALOAD
  %stack_len2035 = load i64, ptr %len.addr, align 8
  %1524 = add i64 %stack_len2035, 1
  store i64 %1524, ptr %len.addr, align 8
  %sp2036 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2035
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp2036, align 16
  br label %OP584.AND, !annotation !5

OP584.AND:                                        ; preds = %OP583.PUSH20
  %stack_len2037 = load i64, ptr %len.addr, align 8
  %1525 = add i64 %stack_len2037, -1
  store i64 %1525, ptr %len.addr, align 8
  %1526 = add i64 %stack_len2037, -1
  %sp2038 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1526
  %a2039 = load i256, ptr %sp2038, align 16
  %1527 = add i64 %stack_len2037, -2
  %sp2040 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1527
  %b2041 = load i256, ptr %sp2040, align 16
  %1528 = and i256 %a2039, %b2041
  %1529 = add i64 %stack_len2037, -2
  %sp2042 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1529
  store i256 %1528, ptr %sp2042, align 16
  br label %OP585.SWAP1, !annotation !5

OP585.SWAP1:                                      ; preds = %OP584.AND
  %stack_len2043 = load i64, ptr %len.addr, align 8
  %1530 = sub i64 %stack_len2043, 1
  %sp2044 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1530
  %swap.a2045 = load i256, ptr %sp2044, align 16
  %1531 = sub i64 %stack_len2043, 2
  %sp2046 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1531
  %swap.b2047 = load i256, ptr %sp2046, align 16
  store i256 %swap.a2045, ptr %sp2046, align 16
  store i256 %swap.b2047, ptr %sp2044, align 16
  br label %OP586.PUSH1, !annotation !5

OP586.PUSH1:                                      ; preds = %OP585.SWAP1
  %stack_len2048 = load i64, ptr %len.addr, align 8
  %1532 = add i64 %stack_len2048, 1
  store i64 %1532, ptr %len.addr, align 8
  %sp2049 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2048
  store i256 32, ptr %sp2049, align 16
  br label %OP587.ADD, !annotation !5

OP587.ADD:                                        ; preds = %OP586.PUSH1
  %stack_len2050 = load i64, ptr %len.addr, align 8
  %1533 = add i64 %stack_len2050, -1
  store i64 %1533, ptr %len.addr, align 8
  %1534 = add i64 %stack_len2050, -1
  %sp2051 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1534
  %a2052 = load i256, ptr %sp2051, align 16
  %1535 = add i64 %stack_len2050, -2
  %sp2053 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1535
  %b2054 = load i256, ptr %sp2053, align 16
  %1536 = add i256 %a2052, %b2054
  %1537 = add i64 %stack_len2050, -2
  %sp2055 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1537
  store i256 %1536, ptr %sp2055, align 16
  br label %OP588.SWAP1, !annotation !5

OP588.SWAP1:                                      ; preds = %OP587.ADD
  %stack_len2056 = load i64, ptr %len.addr, align 8
  %1538 = sub i64 %stack_len2056, 1
  %sp2057 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1538
  %swap.a2058 = load i256, ptr %sp2057, align 16
  %1539 = sub i64 %stack_len2056, 2
  %sp2059 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1539
  %swap.b2060 = load i256, ptr %sp2059, align 16
  store i256 %swap.a2058, ptr %sp2059, align 16
  store i256 %swap.b2060, ptr %sp2057, align 16
  br label %OP589.SWAP2, !annotation !5

OP589.SWAP2:                                      ; preds = %OP588.SWAP1
  %stack_len2061 = load i64, ptr %len.addr, align 8
  %1540 = sub i64 %stack_len2061, 1
  %sp2062 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1540
  %swap.a2063 = load i256, ptr %sp2062, align 16
  %1541 = sub i64 %stack_len2061, 3
  %sp2064 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1541
  %swap.b2065 = load i256, ptr %sp2064, align 16
  store i256 %swap.a2063, ptr %sp2064, align 16
  store i256 %swap.b2065, ptr %sp2062, align 16
  br label %OP590.SWAP1, !annotation !5

OP590.SWAP1:                                      ; preds = %OP589.SWAP2
  %stack_len2066 = load i64, ptr %len.addr, align 8
  %1542 = sub i64 %stack_len2066, 1
  %sp2067 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1542
  %swap.a2068 = load i256, ptr %sp2067, align 16
  %1543 = sub i64 %stack_len2066, 2
  %sp2069 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1543
  %swap.b2070 = load i256, ptr %sp2069, align 16
  store i256 %swap.a2068, ptr %sp2069, align 16
  store i256 %swap.b2070, ptr %sp2067, align 16
  br label %OP591.DUP1, !annotation !5

OP591.DUP1:                                       ; preds = %OP590.SWAP1
  %stack_len2071 = load i64, ptr %len.addr, align 8
  %1544 = add i64 %stack_len2071, 1
  store i64 %1544, ptr %len.addr, align 8
  %1545 = sub i64 %stack_len2071, 1
  %sp2072 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1545
  %dup12073 = load i256, ptr %sp2072, align 16
  %sp2074 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2071
  store i256 %dup12073, ptr %sp2074, align 16
  br label %OP592.CALLDATALOAD, !annotation !5

OP592.CALLDATALOAD:                               ; preds = %OP591.DUP1
  %stack_len2075 = load i64, ptr %len.addr, align 8
  %1546 = add i64 %stack_len2075, -1
  %sp2076 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1546
  %a2077 = load i256, ptr %sp2076, align 16
  %1547 = call i256 @__revmc_ir_builtin_calldataload(i256 %a2077, ptr %arg.contract.addr)
  %1548 = add i64 %stack_len2075, -1
  %sp2078 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1548
  store i256 %1547, ptr %sp2078, align 16
  br label %OP593.SWAP1, !annotation !5

OP593.SWAP1:                                      ; preds = %OP592.CALLDATALOAD
  %stack_len2079 = load i64, ptr %len.addr, align 8
  %1549 = sub i64 %stack_len2079, 1
  %sp2080 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1549
  %swap.a2081 = load i256, ptr %sp2080, align 16
  %1550 = sub i64 %stack_len2079, 2
  %sp2082 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1550
  %swap.b2083 = load i256, ptr %sp2082, align 16
  store i256 %swap.a2081, ptr %sp2082, align 16
  store i256 %swap.b2083, ptr %sp2080, align 16
  br label %OP594.PUSH1, !annotation !5

OP594.PUSH1:                                      ; preds = %OP593.SWAP1
  %stack_len2084 = load i64, ptr %len.addr, align 8
  %1551 = add i64 %stack_len2084, 1
  store i64 %1551, ptr %len.addr, align 8
  %sp2085 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2084
  store i256 32, ptr %sp2085, align 16
  br label %OP595.ADD, !annotation !5

OP595.ADD:                                        ; preds = %OP594.PUSH1
  %stack_len2086 = load i64, ptr %len.addr, align 8
  %1552 = add i64 %stack_len2086, -1
  store i64 %1552, ptr %len.addr, align 8
  %1553 = add i64 %stack_len2086, -1
  %sp2087 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1553
  %a2088 = load i256, ptr %sp2087, align 16
  %1554 = add i64 %stack_len2086, -2
  %sp2089 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1554
  %b2090 = load i256, ptr %sp2089, align 16
  %1555 = add i256 %a2088, %b2090
  %1556 = add i64 %stack_len2086, -2
  %sp2091 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1556
  store i256 %1555, ptr %sp2091, align 16
  br label %OP596.SWAP1, !annotation !5

OP596.SWAP1:                                      ; preds = %OP595.ADD
  %stack_len2092 = load i64, ptr %len.addr, align 8
  %1557 = sub i64 %stack_len2092, 1
  %sp2093 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1557
  %swap.a2094 = load i256, ptr %sp2093, align 16
  %1558 = sub i64 %stack_len2092, 2
  %sp2095 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1558
  %swap.b2096 = load i256, ptr %sp2095, align 16
  store i256 %swap.a2094, ptr %sp2095, align 16
  store i256 %swap.b2096, ptr %sp2093, align 16
  br label %OP597.SWAP2, !annotation !5

OP597.SWAP2:                                      ; preds = %OP596.SWAP1
  %stack_len2097 = load i64, ptr %len.addr, align 8
  %1559 = sub i64 %stack_len2097, 1
  %sp2098 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1559
  %swap.a2099 = load i256, ptr %sp2098, align 16
  %1560 = sub i64 %stack_len2097, 3
  %sp2100 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1560
  %swap.b2101 = load i256, ptr %sp2100, align 16
  store i256 %swap.a2099, ptr %sp2100, align 16
  store i256 %swap.b2101, ptr %sp2098, align 16
  br label %OP598.SWAP1, !annotation !5

OP598.SWAP1:                                      ; preds = %OP597.SWAP2
  %stack_len2102 = load i64, ptr %len.addr, align 8
  %1561 = sub i64 %stack_len2102, 1
  %sp2103 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1561
  %swap.a2104 = load i256, ptr %sp2103, align 16
  %1562 = sub i64 %stack_len2102, 2
  %sp2105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1562
  %swap.b2106 = load i256, ptr %sp2105, align 16
  store i256 %swap.a2104, ptr %sp2105, align 16
  store i256 %swap.b2106, ptr %sp2103, align 16
  br label %OP599.POP, !annotation !5

OP599.POP:                                        ; preds = %OP598.SWAP1
  %stack_len2107 = load i64, ptr %len.addr, align 8
  %1563 = add i64 %stack_len2107, -1
  store i64 %1563, ptr %len.addr, align 8
  br label %OP600.POP, !annotation !5

OP600.POP:                                        ; preds = %OP599.POP
  %stack_len2108 = load i64, ptr %len.addr, align 8
  %1564 = add i64 %stack_len2108, -1
  store i64 %1564, ptr %len.addr, align 8
  br label %OP601.PUSH2, !annotation !5

OP601.PUSH2:                                      ; preds = %OP600.POP
  br label %OP602.JUMP, !annotation !6

OP602.JUMP:                                       ; preds = %OP601.PUSH2
  %stack_len2109 = load i64, ptr %len.addr, align 8
  br label %OP1511.JUMPDEST

OP603.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining2110 = load i64, ptr %gas.remaining.addr, align 8
  %1565 = sub i64 %gas.remaining2110, 62
  %1566 = icmp ult i64 %gas.remaining2110, 62
  store i64 %1565, ptr %gas.remaining.addr, align 8
  br i1 %1566, label %return, label %OP603.JUMPDEST.contd, !prof !2, !annotation !3

OP603.JUMPDEST.contd:                             ; preds = %OP603.JUMPDEST
  %stack_len2111 = load i64, ptr %len.addr, align 8
  %1567 = icmp ult i64 %stack_len2111, 1
  %1568 = icmp ugt i64 %stack_len2111, 1020
  %1569 = or i1 %1567, %1568
  %1570 = select i1 %1567, i8 91, i8 92
  br i1 %1569, label %return, label %OP603.JUMPDEST.contd2112, !prof !2

OP603.JUMPDEST.contd2112:                         ; preds = %OP603.JUMPDEST.contd
  br label %OP604.PUSH1, !annotation !5

OP604.PUSH1:                                      ; preds = %OP603.JUMPDEST.contd2112
  %stack_len2113 = load i64, ptr %len.addr, align 8
  %1571 = add i64 %stack_len2113, 1
  store i64 %1571, ptr %len.addr, align 8
  %sp2114 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2113
  store i256 64, ptr %sp2114, align 16
  br label %OP605.MLOAD, !annotation !5

OP605.MLOAD:                                      ; preds = %OP604.PUSH1
  %stack_len2115 = load i64, ptr %len.addr, align 8
  %1572 = add i64 %stack_len2115, -1
  %sp2116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1572
  %a2117 = load i256, ptr %sp2116, align 16
  %mload.out.slot2118 = alloca i256, align 16
  %1573 = call i8 @__revmc_ir_builtin_mload(i256 %a2117, ptr %mload.out.slot2118, ptr %arg.ecx.addr)
  %1574 = icmp ne i8 %1573, 0
  br i1 %1574, label %return, label %OP605.MLOAD.contd, !prof !2

OP605.MLOAD.contd:                                ; preds = %OP605.MLOAD
  %mload.out2119 = load i256, ptr %mload.out.slot2118, align 16
  %1575 = add i64 %stack_len2115, -1
  %sp2120 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1575
  store i256 %mload.out2119, ptr %sp2120, align 16
  br label %OP606.DUP1, !annotation !5

OP606.DUP1:                                       ; preds = %OP605.MLOAD.contd
  %stack_len2121 = load i64, ptr %len.addr, align 8
  %1576 = add i64 %stack_len2121, 1
  store i64 %1576, ptr %len.addr, align 8
  %1577 = sub i64 %stack_len2121, 1
  %sp2122 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1577
  %dup12123 = load i256, ptr %sp2122, align 16
  %sp2124 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2121
  store i256 %dup12123, ptr %sp2124, align 16
  br label %OP607.DUP3, !annotation !5

OP607.DUP3:                                       ; preds = %OP606.DUP1
  %stack_len2125 = load i64, ptr %len.addr, align 8
  %1578 = add i64 %stack_len2125, 1
  store i64 %1578, ptr %len.addr, align 8
  %1579 = sub i64 %stack_len2125, 3
  %sp2126 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1579
  %dup32127 = load i256, ptr %sp2126, align 16
  %sp2128 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2125
  store i256 %dup32127, ptr %sp2128, align 16
  br label %OP608.ISZERO, !annotation !5

OP608.ISZERO:                                     ; preds = %OP607.DUP3
  %stack_len2129 = load i64, ptr %len.addr, align 8
  %1580 = add i64 %stack_len2129, -1
  %sp2130 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1580
  %a2131 = load i256, ptr %sp2130, align 16
  %1581 = icmp eq i256 %a2131, 0
  %1582 = zext i1 %1581 to i256
  %1583 = add i64 %stack_len2129, -1
  %sp2132 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1583
  store i256 %1582, ptr %sp2132, align 16
  br label %OP609.ISZERO, !annotation !5

OP609.ISZERO:                                     ; preds = %OP608.ISZERO
  %stack_len2133 = load i64, ptr %len.addr, align 8
  %1584 = add i64 %stack_len2133, -1
  %sp2134 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1584
  %a2135 = load i256, ptr %sp2134, align 16
  %1585 = icmp eq i256 %a2135, 0
  %1586 = zext i1 %1585 to i256
  %1587 = add i64 %stack_len2133, -1
  %sp2136 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1587
  store i256 %1586, ptr %sp2136, align 16
  br label %OP610.ISZERO, !annotation !5

OP610.ISZERO:                                     ; preds = %OP609.ISZERO
  %stack_len2137 = load i64, ptr %len.addr, align 8
  %1588 = add i64 %stack_len2137, -1
  %sp2138 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1588
  %a2139 = load i256, ptr %sp2138, align 16
  %1589 = icmp eq i256 %a2139, 0
  %1590 = zext i1 %1589 to i256
  %1591 = add i64 %stack_len2137, -1
  %sp2140 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1591
  store i256 %1590, ptr %sp2140, align 16
  br label %OP611.ISZERO, !annotation !5

OP611.ISZERO:                                     ; preds = %OP610.ISZERO
  %stack_len2141 = load i64, ptr %len.addr, align 8
  %1592 = add i64 %stack_len2141, -1
  %sp2142 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1592
  %a2143 = load i256, ptr %sp2142, align 16
  %1593 = icmp eq i256 %a2143, 0
  %1594 = zext i1 %1593 to i256
  %1595 = add i64 %stack_len2141, -1
  %sp2144 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1595
  store i256 %1594, ptr %sp2144, align 16
  br label %OP612.DUP2, !annotation !5

OP612.DUP2:                                       ; preds = %OP611.ISZERO
  %stack_len2145 = load i64, ptr %len.addr, align 8
  %1596 = add i64 %stack_len2145, 1
  store i64 %1596, ptr %len.addr, align 8
  %1597 = sub i64 %stack_len2145, 2
  %sp2146 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1597
  %dup22147 = load i256, ptr %sp2146, align 16
  %sp2148 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2145
  store i256 %dup22147, ptr %sp2148, align 16
  br label %OP613.MSTORE, !annotation !5

OP613.MSTORE:                                     ; preds = %OP612.DUP2
  %stack_len2149 = load i64, ptr %len.addr, align 8
  %1598 = add i64 %stack_len2149, -2
  store i64 %1598, ptr %len.addr, align 8
  %1599 = add i64 %stack_len2149, -1
  %sp2150 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1599
  %a2151 = load i256, ptr %sp2150, align 16
  %1600 = add i64 %stack_len2149, -2
  %sp2152 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1600
  %b2153 = load i256, ptr %sp2152, align 16
  %1601 = call i8 @__revmc_ir_builtin_mstore(i256 %a2151, i256 %b2153, ptr %arg.ecx.addr)
  %1602 = icmp ne i8 %1601, 0
  br i1 %1602, label %return, label %OP613.MSTORE.contd, !prof !2

OP613.MSTORE.contd:                               ; preds = %OP613.MSTORE
  br label %OP614.PUSH1, !annotation !5

OP614.PUSH1:                                      ; preds = %OP613.MSTORE.contd
  %stack_len2154 = load i64, ptr %len.addr, align 8
  %1603 = add i64 %stack_len2154, 1
  store i64 %1603, ptr %len.addr, align 8
  %sp2155 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2154
  store i256 32, ptr %sp2155, align 16
  br label %OP615.ADD, !annotation !5

OP615.ADD:                                        ; preds = %OP614.PUSH1
  %stack_len2156 = load i64, ptr %len.addr, align 8
  %1604 = add i64 %stack_len2156, -1
  store i64 %1604, ptr %len.addr, align 8
  %1605 = add i64 %stack_len2156, -1
  %sp2157 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1605
  %a2158 = load i256, ptr %sp2157, align 16
  %1606 = add i64 %stack_len2156, -2
  %sp2159 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1606
  %b2160 = load i256, ptr %sp2159, align 16
  %1607 = add i256 %a2158, %b2160
  %1608 = add i64 %stack_len2156, -2
  %sp2161 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1608
  store i256 %1607, ptr %sp2161, align 16
  br label %OP616.SWAP2, !annotation !5

OP616.SWAP2:                                      ; preds = %OP615.ADD
  %stack_len2162 = load i64, ptr %len.addr, align 8
  %1609 = sub i64 %stack_len2162, 1
  %sp2163 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1609
  %swap.a2164 = load i256, ptr %sp2163, align 16
  %1610 = sub i64 %stack_len2162, 3
  %sp2165 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1610
  %swap.b2166 = load i256, ptr %sp2165, align 16
  store i256 %swap.a2164, ptr %sp2165, align 16
  store i256 %swap.b2166, ptr %sp2163, align 16
  br label %OP617.POP, !annotation !5

OP617.POP:                                        ; preds = %OP616.SWAP2
  %stack_len2167 = load i64, ptr %len.addr, align 8
  %1611 = add i64 %stack_len2167, -1
  store i64 %1611, ptr %len.addr, align 8
  br label %OP618.POP, !annotation !5

OP618.POP:                                        ; preds = %OP617.POP
  %stack_len2168 = load i64, ptr %len.addr, align 8
  %1612 = add i64 %stack_len2168, -1
  store i64 %1612, ptr %len.addr, align 8
  br label %OP619.PUSH1, !annotation !5

OP619.PUSH1:                                      ; preds = %OP618.POP
  %stack_len2169 = load i64, ptr %len.addr, align 8
  %1613 = add i64 %stack_len2169, 1
  store i64 %1613, ptr %len.addr, align 8
  %sp2170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2169
  store i256 64, ptr %sp2170, align 16
  br label %OP620.MLOAD, !annotation !5

OP620.MLOAD:                                      ; preds = %OP619.PUSH1
  %stack_len2171 = load i64, ptr %len.addr, align 8
  %1614 = add i64 %stack_len2171, -1
  %sp2172 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1614
  %a2173 = load i256, ptr %sp2172, align 16
  %mload.out.slot2174 = alloca i256, align 16
  %1615 = call i8 @__revmc_ir_builtin_mload(i256 %a2173, ptr %mload.out.slot2174, ptr %arg.ecx.addr)
  %1616 = icmp ne i8 %1615, 0
  br i1 %1616, label %return, label %OP620.MLOAD.contd, !prof !2

OP620.MLOAD.contd:                                ; preds = %OP620.MLOAD
  %mload.out2175 = load i256, ptr %mload.out.slot2174, align 16
  %1617 = add i64 %stack_len2171, -1
  %sp2176 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1617
  store i256 %mload.out2175, ptr %sp2176, align 16
  br label %OP621.DUP1, !annotation !5

OP621.DUP1:                                       ; preds = %OP620.MLOAD.contd
  %stack_len2177 = load i64, ptr %len.addr, align 8
  %1618 = add i64 %stack_len2177, 1
  store i64 %1618, ptr %len.addr, align 8
  %1619 = sub i64 %stack_len2177, 1
  %sp2178 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1619
  %dup12179 = load i256, ptr %sp2178, align 16
  %sp2180 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2177
  store i256 %dup12179, ptr %sp2180, align 16
  br label %OP622.SWAP2, !annotation !5

OP622.SWAP2:                                      ; preds = %OP621.DUP1
  %stack_len2181 = load i64, ptr %len.addr, align 8
  %1620 = sub i64 %stack_len2181, 1
  %sp2182 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1620
  %swap.a2183 = load i256, ptr %sp2182, align 16
  %1621 = sub i64 %stack_len2181, 3
  %sp2184 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1621
  %swap.b2185 = load i256, ptr %sp2184, align 16
  store i256 %swap.a2183, ptr %sp2184, align 16
  store i256 %swap.b2185, ptr %sp2182, align 16
  br label %OP623.SUB, !annotation !5

OP623.SUB:                                        ; preds = %OP622.SWAP2
  %stack_len2186 = load i64, ptr %len.addr, align 8
  %1622 = add i64 %stack_len2186, -1
  store i64 %1622, ptr %len.addr, align 8
  %1623 = add i64 %stack_len2186, -1
  %sp2187 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1623
  %a2188 = load i256, ptr %sp2187, align 16
  %1624 = add i64 %stack_len2186, -2
  %sp2189 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1624
  %b2190 = load i256, ptr %sp2189, align 16
  %1625 = sub i256 %a2188, %b2190
  %1626 = add i64 %stack_len2186, -2
  %sp2191 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1626
  store i256 %1625, ptr %sp2191, align 16
  br label %OP624.SWAP1, !annotation !5

OP624.SWAP1:                                      ; preds = %OP623.SUB
  %stack_len2192 = load i64, ptr %len.addr, align 8
  %1627 = sub i64 %stack_len2192, 1
  %sp2193 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1627
  %swap.a2194 = load i256, ptr %sp2193, align 16
  %1628 = sub i64 %stack_len2192, 2
  %sp2195 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1628
  %swap.b2196 = load i256, ptr %sp2195, align 16
  store i256 %swap.a2194, ptr %sp2195, align 16
  store i256 %swap.b2196, ptr %sp2193, align 16
  br label %OP625.RETURN, !annotation !5

OP625.RETURN:                                     ; preds = %OP624.SWAP1
  %stack_len2197 = load i64, ptr %len.addr, align 8
  %1629 = add i64 %stack_len2197, -2
  store i64 %1629, ptr %len.addr, align 8
  %1630 = sub i64 %stack_len2197, 2
  %sp2198 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1630
  %1631 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp2198, i8 2)
  %1632 = icmp ne i8 %1631, 0
  br i1 %1632, label %return, label %OP625.RETURN.contd, !prof !2

OP625.RETURN.contd:                               ; preds = %OP625.RETURN
  br label %return, !annotation !10

OP626.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP64.JUMPI
  %gas.remaining2199 = load i64, ptr %gas.remaining.addr, align 8
  %1633 = sub i64 %gas.remaining2199, 15
  %1634 = icmp ult i64 %gas.remaining2199, 15
  store i64 %1633, ptr %gas.remaining.addr, align 8
  br i1 %1634, label %return, label %OP626.JUMPDEST.contd, !prof !2, !annotation !3

OP626.JUMPDEST.contd:                             ; preds = %OP626.JUMPDEST
  %stack_len2200 = load i64, ptr %len.addr, align 8
  %1635 = icmp ugt i64 %stack_len2200, 1022
  br i1 %1635, label %return, label %OP626.JUMPDEST.contd2201, !prof !2, !annotation !4

OP626.JUMPDEST.contd2201:                         ; preds = %OP626.JUMPDEST.contd
  br label %OP627.PUSH2, !annotation !5

OP627.PUSH2:                                      ; preds = %OP626.JUMPDEST.contd2201
  %stack_len2202 = load i64, ptr %len.addr, align 8
  %1636 = add i64 %stack_len2202, 1
  store i64 %1636, ptr %len.addr, align 8
  %sp2203 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2202
  store i256 978, ptr %sp2203, align 16
  br label %OP628.PUSH2, !annotation !5

OP628.PUSH2:                                      ; preds = %OP627.PUSH2
  br label %OP629.JUMP, !annotation !6

OP629.JUMP:                                       ; preds = %OP628.PUSH2
  %stack_len2204 = load i64, ptr %len.addr, align 8
  br label %OP687.JUMPDEST

OP630.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining2205 = load i64, ptr %gas.remaining.addr, align 8
  %1637 = sub i64 %gas.remaining2205, 1
  %1638 = icmp ult i64 %gas.remaining2205, 1
  store i64 %1637, ptr %gas.remaining.addr, align 8
  br i1 %1638, label %return, label %OP630.JUMPDEST.contd, !prof !2, !annotation !3

OP630.JUMPDEST.contd:                             ; preds = %OP630.JUMPDEST
  %stack_len2206 = load i64, ptr %len.addr, align 8
  br label %OP631.STOP, !annotation !5

OP631.STOP:                                       ; preds = %OP630.JUMPDEST.contd
  %stack_len2207 = load i64, ptr %len.addr, align 8
  br label %return, !annotation !7

OP632.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP69.JUMPI
  %gas.remaining2208 = load i64, ptr %gas.remaining.addr, align 8
  %1639 = sub i64 %gas.remaining2208, 19
  %1640 = icmp ult i64 %gas.remaining2208, 19
  store i64 %1639, ptr %gas.remaining.addr, align 8
  br i1 %1640, label %return, label %OP632.JUMPDEST.contd, !prof !2, !annotation !3

OP632.JUMPDEST.contd:                             ; preds = %OP632.JUMPDEST
  %stack_len2209 = load i64, ptr %len.addr, align 8
  %1641 = icmp ugt i64 %stack_len2209, 1022
  br i1 %1641, label %return, label %OP632.JUMPDEST.contd2210, !prof !2, !annotation !4

OP632.JUMPDEST.contd2210:                         ; preds = %OP632.JUMPDEST.contd
  br label %OP633.CALLVALUE, !annotation !5

OP633.CALLVALUE:                                  ; preds = %OP632.JUMPDEST.contd2210
  %stack_len2211 = load i64, ptr %len.addr, align 8
  %1642 = add i64 %stack_len2211, 1
  store i64 %1642, ptr %len.addr, align 8
  %contract.call_value.addr2212 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value2213 = load i256, ptr %contract.call_value.addr2212, align 16
  %sp2214 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2211
  store i256 %contract.call_value2213, ptr %sp2214, align 16
  br label %OP634.ISZERO, !annotation !5

OP634.ISZERO:                                     ; preds = %OP633.CALLVALUE
  %stack_len2215 = load i64, ptr %len.addr, align 8
  %1643 = add i64 %stack_len2215, -1
  %sp2216 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1643
  %a2217 = load i256, ptr %sp2216, align 16
  %1644 = icmp eq i256 %a2217, 0
  %1645 = zext i1 %1644 to i256
  %1646 = add i64 %stack_len2215, -1
  %sp2218 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1646
  store i256 %1645, ptr %sp2218, align 16
  br label %OP635.PUSH2, !annotation !5

OP635.PUSH2:                                      ; preds = %OP634.ISZERO
  br label %OP636.JUMPI, !annotation !6

OP636.JUMPI:                                      ; preds = %OP635.PUSH2
  %stack_len2219 = load i64, ptr %len.addr, align 8
  %1647 = add i64 %stack_len2219, -1
  store i64 %1647, ptr %len.addr, align 8
  %1648 = add i64 %stack_len2219, -1
  %sp2220 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1648
  %a2221 = load i256, ptr %sp2220, align 16
  %1649 = icmp ne i256 %a2221, 0
  br i1 %1649, label %OP640.JUMPDEST, label %OP637.PUSH1

OP637.PUSH1:                                      ; preds = %OP636.JUMPI
  %gas.remaining2222 = load i64, ptr %gas.remaining.addr, align 8
  %1650 = sub i64 %gas.remaining2222, 6
  %1651 = icmp ult i64 %gas.remaining2222, 6
  store i64 %1650, ptr %gas.remaining.addr, align 8
  br i1 %1651, label %return, label %OP637.PUSH1.contd, !prof !2, !annotation !3

OP637.PUSH1.contd:                                ; preds = %OP637.PUSH1
  %stack_len2223 = load i64, ptr %len.addr, align 8
  %1652 = icmp ugt i64 %stack_len2223, 1022
  br i1 %1652, label %return, label %OP637.PUSH1.contd2224, !prof !2, !annotation !4

OP637.PUSH1.contd2224:                            ; preds = %OP637.PUSH1.contd
  %1653 = add i64 %stack_len2223, 1
  store i64 %1653, ptr %len.addr, align 8
  %sp2225 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2223
  store i256 0, ptr %sp2225, align 16
  br label %OP638.DUP1, !annotation !5

OP638.DUP1:                                       ; preds = %OP637.PUSH1.contd2224
  %stack_len2226 = load i64, ptr %len.addr, align 8
  %1654 = add i64 %stack_len2226, 1
  store i64 %1654, ptr %len.addr, align 8
  %1655 = sub i64 %stack_len2226, 1
  %sp2227 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1655
  %dup12228 = load i256, ptr %sp2227, align 16
  %sp2229 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2226
  store i256 %dup12228, ptr %sp2229, align 16
  br label %OP639.REVERT, !annotation !5

OP639.REVERT:                                     ; preds = %OP638.DUP1
  %stack_len2230 = load i64, ptr %len.addr, align 8
  %1656 = add i64 %stack_len2230, -2
  store i64 %1656, ptr %len.addr, align 8
  %1657 = sub i64 %stack_len2230, 2
  %sp2231 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1657
  %1658 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp2231, i8 16)
  %1659 = icmp ne i8 %1658, 0
  br i1 %1659, label %return, label %OP639.REVERT.contd, !prof !2

OP639.REVERT.contd:                               ; preds = %OP639.REVERT
  br label %return, !annotation !8

OP640.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP636.JUMPI
  %gas.remaining2232 = load i64, ptr %gas.remaining.addr, align 8
  %1660 = sub i64 %gas.remaining2232, 85
  %1661 = icmp ult i64 %gas.remaining2232, 85
  store i64 %1660, ptr %gas.remaining.addr, align 8
  br i1 %1661, label %return, label %OP640.JUMPDEST.contd, !prof !2, !annotation !3

OP640.JUMPDEST.contd:                             ; preds = %OP640.JUMPDEST
  %stack_len2233 = load i64, ptr %len.addr, align 8
  %1662 = icmp ugt i64 %stack_len2233, 1018
  br i1 %1662, label %return, label %OP640.JUMPDEST.contd2234, !prof !2, !annotation !4

OP640.JUMPDEST.contd2234:                         ; preds = %OP640.JUMPDEST.contd
  br label %OP641.PUSH2, !annotation !5

OP641.PUSH2:                                      ; preds = %OP640.JUMPDEST.contd2234
  %stack_len2235 = load i64, ptr %len.addr, align 8
  %1663 = add i64 %stack_len2235, 1
  store i64 %1663, ptr %len.addr, align 8
  %sp2236 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2235
  store i256 1066, ptr %sp2236, align 16
  br label %OP642.PUSH1, !annotation !5

OP642.PUSH1:                                      ; preds = %OP641.PUSH2
  %stack_len2237 = load i64, ptr %len.addr, align 8
  %1664 = add i64 %stack_len2237, 1
  store i64 %1664, ptr %len.addr, align 8
  %sp2238 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2237
  store i256 4, ptr %sp2238, align 16
  br label %OP643.DUP1, !annotation !5

OP643.DUP1:                                       ; preds = %OP642.PUSH1
  %stack_len2239 = load i64, ptr %len.addr, align 8
  %1665 = add i64 %stack_len2239, 1
  store i64 %1665, ptr %len.addr, align 8
  %1666 = sub i64 %stack_len2239, 1
  %sp2240 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1666
  %dup12241 = load i256, ptr %sp2240, align 16
  %sp2242 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2239
  store i256 %dup12241, ptr %sp2242, align 16
  br label %OP644.DUP1, !annotation !5

OP644.DUP1:                                       ; preds = %OP643.DUP1
  %stack_len2243 = load i64, ptr %len.addr, align 8
  %1667 = add i64 %stack_len2243, 1
  store i64 %1667, ptr %len.addr, align 8
  %1668 = sub i64 %stack_len2243, 1
  %sp2244 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1668
  %dup12245 = load i256, ptr %sp2244, align 16
  %sp2246 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2243
  store i256 %dup12245, ptr %sp2246, align 16
  br label %OP645.CALLDATALOAD, !annotation !5

OP645.CALLDATALOAD:                               ; preds = %OP644.DUP1
  %stack_len2247 = load i64, ptr %len.addr, align 8
  %1669 = add i64 %stack_len2247, -1
  %sp2248 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1669
  %a2249 = load i256, ptr %sp2248, align 16
  %1670 = call i256 @__revmc_ir_builtin_calldataload(i256 %a2249, ptr %arg.contract.addr)
  %1671 = add i64 %stack_len2247, -1
  %sp2250 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1671
  store i256 %1670, ptr %sp2250, align 16
  br label %OP646.PUSH20, !annotation !5

OP646.PUSH20:                                     ; preds = %OP645.CALLDATALOAD
  %stack_len2251 = load i64, ptr %len.addr, align 8
  %1672 = add i64 %stack_len2251, 1
  store i64 %1672, ptr %len.addr, align 8
  %sp2252 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2251
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp2252, align 16
  br label %OP647.AND, !annotation !5

OP647.AND:                                        ; preds = %OP646.PUSH20
  %stack_len2253 = load i64, ptr %len.addr, align 8
  %1673 = add i64 %stack_len2253, -1
  store i64 %1673, ptr %len.addr, align 8
  %1674 = add i64 %stack_len2253, -1
  %sp2254 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1674
  %a2255 = load i256, ptr %sp2254, align 16
  %1675 = add i64 %stack_len2253, -2
  %sp2256 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1675
  %b2257 = load i256, ptr %sp2256, align 16
  %1676 = and i256 %a2255, %b2257
  %1677 = add i64 %stack_len2253, -2
  %sp2258 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1677
  store i256 %1676, ptr %sp2258, align 16
  br label %OP648.SWAP1, !annotation !5

OP648.SWAP1:                                      ; preds = %OP647.AND
  %stack_len2259 = load i64, ptr %len.addr, align 8
  %1678 = sub i64 %stack_len2259, 1
  %sp2260 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1678
  %swap.a2261 = load i256, ptr %sp2260, align 16
  %1679 = sub i64 %stack_len2259, 2
  %sp2262 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1679
  %swap.b2263 = load i256, ptr %sp2262, align 16
  store i256 %swap.a2261, ptr %sp2262, align 16
  store i256 %swap.b2263, ptr %sp2260, align 16
  br label %OP649.PUSH1, !annotation !5

OP649.PUSH1:                                      ; preds = %OP648.SWAP1
  %stack_len2264 = load i64, ptr %len.addr, align 8
  %1680 = add i64 %stack_len2264, 1
  store i64 %1680, ptr %len.addr, align 8
  %sp2265 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2264
  store i256 32, ptr %sp2265, align 16
  br label %OP650.ADD, !annotation !5

OP650.ADD:                                        ; preds = %OP649.PUSH1
  %stack_len2266 = load i64, ptr %len.addr, align 8
  %1681 = add i64 %stack_len2266, -1
  store i64 %1681, ptr %len.addr, align 8
  %1682 = add i64 %stack_len2266, -1
  %sp2267 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1682
  %a2268 = load i256, ptr %sp2267, align 16
  %1683 = add i64 %stack_len2266, -2
  %sp2269 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1683
  %b2270 = load i256, ptr %sp2269, align 16
  %1684 = add i256 %a2268, %b2270
  %1685 = add i64 %stack_len2266, -2
  %sp2271 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1685
  store i256 %1684, ptr %sp2271, align 16
  br label %OP651.SWAP1, !annotation !5

OP651.SWAP1:                                      ; preds = %OP650.ADD
  %stack_len2272 = load i64, ptr %len.addr, align 8
  %1686 = sub i64 %stack_len2272, 1
  %sp2273 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1686
  %swap.a2274 = load i256, ptr %sp2273, align 16
  %1687 = sub i64 %stack_len2272, 2
  %sp2275 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1687
  %swap.b2276 = load i256, ptr %sp2275, align 16
  store i256 %swap.a2274, ptr %sp2275, align 16
  store i256 %swap.b2276, ptr %sp2273, align 16
  br label %OP652.SWAP2, !annotation !5

OP652.SWAP2:                                      ; preds = %OP651.SWAP1
  %stack_len2277 = load i64, ptr %len.addr, align 8
  %1688 = sub i64 %stack_len2277, 1
  %sp2278 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1688
  %swap.a2279 = load i256, ptr %sp2278, align 16
  %1689 = sub i64 %stack_len2277, 3
  %sp2280 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1689
  %swap.b2281 = load i256, ptr %sp2280, align 16
  store i256 %swap.a2279, ptr %sp2280, align 16
  store i256 %swap.b2281, ptr %sp2278, align 16
  br label %OP653.SWAP1, !annotation !5

OP653.SWAP1:                                      ; preds = %OP652.SWAP2
  %stack_len2282 = load i64, ptr %len.addr, align 8
  %1690 = sub i64 %stack_len2282, 1
  %sp2283 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1690
  %swap.a2284 = load i256, ptr %sp2283, align 16
  %1691 = sub i64 %stack_len2282, 2
  %sp2285 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1691
  %swap.b2286 = load i256, ptr %sp2285, align 16
  store i256 %swap.a2284, ptr %sp2285, align 16
  store i256 %swap.b2286, ptr %sp2283, align 16
  br label %OP654.DUP1, !annotation !5

OP654.DUP1:                                       ; preds = %OP653.SWAP1
  %stack_len2287 = load i64, ptr %len.addr, align 8
  %1692 = add i64 %stack_len2287, 1
  store i64 %1692, ptr %len.addr, align 8
  %1693 = sub i64 %stack_len2287, 1
  %sp2288 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1693
  %dup12289 = load i256, ptr %sp2288, align 16
  %sp2290 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2287
  store i256 %dup12289, ptr %sp2290, align 16
  br label %OP655.CALLDATALOAD, !annotation !5

OP655.CALLDATALOAD:                               ; preds = %OP654.DUP1
  %stack_len2291 = load i64, ptr %len.addr, align 8
  %1694 = add i64 %stack_len2291, -1
  %sp2292 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1694
  %a2293 = load i256, ptr %sp2292, align 16
  %1695 = call i256 @__revmc_ir_builtin_calldataload(i256 %a2293, ptr %arg.contract.addr)
  %1696 = add i64 %stack_len2291, -1
  %sp2294 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1696
  store i256 %1695, ptr %sp2294, align 16
  br label %OP656.PUSH20, !annotation !5

OP656.PUSH20:                                     ; preds = %OP655.CALLDATALOAD
  %stack_len2295 = load i64, ptr %len.addr, align 8
  %1697 = add i64 %stack_len2295, 1
  store i64 %1697, ptr %len.addr, align 8
  %sp2296 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2295
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp2296, align 16
  br label %OP657.AND, !annotation !5

OP657.AND:                                        ; preds = %OP656.PUSH20
  %stack_len2297 = load i64, ptr %len.addr, align 8
  %1698 = add i64 %stack_len2297, -1
  store i64 %1698, ptr %len.addr, align 8
  %1699 = add i64 %stack_len2297, -1
  %sp2298 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1699
  %a2299 = load i256, ptr %sp2298, align 16
  %1700 = add i64 %stack_len2297, -2
  %sp2300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1700
  %b2301 = load i256, ptr %sp2300, align 16
  %1701 = and i256 %a2299, %b2301
  %1702 = add i64 %stack_len2297, -2
  %sp2302 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1702
  store i256 %1701, ptr %sp2302, align 16
  br label %OP658.SWAP1, !annotation !5

OP658.SWAP1:                                      ; preds = %OP657.AND
  %stack_len2303 = load i64, ptr %len.addr, align 8
  %1703 = sub i64 %stack_len2303, 1
  %sp2304 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1703
  %swap.a2305 = load i256, ptr %sp2304, align 16
  %1704 = sub i64 %stack_len2303, 2
  %sp2306 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1704
  %swap.b2307 = load i256, ptr %sp2306, align 16
  store i256 %swap.a2305, ptr %sp2306, align 16
  store i256 %swap.b2307, ptr %sp2304, align 16
  br label %OP659.PUSH1, !annotation !5

OP659.PUSH1:                                      ; preds = %OP658.SWAP1
  %stack_len2308 = load i64, ptr %len.addr, align 8
  %1705 = add i64 %stack_len2308, 1
  store i64 %1705, ptr %len.addr, align 8
  %sp2309 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2308
  store i256 32, ptr %sp2309, align 16
  br label %OP660.ADD, !annotation !5

OP660.ADD:                                        ; preds = %OP659.PUSH1
  %stack_len2310 = load i64, ptr %len.addr, align 8
  %1706 = add i64 %stack_len2310, -1
  store i64 %1706, ptr %len.addr, align 8
  %1707 = add i64 %stack_len2310, -1
  %sp2311 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1707
  %a2312 = load i256, ptr %sp2311, align 16
  %1708 = add i64 %stack_len2310, -2
  %sp2313 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1708
  %b2314 = load i256, ptr %sp2313, align 16
  %1709 = add i256 %a2312, %b2314
  %1710 = add i64 %stack_len2310, -2
  %sp2315 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1710
  store i256 %1709, ptr %sp2315, align 16
  br label %OP661.SWAP1, !annotation !5

OP661.SWAP1:                                      ; preds = %OP660.ADD
  %stack_len2316 = load i64, ptr %len.addr, align 8
  %1711 = sub i64 %stack_len2316, 1
  %sp2317 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1711
  %swap.a2318 = load i256, ptr %sp2317, align 16
  %1712 = sub i64 %stack_len2316, 2
  %sp2319 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1712
  %swap.b2320 = load i256, ptr %sp2319, align 16
  store i256 %swap.a2318, ptr %sp2319, align 16
  store i256 %swap.b2320, ptr %sp2317, align 16
  br label %OP662.SWAP2, !annotation !5

OP662.SWAP2:                                      ; preds = %OP661.SWAP1
  %stack_len2321 = load i64, ptr %len.addr, align 8
  %1713 = sub i64 %stack_len2321, 1
  %sp2322 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1713
  %swap.a2323 = load i256, ptr %sp2322, align 16
  %1714 = sub i64 %stack_len2321, 3
  %sp2324 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1714
  %swap.b2325 = load i256, ptr %sp2324, align 16
  store i256 %swap.a2323, ptr %sp2324, align 16
  store i256 %swap.b2325, ptr %sp2322, align 16
  br label %OP663.SWAP1, !annotation !5

OP663.SWAP1:                                      ; preds = %OP662.SWAP2
  %stack_len2326 = load i64, ptr %len.addr, align 8
  %1715 = sub i64 %stack_len2326, 1
  %sp2327 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1715
  %swap.a2328 = load i256, ptr %sp2327, align 16
  %1716 = sub i64 %stack_len2326, 2
  %sp2329 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1716
  %swap.b2330 = load i256, ptr %sp2329, align 16
  store i256 %swap.a2328, ptr %sp2329, align 16
  store i256 %swap.b2330, ptr %sp2327, align 16
  br label %OP664.POP, !annotation !5

OP664.POP:                                        ; preds = %OP663.SWAP1
  %stack_len2331 = load i64, ptr %len.addr, align 8
  %1717 = add i64 %stack_len2331, -1
  store i64 %1717, ptr %len.addr, align 8
  br label %OP665.POP, !annotation !5

OP665.POP:                                        ; preds = %OP664.POP
  %stack_len2332 = load i64, ptr %len.addr, align 8
  %1718 = add i64 %stack_len2332, -1
  store i64 %1718, ptr %len.addr, align 8
  br label %OP666.PUSH2, !annotation !5

OP666.PUSH2:                                      ; preds = %OP665.POP
  br label %OP667.JUMP, !annotation !6

OP667.JUMP:                                       ; preds = %OP666.PUSH2
  %stack_len2333 = load i64, ptr %len.addr, align 8
  br label %OP1527.JUMPDEST

OP668.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining2334 = load i64, ptr %gas.remaining.addr, align 8
  %1719 = sub i64 %gas.remaining2334, 50
  %1720 = icmp ult i64 %gas.remaining2334, 50
  store i64 %1719, ptr %gas.remaining.addr, align 8
  br i1 %1720, label %return, label %OP668.JUMPDEST.contd, !prof !2, !annotation !3

OP668.JUMPDEST.contd:                             ; preds = %OP668.JUMPDEST
  %stack_len2335 = load i64, ptr %len.addr, align 8
  %1721 = icmp ult i64 %stack_len2335, 1
  %1722 = icmp ugt i64 %stack_len2335, 1020
  %1723 = or i1 %1721, %1722
  %1724 = select i1 %1721, i8 91, i8 92
  br i1 %1723, label %return, label %OP668.JUMPDEST.contd2336, !prof !2

OP668.JUMPDEST.contd2336:                         ; preds = %OP668.JUMPDEST.contd
  br label %OP669.PUSH1, !annotation !5

OP669.PUSH1:                                      ; preds = %OP668.JUMPDEST.contd2336
  %stack_len2337 = load i64, ptr %len.addr, align 8
  %1725 = add i64 %stack_len2337, 1
  store i64 %1725, ptr %len.addr, align 8
  %sp2338 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2337
  store i256 64, ptr %sp2338, align 16
  br label %OP670.MLOAD, !annotation !5

OP670.MLOAD:                                      ; preds = %OP669.PUSH1
  %stack_len2339 = load i64, ptr %len.addr, align 8
  %1726 = add i64 %stack_len2339, -1
  %sp2340 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1726
  %a2341 = load i256, ptr %sp2340, align 16
  %mload.out.slot2342 = alloca i256, align 16
  %1727 = call i8 @__revmc_ir_builtin_mload(i256 %a2341, ptr %mload.out.slot2342, ptr %arg.ecx.addr)
  %1728 = icmp ne i8 %1727, 0
  br i1 %1728, label %return, label %OP670.MLOAD.contd, !prof !2

OP670.MLOAD.contd:                                ; preds = %OP670.MLOAD
  %mload.out2343 = load i256, ptr %mload.out.slot2342, align 16
  %1729 = add i64 %stack_len2339, -1
  %sp2344 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1729
  store i256 %mload.out2343, ptr %sp2344, align 16
  br label %OP671.DUP1, !annotation !5

OP671.DUP1:                                       ; preds = %OP670.MLOAD.contd
  %stack_len2345 = load i64, ptr %len.addr, align 8
  %1730 = add i64 %stack_len2345, 1
  store i64 %1730, ptr %len.addr, align 8
  %1731 = sub i64 %stack_len2345, 1
  %sp2346 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1731
  %dup12347 = load i256, ptr %sp2346, align 16
  %sp2348 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2345
  store i256 %dup12347, ptr %sp2348, align 16
  br label %OP672.DUP3, !annotation !5

OP672.DUP3:                                       ; preds = %OP671.DUP1
  %stack_len2349 = load i64, ptr %len.addr, align 8
  %1732 = add i64 %stack_len2349, 1
  store i64 %1732, ptr %len.addr, align 8
  %1733 = sub i64 %stack_len2349, 3
  %sp2350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1733
  %dup32351 = load i256, ptr %sp2350, align 16
  %sp2352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2349
  store i256 %dup32351, ptr %sp2352, align 16
  br label %OP673.DUP2, !annotation !5

OP673.DUP2:                                       ; preds = %OP672.DUP3
  %stack_len2353 = load i64, ptr %len.addr, align 8
  %1734 = add i64 %stack_len2353, 1
  store i64 %1734, ptr %len.addr, align 8
  %1735 = sub i64 %stack_len2353, 2
  %sp2354 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1735
  %dup22355 = load i256, ptr %sp2354, align 16
  %sp2356 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2353
  store i256 %dup22355, ptr %sp2356, align 16
  br label %OP674.MSTORE, !annotation !5

OP674.MSTORE:                                     ; preds = %OP673.DUP2
  %stack_len2357 = load i64, ptr %len.addr, align 8
  %1736 = add i64 %stack_len2357, -2
  store i64 %1736, ptr %len.addr, align 8
  %1737 = add i64 %stack_len2357, -1
  %sp2358 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1737
  %a2359 = load i256, ptr %sp2358, align 16
  %1738 = add i64 %stack_len2357, -2
  %sp2360 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1738
  %b2361 = load i256, ptr %sp2360, align 16
  %1739 = call i8 @__revmc_ir_builtin_mstore(i256 %a2359, i256 %b2361, ptr %arg.ecx.addr)
  %1740 = icmp ne i8 %1739, 0
  br i1 %1740, label %return, label %OP674.MSTORE.contd, !prof !2

OP674.MSTORE.contd:                               ; preds = %OP674.MSTORE
  br label %OP675.PUSH1, !annotation !5

OP675.PUSH1:                                      ; preds = %OP674.MSTORE.contd
  %stack_len2362 = load i64, ptr %len.addr, align 8
  %1741 = add i64 %stack_len2362, 1
  store i64 %1741, ptr %len.addr, align 8
  %sp2363 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2362
  store i256 32, ptr %sp2363, align 16
  br label %OP676.ADD, !annotation !5

OP676.ADD:                                        ; preds = %OP675.PUSH1
  %stack_len2364 = load i64, ptr %len.addr, align 8
  %1742 = add i64 %stack_len2364, -1
  store i64 %1742, ptr %len.addr, align 8
  %1743 = add i64 %stack_len2364, -1
  %sp2365 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1743
  %a2366 = load i256, ptr %sp2365, align 16
  %1744 = add i64 %stack_len2364, -2
  %sp2367 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1744
  %b2368 = load i256, ptr %sp2367, align 16
  %1745 = add i256 %a2366, %b2368
  %1746 = add i64 %stack_len2364, -2
  %sp2369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1746
  store i256 %1745, ptr %sp2369, align 16
  br label %OP677.SWAP2, !annotation !5

OP677.SWAP2:                                      ; preds = %OP676.ADD
  %stack_len2370 = load i64, ptr %len.addr, align 8
  %1747 = sub i64 %stack_len2370, 1
  %sp2371 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1747
  %swap.a2372 = load i256, ptr %sp2371, align 16
  %1748 = sub i64 %stack_len2370, 3
  %sp2373 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1748
  %swap.b2374 = load i256, ptr %sp2373, align 16
  store i256 %swap.a2372, ptr %sp2373, align 16
  store i256 %swap.b2374, ptr %sp2371, align 16
  br label %OP678.POP, !annotation !5

OP678.POP:                                        ; preds = %OP677.SWAP2
  %stack_len2375 = load i64, ptr %len.addr, align 8
  %1749 = add i64 %stack_len2375, -1
  store i64 %1749, ptr %len.addr, align 8
  br label %OP679.POP, !annotation !5

OP679.POP:                                        ; preds = %OP678.POP
  %stack_len2376 = load i64, ptr %len.addr, align 8
  %1750 = add i64 %stack_len2376, -1
  store i64 %1750, ptr %len.addr, align 8
  br label %OP680.PUSH1, !annotation !5

OP680.PUSH1:                                      ; preds = %OP679.POP
  %stack_len2377 = load i64, ptr %len.addr, align 8
  %1751 = add i64 %stack_len2377, 1
  store i64 %1751, ptr %len.addr, align 8
  %sp2378 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2377
  store i256 64, ptr %sp2378, align 16
  br label %OP681.MLOAD, !annotation !5

OP681.MLOAD:                                      ; preds = %OP680.PUSH1
  %stack_len2379 = load i64, ptr %len.addr, align 8
  %1752 = add i64 %stack_len2379, -1
  %sp2380 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1752
  %a2381 = load i256, ptr %sp2380, align 16
  %mload.out.slot2382 = alloca i256, align 16
  %1753 = call i8 @__revmc_ir_builtin_mload(i256 %a2381, ptr %mload.out.slot2382, ptr %arg.ecx.addr)
  %1754 = icmp ne i8 %1753, 0
  br i1 %1754, label %return, label %OP681.MLOAD.contd, !prof !2

OP681.MLOAD.contd:                                ; preds = %OP681.MLOAD
  %mload.out2383 = load i256, ptr %mload.out.slot2382, align 16
  %1755 = add i64 %stack_len2379, -1
  %sp2384 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1755
  store i256 %mload.out2383, ptr %sp2384, align 16
  br label %OP682.DUP1, !annotation !5

OP682.DUP1:                                       ; preds = %OP681.MLOAD.contd
  %stack_len2385 = load i64, ptr %len.addr, align 8
  %1756 = add i64 %stack_len2385, 1
  store i64 %1756, ptr %len.addr, align 8
  %1757 = sub i64 %stack_len2385, 1
  %sp2386 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1757
  %dup12387 = load i256, ptr %sp2386, align 16
  %sp2388 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2385
  store i256 %dup12387, ptr %sp2388, align 16
  br label %OP683.SWAP2, !annotation !5

OP683.SWAP2:                                      ; preds = %OP682.DUP1
  %stack_len2389 = load i64, ptr %len.addr, align 8
  %1758 = sub i64 %stack_len2389, 1
  %sp2390 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1758
  %swap.a2391 = load i256, ptr %sp2390, align 16
  %1759 = sub i64 %stack_len2389, 3
  %sp2392 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1759
  %swap.b2393 = load i256, ptr %sp2392, align 16
  store i256 %swap.a2391, ptr %sp2392, align 16
  store i256 %swap.b2393, ptr %sp2390, align 16
  br label %OP684.SUB, !annotation !5

OP684.SUB:                                        ; preds = %OP683.SWAP2
  %stack_len2394 = load i64, ptr %len.addr, align 8
  %1760 = add i64 %stack_len2394, -1
  store i64 %1760, ptr %len.addr, align 8
  %1761 = add i64 %stack_len2394, -1
  %sp2395 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1761
  %a2396 = load i256, ptr %sp2395, align 16
  %1762 = add i64 %stack_len2394, -2
  %sp2397 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1762
  %b2398 = load i256, ptr %sp2397, align 16
  %1763 = sub i256 %a2396, %b2398
  %1764 = add i64 %stack_len2394, -2
  %sp2399 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1764
  store i256 %1763, ptr %sp2399, align 16
  br label %OP685.SWAP1, !annotation !5

OP685.SWAP1:                                      ; preds = %OP684.SUB
  %stack_len2400 = load i64, ptr %len.addr, align 8
  %1765 = sub i64 %stack_len2400, 1
  %sp2401 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1765
  %swap.a2402 = load i256, ptr %sp2401, align 16
  %1766 = sub i64 %stack_len2400, 2
  %sp2403 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1766
  %swap.b2404 = load i256, ptr %sp2403, align 16
  store i256 %swap.a2402, ptr %sp2403, align 16
  store i256 %swap.b2404, ptr %sp2401, align 16
  br label %OP686.RETURN, !annotation !5

OP686.RETURN:                                     ; preds = %OP685.SWAP1
  %stack_len2405 = load i64, ptr %len.addr, align 8
  %1767 = add i64 %stack_len2405, -2
  store i64 %1767, ptr %len.addr, align 8
  %1768 = sub i64 %stack_len2405, 2
  %sp2406 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1768
  %1769 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp2406, i8 2)
  %1770 = icmp ne i8 %1769, 0
  br i1 %1770, label %return, label %OP686.RETURN.contd, !prof !2

OP686.RETURN.contd:                               ; preds = %OP686.RETURN
  br label %return, !annotation !10

OP687.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP629.JUMP, %OP73.JUMP
  %gas.remaining2407 = load i64, ptr %gas.remaining.addr, align 8
  %1771 = sub i64 %gas.remaining2407, 108
  %1772 = icmp ult i64 %gas.remaining2407, 108
  store i64 %1771, ptr %gas.remaining.addr, align 8
  br i1 %1772, label %return, label %OP687.JUMPDEST.contd, !prof !2, !annotation !3

OP687.JUMPDEST.contd:                             ; preds = %OP687.JUMPDEST
  %stack_len2408 = load i64, ptr %len.addr, align 8
  %1773 = icmp ugt i64 %stack_len2408, 1019
  br i1 %1773, label %return, label %OP687.JUMPDEST.contd2409, !prof !2, !annotation !4

OP687.JUMPDEST.contd2409:                         ; preds = %OP687.JUMPDEST.contd
  br label %OP688.CALLVALUE, !annotation !5

OP688.CALLVALUE:                                  ; preds = %OP687.JUMPDEST.contd2409
  %stack_len2410 = load i64, ptr %len.addr, align 8
  %1774 = add i64 %stack_len2410, 1
  store i64 %1774, ptr %len.addr, align 8
  %contract.call_value.addr2411 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value2412 = load i256, ptr %contract.call_value.addr2411, align 16
  %sp2413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2410
  store i256 %contract.call_value2412, ptr %sp2413, align 16
  br label %OP689.PUSH1, !annotation !5

OP689.PUSH1:                                      ; preds = %OP688.CALLVALUE
  %stack_len2414 = load i64, ptr %len.addr, align 8
  %1775 = add i64 %stack_len2414, 1
  store i64 %1775, ptr %len.addr, align 8
  %sp2415 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2414
  store i256 3, ptr %sp2415, align 16
  br label %OP690.PUSH1, !annotation !5

OP690.PUSH1:                                      ; preds = %OP689.PUSH1
  %stack_len2416 = load i64, ptr %len.addr, align 8
  %1776 = add i64 %stack_len2416, 1
  store i64 %1776, ptr %len.addr, align 8
  %sp2417 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2416
  store i256 0, ptr %sp2417, align 16
  br label %OP691.CALLER, !annotation !5

OP691.CALLER:                                     ; preds = %OP690.PUSH1
  %stack_len2418 = load i64, ptr %len.addr, align 8
  %1777 = add i64 %stack_len2418, 1
  store i64 %1777, ptr %len.addr, align 8
  %contract.caller.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller = load i160, ptr %contract.caller.addr, align 16
  %1778 = call i160 @llvm.bswap.i160(i160 %contract.caller)
  %1779 = zext i160 %1778 to i256
  %sp2419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2418
  store i256 %1779, ptr %sp2419, align 16
  br label %OP692.PUSH20, !annotation !5

OP692.PUSH20:                                     ; preds = %OP691.CALLER
  %stack_len2420 = load i64, ptr %len.addr, align 8
  %1780 = add i64 %stack_len2420, 1
  store i64 %1780, ptr %len.addr, align 8
  %sp2421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2420
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp2421, align 16
  br label %OP693.AND, !annotation !5

OP693.AND:                                        ; preds = %OP692.PUSH20
  %stack_len2422 = load i64, ptr %len.addr, align 8
  %1781 = add i64 %stack_len2422, -1
  store i64 %1781, ptr %len.addr, align 8
  %1782 = add i64 %stack_len2422, -1
  %sp2423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1782
  %a2424 = load i256, ptr %sp2423, align 16
  %1783 = add i64 %stack_len2422, -2
  %sp2425 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1783
  %b2426 = load i256, ptr %sp2425, align 16
  %1784 = and i256 %a2424, %b2426
  %1785 = add i64 %stack_len2422, -2
  %sp2427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1785
  store i256 %1784, ptr %sp2427, align 16
  br label %OP694.PUSH20, !annotation !5

OP694.PUSH20:                                     ; preds = %OP693.AND
  %stack_len2428 = load i64, ptr %len.addr, align 8
  %1786 = add i64 %stack_len2428, 1
  store i64 %1786, ptr %len.addr, align 8
  %sp2429 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2428
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp2429, align 16
  br label %OP695.AND, !annotation !5

OP695.AND:                                        ; preds = %OP694.PUSH20
  %stack_len2430 = load i64, ptr %len.addr, align 8
  %1787 = add i64 %stack_len2430, -1
  store i64 %1787, ptr %len.addr, align 8
  %1788 = add i64 %stack_len2430, -1
  %sp2431 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1788
  %a2432 = load i256, ptr %sp2431, align 16
  %1789 = add i64 %stack_len2430, -2
  %sp2433 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1789
  %b2434 = load i256, ptr %sp2433, align 16
  %1790 = and i256 %a2432, %b2434
  %1791 = add i64 %stack_len2430, -2
  %sp2435 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1791
  store i256 %1790, ptr %sp2435, align 16
  br label %OP696.DUP2, !annotation !5

OP696.DUP2:                                       ; preds = %OP695.AND
  %stack_len2436 = load i64, ptr %len.addr, align 8
  %1792 = add i64 %stack_len2436, 1
  store i64 %1792, ptr %len.addr, align 8
  %1793 = sub i64 %stack_len2436, 2
  %sp2437 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1793
  %dup22438 = load i256, ptr %sp2437, align 16
  %sp2439 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2436
  store i256 %dup22438, ptr %sp2439, align 16
  br label %OP697.MSTORE, !annotation !5

OP697.MSTORE:                                     ; preds = %OP696.DUP2
  %stack_len2440 = load i64, ptr %len.addr, align 8
  %1794 = add i64 %stack_len2440, -2
  store i64 %1794, ptr %len.addr, align 8
  %1795 = add i64 %stack_len2440, -1
  %sp2441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1795
  %a2442 = load i256, ptr %sp2441, align 16
  %1796 = add i64 %stack_len2440, -2
  %sp2443 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1796
  %b2444 = load i256, ptr %sp2443, align 16
  %1797 = call i8 @__revmc_ir_builtin_mstore(i256 %a2442, i256 %b2444, ptr %arg.ecx.addr)
  %1798 = icmp ne i8 %1797, 0
  br i1 %1798, label %return, label %OP697.MSTORE.contd, !prof !2

OP697.MSTORE.contd:                               ; preds = %OP697.MSTORE
  br label %OP698.PUSH1, !annotation !5

OP698.PUSH1:                                      ; preds = %OP697.MSTORE.contd
  %stack_len2445 = load i64, ptr %len.addr, align 8
  %1799 = add i64 %stack_len2445, 1
  store i64 %1799, ptr %len.addr, align 8
  %sp2446 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2445
  store i256 32, ptr %sp2446, align 16
  br label %OP699.ADD, !annotation !5

OP699.ADD:                                        ; preds = %OP698.PUSH1
  %stack_len2447 = load i64, ptr %len.addr, align 8
  %1800 = add i64 %stack_len2447, -1
  store i64 %1800, ptr %len.addr, align 8
  %1801 = add i64 %stack_len2447, -1
  %sp2448 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1801
  %a2449 = load i256, ptr %sp2448, align 16
  %1802 = add i64 %stack_len2447, -2
  %sp2450 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1802
  %b2451 = load i256, ptr %sp2450, align 16
  %1803 = add i256 %a2449, %b2451
  %1804 = add i64 %stack_len2447, -2
  %sp2452 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1804
  store i256 %1803, ptr %sp2452, align 16
  br label %OP700.SWAP1, !annotation !5

OP700.SWAP1:                                      ; preds = %OP699.ADD
  %stack_len2453 = load i64, ptr %len.addr, align 8
  %1805 = sub i64 %stack_len2453, 1
  %sp2454 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1805
  %swap.a2455 = load i256, ptr %sp2454, align 16
  %1806 = sub i64 %stack_len2453, 2
  %sp2456 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1806
  %swap.b2457 = load i256, ptr %sp2456, align 16
  store i256 %swap.a2455, ptr %sp2456, align 16
  store i256 %swap.b2457, ptr %sp2454, align 16
  br label %OP701.DUP2, !annotation !5

OP701.DUP2:                                       ; preds = %OP700.SWAP1
  %stack_len2458 = load i64, ptr %len.addr, align 8
  %1807 = add i64 %stack_len2458, 1
  store i64 %1807, ptr %len.addr, align 8
  %1808 = sub i64 %stack_len2458, 2
  %sp2459 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1808
  %dup22460 = load i256, ptr %sp2459, align 16
  %sp2461 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2458
  store i256 %dup22460, ptr %sp2461, align 16
  br label %OP702.MSTORE, !annotation !5

OP702.MSTORE:                                     ; preds = %OP701.DUP2
  %stack_len2462 = load i64, ptr %len.addr, align 8
  %1809 = add i64 %stack_len2462, -2
  store i64 %1809, ptr %len.addr, align 8
  %1810 = add i64 %stack_len2462, -1
  %sp2463 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1810
  %a2464 = load i256, ptr %sp2463, align 16
  %1811 = add i64 %stack_len2462, -2
  %sp2465 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1811
  %b2466 = load i256, ptr %sp2465, align 16
  %1812 = call i8 @__revmc_ir_builtin_mstore(i256 %a2464, i256 %b2466, ptr %arg.ecx.addr)
  %1813 = icmp ne i8 %1812, 0
  br i1 %1813, label %return, label %OP702.MSTORE.contd, !prof !2

OP702.MSTORE.contd:                               ; preds = %OP702.MSTORE
  br label %OP703.PUSH1, !annotation !5

OP703.PUSH1:                                      ; preds = %OP702.MSTORE.contd
  %stack_len2467 = load i64, ptr %len.addr, align 8
  %1814 = add i64 %stack_len2467, 1
  store i64 %1814, ptr %len.addr, align 8
  %sp2468 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2467
  store i256 32, ptr %sp2468, align 16
  br label %OP704.ADD, !annotation !5

OP704.ADD:                                        ; preds = %OP703.PUSH1
  %stack_len2469 = load i64, ptr %len.addr, align 8
  %1815 = add i64 %stack_len2469, -1
  store i64 %1815, ptr %len.addr, align 8
  %1816 = add i64 %stack_len2469, -1
  %sp2470 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1816
  %a2471 = load i256, ptr %sp2470, align 16
  %1817 = add i64 %stack_len2469, -2
  %sp2472 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1817
  %b2473 = load i256, ptr %sp2472, align 16
  %1818 = add i256 %a2471, %b2473
  %1819 = add i64 %stack_len2469, -2
  %sp2474 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1819
  store i256 %1818, ptr %sp2474, align 16
  br label %OP705.PUSH1, !annotation !5

OP705.PUSH1:                                      ; preds = %OP704.ADD
  %stack_len2475 = load i64, ptr %len.addr, align 8
  %1820 = add i64 %stack_len2475, 1
  store i64 %1820, ptr %len.addr, align 8
  %sp2476 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2475
  store i256 0, ptr %sp2476, align 16
  br label %OP706.KECCAK256, !annotation !5

OP706.KECCAK256:                                  ; preds = %OP705.PUSH1
  %stack_len2477 = load i64, ptr %len.addr, align 8
  %1821 = add i64 %stack_len2477, -1
  store i64 %1821, ptr %len.addr, align 8
  %1822 = sub i64 %stack_len2477, 2
  %sp2478 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1822
  %1823 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp2478)
  %1824 = icmp ne i8 %1823, 0
  br i1 %1824, label %return, label %OP706.KECCAK256.contd, !prof !2

OP706.KECCAK256.contd:                            ; preds = %OP706.KECCAK256
  br label %OP707.PUSH1, !annotation !5

OP707.PUSH1:                                      ; preds = %OP706.KECCAK256.contd
  %stack_len2479 = load i64, ptr %len.addr, align 8
  %1825 = add i64 %stack_len2479, 1
  store i64 %1825, ptr %len.addr, align 8
  %sp2480 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2479
  store i256 0, ptr %sp2480, align 16
  br label %OP708.DUP3, !annotation !5

OP708.DUP3:                                       ; preds = %OP707.PUSH1
  %stack_len2481 = load i64, ptr %len.addr, align 8
  %1826 = add i64 %stack_len2481, 1
  store i64 %1826, ptr %len.addr, align 8
  %1827 = sub i64 %stack_len2481, 3
  %sp2482 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1827
  %dup32483 = load i256, ptr %sp2482, align 16
  %sp2484 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2481
  store i256 %dup32483, ptr %sp2484, align 16
  br label %OP709.DUP3, !annotation !5

OP709.DUP3:                                       ; preds = %OP708.DUP3
  %stack_len2485 = load i64, ptr %len.addr, align 8
  %1828 = add i64 %stack_len2485, 1
  store i64 %1828, ptr %len.addr, align 8
  %1829 = sub i64 %stack_len2485, 3
  %sp2486 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1829
  %dup32487 = load i256, ptr %sp2486, align 16
  %sp2488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2485
  store i256 %dup32487, ptr %sp2488, align 16
  br label %OP710.SLOAD, !annotation !5

OP710.SLOAD:                                      ; preds = %OP709.DUP3
  %stack_len2489 = load i64, ptr %len.addr, align 8
  %1830 = sub i64 %stack_len2489, 1
  %sp2490 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1830
  %1831 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp2490, i8 19)
  %1832 = icmp ne i8 %1831, 0
  br i1 %1832, label %return, label %OP710.SLOAD.contd, !prof !2

OP710.SLOAD.contd:                                ; preds = %OP710.SLOAD
  br label %OP711.ADD, !annotation !5

OP711.ADD:                                        ; preds = %OP710.SLOAD.contd
  %stack_len2491 = load i64, ptr %len.addr, align 8
  %1833 = add i64 %stack_len2491, -1
  store i64 %1833, ptr %len.addr, align 8
  %1834 = add i64 %stack_len2491, -1
  %sp2492 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1834
  %a2493 = load i256, ptr %sp2492, align 16
  %1835 = add i64 %stack_len2491, -2
  %sp2494 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1835
  %b2495 = load i256, ptr %sp2494, align 16
  %1836 = add i256 %a2493, %b2495
  %1837 = add i64 %stack_len2491, -2
  %sp2496 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1837
  store i256 %1836, ptr %sp2496, align 16
  br label %OP712.SWAP3, !annotation !5

OP712.SWAP3:                                      ; preds = %OP711.ADD
  %stack_len2497 = load i64, ptr %len.addr, align 8
  %1838 = sub i64 %stack_len2497, 1
  %sp2498 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1838
  %swap.a2499 = load i256, ptr %sp2498, align 16
  %1839 = sub i64 %stack_len2497, 4
  %sp2500 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1839
  %swap.b2501 = load i256, ptr %sp2500, align 16
  store i256 %swap.a2499, ptr %sp2500, align 16
  store i256 %swap.b2501, ptr %sp2498, align 16
  br label %OP713.POP, !annotation !5

OP713.POP:                                        ; preds = %OP712.SWAP3
  %stack_len2502 = load i64, ptr %len.addr, align 8
  %1840 = add i64 %stack_len2502, -1
  store i64 %1840, ptr %len.addr, align 8
  br label %OP714.POP, !annotation !5

OP714.POP:                                        ; preds = %OP713.POP
  %stack_len2503 = load i64, ptr %len.addr, align 8
  %1841 = add i64 %stack_len2503, -1
  store i64 %1841, ptr %len.addr, align 8
  br label %OP715.DUP2, !annotation !5

OP715.DUP2:                                       ; preds = %OP714.POP
  %stack_len2504 = load i64, ptr %len.addr, align 8
  %1842 = add i64 %stack_len2504, 1
  store i64 %1842, ptr %len.addr, align 8
  %1843 = sub i64 %stack_len2504, 2
  %sp2505 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1843
  %dup22506 = load i256, ptr %sp2505, align 16
  %sp2507 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2504
  store i256 %dup22506, ptr %sp2507, align 16
  br label %OP716.SWAP1, !annotation !5

OP716.SWAP1:                                      ; preds = %OP715.DUP2
  %stack_len2508 = load i64, ptr %len.addr, align 8
  %1844 = sub i64 %stack_len2508, 1
  %sp2509 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1844
  %swap.a2510 = load i256, ptr %sp2509, align 16
  %1845 = sub i64 %stack_len2508, 2
  %sp2511 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1845
  %swap.b2512 = load i256, ptr %sp2511, align 16
  store i256 %swap.a2510, ptr %sp2511, align 16
  store i256 %swap.b2512, ptr %sp2509, align 16
  br label %OP717.SSTORE, !annotation !5

OP717.SSTORE:                                     ; preds = %OP716.SWAP1
  %stack_len2513 = load i64, ptr %len.addr, align 8
  %1846 = add i64 %stack_len2513, -2
  store i64 %1846, ptr %len.addr, align 8
  %1847 = sub i64 %stack_len2513, 2
  %sp2514 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1847
  %1848 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp2514, i8 19)
  %1849 = icmp ne i8 %1848, 0
  br i1 %1849, label %return, label %OP717.SSTORE.contd, !prof !2

OP717.SSTORE.contd:                               ; preds = %OP717.SSTORE
  br label %OP718.POP, !annotation !5

OP718.POP:                                        ; preds = %OP717.SSTORE.contd
  %gas.remaining2515 = load i64, ptr %gas.remaining.addr, align 8
  %1850 = sub i64 %gas.remaining2515, 1197
  %1851 = icmp ult i64 %gas.remaining2515, 1197
  store i64 %1850, ptr %gas.remaining.addr, align 8
  br i1 %1851, label %return, label %OP718.POP.contd, !prof !2, !annotation !3

OP718.POP.contd:                                  ; preds = %OP718.POP
  %stack_len2516 = load i64, ptr %len.addr, align 8
  %1852 = icmp ult i64 %stack_len2516, 2
  %1853 = icmp ugt i64 %stack_len2516, 1018
  %1854 = or i1 %1852, %1853
  %1855 = select i1 %1852, i8 91, i8 92
  br i1 %1854, label %return, label %OP718.POP.contd2517, !prof !2

OP718.POP.contd2517:                              ; preds = %OP718.POP.contd
  %1856 = add i64 %stack_len2516, -1
  store i64 %1856, ptr %len.addr, align 8
  br label %OP719.CALLER, !annotation !5

OP719.CALLER:                                     ; preds = %OP718.POP.contd2517
  %stack_len2518 = load i64, ptr %len.addr, align 8
  %1857 = add i64 %stack_len2518, 1
  store i64 %1857, ptr %len.addr, align 8
  %contract.caller.addr2519 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller2520 = load i160, ptr %contract.caller.addr2519, align 16
  %1858 = call i160 @llvm.bswap.i160(i160 %contract.caller2520)
  %1859 = zext i160 %1858 to i256
  %sp2521 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2518
  store i256 %1859, ptr %sp2521, align 16
  br label %OP720.PUSH20, !annotation !5

OP720.PUSH20:                                     ; preds = %OP719.CALLER
  %stack_len2522 = load i64, ptr %len.addr, align 8
  %1860 = add i64 %stack_len2522, 1
  store i64 %1860, ptr %len.addr, align 8
  %sp2523 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2522
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp2523, align 16
  br label %OP721.AND, !annotation !5

OP721.AND:                                        ; preds = %OP720.PUSH20
  %stack_len2524 = load i64, ptr %len.addr, align 8
  %1861 = add i64 %stack_len2524, -1
  store i64 %1861, ptr %len.addr, align 8
  %1862 = add i64 %stack_len2524, -1
  %sp2525 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1862
  %a2526 = load i256, ptr %sp2525, align 16
  %1863 = add i64 %stack_len2524, -2
  %sp2527 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1863
  %b2528 = load i256, ptr %sp2527, align 16
  %1864 = and i256 %a2526, %b2528
  %1865 = add i64 %stack_len2524, -2
  %sp2529 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1865
  store i256 %1864, ptr %sp2529, align 16
  br label %OP722.PUSH32, !annotation !5

OP722.PUSH32:                                     ; preds = %OP721.AND
  %stack_len2530 = load i64, ptr %len.addr, align 8
  %1866 = add i64 %stack_len2530, 1
  store i64 %1866, ptr %len.addr, align 8
  %sp2531 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2530
  store i256 -13569407764933135957707662995615205924891434450008393826643960198943177371492, ptr %sp2531, align 16
  br label %OP723.CALLVALUE, !annotation !5

OP723.CALLVALUE:                                  ; preds = %OP722.PUSH32
  %stack_len2532 = load i64, ptr %len.addr, align 8
  %1867 = add i64 %stack_len2532, 1
  store i64 %1867, ptr %len.addr, align 8
  %contract.call_value.addr2533 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value2534 = load i256, ptr %contract.call_value.addr2533, align 16
  %sp2535 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2532
  store i256 %contract.call_value2534, ptr %sp2535, align 16
  br label %OP724.PUSH1, !annotation !5

OP724.PUSH1:                                      ; preds = %OP723.CALLVALUE
  %stack_len2536 = load i64, ptr %len.addr, align 8
  %1868 = add i64 %stack_len2536, 1
  store i64 %1868, ptr %len.addr, align 8
  %sp2537 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2536
  store i256 64, ptr %sp2537, align 16
  br label %OP725.MLOAD, !annotation !5

OP725.MLOAD:                                      ; preds = %OP724.PUSH1
  %stack_len2538 = load i64, ptr %len.addr, align 8
  %1869 = add i64 %stack_len2538, -1
  %sp2539 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1869
  %a2540 = load i256, ptr %sp2539, align 16
  %mload.out.slot2541 = alloca i256, align 16
  %1870 = call i8 @__revmc_ir_builtin_mload(i256 %a2540, ptr %mload.out.slot2541, ptr %arg.ecx.addr)
  %1871 = icmp ne i8 %1870, 0
  br i1 %1871, label %return, label %OP725.MLOAD.contd, !prof !2

OP725.MLOAD.contd:                                ; preds = %OP725.MLOAD
  %mload.out2542 = load i256, ptr %mload.out.slot2541, align 16
  %1872 = add i64 %stack_len2538, -1
  %sp2543 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1872
  store i256 %mload.out2542, ptr %sp2543, align 16
  br label %OP726.DUP1, !annotation !5

OP726.DUP1:                                       ; preds = %OP725.MLOAD.contd
  %stack_len2544 = load i64, ptr %len.addr, align 8
  %1873 = add i64 %stack_len2544, 1
  store i64 %1873, ptr %len.addr, align 8
  %1874 = sub i64 %stack_len2544, 1
  %sp2545 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1874
  %dup12546 = load i256, ptr %sp2545, align 16
  %sp2547 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2544
  store i256 %dup12546, ptr %sp2547, align 16
  br label %OP727.DUP3, !annotation !5

OP727.DUP3:                                       ; preds = %OP726.DUP1
  %stack_len2548 = load i64, ptr %len.addr, align 8
  %1875 = add i64 %stack_len2548, 1
  store i64 %1875, ptr %len.addr, align 8
  %1876 = sub i64 %stack_len2548, 3
  %sp2549 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1876
  %dup32550 = load i256, ptr %sp2549, align 16
  %sp2551 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2548
  store i256 %dup32550, ptr %sp2551, align 16
  br label %OP728.DUP2, !annotation !5

OP728.DUP2:                                       ; preds = %OP727.DUP3
  %stack_len2552 = load i64, ptr %len.addr, align 8
  %1877 = add i64 %stack_len2552, 1
  store i64 %1877, ptr %len.addr, align 8
  %1878 = sub i64 %stack_len2552, 2
  %sp2553 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1878
  %dup22554 = load i256, ptr %sp2553, align 16
  %sp2555 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2552
  store i256 %dup22554, ptr %sp2555, align 16
  br label %OP729.MSTORE, !annotation !5

OP729.MSTORE:                                     ; preds = %OP728.DUP2
  %stack_len2556 = load i64, ptr %len.addr, align 8
  %1879 = add i64 %stack_len2556, -2
  store i64 %1879, ptr %len.addr, align 8
  %1880 = add i64 %stack_len2556, -1
  %sp2557 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1880
  %a2558 = load i256, ptr %sp2557, align 16
  %1881 = add i64 %stack_len2556, -2
  %sp2559 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1881
  %b2560 = load i256, ptr %sp2559, align 16
  %1882 = call i8 @__revmc_ir_builtin_mstore(i256 %a2558, i256 %b2560, ptr %arg.ecx.addr)
  %1883 = icmp ne i8 %1882, 0
  br i1 %1883, label %return, label %OP729.MSTORE.contd, !prof !2

OP729.MSTORE.contd:                               ; preds = %OP729.MSTORE
  br label %OP730.PUSH1, !annotation !5

OP730.PUSH1:                                      ; preds = %OP729.MSTORE.contd
  %stack_len2561 = load i64, ptr %len.addr, align 8
  %1884 = add i64 %stack_len2561, 1
  store i64 %1884, ptr %len.addr, align 8
  %sp2562 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2561
  store i256 32, ptr %sp2562, align 16
  br label %OP731.ADD, !annotation !5

OP731.ADD:                                        ; preds = %OP730.PUSH1
  %stack_len2563 = load i64, ptr %len.addr, align 8
  %1885 = add i64 %stack_len2563, -1
  store i64 %1885, ptr %len.addr, align 8
  %1886 = add i64 %stack_len2563, -1
  %sp2564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1886
  %a2565 = load i256, ptr %sp2564, align 16
  %1887 = add i64 %stack_len2563, -2
  %sp2566 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1887
  %b2567 = load i256, ptr %sp2566, align 16
  %1888 = add i256 %a2565, %b2567
  %1889 = add i64 %stack_len2563, -2
  %sp2568 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1889
  store i256 %1888, ptr %sp2568, align 16
  br label %OP732.SWAP2, !annotation !5

OP732.SWAP2:                                      ; preds = %OP731.ADD
  %stack_len2569 = load i64, ptr %len.addr, align 8
  %1890 = sub i64 %stack_len2569, 1
  %sp2570 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1890
  %swap.a2571 = load i256, ptr %sp2570, align 16
  %1891 = sub i64 %stack_len2569, 3
  %sp2572 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1891
  %swap.b2573 = load i256, ptr %sp2572, align 16
  store i256 %swap.a2571, ptr %sp2572, align 16
  store i256 %swap.b2573, ptr %sp2570, align 16
  br label %OP733.POP, !annotation !5

OP733.POP:                                        ; preds = %OP732.SWAP2
  %stack_len2574 = load i64, ptr %len.addr, align 8
  %1892 = add i64 %stack_len2574, -1
  store i64 %1892, ptr %len.addr, align 8
  br label %OP734.POP, !annotation !5

OP734.POP:                                        ; preds = %OP733.POP
  %stack_len2575 = load i64, ptr %len.addr, align 8
  %1893 = add i64 %stack_len2575, -1
  store i64 %1893, ptr %len.addr, align 8
  br label %OP735.PUSH1, !annotation !5

OP735.PUSH1:                                      ; preds = %OP734.POP
  %stack_len2576 = load i64, ptr %len.addr, align 8
  %1894 = add i64 %stack_len2576, 1
  store i64 %1894, ptr %len.addr, align 8
  %sp2577 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2576
  store i256 64, ptr %sp2577, align 16
  br label %OP736.MLOAD, !annotation !5

OP736.MLOAD:                                      ; preds = %OP735.PUSH1
  %stack_len2578 = load i64, ptr %len.addr, align 8
  %1895 = add i64 %stack_len2578, -1
  %sp2579 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1895
  %a2580 = load i256, ptr %sp2579, align 16
  %mload.out.slot2581 = alloca i256, align 16
  %1896 = call i8 @__revmc_ir_builtin_mload(i256 %a2580, ptr %mload.out.slot2581, ptr %arg.ecx.addr)
  %1897 = icmp ne i8 %1896, 0
  br i1 %1897, label %return, label %OP736.MLOAD.contd, !prof !2

OP736.MLOAD.contd:                                ; preds = %OP736.MLOAD
  %mload.out2582 = load i256, ptr %mload.out.slot2581, align 16
  %1898 = add i64 %stack_len2578, -1
  %sp2583 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1898
  store i256 %mload.out2582, ptr %sp2583, align 16
  br label %OP737.DUP1, !annotation !5

OP737.DUP1:                                       ; preds = %OP736.MLOAD.contd
  %stack_len2584 = load i64, ptr %len.addr, align 8
  %1899 = add i64 %stack_len2584, 1
  store i64 %1899, ptr %len.addr, align 8
  %1900 = sub i64 %stack_len2584, 1
  %sp2585 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1900
  %dup12586 = load i256, ptr %sp2585, align 16
  %sp2587 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2584
  store i256 %dup12586, ptr %sp2587, align 16
  br label %OP738.SWAP2, !annotation !5

OP738.SWAP2:                                      ; preds = %OP737.DUP1
  %stack_len2588 = load i64, ptr %len.addr, align 8
  %1901 = sub i64 %stack_len2588, 1
  %sp2589 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1901
  %swap.a2590 = load i256, ptr %sp2589, align 16
  %1902 = sub i64 %stack_len2588, 3
  %sp2591 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1902
  %swap.b2592 = load i256, ptr %sp2591, align 16
  store i256 %swap.a2590, ptr %sp2591, align 16
  store i256 %swap.b2592, ptr %sp2589, align 16
  br label %OP739.SUB, !annotation !5

OP739.SUB:                                        ; preds = %OP738.SWAP2
  %stack_len2593 = load i64, ptr %len.addr, align 8
  %1903 = add i64 %stack_len2593, -1
  store i64 %1903, ptr %len.addr, align 8
  %1904 = add i64 %stack_len2593, -1
  %sp2594 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1904
  %a2595 = load i256, ptr %sp2594, align 16
  %1905 = add i64 %stack_len2593, -2
  %sp2596 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1905
  %b2597 = load i256, ptr %sp2596, align 16
  %1906 = sub i256 %a2595, %b2597
  %1907 = add i64 %stack_len2593, -2
  %sp2598 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1907
  store i256 %1906, ptr %sp2598, align 16
  br label %OP740.SWAP1, !annotation !5

OP740.SWAP1:                                      ; preds = %OP739.SUB
  %stack_len2599 = load i64, ptr %len.addr, align 8
  %1908 = sub i64 %stack_len2599, 1
  %sp2600 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1908
  %swap.a2601 = load i256, ptr %sp2600, align 16
  %1909 = sub i64 %stack_len2599, 2
  %sp2602 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1909
  %swap.b2603 = load i256, ptr %sp2602, align 16
  store i256 %swap.a2601, ptr %sp2602, align 16
  store i256 %swap.b2603, ptr %sp2600, align 16
  br label %OP741.LOG2, !annotation !5

OP741.LOG2:                                       ; preds = %OP740.SWAP1
  %stack_len2604 = load i64, ptr %len.addr, align 8
  %1910 = add i64 %stack_len2604, -4
  store i64 %1910, ptr %len.addr, align 8
  %1911 = sub i64 %stack_len2604, 4
  %sp2605 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1911
  %1912 = call i8 @__revmc_builtin_log(ptr %arg.ecx.addr, ptr %sp2605, i8 2)
  %1913 = icmp ne i8 %1912, 0
  br i1 %1913, label %return, label %OP741.LOG2.contd, !prof !2

OP741.LOG2.contd:                                 ; preds = %OP741.LOG2
  br label %OP742.JUMP, !annotation !5

OP742.JUMP:                                       ; preds = %OP741.LOG2.contd
  %stack_len2606 = load i64, ptr %len.addr, align 8
  %1914 = add i64 %stack_len2606, -1
  store i64 %1914, ptr %len.addr, align 8
  %1915 = add i64 %stack_len2606, -1
  %sp2607 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1915
  %a2608 = load i256, ptr %sp2607, align 16
  br label %dynamic_jump_table

OP743.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP87.JUMP
  %gas.remaining2609 = load i64, ptr %gas.remaining.addr, align 8
  %1916 = sub i64 %gas.remaining2609, 194
  %1917 = icmp ult i64 %gas.remaining2609, 194
  store i64 %1916, ptr %gas.remaining.addr, align 8
  br i1 %1917, label %return, label %OP743.JUMPDEST.contd, !prof !2, !annotation !3

OP743.JUMPDEST.contd:                             ; preds = %OP743.JUMPDEST
  %stack_len2610 = load i64, ptr %len.addr, align 8
  %1918 = icmp ugt i64 %stack_len2610, 1015
  br i1 %1918, label %return, label %OP743.JUMPDEST.contd2611, !prof !2, !annotation !4

OP743.JUMPDEST.contd2611:                         ; preds = %OP743.JUMPDEST.contd
  br label %OP744.PUSH1, !annotation !5

OP744.PUSH1:                                      ; preds = %OP743.JUMPDEST.contd2611
  %stack_len2612 = load i64, ptr %len.addr, align 8
  %1919 = add i64 %stack_len2612, 1
  store i64 %1919, ptr %len.addr, align 8
  %sp2613 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2612
  store i256 0, ptr %sp2613, align 16
  br label %OP745.DUP1, !annotation !5

OP745.DUP1:                                       ; preds = %OP744.PUSH1
  %stack_len2614 = load i64, ptr %len.addr, align 8
  %1920 = add i64 %stack_len2614, 1
  store i64 %1920, ptr %len.addr, align 8
  %1921 = sub i64 %stack_len2614, 1
  %sp2615 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1921
  %dup12616 = load i256, ptr %sp2615, align 16
  %sp2617 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2614
  store i256 %dup12616, ptr %sp2617, align 16
  br label %OP746.SLOAD, !annotation !5

OP746.SLOAD:                                      ; preds = %OP745.DUP1
  %stack_len2618 = load i64, ptr %len.addr, align 8
  %1922 = sub i64 %stack_len2618, 1
  %sp2619 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1922
  %1923 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp2619, i8 19)
  %1924 = icmp ne i8 %1923, 0
  br i1 %1924, label %return, label %OP746.SLOAD.contd, !prof !2

OP746.SLOAD.contd:                                ; preds = %OP746.SLOAD
  br label %OP747.PUSH1, !annotation !5

OP747.PUSH1:                                      ; preds = %OP746.SLOAD.contd
  %stack_len2620 = load i64, ptr %len.addr, align 8
  %1925 = add i64 %stack_len2620, 1
  store i64 %1925, ptr %len.addr, align 8
  %sp2621 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2620
  store i256 1, ptr %sp2621, align 16
  br label %OP748.DUP2, !annotation !5

OP748.DUP2:                                       ; preds = %OP747.PUSH1
  %stack_len2622 = load i64, ptr %len.addr, align 8
  %1926 = add i64 %stack_len2622, 1
  store i64 %1926, ptr %len.addr, align 8
  %1927 = sub i64 %stack_len2622, 2
  %sp2623 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1927
  %dup22624 = load i256, ptr %sp2623, align 16
  %sp2625 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2622
  store i256 %dup22624, ptr %sp2625, align 16
  br label %OP749.PUSH1, !annotation !5

OP749.PUSH1:                                      ; preds = %OP748.DUP2
  %stack_len2626 = load i64, ptr %len.addr, align 8
  %1928 = add i64 %stack_len2626, 1
  store i64 %1928, ptr %len.addr, align 8
  %sp2627 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2626
  store i256 1, ptr %sp2627, align 16
  br label %OP750.AND, !annotation !5

OP750.AND:                                        ; preds = %OP749.PUSH1
  %stack_len2628 = load i64, ptr %len.addr, align 8
  %1929 = add i64 %stack_len2628, -1
  store i64 %1929, ptr %len.addr, align 8
  %1930 = add i64 %stack_len2628, -1
  %sp2629 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1930
  %a2630 = load i256, ptr %sp2629, align 16
  %1931 = add i64 %stack_len2628, -2
  %sp2631 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1931
  %b2632 = load i256, ptr %sp2631, align 16
  %1932 = and i256 %a2630, %b2632
  %1933 = add i64 %stack_len2628, -2
  %sp2633 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1933
  store i256 %1932, ptr %sp2633, align 16
  br label %OP751.ISZERO, !annotation !5

OP751.ISZERO:                                     ; preds = %OP750.AND
  %stack_len2634 = load i64, ptr %len.addr, align 8
  %1934 = add i64 %stack_len2634, -1
  %sp2635 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1934
  %a2636 = load i256, ptr %sp2635, align 16
  %1935 = icmp eq i256 %a2636, 0
  %1936 = zext i1 %1935 to i256
  %1937 = add i64 %stack_len2634, -1
  %sp2637 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1937
  store i256 %1936, ptr %sp2637, align 16
  br label %OP752.PUSH2, !annotation !5

OP752.PUSH2:                                      ; preds = %OP751.ISZERO
  %stack_len2638 = load i64, ptr %len.addr, align 8
  %1938 = add i64 %stack_len2638, 1
  store i64 %1938, ptr %len.addr, align 8
  %sp2639 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2638
  store i256 256, ptr %sp2639, align 16
  br label %OP753.MUL, !annotation !5

OP753.MUL:                                        ; preds = %OP752.PUSH2
  %stack_len2640 = load i64, ptr %len.addr, align 8
  %1939 = add i64 %stack_len2640, -1
  store i64 %1939, ptr %len.addr, align 8
  %1940 = add i64 %stack_len2640, -1
  %sp2641 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1940
  %a2642 = load i256, ptr %sp2641, align 16
  %1941 = add i64 %stack_len2640, -2
  %sp2643 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1941
  %b2644 = load i256, ptr %sp2643, align 16
  %1942 = mul i256 %a2642, %b2644
  %1943 = add i64 %stack_len2640, -2
  %sp2645 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1943
  store i256 %1942, ptr %sp2645, align 16
  br label %OP754.SUB, !annotation !5

OP754.SUB:                                        ; preds = %OP753.MUL
  %stack_len2646 = load i64, ptr %len.addr, align 8
  %1944 = add i64 %stack_len2646, -1
  store i64 %1944, ptr %len.addr, align 8
  %1945 = add i64 %stack_len2646, -1
  %sp2647 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1945
  %a2648 = load i256, ptr %sp2647, align 16
  %1946 = add i64 %stack_len2646, -2
  %sp2649 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1946
  %b2650 = load i256, ptr %sp2649, align 16
  %1947 = sub i256 %a2648, %b2650
  %1948 = add i64 %stack_len2646, -2
  %sp2651 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1948
  store i256 %1947, ptr %sp2651, align 16
  br label %OP755.AND, !annotation !5

OP755.AND:                                        ; preds = %OP754.SUB
  %stack_len2652 = load i64, ptr %len.addr, align 8
  %1949 = add i64 %stack_len2652, -1
  store i64 %1949, ptr %len.addr, align 8
  %1950 = add i64 %stack_len2652, -1
  %sp2653 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1950
  %a2654 = load i256, ptr %sp2653, align 16
  %1951 = add i64 %stack_len2652, -2
  %sp2655 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1951
  %b2656 = load i256, ptr %sp2655, align 16
  %1952 = and i256 %a2654, %b2656
  %1953 = add i64 %stack_len2652, -2
  %sp2657 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1953
  store i256 %1952, ptr %sp2657, align 16
  br label %OP756.PUSH1, !annotation !5

OP756.PUSH1:                                      ; preds = %OP755.AND
  %stack_len2658 = load i64, ptr %len.addr, align 8
  %1954 = add i64 %stack_len2658, 1
  store i64 %1954, ptr %len.addr, align 8
  %sp2659 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2658
  store i256 2, ptr %sp2659, align 16
  br label %OP757.SWAP1, !annotation !5

OP757.SWAP1:                                      ; preds = %OP756.PUSH1
  %stack_len2660 = load i64, ptr %len.addr, align 8
  %1955 = sub i64 %stack_len2660, 1
  %sp2661 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1955
  %swap.a2662 = load i256, ptr %sp2661, align 16
  %1956 = sub i64 %stack_len2660, 2
  %sp2663 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1956
  %swap.b2664 = load i256, ptr %sp2663, align 16
  store i256 %swap.a2662, ptr %sp2663, align 16
  store i256 %swap.b2664, ptr %sp2661, align 16
  br label %OP758.DIV, !annotation !5

OP758.DIV:                                        ; preds = %OP757.SWAP1
  %stack_len2665 = load i64, ptr %len.addr, align 8
  %1957 = add i64 %stack_len2665, -1
  store i64 %1957, ptr %len.addr, align 8
  %1958 = add i64 %stack_len2665, -1
  %sp2666 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1958
  %a2667 = load i256, ptr %sp2666, align 16
  %1959 = add i64 %stack_len2665, -2
  %sp2668 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1959
  %b2669 = load i256, ptr %sp2668, align 16
  %1960 = icmp eq i256 %b2669, 0
  %1961 = udiv i256 %a2667, %b2669
  %1962 = select i1 %1960, i256 0, i256 %1961
  %1963 = add i64 %stack_len2665, -2
  %sp2670 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1963
  store i256 %1962, ptr %sp2670, align 16
  br label %OP759.DUP1, !annotation !5

OP759.DUP1:                                       ; preds = %OP758.DIV
  %stack_len2671 = load i64, ptr %len.addr, align 8
  %1964 = add i64 %stack_len2671, 1
  store i64 %1964, ptr %len.addr, align 8
  %1965 = sub i64 %stack_len2671, 1
  %sp2672 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1965
  %dup12673 = load i256, ptr %sp2672, align 16
  %sp2674 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2671
  store i256 %dup12673, ptr %sp2674, align 16
  br label %OP760.PUSH1, !annotation !5

OP760.PUSH1:                                      ; preds = %OP759.DUP1
  %stack_len2675 = load i64, ptr %len.addr, align 8
  %1966 = add i64 %stack_len2675, 1
  store i64 %1966, ptr %len.addr, align 8
  %sp2676 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2675
  store i256 31, ptr %sp2676, align 16
  br label %OP761.ADD, !annotation !5

OP761.ADD:                                        ; preds = %OP760.PUSH1
  %stack_len2677 = load i64, ptr %len.addr, align 8
  %1967 = add i64 %stack_len2677, -1
  store i64 %1967, ptr %len.addr, align 8
  %1968 = add i64 %stack_len2677, -1
  %sp2678 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1968
  %a2679 = load i256, ptr %sp2678, align 16
  %1969 = add i64 %stack_len2677, -2
  %sp2680 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1969
  %b2681 = load i256, ptr %sp2680, align 16
  %1970 = add i256 %a2679, %b2681
  %1971 = add i64 %stack_len2677, -2
  %sp2682 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1971
  store i256 %1970, ptr %sp2682, align 16
  br label %OP762.PUSH1, !annotation !5

OP762.PUSH1:                                      ; preds = %OP761.ADD
  %stack_len2683 = load i64, ptr %len.addr, align 8
  %1972 = add i64 %stack_len2683, 1
  store i64 %1972, ptr %len.addr, align 8
  %sp2684 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2683
  store i256 32, ptr %sp2684, align 16
  br label %OP763.DUP1, !annotation !5

OP763.DUP1:                                       ; preds = %OP762.PUSH1
  %stack_len2685 = load i64, ptr %len.addr, align 8
  %1973 = add i64 %stack_len2685, 1
  store i64 %1973, ptr %len.addr, align 8
  %1974 = sub i64 %stack_len2685, 1
  %sp2686 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1974
  %dup12687 = load i256, ptr %sp2686, align 16
  %sp2688 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2685
  store i256 %dup12687, ptr %sp2688, align 16
  br label %OP764.SWAP2, !annotation !5

OP764.SWAP2:                                      ; preds = %OP763.DUP1
  %stack_len2689 = load i64, ptr %len.addr, align 8
  %1975 = sub i64 %stack_len2689, 1
  %sp2690 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1975
  %swap.a2691 = load i256, ptr %sp2690, align 16
  %1976 = sub i64 %stack_len2689, 3
  %sp2692 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1976
  %swap.b2693 = load i256, ptr %sp2692, align 16
  store i256 %swap.a2691, ptr %sp2692, align 16
  store i256 %swap.b2693, ptr %sp2690, align 16
  br label %OP765.DIV, !annotation !5

OP765.DIV:                                        ; preds = %OP764.SWAP2
  %stack_len2694 = load i64, ptr %len.addr, align 8
  %1977 = add i64 %stack_len2694, -1
  store i64 %1977, ptr %len.addr, align 8
  %1978 = add i64 %stack_len2694, -1
  %sp2695 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1978
  %a2696 = load i256, ptr %sp2695, align 16
  %1979 = add i64 %stack_len2694, -2
  %sp2697 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1979
  %b2698 = load i256, ptr %sp2697, align 16
  %1980 = icmp eq i256 %b2698, 0
  %1981 = udiv i256 %a2696, %b2698
  %1982 = select i1 %1980, i256 0, i256 %1981
  %1983 = add i64 %stack_len2694, -2
  %sp2699 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1983
  store i256 %1982, ptr %sp2699, align 16
  br label %OP766.MUL, !annotation !5

OP766.MUL:                                        ; preds = %OP765.DIV
  %stack_len2700 = load i64, ptr %len.addr, align 8
  %1984 = add i64 %stack_len2700, -1
  store i64 %1984, ptr %len.addr, align 8
  %1985 = add i64 %stack_len2700, -1
  %sp2701 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1985
  %a2702 = load i256, ptr %sp2701, align 16
  %1986 = add i64 %stack_len2700, -2
  %sp2703 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1986
  %b2704 = load i256, ptr %sp2703, align 16
  %1987 = mul i256 %a2702, %b2704
  %1988 = add i64 %stack_len2700, -2
  %sp2705 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1988
  store i256 %1987, ptr %sp2705, align 16
  br label %OP767.PUSH1, !annotation !5

OP767.PUSH1:                                      ; preds = %OP766.MUL
  %stack_len2706 = load i64, ptr %len.addr, align 8
  %1989 = add i64 %stack_len2706, 1
  store i64 %1989, ptr %len.addr, align 8
  %sp2707 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2706
  store i256 32, ptr %sp2707, align 16
  br label %OP768.ADD, !annotation !5

OP768.ADD:                                        ; preds = %OP767.PUSH1
  %stack_len2708 = load i64, ptr %len.addr, align 8
  %1990 = add i64 %stack_len2708, -1
  store i64 %1990, ptr %len.addr, align 8
  %1991 = add i64 %stack_len2708, -1
  %sp2709 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1991
  %a2710 = load i256, ptr %sp2709, align 16
  %1992 = add i64 %stack_len2708, -2
  %sp2711 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1992
  %b2712 = load i256, ptr %sp2711, align 16
  %1993 = add i256 %a2710, %b2712
  %1994 = add i64 %stack_len2708, -2
  %sp2713 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1994
  store i256 %1993, ptr %sp2713, align 16
  br label %OP769.PUSH1, !annotation !5

OP769.PUSH1:                                      ; preds = %OP768.ADD
  %stack_len2714 = load i64, ptr %len.addr, align 8
  %1995 = add i64 %stack_len2714, 1
  store i64 %1995, ptr %len.addr, align 8
  %sp2715 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2714
  store i256 64, ptr %sp2715, align 16
  br label %OP770.MLOAD, !annotation !5

OP770.MLOAD:                                      ; preds = %OP769.PUSH1
  %stack_len2716 = load i64, ptr %len.addr, align 8
  %1996 = add i64 %stack_len2716, -1
  %sp2717 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1996
  %a2718 = load i256, ptr %sp2717, align 16
  %mload.out.slot2719 = alloca i256, align 16
  %1997 = call i8 @__revmc_ir_builtin_mload(i256 %a2718, ptr %mload.out.slot2719, ptr %arg.ecx.addr)
  %1998 = icmp ne i8 %1997, 0
  br i1 %1998, label %return, label %OP770.MLOAD.contd, !prof !2

OP770.MLOAD.contd:                                ; preds = %OP770.MLOAD
  %mload.out2720 = load i256, ptr %mload.out.slot2719, align 16
  %1999 = add i64 %stack_len2716, -1
  %sp2721 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1999
  store i256 %mload.out2720, ptr %sp2721, align 16
  br label %OP771.SWAP1, !annotation !5

OP771.SWAP1:                                      ; preds = %OP770.MLOAD.contd
  %stack_len2722 = load i64, ptr %len.addr, align 8
  %2000 = sub i64 %stack_len2722, 1
  %sp2723 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2000
  %swap.a2724 = load i256, ptr %sp2723, align 16
  %2001 = sub i64 %stack_len2722, 2
  %sp2725 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2001
  %swap.b2726 = load i256, ptr %sp2725, align 16
  store i256 %swap.a2724, ptr %sp2725, align 16
  store i256 %swap.b2726, ptr %sp2723, align 16
  br label %OP772.DUP2, !annotation !5

OP772.DUP2:                                       ; preds = %OP771.SWAP1
  %stack_len2727 = load i64, ptr %len.addr, align 8
  %2002 = add i64 %stack_len2727, 1
  store i64 %2002, ptr %len.addr, align 8
  %2003 = sub i64 %stack_len2727, 2
  %sp2728 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2003
  %dup22729 = load i256, ptr %sp2728, align 16
  %sp2730 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2727
  store i256 %dup22729, ptr %sp2730, align 16
  br label %OP773.ADD, !annotation !5

OP773.ADD:                                        ; preds = %OP772.DUP2
  %stack_len2731 = load i64, ptr %len.addr, align 8
  %2004 = add i64 %stack_len2731, -1
  store i64 %2004, ptr %len.addr, align 8
  %2005 = add i64 %stack_len2731, -1
  %sp2732 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2005
  %a2733 = load i256, ptr %sp2732, align 16
  %2006 = add i64 %stack_len2731, -2
  %sp2734 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2006
  %b2735 = load i256, ptr %sp2734, align 16
  %2007 = add i256 %a2733, %b2735
  %2008 = add i64 %stack_len2731, -2
  %sp2736 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2008
  store i256 %2007, ptr %sp2736, align 16
  br label %OP774.PUSH1, !annotation !5

OP774.PUSH1:                                      ; preds = %OP773.ADD
  %stack_len2737 = load i64, ptr %len.addr, align 8
  %2009 = add i64 %stack_len2737, 1
  store i64 %2009, ptr %len.addr, align 8
  %sp2738 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2737
  store i256 64, ptr %sp2738, align 16
  br label %OP775.MSTORE, !annotation !5

OP775.MSTORE:                                     ; preds = %OP774.PUSH1
  %stack_len2739 = load i64, ptr %len.addr, align 8
  %2010 = add i64 %stack_len2739, -2
  store i64 %2010, ptr %len.addr, align 8
  %2011 = add i64 %stack_len2739, -1
  %sp2740 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2011
  %a2741 = load i256, ptr %sp2740, align 16
  %2012 = add i64 %stack_len2739, -2
  %sp2742 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2012
  %b2743 = load i256, ptr %sp2742, align 16
  %2013 = call i8 @__revmc_ir_builtin_mstore(i256 %a2741, i256 %b2743, ptr %arg.ecx.addr)
  %2014 = icmp ne i8 %2013, 0
  br i1 %2014, label %return, label %OP775.MSTORE.contd, !prof !2

OP775.MSTORE.contd:                               ; preds = %OP775.MSTORE
  br label %OP776.DUP1, !annotation !5

OP776.DUP1:                                       ; preds = %OP775.MSTORE.contd
  %stack_len2744 = load i64, ptr %len.addr, align 8
  %2015 = add i64 %stack_len2744, 1
  store i64 %2015, ptr %len.addr, align 8
  %2016 = sub i64 %stack_len2744, 1
  %sp2745 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2016
  %dup12746 = load i256, ptr %sp2745, align 16
  %sp2747 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2744
  store i256 %dup12746, ptr %sp2747, align 16
  br label %OP777.SWAP3, !annotation !5

OP777.SWAP3:                                      ; preds = %OP776.DUP1
  %stack_len2748 = load i64, ptr %len.addr, align 8
  %2017 = sub i64 %stack_len2748, 1
  %sp2749 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2017
  %swap.a2750 = load i256, ptr %sp2749, align 16
  %2018 = sub i64 %stack_len2748, 4
  %sp2751 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2018
  %swap.b2752 = load i256, ptr %sp2751, align 16
  store i256 %swap.a2750, ptr %sp2751, align 16
  store i256 %swap.b2752, ptr %sp2749, align 16
  br label %OP778.SWAP2, !annotation !5

OP778.SWAP2:                                      ; preds = %OP777.SWAP3
  %stack_len2753 = load i64, ptr %len.addr, align 8
  %2019 = sub i64 %stack_len2753, 1
  %sp2754 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2019
  %swap.a2755 = load i256, ptr %sp2754, align 16
  %2020 = sub i64 %stack_len2753, 3
  %sp2756 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2020
  %swap.b2757 = load i256, ptr %sp2756, align 16
  store i256 %swap.a2755, ptr %sp2756, align 16
  store i256 %swap.b2757, ptr %sp2754, align 16
  br label %OP779.SWAP1, !annotation !5

OP779.SWAP1:                                      ; preds = %OP778.SWAP2
  %stack_len2758 = load i64, ptr %len.addr, align 8
  %2021 = sub i64 %stack_len2758, 1
  %sp2759 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2021
  %swap.a2760 = load i256, ptr %sp2759, align 16
  %2022 = sub i64 %stack_len2758, 2
  %sp2761 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2022
  %swap.b2762 = load i256, ptr %sp2761, align 16
  store i256 %swap.a2760, ptr %sp2761, align 16
  store i256 %swap.b2762, ptr %sp2759, align 16
  br label %OP780.DUP2, !annotation !5

OP780.DUP2:                                       ; preds = %OP779.SWAP1
  %stack_len2763 = load i64, ptr %len.addr, align 8
  %2023 = add i64 %stack_len2763, 1
  store i64 %2023, ptr %len.addr, align 8
  %2024 = sub i64 %stack_len2763, 2
  %sp2764 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2024
  %dup22765 = load i256, ptr %sp2764, align 16
  %sp2766 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2763
  store i256 %dup22765, ptr %sp2766, align 16
  br label %OP781.DUP2, !annotation !5

OP781.DUP2:                                       ; preds = %OP780.DUP2
  %stack_len2767 = load i64, ptr %len.addr, align 8
  %2025 = add i64 %stack_len2767, 1
  store i64 %2025, ptr %len.addr, align 8
  %2026 = sub i64 %stack_len2767, 2
  %sp2768 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2026
  %dup22769 = load i256, ptr %sp2768, align 16
  %sp2770 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2767
  store i256 %dup22769, ptr %sp2770, align 16
  br label %OP782.MSTORE, !annotation !5

OP782.MSTORE:                                     ; preds = %OP781.DUP2
  %stack_len2771 = load i64, ptr %len.addr, align 8
  %2027 = add i64 %stack_len2771, -2
  store i64 %2027, ptr %len.addr, align 8
  %2028 = add i64 %stack_len2771, -1
  %sp2772 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2028
  %a2773 = load i256, ptr %sp2772, align 16
  %2029 = add i64 %stack_len2771, -2
  %sp2774 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2029
  %b2775 = load i256, ptr %sp2774, align 16
  %2030 = call i8 @__revmc_ir_builtin_mstore(i256 %a2773, i256 %b2775, ptr %arg.ecx.addr)
  %2031 = icmp ne i8 %2030, 0
  br i1 %2031, label %return, label %OP782.MSTORE.contd, !prof !2

OP782.MSTORE.contd:                               ; preds = %OP782.MSTORE
  br label %OP783.PUSH1, !annotation !5

OP783.PUSH1:                                      ; preds = %OP782.MSTORE.contd
  %stack_len2776 = load i64, ptr %len.addr, align 8
  %2032 = add i64 %stack_len2776, 1
  store i64 %2032, ptr %len.addr, align 8
  %sp2777 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2776
  store i256 32, ptr %sp2777, align 16
  br label %OP784.ADD, !annotation !5

OP784.ADD:                                        ; preds = %OP783.PUSH1
  %stack_len2778 = load i64, ptr %len.addr, align 8
  %2033 = add i64 %stack_len2778, -1
  store i64 %2033, ptr %len.addr, align 8
  %2034 = add i64 %stack_len2778, -1
  %sp2779 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2034
  %a2780 = load i256, ptr %sp2779, align 16
  %2035 = add i64 %stack_len2778, -2
  %sp2781 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2035
  %b2782 = load i256, ptr %sp2781, align 16
  %2036 = add i256 %a2780, %b2782
  %2037 = add i64 %stack_len2778, -2
  %sp2783 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2037
  store i256 %2036, ptr %sp2783, align 16
  br label %OP785.DUP3, !annotation !5

OP785.DUP3:                                       ; preds = %OP784.ADD
  %stack_len2784 = load i64, ptr %len.addr, align 8
  %2038 = add i64 %stack_len2784, 1
  store i64 %2038, ptr %len.addr, align 8
  %2039 = sub i64 %stack_len2784, 3
  %sp2785 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2039
  %dup32786 = load i256, ptr %sp2785, align 16
  %sp2787 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2784
  store i256 %dup32786, ptr %sp2787, align 16
  br label %OP786.DUP1, !annotation !5

OP786.DUP1:                                       ; preds = %OP785.DUP3
  %stack_len2788 = load i64, ptr %len.addr, align 8
  %2040 = add i64 %stack_len2788, 1
  store i64 %2040, ptr %len.addr, align 8
  %2041 = sub i64 %stack_len2788, 1
  %sp2789 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2041
  %dup12790 = load i256, ptr %sp2789, align 16
  %sp2791 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2788
  store i256 %dup12790, ptr %sp2791, align 16
  br label %OP787.SLOAD, !annotation !5

OP787.SLOAD:                                      ; preds = %OP786.DUP1
  %stack_len2792 = load i64, ptr %len.addr, align 8
  %2042 = sub i64 %stack_len2792, 1
  %sp2793 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2042
  %2043 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp2793, i8 19)
  %2044 = icmp ne i8 %2043, 0
  br i1 %2044, label %return, label %OP787.SLOAD.contd, !prof !2

OP787.SLOAD.contd:                                ; preds = %OP787.SLOAD
  br label %OP788.PUSH1, !annotation !5

OP788.PUSH1:                                      ; preds = %OP787.SLOAD.contd
  %stack_len2794 = load i64, ptr %len.addr, align 8
  %2045 = add i64 %stack_len2794, 1
  store i64 %2045, ptr %len.addr, align 8
  %sp2795 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2794
  store i256 1, ptr %sp2795, align 16
  br label %OP789.DUP2, !annotation !5

OP789.DUP2:                                       ; preds = %OP788.PUSH1
  %stack_len2796 = load i64, ptr %len.addr, align 8
  %2046 = add i64 %stack_len2796, 1
  store i64 %2046, ptr %len.addr, align 8
  %2047 = sub i64 %stack_len2796, 2
  %sp2797 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2047
  %dup22798 = load i256, ptr %sp2797, align 16
  %sp2799 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2796
  store i256 %dup22798, ptr %sp2799, align 16
  br label %OP790.PUSH1, !annotation !5

OP790.PUSH1:                                      ; preds = %OP789.DUP2
  %stack_len2800 = load i64, ptr %len.addr, align 8
  %2048 = add i64 %stack_len2800, 1
  store i64 %2048, ptr %len.addr, align 8
  %sp2801 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2800
  store i256 1, ptr %sp2801, align 16
  br label %OP791.AND, !annotation !5

OP791.AND:                                        ; preds = %OP790.PUSH1
  %stack_len2802 = load i64, ptr %len.addr, align 8
  %2049 = add i64 %stack_len2802, -1
  store i64 %2049, ptr %len.addr, align 8
  %2050 = add i64 %stack_len2802, -1
  %sp2803 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2050
  %a2804 = load i256, ptr %sp2803, align 16
  %2051 = add i64 %stack_len2802, -2
  %sp2805 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2051
  %b2806 = load i256, ptr %sp2805, align 16
  %2052 = and i256 %a2804, %b2806
  %2053 = add i64 %stack_len2802, -2
  %sp2807 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2053
  store i256 %2052, ptr %sp2807, align 16
  br label %OP792.ISZERO, !annotation !5

OP792.ISZERO:                                     ; preds = %OP791.AND
  %stack_len2808 = load i64, ptr %len.addr, align 8
  %2054 = add i64 %stack_len2808, -1
  %sp2809 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2054
  %a2810 = load i256, ptr %sp2809, align 16
  %2055 = icmp eq i256 %a2810, 0
  %2056 = zext i1 %2055 to i256
  %2057 = add i64 %stack_len2808, -1
  %sp2811 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2057
  store i256 %2056, ptr %sp2811, align 16
  br label %OP793.PUSH2, !annotation !5

OP793.PUSH2:                                      ; preds = %OP792.ISZERO
  %stack_len2812 = load i64, ptr %len.addr, align 8
  %2058 = add i64 %stack_len2812, 1
  store i64 %2058, ptr %len.addr, align 8
  %sp2813 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2812
  store i256 256, ptr %sp2813, align 16
  br label %OP794.MUL, !annotation !5

OP794.MUL:                                        ; preds = %OP793.PUSH2
  %stack_len2814 = load i64, ptr %len.addr, align 8
  %2059 = add i64 %stack_len2814, -1
  store i64 %2059, ptr %len.addr, align 8
  %2060 = add i64 %stack_len2814, -1
  %sp2815 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2060
  %a2816 = load i256, ptr %sp2815, align 16
  %2061 = add i64 %stack_len2814, -2
  %sp2817 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2061
  %b2818 = load i256, ptr %sp2817, align 16
  %2062 = mul i256 %a2816, %b2818
  %2063 = add i64 %stack_len2814, -2
  %sp2819 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2063
  store i256 %2062, ptr %sp2819, align 16
  br label %OP795.SUB, !annotation !5

OP795.SUB:                                        ; preds = %OP794.MUL
  %stack_len2820 = load i64, ptr %len.addr, align 8
  %2064 = add i64 %stack_len2820, -1
  store i64 %2064, ptr %len.addr, align 8
  %2065 = add i64 %stack_len2820, -1
  %sp2821 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2065
  %a2822 = load i256, ptr %sp2821, align 16
  %2066 = add i64 %stack_len2820, -2
  %sp2823 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2066
  %b2824 = load i256, ptr %sp2823, align 16
  %2067 = sub i256 %a2822, %b2824
  %2068 = add i64 %stack_len2820, -2
  %sp2825 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2068
  store i256 %2067, ptr %sp2825, align 16
  br label %OP796.AND, !annotation !5

OP796.AND:                                        ; preds = %OP795.SUB
  %stack_len2826 = load i64, ptr %len.addr, align 8
  %2069 = add i64 %stack_len2826, -1
  store i64 %2069, ptr %len.addr, align 8
  %2070 = add i64 %stack_len2826, -1
  %sp2827 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2070
  %a2828 = load i256, ptr %sp2827, align 16
  %2071 = add i64 %stack_len2826, -2
  %sp2829 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2071
  %b2830 = load i256, ptr %sp2829, align 16
  %2072 = and i256 %a2828, %b2830
  %2073 = add i64 %stack_len2826, -2
  %sp2831 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2073
  store i256 %2072, ptr %sp2831, align 16
  br label %OP797.PUSH1, !annotation !5

OP797.PUSH1:                                      ; preds = %OP796.AND
  %stack_len2832 = load i64, ptr %len.addr, align 8
  %2074 = add i64 %stack_len2832, 1
  store i64 %2074, ptr %len.addr, align 8
  %sp2833 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2832
  store i256 2, ptr %sp2833, align 16
  br label %OP798.SWAP1, !annotation !5

OP798.SWAP1:                                      ; preds = %OP797.PUSH1
  %stack_len2834 = load i64, ptr %len.addr, align 8
  %2075 = sub i64 %stack_len2834, 1
  %sp2835 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2075
  %swap.a2836 = load i256, ptr %sp2835, align 16
  %2076 = sub i64 %stack_len2834, 2
  %sp2837 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2076
  %swap.b2838 = load i256, ptr %sp2837, align 16
  store i256 %swap.a2836, ptr %sp2837, align 16
  store i256 %swap.b2838, ptr %sp2835, align 16
  br label %OP799.DIV, !annotation !5

OP799.DIV:                                        ; preds = %OP798.SWAP1
  %stack_len2839 = load i64, ptr %len.addr, align 8
  %2077 = add i64 %stack_len2839, -1
  store i64 %2077, ptr %len.addr, align 8
  %2078 = add i64 %stack_len2839, -1
  %sp2840 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2078
  %a2841 = load i256, ptr %sp2840, align 16
  %2079 = add i64 %stack_len2839, -2
  %sp2842 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2079
  %b2843 = load i256, ptr %sp2842, align 16
  %2080 = icmp eq i256 %b2843, 0
  %2081 = udiv i256 %a2841, %b2843
  %2082 = select i1 %2080, i256 0, i256 %2081
  %2083 = add i64 %stack_len2839, -2
  %sp2844 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2083
  store i256 %2082, ptr %sp2844, align 16
  br label %OP800.DUP1, !annotation !5

OP800.DUP1:                                       ; preds = %OP799.DIV
  %stack_len2845 = load i64, ptr %len.addr, align 8
  %2084 = add i64 %stack_len2845, 1
  store i64 %2084, ptr %len.addr, align 8
  %2085 = sub i64 %stack_len2845, 1
  %sp2846 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2085
  %dup12847 = load i256, ptr %sp2846, align 16
  %sp2848 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2845
  store i256 %dup12847, ptr %sp2848, align 16
  br label %OP801.ISZERO, !annotation !5

OP801.ISZERO:                                     ; preds = %OP800.DUP1
  %stack_len2849 = load i64, ptr %len.addr, align 8
  %2086 = add i64 %stack_len2849, -1
  %sp2850 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2086
  %a2851 = load i256, ptr %sp2850, align 16
  %2087 = icmp eq i256 %a2851, 0
  %2088 = zext i1 %2087 to i256
  %2089 = add i64 %stack_len2849, -1
  %sp2852 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2089
  store i256 %2088, ptr %sp2852, align 16
  br label %OP802.PUSH2, !annotation !5

OP802.PUSH2:                                      ; preds = %OP801.ISZERO
  br label %OP803.JUMPI, !annotation !6

OP803.JUMPI:                                      ; preds = %OP802.PUSH2
  %stack_len2853 = load i64, ptr %len.addr, align 8
  %2090 = add i64 %stack_len2853, -1
  store i64 %2090, ptr %len.addr, align 8
  %2091 = add i64 %stack_len2853, -1
  %sp2854 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2091
  %a2855 = load i256, ptr %sp2854, align 16
  %2092 = icmp ne i256 %a2855, 0
  br i1 %2092, label %OP858.JUMPDEST, label %OP804.DUP1

OP804.DUP1:                                       ; preds = %OP803.JUMPI
  %gas.remaining2856 = load i64, ptr %gas.remaining.addr, align 8
  %2093 = sub i64 %gas.remaining2856, 22
  %2094 = icmp ult i64 %gas.remaining2856, 22
  store i64 %2093, ptr %gas.remaining.addr, align 8
  br i1 %2094, label %return, label %OP804.DUP1.contd, !prof !2, !annotation !3

OP804.DUP1.contd:                                 ; preds = %OP804.DUP1
  %stack_len2857 = load i64, ptr %len.addr, align 8
  %2095 = icmp ult i64 %stack_len2857, 1
  %2096 = icmp ugt i64 %stack_len2857, 1022
  %2097 = or i1 %2095, %2096
  %2098 = select i1 %2095, i8 91, i8 92
  br i1 %2097, label %return, label %OP804.DUP1.contd2858, !prof !2

OP804.DUP1.contd2858:                             ; preds = %OP804.DUP1.contd
  %2099 = add i64 %stack_len2857, 1
  store i64 %2099, ptr %len.addr, align 8
  %2100 = sub i64 %stack_len2857, 1
  %sp2859 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2100
  %dup12860 = load i256, ptr %sp2859, align 16
  %sp2861 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2857
  store i256 %dup12860, ptr %sp2861, align 16
  br label %OP805.PUSH1, !annotation !5

OP805.PUSH1:                                      ; preds = %OP804.DUP1.contd2858
  %stack_len2862 = load i64, ptr %len.addr, align 8
  %2101 = add i64 %stack_len2862, 1
  store i64 %2101, ptr %len.addr, align 8
  %sp2863 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2862
  store i256 31, ptr %sp2863, align 16
  br label %OP806.LT, !annotation !5

OP806.LT:                                         ; preds = %OP805.PUSH1
  %stack_len2864 = load i64, ptr %len.addr, align 8
  %2102 = add i64 %stack_len2864, -1
  store i64 %2102, ptr %len.addr, align 8
  %2103 = add i64 %stack_len2864, -1
  %sp2865 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2103
  %a2866 = load i256, ptr %sp2865, align 16
  %2104 = add i64 %stack_len2864, -2
  %sp2867 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2104
  %b2868 = load i256, ptr %sp2867, align 16
  %2105 = icmp ult i256 %a2866, %b2868
  %2106 = zext i1 %2105 to i256
  %2107 = add i64 %stack_len2864, -2
  %sp2869 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2107
  store i256 %2106, ptr %sp2869, align 16
  br label %OP807.PUSH2, !annotation !5

OP807.PUSH2:                                      ; preds = %OP806.LT
  br label %OP808.JUMPI, !annotation !6

OP808.JUMPI:                                      ; preds = %OP807.PUSH2
  %stack_len2870 = load i64, ptr %len.addr, align 8
  %2108 = add i64 %stack_len2870, -1
  store i64 %2108, ptr %len.addr, align 8
  %2109 = add i64 %stack_len2870, -1
  %sp2871 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2109
  %a2872 = load i256, ptr %sp2871, align 16
  %2110 = icmp ne i256 %a2872, 0
  br i1 %2110, label %OP823.JUMPDEST, label %OP809.PUSH2

OP809.PUSH2:                                      ; preds = %OP808.JUMPI
  %gas.remaining2873 = load i64, ptr %gas.remaining.addr, align 8
  %2111 = sub i64 %gas.remaining2873, 48
  %2112 = icmp ult i64 %gas.remaining2873, 48
  store i64 %2111, ptr %gas.remaining.addr, align 8
  br i1 %2112, label %return, label %OP809.PUSH2.contd, !prof !2, !annotation !3

OP809.PUSH2.contd:                                ; preds = %OP809.PUSH2
  %stack_len2874 = load i64, ptr %len.addr, align 8
  %2113 = icmp ult i64 %stack_len2874, 3
  %2114 = icmp ugt i64 %stack_len2874, 1021
  %2115 = or i1 %2113, %2114
  %2116 = select i1 %2113, i8 91, i8 92
  br i1 %2115, label %return, label %OP809.PUSH2.contd2875, !prof !2

OP809.PUSH2.contd2875:                            ; preds = %OP809.PUSH2.contd
  %2117 = add i64 %stack_len2874, 1
  store i64 %2117, ptr %len.addr, align 8
  %sp2876 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2874
  store i256 256, ptr %sp2876, align 16
  br label %OP810.DUP1, !annotation !5

OP810.DUP1:                                       ; preds = %OP809.PUSH2.contd2875
  %stack_len2877 = load i64, ptr %len.addr, align 8
  %2118 = add i64 %stack_len2877, 1
  store i64 %2118, ptr %len.addr, align 8
  %2119 = sub i64 %stack_len2877, 1
  %sp2878 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2119
  %dup12879 = load i256, ptr %sp2878, align 16
  %sp2880 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2877
  store i256 %dup12879, ptr %sp2880, align 16
  br label %OP811.DUP4, !annotation !5

OP811.DUP4:                                       ; preds = %OP810.DUP1
  %stack_len2881 = load i64, ptr %len.addr, align 8
  %2120 = add i64 %stack_len2881, 1
  store i64 %2120, ptr %len.addr, align 8
  %2121 = sub i64 %stack_len2881, 4
  %sp2882 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2121
  %dup42883 = load i256, ptr %sp2882, align 16
  %sp2884 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2881
  store i256 %dup42883, ptr %sp2884, align 16
  br label %OP812.SLOAD, !annotation !5

OP812.SLOAD:                                      ; preds = %OP811.DUP4
  %stack_len2885 = load i64, ptr %len.addr, align 8
  %2122 = sub i64 %stack_len2885, 1
  %sp2886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2122
  %2123 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp2886, i8 19)
  %2124 = icmp ne i8 %2123, 0
  br i1 %2124, label %return, label %OP812.SLOAD.contd, !prof !2

OP812.SLOAD.contd:                                ; preds = %OP812.SLOAD
  br label %OP813.DIV, !annotation !5

OP813.DIV:                                        ; preds = %OP812.SLOAD.contd
  %stack_len2887 = load i64, ptr %len.addr, align 8
  %2125 = add i64 %stack_len2887, -1
  store i64 %2125, ptr %len.addr, align 8
  %2126 = add i64 %stack_len2887, -1
  %sp2888 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2126
  %a2889 = load i256, ptr %sp2888, align 16
  %2127 = add i64 %stack_len2887, -2
  %sp2890 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2127
  %b2891 = load i256, ptr %sp2890, align 16
  %2128 = icmp eq i256 %b2891, 0
  %2129 = udiv i256 %a2889, %b2891
  %2130 = select i1 %2128, i256 0, i256 %2129
  %2131 = add i64 %stack_len2887, -2
  %sp2892 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2131
  store i256 %2130, ptr %sp2892, align 16
  br label %OP814.MUL, !annotation !5

OP814.MUL:                                        ; preds = %OP813.DIV
  %stack_len2893 = load i64, ptr %len.addr, align 8
  %2132 = add i64 %stack_len2893, -1
  store i64 %2132, ptr %len.addr, align 8
  %2133 = add i64 %stack_len2893, -1
  %sp2894 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2133
  %a2895 = load i256, ptr %sp2894, align 16
  %2134 = add i64 %stack_len2893, -2
  %sp2896 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2134
  %b2897 = load i256, ptr %sp2896, align 16
  %2135 = mul i256 %a2895, %b2897
  %2136 = add i64 %stack_len2893, -2
  %sp2898 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2136
  store i256 %2135, ptr %sp2898, align 16
  br label %OP815.DUP4, !annotation !5

OP815.DUP4:                                       ; preds = %OP814.MUL
  %stack_len2899 = load i64, ptr %len.addr, align 8
  %2137 = add i64 %stack_len2899, 1
  store i64 %2137, ptr %len.addr, align 8
  %2138 = sub i64 %stack_len2899, 4
  %sp2900 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2138
  %dup42901 = load i256, ptr %sp2900, align 16
  %sp2902 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2899
  store i256 %dup42901, ptr %sp2902, align 16
  br label %OP816.MSTORE, !annotation !5

OP816.MSTORE:                                     ; preds = %OP815.DUP4
  %stack_len2903 = load i64, ptr %len.addr, align 8
  %2139 = add i64 %stack_len2903, -2
  store i64 %2139, ptr %len.addr, align 8
  %2140 = add i64 %stack_len2903, -1
  %sp2904 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2140
  %a2905 = load i256, ptr %sp2904, align 16
  %2141 = add i64 %stack_len2903, -2
  %sp2906 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2141
  %b2907 = load i256, ptr %sp2906, align 16
  %2142 = call i8 @__revmc_ir_builtin_mstore(i256 %a2905, i256 %b2907, ptr %arg.ecx.addr)
  %2143 = icmp ne i8 %2142, 0
  br i1 %2143, label %return, label %OP816.MSTORE.contd, !prof !2

OP816.MSTORE.contd:                               ; preds = %OP816.MSTORE
  br label %OP817.SWAP2, !annotation !5

OP817.SWAP2:                                      ; preds = %OP816.MSTORE.contd
  %stack_len2908 = load i64, ptr %len.addr, align 8
  %2144 = sub i64 %stack_len2908, 1
  %sp2909 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2144
  %swap.a2910 = load i256, ptr %sp2909, align 16
  %2145 = sub i64 %stack_len2908, 3
  %sp2911 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2145
  %swap.b2912 = load i256, ptr %sp2911, align 16
  store i256 %swap.a2910, ptr %sp2911, align 16
  store i256 %swap.b2912, ptr %sp2909, align 16
  br label %OP818.PUSH1, !annotation !5

OP818.PUSH1:                                      ; preds = %OP817.SWAP2
  %stack_len2913 = load i64, ptr %len.addr, align 8
  %2146 = add i64 %stack_len2913, 1
  store i64 %2146, ptr %len.addr, align 8
  %sp2914 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2913
  store i256 32, ptr %sp2914, align 16
  br label %OP819.ADD, !annotation !5

OP819.ADD:                                        ; preds = %OP818.PUSH1
  %stack_len2915 = load i64, ptr %len.addr, align 8
  %2147 = add i64 %stack_len2915, -1
  store i64 %2147, ptr %len.addr, align 8
  %2148 = add i64 %stack_len2915, -1
  %sp2916 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2148
  %a2917 = load i256, ptr %sp2916, align 16
  %2149 = add i64 %stack_len2915, -2
  %sp2918 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2149
  %b2919 = load i256, ptr %sp2918, align 16
  %2150 = add i256 %a2917, %b2919
  %2151 = add i64 %stack_len2915, -2
  %sp2920 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2151
  store i256 %2150, ptr %sp2920, align 16
  br label %OP820.SWAP2, !annotation !5

OP820.SWAP2:                                      ; preds = %OP819.ADD
  %stack_len2921 = load i64, ptr %len.addr, align 8
  %2152 = sub i64 %stack_len2921, 1
  %sp2922 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2152
  %swap.a2923 = load i256, ptr %sp2922, align 16
  %2153 = sub i64 %stack_len2921, 3
  %sp2924 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2153
  %swap.b2925 = load i256, ptr %sp2924, align 16
  store i256 %swap.a2923, ptr %sp2924, align 16
  store i256 %swap.b2925, ptr %sp2922, align 16
  br label %OP821.PUSH2, !annotation !5

OP821.PUSH2:                                      ; preds = %OP820.SWAP2
  br label %OP822.JUMP, !annotation !6

OP822.JUMP:                                       ; preds = %OP821.PUSH2
  %stack_len2926 = load i64, ptr %len.addr, align 8
  br label %OP858.JUMPDEST

OP823.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP808.JUMPI
  %gas.remaining2927 = load i64, ptr %gas.remaining.addr, align 8
  %2154 = sub i64 %gas.remaining2927, 58
  %2155 = icmp ult i64 %gas.remaining2927, 58
  store i64 %2154, ptr %gas.remaining.addr, align 8
  br i1 %2155, label %return, label %OP823.JUMPDEST.contd, !prof !2, !annotation !3

OP823.JUMPDEST.contd:                             ; preds = %OP823.JUMPDEST
  %stack_len2928 = load i64, ptr %len.addr, align 8
  %2156 = icmp ult i64 %stack_len2928, 3
  %2157 = icmp ugt i64 %stack_len2928, 1023
  %2158 = or i1 %2156, %2157
  %2159 = select i1 %2156, i8 91, i8 92
  br i1 %2158, label %return, label %OP823.JUMPDEST.contd2929, !prof !2

OP823.JUMPDEST.contd2929:                         ; preds = %OP823.JUMPDEST.contd
  br label %OP824.DUP3, !annotation !5

OP824.DUP3:                                       ; preds = %OP823.JUMPDEST.contd2929
  %stack_len2930 = load i64, ptr %len.addr, align 8
  %2160 = add i64 %stack_len2930, 1
  store i64 %2160, ptr %len.addr, align 8
  %2161 = sub i64 %stack_len2930, 3
  %sp2931 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2161
  %dup32932 = load i256, ptr %sp2931, align 16
  %sp2933 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2930
  store i256 %dup32932, ptr %sp2933, align 16
  br label %OP825.ADD, !annotation !5

OP825.ADD:                                        ; preds = %OP824.DUP3
  %stack_len2934 = load i64, ptr %len.addr, align 8
  %2162 = add i64 %stack_len2934, -1
  store i64 %2162, ptr %len.addr, align 8
  %2163 = add i64 %stack_len2934, -1
  %sp2935 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2163
  %a2936 = load i256, ptr %sp2935, align 16
  %2164 = add i64 %stack_len2934, -2
  %sp2937 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2164
  %b2938 = load i256, ptr %sp2937, align 16
  %2165 = add i256 %a2936, %b2938
  %2166 = add i64 %stack_len2934, -2
  %sp2939 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2166
  store i256 %2165, ptr %sp2939, align 16
  br label %OP826.SWAP2, !annotation !5

OP826.SWAP2:                                      ; preds = %OP825.ADD
  %stack_len2940 = load i64, ptr %len.addr, align 8
  %2167 = sub i64 %stack_len2940, 1
  %sp2941 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2167
  %swap.a2942 = load i256, ptr %sp2941, align 16
  %2168 = sub i64 %stack_len2940, 3
  %sp2943 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2168
  %swap.b2944 = load i256, ptr %sp2943, align 16
  store i256 %swap.a2942, ptr %sp2943, align 16
  store i256 %swap.b2944, ptr %sp2941, align 16
  br label %OP827.SWAP1, !annotation !5

OP827.SWAP1:                                      ; preds = %OP826.SWAP2
  %stack_len2945 = load i64, ptr %len.addr, align 8
  %2169 = sub i64 %stack_len2945, 1
  %sp2946 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2169
  %swap.a2947 = load i256, ptr %sp2946, align 16
  %2170 = sub i64 %stack_len2945, 2
  %sp2948 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2170
  %swap.b2949 = load i256, ptr %sp2948, align 16
  store i256 %swap.a2947, ptr %sp2948, align 16
  store i256 %swap.b2949, ptr %sp2946, align 16
  br label %OP828.PUSH1, !annotation !5

OP828.PUSH1:                                      ; preds = %OP827.SWAP1
  %stack_len2950 = load i64, ptr %len.addr, align 8
  %2171 = add i64 %stack_len2950, 1
  store i64 %2171, ptr %len.addr, align 8
  %sp2951 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2950
  store i256 0, ptr %sp2951, align 16
  br label %OP829.MSTORE, !annotation !5

OP829.MSTORE:                                     ; preds = %OP828.PUSH1
  %stack_len2952 = load i64, ptr %len.addr, align 8
  %2172 = add i64 %stack_len2952, -2
  store i64 %2172, ptr %len.addr, align 8
  %2173 = add i64 %stack_len2952, -1
  %sp2953 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2173
  %a2954 = load i256, ptr %sp2953, align 16
  %2174 = add i64 %stack_len2952, -2
  %sp2955 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2174
  %b2956 = load i256, ptr %sp2955, align 16
  %2175 = call i8 @__revmc_ir_builtin_mstore(i256 %a2954, i256 %b2956, ptr %arg.ecx.addr)
  %2176 = icmp ne i8 %2175, 0
  br i1 %2176, label %return, label %OP829.MSTORE.contd, !prof !2

OP829.MSTORE.contd:                               ; preds = %OP829.MSTORE
  br label %OP830.PUSH1, !annotation !5

OP830.PUSH1:                                      ; preds = %OP829.MSTORE.contd
  %stack_len2957 = load i64, ptr %len.addr, align 8
  %2177 = add i64 %stack_len2957, 1
  store i64 %2177, ptr %len.addr, align 8
  %sp2958 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2957
  store i256 32, ptr %sp2958, align 16
  br label %OP831.PUSH1, !annotation !5

OP831.PUSH1:                                      ; preds = %OP830.PUSH1
  %stack_len2959 = load i64, ptr %len.addr, align 8
  %2178 = add i64 %stack_len2959, 1
  store i64 %2178, ptr %len.addr, align 8
  %sp2960 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2959
  store i256 0, ptr %sp2960, align 16
  br label %OP832.KECCAK256, !annotation !5

OP832.KECCAK256:                                  ; preds = %OP831.PUSH1
  %stack_len2961 = load i64, ptr %len.addr, align 8
  %2179 = add i64 %stack_len2961, -1
  store i64 %2179, ptr %len.addr, align 8
  %2180 = sub i64 %stack_len2961, 2
  %sp2962 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2180
  %2181 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp2962)
  %2182 = icmp ne i8 %2181, 0
  br i1 %2182, label %return, label %OP832.KECCAK256.contd, !prof !2

OP832.KECCAK256.contd:                            ; preds = %OP832.KECCAK256
  br label %OP833.SWAP1, !annotation !5

OP833.SWAP1:                                      ; preds = %OP832.KECCAK256.contd
  %stack_len2963 = load i64, ptr %len.addr, align 8
  %2183 = sub i64 %stack_len2963, 1
  %sp2964 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2183
  %swap.a2965 = load i256, ptr %sp2964, align 16
  %2184 = sub i64 %stack_len2963, 2
  %sp2966 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2184
  %swap.b2967 = load i256, ptr %sp2966, align 16
  store i256 %swap.a2965, ptr %sp2966, align 16
  store i256 %swap.b2967, ptr %sp2964, align 16
  br label %OP834.JUMPDEST, !annotation !5

OP834.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP849.JUMPI, %OP833.SWAP1
  %gas.remaining2968 = load i64, ptr %gas.remaining.addr, align 8
  %2185 = sub i64 %gas.remaining2968, 50
  %2186 = icmp ult i64 %gas.remaining2968, 50
  store i64 %2185, ptr %gas.remaining.addr, align 8
  br i1 %2186, label %return, label %OP834.JUMPDEST.contd, !prof !2, !annotation !3

OP834.JUMPDEST.contd:                             ; preds = %OP834.JUMPDEST
  %stack_len2969 = load i64, ptr %len.addr, align 8
  %2187 = icmp ult i64 %stack_len2969, 3
  %2188 = icmp ugt i64 %stack_len2969, 1022
  %2189 = or i1 %2187, %2188
  %2190 = select i1 %2187, i8 91, i8 92
  br i1 %2189, label %return, label %OP834.JUMPDEST.contd2970, !prof !2

OP834.JUMPDEST.contd2970:                         ; preds = %OP834.JUMPDEST.contd
  br label %OP835.DUP2, !annotation !5

OP835.DUP2:                                       ; preds = %OP834.JUMPDEST.contd2970
  %stack_len2971 = load i64, ptr %len.addr, align 8
  %2191 = add i64 %stack_len2971, 1
  store i64 %2191, ptr %len.addr, align 8
  %2192 = sub i64 %stack_len2971, 2
  %sp2972 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2192
  %dup22973 = load i256, ptr %sp2972, align 16
  %sp2974 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2971
  store i256 %dup22973, ptr %sp2974, align 16
  br label %OP836.SLOAD, !annotation !5

OP836.SLOAD:                                      ; preds = %OP835.DUP2
  %stack_len2975 = load i64, ptr %len.addr, align 8
  %2193 = sub i64 %stack_len2975, 1
  %sp2976 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2193
  %2194 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp2976, i8 19)
  %2195 = icmp ne i8 %2194, 0
  br i1 %2195, label %return, label %OP836.SLOAD.contd, !prof !2

OP836.SLOAD.contd:                                ; preds = %OP836.SLOAD
  br label %OP837.DUP2, !annotation !5

OP837.DUP2:                                       ; preds = %OP836.SLOAD.contd
  %stack_len2977 = load i64, ptr %len.addr, align 8
  %2196 = add i64 %stack_len2977, 1
  store i64 %2196, ptr %len.addr, align 8
  %2197 = sub i64 %stack_len2977, 2
  %sp2978 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2197
  %dup22979 = load i256, ptr %sp2978, align 16
  %sp2980 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2977
  store i256 %dup22979, ptr %sp2980, align 16
  br label %OP838.MSTORE, !annotation !5

OP838.MSTORE:                                     ; preds = %OP837.DUP2
  %stack_len2981 = load i64, ptr %len.addr, align 8
  %2198 = add i64 %stack_len2981, -2
  store i64 %2198, ptr %len.addr, align 8
  %2199 = add i64 %stack_len2981, -1
  %sp2982 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2199
  %a2983 = load i256, ptr %sp2982, align 16
  %2200 = add i64 %stack_len2981, -2
  %sp2984 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2200
  %b2985 = load i256, ptr %sp2984, align 16
  %2201 = call i8 @__revmc_ir_builtin_mstore(i256 %a2983, i256 %b2985, ptr %arg.ecx.addr)
  %2202 = icmp ne i8 %2201, 0
  br i1 %2202, label %return, label %OP838.MSTORE.contd, !prof !2

OP838.MSTORE.contd:                               ; preds = %OP838.MSTORE
  br label %OP839.SWAP1, !annotation !5

OP839.SWAP1:                                      ; preds = %OP838.MSTORE.contd
  %stack_len2986 = load i64, ptr %len.addr, align 8
  %2203 = sub i64 %stack_len2986, 1
  %sp2987 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2203
  %swap.a2988 = load i256, ptr %sp2987, align 16
  %2204 = sub i64 %stack_len2986, 2
  %sp2989 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2204
  %swap.b2990 = load i256, ptr %sp2989, align 16
  store i256 %swap.a2988, ptr %sp2989, align 16
  store i256 %swap.b2990, ptr %sp2987, align 16
  br label %OP840.PUSH1, !annotation !5

OP840.PUSH1:                                      ; preds = %OP839.SWAP1
  %stack_len2991 = load i64, ptr %len.addr, align 8
  %2205 = add i64 %stack_len2991, 1
  store i64 %2205, ptr %len.addr, align 8
  %sp2992 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2991
  store i256 1, ptr %sp2992, align 16
  br label %OP841.ADD, !annotation !5

OP841.ADD:                                        ; preds = %OP840.PUSH1
  %stack_len2993 = load i64, ptr %len.addr, align 8
  %2206 = add i64 %stack_len2993, -1
  store i64 %2206, ptr %len.addr, align 8
  %2207 = add i64 %stack_len2993, -1
  %sp2994 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2207
  %a2995 = load i256, ptr %sp2994, align 16
  %2208 = add i64 %stack_len2993, -2
  %sp2996 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2208
  %b2997 = load i256, ptr %sp2996, align 16
  %2209 = add i256 %a2995, %b2997
  %2210 = add i64 %stack_len2993, -2
  %sp2998 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2210
  store i256 %2209, ptr %sp2998, align 16
  br label %OP842.SWAP1, !annotation !5

OP842.SWAP1:                                      ; preds = %OP841.ADD
  %stack_len2999 = load i64, ptr %len.addr, align 8
  %2211 = sub i64 %stack_len2999, 1
  %sp3000 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2211
  %swap.a3001 = load i256, ptr %sp3000, align 16
  %2212 = sub i64 %stack_len2999, 2
  %sp3002 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2212
  %swap.b3003 = load i256, ptr %sp3002, align 16
  store i256 %swap.a3001, ptr %sp3002, align 16
  store i256 %swap.b3003, ptr %sp3000, align 16
  br label %OP843.PUSH1, !annotation !5

OP843.PUSH1:                                      ; preds = %OP842.SWAP1
  %stack_len3004 = load i64, ptr %len.addr, align 8
  %2213 = add i64 %stack_len3004, 1
  store i64 %2213, ptr %len.addr, align 8
  %sp3005 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3004
  store i256 32, ptr %sp3005, align 16
  br label %OP844.ADD, !annotation !5

OP844.ADD:                                        ; preds = %OP843.PUSH1
  %stack_len3006 = load i64, ptr %len.addr, align 8
  %2214 = add i64 %stack_len3006, -1
  store i64 %2214, ptr %len.addr, align 8
  %2215 = add i64 %stack_len3006, -1
  %sp3007 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2215
  %a3008 = load i256, ptr %sp3007, align 16
  %2216 = add i64 %stack_len3006, -2
  %sp3009 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2216
  %b3010 = load i256, ptr %sp3009, align 16
  %2217 = add i256 %a3008, %b3010
  %2218 = add i64 %stack_len3006, -2
  %sp3011 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2218
  store i256 %2217, ptr %sp3011, align 16
  br label %OP845.DUP1, !annotation !5

OP845.DUP1:                                       ; preds = %OP844.ADD
  %stack_len3012 = load i64, ptr %len.addr, align 8
  %2219 = add i64 %stack_len3012, 1
  store i64 %2219, ptr %len.addr, align 8
  %2220 = sub i64 %stack_len3012, 1
  %sp3013 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2220
  %dup13014 = load i256, ptr %sp3013, align 16
  %sp3015 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3012
  store i256 %dup13014, ptr %sp3015, align 16
  br label %OP846.DUP4, !annotation !5

OP846.DUP4:                                       ; preds = %OP845.DUP1
  %stack_len3016 = load i64, ptr %len.addr, align 8
  %2221 = add i64 %stack_len3016, 1
  store i64 %2221, ptr %len.addr, align 8
  %2222 = sub i64 %stack_len3016, 4
  %sp3017 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2222
  %dup43018 = load i256, ptr %sp3017, align 16
  %sp3019 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3016
  store i256 %dup43018, ptr %sp3019, align 16
  br label %OP847.GT, !annotation !5

OP847.GT:                                         ; preds = %OP846.DUP4
  %stack_len3020 = load i64, ptr %len.addr, align 8
  %2223 = add i64 %stack_len3020, -1
  store i64 %2223, ptr %len.addr, align 8
  %2224 = add i64 %stack_len3020, -1
  %sp3021 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2224
  %a3022 = load i256, ptr %sp3021, align 16
  %2225 = add i64 %stack_len3020, -2
  %sp3023 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2225
  %b3024 = load i256, ptr %sp3023, align 16
  %2226 = icmp ugt i256 %a3022, %b3024
  %2227 = zext i1 %2226 to i256
  %2228 = add i64 %stack_len3020, -2
  %sp3025 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2228
  store i256 %2227, ptr %sp3025, align 16
  br label %OP848.PUSH2, !annotation !5

OP848.PUSH2:                                      ; preds = %OP847.GT
  br label %OP849.JUMPI, !annotation !6

OP849.JUMPI:                                      ; preds = %OP848.PUSH2
  %stack_len3026 = load i64, ptr %len.addr, align 8
  %2229 = add i64 %stack_len3026, -1
  store i64 %2229, ptr %len.addr, align 8
  %2230 = add i64 %stack_len3026, -1
  %sp3027 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2230
  %a3028 = load i256, ptr %sp3027, align 16
  %2231 = icmp ne i256 %a3028, 0
  br i1 %2231, label %OP834.JUMPDEST, label %OP850.DUP3

OP850.DUP3:                                       ; preds = %OP849.JUMPI
  %gas.remaining3029 = load i64, ptr %gas.remaining.addr, align 8
  %2232 = sub i64 %gas.remaining3029, 24
  %2233 = icmp ult i64 %gas.remaining3029, 24
  store i64 %2232, ptr %gas.remaining.addr, align 8
  br i1 %2233, label %return, label %OP850.DUP3.contd, !prof !2, !annotation !3

OP850.DUP3.contd:                                 ; preds = %OP850.DUP3
  %stack_len3030 = load i64, ptr %len.addr, align 8
  %2234 = icmp ult i64 %stack_len3030, 3
  %2235 = icmp ugt i64 %stack_len3030, 1023
  %2236 = or i1 %2234, %2235
  %2237 = select i1 %2234, i8 91, i8 92
  br i1 %2236, label %return, label %OP850.DUP3.contd3031, !prof !2

OP850.DUP3.contd3031:                             ; preds = %OP850.DUP3.contd
  %2238 = add i64 %stack_len3030, 1
  store i64 %2238, ptr %len.addr, align 8
  %2239 = sub i64 %stack_len3030, 3
  %sp3032 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2239
  %dup33033 = load i256, ptr %sp3032, align 16
  %sp3034 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3030
  store i256 %dup33033, ptr %sp3034, align 16
  br label %OP851.SWAP1, !annotation !5

OP851.SWAP1:                                      ; preds = %OP850.DUP3.contd3031
  %stack_len3035 = load i64, ptr %len.addr, align 8
  %2240 = sub i64 %stack_len3035, 1
  %sp3036 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2240
  %swap.a3037 = load i256, ptr %sp3036, align 16
  %2241 = sub i64 %stack_len3035, 2
  %sp3038 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2241
  %swap.b3039 = load i256, ptr %sp3038, align 16
  store i256 %swap.a3037, ptr %sp3038, align 16
  store i256 %swap.b3039, ptr %sp3036, align 16
  br label %OP852.SUB, !annotation !5

OP852.SUB:                                        ; preds = %OP851.SWAP1
  %stack_len3040 = load i64, ptr %len.addr, align 8
  %2242 = add i64 %stack_len3040, -1
  store i64 %2242, ptr %len.addr, align 8
  %2243 = add i64 %stack_len3040, -1
  %sp3041 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2243
  %a3042 = load i256, ptr %sp3041, align 16
  %2244 = add i64 %stack_len3040, -2
  %sp3043 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2244
  %b3044 = load i256, ptr %sp3043, align 16
  %2245 = sub i256 %a3042, %b3044
  %2246 = add i64 %stack_len3040, -2
  %sp3045 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2246
  store i256 %2245, ptr %sp3045, align 16
  br label %OP853.PUSH1, !annotation !5

OP853.PUSH1:                                      ; preds = %OP852.SUB
  %stack_len3046 = load i64, ptr %len.addr, align 8
  %2247 = add i64 %stack_len3046, 1
  store i64 %2247, ptr %len.addr, align 8
  %sp3047 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3046
  store i256 31, ptr %sp3047, align 16
  br label %OP854.AND, !annotation !5

OP854.AND:                                        ; preds = %OP853.PUSH1
  %stack_len3048 = load i64, ptr %len.addr, align 8
  %2248 = add i64 %stack_len3048, -1
  store i64 %2248, ptr %len.addr, align 8
  %2249 = add i64 %stack_len3048, -1
  %sp3049 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2249
  %a3050 = load i256, ptr %sp3049, align 16
  %2250 = add i64 %stack_len3048, -2
  %sp3051 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2250
  %b3052 = load i256, ptr %sp3051, align 16
  %2251 = and i256 %a3050, %b3052
  %2252 = add i64 %stack_len3048, -2
  %sp3053 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2252
  store i256 %2251, ptr %sp3053, align 16
  br label %OP855.DUP3, !annotation !5

OP855.DUP3:                                       ; preds = %OP854.AND
  %stack_len3054 = load i64, ptr %len.addr, align 8
  %2253 = add i64 %stack_len3054, 1
  store i64 %2253, ptr %len.addr, align 8
  %2254 = sub i64 %stack_len3054, 3
  %sp3055 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2254
  %dup33056 = load i256, ptr %sp3055, align 16
  %sp3057 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3054
  store i256 %dup33056, ptr %sp3057, align 16
  br label %OP856.ADD, !annotation !5

OP856.ADD:                                        ; preds = %OP855.DUP3
  %stack_len3058 = load i64, ptr %len.addr, align 8
  %2255 = add i64 %stack_len3058, -1
  store i64 %2255, ptr %len.addr, align 8
  %2256 = add i64 %stack_len3058, -1
  %sp3059 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2256
  %a3060 = load i256, ptr %sp3059, align 16
  %2257 = add i64 %stack_len3058, -2
  %sp3061 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2257
  %b3062 = load i256, ptr %sp3061, align 16
  %2258 = add i256 %a3060, %b3062
  %2259 = add i64 %stack_len3058, -2
  %sp3063 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2259
  store i256 %2258, ptr %sp3063, align 16
  br label %OP857.SWAP2, !annotation !5

OP857.SWAP2:                                      ; preds = %OP856.ADD
  %stack_len3064 = load i64, ptr %len.addr, align 8
  %2260 = sub i64 %stack_len3064, 1
  %sp3065 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2260
  %swap.a3066 = load i256, ptr %sp3065, align 16
  %2261 = sub i64 %stack_len3064, 3
  %sp3067 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2261
  %swap.b3068 = load i256, ptr %sp3067, align 16
  store i256 %swap.a3066, ptr %sp3067, align 16
  store i256 %swap.b3068, ptr %sp3065, align 16
  br label %OP858.JUMPDEST, !annotation !5

OP858.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP857.SWAP2, %OP822.JUMP, %OP803.JUMPI
  %gas.remaining3069 = load i64, ptr %gas.remaining.addr, align 8
  %2262 = sub i64 %gas.remaining3069, 22
  %2263 = icmp ult i64 %gas.remaining3069, 22
  store i64 %2262, ptr %gas.remaining.addr, align 8
  br i1 %2263, label %return, label %OP858.JUMPDEST.contd, !prof !2, !annotation !3

OP858.JUMPDEST.contd:                             ; preds = %OP858.JUMPDEST
  %stack_len3070 = load i64, ptr %len.addr, align 8
  %2264 = icmp ult i64 %stack_len3070, 7
  br i1 %2264, label %return, label %OP858.JUMPDEST.contd3071, !prof !2, !annotation !9

OP858.JUMPDEST.contd3071:                         ; preds = %OP858.JUMPDEST.contd
  br label %OP859.POP, !annotation !5

OP859.POP:                                        ; preds = %OP858.JUMPDEST.contd3071
  %stack_len3072 = load i64, ptr %len.addr, align 8
  %2265 = add i64 %stack_len3072, -1
  store i64 %2265, ptr %len.addr, align 8
  br label %OP860.POP, !annotation !5

OP860.POP:                                        ; preds = %OP859.POP
  %stack_len3073 = load i64, ptr %len.addr, align 8
  %2266 = add i64 %stack_len3073, -1
  store i64 %2266, ptr %len.addr, align 8
  br label %OP861.POP, !annotation !5

OP861.POP:                                        ; preds = %OP860.POP
  %stack_len3074 = load i64, ptr %len.addr, align 8
  %2267 = add i64 %stack_len3074, -1
  store i64 %2267, ptr %len.addr, align 8
  br label %OP862.POP, !annotation !5

OP862.POP:                                        ; preds = %OP861.POP
  %stack_len3075 = load i64, ptr %len.addr, align 8
  %2268 = add i64 %stack_len3075, -1
  store i64 %2268, ptr %len.addr, align 8
  br label %OP863.POP, !annotation !5

OP863.POP:                                        ; preds = %OP862.POP
  %stack_len3076 = load i64, ptr %len.addr, align 8
  %2269 = add i64 %stack_len3076, -1
  store i64 %2269, ptr %len.addr, align 8
  br label %OP864.DUP2, !annotation !5

OP864.DUP2:                                       ; preds = %OP863.POP
  %stack_len3077 = load i64, ptr %len.addr, align 8
  %2270 = add i64 %stack_len3077, 1
  store i64 %2270, ptr %len.addr, align 8
  %2271 = sub i64 %stack_len3077, 2
  %sp3078 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2271
  %dup23079 = load i256, ptr %sp3078, align 16
  %sp3080 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3077
  store i256 %dup23079, ptr %sp3080, align 16
  br label %OP865.JUMP, !annotation !5

OP865.JUMP:                                       ; preds = %OP864.DUP2
  %stack_len3081 = load i64, ptr %len.addr, align 8
  %2272 = add i64 %stack_len3081, -1
  store i64 %2272, ptr %len.addr, align 8
  %2273 = add i64 %stack_len3081, -1
  %sp3082 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2273
  %a3083 = load i256, ptr %sp3082, align 16
  br label %dynamic_jump_table

OP866.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP225.JUMP
  %gas.remaining3084 = load i64, ptr %gas.remaining.addr, align 8
  %2274 = sub i64 %gas.remaining3084, 171
  %2275 = icmp ult i64 %gas.remaining3084, 171
  store i64 %2274, ptr %gas.remaining.addr, align 8
  br i1 %2275, label %return, label %OP866.JUMPDEST.contd, !prof !2, !annotation !3

OP866.JUMPDEST.contd:                             ; preds = %OP866.JUMPDEST
  %stack_len3085 = load i64, ptr %len.addr, align 8
  %2276 = icmp ult i64 %stack_len3085, 2
  %2277 = icmp ugt i64 %stack_len3085, 1018
  %2278 = or i1 %2276, %2277
  %2279 = select i1 %2276, i8 91, i8 92
  br i1 %2278, label %return, label %OP866.JUMPDEST.contd3086, !prof !2

OP866.JUMPDEST.contd3086:                         ; preds = %OP866.JUMPDEST.contd
  br label %OP867.PUSH1, !annotation !5

OP867.PUSH1:                                      ; preds = %OP866.JUMPDEST.contd3086
  %stack_len3087 = load i64, ptr %len.addr, align 8
  %2280 = add i64 %stack_len3087, 1
  store i64 %2280, ptr %len.addr, align 8
  %sp3088 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3087
  store i256 0, ptr %sp3088, align 16
  br label %OP868.DUP2, !annotation !5

OP868.DUP2:                                       ; preds = %OP867.PUSH1
  %stack_len3089 = load i64, ptr %len.addr, align 8
  %2281 = add i64 %stack_len3089, 1
  store i64 %2281, ptr %len.addr, align 8
  %2282 = sub i64 %stack_len3089, 2
  %sp3090 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2282
  %dup23091 = load i256, ptr %sp3090, align 16
  %sp3092 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3089
  store i256 %dup23091, ptr %sp3092, align 16
  br label %OP869.PUSH1, !annotation !5

OP869.PUSH1:                                      ; preds = %OP868.DUP2
  %stack_len3093 = load i64, ptr %len.addr, align 8
  %2283 = add i64 %stack_len3093, 1
  store i64 %2283, ptr %len.addr, align 8
  %sp3094 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3093
  store i256 4, ptr %sp3094, align 16
  br label %OP870.PUSH1, !annotation !5

OP870.PUSH1:                                      ; preds = %OP869.PUSH1
  %stack_len3095 = load i64, ptr %len.addr, align 8
  %2284 = add i64 %stack_len3095, 1
  store i64 %2284, ptr %len.addr, align 8
  %sp3096 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3095
  store i256 0, ptr %sp3096, align 16
  br label %OP871.CALLER, !annotation !5

OP871.CALLER:                                     ; preds = %OP870.PUSH1
  %stack_len3097 = load i64, ptr %len.addr, align 8
  %2285 = add i64 %stack_len3097, 1
  store i64 %2285, ptr %len.addr, align 8
  %contract.caller.addr3098 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3099 = load i160, ptr %contract.caller.addr3098, align 16
  %2286 = call i160 @llvm.bswap.i160(i160 %contract.caller3099)
  %2287 = zext i160 %2286 to i256
  %sp3100 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3097
  store i256 %2287, ptr %sp3100, align 16
  br label %OP872.PUSH20, !annotation !5

OP872.PUSH20:                                     ; preds = %OP871.CALLER
  %stack_len3101 = load i64, ptr %len.addr, align 8
  %2288 = add i64 %stack_len3101, 1
  store i64 %2288, ptr %len.addr, align 8
  %sp3102 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3101
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3102, align 16
  br label %OP873.AND, !annotation !5

OP873.AND:                                        ; preds = %OP872.PUSH20
  %stack_len3103 = load i64, ptr %len.addr, align 8
  %2289 = add i64 %stack_len3103, -1
  store i64 %2289, ptr %len.addr, align 8
  %2290 = add i64 %stack_len3103, -1
  %sp3104 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2290
  %a3105 = load i256, ptr %sp3104, align 16
  %2291 = add i64 %stack_len3103, -2
  %sp3106 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2291
  %b3107 = load i256, ptr %sp3106, align 16
  %2292 = and i256 %a3105, %b3107
  %2293 = add i64 %stack_len3103, -2
  %sp3108 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2293
  store i256 %2292, ptr %sp3108, align 16
  br label %OP874.PUSH20, !annotation !5

OP874.PUSH20:                                     ; preds = %OP873.AND
  %stack_len3109 = load i64, ptr %len.addr, align 8
  %2294 = add i64 %stack_len3109, 1
  store i64 %2294, ptr %len.addr, align 8
  %sp3110 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3109
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3110, align 16
  br label %OP875.AND, !annotation !5

OP875.AND:                                        ; preds = %OP874.PUSH20
  %stack_len3111 = load i64, ptr %len.addr, align 8
  %2295 = add i64 %stack_len3111, -1
  store i64 %2295, ptr %len.addr, align 8
  %2296 = add i64 %stack_len3111, -1
  %sp3112 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2296
  %a3113 = load i256, ptr %sp3112, align 16
  %2297 = add i64 %stack_len3111, -2
  %sp3114 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2297
  %b3115 = load i256, ptr %sp3114, align 16
  %2298 = and i256 %a3113, %b3115
  %2299 = add i64 %stack_len3111, -2
  %sp3116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2299
  store i256 %2298, ptr %sp3116, align 16
  br label %OP876.DUP2, !annotation !5

OP876.DUP2:                                       ; preds = %OP875.AND
  %stack_len3117 = load i64, ptr %len.addr, align 8
  %2300 = add i64 %stack_len3117, 1
  store i64 %2300, ptr %len.addr, align 8
  %2301 = sub i64 %stack_len3117, 2
  %sp3118 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2301
  %dup23119 = load i256, ptr %sp3118, align 16
  %sp3120 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3117
  store i256 %dup23119, ptr %sp3120, align 16
  br label %OP877.MSTORE, !annotation !5

OP877.MSTORE:                                     ; preds = %OP876.DUP2
  %stack_len3121 = load i64, ptr %len.addr, align 8
  %2302 = add i64 %stack_len3121, -2
  store i64 %2302, ptr %len.addr, align 8
  %2303 = add i64 %stack_len3121, -1
  %sp3122 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2303
  %a3123 = load i256, ptr %sp3122, align 16
  %2304 = add i64 %stack_len3121, -2
  %sp3124 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2304
  %b3125 = load i256, ptr %sp3124, align 16
  %2305 = call i8 @__revmc_ir_builtin_mstore(i256 %a3123, i256 %b3125, ptr %arg.ecx.addr)
  %2306 = icmp ne i8 %2305, 0
  br i1 %2306, label %return, label %OP877.MSTORE.contd, !prof !2

OP877.MSTORE.contd:                               ; preds = %OP877.MSTORE
  br label %OP878.PUSH1, !annotation !5

OP878.PUSH1:                                      ; preds = %OP877.MSTORE.contd
  %stack_len3126 = load i64, ptr %len.addr, align 8
  %2307 = add i64 %stack_len3126, 1
  store i64 %2307, ptr %len.addr, align 8
  %sp3127 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3126
  store i256 32, ptr %sp3127, align 16
  br label %OP879.ADD, !annotation !5

OP879.ADD:                                        ; preds = %OP878.PUSH1
  %stack_len3128 = load i64, ptr %len.addr, align 8
  %2308 = add i64 %stack_len3128, -1
  store i64 %2308, ptr %len.addr, align 8
  %2309 = add i64 %stack_len3128, -1
  %sp3129 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2309
  %a3130 = load i256, ptr %sp3129, align 16
  %2310 = add i64 %stack_len3128, -2
  %sp3131 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2310
  %b3132 = load i256, ptr %sp3131, align 16
  %2311 = add i256 %a3130, %b3132
  %2312 = add i64 %stack_len3128, -2
  %sp3133 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2312
  store i256 %2311, ptr %sp3133, align 16
  br label %OP880.SWAP1, !annotation !5

OP880.SWAP1:                                      ; preds = %OP879.ADD
  %stack_len3134 = load i64, ptr %len.addr, align 8
  %2313 = sub i64 %stack_len3134, 1
  %sp3135 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2313
  %swap.a3136 = load i256, ptr %sp3135, align 16
  %2314 = sub i64 %stack_len3134, 2
  %sp3137 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2314
  %swap.b3138 = load i256, ptr %sp3137, align 16
  store i256 %swap.a3136, ptr %sp3137, align 16
  store i256 %swap.b3138, ptr %sp3135, align 16
  br label %OP881.DUP2, !annotation !5

OP881.DUP2:                                       ; preds = %OP880.SWAP1
  %stack_len3139 = load i64, ptr %len.addr, align 8
  %2315 = add i64 %stack_len3139, 1
  store i64 %2315, ptr %len.addr, align 8
  %2316 = sub i64 %stack_len3139, 2
  %sp3140 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2316
  %dup23141 = load i256, ptr %sp3140, align 16
  %sp3142 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3139
  store i256 %dup23141, ptr %sp3142, align 16
  br label %OP882.MSTORE, !annotation !5

OP882.MSTORE:                                     ; preds = %OP881.DUP2
  %stack_len3143 = load i64, ptr %len.addr, align 8
  %2317 = add i64 %stack_len3143, -2
  store i64 %2317, ptr %len.addr, align 8
  %2318 = add i64 %stack_len3143, -1
  %sp3144 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2318
  %a3145 = load i256, ptr %sp3144, align 16
  %2319 = add i64 %stack_len3143, -2
  %sp3146 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2319
  %b3147 = load i256, ptr %sp3146, align 16
  %2320 = call i8 @__revmc_ir_builtin_mstore(i256 %a3145, i256 %b3147, ptr %arg.ecx.addr)
  %2321 = icmp ne i8 %2320, 0
  br i1 %2321, label %return, label %OP882.MSTORE.contd, !prof !2

OP882.MSTORE.contd:                               ; preds = %OP882.MSTORE
  br label %OP883.PUSH1, !annotation !5

OP883.PUSH1:                                      ; preds = %OP882.MSTORE.contd
  %stack_len3148 = load i64, ptr %len.addr, align 8
  %2322 = add i64 %stack_len3148, 1
  store i64 %2322, ptr %len.addr, align 8
  %sp3149 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3148
  store i256 32, ptr %sp3149, align 16
  br label %OP884.ADD, !annotation !5

OP884.ADD:                                        ; preds = %OP883.PUSH1
  %stack_len3150 = load i64, ptr %len.addr, align 8
  %2323 = add i64 %stack_len3150, -1
  store i64 %2323, ptr %len.addr, align 8
  %2324 = add i64 %stack_len3150, -1
  %sp3151 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2324
  %a3152 = load i256, ptr %sp3151, align 16
  %2325 = add i64 %stack_len3150, -2
  %sp3153 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2325
  %b3154 = load i256, ptr %sp3153, align 16
  %2326 = add i256 %a3152, %b3154
  %2327 = add i64 %stack_len3150, -2
  %sp3155 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2327
  store i256 %2326, ptr %sp3155, align 16
  br label %OP885.PUSH1, !annotation !5

OP885.PUSH1:                                      ; preds = %OP884.ADD
  %stack_len3156 = load i64, ptr %len.addr, align 8
  %2328 = add i64 %stack_len3156, 1
  store i64 %2328, ptr %len.addr, align 8
  %sp3157 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3156
  store i256 0, ptr %sp3157, align 16
  br label %OP886.KECCAK256, !annotation !5

OP886.KECCAK256:                                  ; preds = %OP885.PUSH1
  %stack_len3158 = load i64, ptr %len.addr, align 8
  %2329 = add i64 %stack_len3158, -1
  store i64 %2329, ptr %len.addr, align 8
  %2330 = sub i64 %stack_len3158, 2
  %sp3159 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2330
  %2331 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3159)
  %2332 = icmp ne i8 %2331, 0
  br i1 %2332, label %return, label %OP886.KECCAK256.contd, !prof !2

OP886.KECCAK256.contd:                            ; preds = %OP886.KECCAK256
  br label %OP887.PUSH1, !annotation !5

OP887.PUSH1:                                      ; preds = %OP886.KECCAK256.contd
  %stack_len3160 = load i64, ptr %len.addr, align 8
  %2333 = add i64 %stack_len3160, 1
  store i64 %2333, ptr %len.addr, align 8
  %sp3161 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3160
  store i256 0, ptr %sp3161, align 16
  br label %OP888.DUP6, !annotation !5

OP888.DUP6:                                       ; preds = %OP887.PUSH1
  %stack_len3162 = load i64, ptr %len.addr, align 8
  %2334 = add i64 %stack_len3162, 1
  store i64 %2334, ptr %len.addr, align 8
  %2335 = sub i64 %stack_len3162, 6
  %sp3163 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2335
  %dup6 = load i256, ptr %sp3163, align 16
  %sp3164 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3162
  store i256 %dup6, ptr %sp3164, align 16
  br label %OP889.PUSH20, !annotation !5

OP889.PUSH20:                                     ; preds = %OP888.DUP6
  %stack_len3165 = load i64, ptr %len.addr, align 8
  %2336 = add i64 %stack_len3165, 1
  store i64 %2336, ptr %len.addr, align 8
  %sp3166 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3165
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3166, align 16
  br label %OP890.AND, !annotation !5

OP890.AND:                                        ; preds = %OP889.PUSH20
  %stack_len3167 = load i64, ptr %len.addr, align 8
  %2337 = add i64 %stack_len3167, -1
  store i64 %2337, ptr %len.addr, align 8
  %2338 = add i64 %stack_len3167, -1
  %sp3168 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2338
  %a3169 = load i256, ptr %sp3168, align 16
  %2339 = add i64 %stack_len3167, -2
  %sp3170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2339
  %b3171 = load i256, ptr %sp3170, align 16
  %2340 = and i256 %a3169, %b3171
  %2341 = add i64 %stack_len3167, -2
  %sp3172 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2341
  store i256 %2340, ptr %sp3172, align 16
  br label %OP891.PUSH20, !annotation !5

OP891.PUSH20:                                     ; preds = %OP890.AND
  %stack_len3173 = load i64, ptr %len.addr, align 8
  %2342 = add i64 %stack_len3173, 1
  store i64 %2342, ptr %len.addr, align 8
  %sp3174 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3173
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3174, align 16
  br label %OP892.AND, !annotation !5

OP892.AND:                                        ; preds = %OP891.PUSH20
  %stack_len3175 = load i64, ptr %len.addr, align 8
  %2343 = add i64 %stack_len3175, -1
  store i64 %2343, ptr %len.addr, align 8
  %2344 = add i64 %stack_len3175, -1
  %sp3176 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2344
  %a3177 = load i256, ptr %sp3176, align 16
  %2345 = add i64 %stack_len3175, -2
  %sp3178 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2345
  %b3179 = load i256, ptr %sp3178, align 16
  %2346 = and i256 %a3177, %b3179
  %2347 = add i64 %stack_len3175, -2
  %sp3180 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2347
  store i256 %2346, ptr %sp3180, align 16
  br label %OP893.DUP2, !annotation !5

OP893.DUP2:                                       ; preds = %OP892.AND
  %stack_len3181 = load i64, ptr %len.addr, align 8
  %2348 = add i64 %stack_len3181, 1
  store i64 %2348, ptr %len.addr, align 8
  %2349 = sub i64 %stack_len3181, 2
  %sp3182 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2349
  %dup23183 = load i256, ptr %sp3182, align 16
  %sp3184 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3181
  store i256 %dup23183, ptr %sp3184, align 16
  br label %OP894.MSTORE, !annotation !5

OP894.MSTORE:                                     ; preds = %OP893.DUP2
  %stack_len3185 = load i64, ptr %len.addr, align 8
  %2350 = add i64 %stack_len3185, -2
  store i64 %2350, ptr %len.addr, align 8
  %2351 = add i64 %stack_len3185, -1
  %sp3186 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2351
  %a3187 = load i256, ptr %sp3186, align 16
  %2352 = add i64 %stack_len3185, -2
  %sp3188 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2352
  %b3189 = load i256, ptr %sp3188, align 16
  %2353 = call i8 @__revmc_ir_builtin_mstore(i256 %a3187, i256 %b3189, ptr %arg.ecx.addr)
  %2354 = icmp ne i8 %2353, 0
  br i1 %2354, label %return, label %OP894.MSTORE.contd, !prof !2

OP894.MSTORE.contd:                               ; preds = %OP894.MSTORE
  br label %OP895.PUSH1, !annotation !5

OP895.PUSH1:                                      ; preds = %OP894.MSTORE.contd
  %stack_len3190 = load i64, ptr %len.addr, align 8
  %2355 = add i64 %stack_len3190, 1
  store i64 %2355, ptr %len.addr, align 8
  %sp3191 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3190
  store i256 32, ptr %sp3191, align 16
  br label %OP896.ADD, !annotation !5

OP896.ADD:                                        ; preds = %OP895.PUSH1
  %stack_len3192 = load i64, ptr %len.addr, align 8
  %2356 = add i64 %stack_len3192, -1
  store i64 %2356, ptr %len.addr, align 8
  %2357 = add i64 %stack_len3192, -1
  %sp3193 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2357
  %a3194 = load i256, ptr %sp3193, align 16
  %2358 = add i64 %stack_len3192, -2
  %sp3195 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2358
  %b3196 = load i256, ptr %sp3195, align 16
  %2359 = add i256 %a3194, %b3196
  %2360 = add i64 %stack_len3192, -2
  %sp3197 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2360
  store i256 %2359, ptr %sp3197, align 16
  br label %OP897.SWAP1, !annotation !5

OP897.SWAP1:                                      ; preds = %OP896.ADD
  %stack_len3198 = load i64, ptr %len.addr, align 8
  %2361 = sub i64 %stack_len3198, 1
  %sp3199 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2361
  %swap.a3200 = load i256, ptr %sp3199, align 16
  %2362 = sub i64 %stack_len3198, 2
  %sp3201 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2362
  %swap.b3202 = load i256, ptr %sp3201, align 16
  store i256 %swap.a3200, ptr %sp3201, align 16
  store i256 %swap.b3202, ptr %sp3199, align 16
  br label %OP898.DUP2, !annotation !5

OP898.DUP2:                                       ; preds = %OP897.SWAP1
  %stack_len3203 = load i64, ptr %len.addr, align 8
  %2363 = add i64 %stack_len3203, 1
  store i64 %2363, ptr %len.addr, align 8
  %2364 = sub i64 %stack_len3203, 2
  %sp3204 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2364
  %dup23205 = load i256, ptr %sp3204, align 16
  %sp3206 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3203
  store i256 %dup23205, ptr %sp3206, align 16
  br label %OP899.MSTORE, !annotation !5

OP899.MSTORE:                                     ; preds = %OP898.DUP2
  %stack_len3207 = load i64, ptr %len.addr, align 8
  %2365 = add i64 %stack_len3207, -2
  store i64 %2365, ptr %len.addr, align 8
  %2366 = add i64 %stack_len3207, -1
  %sp3208 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2366
  %a3209 = load i256, ptr %sp3208, align 16
  %2367 = add i64 %stack_len3207, -2
  %sp3210 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2367
  %b3211 = load i256, ptr %sp3210, align 16
  %2368 = call i8 @__revmc_ir_builtin_mstore(i256 %a3209, i256 %b3211, ptr %arg.ecx.addr)
  %2369 = icmp ne i8 %2368, 0
  br i1 %2369, label %return, label %OP899.MSTORE.contd, !prof !2

OP899.MSTORE.contd:                               ; preds = %OP899.MSTORE
  br label %OP900.PUSH1, !annotation !5

OP900.PUSH1:                                      ; preds = %OP899.MSTORE.contd
  %stack_len3212 = load i64, ptr %len.addr, align 8
  %2370 = add i64 %stack_len3212, 1
  store i64 %2370, ptr %len.addr, align 8
  %sp3213 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3212
  store i256 32, ptr %sp3213, align 16
  br label %OP901.ADD, !annotation !5

OP901.ADD:                                        ; preds = %OP900.PUSH1
  %stack_len3214 = load i64, ptr %len.addr, align 8
  %2371 = add i64 %stack_len3214, -1
  store i64 %2371, ptr %len.addr, align 8
  %2372 = add i64 %stack_len3214, -1
  %sp3215 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2372
  %a3216 = load i256, ptr %sp3215, align 16
  %2373 = add i64 %stack_len3214, -2
  %sp3217 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2373
  %b3218 = load i256, ptr %sp3217, align 16
  %2374 = add i256 %a3216, %b3218
  %2375 = add i64 %stack_len3214, -2
  %sp3219 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2375
  store i256 %2374, ptr %sp3219, align 16
  br label %OP902.PUSH1, !annotation !5

OP902.PUSH1:                                      ; preds = %OP901.ADD
  %stack_len3220 = load i64, ptr %len.addr, align 8
  %2376 = add i64 %stack_len3220, 1
  store i64 %2376, ptr %len.addr, align 8
  %sp3221 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3220
  store i256 0, ptr %sp3221, align 16
  br label %OP903.KECCAK256, !annotation !5

OP903.KECCAK256:                                  ; preds = %OP902.PUSH1
  %stack_len3222 = load i64, ptr %len.addr, align 8
  %2377 = add i64 %stack_len3222, -1
  store i64 %2377, ptr %len.addr, align 8
  %2378 = sub i64 %stack_len3222, 2
  %sp3223 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2378
  %2379 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3223)
  %2380 = icmp ne i8 %2379, 0
  br i1 %2380, label %return, label %OP903.KECCAK256.contd, !prof !2

OP903.KECCAK256.contd:                            ; preds = %OP903.KECCAK256
  br label %OP904.DUP2, !annotation !5

OP904.DUP2:                                       ; preds = %OP903.KECCAK256.contd
  %stack_len3224 = load i64, ptr %len.addr, align 8
  %2381 = add i64 %stack_len3224, 1
  store i64 %2381, ptr %len.addr, align 8
  %2382 = sub i64 %stack_len3224, 2
  %sp3225 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2382
  %dup23226 = load i256, ptr %sp3225, align 16
  %sp3227 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3224
  store i256 %dup23226, ptr %sp3227, align 16
  br label %OP905.SWAP1, !annotation !5

OP905.SWAP1:                                      ; preds = %OP904.DUP2
  %stack_len3228 = load i64, ptr %len.addr, align 8
  %2383 = sub i64 %stack_len3228, 1
  %sp3229 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2383
  %swap.a3230 = load i256, ptr %sp3229, align 16
  %2384 = sub i64 %stack_len3228, 2
  %sp3231 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2384
  %swap.b3232 = load i256, ptr %sp3231, align 16
  store i256 %swap.a3230, ptr %sp3231, align 16
  store i256 %swap.b3232, ptr %sp3229, align 16
  br label %OP906.SSTORE, !annotation !5

OP906.SSTORE:                                     ; preds = %OP905.SWAP1
  %stack_len3233 = load i64, ptr %len.addr, align 8
  %2385 = add i64 %stack_len3233, -2
  store i64 %2385, ptr %len.addr, align 8
  %2386 = sub i64 %stack_len3233, 2
  %sp3234 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2386
  %2387 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp3234, i8 19)
  %2388 = icmp ne i8 %2387, 0
  br i1 %2388, label %return, label %OP906.SSTORE.contd, !prof !2

OP906.SSTORE.contd:                               ; preds = %OP906.SSTORE
  br label %OP907.POP, !annotation !5

OP907.POP:                                        ; preds = %OP906.SSTORE.contd
  %gas.remaining3235 = load i64, ptr %gas.remaining.addr, align 8
  %2389 = sub i64 %gas.remaining3235, 1600
  %2390 = icmp ult i64 %gas.remaining3235, 1600
  store i64 %2389, ptr %gas.remaining.addr, align 8
  br i1 %2390, label %return, label %OP907.POP.contd, !prof !2, !annotation !3

OP907.POP.contd:                                  ; preds = %OP907.POP
  %stack_len3236 = load i64, ptr %len.addr, align 8
  %2391 = icmp ult i64 %stack_len3236, 5
  %2392 = icmp ugt i64 %stack_len3236, 1017
  %2393 = or i1 %2391, %2392
  %2394 = select i1 %2391, i8 91, i8 92
  br i1 %2393, label %return, label %OP907.POP.contd3237, !prof !2

OP907.POP.contd3237:                              ; preds = %OP907.POP.contd
  %2395 = add i64 %stack_len3236, -1
  store i64 %2395, ptr %len.addr, align 8
  br label %OP908.DUP3, !annotation !5

OP908.DUP3:                                       ; preds = %OP907.POP.contd3237
  %stack_len3238 = load i64, ptr %len.addr, align 8
  %2396 = add i64 %stack_len3238, 1
  store i64 %2396, ptr %len.addr, align 8
  %2397 = sub i64 %stack_len3238, 3
  %sp3239 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2397
  %dup33240 = load i256, ptr %sp3239, align 16
  %sp3241 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3238
  store i256 %dup33240, ptr %sp3241, align 16
  br label %OP909.PUSH20, !annotation !5

OP909.PUSH20:                                     ; preds = %OP908.DUP3
  %stack_len3242 = load i64, ptr %len.addr, align 8
  %2398 = add i64 %stack_len3242, 1
  store i64 %2398, ptr %len.addr, align 8
  %sp3243 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3242
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3243, align 16
  br label %OP910.AND, !annotation !5

OP910.AND:                                        ; preds = %OP909.PUSH20
  %stack_len3244 = load i64, ptr %len.addr, align 8
  %2399 = add i64 %stack_len3244, -1
  store i64 %2399, ptr %len.addr, align 8
  %2400 = add i64 %stack_len3244, -1
  %sp3245 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2400
  %a3246 = load i256, ptr %sp3245, align 16
  %2401 = add i64 %stack_len3244, -2
  %sp3247 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2401
  %b3248 = load i256, ptr %sp3247, align 16
  %2402 = and i256 %a3246, %b3248
  %2403 = add i64 %stack_len3244, -2
  %sp3249 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2403
  store i256 %2402, ptr %sp3249, align 16
  br label %OP911.CALLER, !annotation !5

OP911.CALLER:                                     ; preds = %OP910.AND
  %stack_len3250 = load i64, ptr %len.addr, align 8
  %2404 = add i64 %stack_len3250, 1
  store i64 %2404, ptr %len.addr, align 8
  %contract.caller.addr3251 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3252 = load i160, ptr %contract.caller.addr3251, align 16
  %2405 = call i160 @llvm.bswap.i160(i160 %contract.caller3252)
  %2406 = zext i160 %2405 to i256
  %sp3253 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3250
  store i256 %2406, ptr %sp3253, align 16
  br label %OP912.PUSH20, !annotation !5

OP912.PUSH20:                                     ; preds = %OP911.CALLER
  %stack_len3254 = load i64, ptr %len.addr, align 8
  %2407 = add i64 %stack_len3254, 1
  store i64 %2407, ptr %len.addr, align 8
  %sp3255 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3254
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3255, align 16
  br label %OP913.AND, !annotation !5

OP913.AND:                                        ; preds = %OP912.PUSH20
  %stack_len3256 = load i64, ptr %len.addr, align 8
  %2408 = add i64 %stack_len3256, -1
  store i64 %2408, ptr %len.addr, align 8
  %2409 = add i64 %stack_len3256, -1
  %sp3257 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2409
  %a3258 = load i256, ptr %sp3257, align 16
  %2410 = add i64 %stack_len3256, -2
  %sp3259 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2410
  %b3260 = load i256, ptr %sp3259, align 16
  %2411 = and i256 %a3258, %b3260
  %2412 = add i64 %stack_len3256, -2
  %sp3261 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2412
  store i256 %2411, ptr %sp3261, align 16
  br label %OP914.PUSH32, !annotation !5

OP914.PUSH32:                                     ; preds = %OP913.AND
  %stack_len3262 = load i64, ptr %len.addr, align 8
  %2413 = add i64 %stack_len3262, 1
  store i64 %2413, ptr %len.addr, align 8
  %sp3263 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3262
  store i256 -52305948261162578668367882225327028569797882979485679342215860919519743330011, ptr %sp3263, align 16
  br label %OP915.DUP5, !annotation !5

OP915.DUP5:                                       ; preds = %OP914.PUSH32
  %stack_len3264 = load i64, ptr %len.addr, align 8
  %2414 = add i64 %stack_len3264, 1
  store i64 %2414, ptr %len.addr, align 8
  %2415 = sub i64 %stack_len3264, 5
  %sp3265 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2415
  %dup53266 = load i256, ptr %sp3265, align 16
  %sp3267 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3264
  store i256 %dup53266, ptr %sp3267, align 16
  br label %OP916.PUSH1, !annotation !5

OP916.PUSH1:                                      ; preds = %OP915.DUP5
  %stack_len3268 = load i64, ptr %len.addr, align 8
  %2416 = add i64 %stack_len3268, 1
  store i64 %2416, ptr %len.addr, align 8
  %sp3269 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3268
  store i256 64, ptr %sp3269, align 16
  br label %OP917.MLOAD, !annotation !5

OP917.MLOAD:                                      ; preds = %OP916.PUSH1
  %stack_len3270 = load i64, ptr %len.addr, align 8
  %2417 = add i64 %stack_len3270, -1
  %sp3271 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2417
  %a3272 = load i256, ptr %sp3271, align 16
  %mload.out.slot3273 = alloca i256, align 16
  %2418 = call i8 @__revmc_ir_builtin_mload(i256 %a3272, ptr %mload.out.slot3273, ptr %arg.ecx.addr)
  %2419 = icmp ne i8 %2418, 0
  br i1 %2419, label %return, label %OP917.MLOAD.contd, !prof !2

OP917.MLOAD.contd:                                ; preds = %OP917.MLOAD
  %mload.out3274 = load i256, ptr %mload.out.slot3273, align 16
  %2420 = add i64 %stack_len3270, -1
  %sp3275 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2420
  store i256 %mload.out3274, ptr %sp3275, align 16
  br label %OP918.DUP1, !annotation !5

OP918.DUP1:                                       ; preds = %OP917.MLOAD.contd
  %stack_len3276 = load i64, ptr %len.addr, align 8
  %2421 = add i64 %stack_len3276, 1
  store i64 %2421, ptr %len.addr, align 8
  %2422 = sub i64 %stack_len3276, 1
  %sp3277 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2422
  %dup13278 = load i256, ptr %sp3277, align 16
  %sp3279 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3276
  store i256 %dup13278, ptr %sp3279, align 16
  br label %OP919.DUP3, !annotation !5

OP919.DUP3:                                       ; preds = %OP918.DUP1
  %stack_len3280 = load i64, ptr %len.addr, align 8
  %2423 = add i64 %stack_len3280, 1
  store i64 %2423, ptr %len.addr, align 8
  %2424 = sub i64 %stack_len3280, 3
  %sp3281 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2424
  %dup33282 = load i256, ptr %sp3281, align 16
  %sp3283 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3280
  store i256 %dup33282, ptr %sp3283, align 16
  br label %OP920.DUP2, !annotation !5

OP920.DUP2:                                       ; preds = %OP919.DUP3
  %stack_len3284 = load i64, ptr %len.addr, align 8
  %2425 = add i64 %stack_len3284, 1
  store i64 %2425, ptr %len.addr, align 8
  %2426 = sub i64 %stack_len3284, 2
  %sp3285 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2426
  %dup23286 = load i256, ptr %sp3285, align 16
  %sp3287 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3284
  store i256 %dup23286, ptr %sp3287, align 16
  br label %OP921.MSTORE, !annotation !5

OP921.MSTORE:                                     ; preds = %OP920.DUP2
  %stack_len3288 = load i64, ptr %len.addr, align 8
  %2427 = add i64 %stack_len3288, -2
  store i64 %2427, ptr %len.addr, align 8
  %2428 = add i64 %stack_len3288, -1
  %sp3289 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2428
  %a3290 = load i256, ptr %sp3289, align 16
  %2429 = add i64 %stack_len3288, -2
  %sp3291 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2429
  %b3292 = load i256, ptr %sp3291, align 16
  %2430 = call i8 @__revmc_ir_builtin_mstore(i256 %a3290, i256 %b3292, ptr %arg.ecx.addr)
  %2431 = icmp ne i8 %2430, 0
  br i1 %2431, label %return, label %OP921.MSTORE.contd, !prof !2

OP921.MSTORE.contd:                               ; preds = %OP921.MSTORE
  br label %OP922.PUSH1, !annotation !5

OP922.PUSH1:                                      ; preds = %OP921.MSTORE.contd
  %stack_len3293 = load i64, ptr %len.addr, align 8
  %2432 = add i64 %stack_len3293, 1
  store i64 %2432, ptr %len.addr, align 8
  %sp3294 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3293
  store i256 32, ptr %sp3294, align 16
  br label %OP923.ADD, !annotation !5

OP923.ADD:                                        ; preds = %OP922.PUSH1
  %stack_len3295 = load i64, ptr %len.addr, align 8
  %2433 = add i64 %stack_len3295, -1
  store i64 %2433, ptr %len.addr, align 8
  %2434 = add i64 %stack_len3295, -1
  %sp3296 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2434
  %a3297 = load i256, ptr %sp3296, align 16
  %2435 = add i64 %stack_len3295, -2
  %sp3298 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2435
  %b3299 = load i256, ptr %sp3298, align 16
  %2436 = add i256 %a3297, %b3299
  %2437 = add i64 %stack_len3295, -2
  %sp3300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2437
  store i256 %2436, ptr %sp3300, align 16
  br label %OP924.SWAP2, !annotation !5

OP924.SWAP2:                                      ; preds = %OP923.ADD
  %stack_len3301 = load i64, ptr %len.addr, align 8
  %2438 = sub i64 %stack_len3301, 1
  %sp3302 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2438
  %swap.a3303 = load i256, ptr %sp3302, align 16
  %2439 = sub i64 %stack_len3301, 3
  %sp3304 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2439
  %swap.b3305 = load i256, ptr %sp3304, align 16
  store i256 %swap.a3303, ptr %sp3304, align 16
  store i256 %swap.b3305, ptr %sp3302, align 16
  br label %OP925.POP, !annotation !5

OP925.POP:                                        ; preds = %OP924.SWAP2
  %stack_len3306 = load i64, ptr %len.addr, align 8
  %2440 = add i64 %stack_len3306, -1
  store i64 %2440, ptr %len.addr, align 8
  br label %OP926.POP, !annotation !5

OP926.POP:                                        ; preds = %OP925.POP
  %stack_len3307 = load i64, ptr %len.addr, align 8
  %2441 = add i64 %stack_len3307, -1
  store i64 %2441, ptr %len.addr, align 8
  br label %OP927.PUSH1, !annotation !5

OP927.PUSH1:                                      ; preds = %OP926.POP
  %stack_len3308 = load i64, ptr %len.addr, align 8
  %2442 = add i64 %stack_len3308, 1
  store i64 %2442, ptr %len.addr, align 8
  %sp3309 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3308
  store i256 64, ptr %sp3309, align 16
  br label %OP928.MLOAD, !annotation !5

OP928.MLOAD:                                      ; preds = %OP927.PUSH1
  %stack_len3310 = load i64, ptr %len.addr, align 8
  %2443 = add i64 %stack_len3310, -1
  %sp3311 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2443
  %a3312 = load i256, ptr %sp3311, align 16
  %mload.out.slot3313 = alloca i256, align 16
  %2444 = call i8 @__revmc_ir_builtin_mload(i256 %a3312, ptr %mload.out.slot3313, ptr %arg.ecx.addr)
  %2445 = icmp ne i8 %2444, 0
  br i1 %2445, label %return, label %OP928.MLOAD.contd, !prof !2

OP928.MLOAD.contd:                                ; preds = %OP928.MLOAD
  %mload.out3314 = load i256, ptr %mload.out.slot3313, align 16
  %2446 = add i64 %stack_len3310, -1
  %sp3315 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2446
  store i256 %mload.out3314, ptr %sp3315, align 16
  br label %OP929.DUP1, !annotation !5

OP929.DUP1:                                       ; preds = %OP928.MLOAD.contd
  %stack_len3316 = load i64, ptr %len.addr, align 8
  %2447 = add i64 %stack_len3316, 1
  store i64 %2447, ptr %len.addr, align 8
  %2448 = sub i64 %stack_len3316, 1
  %sp3317 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2448
  %dup13318 = load i256, ptr %sp3317, align 16
  %sp3319 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3316
  store i256 %dup13318, ptr %sp3319, align 16
  br label %OP930.SWAP2, !annotation !5

OP930.SWAP2:                                      ; preds = %OP929.DUP1
  %stack_len3320 = load i64, ptr %len.addr, align 8
  %2449 = sub i64 %stack_len3320, 1
  %sp3321 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2449
  %swap.a3322 = load i256, ptr %sp3321, align 16
  %2450 = sub i64 %stack_len3320, 3
  %sp3323 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2450
  %swap.b3324 = load i256, ptr %sp3323, align 16
  store i256 %swap.a3322, ptr %sp3323, align 16
  store i256 %swap.b3324, ptr %sp3321, align 16
  br label %OP931.SUB, !annotation !5

OP931.SUB:                                        ; preds = %OP930.SWAP2
  %stack_len3325 = load i64, ptr %len.addr, align 8
  %2451 = add i64 %stack_len3325, -1
  store i64 %2451, ptr %len.addr, align 8
  %2452 = add i64 %stack_len3325, -1
  %sp3326 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2452
  %a3327 = load i256, ptr %sp3326, align 16
  %2453 = add i64 %stack_len3325, -2
  %sp3328 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2453
  %b3329 = load i256, ptr %sp3328, align 16
  %2454 = sub i256 %a3327, %b3329
  %2455 = add i64 %stack_len3325, -2
  %sp3330 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2455
  store i256 %2454, ptr %sp3330, align 16
  br label %OP932.SWAP1, !annotation !5

OP932.SWAP1:                                      ; preds = %OP931.SUB
  %stack_len3331 = load i64, ptr %len.addr, align 8
  %2456 = sub i64 %stack_len3331, 1
  %sp3332 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2456
  %swap.a3333 = load i256, ptr %sp3332, align 16
  %2457 = sub i64 %stack_len3331, 2
  %sp3334 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2457
  %swap.b3335 = load i256, ptr %sp3334, align 16
  store i256 %swap.a3333, ptr %sp3334, align 16
  store i256 %swap.b3335, ptr %sp3332, align 16
  br label %OP933.LOG3, !annotation !5

OP933.LOG3:                                       ; preds = %OP932.SWAP1
  %stack_len3336 = load i64, ptr %len.addr, align 8
  %2458 = add i64 %stack_len3336, -5
  store i64 %2458, ptr %len.addr, align 8
  %2459 = sub i64 %stack_len3336, 5
  %sp3337 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2459
  %2460 = call i8 @__revmc_builtin_log(ptr %arg.ecx.addr, ptr %sp3337, i8 3)
  %2461 = icmp ne i8 %2460, 0
  br i1 %2461, label %return, label %OP933.LOG3.contd, !prof !2

OP933.LOG3.contd:                                 ; preds = %OP933.LOG3
  br label %OP934.PUSH1, !annotation !5

OP934.PUSH1:                                      ; preds = %OP933.LOG3.contd
  %stack_len3338 = load i64, ptr %len.addr, align 8
  %2462 = add i64 %stack_len3338, 1
  store i64 %2462, ptr %len.addr, align 8
  %sp3339 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3338
  store i256 1, ptr %sp3339, align 16
  br label %OP935.SWAP1, !annotation !5

OP935.SWAP1:                                      ; preds = %OP934.PUSH1
  %stack_len3340 = load i64, ptr %len.addr, align 8
  %2463 = sub i64 %stack_len3340, 1
  %sp3341 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2463
  %swap.a3342 = load i256, ptr %sp3341, align 16
  %2464 = sub i64 %stack_len3340, 2
  %sp3343 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2464
  %swap.b3344 = load i256, ptr %sp3343, align 16
  store i256 %swap.a3342, ptr %sp3343, align 16
  store i256 %swap.b3344, ptr %sp3341, align 16
  br label %OP936.POP, !annotation !5

OP936.POP:                                        ; preds = %OP935.SWAP1
  %stack_len3345 = load i64, ptr %len.addr, align 8
  %2465 = add i64 %stack_len3345, -1
  store i64 %2465, ptr %len.addr, align 8
  br label %OP937.SWAP3, !annotation !5

OP937.SWAP3:                                      ; preds = %OP936.POP
  %stack_len3346 = load i64, ptr %len.addr, align 8
  %2466 = sub i64 %stack_len3346, 1
  %sp3347 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2466
  %swap.a3348 = load i256, ptr %sp3347, align 16
  %2467 = sub i64 %stack_len3346, 4
  %sp3349 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2467
  %swap.b3350 = load i256, ptr %sp3349, align 16
  store i256 %swap.a3348, ptr %sp3349, align 16
  store i256 %swap.b3350, ptr %sp3347, align 16
  br label %OP938.SWAP2, !annotation !5

OP938.SWAP2:                                      ; preds = %OP937.SWAP3
  %stack_len3351 = load i64, ptr %len.addr, align 8
  %2468 = sub i64 %stack_len3351, 1
  %sp3352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2468
  %swap.a3353 = load i256, ptr %sp3352, align 16
  %2469 = sub i64 %stack_len3351, 3
  %sp3354 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2469
  %swap.b3355 = load i256, ptr %sp3354, align 16
  store i256 %swap.a3353, ptr %sp3354, align 16
  store i256 %swap.b3355, ptr %sp3352, align 16
  br label %OP939.POP, !annotation !5

OP939.POP:                                        ; preds = %OP938.SWAP2
  %stack_len3356 = load i64, ptr %len.addr, align 8
  %2470 = add i64 %stack_len3356, -1
  store i64 %2470, ptr %len.addr, align 8
  br label %OP940.POP, !annotation !5

OP940.POP:                                        ; preds = %OP939.POP
  %stack_len3357 = load i64, ptr %len.addr, align 8
  %2471 = add i64 %stack_len3357, -1
  store i64 %2471, ptr %len.addr, align 8
  br label %OP941.JUMP, !annotation !5

OP941.JUMP:                                       ; preds = %OP940.POP
  %stack_len3358 = load i64, ptr %len.addr, align 8
  %2472 = add i64 %stack_len3358, -1
  store i64 %2472, ptr %len.addr, align 8
  %2473 = add i64 %stack_len3358, -1
  %sp3359 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2473
  %a3360 = load i256, ptr %sp3359, align 16
  br label %dynamic_jump_table

OP942.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP260.JUMP
  %gas.remaining3361 = load i64, ptr %gas.remaining.addr, align 8
  %2474 = sub i64 %gas.remaining3361, 28
  %2475 = icmp ult i64 %gas.remaining3361, 28
  store i64 %2474, ptr %gas.remaining.addr, align 8
  br i1 %2475, label %return, label %OP942.JUMPDEST.contd, !prof !2, !annotation !3

OP942.JUMPDEST.contd:                             ; preds = %OP942.JUMPDEST
  %stack_len3362 = load i64, ptr %len.addr, align 8
  %2476 = icmp ult i64 %stack_len3362, 1
  %2477 = icmp ugt i64 %stack_len3362, 1021
  %2478 = or i1 %2476, %2477
  %2479 = select i1 %2476, i8 91, i8 92
  br i1 %2478, label %return, label %OP942.JUMPDEST.contd3363, !prof !2

OP942.JUMPDEST.contd3363:                         ; preds = %OP942.JUMPDEST.contd
  br label %OP943.PUSH1, !annotation !5

OP943.PUSH1:                                      ; preds = %OP942.JUMPDEST.contd3363
  %stack_len3364 = load i64, ptr %len.addr, align 8
  %2480 = add i64 %stack_len3364, 1
  store i64 %2480, ptr %len.addr, align 8
  %sp3365 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3364
  store i256 0, ptr %sp3365, align 16
  br label %OP944.ADDRESS, !annotation !5

OP944.ADDRESS:                                    ; preds = %OP943.PUSH1
  %stack_len3366 = load i64, ptr %len.addr, align 8
  %2481 = add i64 %stack_len3366, 1
  store i64 %2481, ptr %len.addr, align 8
  %contract.target_address.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 128
  %contract.target_address = load i160, ptr %contract.target_address.addr, align 16
  %2482 = call i160 @llvm.bswap.i160(i160 %contract.target_address)
  %2483 = zext i160 %2482 to i256
  %sp3367 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3366
  store i256 %2483, ptr %sp3367, align 16
  br label %OP945.PUSH20, !annotation !5

OP945.PUSH20:                                     ; preds = %OP944.ADDRESS
  %stack_len3368 = load i64, ptr %len.addr, align 8
  %2484 = add i64 %stack_len3368, 1
  store i64 %2484, ptr %len.addr, align 8
  %sp3369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3368
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3369, align 16
  br label %OP946.AND, !annotation !5

OP946.AND:                                        ; preds = %OP945.PUSH20
  %stack_len3370 = load i64, ptr %len.addr, align 8
  %2485 = add i64 %stack_len3370, -1
  store i64 %2485, ptr %len.addr, align 8
  %2486 = add i64 %stack_len3370, -1
  %sp3371 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2486
  %a3372 = load i256, ptr %sp3371, align 16
  %2487 = add i64 %stack_len3370, -2
  %sp3373 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2487
  %b3374 = load i256, ptr %sp3373, align 16
  %2488 = and i256 %a3372, %b3374
  %2489 = add i64 %stack_len3370, -2
  %sp3375 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2489
  store i256 %2488, ptr %sp3375, align 16
  br label %OP947.BALANCE, !annotation !5

OP947.BALANCE:                                    ; preds = %OP946.AND
  %stack_len3376 = load i64, ptr %len.addr, align 8
  %2490 = sub i64 %stack_len3376, 1
  %sp3377 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2490
  %2491 = call i8 @__revmc_builtin_balance(ptr %arg.ecx.addr, ptr %sp3377, i8 19)
  %2492 = icmp ne i8 %2491, 0
  br i1 %2492, label %return, label %OP947.BALANCE.contd, !prof !2

OP947.BALANCE.contd:                              ; preds = %OP947.BALANCE
  br label %OP948.SWAP1, !annotation !5

OP948.SWAP1:                                      ; preds = %OP947.BALANCE.contd
  %stack_len3378 = load i64, ptr %len.addr, align 8
  %2493 = sub i64 %stack_len3378, 1
  %sp3379 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2493
  %swap.a3380 = load i256, ptr %sp3379, align 16
  %2494 = sub i64 %stack_len3378, 2
  %sp3381 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2494
  %swap.b3382 = load i256, ptr %sp3381, align 16
  store i256 %swap.a3380, ptr %sp3381, align 16
  store i256 %swap.b3382, ptr %sp3379, align 16
  br label %OP949.POP, !annotation !5

OP949.POP:                                        ; preds = %OP948.SWAP1
  %stack_len3383 = load i64, ptr %len.addr, align 8
  %2495 = add i64 %stack_len3383, -1
  store i64 %2495, ptr %len.addr, align 8
  br label %OP950.SWAP1, !annotation !5

OP950.SWAP1:                                      ; preds = %OP949.POP
  %stack_len3384 = load i64, ptr %len.addr, align 8
  %2496 = sub i64 %stack_len3384, 1
  %sp3385 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2496
  %swap.a3386 = load i256, ptr %sp3385, align 16
  %2497 = sub i64 %stack_len3384, 2
  %sp3387 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2497
  %swap.b3388 = load i256, ptr %sp3387, align 16
  store i256 %swap.a3386, ptr %sp3387, align 16
  store i256 %swap.b3388, ptr %sp3385, align 16
  br label %OP951.JUMP, !annotation !5

OP951.JUMP:                                       ; preds = %OP950.SWAP1
  %stack_len3389 = load i64, ptr %len.addr, align 8
  %2498 = add i64 %stack_len3389, -1
  store i64 %2498, ptr %len.addr, align 8
  %2499 = add i64 %stack_len3389, -1
  %sp3390 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2499
  %a3391 = load i256, ptr %sp3390, align 16
  br label %dynamic_jump_table

OP952.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP1518.JUMP, %OP323.JUMP
  %gas.remaining3392 = load i64, ptr %gas.remaining.addr, align 8
  %2500 = sub i64 %gas.remaining3392, 113
  %2501 = icmp ult i64 %gas.remaining3392, 113
  store i64 %2500, ptr %gas.remaining.addr, align 8
  br i1 %2501, label %return, label %OP952.JUMPDEST.contd, !prof !2, !annotation !3

OP952.JUMPDEST.contd:                             ; preds = %OP952.JUMPDEST
  %stack_len3393 = load i64, ptr %len.addr, align 8
  %2502 = icmp ult i64 %stack_len3393, 3
  %2503 = icmp ugt i64 %stack_len3393, 1018
  %2504 = or i1 %2502, %2503
  %2505 = select i1 %2502, i8 91, i8 92
  br i1 %2504, label %return, label %OP952.JUMPDEST.contd3394, !prof !2

OP952.JUMPDEST.contd3394:                         ; preds = %OP952.JUMPDEST.contd
  br label %OP953.PUSH1, !annotation !5

OP953.PUSH1:                                      ; preds = %OP952.JUMPDEST.contd3394
  %stack_len3395 = load i64, ptr %len.addr, align 8
  %2506 = add i64 %stack_len3395, 1
  store i64 %2506, ptr %len.addr, align 8
  %sp3396 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3395
  store i256 0, ptr %sp3396, align 16
  br label %OP954.DUP2, !annotation !5

OP954.DUP2:                                       ; preds = %OP953.PUSH1
  %stack_len3397 = load i64, ptr %len.addr, align 8
  %2507 = add i64 %stack_len3397, 1
  store i64 %2507, ptr %len.addr, align 8
  %2508 = sub i64 %stack_len3397, 2
  %sp3398 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2508
  %dup23399 = load i256, ptr %sp3398, align 16
  %sp3400 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3397
  store i256 %dup23399, ptr %sp3400, align 16
  br label %OP955.PUSH1, !annotation !5

OP955.PUSH1:                                      ; preds = %OP954.DUP2
  %stack_len3401 = load i64, ptr %len.addr, align 8
  %2509 = add i64 %stack_len3401, 1
  store i64 %2509, ptr %len.addr, align 8
  %sp3402 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3401
  store i256 3, ptr %sp3402, align 16
  br label %OP956.PUSH1, !annotation !5

OP956.PUSH1:                                      ; preds = %OP955.PUSH1
  %stack_len3403 = load i64, ptr %len.addr, align 8
  %2510 = add i64 %stack_len3403, 1
  store i64 %2510, ptr %len.addr, align 8
  %sp3404 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3403
  store i256 0, ptr %sp3404, align 16
  br label %OP957.DUP7, !annotation !5

OP957.DUP7:                                       ; preds = %OP956.PUSH1
  %stack_len3405 = load i64, ptr %len.addr, align 8
  %2511 = add i64 %stack_len3405, 1
  store i64 %2511, ptr %len.addr, align 8
  %2512 = sub i64 %stack_len3405, 7
  %sp3406 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2512
  %dup7 = load i256, ptr %sp3406, align 16
  %sp3407 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3405
  store i256 %dup7, ptr %sp3407, align 16
  br label %OP958.PUSH20, !annotation !5

OP958.PUSH20:                                     ; preds = %OP957.DUP7
  %stack_len3408 = load i64, ptr %len.addr, align 8
  %2513 = add i64 %stack_len3408, 1
  store i64 %2513, ptr %len.addr, align 8
  %sp3409 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3408
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3409, align 16
  br label %OP959.AND, !annotation !5

OP959.AND:                                        ; preds = %OP958.PUSH20
  %stack_len3410 = load i64, ptr %len.addr, align 8
  %2514 = add i64 %stack_len3410, -1
  store i64 %2514, ptr %len.addr, align 8
  %2515 = add i64 %stack_len3410, -1
  %sp3411 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2515
  %a3412 = load i256, ptr %sp3411, align 16
  %2516 = add i64 %stack_len3410, -2
  %sp3413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2516
  %b3414 = load i256, ptr %sp3413, align 16
  %2517 = and i256 %a3412, %b3414
  %2518 = add i64 %stack_len3410, -2
  %sp3415 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2518
  store i256 %2517, ptr %sp3415, align 16
  br label %OP960.PUSH20, !annotation !5

OP960.PUSH20:                                     ; preds = %OP959.AND
  %stack_len3416 = load i64, ptr %len.addr, align 8
  %2519 = add i64 %stack_len3416, 1
  store i64 %2519, ptr %len.addr, align 8
  %sp3417 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3416
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3417, align 16
  br label %OP961.AND, !annotation !5

OP961.AND:                                        ; preds = %OP960.PUSH20
  %stack_len3418 = load i64, ptr %len.addr, align 8
  %2520 = add i64 %stack_len3418, -1
  store i64 %2520, ptr %len.addr, align 8
  %2521 = add i64 %stack_len3418, -1
  %sp3419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2521
  %a3420 = load i256, ptr %sp3419, align 16
  %2522 = add i64 %stack_len3418, -2
  %sp3421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2522
  %b3422 = load i256, ptr %sp3421, align 16
  %2523 = and i256 %a3420, %b3422
  %2524 = add i64 %stack_len3418, -2
  %sp3423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2524
  store i256 %2523, ptr %sp3423, align 16
  br label %OP962.DUP2, !annotation !5

OP962.DUP2:                                       ; preds = %OP961.AND
  %stack_len3424 = load i64, ptr %len.addr, align 8
  %2525 = add i64 %stack_len3424, 1
  store i64 %2525, ptr %len.addr, align 8
  %2526 = sub i64 %stack_len3424, 2
  %sp3425 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2526
  %dup23426 = load i256, ptr %sp3425, align 16
  %sp3427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3424
  store i256 %dup23426, ptr %sp3427, align 16
  br label %OP963.MSTORE, !annotation !5

OP963.MSTORE:                                     ; preds = %OP962.DUP2
  %stack_len3428 = load i64, ptr %len.addr, align 8
  %2527 = add i64 %stack_len3428, -2
  store i64 %2527, ptr %len.addr, align 8
  %2528 = add i64 %stack_len3428, -1
  %sp3429 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2528
  %a3430 = load i256, ptr %sp3429, align 16
  %2529 = add i64 %stack_len3428, -2
  %sp3431 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2529
  %b3432 = load i256, ptr %sp3431, align 16
  %2530 = call i8 @__revmc_ir_builtin_mstore(i256 %a3430, i256 %b3432, ptr %arg.ecx.addr)
  %2531 = icmp ne i8 %2530, 0
  br i1 %2531, label %return, label %OP963.MSTORE.contd, !prof !2

OP963.MSTORE.contd:                               ; preds = %OP963.MSTORE
  br label %OP964.PUSH1, !annotation !5

OP964.PUSH1:                                      ; preds = %OP963.MSTORE.contd
  %stack_len3433 = load i64, ptr %len.addr, align 8
  %2532 = add i64 %stack_len3433, 1
  store i64 %2532, ptr %len.addr, align 8
  %sp3434 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3433
  store i256 32, ptr %sp3434, align 16
  br label %OP965.ADD, !annotation !5

OP965.ADD:                                        ; preds = %OP964.PUSH1
  %stack_len3435 = load i64, ptr %len.addr, align 8
  %2533 = add i64 %stack_len3435, -1
  store i64 %2533, ptr %len.addr, align 8
  %2534 = add i64 %stack_len3435, -1
  %sp3436 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2534
  %a3437 = load i256, ptr %sp3436, align 16
  %2535 = add i64 %stack_len3435, -2
  %sp3438 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2535
  %b3439 = load i256, ptr %sp3438, align 16
  %2536 = add i256 %a3437, %b3439
  %2537 = add i64 %stack_len3435, -2
  %sp3440 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2537
  store i256 %2536, ptr %sp3440, align 16
  br label %OP966.SWAP1, !annotation !5

OP966.SWAP1:                                      ; preds = %OP965.ADD
  %stack_len3441 = load i64, ptr %len.addr, align 8
  %2538 = sub i64 %stack_len3441, 1
  %sp3442 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2538
  %swap.a3443 = load i256, ptr %sp3442, align 16
  %2539 = sub i64 %stack_len3441, 2
  %sp3444 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2539
  %swap.b3445 = load i256, ptr %sp3444, align 16
  store i256 %swap.a3443, ptr %sp3444, align 16
  store i256 %swap.b3445, ptr %sp3442, align 16
  br label %OP967.DUP2, !annotation !5

OP967.DUP2:                                       ; preds = %OP966.SWAP1
  %stack_len3446 = load i64, ptr %len.addr, align 8
  %2540 = add i64 %stack_len3446, 1
  store i64 %2540, ptr %len.addr, align 8
  %2541 = sub i64 %stack_len3446, 2
  %sp3447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2541
  %dup23448 = load i256, ptr %sp3447, align 16
  %sp3449 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3446
  store i256 %dup23448, ptr %sp3449, align 16
  br label %OP968.MSTORE, !annotation !5

OP968.MSTORE:                                     ; preds = %OP967.DUP2
  %stack_len3450 = load i64, ptr %len.addr, align 8
  %2542 = add i64 %stack_len3450, -2
  store i64 %2542, ptr %len.addr, align 8
  %2543 = add i64 %stack_len3450, -1
  %sp3451 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2543
  %a3452 = load i256, ptr %sp3451, align 16
  %2544 = add i64 %stack_len3450, -2
  %sp3453 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2544
  %b3454 = load i256, ptr %sp3453, align 16
  %2545 = call i8 @__revmc_ir_builtin_mstore(i256 %a3452, i256 %b3454, ptr %arg.ecx.addr)
  %2546 = icmp ne i8 %2545, 0
  br i1 %2546, label %return, label %OP968.MSTORE.contd, !prof !2

OP968.MSTORE.contd:                               ; preds = %OP968.MSTORE
  br label %OP969.PUSH1, !annotation !5

OP969.PUSH1:                                      ; preds = %OP968.MSTORE.contd
  %stack_len3455 = load i64, ptr %len.addr, align 8
  %2547 = add i64 %stack_len3455, 1
  store i64 %2547, ptr %len.addr, align 8
  %sp3456 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3455
  store i256 32, ptr %sp3456, align 16
  br label %OP970.ADD, !annotation !5

OP970.ADD:                                        ; preds = %OP969.PUSH1
  %stack_len3457 = load i64, ptr %len.addr, align 8
  %2548 = add i64 %stack_len3457, -1
  store i64 %2548, ptr %len.addr, align 8
  %2549 = add i64 %stack_len3457, -1
  %sp3458 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2549
  %a3459 = load i256, ptr %sp3458, align 16
  %2550 = add i64 %stack_len3457, -2
  %sp3460 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2550
  %b3461 = load i256, ptr %sp3460, align 16
  %2551 = add i256 %a3459, %b3461
  %2552 = add i64 %stack_len3457, -2
  %sp3462 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2552
  store i256 %2551, ptr %sp3462, align 16
  br label %OP971.PUSH1, !annotation !5

OP971.PUSH1:                                      ; preds = %OP970.ADD
  %stack_len3463 = load i64, ptr %len.addr, align 8
  %2553 = add i64 %stack_len3463, 1
  store i64 %2553, ptr %len.addr, align 8
  %sp3464 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3463
  store i256 0, ptr %sp3464, align 16
  br label %OP972.KECCAK256, !annotation !5

OP972.KECCAK256:                                  ; preds = %OP971.PUSH1
  %stack_len3465 = load i64, ptr %len.addr, align 8
  %2554 = add i64 %stack_len3465, -1
  store i64 %2554, ptr %len.addr, align 8
  %2555 = sub i64 %stack_len3465, 2
  %sp3466 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2555
  %2556 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3466)
  %2557 = icmp ne i8 %2556, 0
  br i1 %2557, label %return, label %OP972.KECCAK256.contd, !prof !2

OP972.KECCAK256.contd:                            ; preds = %OP972.KECCAK256
  br label %OP973.SLOAD, !annotation !5

OP973.SLOAD:                                      ; preds = %OP972.KECCAK256.contd
  %stack_len3467 = load i64, ptr %len.addr, align 8
  %2558 = sub i64 %stack_len3467, 1
  %sp3468 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2558
  %2559 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp3468, i8 19)
  %2560 = icmp ne i8 %2559, 0
  br i1 %2560, label %return, label %OP973.SLOAD.contd, !prof !2

OP973.SLOAD.contd:                                ; preds = %OP973.SLOAD
  br label %OP974.LT, !annotation !5

OP974.LT:                                         ; preds = %OP973.SLOAD.contd
  %stack_len3469 = load i64, ptr %len.addr, align 8
  %2561 = add i64 %stack_len3469, -1
  store i64 %2561, ptr %len.addr, align 8
  %2562 = add i64 %stack_len3469, -1
  %sp3470 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2562
  %a3471 = load i256, ptr %sp3470, align 16
  %2563 = add i64 %stack_len3469, -2
  %sp3472 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2563
  %b3473 = load i256, ptr %sp3472, align 16
  %2564 = icmp ult i256 %a3471, %b3473
  %2565 = zext i1 %2564 to i256
  %2566 = add i64 %stack_len3469, -2
  %sp3474 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2566
  store i256 %2565, ptr %sp3474, align 16
  br label %OP975.ISZERO, !annotation !5

OP975.ISZERO:                                     ; preds = %OP974.LT
  %stack_len3475 = load i64, ptr %len.addr, align 8
  %2567 = add i64 %stack_len3475, -1
  %sp3476 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2567
  %a3477 = load i256, ptr %sp3476, align 16
  %2568 = icmp eq i256 %a3477, 0
  %2569 = zext i1 %2568 to i256
  %2570 = add i64 %stack_len3475, -1
  %sp3478 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2570
  store i256 %2569, ptr %sp3478, align 16
  br label %OP976.ISZERO, !annotation !5

OP976.ISZERO:                                     ; preds = %OP975.ISZERO
  %stack_len3479 = load i64, ptr %len.addr, align 8
  %2571 = add i64 %stack_len3479, -1
  %sp3480 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2571
  %a3481 = load i256, ptr %sp3480, align 16
  %2572 = icmp eq i256 %a3481, 0
  %2573 = zext i1 %2572 to i256
  %2574 = add i64 %stack_len3479, -1
  %sp3482 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2574
  store i256 %2573, ptr %sp3482, align 16
  br label %OP977.ISZERO, !annotation !5

OP977.ISZERO:                                     ; preds = %OP976.ISZERO
  %stack_len3483 = load i64, ptr %len.addr, align 8
  %2575 = add i64 %stack_len3483, -1
  %sp3484 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2575
  %a3485 = load i256, ptr %sp3484, align 16
  %2576 = icmp eq i256 %a3485, 0
  %2577 = zext i1 %2576 to i256
  %2578 = add i64 %stack_len3483, -1
  %sp3486 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2578
  store i256 %2577, ptr %sp3486, align 16
  br label %OP978.PUSH2, !annotation !5

OP978.PUSH2:                                      ; preds = %OP977.ISZERO
  br label %OP979.JUMPI, !annotation !6

OP979.JUMPI:                                      ; preds = %OP978.PUSH2
  %stack_len3487 = load i64, ptr %len.addr, align 8
  %2579 = add i64 %stack_len3487, -1
  store i64 %2579, ptr %len.addr, align 8
  %2580 = add i64 %stack_len3487, -1
  %sp3488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2580
  %a3489 = load i256, ptr %sp3488, align 16
  %2581 = icmp ne i256 %a3489, 0
  br i1 %2581, label %OP983.JUMPDEST, label %OP980.PUSH1

OP980.PUSH1:                                      ; preds = %OP979.JUMPI
  %gas.remaining3490 = load i64, ptr %gas.remaining.addr, align 8
  %2582 = sub i64 %gas.remaining3490, 6
  %2583 = icmp ult i64 %gas.remaining3490, 6
  store i64 %2582, ptr %gas.remaining.addr, align 8
  br i1 %2583, label %return, label %OP980.PUSH1.contd, !prof !2, !annotation !3

OP980.PUSH1.contd:                                ; preds = %OP980.PUSH1
  %stack_len3491 = load i64, ptr %len.addr, align 8
  %2584 = icmp ugt i64 %stack_len3491, 1022
  br i1 %2584, label %return, label %OP980.PUSH1.contd3492, !prof !2, !annotation !4

OP980.PUSH1.contd3492:                            ; preds = %OP980.PUSH1.contd
  %2585 = add i64 %stack_len3491, 1
  store i64 %2585, ptr %len.addr, align 8
  %sp3493 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3491
  store i256 0, ptr %sp3493, align 16
  br label %OP981.DUP1, !annotation !5

OP981.DUP1:                                       ; preds = %OP980.PUSH1.contd3492
  %stack_len3494 = load i64, ptr %len.addr, align 8
  %2586 = add i64 %stack_len3494, 1
  store i64 %2586, ptr %len.addr, align 8
  %2587 = sub i64 %stack_len3494, 1
  %sp3495 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2587
  %dup13496 = load i256, ptr %sp3495, align 16
  %sp3497 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3494
  store i256 %dup13496, ptr %sp3497, align 16
  br label %OP982.REVERT, !annotation !5

OP982.REVERT:                                     ; preds = %OP981.DUP1
  %stack_len3498 = load i64, ptr %len.addr, align 8
  %2588 = add i64 %stack_len3498, -2
  store i64 %2588, ptr %len.addr, align 8
  %2589 = sub i64 %stack_len3498, 2
  %sp3499 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2589
  %2590 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp3499, i8 16)
  %2591 = icmp ne i8 %2590, 0
  br i1 %2591, label %return, label %OP982.REVERT.contd, !prof !2

OP982.REVERT.contd:                               ; preds = %OP982.REVERT
  br label %return, !annotation !8

OP983.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP979.JUMPI
  %gas.remaining3500 = load i64, ptr %gas.remaining.addr, align 8
  %2592 = sub i64 %gas.remaining3500, 43
  %2593 = icmp ult i64 %gas.remaining3500, 43
  store i64 %2592, ptr %gas.remaining.addr, align 8
  br i1 %2593, label %return, label %OP983.JUMPDEST.contd, !prof !2, !annotation !3

OP983.JUMPDEST.contd:                             ; preds = %OP983.JUMPDEST
  %stack_len3501 = load i64, ptr %len.addr, align 8
  %2594 = icmp ult i64 %stack_len3501, 4
  %2595 = icmp ugt i64 %stack_len3501, 1021
  %2596 = or i1 %2594, %2595
  %2597 = select i1 %2594, i8 91, i8 92
  br i1 %2596, label %return, label %OP983.JUMPDEST.contd3502, !prof !2

OP983.JUMPDEST.contd3502:                         ; preds = %OP983.JUMPDEST.contd
  br label %OP984.CALLER, !annotation !5

OP984.CALLER:                                     ; preds = %OP983.JUMPDEST.contd3502
  %stack_len3503 = load i64, ptr %len.addr, align 8
  %2598 = add i64 %stack_len3503, 1
  store i64 %2598, ptr %len.addr, align 8
  %contract.caller.addr3504 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3505 = load i160, ptr %contract.caller.addr3504, align 16
  %2599 = call i160 @llvm.bswap.i160(i160 %contract.caller3505)
  %2600 = zext i160 %2599 to i256
  %sp3506 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3503
  store i256 %2600, ptr %sp3506, align 16
  br label %OP985.PUSH20, !annotation !5

OP985.PUSH20:                                     ; preds = %OP984.CALLER
  %stack_len3507 = load i64, ptr %len.addr, align 8
  %2601 = add i64 %stack_len3507, 1
  store i64 %2601, ptr %len.addr, align 8
  %sp3508 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3507
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3508, align 16
  br label %OP986.AND, !annotation !5

OP986.AND:                                        ; preds = %OP985.PUSH20
  %stack_len3509 = load i64, ptr %len.addr, align 8
  %2602 = add i64 %stack_len3509, -1
  store i64 %2602, ptr %len.addr, align 8
  %2603 = add i64 %stack_len3509, -1
  %sp3510 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2603
  %a3511 = load i256, ptr %sp3510, align 16
  %2604 = add i64 %stack_len3509, -2
  %sp3512 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2604
  %b3513 = load i256, ptr %sp3512, align 16
  %2605 = and i256 %a3511, %b3513
  %2606 = add i64 %stack_len3509, -2
  %sp3514 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2606
  store i256 %2605, ptr %sp3514, align 16
  br label %OP987.DUP5, !annotation !5

OP987.DUP5:                                       ; preds = %OP986.AND
  %stack_len3515 = load i64, ptr %len.addr, align 8
  %2607 = add i64 %stack_len3515, 1
  store i64 %2607, ptr %len.addr, align 8
  %2608 = sub i64 %stack_len3515, 5
  %sp3516 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2608
  %dup53517 = load i256, ptr %sp3516, align 16
  %sp3518 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3515
  store i256 %dup53517, ptr %sp3518, align 16
  br label %OP988.PUSH20, !annotation !5

OP988.PUSH20:                                     ; preds = %OP987.DUP5
  %stack_len3519 = load i64, ptr %len.addr, align 8
  %2609 = add i64 %stack_len3519, 1
  store i64 %2609, ptr %len.addr, align 8
  %sp3520 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3519
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3520, align 16
  br label %OP989.AND, !annotation !5

OP989.AND:                                        ; preds = %OP988.PUSH20
  %stack_len3521 = load i64, ptr %len.addr, align 8
  %2610 = add i64 %stack_len3521, -1
  store i64 %2610, ptr %len.addr, align 8
  %2611 = add i64 %stack_len3521, -1
  %sp3522 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2611
  %a3523 = load i256, ptr %sp3522, align 16
  %2612 = add i64 %stack_len3521, -2
  %sp3524 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2612
  %b3525 = load i256, ptr %sp3524, align 16
  %2613 = and i256 %a3523, %b3525
  %2614 = add i64 %stack_len3521, -2
  %sp3526 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2614
  store i256 %2613, ptr %sp3526, align 16
  br label %OP990.EQ, !annotation !5

OP990.EQ:                                         ; preds = %OP989.AND
  %stack_len3527 = load i64, ptr %len.addr, align 8
  %2615 = add i64 %stack_len3527, -1
  store i64 %2615, ptr %len.addr, align 8
  %2616 = add i64 %stack_len3527, -1
  %sp3528 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2616
  %a3529 = load i256, ptr %sp3528, align 16
  %2617 = add i64 %stack_len3527, -2
  %sp3530 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2617
  %b3531 = load i256, ptr %sp3530, align 16
  %2618 = icmp eq i256 %a3529, %b3531
  %2619 = zext i1 %2618 to i256
  %2620 = add i64 %stack_len3527, -2
  %sp3532 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2620
  store i256 %2619, ptr %sp3532, align 16
  br label %OP991.ISZERO, !annotation !5

OP991.ISZERO:                                     ; preds = %OP990.EQ
  %stack_len3533 = load i64, ptr %len.addr, align 8
  %2621 = add i64 %stack_len3533, -1
  %sp3534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2621
  %a3535 = load i256, ptr %sp3534, align 16
  %2622 = icmp eq i256 %a3535, 0
  %2623 = zext i1 %2622 to i256
  %2624 = add i64 %stack_len3533, -1
  %sp3536 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2624
  store i256 %2623, ptr %sp3536, align 16
  br label %OP992.DUP1, !annotation !5

OP992.DUP1:                                       ; preds = %OP991.ISZERO
  %stack_len3537 = load i64, ptr %len.addr, align 8
  %2625 = add i64 %stack_len3537, 1
  store i64 %2625, ptr %len.addr, align 8
  %2626 = sub i64 %stack_len3537, 1
  %sp3538 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2626
  %dup13539 = load i256, ptr %sp3538, align 16
  %sp3540 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3537
  store i256 %dup13539, ptr %sp3540, align 16
  br label %OP993.ISZERO, !annotation !5

OP993.ISZERO:                                     ; preds = %OP992.DUP1
  %stack_len3541 = load i64, ptr %len.addr, align 8
  %2627 = add i64 %stack_len3541, -1
  %sp3542 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2627
  %a3543 = load i256, ptr %sp3542, align 16
  %2628 = icmp eq i256 %a3543, 0
  %2629 = zext i1 %2628 to i256
  %2630 = add i64 %stack_len3541, -1
  %sp3544 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2630
  store i256 %2629, ptr %sp3544, align 16
  br label %OP994.PUSH2, !annotation !5

OP994.PUSH2:                                      ; preds = %OP993.ISZERO
  br label %OP995.JUMPI, !annotation !6

OP995.JUMPI:                                      ; preds = %OP994.PUSH2
  %stack_len3545 = load i64, ptr %len.addr, align 8
  %2631 = add i64 %stack_len3545, -1
  store i64 %2631, ptr %len.addr, align 8
  %2632 = add i64 %stack_len3545, -1
  %sp3546 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2632
  %a3547 = load i256, ptr %sp3546, align 16
  %2633 = icmp ne i256 %a3547, 0
  br i1 %2633, label %OP1036.JUMPDEST, label %OP996.POP

OP996.POP:                                        ; preds = %OP995.JUMPI
  %gas.remaining3548 = load i64, ptr %gas.remaining.addr, align 8
  %2634 = sub i64 %gas.remaining3548, 169
  %2635 = icmp ult i64 %gas.remaining3548, 169
  store i64 %2634, ptr %gas.remaining.addr, align 8
  br i1 %2635, label %return, label %OP996.POP.contd, !prof !2, !annotation !3

OP996.POP.contd:                                  ; preds = %OP996.POP
  %stack_len3549 = load i64, ptr %len.addr, align 8
  %2636 = icmp ult i64 %stack_len3549, 5
  %2637 = icmp ugt i64 %stack_len3549, 1020
  %2638 = or i1 %2636, %2637
  %2639 = select i1 %2636, i8 91, i8 92
  br i1 %2638, label %return, label %OP996.POP.contd3550, !prof !2

OP996.POP.contd3550:                              ; preds = %OP996.POP.contd
  %2640 = add i64 %stack_len3549, -1
  store i64 %2640, ptr %len.addr, align 8
  br label %OP997.PUSH32, !annotation !5

OP997.PUSH32:                                     ; preds = %OP996.POP.contd3550
  %stack_len3551 = load i64, ptr %len.addr, align 8
  %2641 = add i64 %stack_len3551, 1
  store i64 %2641, ptr %len.addr, align 8
  %sp3552 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3551
  store i256 -1, ptr %sp3552, align 16
  br label %OP998.PUSH1, !annotation !5

OP998.PUSH1:                                      ; preds = %OP997.PUSH32
  %stack_len3553 = load i64, ptr %len.addr, align 8
  %2642 = add i64 %stack_len3553, 1
  store i64 %2642, ptr %len.addr, align 8
  %sp3554 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3553
  store i256 4, ptr %sp3554, align 16
  br label %OP999.PUSH1, !annotation !5

OP999.PUSH1:                                      ; preds = %OP998.PUSH1
  %stack_len3555 = load i64, ptr %len.addr, align 8
  %2643 = add i64 %stack_len3555, 1
  store i64 %2643, ptr %len.addr, align 8
  %sp3556 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3555
  store i256 0, ptr %sp3556, align 16
  br label %OP1000.DUP7, !annotation !5

OP1000.DUP7:                                      ; preds = %OP999.PUSH1
  %stack_len3557 = load i64, ptr %len.addr, align 8
  %2644 = add i64 %stack_len3557, 1
  store i64 %2644, ptr %len.addr, align 8
  %2645 = sub i64 %stack_len3557, 7
  %sp3558 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2645
  %dup73559 = load i256, ptr %sp3558, align 16
  %sp3560 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3557
  store i256 %dup73559, ptr %sp3560, align 16
  br label %OP1001.PUSH20, !annotation !5

OP1001.PUSH20:                                    ; preds = %OP1000.DUP7
  %stack_len3561 = load i64, ptr %len.addr, align 8
  %2646 = add i64 %stack_len3561, 1
  store i64 %2646, ptr %len.addr, align 8
  %sp3562 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3561
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3562, align 16
  br label %OP1002.AND, !annotation !5

OP1002.AND:                                       ; preds = %OP1001.PUSH20
  %stack_len3563 = load i64, ptr %len.addr, align 8
  %2647 = add i64 %stack_len3563, -1
  store i64 %2647, ptr %len.addr, align 8
  %2648 = add i64 %stack_len3563, -1
  %sp3564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2648
  %a3565 = load i256, ptr %sp3564, align 16
  %2649 = add i64 %stack_len3563, -2
  %sp3566 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2649
  %b3567 = load i256, ptr %sp3566, align 16
  %2650 = and i256 %a3565, %b3567
  %2651 = add i64 %stack_len3563, -2
  %sp3568 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2651
  store i256 %2650, ptr %sp3568, align 16
  br label %OP1003.PUSH20, !annotation !5

OP1003.PUSH20:                                    ; preds = %OP1002.AND
  %stack_len3569 = load i64, ptr %len.addr, align 8
  %2652 = add i64 %stack_len3569, 1
  store i64 %2652, ptr %len.addr, align 8
  %sp3570 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3569
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3570, align 16
  br label %OP1004.AND, !annotation !5

OP1004.AND:                                       ; preds = %OP1003.PUSH20
  %stack_len3571 = load i64, ptr %len.addr, align 8
  %2653 = add i64 %stack_len3571, -1
  store i64 %2653, ptr %len.addr, align 8
  %2654 = add i64 %stack_len3571, -1
  %sp3572 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2654
  %a3573 = load i256, ptr %sp3572, align 16
  %2655 = add i64 %stack_len3571, -2
  %sp3574 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2655
  %b3575 = load i256, ptr %sp3574, align 16
  %2656 = and i256 %a3573, %b3575
  %2657 = add i64 %stack_len3571, -2
  %sp3576 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2657
  store i256 %2656, ptr %sp3576, align 16
  br label %OP1005.DUP2, !annotation !5

OP1005.DUP2:                                      ; preds = %OP1004.AND
  %stack_len3577 = load i64, ptr %len.addr, align 8
  %2658 = add i64 %stack_len3577, 1
  store i64 %2658, ptr %len.addr, align 8
  %2659 = sub i64 %stack_len3577, 2
  %sp3578 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2659
  %dup23579 = load i256, ptr %sp3578, align 16
  %sp3580 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3577
  store i256 %dup23579, ptr %sp3580, align 16
  br label %OP1006.MSTORE, !annotation !5

OP1006.MSTORE:                                    ; preds = %OP1005.DUP2
  %stack_len3581 = load i64, ptr %len.addr, align 8
  %2660 = add i64 %stack_len3581, -2
  store i64 %2660, ptr %len.addr, align 8
  %2661 = add i64 %stack_len3581, -1
  %sp3582 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2661
  %a3583 = load i256, ptr %sp3582, align 16
  %2662 = add i64 %stack_len3581, -2
  %sp3584 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2662
  %b3585 = load i256, ptr %sp3584, align 16
  %2663 = call i8 @__revmc_ir_builtin_mstore(i256 %a3583, i256 %b3585, ptr %arg.ecx.addr)
  %2664 = icmp ne i8 %2663, 0
  br i1 %2664, label %return, label %OP1006.MSTORE.contd, !prof !2

OP1006.MSTORE.contd:                              ; preds = %OP1006.MSTORE
  br label %OP1007.PUSH1, !annotation !5

OP1007.PUSH1:                                     ; preds = %OP1006.MSTORE.contd
  %stack_len3586 = load i64, ptr %len.addr, align 8
  %2665 = add i64 %stack_len3586, 1
  store i64 %2665, ptr %len.addr, align 8
  %sp3587 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3586
  store i256 32, ptr %sp3587, align 16
  br label %OP1008.ADD, !annotation !5

OP1008.ADD:                                       ; preds = %OP1007.PUSH1
  %stack_len3588 = load i64, ptr %len.addr, align 8
  %2666 = add i64 %stack_len3588, -1
  store i64 %2666, ptr %len.addr, align 8
  %2667 = add i64 %stack_len3588, -1
  %sp3589 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2667
  %a3590 = load i256, ptr %sp3589, align 16
  %2668 = add i64 %stack_len3588, -2
  %sp3591 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2668
  %b3592 = load i256, ptr %sp3591, align 16
  %2669 = add i256 %a3590, %b3592
  %2670 = add i64 %stack_len3588, -2
  %sp3593 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2670
  store i256 %2669, ptr %sp3593, align 16
  br label %OP1009.SWAP1, !annotation !5

OP1009.SWAP1:                                     ; preds = %OP1008.ADD
  %stack_len3594 = load i64, ptr %len.addr, align 8
  %2671 = sub i64 %stack_len3594, 1
  %sp3595 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2671
  %swap.a3596 = load i256, ptr %sp3595, align 16
  %2672 = sub i64 %stack_len3594, 2
  %sp3597 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2672
  %swap.b3598 = load i256, ptr %sp3597, align 16
  store i256 %swap.a3596, ptr %sp3597, align 16
  store i256 %swap.b3598, ptr %sp3595, align 16
  br label %OP1010.DUP2, !annotation !5

OP1010.DUP2:                                      ; preds = %OP1009.SWAP1
  %stack_len3599 = load i64, ptr %len.addr, align 8
  %2673 = add i64 %stack_len3599, 1
  store i64 %2673, ptr %len.addr, align 8
  %2674 = sub i64 %stack_len3599, 2
  %sp3600 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2674
  %dup23601 = load i256, ptr %sp3600, align 16
  %sp3602 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3599
  store i256 %dup23601, ptr %sp3602, align 16
  br label %OP1011.MSTORE, !annotation !5

OP1011.MSTORE:                                    ; preds = %OP1010.DUP2
  %stack_len3603 = load i64, ptr %len.addr, align 8
  %2675 = add i64 %stack_len3603, -2
  store i64 %2675, ptr %len.addr, align 8
  %2676 = add i64 %stack_len3603, -1
  %sp3604 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2676
  %a3605 = load i256, ptr %sp3604, align 16
  %2677 = add i64 %stack_len3603, -2
  %sp3606 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2677
  %b3607 = load i256, ptr %sp3606, align 16
  %2678 = call i8 @__revmc_ir_builtin_mstore(i256 %a3605, i256 %b3607, ptr %arg.ecx.addr)
  %2679 = icmp ne i8 %2678, 0
  br i1 %2679, label %return, label %OP1011.MSTORE.contd, !prof !2

OP1011.MSTORE.contd:                              ; preds = %OP1011.MSTORE
  br label %OP1012.PUSH1, !annotation !5

OP1012.PUSH1:                                     ; preds = %OP1011.MSTORE.contd
  %stack_len3608 = load i64, ptr %len.addr, align 8
  %2680 = add i64 %stack_len3608, 1
  store i64 %2680, ptr %len.addr, align 8
  %sp3609 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3608
  store i256 32, ptr %sp3609, align 16
  br label %OP1013.ADD, !annotation !5

OP1013.ADD:                                       ; preds = %OP1012.PUSH1
  %stack_len3610 = load i64, ptr %len.addr, align 8
  %2681 = add i64 %stack_len3610, -1
  store i64 %2681, ptr %len.addr, align 8
  %2682 = add i64 %stack_len3610, -1
  %sp3611 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2682
  %a3612 = load i256, ptr %sp3611, align 16
  %2683 = add i64 %stack_len3610, -2
  %sp3613 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2683
  %b3614 = load i256, ptr %sp3613, align 16
  %2684 = add i256 %a3612, %b3614
  %2685 = add i64 %stack_len3610, -2
  %sp3615 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2685
  store i256 %2684, ptr %sp3615, align 16
  br label %OP1014.PUSH1, !annotation !5

OP1014.PUSH1:                                     ; preds = %OP1013.ADD
  %stack_len3616 = load i64, ptr %len.addr, align 8
  %2686 = add i64 %stack_len3616, 1
  store i64 %2686, ptr %len.addr, align 8
  %sp3617 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3616
  store i256 0, ptr %sp3617, align 16
  br label %OP1015.KECCAK256, !annotation !5

OP1015.KECCAK256:                                 ; preds = %OP1014.PUSH1
  %stack_len3618 = load i64, ptr %len.addr, align 8
  %2687 = add i64 %stack_len3618, -1
  store i64 %2687, ptr %len.addr, align 8
  %2688 = sub i64 %stack_len3618, 2
  %sp3619 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2688
  %2689 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3619)
  %2690 = icmp ne i8 %2689, 0
  br i1 %2690, label %return, label %OP1015.KECCAK256.contd, !prof !2

OP1015.KECCAK256.contd:                           ; preds = %OP1015.KECCAK256
  br label %OP1016.PUSH1, !annotation !5

OP1016.PUSH1:                                     ; preds = %OP1015.KECCAK256.contd
  %stack_len3620 = load i64, ptr %len.addr, align 8
  %2691 = add i64 %stack_len3620, 1
  store i64 %2691, ptr %len.addr, align 8
  %sp3621 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3620
  store i256 0, ptr %sp3621, align 16
  br label %OP1017.CALLER, !annotation !5

OP1017.CALLER:                                    ; preds = %OP1016.PUSH1
  %stack_len3622 = load i64, ptr %len.addr, align 8
  %2692 = add i64 %stack_len3622, 1
  store i64 %2692, ptr %len.addr, align 8
  %contract.caller.addr3623 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3624 = load i160, ptr %contract.caller.addr3623, align 16
  %2693 = call i160 @llvm.bswap.i160(i160 %contract.caller3624)
  %2694 = zext i160 %2693 to i256
  %sp3625 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3622
  store i256 %2694, ptr %sp3625, align 16
  br label %OP1018.PUSH20, !annotation !5

OP1018.PUSH20:                                    ; preds = %OP1017.CALLER
  %stack_len3626 = load i64, ptr %len.addr, align 8
  %2695 = add i64 %stack_len3626, 1
  store i64 %2695, ptr %len.addr, align 8
  %sp3627 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3626
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3627, align 16
  br label %OP1019.AND, !annotation !5

OP1019.AND:                                       ; preds = %OP1018.PUSH20
  %stack_len3628 = load i64, ptr %len.addr, align 8
  %2696 = add i64 %stack_len3628, -1
  store i64 %2696, ptr %len.addr, align 8
  %2697 = add i64 %stack_len3628, -1
  %sp3629 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2697
  %a3630 = load i256, ptr %sp3629, align 16
  %2698 = add i64 %stack_len3628, -2
  %sp3631 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2698
  %b3632 = load i256, ptr %sp3631, align 16
  %2699 = and i256 %a3630, %b3632
  %2700 = add i64 %stack_len3628, -2
  %sp3633 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2700
  store i256 %2699, ptr %sp3633, align 16
  br label %OP1020.PUSH20, !annotation !5

OP1020.PUSH20:                                    ; preds = %OP1019.AND
  %stack_len3634 = load i64, ptr %len.addr, align 8
  %2701 = add i64 %stack_len3634, 1
  store i64 %2701, ptr %len.addr, align 8
  %sp3635 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3634
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3635, align 16
  br label %OP1021.AND, !annotation !5

OP1021.AND:                                       ; preds = %OP1020.PUSH20
  %stack_len3636 = load i64, ptr %len.addr, align 8
  %2702 = add i64 %stack_len3636, -1
  store i64 %2702, ptr %len.addr, align 8
  %2703 = add i64 %stack_len3636, -1
  %sp3637 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2703
  %a3638 = load i256, ptr %sp3637, align 16
  %2704 = add i64 %stack_len3636, -2
  %sp3639 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2704
  %b3640 = load i256, ptr %sp3639, align 16
  %2705 = and i256 %a3638, %b3640
  %2706 = add i64 %stack_len3636, -2
  %sp3641 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2706
  store i256 %2705, ptr %sp3641, align 16
  br label %OP1022.DUP2, !annotation !5

OP1022.DUP2:                                      ; preds = %OP1021.AND
  %stack_len3642 = load i64, ptr %len.addr, align 8
  %2707 = add i64 %stack_len3642, 1
  store i64 %2707, ptr %len.addr, align 8
  %2708 = sub i64 %stack_len3642, 2
  %sp3643 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2708
  %dup23644 = load i256, ptr %sp3643, align 16
  %sp3645 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3642
  store i256 %dup23644, ptr %sp3645, align 16
  br label %OP1023.MSTORE, !annotation !5

OP1023.MSTORE:                                    ; preds = %OP1022.DUP2
  %stack_len3646 = load i64, ptr %len.addr, align 8
  %2709 = add i64 %stack_len3646, -2
  store i64 %2709, ptr %len.addr, align 8
  %2710 = add i64 %stack_len3646, -1
  %sp3647 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2710
  %a3648 = load i256, ptr %sp3647, align 16
  %2711 = add i64 %stack_len3646, -2
  %sp3649 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2711
  %b3650 = load i256, ptr %sp3649, align 16
  %2712 = call i8 @__revmc_ir_builtin_mstore(i256 %a3648, i256 %b3650, ptr %arg.ecx.addr)
  %2713 = icmp ne i8 %2712, 0
  br i1 %2713, label %return, label %OP1023.MSTORE.contd, !prof !2

OP1023.MSTORE.contd:                              ; preds = %OP1023.MSTORE
  br label %OP1024.PUSH1, !annotation !5

OP1024.PUSH1:                                     ; preds = %OP1023.MSTORE.contd
  %stack_len3651 = load i64, ptr %len.addr, align 8
  %2714 = add i64 %stack_len3651, 1
  store i64 %2714, ptr %len.addr, align 8
  %sp3652 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3651
  store i256 32, ptr %sp3652, align 16
  br label %OP1025.ADD, !annotation !5

OP1025.ADD:                                       ; preds = %OP1024.PUSH1
  %stack_len3653 = load i64, ptr %len.addr, align 8
  %2715 = add i64 %stack_len3653, -1
  store i64 %2715, ptr %len.addr, align 8
  %2716 = add i64 %stack_len3653, -1
  %sp3654 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2716
  %a3655 = load i256, ptr %sp3654, align 16
  %2717 = add i64 %stack_len3653, -2
  %sp3656 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2717
  %b3657 = load i256, ptr %sp3656, align 16
  %2718 = add i256 %a3655, %b3657
  %2719 = add i64 %stack_len3653, -2
  %sp3658 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2719
  store i256 %2718, ptr %sp3658, align 16
  br label %OP1026.SWAP1, !annotation !5

OP1026.SWAP1:                                     ; preds = %OP1025.ADD
  %stack_len3659 = load i64, ptr %len.addr, align 8
  %2720 = sub i64 %stack_len3659, 1
  %sp3660 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2720
  %swap.a3661 = load i256, ptr %sp3660, align 16
  %2721 = sub i64 %stack_len3659, 2
  %sp3662 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2721
  %swap.b3663 = load i256, ptr %sp3662, align 16
  store i256 %swap.a3661, ptr %sp3662, align 16
  store i256 %swap.b3663, ptr %sp3660, align 16
  br label %OP1027.DUP2, !annotation !5

OP1027.DUP2:                                      ; preds = %OP1026.SWAP1
  %stack_len3664 = load i64, ptr %len.addr, align 8
  %2722 = add i64 %stack_len3664, 1
  store i64 %2722, ptr %len.addr, align 8
  %2723 = sub i64 %stack_len3664, 2
  %sp3665 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2723
  %dup23666 = load i256, ptr %sp3665, align 16
  %sp3667 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3664
  store i256 %dup23666, ptr %sp3667, align 16
  br label %OP1028.MSTORE, !annotation !5

OP1028.MSTORE:                                    ; preds = %OP1027.DUP2
  %stack_len3668 = load i64, ptr %len.addr, align 8
  %2724 = add i64 %stack_len3668, -2
  store i64 %2724, ptr %len.addr, align 8
  %2725 = add i64 %stack_len3668, -1
  %sp3669 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2725
  %a3670 = load i256, ptr %sp3669, align 16
  %2726 = add i64 %stack_len3668, -2
  %sp3671 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2726
  %b3672 = load i256, ptr %sp3671, align 16
  %2727 = call i8 @__revmc_ir_builtin_mstore(i256 %a3670, i256 %b3672, ptr %arg.ecx.addr)
  %2728 = icmp ne i8 %2727, 0
  br i1 %2728, label %return, label %OP1028.MSTORE.contd, !prof !2

OP1028.MSTORE.contd:                              ; preds = %OP1028.MSTORE
  br label %OP1029.PUSH1, !annotation !5

OP1029.PUSH1:                                     ; preds = %OP1028.MSTORE.contd
  %stack_len3673 = load i64, ptr %len.addr, align 8
  %2729 = add i64 %stack_len3673, 1
  store i64 %2729, ptr %len.addr, align 8
  %sp3674 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3673
  store i256 32, ptr %sp3674, align 16
  br label %OP1030.ADD, !annotation !5

OP1030.ADD:                                       ; preds = %OP1029.PUSH1
  %stack_len3675 = load i64, ptr %len.addr, align 8
  %2730 = add i64 %stack_len3675, -1
  store i64 %2730, ptr %len.addr, align 8
  %2731 = add i64 %stack_len3675, -1
  %sp3676 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2731
  %a3677 = load i256, ptr %sp3676, align 16
  %2732 = add i64 %stack_len3675, -2
  %sp3678 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2732
  %b3679 = load i256, ptr %sp3678, align 16
  %2733 = add i256 %a3677, %b3679
  %2734 = add i64 %stack_len3675, -2
  %sp3680 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2734
  store i256 %2733, ptr %sp3680, align 16
  br label %OP1031.PUSH1, !annotation !5

OP1031.PUSH1:                                     ; preds = %OP1030.ADD
  %stack_len3681 = load i64, ptr %len.addr, align 8
  %2735 = add i64 %stack_len3681, 1
  store i64 %2735, ptr %len.addr, align 8
  %sp3682 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3681
  store i256 0, ptr %sp3682, align 16
  br label %OP1032.KECCAK256, !annotation !5

OP1032.KECCAK256:                                 ; preds = %OP1031.PUSH1
  %stack_len3683 = load i64, ptr %len.addr, align 8
  %2736 = add i64 %stack_len3683, -1
  store i64 %2736, ptr %len.addr, align 8
  %2737 = sub i64 %stack_len3683, 2
  %sp3684 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2737
  %2738 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3684)
  %2739 = icmp ne i8 %2738, 0
  br i1 %2739, label %return, label %OP1032.KECCAK256.contd, !prof !2

OP1032.KECCAK256.contd:                           ; preds = %OP1032.KECCAK256
  br label %OP1033.SLOAD, !annotation !5

OP1033.SLOAD:                                     ; preds = %OP1032.KECCAK256.contd
  %stack_len3685 = load i64, ptr %len.addr, align 8
  %2740 = sub i64 %stack_len3685, 1
  %sp3686 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2740
  %2741 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp3686, i8 19)
  %2742 = icmp ne i8 %2741, 0
  br i1 %2742, label %return, label %OP1033.SLOAD.contd, !prof !2

OP1033.SLOAD.contd:                               ; preds = %OP1033.SLOAD
  br label %OP1034.EQ, !annotation !5

OP1034.EQ:                                        ; preds = %OP1033.SLOAD.contd
  %stack_len3687 = load i64, ptr %len.addr, align 8
  %2743 = add i64 %stack_len3687, -1
  store i64 %2743, ptr %len.addr, align 8
  %2744 = add i64 %stack_len3687, -1
  %sp3688 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2744
  %a3689 = load i256, ptr %sp3688, align 16
  %2745 = add i64 %stack_len3687, -2
  %sp3690 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2745
  %b3691 = load i256, ptr %sp3690, align 16
  %2746 = icmp eq i256 %a3689, %b3691
  %2747 = zext i1 %2746 to i256
  %2748 = add i64 %stack_len3687, -2
  %sp3692 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2748
  store i256 %2747, ptr %sp3692, align 16
  br label %OP1035.ISZERO, !annotation !5

OP1035.ISZERO:                                    ; preds = %OP1034.EQ
  %stack_len3693 = load i64, ptr %len.addr, align 8
  %2749 = add i64 %stack_len3693, -1
  %sp3694 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2749
  %a3695 = load i256, ptr %sp3694, align 16
  %2750 = icmp eq i256 %a3695, 0
  %2751 = zext i1 %2750 to i256
  %2752 = add i64 %stack_len3693, -1
  %sp3696 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2752
  store i256 %2751, ptr %sp3696, align 16
  br label %OP1036.JUMPDEST, !annotation !5

OP1036.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1035.ISZERO, %OP995.JUMPI
  %gas.remaining3697 = load i64, ptr %gas.remaining.addr, align 8
  %2753 = sub i64 %gas.remaining3697, 17
  %2754 = icmp ult i64 %gas.remaining3697, 17
  store i64 %2753, ptr %gas.remaining.addr, align 8
  br i1 %2754, label %return, label %OP1036.JUMPDEST.contd, !prof !2, !annotation !3

OP1036.JUMPDEST.contd:                            ; preds = %OP1036.JUMPDEST
  %stack_len3698 = load i64, ptr %len.addr, align 8
  %2755 = icmp ult i64 %stack_len3698, 1
  %2756 = icmp ugt i64 %stack_len3698, 1023
  %2757 = or i1 %2755, %2756
  %2758 = select i1 %2755, i8 91, i8 92
  br i1 %2757, label %return, label %OP1036.JUMPDEST.contd3699, !prof !2

OP1036.JUMPDEST.contd3699:                        ; preds = %OP1036.JUMPDEST.contd
  br label %OP1037.ISZERO, !annotation !5

OP1037.ISZERO:                                    ; preds = %OP1036.JUMPDEST.contd3699
  %stack_len3700 = load i64, ptr %len.addr, align 8
  %2759 = add i64 %stack_len3700, -1
  %sp3701 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2759
  %a3702 = load i256, ptr %sp3701, align 16
  %2760 = icmp eq i256 %a3702, 0
  %2761 = zext i1 %2760 to i256
  %2762 = add i64 %stack_len3700, -1
  %sp3703 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2762
  store i256 %2761, ptr %sp3703, align 16
  br label %OP1038.PUSH2, !annotation !5

OP1038.PUSH2:                                     ; preds = %OP1037.ISZERO
  br label %OP1039.JUMPI, !annotation !6

OP1039.JUMPI:                                     ; preds = %OP1038.PUSH2
  %stack_len3704 = load i64, ptr %len.addr, align 8
  %2763 = add i64 %stack_len3704, -1
  store i64 %2763, ptr %len.addr, align 8
  %2764 = add i64 %stack_len3704, -1
  %sp3705 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2764
  %a3706 = load i256, ptr %sp3705, align 16
  %2765 = icmp ne i256 %a3706, 0
  br i1 %2765, label %OP1135.JUMPDEST, label %OP1040.DUP2

OP1040.DUP2:                                      ; preds = %OP1039.JUMPI
  %gas.remaining3707 = load i64, ptr %gas.remaining.addr, align 8
  %2766 = sub i64 %gas.remaining3707, 186
  %2767 = icmp ult i64 %gas.remaining3707, 186
  store i64 %2766, ptr %gas.remaining.addr, align 8
  br i1 %2767, label %return, label %OP1040.DUP2.contd, !prof !2, !annotation !3

OP1040.DUP2.contd:                                ; preds = %OP1040.DUP2
  %stack_len3708 = load i64, ptr %len.addr, align 8
  %2768 = icmp ult i64 %stack_len3708, 4
  %2769 = icmp ugt i64 %stack_len3708, 1019
  %2770 = or i1 %2768, %2769
  %2771 = select i1 %2768, i8 91, i8 92
  br i1 %2770, label %return, label %OP1040.DUP2.contd3709, !prof !2

OP1040.DUP2.contd3709:                            ; preds = %OP1040.DUP2.contd
  %2772 = add i64 %stack_len3708, 1
  store i64 %2772, ptr %len.addr, align 8
  %2773 = sub i64 %stack_len3708, 2
  %sp3710 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2773
  %dup23711 = load i256, ptr %sp3710, align 16
  %sp3712 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3708
  store i256 %dup23711, ptr %sp3712, align 16
  br label %OP1041.PUSH1, !annotation !5

OP1041.PUSH1:                                     ; preds = %OP1040.DUP2.contd3709
  %stack_len3713 = load i64, ptr %len.addr, align 8
  %2774 = add i64 %stack_len3713, 1
  store i64 %2774, ptr %len.addr, align 8
  %sp3714 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3713
  store i256 4, ptr %sp3714, align 16
  br label %OP1042.PUSH1, !annotation !5

OP1042.PUSH1:                                     ; preds = %OP1041.PUSH1
  %stack_len3715 = load i64, ptr %len.addr, align 8
  %2775 = add i64 %stack_len3715, 1
  store i64 %2775, ptr %len.addr, align 8
  %sp3716 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3715
  store i256 0, ptr %sp3716, align 16
  br label %OP1043.DUP7, !annotation !5

OP1043.DUP7:                                      ; preds = %OP1042.PUSH1
  %stack_len3717 = load i64, ptr %len.addr, align 8
  %2776 = add i64 %stack_len3717, 1
  store i64 %2776, ptr %len.addr, align 8
  %2777 = sub i64 %stack_len3717, 7
  %sp3718 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2777
  %dup73719 = load i256, ptr %sp3718, align 16
  %sp3720 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3717
  store i256 %dup73719, ptr %sp3720, align 16
  br label %OP1044.PUSH20, !annotation !5

OP1044.PUSH20:                                    ; preds = %OP1043.DUP7
  %stack_len3721 = load i64, ptr %len.addr, align 8
  %2778 = add i64 %stack_len3721, 1
  store i64 %2778, ptr %len.addr, align 8
  %sp3722 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3721
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3722, align 16
  br label %OP1045.AND, !annotation !5

OP1045.AND:                                       ; preds = %OP1044.PUSH20
  %stack_len3723 = load i64, ptr %len.addr, align 8
  %2779 = add i64 %stack_len3723, -1
  store i64 %2779, ptr %len.addr, align 8
  %2780 = add i64 %stack_len3723, -1
  %sp3724 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2780
  %a3725 = load i256, ptr %sp3724, align 16
  %2781 = add i64 %stack_len3723, -2
  %sp3726 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2781
  %b3727 = load i256, ptr %sp3726, align 16
  %2782 = and i256 %a3725, %b3727
  %2783 = add i64 %stack_len3723, -2
  %sp3728 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2783
  store i256 %2782, ptr %sp3728, align 16
  br label %OP1046.PUSH20, !annotation !5

OP1046.PUSH20:                                    ; preds = %OP1045.AND
  %stack_len3729 = load i64, ptr %len.addr, align 8
  %2784 = add i64 %stack_len3729, 1
  store i64 %2784, ptr %len.addr, align 8
  %sp3730 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3729
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3730, align 16
  br label %OP1047.AND, !annotation !5

OP1047.AND:                                       ; preds = %OP1046.PUSH20
  %stack_len3731 = load i64, ptr %len.addr, align 8
  %2785 = add i64 %stack_len3731, -1
  store i64 %2785, ptr %len.addr, align 8
  %2786 = add i64 %stack_len3731, -1
  %sp3732 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2786
  %a3733 = load i256, ptr %sp3732, align 16
  %2787 = add i64 %stack_len3731, -2
  %sp3734 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2787
  %b3735 = load i256, ptr %sp3734, align 16
  %2788 = and i256 %a3733, %b3735
  %2789 = add i64 %stack_len3731, -2
  %sp3736 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2789
  store i256 %2788, ptr %sp3736, align 16
  br label %OP1048.DUP2, !annotation !5

OP1048.DUP2:                                      ; preds = %OP1047.AND
  %stack_len3737 = load i64, ptr %len.addr, align 8
  %2790 = add i64 %stack_len3737, 1
  store i64 %2790, ptr %len.addr, align 8
  %2791 = sub i64 %stack_len3737, 2
  %sp3738 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2791
  %dup23739 = load i256, ptr %sp3738, align 16
  %sp3740 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3737
  store i256 %dup23739, ptr %sp3740, align 16
  br label %OP1049.MSTORE, !annotation !5

OP1049.MSTORE:                                    ; preds = %OP1048.DUP2
  %stack_len3741 = load i64, ptr %len.addr, align 8
  %2792 = add i64 %stack_len3741, -2
  store i64 %2792, ptr %len.addr, align 8
  %2793 = add i64 %stack_len3741, -1
  %sp3742 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2793
  %a3743 = load i256, ptr %sp3742, align 16
  %2794 = add i64 %stack_len3741, -2
  %sp3744 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2794
  %b3745 = load i256, ptr %sp3744, align 16
  %2795 = call i8 @__revmc_ir_builtin_mstore(i256 %a3743, i256 %b3745, ptr %arg.ecx.addr)
  %2796 = icmp ne i8 %2795, 0
  br i1 %2796, label %return, label %OP1049.MSTORE.contd, !prof !2

OP1049.MSTORE.contd:                              ; preds = %OP1049.MSTORE
  br label %OP1050.PUSH1, !annotation !5

OP1050.PUSH1:                                     ; preds = %OP1049.MSTORE.contd
  %stack_len3746 = load i64, ptr %len.addr, align 8
  %2797 = add i64 %stack_len3746, 1
  store i64 %2797, ptr %len.addr, align 8
  %sp3747 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3746
  store i256 32, ptr %sp3747, align 16
  br label %OP1051.ADD, !annotation !5

OP1051.ADD:                                       ; preds = %OP1050.PUSH1
  %stack_len3748 = load i64, ptr %len.addr, align 8
  %2798 = add i64 %stack_len3748, -1
  store i64 %2798, ptr %len.addr, align 8
  %2799 = add i64 %stack_len3748, -1
  %sp3749 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2799
  %a3750 = load i256, ptr %sp3749, align 16
  %2800 = add i64 %stack_len3748, -2
  %sp3751 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2800
  %b3752 = load i256, ptr %sp3751, align 16
  %2801 = add i256 %a3750, %b3752
  %2802 = add i64 %stack_len3748, -2
  %sp3753 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2802
  store i256 %2801, ptr %sp3753, align 16
  br label %OP1052.SWAP1, !annotation !5

OP1052.SWAP1:                                     ; preds = %OP1051.ADD
  %stack_len3754 = load i64, ptr %len.addr, align 8
  %2803 = sub i64 %stack_len3754, 1
  %sp3755 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2803
  %swap.a3756 = load i256, ptr %sp3755, align 16
  %2804 = sub i64 %stack_len3754, 2
  %sp3757 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2804
  %swap.b3758 = load i256, ptr %sp3757, align 16
  store i256 %swap.a3756, ptr %sp3757, align 16
  store i256 %swap.b3758, ptr %sp3755, align 16
  br label %OP1053.DUP2, !annotation !5

OP1053.DUP2:                                      ; preds = %OP1052.SWAP1
  %stack_len3759 = load i64, ptr %len.addr, align 8
  %2805 = add i64 %stack_len3759, 1
  store i64 %2805, ptr %len.addr, align 8
  %2806 = sub i64 %stack_len3759, 2
  %sp3760 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2806
  %dup23761 = load i256, ptr %sp3760, align 16
  %sp3762 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3759
  store i256 %dup23761, ptr %sp3762, align 16
  br label %OP1054.MSTORE, !annotation !5

OP1054.MSTORE:                                    ; preds = %OP1053.DUP2
  %stack_len3763 = load i64, ptr %len.addr, align 8
  %2807 = add i64 %stack_len3763, -2
  store i64 %2807, ptr %len.addr, align 8
  %2808 = add i64 %stack_len3763, -1
  %sp3764 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2808
  %a3765 = load i256, ptr %sp3764, align 16
  %2809 = add i64 %stack_len3763, -2
  %sp3766 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2809
  %b3767 = load i256, ptr %sp3766, align 16
  %2810 = call i8 @__revmc_ir_builtin_mstore(i256 %a3765, i256 %b3767, ptr %arg.ecx.addr)
  %2811 = icmp ne i8 %2810, 0
  br i1 %2811, label %return, label %OP1054.MSTORE.contd, !prof !2

OP1054.MSTORE.contd:                              ; preds = %OP1054.MSTORE
  br label %OP1055.PUSH1, !annotation !5

OP1055.PUSH1:                                     ; preds = %OP1054.MSTORE.contd
  %stack_len3768 = load i64, ptr %len.addr, align 8
  %2812 = add i64 %stack_len3768, 1
  store i64 %2812, ptr %len.addr, align 8
  %sp3769 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3768
  store i256 32, ptr %sp3769, align 16
  br label %OP1056.ADD, !annotation !5

OP1056.ADD:                                       ; preds = %OP1055.PUSH1
  %stack_len3770 = load i64, ptr %len.addr, align 8
  %2813 = add i64 %stack_len3770, -1
  store i64 %2813, ptr %len.addr, align 8
  %2814 = add i64 %stack_len3770, -1
  %sp3771 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2814
  %a3772 = load i256, ptr %sp3771, align 16
  %2815 = add i64 %stack_len3770, -2
  %sp3773 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2815
  %b3774 = load i256, ptr %sp3773, align 16
  %2816 = add i256 %a3772, %b3774
  %2817 = add i64 %stack_len3770, -2
  %sp3775 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2817
  store i256 %2816, ptr %sp3775, align 16
  br label %OP1057.PUSH1, !annotation !5

OP1057.PUSH1:                                     ; preds = %OP1056.ADD
  %stack_len3776 = load i64, ptr %len.addr, align 8
  %2818 = add i64 %stack_len3776, 1
  store i64 %2818, ptr %len.addr, align 8
  %sp3777 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3776
  store i256 0, ptr %sp3777, align 16
  br label %OP1058.KECCAK256, !annotation !5

OP1058.KECCAK256:                                 ; preds = %OP1057.PUSH1
  %stack_len3778 = load i64, ptr %len.addr, align 8
  %2819 = add i64 %stack_len3778, -1
  store i64 %2819, ptr %len.addr, align 8
  %2820 = sub i64 %stack_len3778, 2
  %sp3779 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2820
  %2821 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3779)
  %2822 = icmp ne i8 %2821, 0
  br i1 %2822, label %return, label %OP1058.KECCAK256.contd, !prof !2

OP1058.KECCAK256.contd:                           ; preds = %OP1058.KECCAK256
  br label %OP1059.PUSH1, !annotation !5

OP1059.PUSH1:                                     ; preds = %OP1058.KECCAK256.contd
  %stack_len3780 = load i64, ptr %len.addr, align 8
  %2823 = add i64 %stack_len3780, 1
  store i64 %2823, ptr %len.addr, align 8
  %sp3781 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3780
  store i256 0, ptr %sp3781, align 16
  br label %OP1060.CALLER, !annotation !5

OP1060.CALLER:                                    ; preds = %OP1059.PUSH1
  %stack_len3782 = load i64, ptr %len.addr, align 8
  %2824 = add i64 %stack_len3782, 1
  store i64 %2824, ptr %len.addr, align 8
  %contract.caller.addr3783 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3784 = load i160, ptr %contract.caller.addr3783, align 16
  %2825 = call i160 @llvm.bswap.i160(i160 %contract.caller3784)
  %2826 = zext i160 %2825 to i256
  %sp3785 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3782
  store i256 %2826, ptr %sp3785, align 16
  br label %OP1061.PUSH20, !annotation !5

OP1061.PUSH20:                                    ; preds = %OP1060.CALLER
  %stack_len3786 = load i64, ptr %len.addr, align 8
  %2827 = add i64 %stack_len3786, 1
  store i64 %2827, ptr %len.addr, align 8
  %sp3787 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3786
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3787, align 16
  br label %OP1062.AND, !annotation !5

OP1062.AND:                                       ; preds = %OP1061.PUSH20
  %stack_len3788 = load i64, ptr %len.addr, align 8
  %2828 = add i64 %stack_len3788, -1
  store i64 %2828, ptr %len.addr, align 8
  %2829 = add i64 %stack_len3788, -1
  %sp3789 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2829
  %a3790 = load i256, ptr %sp3789, align 16
  %2830 = add i64 %stack_len3788, -2
  %sp3791 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2830
  %b3792 = load i256, ptr %sp3791, align 16
  %2831 = and i256 %a3790, %b3792
  %2832 = add i64 %stack_len3788, -2
  %sp3793 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2832
  store i256 %2831, ptr %sp3793, align 16
  br label %OP1063.PUSH20, !annotation !5

OP1063.PUSH20:                                    ; preds = %OP1062.AND
  %stack_len3794 = load i64, ptr %len.addr, align 8
  %2833 = add i64 %stack_len3794, 1
  store i64 %2833, ptr %len.addr, align 8
  %sp3795 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3794
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3795, align 16
  br label %OP1064.AND, !annotation !5

OP1064.AND:                                       ; preds = %OP1063.PUSH20
  %stack_len3796 = load i64, ptr %len.addr, align 8
  %2834 = add i64 %stack_len3796, -1
  store i64 %2834, ptr %len.addr, align 8
  %2835 = add i64 %stack_len3796, -1
  %sp3797 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2835
  %a3798 = load i256, ptr %sp3797, align 16
  %2836 = add i64 %stack_len3796, -2
  %sp3799 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2836
  %b3800 = load i256, ptr %sp3799, align 16
  %2837 = and i256 %a3798, %b3800
  %2838 = add i64 %stack_len3796, -2
  %sp3801 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2838
  store i256 %2837, ptr %sp3801, align 16
  br label %OP1065.DUP2, !annotation !5

OP1065.DUP2:                                      ; preds = %OP1064.AND
  %stack_len3802 = load i64, ptr %len.addr, align 8
  %2839 = add i64 %stack_len3802, 1
  store i64 %2839, ptr %len.addr, align 8
  %2840 = sub i64 %stack_len3802, 2
  %sp3803 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2840
  %dup23804 = load i256, ptr %sp3803, align 16
  %sp3805 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3802
  store i256 %dup23804, ptr %sp3805, align 16
  br label %OP1066.MSTORE, !annotation !5

OP1066.MSTORE:                                    ; preds = %OP1065.DUP2
  %stack_len3806 = load i64, ptr %len.addr, align 8
  %2841 = add i64 %stack_len3806, -2
  store i64 %2841, ptr %len.addr, align 8
  %2842 = add i64 %stack_len3806, -1
  %sp3807 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2842
  %a3808 = load i256, ptr %sp3807, align 16
  %2843 = add i64 %stack_len3806, -2
  %sp3809 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2843
  %b3810 = load i256, ptr %sp3809, align 16
  %2844 = call i8 @__revmc_ir_builtin_mstore(i256 %a3808, i256 %b3810, ptr %arg.ecx.addr)
  %2845 = icmp ne i8 %2844, 0
  br i1 %2845, label %return, label %OP1066.MSTORE.contd, !prof !2

OP1066.MSTORE.contd:                              ; preds = %OP1066.MSTORE
  br label %OP1067.PUSH1, !annotation !5

OP1067.PUSH1:                                     ; preds = %OP1066.MSTORE.contd
  %stack_len3811 = load i64, ptr %len.addr, align 8
  %2846 = add i64 %stack_len3811, 1
  store i64 %2846, ptr %len.addr, align 8
  %sp3812 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3811
  store i256 32, ptr %sp3812, align 16
  br label %OP1068.ADD, !annotation !5

OP1068.ADD:                                       ; preds = %OP1067.PUSH1
  %stack_len3813 = load i64, ptr %len.addr, align 8
  %2847 = add i64 %stack_len3813, -1
  store i64 %2847, ptr %len.addr, align 8
  %2848 = add i64 %stack_len3813, -1
  %sp3814 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2848
  %a3815 = load i256, ptr %sp3814, align 16
  %2849 = add i64 %stack_len3813, -2
  %sp3816 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2849
  %b3817 = load i256, ptr %sp3816, align 16
  %2850 = add i256 %a3815, %b3817
  %2851 = add i64 %stack_len3813, -2
  %sp3818 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2851
  store i256 %2850, ptr %sp3818, align 16
  br label %OP1069.SWAP1, !annotation !5

OP1069.SWAP1:                                     ; preds = %OP1068.ADD
  %stack_len3819 = load i64, ptr %len.addr, align 8
  %2852 = sub i64 %stack_len3819, 1
  %sp3820 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2852
  %swap.a3821 = load i256, ptr %sp3820, align 16
  %2853 = sub i64 %stack_len3819, 2
  %sp3822 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2853
  %swap.b3823 = load i256, ptr %sp3822, align 16
  store i256 %swap.a3821, ptr %sp3822, align 16
  store i256 %swap.b3823, ptr %sp3820, align 16
  br label %OP1070.DUP2, !annotation !5

OP1070.DUP2:                                      ; preds = %OP1069.SWAP1
  %stack_len3824 = load i64, ptr %len.addr, align 8
  %2854 = add i64 %stack_len3824, 1
  store i64 %2854, ptr %len.addr, align 8
  %2855 = sub i64 %stack_len3824, 2
  %sp3825 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2855
  %dup23826 = load i256, ptr %sp3825, align 16
  %sp3827 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3824
  store i256 %dup23826, ptr %sp3827, align 16
  br label %OP1071.MSTORE, !annotation !5

OP1071.MSTORE:                                    ; preds = %OP1070.DUP2
  %stack_len3828 = load i64, ptr %len.addr, align 8
  %2856 = add i64 %stack_len3828, -2
  store i64 %2856, ptr %len.addr, align 8
  %2857 = add i64 %stack_len3828, -1
  %sp3829 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2857
  %a3830 = load i256, ptr %sp3829, align 16
  %2858 = add i64 %stack_len3828, -2
  %sp3831 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2858
  %b3832 = load i256, ptr %sp3831, align 16
  %2859 = call i8 @__revmc_ir_builtin_mstore(i256 %a3830, i256 %b3832, ptr %arg.ecx.addr)
  %2860 = icmp ne i8 %2859, 0
  br i1 %2860, label %return, label %OP1071.MSTORE.contd, !prof !2

OP1071.MSTORE.contd:                              ; preds = %OP1071.MSTORE
  br label %OP1072.PUSH1, !annotation !5

OP1072.PUSH1:                                     ; preds = %OP1071.MSTORE.contd
  %stack_len3833 = load i64, ptr %len.addr, align 8
  %2861 = add i64 %stack_len3833, 1
  store i64 %2861, ptr %len.addr, align 8
  %sp3834 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3833
  store i256 32, ptr %sp3834, align 16
  br label %OP1073.ADD, !annotation !5

OP1073.ADD:                                       ; preds = %OP1072.PUSH1
  %stack_len3835 = load i64, ptr %len.addr, align 8
  %2862 = add i64 %stack_len3835, -1
  store i64 %2862, ptr %len.addr, align 8
  %2863 = add i64 %stack_len3835, -1
  %sp3836 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2863
  %a3837 = load i256, ptr %sp3836, align 16
  %2864 = add i64 %stack_len3835, -2
  %sp3838 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2864
  %b3839 = load i256, ptr %sp3838, align 16
  %2865 = add i256 %a3837, %b3839
  %2866 = add i64 %stack_len3835, -2
  %sp3840 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2866
  store i256 %2865, ptr %sp3840, align 16
  br label %OP1074.PUSH1, !annotation !5

OP1074.PUSH1:                                     ; preds = %OP1073.ADD
  %stack_len3841 = load i64, ptr %len.addr, align 8
  %2867 = add i64 %stack_len3841, 1
  store i64 %2867, ptr %len.addr, align 8
  %sp3842 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3841
  store i256 0, ptr %sp3842, align 16
  br label %OP1075.KECCAK256, !annotation !5

OP1075.KECCAK256:                                 ; preds = %OP1074.PUSH1
  %stack_len3843 = load i64, ptr %len.addr, align 8
  %2868 = add i64 %stack_len3843, -1
  store i64 %2868, ptr %len.addr, align 8
  %2869 = sub i64 %stack_len3843, 2
  %sp3844 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2869
  %2870 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3844)
  %2871 = icmp ne i8 %2870, 0
  br i1 %2871, label %return, label %OP1075.KECCAK256.contd, !prof !2

OP1075.KECCAK256.contd:                           ; preds = %OP1075.KECCAK256
  br label %OP1076.SLOAD, !annotation !5

OP1076.SLOAD:                                     ; preds = %OP1075.KECCAK256.contd
  %stack_len3845 = load i64, ptr %len.addr, align 8
  %2872 = sub i64 %stack_len3845, 1
  %sp3846 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2872
  %2873 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp3846, i8 19)
  %2874 = icmp ne i8 %2873, 0
  br i1 %2874, label %return, label %OP1076.SLOAD.contd, !prof !2

OP1076.SLOAD.contd:                               ; preds = %OP1076.SLOAD
  br label %OP1077.LT, !annotation !5

OP1077.LT:                                        ; preds = %OP1076.SLOAD.contd
  %stack_len3847 = load i64, ptr %len.addr, align 8
  %2875 = add i64 %stack_len3847, -1
  store i64 %2875, ptr %len.addr, align 8
  %2876 = add i64 %stack_len3847, -1
  %sp3848 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2876
  %a3849 = load i256, ptr %sp3848, align 16
  %2877 = add i64 %stack_len3847, -2
  %sp3850 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2877
  %b3851 = load i256, ptr %sp3850, align 16
  %2878 = icmp ult i256 %a3849, %b3851
  %2879 = zext i1 %2878 to i256
  %2880 = add i64 %stack_len3847, -2
  %sp3852 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2880
  store i256 %2879, ptr %sp3852, align 16
  br label %OP1078.ISZERO, !annotation !5

OP1078.ISZERO:                                    ; preds = %OP1077.LT
  %stack_len3853 = load i64, ptr %len.addr, align 8
  %2881 = add i64 %stack_len3853, -1
  %sp3854 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2881
  %a3855 = load i256, ptr %sp3854, align 16
  %2882 = icmp eq i256 %a3855, 0
  %2883 = zext i1 %2882 to i256
  %2884 = add i64 %stack_len3853, -1
  %sp3856 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2884
  store i256 %2883, ptr %sp3856, align 16
  br label %OP1079.ISZERO, !annotation !5

OP1079.ISZERO:                                    ; preds = %OP1078.ISZERO
  %stack_len3857 = load i64, ptr %len.addr, align 8
  %2885 = add i64 %stack_len3857, -1
  %sp3858 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2885
  %a3859 = load i256, ptr %sp3858, align 16
  %2886 = icmp eq i256 %a3859, 0
  %2887 = zext i1 %2886 to i256
  %2888 = add i64 %stack_len3857, -1
  %sp3860 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2888
  store i256 %2887, ptr %sp3860, align 16
  br label %OP1080.ISZERO, !annotation !5

OP1080.ISZERO:                                    ; preds = %OP1079.ISZERO
  %stack_len3861 = load i64, ptr %len.addr, align 8
  %2889 = add i64 %stack_len3861, -1
  %sp3862 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2889
  %a3863 = load i256, ptr %sp3862, align 16
  %2890 = icmp eq i256 %a3863, 0
  %2891 = zext i1 %2890 to i256
  %2892 = add i64 %stack_len3861, -1
  %sp3864 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2892
  store i256 %2891, ptr %sp3864, align 16
  br label %OP1081.PUSH2, !annotation !5

OP1081.PUSH2:                                     ; preds = %OP1080.ISZERO
  br label %OP1082.JUMPI, !annotation !6

OP1082.JUMPI:                                     ; preds = %OP1081.PUSH2
  %stack_len3865 = load i64, ptr %len.addr, align 8
  %2893 = add i64 %stack_len3865, -1
  store i64 %2893, ptr %len.addr, align 8
  %2894 = add i64 %stack_len3865, -1
  %sp3866 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2894
  %a3867 = load i256, ptr %sp3866, align 16
  %2895 = icmp ne i256 %a3867, 0
  br i1 %2895, label %OP1086.JUMPDEST, label %OP1083.PUSH1

OP1083.PUSH1:                                     ; preds = %OP1082.JUMPI
  %gas.remaining3868 = load i64, ptr %gas.remaining.addr, align 8
  %2896 = sub i64 %gas.remaining3868, 6
  %2897 = icmp ult i64 %gas.remaining3868, 6
  store i64 %2896, ptr %gas.remaining.addr, align 8
  br i1 %2897, label %return, label %OP1083.PUSH1.contd, !prof !2, !annotation !3

OP1083.PUSH1.contd:                               ; preds = %OP1083.PUSH1
  %stack_len3869 = load i64, ptr %len.addr, align 8
  %2898 = icmp ugt i64 %stack_len3869, 1022
  br i1 %2898, label %return, label %OP1083.PUSH1.contd3870, !prof !2, !annotation !4

OP1083.PUSH1.contd3870:                           ; preds = %OP1083.PUSH1.contd
  %2899 = add i64 %stack_len3869, 1
  store i64 %2899, ptr %len.addr, align 8
  %sp3871 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3869
  store i256 0, ptr %sp3871, align 16
  br label %OP1084.DUP1, !annotation !5

OP1084.DUP1:                                      ; preds = %OP1083.PUSH1.contd3870
  %stack_len3872 = load i64, ptr %len.addr, align 8
  %2900 = add i64 %stack_len3872, 1
  store i64 %2900, ptr %len.addr, align 8
  %2901 = sub i64 %stack_len3872, 1
  %sp3873 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2901
  %dup13874 = load i256, ptr %sp3873, align 16
  %sp3875 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3872
  store i256 %dup13874, ptr %sp3875, align 16
  br label %OP1085.REVERT, !annotation !5

OP1085.REVERT:                                    ; preds = %OP1084.DUP1
  %stack_len3876 = load i64, ptr %len.addr, align 8
  %2902 = add i64 %stack_len3876, -2
  store i64 %2902, ptr %len.addr, align 8
  %2903 = sub i64 %stack_len3876, 2
  %sp3877 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2903
  %2904 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp3877, i8 16)
  %2905 = icmp ne i8 %2904, 0
  br i1 %2905, label %return, label %OP1085.REVERT.contd, !prof !2

OP1085.REVERT.contd:                              ; preds = %OP1085.REVERT
  br label %return, !annotation !8

OP1086.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1082.JUMPI
  %gas.remaining3878 = load i64, ptr %gas.remaining.addr, align 8
  %2906 = sub i64 %gas.remaining3878, 187
  %2907 = icmp ult i64 %gas.remaining3878, 187
  store i64 %2906, ptr %gas.remaining.addr, align 8
  br i1 %2907, label %return, label %OP1086.JUMPDEST.contd, !prof !2, !annotation !3

OP1086.JUMPDEST.contd:                            ; preds = %OP1086.JUMPDEST
  %stack_len3879 = load i64, ptr %len.addr, align 8
  %2908 = icmp ult i64 %stack_len3879, 4
  %2909 = icmp ugt i64 %stack_len3879, 1019
  %2910 = or i1 %2908, %2909
  %2911 = select i1 %2908, i8 91, i8 92
  br i1 %2910, label %return, label %OP1086.JUMPDEST.contd3880, !prof !2

OP1086.JUMPDEST.contd3880:                        ; preds = %OP1086.JUMPDEST.contd
  br label %OP1087.DUP2, !annotation !5

OP1087.DUP2:                                      ; preds = %OP1086.JUMPDEST.contd3880
  %stack_len3881 = load i64, ptr %len.addr, align 8
  %2912 = add i64 %stack_len3881, 1
  store i64 %2912, ptr %len.addr, align 8
  %2913 = sub i64 %stack_len3881, 2
  %sp3882 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2913
  %dup23883 = load i256, ptr %sp3882, align 16
  %sp3884 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3881
  store i256 %dup23883, ptr %sp3884, align 16
  br label %OP1088.PUSH1, !annotation !5

OP1088.PUSH1:                                     ; preds = %OP1087.DUP2
  %stack_len3885 = load i64, ptr %len.addr, align 8
  %2914 = add i64 %stack_len3885, 1
  store i64 %2914, ptr %len.addr, align 8
  %sp3886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3885
  store i256 4, ptr %sp3886, align 16
  br label %OP1089.PUSH1, !annotation !5

OP1089.PUSH1:                                     ; preds = %OP1088.PUSH1
  %stack_len3887 = load i64, ptr %len.addr, align 8
  %2915 = add i64 %stack_len3887, 1
  store i64 %2915, ptr %len.addr, align 8
  %sp3888 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3887
  store i256 0, ptr %sp3888, align 16
  br label %OP1090.DUP7, !annotation !5

OP1090.DUP7:                                      ; preds = %OP1089.PUSH1
  %stack_len3889 = load i64, ptr %len.addr, align 8
  %2916 = add i64 %stack_len3889, 1
  store i64 %2916, ptr %len.addr, align 8
  %2917 = sub i64 %stack_len3889, 7
  %sp3890 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2917
  %dup73891 = load i256, ptr %sp3890, align 16
  %sp3892 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3889
  store i256 %dup73891, ptr %sp3892, align 16
  br label %OP1091.PUSH20, !annotation !5

OP1091.PUSH20:                                    ; preds = %OP1090.DUP7
  %stack_len3893 = load i64, ptr %len.addr, align 8
  %2918 = add i64 %stack_len3893, 1
  store i64 %2918, ptr %len.addr, align 8
  %sp3894 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3893
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3894, align 16
  br label %OP1092.AND, !annotation !5

OP1092.AND:                                       ; preds = %OP1091.PUSH20
  %stack_len3895 = load i64, ptr %len.addr, align 8
  %2919 = add i64 %stack_len3895, -1
  store i64 %2919, ptr %len.addr, align 8
  %2920 = add i64 %stack_len3895, -1
  %sp3896 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2920
  %a3897 = load i256, ptr %sp3896, align 16
  %2921 = add i64 %stack_len3895, -2
  %sp3898 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2921
  %b3899 = load i256, ptr %sp3898, align 16
  %2922 = and i256 %a3897, %b3899
  %2923 = add i64 %stack_len3895, -2
  %sp3900 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2923
  store i256 %2922, ptr %sp3900, align 16
  br label %OP1093.PUSH20, !annotation !5

OP1093.PUSH20:                                    ; preds = %OP1092.AND
  %stack_len3901 = load i64, ptr %len.addr, align 8
  %2924 = add i64 %stack_len3901, 1
  store i64 %2924, ptr %len.addr, align 8
  %sp3902 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3901
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3902, align 16
  br label %OP1094.AND, !annotation !5

OP1094.AND:                                       ; preds = %OP1093.PUSH20
  %stack_len3903 = load i64, ptr %len.addr, align 8
  %2925 = add i64 %stack_len3903, -1
  store i64 %2925, ptr %len.addr, align 8
  %2926 = add i64 %stack_len3903, -1
  %sp3904 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2926
  %a3905 = load i256, ptr %sp3904, align 16
  %2927 = add i64 %stack_len3903, -2
  %sp3906 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2927
  %b3907 = load i256, ptr %sp3906, align 16
  %2928 = and i256 %a3905, %b3907
  %2929 = add i64 %stack_len3903, -2
  %sp3908 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2929
  store i256 %2928, ptr %sp3908, align 16
  br label %OP1095.DUP2, !annotation !5

OP1095.DUP2:                                      ; preds = %OP1094.AND
  %stack_len3909 = load i64, ptr %len.addr, align 8
  %2930 = add i64 %stack_len3909, 1
  store i64 %2930, ptr %len.addr, align 8
  %2931 = sub i64 %stack_len3909, 2
  %sp3910 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2931
  %dup23911 = load i256, ptr %sp3910, align 16
  %sp3912 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3909
  store i256 %dup23911, ptr %sp3912, align 16
  br label %OP1096.MSTORE, !annotation !5

OP1096.MSTORE:                                    ; preds = %OP1095.DUP2
  %stack_len3913 = load i64, ptr %len.addr, align 8
  %2932 = add i64 %stack_len3913, -2
  store i64 %2932, ptr %len.addr, align 8
  %2933 = add i64 %stack_len3913, -1
  %sp3914 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2933
  %a3915 = load i256, ptr %sp3914, align 16
  %2934 = add i64 %stack_len3913, -2
  %sp3916 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2934
  %b3917 = load i256, ptr %sp3916, align 16
  %2935 = call i8 @__revmc_ir_builtin_mstore(i256 %a3915, i256 %b3917, ptr %arg.ecx.addr)
  %2936 = icmp ne i8 %2935, 0
  br i1 %2936, label %return, label %OP1096.MSTORE.contd, !prof !2

OP1096.MSTORE.contd:                              ; preds = %OP1096.MSTORE
  br label %OP1097.PUSH1, !annotation !5

OP1097.PUSH1:                                     ; preds = %OP1096.MSTORE.contd
  %stack_len3918 = load i64, ptr %len.addr, align 8
  %2937 = add i64 %stack_len3918, 1
  store i64 %2937, ptr %len.addr, align 8
  %sp3919 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3918
  store i256 32, ptr %sp3919, align 16
  br label %OP1098.ADD, !annotation !5

OP1098.ADD:                                       ; preds = %OP1097.PUSH1
  %stack_len3920 = load i64, ptr %len.addr, align 8
  %2938 = add i64 %stack_len3920, -1
  store i64 %2938, ptr %len.addr, align 8
  %2939 = add i64 %stack_len3920, -1
  %sp3921 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2939
  %a3922 = load i256, ptr %sp3921, align 16
  %2940 = add i64 %stack_len3920, -2
  %sp3923 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2940
  %b3924 = load i256, ptr %sp3923, align 16
  %2941 = add i256 %a3922, %b3924
  %2942 = add i64 %stack_len3920, -2
  %sp3925 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2942
  store i256 %2941, ptr %sp3925, align 16
  br label %OP1099.SWAP1, !annotation !5

OP1099.SWAP1:                                     ; preds = %OP1098.ADD
  %stack_len3926 = load i64, ptr %len.addr, align 8
  %2943 = sub i64 %stack_len3926, 1
  %sp3927 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2943
  %swap.a3928 = load i256, ptr %sp3927, align 16
  %2944 = sub i64 %stack_len3926, 2
  %sp3929 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2944
  %swap.b3930 = load i256, ptr %sp3929, align 16
  store i256 %swap.a3928, ptr %sp3929, align 16
  store i256 %swap.b3930, ptr %sp3927, align 16
  br label %OP1100.DUP2, !annotation !5

OP1100.DUP2:                                      ; preds = %OP1099.SWAP1
  %stack_len3931 = load i64, ptr %len.addr, align 8
  %2945 = add i64 %stack_len3931, 1
  store i64 %2945, ptr %len.addr, align 8
  %2946 = sub i64 %stack_len3931, 2
  %sp3932 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2946
  %dup23933 = load i256, ptr %sp3932, align 16
  %sp3934 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3931
  store i256 %dup23933, ptr %sp3934, align 16
  br label %OP1101.MSTORE, !annotation !5

OP1101.MSTORE:                                    ; preds = %OP1100.DUP2
  %stack_len3935 = load i64, ptr %len.addr, align 8
  %2947 = add i64 %stack_len3935, -2
  store i64 %2947, ptr %len.addr, align 8
  %2948 = add i64 %stack_len3935, -1
  %sp3936 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2948
  %a3937 = load i256, ptr %sp3936, align 16
  %2949 = add i64 %stack_len3935, -2
  %sp3938 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2949
  %b3939 = load i256, ptr %sp3938, align 16
  %2950 = call i8 @__revmc_ir_builtin_mstore(i256 %a3937, i256 %b3939, ptr %arg.ecx.addr)
  %2951 = icmp ne i8 %2950, 0
  br i1 %2951, label %return, label %OP1101.MSTORE.contd, !prof !2

OP1101.MSTORE.contd:                              ; preds = %OP1101.MSTORE
  br label %OP1102.PUSH1, !annotation !5

OP1102.PUSH1:                                     ; preds = %OP1101.MSTORE.contd
  %stack_len3940 = load i64, ptr %len.addr, align 8
  %2952 = add i64 %stack_len3940, 1
  store i64 %2952, ptr %len.addr, align 8
  %sp3941 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3940
  store i256 32, ptr %sp3941, align 16
  br label %OP1103.ADD, !annotation !5

OP1103.ADD:                                       ; preds = %OP1102.PUSH1
  %stack_len3942 = load i64, ptr %len.addr, align 8
  %2953 = add i64 %stack_len3942, -1
  store i64 %2953, ptr %len.addr, align 8
  %2954 = add i64 %stack_len3942, -1
  %sp3943 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2954
  %a3944 = load i256, ptr %sp3943, align 16
  %2955 = add i64 %stack_len3942, -2
  %sp3945 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2955
  %b3946 = load i256, ptr %sp3945, align 16
  %2956 = add i256 %a3944, %b3946
  %2957 = add i64 %stack_len3942, -2
  %sp3947 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2957
  store i256 %2956, ptr %sp3947, align 16
  br label %OP1104.PUSH1, !annotation !5

OP1104.PUSH1:                                     ; preds = %OP1103.ADD
  %stack_len3948 = load i64, ptr %len.addr, align 8
  %2958 = add i64 %stack_len3948, 1
  store i64 %2958, ptr %len.addr, align 8
  %sp3949 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3948
  store i256 0, ptr %sp3949, align 16
  br label %OP1105.KECCAK256, !annotation !5

OP1105.KECCAK256:                                 ; preds = %OP1104.PUSH1
  %stack_len3950 = load i64, ptr %len.addr, align 8
  %2959 = add i64 %stack_len3950, -1
  store i64 %2959, ptr %len.addr, align 8
  %2960 = sub i64 %stack_len3950, 2
  %sp3951 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2960
  %2961 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp3951)
  %2962 = icmp ne i8 %2961, 0
  br i1 %2962, label %return, label %OP1105.KECCAK256.contd, !prof !2

OP1105.KECCAK256.contd:                           ; preds = %OP1105.KECCAK256
  br label %OP1106.PUSH1, !annotation !5

OP1106.PUSH1:                                     ; preds = %OP1105.KECCAK256.contd
  %stack_len3952 = load i64, ptr %len.addr, align 8
  %2963 = add i64 %stack_len3952, 1
  store i64 %2963, ptr %len.addr, align 8
  %sp3953 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3952
  store i256 0, ptr %sp3953, align 16
  br label %OP1107.CALLER, !annotation !5

OP1107.CALLER:                                    ; preds = %OP1106.PUSH1
  %stack_len3954 = load i64, ptr %len.addr, align 8
  %2964 = add i64 %stack_len3954, 1
  store i64 %2964, ptr %len.addr, align 8
  %contract.caller.addr3955 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3956 = load i160, ptr %contract.caller.addr3955, align 16
  %2965 = call i160 @llvm.bswap.i160(i160 %contract.caller3956)
  %2966 = zext i160 %2965 to i256
  %sp3957 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3954
  store i256 %2966, ptr %sp3957, align 16
  br label %OP1108.PUSH20, !annotation !5

OP1108.PUSH20:                                    ; preds = %OP1107.CALLER
  %stack_len3958 = load i64, ptr %len.addr, align 8
  %2967 = add i64 %stack_len3958, 1
  store i64 %2967, ptr %len.addr, align 8
  %sp3959 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3958
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3959, align 16
  br label %OP1109.AND, !annotation !5

OP1109.AND:                                       ; preds = %OP1108.PUSH20
  %stack_len3960 = load i64, ptr %len.addr, align 8
  %2968 = add i64 %stack_len3960, -1
  store i64 %2968, ptr %len.addr, align 8
  %2969 = add i64 %stack_len3960, -1
  %sp3961 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2969
  %a3962 = load i256, ptr %sp3961, align 16
  %2970 = add i64 %stack_len3960, -2
  %sp3963 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2970
  %b3964 = load i256, ptr %sp3963, align 16
  %2971 = and i256 %a3962, %b3964
  %2972 = add i64 %stack_len3960, -2
  %sp3965 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2972
  store i256 %2971, ptr %sp3965, align 16
  br label %OP1110.PUSH20, !annotation !5

OP1110.PUSH20:                                    ; preds = %OP1109.AND
  %stack_len3966 = load i64, ptr %len.addr, align 8
  %2973 = add i64 %stack_len3966, 1
  store i64 %2973, ptr %len.addr, align 8
  %sp3967 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3966
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3967, align 16
  br label %OP1111.AND, !annotation !5

OP1111.AND:                                       ; preds = %OP1110.PUSH20
  %stack_len3968 = load i64, ptr %len.addr, align 8
  %2974 = add i64 %stack_len3968, -1
  store i64 %2974, ptr %len.addr, align 8
  %2975 = add i64 %stack_len3968, -1
  %sp3969 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2975
  %a3970 = load i256, ptr %sp3969, align 16
  %2976 = add i64 %stack_len3968, -2
  %sp3971 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2976
  %b3972 = load i256, ptr %sp3971, align 16
  %2977 = and i256 %a3970, %b3972
  %2978 = add i64 %stack_len3968, -2
  %sp3973 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2978
  store i256 %2977, ptr %sp3973, align 16
  br label %OP1112.DUP2, !annotation !5

OP1112.DUP2:                                      ; preds = %OP1111.AND
  %stack_len3974 = load i64, ptr %len.addr, align 8
  %2979 = add i64 %stack_len3974, 1
  store i64 %2979, ptr %len.addr, align 8
  %2980 = sub i64 %stack_len3974, 2
  %sp3975 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2980
  %dup23976 = load i256, ptr %sp3975, align 16
  %sp3977 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3974
  store i256 %dup23976, ptr %sp3977, align 16
  br label %OP1113.MSTORE, !annotation !5

OP1113.MSTORE:                                    ; preds = %OP1112.DUP2
  %stack_len3978 = load i64, ptr %len.addr, align 8
  %2981 = add i64 %stack_len3978, -2
  store i64 %2981, ptr %len.addr, align 8
  %2982 = add i64 %stack_len3978, -1
  %sp3979 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2982
  %a3980 = load i256, ptr %sp3979, align 16
  %2983 = add i64 %stack_len3978, -2
  %sp3981 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2983
  %b3982 = load i256, ptr %sp3981, align 16
  %2984 = call i8 @__revmc_ir_builtin_mstore(i256 %a3980, i256 %b3982, ptr %arg.ecx.addr)
  %2985 = icmp ne i8 %2984, 0
  br i1 %2985, label %return, label %OP1113.MSTORE.contd, !prof !2

OP1113.MSTORE.contd:                              ; preds = %OP1113.MSTORE
  br label %OP1114.PUSH1, !annotation !5

OP1114.PUSH1:                                     ; preds = %OP1113.MSTORE.contd
  %stack_len3983 = load i64, ptr %len.addr, align 8
  %2986 = add i64 %stack_len3983, 1
  store i64 %2986, ptr %len.addr, align 8
  %sp3984 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3983
  store i256 32, ptr %sp3984, align 16
  br label %OP1115.ADD, !annotation !5

OP1115.ADD:                                       ; preds = %OP1114.PUSH1
  %stack_len3985 = load i64, ptr %len.addr, align 8
  %2987 = add i64 %stack_len3985, -1
  store i64 %2987, ptr %len.addr, align 8
  %2988 = add i64 %stack_len3985, -1
  %sp3986 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2988
  %a3987 = load i256, ptr %sp3986, align 16
  %2989 = add i64 %stack_len3985, -2
  %sp3988 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2989
  %b3989 = load i256, ptr %sp3988, align 16
  %2990 = add i256 %a3987, %b3989
  %2991 = add i64 %stack_len3985, -2
  %sp3990 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2991
  store i256 %2990, ptr %sp3990, align 16
  br label %OP1116.SWAP1, !annotation !5

OP1116.SWAP1:                                     ; preds = %OP1115.ADD
  %stack_len3991 = load i64, ptr %len.addr, align 8
  %2992 = sub i64 %stack_len3991, 1
  %sp3992 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2992
  %swap.a3993 = load i256, ptr %sp3992, align 16
  %2993 = sub i64 %stack_len3991, 2
  %sp3994 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2993
  %swap.b3995 = load i256, ptr %sp3994, align 16
  store i256 %swap.a3993, ptr %sp3994, align 16
  store i256 %swap.b3995, ptr %sp3992, align 16
  br label %OP1117.DUP2, !annotation !5

OP1117.DUP2:                                      ; preds = %OP1116.SWAP1
  %stack_len3996 = load i64, ptr %len.addr, align 8
  %2994 = add i64 %stack_len3996, 1
  store i64 %2994, ptr %len.addr, align 8
  %2995 = sub i64 %stack_len3996, 2
  %sp3997 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2995
  %dup23998 = load i256, ptr %sp3997, align 16
  %sp3999 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len3996
  store i256 %dup23998, ptr %sp3999, align 16
  br label %OP1118.MSTORE, !annotation !5

OP1118.MSTORE:                                    ; preds = %OP1117.DUP2
  %stack_len4000 = load i64, ptr %len.addr, align 8
  %2996 = add i64 %stack_len4000, -2
  store i64 %2996, ptr %len.addr, align 8
  %2997 = add i64 %stack_len4000, -1
  %sp4001 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2997
  %a4002 = load i256, ptr %sp4001, align 16
  %2998 = add i64 %stack_len4000, -2
  %sp4003 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %2998
  %b4004 = load i256, ptr %sp4003, align 16
  %2999 = call i8 @__revmc_ir_builtin_mstore(i256 %a4002, i256 %b4004, ptr %arg.ecx.addr)
  %3000 = icmp ne i8 %2999, 0
  br i1 %3000, label %return, label %OP1118.MSTORE.contd, !prof !2

OP1118.MSTORE.contd:                              ; preds = %OP1118.MSTORE
  br label %OP1119.PUSH1, !annotation !5

OP1119.PUSH1:                                     ; preds = %OP1118.MSTORE.contd
  %stack_len4005 = load i64, ptr %len.addr, align 8
  %3001 = add i64 %stack_len4005, 1
  store i64 %3001, ptr %len.addr, align 8
  %sp4006 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4005
  store i256 32, ptr %sp4006, align 16
  br label %OP1120.ADD, !annotation !5

OP1120.ADD:                                       ; preds = %OP1119.PUSH1
  %stack_len4007 = load i64, ptr %len.addr, align 8
  %3002 = add i64 %stack_len4007, -1
  store i64 %3002, ptr %len.addr, align 8
  %3003 = add i64 %stack_len4007, -1
  %sp4008 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3003
  %a4009 = load i256, ptr %sp4008, align 16
  %3004 = add i64 %stack_len4007, -2
  %sp4010 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3004
  %b4011 = load i256, ptr %sp4010, align 16
  %3005 = add i256 %a4009, %b4011
  %3006 = add i64 %stack_len4007, -2
  %sp4012 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3006
  store i256 %3005, ptr %sp4012, align 16
  br label %OP1121.PUSH1, !annotation !5

OP1121.PUSH1:                                     ; preds = %OP1120.ADD
  %stack_len4013 = load i64, ptr %len.addr, align 8
  %3007 = add i64 %stack_len4013, 1
  store i64 %3007, ptr %len.addr, align 8
  %sp4014 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4013
  store i256 0, ptr %sp4014, align 16
  br label %OP1122.KECCAK256, !annotation !5

OP1122.KECCAK256:                                 ; preds = %OP1121.PUSH1
  %stack_len4015 = load i64, ptr %len.addr, align 8
  %3008 = add i64 %stack_len4015, -1
  store i64 %3008, ptr %len.addr, align 8
  %3009 = sub i64 %stack_len4015, 2
  %sp4016 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3009
  %3010 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp4016)
  %3011 = icmp ne i8 %3010, 0
  br i1 %3011, label %return, label %OP1122.KECCAK256.contd, !prof !2

OP1122.KECCAK256.contd:                           ; preds = %OP1122.KECCAK256
  br label %OP1123.PUSH1, !annotation !5

OP1123.PUSH1:                                     ; preds = %OP1122.KECCAK256.contd
  %stack_len4017 = load i64, ptr %len.addr, align 8
  %3012 = add i64 %stack_len4017, 1
  store i64 %3012, ptr %len.addr, align 8
  %sp4018 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4017
  store i256 0, ptr %sp4018, align 16
  br label %OP1124.DUP3, !annotation !5

OP1124.DUP3:                                      ; preds = %OP1123.PUSH1
  %stack_len4019 = load i64, ptr %len.addr, align 8
  %3013 = add i64 %stack_len4019, 1
  store i64 %3013, ptr %len.addr, align 8
  %3014 = sub i64 %stack_len4019, 3
  %sp4020 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3014
  %dup34021 = load i256, ptr %sp4020, align 16
  %sp4022 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4019
  store i256 %dup34021, ptr %sp4022, align 16
  br label %OP1125.DUP3, !annotation !5

OP1125.DUP3:                                      ; preds = %OP1124.DUP3
  %stack_len4023 = load i64, ptr %len.addr, align 8
  %3015 = add i64 %stack_len4023, 1
  store i64 %3015, ptr %len.addr, align 8
  %3016 = sub i64 %stack_len4023, 3
  %sp4024 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3016
  %dup34025 = load i256, ptr %sp4024, align 16
  %sp4026 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4023
  store i256 %dup34025, ptr %sp4026, align 16
  br label %OP1126.SLOAD, !annotation !5

OP1126.SLOAD:                                     ; preds = %OP1125.DUP3
  %stack_len4027 = load i64, ptr %len.addr, align 8
  %3017 = sub i64 %stack_len4027, 1
  %sp4028 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3017
  %3018 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4028, i8 19)
  %3019 = icmp ne i8 %3018, 0
  br i1 %3019, label %return, label %OP1126.SLOAD.contd, !prof !2

OP1126.SLOAD.contd:                               ; preds = %OP1126.SLOAD
  br label %OP1127.SUB, !annotation !5

OP1127.SUB:                                       ; preds = %OP1126.SLOAD.contd
  %stack_len4029 = load i64, ptr %len.addr, align 8
  %3020 = add i64 %stack_len4029, -1
  store i64 %3020, ptr %len.addr, align 8
  %3021 = add i64 %stack_len4029, -1
  %sp4030 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3021
  %a4031 = load i256, ptr %sp4030, align 16
  %3022 = add i64 %stack_len4029, -2
  %sp4032 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3022
  %b4033 = load i256, ptr %sp4032, align 16
  %3023 = sub i256 %a4031, %b4033
  %3024 = add i64 %stack_len4029, -2
  %sp4034 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3024
  store i256 %3023, ptr %sp4034, align 16
  br label %OP1128.SWAP3, !annotation !5

OP1128.SWAP3:                                     ; preds = %OP1127.SUB
  %stack_len4035 = load i64, ptr %len.addr, align 8
  %3025 = sub i64 %stack_len4035, 1
  %sp4036 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3025
  %swap.a4037 = load i256, ptr %sp4036, align 16
  %3026 = sub i64 %stack_len4035, 4
  %sp4038 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3026
  %swap.b4039 = load i256, ptr %sp4038, align 16
  store i256 %swap.a4037, ptr %sp4038, align 16
  store i256 %swap.b4039, ptr %sp4036, align 16
  br label %OP1129.POP, !annotation !5

OP1129.POP:                                       ; preds = %OP1128.SWAP3
  %stack_len4040 = load i64, ptr %len.addr, align 8
  %3027 = add i64 %stack_len4040, -1
  store i64 %3027, ptr %len.addr, align 8
  br label %OP1130.POP, !annotation !5

OP1130.POP:                                       ; preds = %OP1129.POP
  %stack_len4041 = load i64, ptr %len.addr, align 8
  %3028 = add i64 %stack_len4041, -1
  store i64 %3028, ptr %len.addr, align 8
  br label %OP1131.DUP2, !annotation !5

OP1131.DUP2:                                      ; preds = %OP1130.POP
  %stack_len4042 = load i64, ptr %len.addr, align 8
  %3029 = add i64 %stack_len4042, 1
  store i64 %3029, ptr %len.addr, align 8
  %3030 = sub i64 %stack_len4042, 2
  %sp4043 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3030
  %dup24044 = load i256, ptr %sp4043, align 16
  %sp4045 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4042
  store i256 %dup24044, ptr %sp4045, align 16
  br label %OP1132.SWAP1, !annotation !5

OP1132.SWAP1:                                     ; preds = %OP1131.DUP2
  %stack_len4046 = load i64, ptr %len.addr, align 8
  %3031 = sub i64 %stack_len4046, 1
  %sp4047 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3031
  %swap.a4048 = load i256, ptr %sp4047, align 16
  %3032 = sub i64 %stack_len4046, 2
  %sp4049 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3032
  %swap.b4050 = load i256, ptr %sp4049, align 16
  store i256 %swap.a4048, ptr %sp4049, align 16
  store i256 %swap.b4050, ptr %sp4047, align 16
  br label %OP1133.SSTORE, !annotation !5

OP1133.SSTORE:                                    ; preds = %OP1132.SWAP1
  %stack_len4051 = load i64, ptr %len.addr, align 8
  %3033 = add i64 %stack_len4051, -2
  store i64 %3033, ptr %len.addr, align 8
  %3034 = sub i64 %stack_len4051, 2
  %sp4052 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3034
  %3035 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp4052, i8 19)
  %3036 = icmp ne i8 %3035, 0
  br i1 %3036, label %return, label %OP1133.SSTORE.contd, !prof !2

OP1133.SSTORE.contd:                              ; preds = %OP1133.SSTORE
  br label %OP1134.POP, !annotation !5

OP1134.POP:                                       ; preds = %OP1133.SSTORE.contd
  %gas.remaining4053 = load i64, ptr %gas.remaining.addr, align 8
  %3037 = sub i64 %gas.remaining4053, 2
  %3038 = icmp ult i64 %gas.remaining4053, 2
  store i64 %3037, ptr %gas.remaining.addr, align 8
  br i1 %3038, label %return, label %OP1134.POP.contd, !prof !2, !annotation !3

OP1134.POP.contd:                                 ; preds = %OP1134.POP
  %stack_len4054 = load i64, ptr %len.addr, align 8
  %3039 = icmp ult i64 %stack_len4054, 1
  br i1 %3039, label %return, label %OP1134.POP.contd4055, !prof !2, !annotation !9

OP1134.POP.contd4055:                             ; preds = %OP1134.POP.contd
  %3040 = add i64 %stack_len4054, -1
  store i64 %3040, ptr %len.addr, align 8
  br label %OP1135.JUMPDEST, !annotation !5

OP1135.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1134.POP.contd4055, %OP1039.JUMPI
  %gas.remaining4056 = load i64, ptr %gas.remaining.addr, align 8
  %3041 = sub i64 %gas.remaining4056, 110
  %3042 = icmp ult i64 %gas.remaining4056, 110
  store i64 %3041, ptr %gas.remaining.addr, align 8
  br i1 %3042, label %return, label %OP1135.JUMPDEST.contd, !prof !2, !annotation !3

OP1135.JUMPDEST.contd:                            ; preds = %OP1135.JUMPDEST
  %stack_len4057 = load i64, ptr %len.addr, align 8
  %3043 = icmp ult i64 %stack_len4057, 4
  %3044 = icmp ugt i64 %stack_len4057, 1019
  %3045 = or i1 %3043, %3044
  %3046 = select i1 %3043, i8 91, i8 92
  br i1 %3045, label %return, label %OP1135.JUMPDEST.contd4058, !prof !2

OP1135.JUMPDEST.contd4058:                        ; preds = %OP1135.JUMPDEST.contd
  br label %OP1136.DUP2, !annotation !5

OP1136.DUP2:                                      ; preds = %OP1135.JUMPDEST.contd4058
  %stack_len4059 = load i64, ptr %len.addr, align 8
  %3047 = add i64 %stack_len4059, 1
  store i64 %3047, ptr %len.addr, align 8
  %3048 = sub i64 %stack_len4059, 2
  %sp4060 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3048
  %dup24061 = load i256, ptr %sp4060, align 16
  %sp4062 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4059
  store i256 %dup24061, ptr %sp4062, align 16
  br label %OP1137.PUSH1, !annotation !5

OP1137.PUSH1:                                     ; preds = %OP1136.DUP2
  %stack_len4063 = load i64, ptr %len.addr, align 8
  %3049 = add i64 %stack_len4063, 1
  store i64 %3049, ptr %len.addr, align 8
  %sp4064 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4063
  store i256 3, ptr %sp4064, align 16
  br label %OP1138.PUSH1, !annotation !5

OP1138.PUSH1:                                     ; preds = %OP1137.PUSH1
  %stack_len4065 = load i64, ptr %len.addr, align 8
  %3050 = add i64 %stack_len4065, 1
  store i64 %3050, ptr %len.addr, align 8
  %sp4066 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4065
  store i256 0, ptr %sp4066, align 16
  br label %OP1139.DUP7, !annotation !5

OP1139.DUP7:                                      ; preds = %OP1138.PUSH1
  %stack_len4067 = load i64, ptr %len.addr, align 8
  %3051 = add i64 %stack_len4067, 1
  store i64 %3051, ptr %len.addr, align 8
  %3052 = sub i64 %stack_len4067, 7
  %sp4068 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3052
  %dup74069 = load i256, ptr %sp4068, align 16
  %sp4070 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4067
  store i256 %dup74069, ptr %sp4070, align 16
  br label %OP1140.PUSH20, !annotation !5

OP1140.PUSH20:                                    ; preds = %OP1139.DUP7
  %stack_len4071 = load i64, ptr %len.addr, align 8
  %3053 = add i64 %stack_len4071, 1
  store i64 %3053, ptr %len.addr, align 8
  %sp4072 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4071
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4072, align 16
  br label %OP1141.AND, !annotation !5

OP1141.AND:                                       ; preds = %OP1140.PUSH20
  %stack_len4073 = load i64, ptr %len.addr, align 8
  %3054 = add i64 %stack_len4073, -1
  store i64 %3054, ptr %len.addr, align 8
  %3055 = add i64 %stack_len4073, -1
  %sp4074 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3055
  %a4075 = load i256, ptr %sp4074, align 16
  %3056 = add i64 %stack_len4073, -2
  %sp4076 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3056
  %b4077 = load i256, ptr %sp4076, align 16
  %3057 = and i256 %a4075, %b4077
  %3058 = add i64 %stack_len4073, -2
  %sp4078 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3058
  store i256 %3057, ptr %sp4078, align 16
  br label %OP1142.PUSH20, !annotation !5

OP1142.PUSH20:                                    ; preds = %OP1141.AND
  %stack_len4079 = load i64, ptr %len.addr, align 8
  %3059 = add i64 %stack_len4079, 1
  store i64 %3059, ptr %len.addr, align 8
  %sp4080 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4079
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4080, align 16
  br label %OP1143.AND, !annotation !5

OP1143.AND:                                       ; preds = %OP1142.PUSH20
  %stack_len4081 = load i64, ptr %len.addr, align 8
  %3060 = add i64 %stack_len4081, -1
  store i64 %3060, ptr %len.addr, align 8
  %3061 = add i64 %stack_len4081, -1
  %sp4082 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3061
  %a4083 = load i256, ptr %sp4082, align 16
  %3062 = add i64 %stack_len4081, -2
  %sp4084 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3062
  %b4085 = load i256, ptr %sp4084, align 16
  %3063 = and i256 %a4083, %b4085
  %3064 = add i64 %stack_len4081, -2
  %sp4086 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3064
  store i256 %3063, ptr %sp4086, align 16
  br label %OP1144.DUP2, !annotation !5

OP1144.DUP2:                                      ; preds = %OP1143.AND
  %stack_len4087 = load i64, ptr %len.addr, align 8
  %3065 = add i64 %stack_len4087, 1
  store i64 %3065, ptr %len.addr, align 8
  %3066 = sub i64 %stack_len4087, 2
  %sp4088 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3066
  %dup24089 = load i256, ptr %sp4088, align 16
  %sp4090 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4087
  store i256 %dup24089, ptr %sp4090, align 16
  br label %OP1145.MSTORE, !annotation !5

OP1145.MSTORE:                                    ; preds = %OP1144.DUP2
  %stack_len4091 = load i64, ptr %len.addr, align 8
  %3067 = add i64 %stack_len4091, -2
  store i64 %3067, ptr %len.addr, align 8
  %3068 = add i64 %stack_len4091, -1
  %sp4092 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3068
  %a4093 = load i256, ptr %sp4092, align 16
  %3069 = add i64 %stack_len4091, -2
  %sp4094 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3069
  %b4095 = load i256, ptr %sp4094, align 16
  %3070 = call i8 @__revmc_ir_builtin_mstore(i256 %a4093, i256 %b4095, ptr %arg.ecx.addr)
  %3071 = icmp ne i8 %3070, 0
  br i1 %3071, label %return, label %OP1145.MSTORE.contd, !prof !2

OP1145.MSTORE.contd:                              ; preds = %OP1145.MSTORE
  br label %OP1146.PUSH1, !annotation !5

OP1146.PUSH1:                                     ; preds = %OP1145.MSTORE.contd
  %stack_len4096 = load i64, ptr %len.addr, align 8
  %3072 = add i64 %stack_len4096, 1
  store i64 %3072, ptr %len.addr, align 8
  %sp4097 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4096
  store i256 32, ptr %sp4097, align 16
  br label %OP1147.ADD, !annotation !5

OP1147.ADD:                                       ; preds = %OP1146.PUSH1
  %stack_len4098 = load i64, ptr %len.addr, align 8
  %3073 = add i64 %stack_len4098, -1
  store i64 %3073, ptr %len.addr, align 8
  %3074 = add i64 %stack_len4098, -1
  %sp4099 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3074
  %a4100 = load i256, ptr %sp4099, align 16
  %3075 = add i64 %stack_len4098, -2
  %sp4101 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3075
  %b4102 = load i256, ptr %sp4101, align 16
  %3076 = add i256 %a4100, %b4102
  %3077 = add i64 %stack_len4098, -2
  %sp4103 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3077
  store i256 %3076, ptr %sp4103, align 16
  br label %OP1148.SWAP1, !annotation !5

OP1148.SWAP1:                                     ; preds = %OP1147.ADD
  %stack_len4104 = load i64, ptr %len.addr, align 8
  %3078 = sub i64 %stack_len4104, 1
  %sp4105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3078
  %swap.a4106 = load i256, ptr %sp4105, align 16
  %3079 = sub i64 %stack_len4104, 2
  %sp4107 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3079
  %swap.b4108 = load i256, ptr %sp4107, align 16
  store i256 %swap.a4106, ptr %sp4107, align 16
  store i256 %swap.b4108, ptr %sp4105, align 16
  br label %OP1149.DUP2, !annotation !5

OP1149.DUP2:                                      ; preds = %OP1148.SWAP1
  %stack_len4109 = load i64, ptr %len.addr, align 8
  %3080 = add i64 %stack_len4109, 1
  store i64 %3080, ptr %len.addr, align 8
  %3081 = sub i64 %stack_len4109, 2
  %sp4110 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3081
  %dup24111 = load i256, ptr %sp4110, align 16
  %sp4112 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4109
  store i256 %dup24111, ptr %sp4112, align 16
  br label %OP1150.MSTORE, !annotation !5

OP1150.MSTORE:                                    ; preds = %OP1149.DUP2
  %stack_len4113 = load i64, ptr %len.addr, align 8
  %3082 = add i64 %stack_len4113, -2
  store i64 %3082, ptr %len.addr, align 8
  %3083 = add i64 %stack_len4113, -1
  %sp4114 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3083
  %a4115 = load i256, ptr %sp4114, align 16
  %3084 = add i64 %stack_len4113, -2
  %sp4116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3084
  %b4117 = load i256, ptr %sp4116, align 16
  %3085 = call i8 @__revmc_ir_builtin_mstore(i256 %a4115, i256 %b4117, ptr %arg.ecx.addr)
  %3086 = icmp ne i8 %3085, 0
  br i1 %3086, label %return, label %OP1150.MSTORE.contd, !prof !2

OP1150.MSTORE.contd:                              ; preds = %OP1150.MSTORE
  br label %OP1151.PUSH1, !annotation !5

OP1151.PUSH1:                                     ; preds = %OP1150.MSTORE.contd
  %stack_len4118 = load i64, ptr %len.addr, align 8
  %3087 = add i64 %stack_len4118, 1
  store i64 %3087, ptr %len.addr, align 8
  %sp4119 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4118
  store i256 32, ptr %sp4119, align 16
  br label %OP1152.ADD, !annotation !5

OP1152.ADD:                                       ; preds = %OP1151.PUSH1
  %stack_len4120 = load i64, ptr %len.addr, align 8
  %3088 = add i64 %stack_len4120, -1
  store i64 %3088, ptr %len.addr, align 8
  %3089 = add i64 %stack_len4120, -1
  %sp4121 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3089
  %a4122 = load i256, ptr %sp4121, align 16
  %3090 = add i64 %stack_len4120, -2
  %sp4123 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3090
  %b4124 = load i256, ptr %sp4123, align 16
  %3091 = add i256 %a4122, %b4124
  %3092 = add i64 %stack_len4120, -2
  %sp4125 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3092
  store i256 %3091, ptr %sp4125, align 16
  br label %OP1153.PUSH1, !annotation !5

OP1153.PUSH1:                                     ; preds = %OP1152.ADD
  %stack_len4126 = load i64, ptr %len.addr, align 8
  %3093 = add i64 %stack_len4126, 1
  store i64 %3093, ptr %len.addr, align 8
  %sp4127 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4126
  store i256 0, ptr %sp4127, align 16
  br label %OP1154.KECCAK256, !annotation !5

OP1154.KECCAK256:                                 ; preds = %OP1153.PUSH1
  %stack_len4128 = load i64, ptr %len.addr, align 8
  %3094 = add i64 %stack_len4128, -1
  store i64 %3094, ptr %len.addr, align 8
  %3095 = sub i64 %stack_len4128, 2
  %sp4129 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3095
  %3096 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp4129)
  %3097 = icmp ne i8 %3096, 0
  br i1 %3097, label %return, label %OP1154.KECCAK256.contd, !prof !2

OP1154.KECCAK256.contd:                           ; preds = %OP1154.KECCAK256
  br label %OP1155.PUSH1, !annotation !5

OP1155.PUSH1:                                     ; preds = %OP1154.KECCAK256.contd
  %stack_len4130 = load i64, ptr %len.addr, align 8
  %3098 = add i64 %stack_len4130, 1
  store i64 %3098, ptr %len.addr, align 8
  %sp4131 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4130
  store i256 0, ptr %sp4131, align 16
  br label %OP1156.DUP3, !annotation !5

OP1156.DUP3:                                      ; preds = %OP1155.PUSH1
  %stack_len4132 = load i64, ptr %len.addr, align 8
  %3099 = add i64 %stack_len4132, 1
  store i64 %3099, ptr %len.addr, align 8
  %3100 = sub i64 %stack_len4132, 3
  %sp4133 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3100
  %dup34134 = load i256, ptr %sp4133, align 16
  %sp4135 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4132
  store i256 %dup34134, ptr %sp4135, align 16
  br label %OP1157.DUP3, !annotation !5

OP1157.DUP3:                                      ; preds = %OP1156.DUP3
  %stack_len4136 = load i64, ptr %len.addr, align 8
  %3101 = add i64 %stack_len4136, 1
  store i64 %3101, ptr %len.addr, align 8
  %3102 = sub i64 %stack_len4136, 3
  %sp4137 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3102
  %dup34138 = load i256, ptr %sp4137, align 16
  %sp4139 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4136
  store i256 %dup34138, ptr %sp4139, align 16
  br label %OP1158.SLOAD, !annotation !5

OP1158.SLOAD:                                     ; preds = %OP1157.DUP3
  %stack_len4140 = load i64, ptr %len.addr, align 8
  %3103 = sub i64 %stack_len4140, 1
  %sp4141 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3103
  %3104 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4141, i8 19)
  %3105 = icmp ne i8 %3104, 0
  br i1 %3105, label %return, label %OP1158.SLOAD.contd, !prof !2

OP1158.SLOAD.contd:                               ; preds = %OP1158.SLOAD
  br label %OP1159.SUB, !annotation !5

OP1159.SUB:                                       ; preds = %OP1158.SLOAD.contd
  %stack_len4142 = load i64, ptr %len.addr, align 8
  %3106 = add i64 %stack_len4142, -1
  store i64 %3106, ptr %len.addr, align 8
  %3107 = add i64 %stack_len4142, -1
  %sp4143 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3107
  %a4144 = load i256, ptr %sp4143, align 16
  %3108 = add i64 %stack_len4142, -2
  %sp4145 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3108
  %b4146 = load i256, ptr %sp4145, align 16
  %3109 = sub i256 %a4144, %b4146
  %3110 = add i64 %stack_len4142, -2
  %sp4147 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3110
  store i256 %3109, ptr %sp4147, align 16
  br label %OP1160.SWAP3, !annotation !5

OP1160.SWAP3:                                     ; preds = %OP1159.SUB
  %stack_len4148 = load i64, ptr %len.addr, align 8
  %3111 = sub i64 %stack_len4148, 1
  %sp4149 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3111
  %swap.a4150 = load i256, ptr %sp4149, align 16
  %3112 = sub i64 %stack_len4148, 4
  %sp4151 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3112
  %swap.b4152 = load i256, ptr %sp4151, align 16
  store i256 %swap.a4150, ptr %sp4151, align 16
  store i256 %swap.b4152, ptr %sp4149, align 16
  br label %OP1161.POP, !annotation !5

OP1161.POP:                                       ; preds = %OP1160.SWAP3
  %stack_len4153 = load i64, ptr %len.addr, align 8
  %3113 = add i64 %stack_len4153, -1
  store i64 %3113, ptr %len.addr, align 8
  br label %OP1162.POP, !annotation !5

OP1162.POP:                                       ; preds = %OP1161.POP
  %stack_len4154 = load i64, ptr %len.addr, align 8
  %3114 = add i64 %stack_len4154, -1
  store i64 %3114, ptr %len.addr, align 8
  br label %OP1163.DUP2, !annotation !5

OP1163.DUP2:                                      ; preds = %OP1162.POP
  %stack_len4155 = load i64, ptr %len.addr, align 8
  %3115 = add i64 %stack_len4155, 1
  store i64 %3115, ptr %len.addr, align 8
  %3116 = sub i64 %stack_len4155, 2
  %sp4156 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3116
  %dup24157 = load i256, ptr %sp4156, align 16
  %sp4158 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4155
  store i256 %dup24157, ptr %sp4158, align 16
  br label %OP1164.SWAP1, !annotation !5

OP1164.SWAP1:                                     ; preds = %OP1163.DUP2
  %stack_len4159 = load i64, ptr %len.addr, align 8
  %3117 = sub i64 %stack_len4159, 1
  %sp4160 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3117
  %swap.a4161 = load i256, ptr %sp4160, align 16
  %3118 = sub i64 %stack_len4159, 2
  %sp4162 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3118
  %swap.b4163 = load i256, ptr %sp4162, align 16
  store i256 %swap.a4161, ptr %sp4162, align 16
  store i256 %swap.b4163, ptr %sp4160, align 16
  br label %OP1165.SSTORE, !annotation !5

OP1165.SSTORE:                                    ; preds = %OP1164.SWAP1
  %stack_len4164 = load i64, ptr %len.addr, align 8
  %3119 = add i64 %stack_len4164, -2
  store i64 %3119, ptr %len.addr, align 8
  %3120 = sub i64 %stack_len4164, 2
  %sp4165 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3120
  %3121 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp4165, i8 19)
  %3122 = icmp ne i8 %3121, 0
  br i1 %3122, label %return, label %OP1165.SSTORE.contd, !prof !2

OP1165.SSTORE.contd:                              ; preds = %OP1165.SSTORE
  br label %OP1166.POP, !annotation !5

OP1166.POP:                                       ; preds = %OP1165.SSTORE.contd
  %gas.remaining4166 = load i64, ptr %gas.remaining.addr, align 8
  %3123 = sub i64 %gas.remaining4166, 111
  %3124 = icmp ult i64 %gas.remaining4166, 111
  store i64 %3123, ptr %gas.remaining.addr, align 8
  br i1 %3124, label %return, label %OP1166.POP.contd, !prof !2, !annotation !3

OP1166.POP.contd:                                 ; preds = %OP1166.POP
  %stack_len4167 = load i64, ptr %len.addr, align 8
  %3125 = icmp ult i64 %stack_len4167, 4
  %3126 = icmp ugt i64 %stack_len4167, 1020
  %3127 = or i1 %3125, %3126
  %3128 = select i1 %3125, i8 91, i8 92
  br i1 %3127, label %return, label %OP1166.POP.contd4168, !prof !2

OP1166.POP.contd4168:                             ; preds = %OP1166.POP.contd
  %3129 = add i64 %stack_len4167, -1
  store i64 %3129, ptr %len.addr, align 8
  br label %OP1167.DUP2, !annotation !5

OP1167.DUP2:                                      ; preds = %OP1166.POP.contd4168
  %stack_len4169 = load i64, ptr %len.addr, align 8
  %3130 = add i64 %stack_len4169, 1
  store i64 %3130, ptr %len.addr, align 8
  %3131 = sub i64 %stack_len4169, 2
  %sp4170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3131
  %dup24171 = load i256, ptr %sp4170, align 16
  %sp4172 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4169
  store i256 %dup24171, ptr %sp4172, align 16
  br label %OP1168.PUSH1, !annotation !5

OP1168.PUSH1:                                     ; preds = %OP1167.DUP2
  %stack_len4173 = load i64, ptr %len.addr, align 8
  %3132 = add i64 %stack_len4173, 1
  store i64 %3132, ptr %len.addr, align 8
  %sp4174 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4173
  store i256 3, ptr %sp4174, align 16
  br label %OP1169.PUSH1, !annotation !5

OP1169.PUSH1:                                     ; preds = %OP1168.PUSH1
  %stack_len4175 = load i64, ptr %len.addr, align 8
  %3133 = add i64 %stack_len4175, 1
  store i64 %3133, ptr %len.addr, align 8
  %sp4176 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4175
  store i256 0, ptr %sp4176, align 16
  br label %OP1170.DUP6, !annotation !5

OP1170.DUP6:                                      ; preds = %OP1169.PUSH1
  %stack_len4177 = load i64, ptr %len.addr, align 8
  %3134 = add i64 %stack_len4177, 1
  store i64 %3134, ptr %len.addr, align 8
  %3135 = sub i64 %stack_len4177, 6
  %sp4178 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3135
  %dup64179 = load i256, ptr %sp4178, align 16
  %sp4180 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4177
  store i256 %dup64179, ptr %sp4180, align 16
  br label %OP1171.PUSH20, !annotation !5

OP1171.PUSH20:                                    ; preds = %OP1170.DUP6
  %stack_len4181 = load i64, ptr %len.addr, align 8
  %3136 = add i64 %stack_len4181, 1
  store i64 %3136, ptr %len.addr, align 8
  %sp4182 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4181
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4182, align 16
  br label %OP1172.AND, !annotation !5

OP1172.AND:                                       ; preds = %OP1171.PUSH20
  %stack_len4183 = load i64, ptr %len.addr, align 8
  %3137 = add i64 %stack_len4183, -1
  store i64 %3137, ptr %len.addr, align 8
  %3138 = add i64 %stack_len4183, -1
  %sp4184 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3138
  %a4185 = load i256, ptr %sp4184, align 16
  %3139 = add i64 %stack_len4183, -2
  %sp4186 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3139
  %b4187 = load i256, ptr %sp4186, align 16
  %3140 = and i256 %a4185, %b4187
  %3141 = add i64 %stack_len4183, -2
  %sp4188 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3141
  store i256 %3140, ptr %sp4188, align 16
  br label %OP1173.PUSH20, !annotation !5

OP1173.PUSH20:                                    ; preds = %OP1172.AND
  %stack_len4189 = load i64, ptr %len.addr, align 8
  %3142 = add i64 %stack_len4189, 1
  store i64 %3142, ptr %len.addr, align 8
  %sp4190 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4189
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4190, align 16
  br label %OP1174.AND, !annotation !5

OP1174.AND:                                       ; preds = %OP1173.PUSH20
  %stack_len4191 = load i64, ptr %len.addr, align 8
  %3143 = add i64 %stack_len4191, -1
  store i64 %3143, ptr %len.addr, align 8
  %3144 = add i64 %stack_len4191, -1
  %sp4192 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3144
  %a4193 = load i256, ptr %sp4192, align 16
  %3145 = add i64 %stack_len4191, -2
  %sp4194 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3145
  %b4195 = load i256, ptr %sp4194, align 16
  %3146 = and i256 %a4193, %b4195
  %3147 = add i64 %stack_len4191, -2
  %sp4196 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3147
  store i256 %3146, ptr %sp4196, align 16
  br label %OP1175.DUP2, !annotation !5

OP1175.DUP2:                                      ; preds = %OP1174.AND
  %stack_len4197 = load i64, ptr %len.addr, align 8
  %3148 = add i64 %stack_len4197, 1
  store i64 %3148, ptr %len.addr, align 8
  %3149 = sub i64 %stack_len4197, 2
  %sp4198 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3149
  %dup24199 = load i256, ptr %sp4198, align 16
  %sp4200 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4197
  store i256 %dup24199, ptr %sp4200, align 16
  br label %OP1176.MSTORE, !annotation !5

OP1176.MSTORE:                                    ; preds = %OP1175.DUP2
  %stack_len4201 = load i64, ptr %len.addr, align 8
  %3150 = add i64 %stack_len4201, -2
  store i64 %3150, ptr %len.addr, align 8
  %3151 = add i64 %stack_len4201, -1
  %sp4202 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3151
  %a4203 = load i256, ptr %sp4202, align 16
  %3152 = add i64 %stack_len4201, -2
  %sp4204 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3152
  %b4205 = load i256, ptr %sp4204, align 16
  %3153 = call i8 @__revmc_ir_builtin_mstore(i256 %a4203, i256 %b4205, ptr %arg.ecx.addr)
  %3154 = icmp ne i8 %3153, 0
  br i1 %3154, label %return, label %OP1176.MSTORE.contd, !prof !2

OP1176.MSTORE.contd:                              ; preds = %OP1176.MSTORE
  br label %OP1177.PUSH1, !annotation !5

OP1177.PUSH1:                                     ; preds = %OP1176.MSTORE.contd
  %stack_len4206 = load i64, ptr %len.addr, align 8
  %3155 = add i64 %stack_len4206, 1
  store i64 %3155, ptr %len.addr, align 8
  %sp4207 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4206
  store i256 32, ptr %sp4207, align 16
  br label %OP1178.ADD, !annotation !5

OP1178.ADD:                                       ; preds = %OP1177.PUSH1
  %stack_len4208 = load i64, ptr %len.addr, align 8
  %3156 = add i64 %stack_len4208, -1
  store i64 %3156, ptr %len.addr, align 8
  %3157 = add i64 %stack_len4208, -1
  %sp4209 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3157
  %a4210 = load i256, ptr %sp4209, align 16
  %3158 = add i64 %stack_len4208, -2
  %sp4211 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3158
  %b4212 = load i256, ptr %sp4211, align 16
  %3159 = add i256 %a4210, %b4212
  %3160 = add i64 %stack_len4208, -2
  %sp4213 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3160
  store i256 %3159, ptr %sp4213, align 16
  br label %OP1179.SWAP1, !annotation !5

OP1179.SWAP1:                                     ; preds = %OP1178.ADD
  %stack_len4214 = load i64, ptr %len.addr, align 8
  %3161 = sub i64 %stack_len4214, 1
  %sp4215 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3161
  %swap.a4216 = load i256, ptr %sp4215, align 16
  %3162 = sub i64 %stack_len4214, 2
  %sp4217 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3162
  %swap.b4218 = load i256, ptr %sp4217, align 16
  store i256 %swap.a4216, ptr %sp4217, align 16
  store i256 %swap.b4218, ptr %sp4215, align 16
  br label %OP1180.DUP2, !annotation !5

OP1180.DUP2:                                      ; preds = %OP1179.SWAP1
  %stack_len4219 = load i64, ptr %len.addr, align 8
  %3163 = add i64 %stack_len4219, 1
  store i64 %3163, ptr %len.addr, align 8
  %3164 = sub i64 %stack_len4219, 2
  %sp4220 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3164
  %dup24221 = load i256, ptr %sp4220, align 16
  %sp4222 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4219
  store i256 %dup24221, ptr %sp4222, align 16
  br label %OP1181.MSTORE, !annotation !5

OP1181.MSTORE:                                    ; preds = %OP1180.DUP2
  %stack_len4223 = load i64, ptr %len.addr, align 8
  %3165 = add i64 %stack_len4223, -2
  store i64 %3165, ptr %len.addr, align 8
  %3166 = add i64 %stack_len4223, -1
  %sp4224 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3166
  %a4225 = load i256, ptr %sp4224, align 16
  %3167 = add i64 %stack_len4223, -2
  %sp4226 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3167
  %b4227 = load i256, ptr %sp4226, align 16
  %3168 = call i8 @__revmc_ir_builtin_mstore(i256 %a4225, i256 %b4227, ptr %arg.ecx.addr)
  %3169 = icmp ne i8 %3168, 0
  br i1 %3169, label %return, label %OP1181.MSTORE.contd, !prof !2

OP1181.MSTORE.contd:                              ; preds = %OP1181.MSTORE
  br label %OP1182.PUSH1, !annotation !5

OP1182.PUSH1:                                     ; preds = %OP1181.MSTORE.contd
  %stack_len4228 = load i64, ptr %len.addr, align 8
  %3170 = add i64 %stack_len4228, 1
  store i64 %3170, ptr %len.addr, align 8
  %sp4229 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4228
  store i256 32, ptr %sp4229, align 16
  br label %OP1183.ADD, !annotation !5

OP1183.ADD:                                       ; preds = %OP1182.PUSH1
  %stack_len4230 = load i64, ptr %len.addr, align 8
  %3171 = add i64 %stack_len4230, -1
  store i64 %3171, ptr %len.addr, align 8
  %3172 = add i64 %stack_len4230, -1
  %sp4231 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3172
  %a4232 = load i256, ptr %sp4231, align 16
  %3173 = add i64 %stack_len4230, -2
  %sp4233 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3173
  %b4234 = load i256, ptr %sp4233, align 16
  %3174 = add i256 %a4232, %b4234
  %3175 = add i64 %stack_len4230, -2
  %sp4235 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3175
  store i256 %3174, ptr %sp4235, align 16
  br label %OP1184.PUSH1, !annotation !5

OP1184.PUSH1:                                     ; preds = %OP1183.ADD
  %stack_len4236 = load i64, ptr %len.addr, align 8
  %3176 = add i64 %stack_len4236, 1
  store i64 %3176, ptr %len.addr, align 8
  %sp4237 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4236
  store i256 0, ptr %sp4237, align 16
  br label %OP1185.KECCAK256, !annotation !5

OP1185.KECCAK256:                                 ; preds = %OP1184.PUSH1
  %stack_len4238 = load i64, ptr %len.addr, align 8
  %3177 = add i64 %stack_len4238, -1
  store i64 %3177, ptr %len.addr, align 8
  %3178 = sub i64 %stack_len4238, 2
  %sp4239 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3178
  %3179 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp4239)
  %3180 = icmp ne i8 %3179, 0
  br i1 %3180, label %return, label %OP1185.KECCAK256.contd, !prof !2

OP1185.KECCAK256.contd:                           ; preds = %OP1185.KECCAK256
  br label %OP1186.PUSH1, !annotation !5

OP1186.PUSH1:                                     ; preds = %OP1185.KECCAK256.contd
  %stack_len4240 = load i64, ptr %len.addr, align 8
  %3181 = add i64 %stack_len4240, 1
  store i64 %3181, ptr %len.addr, align 8
  %sp4241 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4240
  store i256 0, ptr %sp4241, align 16
  br label %OP1187.DUP3, !annotation !5

OP1187.DUP3:                                      ; preds = %OP1186.PUSH1
  %stack_len4242 = load i64, ptr %len.addr, align 8
  %3182 = add i64 %stack_len4242, 1
  store i64 %3182, ptr %len.addr, align 8
  %3183 = sub i64 %stack_len4242, 3
  %sp4243 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3183
  %dup34244 = load i256, ptr %sp4243, align 16
  %sp4245 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4242
  store i256 %dup34244, ptr %sp4245, align 16
  br label %OP1188.DUP3, !annotation !5

OP1188.DUP3:                                      ; preds = %OP1187.DUP3
  %stack_len4246 = load i64, ptr %len.addr, align 8
  %3184 = add i64 %stack_len4246, 1
  store i64 %3184, ptr %len.addr, align 8
  %3185 = sub i64 %stack_len4246, 3
  %sp4247 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3185
  %dup34248 = load i256, ptr %sp4247, align 16
  %sp4249 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4246
  store i256 %dup34248, ptr %sp4249, align 16
  br label %OP1189.SLOAD, !annotation !5

OP1189.SLOAD:                                     ; preds = %OP1188.DUP3
  %stack_len4250 = load i64, ptr %len.addr, align 8
  %3186 = sub i64 %stack_len4250, 1
  %sp4251 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3186
  %3187 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4251, i8 19)
  %3188 = icmp ne i8 %3187, 0
  br i1 %3188, label %return, label %OP1189.SLOAD.contd, !prof !2

OP1189.SLOAD.contd:                               ; preds = %OP1189.SLOAD
  br label %OP1190.ADD, !annotation !5

OP1190.ADD:                                       ; preds = %OP1189.SLOAD.contd
  %stack_len4252 = load i64, ptr %len.addr, align 8
  %3189 = add i64 %stack_len4252, -1
  store i64 %3189, ptr %len.addr, align 8
  %3190 = add i64 %stack_len4252, -1
  %sp4253 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3190
  %a4254 = load i256, ptr %sp4253, align 16
  %3191 = add i64 %stack_len4252, -2
  %sp4255 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3191
  %b4256 = load i256, ptr %sp4255, align 16
  %3192 = add i256 %a4254, %b4256
  %3193 = add i64 %stack_len4252, -2
  %sp4257 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3193
  store i256 %3192, ptr %sp4257, align 16
  br label %OP1191.SWAP3, !annotation !5

OP1191.SWAP3:                                     ; preds = %OP1190.ADD
  %stack_len4258 = load i64, ptr %len.addr, align 8
  %3194 = sub i64 %stack_len4258, 1
  %sp4259 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3194
  %swap.a4260 = load i256, ptr %sp4259, align 16
  %3195 = sub i64 %stack_len4258, 4
  %sp4261 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3195
  %swap.b4262 = load i256, ptr %sp4261, align 16
  store i256 %swap.a4260, ptr %sp4261, align 16
  store i256 %swap.b4262, ptr %sp4259, align 16
  br label %OP1192.POP, !annotation !5

OP1192.POP:                                       ; preds = %OP1191.SWAP3
  %stack_len4263 = load i64, ptr %len.addr, align 8
  %3196 = add i64 %stack_len4263, -1
  store i64 %3196, ptr %len.addr, align 8
  br label %OP1193.POP, !annotation !5

OP1193.POP:                                       ; preds = %OP1192.POP
  %stack_len4264 = load i64, ptr %len.addr, align 8
  %3197 = add i64 %stack_len4264, -1
  store i64 %3197, ptr %len.addr, align 8
  br label %OP1194.DUP2, !annotation !5

OP1194.DUP2:                                      ; preds = %OP1193.POP
  %stack_len4265 = load i64, ptr %len.addr, align 8
  %3198 = add i64 %stack_len4265, 1
  store i64 %3198, ptr %len.addr, align 8
  %3199 = sub i64 %stack_len4265, 2
  %sp4266 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3199
  %dup24267 = load i256, ptr %sp4266, align 16
  %sp4268 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4265
  store i256 %dup24267, ptr %sp4268, align 16
  br label %OP1195.SWAP1, !annotation !5

OP1195.SWAP1:                                     ; preds = %OP1194.DUP2
  %stack_len4269 = load i64, ptr %len.addr, align 8
  %3200 = sub i64 %stack_len4269, 1
  %sp4270 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3200
  %swap.a4271 = load i256, ptr %sp4270, align 16
  %3201 = sub i64 %stack_len4269, 2
  %sp4272 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3201
  %swap.b4273 = load i256, ptr %sp4272, align 16
  store i256 %swap.a4271, ptr %sp4272, align 16
  store i256 %swap.b4273, ptr %sp4270, align 16
  br label %OP1196.SSTORE, !annotation !5

OP1196.SSTORE:                                    ; preds = %OP1195.SWAP1
  %stack_len4274 = load i64, ptr %len.addr, align 8
  %3202 = add i64 %stack_len4274, -2
  store i64 %3202, ptr %len.addr, align 8
  %3203 = sub i64 %stack_len4274, 2
  %sp4275 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3203
  %3204 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp4275, i8 19)
  %3205 = icmp ne i8 %3204, 0
  br i1 %3205, label %return, label %OP1196.SSTORE.contd, !prof !2

OP1196.SSTORE.contd:                              ; preds = %OP1196.SSTORE
  br label %OP1197.POP, !annotation !5

OP1197.POP:                                       ; preds = %OP1196.SSTORE.contd
  %gas.remaining4276 = load i64, ptr %gas.remaining.addr, align 8
  %3206 = sub i64 %gas.remaining4276, 1603
  %3207 = icmp ult i64 %gas.remaining4276, 1603
  store i64 %3206, ptr %gas.remaining.addr, align 8
  br i1 %3207, label %return, label %OP1197.POP.contd, !prof !2, !annotation !3

OP1197.POP.contd:                                 ; preds = %OP1197.POP
  %stack_len4277 = load i64, ptr %len.addr, align 8
  %3208 = icmp ult i64 %stack_len4277, 6
  %3209 = icmp ugt i64 %stack_len4277, 1017
  %3210 = or i1 %3208, %3209
  %3211 = select i1 %3208, i8 91, i8 92
  br i1 %3210, label %return, label %OP1197.POP.contd4278, !prof !2

OP1197.POP.contd4278:                             ; preds = %OP1197.POP.contd
  %3212 = add i64 %stack_len4277, -1
  store i64 %3212, ptr %len.addr, align 8
  br label %OP1198.DUP3, !annotation !5

OP1198.DUP3:                                      ; preds = %OP1197.POP.contd4278
  %stack_len4279 = load i64, ptr %len.addr, align 8
  %3213 = add i64 %stack_len4279, 1
  store i64 %3213, ptr %len.addr, align 8
  %3214 = sub i64 %stack_len4279, 3
  %sp4280 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3214
  %dup34281 = load i256, ptr %sp4280, align 16
  %sp4282 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4279
  store i256 %dup34281, ptr %sp4282, align 16
  br label %OP1199.PUSH20, !annotation !5

OP1199.PUSH20:                                    ; preds = %OP1198.DUP3
  %stack_len4283 = load i64, ptr %len.addr, align 8
  %3215 = add i64 %stack_len4283, 1
  store i64 %3215, ptr %len.addr, align 8
  %sp4284 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4283
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4284, align 16
  br label %OP1200.AND, !annotation !5

OP1200.AND:                                       ; preds = %OP1199.PUSH20
  %stack_len4285 = load i64, ptr %len.addr, align 8
  %3216 = add i64 %stack_len4285, -1
  store i64 %3216, ptr %len.addr, align 8
  %3217 = add i64 %stack_len4285, -1
  %sp4286 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3217
  %a4287 = load i256, ptr %sp4286, align 16
  %3218 = add i64 %stack_len4285, -2
  %sp4288 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3218
  %b4289 = load i256, ptr %sp4288, align 16
  %3219 = and i256 %a4287, %b4289
  %3220 = add i64 %stack_len4285, -2
  %sp4290 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3220
  store i256 %3219, ptr %sp4290, align 16
  br label %OP1201.DUP5, !annotation !5

OP1201.DUP5:                                      ; preds = %OP1200.AND
  %stack_len4291 = load i64, ptr %len.addr, align 8
  %3221 = add i64 %stack_len4291, 1
  store i64 %3221, ptr %len.addr, align 8
  %3222 = sub i64 %stack_len4291, 5
  %sp4292 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3222
  %dup54293 = load i256, ptr %sp4292, align 16
  %sp4294 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4291
  store i256 %dup54293, ptr %sp4294, align 16
  br label %OP1202.PUSH20, !annotation !5

OP1202.PUSH20:                                    ; preds = %OP1201.DUP5
  %stack_len4295 = load i64, ptr %len.addr, align 8
  %3223 = add i64 %stack_len4295, 1
  store i64 %3223, ptr %len.addr, align 8
  %sp4296 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4295
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4296, align 16
  br label %OP1203.AND, !annotation !5

OP1203.AND:                                       ; preds = %OP1202.PUSH20
  %stack_len4297 = load i64, ptr %len.addr, align 8
  %3224 = add i64 %stack_len4297, -1
  store i64 %3224, ptr %len.addr, align 8
  %3225 = add i64 %stack_len4297, -1
  %sp4298 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3225
  %a4299 = load i256, ptr %sp4298, align 16
  %3226 = add i64 %stack_len4297, -2
  %sp4300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3226
  %b4301 = load i256, ptr %sp4300, align 16
  %3227 = and i256 %a4299, %b4301
  %3228 = add i64 %stack_len4297, -2
  %sp4302 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3228
  store i256 %3227, ptr %sp4302, align 16
  br label %OP1204.PUSH32, !annotation !5

OP1204.PUSH32:                                    ; preds = %OP1203.AND
  %stack_len4303 = load i64, ptr %len.addr, align 8
  %3229 = add i64 %stack_len4303, 1
  store i64 %3229, ptr %len.addr, align 8
  %sp4304 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4303
  store i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, ptr %sp4304, align 16
  br label %OP1205.DUP5, !annotation !5

OP1205.DUP5:                                      ; preds = %OP1204.PUSH32
  %stack_len4305 = load i64, ptr %len.addr, align 8
  %3230 = add i64 %stack_len4305, 1
  store i64 %3230, ptr %len.addr, align 8
  %3231 = sub i64 %stack_len4305, 5
  %sp4306 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3231
  %dup54307 = load i256, ptr %sp4306, align 16
  %sp4308 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4305
  store i256 %dup54307, ptr %sp4308, align 16
  br label %OP1206.PUSH1, !annotation !5

OP1206.PUSH1:                                     ; preds = %OP1205.DUP5
  %stack_len4309 = load i64, ptr %len.addr, align 8
  %3232 = add i64 %stack_len4309, 1
  store i64 %3232, ptr %len.addr, align 8
  %sp4310 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4309
  store i256 64, ptr %sp4310, align 16
  br label %OP1207.MLOAD, !annotation !5

OP1207.MLOAD:                                     ; preds = %OP1206.PUSH1
  %stack_len4311 = load i64, ptr %len.addr, align 8
  %3233 = add i64 %stack_len4311, -1
  %sp4312 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3233
  %a4313 = load i256, ptr %sp4312, align 16
  %mload.out.slot4314 = alloca i256, align 16
  %3234 = call i8 @__revmc_ir_builtin_mload(i256 %a4313, ptr %mload.out.slot4314, ptr %arg.ecx.addr)
  %3235 = icmp ne i8 %3234, 0
  br i1 %3235, label %return, label %OP1207.MLOAD.contd, !prof !2

OP1207.MLOAD.contd:                               ; preds = %OP1207.MLOAD
  %mload.out4315 = load i256, ptr %mload.out.slot4314, align 16
  %3236 = add i64 %stack_len4311, -1
  %sp4316 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3236
  store i256 %mload.out4315, ptr %sp4316, align 16
  br label %OP1208.DUP1, !annotation !5

OP1208.DUP1:                                      ; preds = %OP1207.MLOAD.contd
  %stack_len4317 = load i64, ptr %len.addr, align 8
  %3237 = add i64 %stack_len4317, 1
  store i64 %3237, ptr %len.addr, align 8
  %3238 = sub i64 %stack_len4317, 1
  %sp4318 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3238
  %dup14319 = load i256, ptr %sp4318, align 16
  %sp4320 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4317
  store i256 %dup14319, ptr %sp4320, align 16
  br label %OP1209.DUP3, !annotation !5

OP1209.DUP3:                                      ; preds = %OP1208.DUP1
  %stack_len4321 = load i64, ptr %len.addr, align 8
  %3239 = add i64 %stack_len4321, 1
  store i64 %3239, ptr %len.addr, align 8
  %3240 = sub i64 %stack_len4321, 3
  %sp4322 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3240
  %dup34323 = load i256, ptr %sp4322, align 16
  %sp4324 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4321
  store i256 %dup34323, ptr %sp4324, align 16
  br label %OP1210.DUP2, !annotation !5

OP1210.DUP2:                                      ; preds = %OP1209.DUP3
  %stack_len4325 = load i64, ptr %len.addr, align 8
  %3241 = add i64 %stack_len4325, 1
  store i64 %3241, ptr %len.addr, align 8
  %3242 = sub i64 %stack_len4325, 2
  %sp4326 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3242
  %dup24327 = load i256, ptr %sp4326, align 16
  %sp4328 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4325
  store i256 %dup24327, ptr %sp4328, align 16
  br label %OP1211.MSTORE, !annotation !5

OP1211.MSTORE:                                    ; preds = %OP1210.DUP2
  %stack_len4329 = load i64, ptr %len.addr, align 8
  %3243 = add i64 %stack_len4329, -2
  store i64 %3243, ptr %len.addr, align 8
  %3244 = add i64 %stack_len4329, -1
  %sp4330 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3244
  %a4331 = load i256, ptr %sp4330, align 16
  %3245 = add i64 %stack_len4329, -2
  %sp4332 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3245
  %b4333 = load i256, ptr %sp4332, align 16
  %3246 = call i8 @__revmc_ir_builtin_mstore(i256 %a4331, i256 %b4333, ptr %arg.ecx.addr)
  %3247 = icmp ne i8 %3246, 0
  br i1 %3247, label %return, label %OP1211.MSTORE.contd, !prof !2

OP1211.MSTORE.contd:                              ; preds = %OP1211.MSTORE
  br label %OP1212.PUSH1, !annotation !5

OP1212.PUSH1:                                     ; preds = %OP1211.MSTORE.contd
  %stack_len4334 = load i64, ptr %len.addr, align 8
  %3248 = add i64 %stack_len4334, 1
  store i64 %3248, ptr %len.addr, align 8
  %sp4335 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4334
  store i256 32, ptr %sp4335, align 16
  br label %OP1213.ADD, !annotation !5

OP1213.ADD:                                       ; preds = %OP1212.PUSH1
  %stack_len4336 = load i64, ptr %len.addr, align 8
  %3249 = add i64 %stack_len4336, -1
  store i64 %3249, ptr %len.addr, align 8
  %3250 = add i64 %stack_len4336, -1
  %sp4337 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3250
  %a4338 = load i256, ptr %sp4337, align 16
  %3251 = add i64 %stack_len4336, -2
  %sp4339 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3251
  %b4340 = load i256, ptr %sp4339, align 16
  %3252 = add i256 %a4338, %b4340
  %3253 = add i64 %stack_len4336, -2
  %sp4341 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3253
  store i256 %3252, ptr %sp4341, align 16
  br label %OP1214.SWAP2, !annotation !5

OP1214.SWAP2:                                     ; preds = %OP1213.ADD
  %stack_len4342 = load i64, ptr %len.addr, align 8
  %3254 = sub i64 %stack_len4342, 1
  %sp4343 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3254
  %swap.a4344 = load i256, ptr %sp4343, align 16
  %3255 = sub i64 %stack_len4342, 3
  %sp4345 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3255
  %swap.b4346 = load i256, ptr %sp4345, align 16
  store i256 %swap.a4344, ptr %sp4345, align 16
  store i256 %swap.b4346, ptr %sp4343, align 16
  br label %OP1215.POP, !annotation !5

OP1215.POP:                                       ; preds = %OP1214.SWAP2
  %stack_len4347 = load i64, ptr %len.addr, align 8
  %3256 = add i64 %stack_len4347, -1
  store i64 %3256, ptr %len.addr, align 8
  br label %OP1216.POP, !annotation !5

OP1216.POP:                                       ; preds = %OP1215.POP
  %stack_len4348 = load i64, ptr %len.addr, align 8
  %3257 = add i64 %stack_len4348, -1
  store i64 %3257, ptr %len.addr, align 8
  br label %OP1217.PUSH1, !annotation !5

OP1217.PUSH1:                                     ; preds = %OP1216.POP
  %stack_len4349 = load i64, ptr %len.addr, align 8
  %3258 = add i64 %stack_len4349, 1
  store i64 %3258, ptr %len.addr, align 8
  %sp4350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4349
  store i256 64, ptr %sp4350, align 16
  br label %OP1218.MLOAD, !annotation !5

OP1218.MLOAD:                                     ; preds = %OP1217.PUSH1
  %stack_len4351 = load i64, ptr %len.addr, align 8
  %3259 = add i64 %stack_len4351, -1
  %sp4352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3259
  %a4353 = load i256, ptr %sp4352, align 16
  %mload.out.slot4354 = alloca i256, align 16
  %3260 = call i8 @__revmc_ir_builtin_mload(i256 %a4353, ptr %mload.out.slot4354, ptr %arg.ecx.addr)
  %3261 = icmp ne i8 %3260, 0
  br i1 %3261, label %return, label %OP1218.MLOAD.contd, !prof !2

OP1218.MLOAD.contd:                               ; preds = %OP1218.MLOAD
  %mload.out4355 = load i256, ptr %mload.out.slot4354, align 16
  %3262 = add i64 %stack_len4351, -1
  %sp4356 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3262
  store i256 %mload.out4355, ptr %sp4356, align 16
  br label %OP1219.DUP1, !annotation !5

OP1219.DUP1:                                      ; preds = %OP1218.MLOAD.contd
  %stack_len4357 = load i64, ptr %len.addr, align 8
  %3263 = add i64 %stack_len4357, 1
  store i64 %3263, ptr %len.addr, align 8
  %3264 = sub i64 %stack_len4357, 1
  %sp4358 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3264
  %dup14359 = load i256, ptr %sp4358, align 16
  %sp4360 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4357
  store i256 %dup14359, ptr %sp4360, align 16
  br label %OP1220.SWAP2, !annotation !5

OP1220.SWAP2:                                     ; preds = %OP1219.DUP1
  %stack_len4361 = load i64, ptr %len.addr, align 8
  %3265 = sub i64 %stack_len4361, 1
  %sp4362 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3265
  %swap.a4363 = load i256, ptr %sp4362, align 16
  %3266 = sub i64 %stack_len4361, 3
  %sp4364 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3266
  %swap.b4365 = load i256, ptr %sp4364, align 16
  store i256 %swap.a4363, ptr %sp4364, align 16
  store i256 %swap.b4365, ptr %sp4362, align 16
  br label %OP1221.SUB, !annotation !5

OP1221.SUB:                                       ; preds = %OP1220.SWAP2
  %stack_len4366 = load i64, ptr %len.addr, align 8
  %3267 = add i64 %stack_len4366, -1
  store i64 %3267, ptr %len.addr, align 8
  %3268 = add i64 %stack_len4366, -1
  %sp4367 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3268
  %a4368 = load i256, ptr %sp4367, align 16
  %3269 = add i64 %stack_len4366, -2
  %sp4369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3269
  %b4370 = load i256, ptr %sp4369, align 16
  %3270 = sub i256 %a4368, %b4370
  %3271 = add i64 %stack_len4366, -2
  %sp4371 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3271
  store i256 %3270, ptr %sp4371, align 16
  br label %OP1222.SWAP1, !annotation !5

OP1222.SWAP1:                                     ; preds = %OP1221.SUB
  %stack_len4372 = load i64, ptr %len.addr, align 8
  %3272 = sub i64 %stack_len4372, 1
  %sp4373 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3272
  %swap.a4374 = load i256, ptr %sp4373, align 16
  %3273 = sub i64 %stack_len4372, 2
  %sp4375 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3273
  %swap.b4376 = load i256, ptr %sp4375, align 16
  store i256 %swap.a4374, ptr %sp4375, align 16
  store i256 %swap.b4376, ptr %sp4373, align 16
  br label %OP1223.LOG3, !annotation !5

OP1223.LOG3:                                      ; preds = %OP1222.SWAP1
  %stack_len4377 = load i64, ptr %len.addr, align 8
  %3274 = add i64 %stack_len4377, -5
  store i64 %3274, ptr %len.addr, align 8
  %3275 = sub i64 %stack_len4377, 5
  %sp4378 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3275
  %3276 = call i8 @__revmc_builtin_log(ptr %arg.ecx.addr, ptr %sp4378, i8 3)
  %3277 = icmp ne i8 %3276, 0
  br i1 %3277, label %return, label %OP1223.LOG3.contd, !prof !2

OP1223.LOG3.contd:                                ; preds = %OP1223.LOG3
  br label %OP1224.PUSH1, !annotation !5

OP1224.PUSH1:                                     ; preds = %OP1223.LOG3.contd
  %stack_len4379 = load i64, ptr %len.addr, align 8
  %3278 = add i64 %stack_len4379, 1
  store i64 %3278, ptr %len.addr, align 8
  %sp4380 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4379
  store i256 1, ptr %sp4380, align 16
  br label %OP1225.SWAP1, !annotation !5

OP1225.SWAP1:                                     ; preds = %OP1224.PUSH1
  %stack_len4381 = load i64, ptr %len.addr, align 8
  %3279 = sub i64 %stack_len4381, 1
  %sp4382 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3279
  %swap.a4383 = load i256, ptr %sp4382, align 16
  %3280 = sub i64 %stack_len4381, 2
  %sp4384 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3280
  %swap.b4385 = load i256, ptr %sp4384, align 16
  store i256 %swap.a4383, ptr %sp4384, align 16
  store i256 %swap.b4385, ptr %sp4382, align 16
  br label %OP1226.POP, !annotation !5

OP1226.POP:                                       ; preds = %OP1225.SWAP1
  %stack_len4386 = load i64, ptr %len.addr, align 8
  %3281 = add i64 %stack_len4386, -1
  store i64 %3281, ptr %len.addr, align 8
  br label %OP1227.SWAP4, !annotation !5

OP1227.SWAP4:                                     ; preds = %OP1226.POP
  %stack_len4387 = load i64, ptr %len.addr, align 8
  %3282 = sub i64 %stack_len4387, 1
  %sp4388 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3282
  %swap.a4389 = load i256, ptr %sp4388, align 16
  %3283 = sub i64 %stack_len4387, 5
  %sp4390 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3283
  %swap.b4391 = load i256, ptr %sp4390, align 16
  store i256 %swap.a4389, ptr %sp4390, align 16
  store i256 %swap.b4391, ptr %sp4388, align 16
  br label %OP1228.SWAP3, !annotation !5

OP1228.SWAP3:                                     ; preds = %OP1227.SWAP4
  %stack_len4392 = load i64, ptr %len.addr, align 8
  %3284 = sub i64 %stack_len4392, 1
  %sp4393 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3284
  %swap.a4394 = load i256, ptr %sp4393, align 16
  %3285 = sub i64 %stack_len4392, 4
  %sp4395 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3285
  %swap.b4396 = load i256, ptr %sp4395, align 16
  store i256 %swap.a4394, ptr %sp4395, align 16
  store i256 %swap.b4396, ptr %sp4393, align 16
  br label %OP1229.POP, !annotation !5

OP1229.POP:                                       ; preds = %OP1228.SWAP3
  %stack_len4397 = load i64, ptr %len.addr, align 8
  %3286 = add i64 %stack_len4397, -1
  store i64 %3286, ptr %len.addr, align 8
  br label %OP1230.POP, !annotation !5

OP1230.POP:                                       ; preds = %OP1229.POP
  %stack_len4398 = load i64, ptr %len.addr, align 8
  %3287 = add i64 %stack_len4398, -1
  store i64 %3287, ptr %len.addr, align 8
  br label %OP1231.POP, !annotation !5

OP1231.POP:                                       ; preds = %OP1230.POP
  %stack_len4399 = load i64, ptr %len.addr, align 8
  %3288 = add i64 %stack_len4399, -1
  store i64 %3288, ptr %len.addr, align 8
  br label %OP1232.JUMP, !annotation !5

OP1232.JUMP:                                      ; preds = %OP1231.POP
  %stack_len4400 = load i64, ptr %len.addr, align 8
  %3289 = add i64 %stack_len4400, -1
  store i64 %3289, ptr %len.addr, align 8
  %3290 = add i64 %stack_len4400, -1
  %sp4401 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3290
  %a4402 = load i256, ptr %sp4401, align 16
  br label %dynamic_jump_table

OP1233.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP370.JUMP
  %gas.remaining4403 = load i64, ptr %gas.remaining.addr, align 8
  %3291 = sub i64 %gas.remaining4403, 109
  %3292 = icmp ult i64 %gas.remaining4403, 109
  store i64 %3291, ptr %gas.remaining.addr, align 8
  br i1 %3292, label %return, label %OP1233.JUMPDEST.contd, !prof !2, !annotation !3

OP1233.JUMPDEST.contd:                            ; preds = %OP1233.JUMPDEST
  %stack_len4404 = load i64, ptr %len.addr, align 8
  %3293 = icmp ult i64 %stack_len4404, 1
  %3294 = icmp ugt i64 %stack_len4404, 1019
  %3295 = or i1 %3293, %3294
  %3296 = select i1 %3293, i8 91, i8 92
  br i1 %3295, label %return, label %OP1233.JUMPDEST.contd4405, !prof !2

OP1233.JUMPDEST.contd4405:                        ; preds = %OP1233.JUMPDEST.contd
  br label %OP1234.DUP1, !annotation !5

OP1234.DUP1:                                      ; preds = %OP1233.JUMPDEST.contd4405
  %stack_len4406 = load i64, ptr %len.addr, align 8
  %3297 = add i64 %stack_len4406, 1
  store i64 %3297, ptr %len.addr, align 8
  %3298 = sub i64 %stack_len4406, 1
  %sp4407 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3298
  %dup14408 = load i256, ptr %sp4407, align 16
  %sp4409 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4406
  store i256 %dup14408, ptr %sp4409, align 16
  br label %OP1235.PUSH1, !annotation !5

OP1235.PUSH1:                                     ; preds = %OP1234.DUP1
  %stack_len4410 = load i64, ptr %len.addr, align 8
  %3299 = add i64 %stack_len4410, 1
  store i64 %3299, ptr %len.addr, align 8
  %sp4411 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4410
  store i256 3, ptr %sp4411, align 16
  br label %OP1236.PUSH1, !annotation !5

OP1236.PUSH1:                                     ; preds = %OP1235.PUSH1
  %stack_len4412 = load i64, ptr %len.addr, align 8
  %3300 = add i64 %stack_len4412, 1
  store i64 %3300, ptr %len.addr, align 8
  %sp4413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4412
  store i256 0, ptr %sp4413, align 16
  br label %OP1237.CALLER, !annotation !5

OP1237.CALLER:                                    ; preds = %OP1236.PUSH1
  %stack_len4414 = load i64, ptr %len.addr, align 8
  %3301 = add i64 %stack_len4414, 1
  store i64 %3301, ptr %len.addr, align 8
  %contract.caller.addr4415 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4416 = load i160, ptr %contract.caller.addr4415, align 16
  %3302 = call i160 @llvm.bswap.i160(i160 %contract.caller4416)
  %3303 = zext i160 %3302 to i256
  %sp4417 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4414
  store i256 %3303, ptr %sp4417, align 16
  br label %OP1238.PUSH20, !annotation !5

OP1238.PUSH20:                                    ; preds = %OP1237.CALLER
  %stack_len4418 = load i64, ptr %len.addr, align 8
  %3304 = add i64 %stack_len4418, 1
  store i64 %3304, ptr %len.addr, align 8
  %sp4419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4418
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4419, align 16
  br label %OP1239.AND, !annotation !5

OP1239.AND:                                       ; preds = %OP1238.PUSH20
  %stack_len4420 = load i64, ptr %len.addr, align 8
  %3305 = add i64 %stack_len4420, -1
  store i64 %3305, ptr %len.addr, align 8
  %3306 = add i64 %stack_len4420, -1
  %sp4421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3306
  %a4422 = load i256, ptr %sp4421, align 16
  %3307 = add i64 %stack_len4420, -2
  %sp4423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3307
  %b4424 = load i256, ptr %sp4423, align 16
  %3308 = and i256 %a4422, %b4424
  %3309 = add i64 %stack_len4420, -2
  %sp4425 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3309
  store i256 %3308, ptr %sp4425, align 16
  br label %OP1240.PUSH20, !annotation !5

OP1240.PUSH20:                                    ; preds = %OP1239.AND
  %stack_len4426 = load i64, ptr %len.addr, align 8
  %3310 = add i64 %stack_len4426, 1
  store i64 %3310, ptr %len.addr, align 8
  %sp4427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4426
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4427, align 16
  br label %OP1241.AND, !annotation !5

OP1241.AND:                                       ; preds = %OP1240.PUSH20
  %stack_len4428 = load i64, ptr %len.addr, align 8
  %3311 = add i64 %stack_len4428, -1
  store i64 %3311, ptr %len.addr, align 8
  %3312 = add i64 %stack_len4428, -1
  %sp4429 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3312
  %a4430 = load i256, ptr %sp4429, align 16
  %3313 = add i64 %stack_len4428, -2
  %sp4431 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3313
  %b4432 = load i256, ptr %sp4431, align 16
  %3314 = and i256 %a4430, %b4432
  %3315 = add i64 %stack_len4428, -2
  %sp4433 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3315
  store i256 %3314, ptr %sp4433, align 16
  br label %OP1242.DUP2, !annotation !5

OP1242.DUP2:                                      ; preds = %OP1241.AND
  %stack_len4434 = load i64, ptr %len.addr, align 8
  %3316 = add i64 %stack_len4434, 1
  store i64 %3316, ptr %len.addr, align 8
  %3317 = sub i64 %stack_len4434, 2
  %sp4435 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3317
  %dup24436 = load i256, ptr %sp4435, align 16
  %sp4437 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4434
  store i256 %dup24436, ptr %sp4437, align 16
  br label %OP1243.MSTORE, !annotation !5

OP1243.MSTORE:                                    ; preds = %OP1242.DUP2
  %stack_len4438 = load i64, ptr %len.addr, align 8
  %3318 = add i64 %stack_len4438, -2
  store i64 %3318, ptr %len.addr, align 8
  %3319 = add i64 %stack_len4438, -1
  %sp4439 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3319
  %a4440 = load i256, ptr %sp4439, align 16
  %3320 = add i64 %stack_len4438, -2
  %sp4441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3320
  %b4442 = load i256, ptr %sp4441, align 16
  %3321 = call i8 @__revmc_ir_builtin_mstore(i256 %a4440, i256 %b4442, ptr %arg.ecx.addr)
  %3322 = icmp ne i8 %3321, 0
  br i1 %3322, label %return, label %OP1243.MSTORE.contd, !prof !2

OP1243.MSTORE.contd:                              ; preds = %OP1243.MSTORE
  br label %OP1244.PUSH1, !annotation !5

OP1244.PUSH1:                                     ; preds = %OP1243.MSTORE.contd
  %stack_len4443 = load i64, ptr %len.addr, align 8
  %3323 = add i64 %stack_len4443, 1
  store i64 %3323, ptr %len.addr, align 8
  %sp4444 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4443
  store i256 32, ptr %sp4444, align 16
  br label %OP1245.ADD, !annotation !5

OP1245.ADD:                                       ; preds = %OP1244.PUSH1
  %stack_len4445 = load i64, ptr %len.addr, align 8
  %3324 = add i64 %stack_len4445, -1
  store i64 %3324, ptr %len.addr, align 8
  %3325 = add i64 %stack_len4445, -1
  %sp4446 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3325
  %a4447 = load i256, ptr %sp4446, align 16
  %3326 = add i64 %stack_len4445, -2
  %sp4448 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3326
  %b4449 = load i256, ptr %sp4448, align 16
  %3327 = add i256 %a4447, %b4449
  %3328 = add i64 %stack_len4445, -2
  %sp4450 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3328
  store i256 %3327, ptr %sp4450, align 16
  br label %OP1246.SWAP1, !annotation !5

OP1246.SWAP1:                                     ; preds = %OP1245.ADD
  %stack_len4451 = load i64, ptr %len.addr, align 8
  %3329 = sub i64 %stack_len4451, 1
  %sp4452 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3329
  %swap.a4453 = load i256, ptr %sp4452, align 16
  %3330 = sub i64 %stack_len4451, 2
  %sp4454 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3330
  %swap.b4455 = load i256, ptr %sp4454, align 16
  store i256 %swap.a4453, ptr %sp4454, align 16
  store i256 %swap.b4455, ptr %sp4452, align 16
  br label %OP1247.DUP2, !annotation !5

OP1247.DUP2:                                      ; preds = %OP1246.SWAP1
  %stack_len4456 = load i64, ptr %len.addr, align 8
  %3331 = add i64 %stack_len4456, 1
  store i64 %3331, ptr %len.addr, align 8
  %3332 = sub i64 %stack_len4456, 2
  %sp4457 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3332
  %dup24458 = load i256, ptr %sp4457, align 16
  %sp4459 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4456
  store i256 %dup24458, ptr %sp4459, align 16
  br label %OP1248.MSTORE, !annotation !5

OP1248.MSTORE:                                    ; preds = %OP1247.DUP2
  %stack_len4460 = load i64, ptr %len.addr, align 8
  %3333 = add i64 %stack_len4460, -2
  store i64 %3333, ptr %len.addr, align 8
  %3334 = add i64 %stack_len4460, -1
  %sp4461 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3334
  %a4462 = load i256, ptr %sp4461, align 16
  %3335 = add i64 %stack_len4460, -2
  %sp4463 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3335
  %b4464 = load i256, ptr %sp4463, align 16
  %3336 = call i8 @__revmc_ir_builtin_mstore(i256 %a4462, i256 %b4464, ptr %arg.ecx.addr)
  %3337 = icmp ne i8 %3336, 0
  br i1 %3337, label %return, label %OP1248.MSTORE.contd, !prof !2

OP1248.MSTORE.contd:                              ; preds = %OP1248.MSTORE
  br label %OP1249.PUSH1, !annotation !5

OP1249.PUSH1:                                     ; preds = %OP1248.MSTORE.contd
  %stack_len4465 = load i64, ptr %len.addr, align 8
  %3338 = add i64 %stack_len4465, 1
  store i64 %3338, ptr %len.addr, align 8
  %sp4466 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4465
  store i256 32, ptr %sp4466, align 16
  br label %OP1250.ADD, !annotation !5

OP1250.ADD:                                       ; preds = %OP1249.PUSH1
  %stack_len4467 = load i64, ptr %len.addr, align 8
  %3339 = add i64 %stack_len4467, -1
  store i64 %3339, ptr %len.addr, align 8
  %3340 = add i64 %stack_len4467, -1
  %sp4468 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3340
  %a4469 = load i256, ptr %sp4468, align 16
  %3341 = add i64 %stack_len4467, -2
  %sp4470 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3341
  %b4471 = load i256, ptr %sp4470, align 16
  %3342 = add i256 %a4469, %b4471
  %3343 = add i64 %stack_len4467, -2
  %sp4472 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3343
  store i256 %3342, ptr %sp4472, align 16
  br label %OP1251.PUSH1, !annotation !5

OP1251.PUSH1:                                     ; preds = %OP1250.ADD
  %stack_len4473 = load i64, ptr %len.addr, align 8
  %3344 = add i64 %stack_len4473, 1
  store i64 %3344, ptr %len.addr, align 8
  %sp4474 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4473
  store i256 0, ptr %sp4474, align 16
  br label %OP1252.KECCAK256, !annotation !5

OP1252.KECCAK256:                                 ; preds = %OP1251.PUSH1
  %stack_len4475 = load i64, ptr %len.addr, align 8
  %3345 = add i64 %stack_len4475, -1
  store i64 %3345, ptr %len.addr, align 8
  %3346 = sub i64 %stack_len4475, 2
  %sp4476 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3346
  %3347 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp4476)
  %3348 = icmp ne i8 %3347, 0
  br i1 %3348, label %return, label %OP1252.KECCAK256.contd, !prof !2

OP1252.KECCAK256.contd:                           ; preds = %OP1252.KECCAK256
  br label %OP1253.SLOAD, !annotation !5

OP1253.SLOAD:                                     ; preds = %OP1252.KECCAK256.contd
  %stack_len4477 = load i64, ptr %len.addr, align 8
  %3349 = sub i64 %stack_len4477, 1
  %sp4478 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3349
  %3350 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4478, i8 19)
  %3351 = icmp ne i8 %3350, 0
  br i1 %3351, label %return, label %OP1253.SLOAD.contd, !prof !2

OP1253.SLOAD.contd:                               ; preds = %OP1253.SLOAD
  br label %OP1254.LT, !annotation !5

OP1254.LT:                                        ; preds = %OP1253.SLOAD.contd
  %stack_len4479 = load i64, ptr %len.addr, align 8
  %3352 = add i64 %stack_len4479, -1
  store i64 %3352, ptr %len.addr, align 8
  %3353 = add i64 %stack_len4479, -1
  %sp4480 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3353
  %a4481 = load i256, ptr %sp4480, align 16
  %3354 = add i64 %stack_len4479, -2
  %sp4482 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3354
  %b4483 = load i256, ptr %sp4482, align 16
  %3355 = icmp ult i256 %a4481, %b4483
  %3356 = zext i1 %3355 to i256
  %3357 = add i64 %stack_len4479, -2
  %sp4484 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3357
  store i256 %3356, ptr %sp4484, align 16
  br label %OP1255.ISZERO, !annotation !5

OP1255.ISZERO:                                    ; preds = %OP1254.LT
  %stack_len4485 = load i64, ptr %len.addr, align 8
  %3358 = add i64 %stack_len4485, -1
  %sp4486 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3358
  %a4487 = load i256, ptr %sp4486, align 16
  %3359 = icmp eq i256 %a4487, 0
  %3360 = zext i1 %3359 to i256
  %3361 = add i64 %stack_len4485, -1
  %sp4488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3361
  store i256 %3360, ptr %sp4488, align 16
  br label %OP1256.ISZERO, !annotation !5

OP1256.ISZERO:                                    ; preds = %OP1255.ISZERO
  %stack_len4489 = load i64, ptr %len.addr, align 8
  %3362 = add i64 %stack_len4489, -1
  %sp4490 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3362
  %a4491 = load i256, ptr %sp4490, align 16
  %3363 = icmp eq i256 %a4491, 0
  %3364 = zext i1 %3363 to i256
  %3365 = add i64 %stack_len4489, -1
  %sp4492 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3365
  store i256 %3364, ptr %sp4492, align 16
  br label %OP1257.ISZERO, !annotation !5

OP1257.ISZERO:                                    ; preds = %OP1256.ISZERO
  %stack_len4493 = load i64, ptr %len.addr, align 8
  %3366 = add i64 %stack_len4493, -1
  %sp4494 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3366
  %a4495 = load i256, ptr %sp4494, align 16
  %3367 = icmp eq i256 %a4495, 0
  %3368 = zext i1 %3367 to i256
  %3369 = add i64 %stack_len4493, -1
  %sp4496 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3369
  store i256 %3368, ptr %sp4496, align 16
  br label %OP1258.PUSH2, !annotation !5

OP1258.PUSH2:                                     ; preds = %OP1257.ISZERO
  br label %OP1259.JUMPI, !annotation !6

OP1259.JUMPI:                                     ; preds = %OP1258.PUSH2
  %stack_len4497 = load i64, ptr %len.addr, align 8
  %3370 = add i64 %stack_len4497, -1
  store i64 %3370, ptr %len.addr, align 8
  %3371 = add i64 %stack_len4497, -1
  %sp4498 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3371
  %a4499 = load i256, ptr %sp4498, align 16
  %3372 = icmp ne i256 %a4499, 0
  br i1 %3372, label %OP1263.JUMPDEST, label %OP1260.PUSH1

OP1260.PUSH1:                                     ; preds = %OP1259.JUMPI
  %gas.remaining4500 = load i64, ptr %gas.remaining.addr, align 8
  %3373 = sub i64 %gas.remaining4500, 6
  %3374 = icmp ult i64 %gas.remaining4500, 6
  store i64 %3373, ptr %gas.remaining.addr, align 8
  br i1 %3374, label %return, label %OP1260.PUSH1.contd, !prof !2, !annotation !3

OP1260.PUSH1.contd:                               ; preds = %OP1260.PUSH1
  %stack_len4501 = load i64, ptr %len.addr, align 8
  %3375 = icmp ugt i64 %stack_len4501, 1022
  br i1 %3375, label %return, label %OP1260.PUSH1.contd4502, !prof !2, !annotation !4

OP1260.PUSH1.contd4502:                           ; preds = %OP1260.PUSH1.contd
  %3376 = add i64 %stack_len4501, 1
  store i64 %3376, ptr %len.addr, align 8
  %sp4503 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4501
  store i256 0, ptr %sp4503, align 16
  br label %OP1261.DUP1, !annotation !5

OP1261.DUP1:                                      ; preds = %OP1260.PUSH1.contd4502
  %stack_len4504 = load i64, ptr %len.addr, align 8
  %3377 = add i64 %stack_len4504, 1
  store i64 %3377, ptr %len.addr, align 8
  %3378 = sub i64 %stack_len4504, 1
  %sp4505 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3378
  %dup14506 = load i256, ptr %sp4505, align 16
  %sp4507 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4504
  store i256 %dup14506, ptr %sp4507, align 16
  br label %OP1262.REVERT, !annotation !5

OP1262.REVERT:                                    ; preds = %OP1261.DUP1
  %stack_len4508 = load i64, ptr %len.addr, align 8
  %3379 = add i64 %stack_len4508, -2
  store i64 %3379, ptr %len.addr, align 8
  %3380 = sub i64 %stack_len4508, 2
  %sp4509 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3380
  %3381 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp4509, i8 16)
  %3382 = icmp ne i8 %3381, 0
  br i1 %3382, label %return, label %OP1262.REVERT.contd, !prof !2

OP1262.REVERT.contd:                              ; preds = %OP1262.REVERT
  br label %return, !annotation !8

OP1263.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1259.JUMPI
  %gas.remaining4510 = load i64, ptr %gas.remaining.addr, align 8
  %3383 = sub i64 %gas.remaining4510, 109
  %3384 = icmp ult i64 %gas.remaining4510, 109
  store i64 %3383, ptr %gas.remaining.addr, align 8
  br i1 %3384, label %return, label %OP1263.JUMPDEST.contd, !prof !2, !annotation !3

OP1263.JUMPDEST.contd:                            ; preds = %OP1263.JUMPDEST
  %stack_len4511 = load i64, ptr %len.addr, align 8
  %3385 = icmp ult i64 %stack_len4511, 1
  %3386 = icmp ugt i64 %stack_len4511, 1019
  %3387 = or i1 %3385, %3386
  %3388 = select i1 %3385, i8 91, i8 92
  br i1 %3387, label %return, label %OP1263.JUMPDEST.contd4512, !prof !2

OP1263.JUMPDEST.contd4512:                        ; preds = %OP1263.JUMPDEST.contd
  br label %OP1264.DUP1, !annotation !5

OP1264.DUP1:                                      ; preds = %OP1263.JUMPDEST.contd4512
  %stack_len4513 = load i64, ptr %len.addr, align 8
  %3389 = add i64 %stack_len4513, 1
  store i64 %3389, ptr %len.addr, align 8
  %3390 = sub i64 %stack_len4513, 1
  %sp4514 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3390
  %dup14515 = load i256, ptr %sp4514, align 16
  %sp4516 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4513
  store i256 %dup14515, ptr %sp4516, align 16
  br label %OP1265.PUSH1, !annotation !5

OP1265.PUSH1:                                     ; preds = %OP1264.DUP1
  %stack_len4517 = load i64, ptr %len.addr, align 8
  %3391 = add i64 %stack_len4517, 1
  store i64 %3391, ptr %len.addr, align 8
  %sp4518 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4517
  store i256 3, ptr %sp4518, align 16
  br label %OP1266.PUSH1, !annotation !5

OP1266.PUSH1:                                     ; preds = %OP1265.PUSH1
  %stack_len4519 = load i64, ptr %len.addr, align 8
  %3392 = add i64 %stack_len4519, 1
  store i64 %3392, ptr %len.addr, align 8
  %sp4520 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4519
  store i256 0, ptr %sp4520, align 16
  br label %OP1267.CALLER, !annotation !5

OP1267.CALLER:                                    ; preds = %OP1266.PUSH1
  %stack_len4521 = load i64, ptr %len.addr, align 8
  %3393 = add i64 %stack_len4521, 1
  store i64 %3393, ptr %len.addr, align 8
  %contract.caller.addr4522 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4523 = load i160, ptr %contract.caller.addr4522, align 16
  %3394 = call i160 @llvm.bswap.i160(i160 %contract.caller4523)
  %3395 = zext i160 %3394 to i256
  %sp4524 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4521
  store i256 %3395, ptr %sp4524, align 16
  br label %OP1268.PUSH20, !annotation !5

OP1268.PUSH20:                                    ; preds = %OP1267.CALLER
  %stack_len4525 = load i64, ptr %len.addr, align 8
  %3396 = add i64 %stack_len4525, 1
  store i64 %3396, ptr %len.addr, align 8
  %sp4526 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4525
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4526, align 16
  br label %OP1269.AND, !annotation !5

OP1269.AND:                                       ; preds = %OP1268.PUSH20
  %stack_len4527 = load i64, ptr %len.addr, align 8
  %3397 = add i64 %stack_len4527, -1
  store i64 %3397, ptr %len.addr, align 8
  %3398 = add i64 %stack_len4527, -1
  %sp4528 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3398
  %a4529 = load i256, ptr %sp4528, align 16
  %3399 = add i64 %stack_len4527, -2
  %sp4530 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3399
  %b4531 = load i256, ptr %sp4530, align 16
  %3400 = and i256 %a4529, %b4531
  %3401 = add i64 %stack_len4527, -2
  %sp4532 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3401
  store i256 %3400, ptr %sp4532, align 16
  br label %OP1270.PUSH20, !annotation !5

OP1270.PUSH20:                                    ; preds = %OP1269.AND
  %stack_len4533 = load i64, ptr %len.addr, align 8
  %3402 = add i64 %stack_len4533, 1
  store i64 %3402, ptr %len.addr, align 8
  %sp4534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4533
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4534, align 16
  br label %OP1271.AND, !annotation !5

OP1271.AND:                                       ; preds = %OP1270.PUSH20
  %stack_len4535 = load i64, ptr %len.addr, align 8
  %3403 = add i64 %stack_len4535, -1
  store i64 %3403, ptr %len.addr, align 8
  %3404 = add i64 %stack_len4535, -1
  %sp4536 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3404
  %a4537 = load i256, ptr %sp4536, align 16
  %3405 = add i64 %stack_len4535, -2
  %sp4538 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3405
  %b4539 = load i256, ptr %sp4538, align 16
  %3406 = and i256 %a4537, %b4539
  %3407 = add i64 %stack_len4535, -2
  %sp4540 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3407
  store i256 %3406, ptr %sp4540, align 16
  br label %OP1272.DUP2, !annotation !5

OP1272.DUP2:                                      ; preds = %OP1271.AND
  %stack_len4541 = load i64, ptr %len.addr, align 8
  %3408 = add i64 %stack_len4541, 1
  store i64 %3408, ptr %len.addr, align 8
  %3409 = sub i64 %stack_len4541, 2
  %sp4542 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3409
  %dup24543 = load i256, ptr %sp4542, align 16
  %sp4544 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4541
  store i256 %dup24543, ptr %sp4544, align 16
  br label %OP1273.MSTORE, !annotation !5

OP1273.MSTORE:                                    ; preds = %OP1272.DUP2
  %stack_len4545 = load i64, ptr %len.addr, align 8
  %3410 = add i64 %stack_len4545, -2
  store i64 %3410, ptr %len.addr, align 8
  %3411 = add i64 %stack_len4545, -1
  %sp4546 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3411
  %a4547 = load i256, ptr %sp4546, align 16
  %3412 = add i64 %stack_len4545, -2
  %sp4548 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3412
  %b4549 = load i256, ptr %sp4548, align 16
  %3413 = call i8 @__revmc_ir_builtin_mstore(i256 %a4547, i256 %b4549, ptr %arg.ecx.addr)
  %3414 = icmp ne i8 %3413, 0
  br i1 %3414, label %return, label %OP1273.MSTORE.contd, !prof !2

OP1273.MSTORE.contd:                              ; preds = %OP1273.MSTORE
  br label %OP1274.PUSH1, !annotation !5

OP1274.PUSH1:                                     ; preds = %OP1273.MSTORE.contd
  %stack_len4550 = load i64, ptr %len.addr, align 8
  %3415 = add i64 %stack_len4550, 1
  store i64 %3415, ptr %len.addr, align 8
  %sp4551 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4550
  store i256 32, ptr %sp4551, align 16
  br label %OP1275.ADD, !annotation !5

OP1275.ADD:                                       ; preds = %OP1274.PUSH1
  %stack_len4552 = load i64, ptr %len.addr, align 8
  %3416 = add i64 %stack_len4552, -1
  store i64 %3416, ptr %len.addr, align 8
  %3417 = add i64 %stack_len4552, -1
  %sp4553 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3417
  %a4554 = load i256, ptr %sp4553, align 16
  %3418 = add i64 %stack_len4552, -2
  %sp4555 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3418
  %b4556 = load i256, ptr %sp4555, align 16
  %3419 = add i256 %a4554, %b4556
  %3420 = add i64 %stack_len4552, -2
  %sp4557 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3420
  store i256 %3419, ptr %sp4557, align 16
  br label %OP1276.SWAP1, !annotation !5

OP1276.SWAP1:                                     ; preds = %OP1275.ADD
  %stack_len4558 = load i64, ptr %len.addr, align 8
  %3421 = sub i64 %stack_len4558, 1
  %sp4559 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3421
  %swap.a4560 = load i256, ptr %sp4559, align 16
  %3422 = sub i64 %stack_len4558, 2
  %sp4561 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3422
  %swap.b4562 = load i256, ptr %sp4561, align 16
  store i256 %swap.a4560, ptr %sp4561, align 16
  store i256 %swap.b4562, ptr %sp4559, align 16
  br label %OP1277.DUP2, !annotation !5

OP1277.DUP2:                                      ; preds = %OP1276.SWAP1
  %stack_len4563 = load i64, ptr %len.addr, align 8
  %3423 = add i64 %stack_len4563, 1
  store i64 %3423, ptr %len.addr, align 8
  %3424 = sub i64 %stack_len4563, 2
  %sp4564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3424
  %dup24565 = load i256, ptr %sp4564, align 16
  %sp4566 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4563
  store i256 %dup24565, ptr %sp4566, align 16
  br label %OP1278.MSTORE, !annotation !5

OP1278.MSTORE:                                    ; preds = %OP1277.DUP2
  %stack_len4567 = load i64, ptr %len.addr, align 8
  %3425 = add i64 %stack_len4567, -2
  store i64 %3425, ptr %len.addr, align 8
  %3426 = add i64 %stack_len4567, -1
  %sp4568 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3426
  %a4569 = load i256, ptr %sp4568, align 16
  %3427 = add i64 %stack_len4567, -2
  %sp4570 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3427
  %b4571 = load i256, ptr %sp4570, align 16
  %3428 = call i8 @__revmc_ir_builtin_mstore(i256 %a4569, i256 %b4571, ptr %arg.ecx.addr)
  %3429 = icmp ne i8 %3428, 0
  br i1 %3429, label %return, label %OP1278.MSTORE.contd, !prof !2

OP1278.MSTORE.contd:                              ; preds = %OP1278.MSTORE
  br label %OP1279.PUSH1, !annotation !5

OP1279.PUSH1:                                     ; preds = %OP1278.MSTORE.contd
  %stack_len4572 = load i64, ptr %len.addr, align 8
  %3430 = add i64 %stack_len4572, 1
  store i64 %3430, ptr %len.addr, align 8
  %sp4573 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4572
  store i256 32, ptr %sp4573, align 16
  br label %OP1280.ADD, !annotation !5

OP1280.ADD:                                       ; preds = %OP1279.PUSH1
  %stack_len4574 = load i64, ptr %len.addr, align 8
  %3431 = add i64 %stack_len4574, -1
  store i64 %3431, ptr %len.addr, align 8
  %3432 = add i64 %stack_len4574, -1
  %sp4575 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3432
  %a4576 = load i256, ptr %sp4575, align 16
  %3433 = add i64 %stack_len4574, -2
  %sp4577 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3433
  %b4578 = load i256, ptr %sp4577, align 16
  %3434 = add i256 %a4576, %b4578
  %3435 = add i64 %stack_len4574, -2
  %sp4579 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3435
  store i256 %3434, ptr %sp4579, align 16
  br label %OP1281.PUSH1, !annotation !5

OP1281.PUSH1:                                     ; preds = %OP1280.ADD
  %stack_len4580 = load i64, ptr %len.addr, align 8
  %3436 = add i64 %stack_len4580, 1
  store i64 %3436, ptr %len.addr, align 8
  %sp4581 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4580
  store i256 0, ptr %sp4581, align 16
  br label %OP1282.KECCAK256, !annotation !5

OP1282.KECCAK256:                                 ; preds = %OP1281.PUSH1
  %stack_len4582 = load i64, ptr %len.addr, align 8
  %3437 = add i64 %stack_len4582, -1
  store i64 %3437, ptr %len.addr, align 8
  %3438 = sub i64 %stack_len4582, 2
  %sp4583 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3438
  %3439 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp4583)
  %3440 = icmp ne i8 %3439, 0
  br i1 %3440, label %return, label %OP1282.KECCAK256.contd, !prof !2

OP1282.KECCAK256.contd:                           ; preds = %OP1282.KECCAK256
  br label %OP1283.PUSH1, !annotation !5

OP1283.PUSH1:                                     ; preds = %OP1282.KECCAK256.contd
  %stack_len4584 = load i64, ptr %len.addr, align 8
  %3441 = add i64 %stack_len4584, 1
  store i64 %3441, ptr %len.addr, align 8
  %sp4585 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4584
  store i256 0, ptr %sp4585, align 16
  br label %OP1284.DUP3, !annotation !5

OP1284.DUP3:                                      ; preds = %OP1283.PUSH1
  %stack_len4586 = load i64, ptr %len.addr, align 8
  %3442 = add i64 %stack_len4586, 1
  store i64 %3442, ptr %len.addr, align 8
  %3443 = sub i64 %stack_len4586, 3
  %sp4587 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3443
  %dup34588 = load i256, ptr %sp4587, align 16
  %sp4589 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4586
  store i256 %dup34588, ptr %sp4589, align 16
  br label %OP1285.DUP3, !annotation !5

OP1285.DUP3:                                      ; preds = %OP1284.DUP3
  %stack_len4590 = load i64, ptr %len.addr, align 8
  %3444 = add i64 %stack_len4590, 1
  store i64 %3444, ptr %len.addr, align 8
  %3445 = sub i64 %stack_len4590, 3
  %sp4591 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3445
  %dup34592 = load i256, ptr %sp4591, align 16
  %sp4593 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4590
  store i256 %dup34592, ptr %sp4593, align 16
  br label %OP1286.SLOAD, !annotation !5

OP1286.SLOAD:                                     ; preds = %OP1285.DUP3
  %stack_len4594 = load i64, ptr %len.addr, align 8
  %3446 = sub i64 %stack_len4594, 1
  %sp4595 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3446
  %3447 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4595, i8 19)
  %3448 = icmp ne i8 %3447, 0
  br i1 %3448, label %return, label %OP1286.SLOAD.contd, !prof !2

OP1286.SLOAD.contd:                               ; preds = %OP1286.SLOAD
  br label %OP1287.SUB, !annotation !5

OP1287.SUB:                                       ; preds = %OP1286.SLOAD.contd
  %stack_len4596 = load i64, ptr %len.addr, align 8
  %3449 = add i64 %stack_len4596, -1
  store i64 %3449, ptr %len.addr, align 8
  %3450 = add i64 %stack_len4596, -1
  %sp4597 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3450
  %a4598 = load i256, ptr %sp4597, align 16
  %3451 = add i64 %stack_len4596, -2
  %sp4599 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3451
  %b4600 = load i256, ptr %sp4599, align 16
  %3452 = sub i256 %a4598, %b4600
  %3453 = add i64 %stack_len4596, -2
  %sp4601 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3453
  store i256 %3452, ptr %sp4601, align 16
  br label %OP1288.SWAP3, !annotation !5

OP1288.SWAP3:                                     ; preds = %OP1287.SUB
  %stack_len4602 = load i64, ptr %len.addr, align 8
  %3454 = sub i64 %stack_len4602, 1
  %sp4603 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3454
  %swap.a4604 = load i256, ptr %sp4603, align 16
  %3455 = sub i64 %stack_len4602, 4
  %sp4605 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3455
  %swap.b4606 = load i256, ptr %sp4605, align 16
  store i256 %swap.a4604, ptr %sp4605, align 16
  store i256 %swap.b4606, ptr %sp4603, align 16
  br label %OP1289.POP, !annotation !5

OP1289.POP:                                       ; preds = %OP1288.SWAP3
  %stack_len4607 = load i64, ptr %len.addr, align 8
  %3456 = add i64 %stack_len4607, -1
  store i64 %3456, ptr %len.addr, align 8
  br label %OP1290.POP, !annotation !5

OP1290.POP:                                       ; preds = %OP1289.POP
  %stack_len4608 = load i64, ptr %len.addr, align 8
  %3457 = add i64 %stack_len4608, -1
  store i64 %3457, ptr %len.addr, align 8
  br label %OP1291.DUP2, !annotation !5

OP1291.DUP2:                                      ; preds = %OP1290.POP
  %stack_len4609 = load i64, ptr %len.addr, align 8
  %3458 = add i64 %stack_len4609, 1
  store i64 %3458, ptr %len.addr, align 8
  %3459 = sub i64 %stack_len4609, 2
  %sp4610 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3459
  %dup24611 = load i256, ptr %sp4610, align 16
  %sp4612 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4609
  store i256 %dup24611, ptr %sp4612, align 16
  br label %OP1292.SWAP1, !annotation !5

OP1292.SWAP1:                                     ; preds = %OP1291.DUP2
  %stack_len4613 = load i64, ptr %len.addr, align 8
  %3460 = sub i64 %stack_len4613, 1
  %sp4614 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3460
  %swap.a4615 = load i256, ptr %sp4614, align 16
  %3461 = sub i64 %stack_len4613, 2
  %sp4616 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3461
  %swap.b4617 = load i256, ptr %sp4616, align 16
  store i256 %swap.a4615, ptr %sp4616, align 16
  store i256 %swap.b4617, ptr %sp4614, align 16
  br label %OP1293.SSTORE, !annotation !5

OP1293.SSTORE:                                    ; preds = %OP1292.SWAP1
  %stack_len4618 = load i64, ptr %len.addr, align 8
  %3462 = add i64 %stack_len4618, -2
  store i64 %3462, ptr %len.addr, align 8
  %3463 = sub i64 %stack_len4618, 2
  %sp4619 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3463
  %3464 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp4619, i8 19)
  %3465 = icmp ne i8 %3464, 0
  br i1 %3465, label %return, label %OP1293.SSTORE.contd, !prof !2

OP1293.SSTORE.contd:                              ; preds = %OP1293.SSTORE
  br label %OP1294.POP, !annotation !5

OP1294.POP:                                       ; preds = %OP1293.SSTORE.contd
  %gas.remaining4620 = load i64, ptr %gas.remaining.addr, align 8
  %3466 = sub i64 %gas.remaining4620, 69
  %3467 = icmp ult i64 %gas.remaining4620, 69
  store i64 %3466, ptr %gas.remaining.addr, align 8
  br i1 %3467, label %return, label %OP1294.POP.contd, !prof !2, !annotation !3

OP1294.POP.contd:                                 ; preds = %OP1294.POP
  %stack_len4621 = load i64, ptr %len.addr, align 8
  %3468 = icmp ult i64 %stack_len4621, 2
  %3469 = icmp ugt i64 %stack_len4621, 1014
  %3470 = or i1 %3468, %3469
  %3471 = select i1 %3468, i8 91, i8 92
  br i1 %3470, label %return, label %OP1294.POP.contd4622, !prof !2

OP1294.POP.contd4622:                             ; preds = %OP1294.POP.contd
  %3472 = add i64 %stack_len4621, -1
  store i64 %3472, ptr %len.addr, align 8
  br label %OP1295.CALLER, !annotation !5

OP1295.CALLER:                                    ; preds = %OP1294.POP.contd4622
  %stack_len4623 = load i64, ptr %len.addr, align 8
  %3473 = add i64 %stack_len4623, 1
  store i64 %3473, ptr %len.addr, align 8
  %contract.caller.addr4624 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4625 = load i160, ptr %contract.caller.addr4624, align 16
  %3474 = call i160 @llvm.bswap.i160(i160 %contract.caller4625)
  %3475 = zext i160 %3474 to i256
  %sp4626 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4623
  store i256 %3475, ptr %sp4626, align 16
  br label %OP1296.PUSH20, !annotation !5

OP1296.PUSH20:                                    ; preds = %OP1295.CALLER
  %stack_len4627 = load i64, ptr %len.addr, align 8
  %3476 = add i64 %stack_len4627, 1
  store i64 %3476, ptr %len.addr, align 8
  %sp4628 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4627
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4628, align 16
  br label %OP1297.AND, !annotation !5

OP1297.AND:                                       ; preds = %OP1296.PUSH20
  %stack_len4629 = load i64, ptr %len.addr, align 8
  %3477 = add i64 %stack_len4629, -1
  store i64 %3477, ptr %len.addr, align 8
  %3478 = add i64 %stack_len4629, -1
  %sp4630 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3478
  %a4631 = load i256, ptr %sp4630, align 16
  %3479 = add i64 %stack_len4629, -2
  %sp4632 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3479
  %b4633 = load i256, ptr %sp4632, align 16
  %3480 = and i256 %a4631, %b4633
  %3481 = add i64 %stack_len4629, -2
  %sp4634 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3481
  store i256 %3480, ptr %sp4634, align 16
  br label %OP1298.PUSH2, !annotation !5

OP1298.PUSH2:                                     ; preds = %OP1297.AND
  %stack_len4635 = load i64, ptr %len.addr, align 8
  %3482 = add i64 %stack_len4635, 1
  store i64 %3482, ptr %len.addr, align 8
  %sp4636 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4635
  store i256 2300, ptr %sp4636, align 16
  br label %OP1299.DUP3, !annotation !5

OP1299.DUP3:                                      ; preds = %OP1298.PUSH2
  %stack_len4637 = load i64, ptr %len.addr, align 8
  %3483 = add i64 %stack_len4637, 1
  store i64 %3483, ptr %len.addr, align 8
  %3484 = sub i64 %stack_len4637, 3
  %sp4638 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3484
  %dup34639 = load i256, ptr %sp4638, align 16
  %sp4640 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4637
  store i256 %dup34639, ptr %sp4640, align 16
  br label %OP1300.SWAP1, !annotation !5

OP1300.SWAP1:                                     ; preds = %OP1299.DUP3
  %stack_len4641 = load i64, ptr %len.addr, align 8
  %3485 = sub i64 %stack_len4641, 1
  %sp4642 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3485
  %swap.a4643 = load i256, ptr %sp4642, align 16
  %3486 = sub i64 %stack_len4641, 2
  %sp4644 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3486
  %swap.b4645 = load i256, ptr %sp4644, align 16
  store i256 %swap.a4643, ptr %sp4644, align 16
  store i256 %swap.b4645, ptr %sp4642, align 16
  br label %OP1301.DUP2, !annotation !5

OP1301.DUP2:                                      ; preds = %OP1300.SWAP1
  %stack_len4646 = load i64, ptr %len.addr, align 8
  %3487 = add i64 %stack_len4646, 1
  store i64 %3487, ptr %len.addr, align 8
  %3488 = sub i64 %stack_len4646, 2
  %sp4647 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3488
  %dup24648 = load i256, ptr %sp4647, align 16
  %sp4649 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4646
  store i256 %dup24648, ptr %sp4649, align 16
  br label %OP1302.ISZERO, !annotation !5

OP1302.ISZERO:                                    ; preds = %OP1301.DUP2
  %stack_len4650 = load i64, ptr %len.addr, align 8
  %3489 = add i64 %stack_len4650, -1
  %sp4651 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3489
  %a4652 = load i256, ptr %sp4651, align 16
  %3490 = icmp eq i256 %a4652, 0
  %3491 = zext i1 %3490 to i256
  %3492 = add i64 %stack_len4650, -1
  %sp4653 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3492
  store i256 %3491, ptr %sp4653, align 16
  br label %OP1303.MUL, !annotation !5

OP1303.MUL:                                       ; preds = %OP1302.ISZERO
  %stack_len4654 = load i64, ptr %len.addr, align 8
  %3493 = add i64 %stack_len4654, -1
  store i64 %3493, ptr %len.addr, align 8
  %3494 = add i64 %stack_len4654, -1
  %sp4655 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3494
  %a4656 = load i256, ptr %sp4655, align 16
  %3495 = add i64 %stack_len4654, -2
  %sp4657 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3495
  %b4658 = load i256, ptr %sp4657, align 16
  %3496 = mul i256 %a4656, %b4658
  %3497 = add i64 %stack_len4654, -2
  %sp4659 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3497
  store i256 %3496, ptr %sp4659, align 16
  br label %OP1304.SWAP1, !annotation !5

OP1304.SWAP1:                                     ; preds = %OP1303.MUL
  %stack_len4660 = load i64, ptr %len.addr, align 8
  %3498 = sub i64 %stack_len4660, 1
  %sp4661 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3498
  %swap.a4662 = load i256, ptr %sp4661, align 16
  %3499 = sub i64 %stack_len4660, 2
  %sp4663 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3499
  %swap.b4664 = load i256, ptr %sp4663, align 16
  store i256 %swap.a4662, ptr %sp4663, align 16
  store i256 %swap.b4664, ptr %sp4661, align 16
  br label %OP1305.PUSH1, !annotation !5

OP1305.PUSH1:                                     ; preds = %OP1304.SWAP1
  %stack_len4665 = load i64, ptr %len.addr, align 8
  %3500 = add i64 %stack_len4665, 1
  store i64 %3500, ptr %len.addr, align 8
  %sp4666 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4665
  store i256 64, ptr %sp4666, align 16
  br label %OP1306.MLOAD, !annotation !5

OP1306.MLOAD:                                     ; preds = %OP1305.PUSH1
  %stack_len4667 = load i64, ptr %len.addr, align 8
  %3501 = add i64 %stack_len4667, -1
  %sp4668 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3501
  %a4669 = load i256, ptr %sp4668, align 16
  %mload.out.slot4670 = alloca i256, align 16
  %3502 = call i8 @__revmc_ir_builtin_mload(i256 %a4669, ptr %mload.out.slot4670, ptr %arg.ecx.addr)
  %3503 = icmp ne i8 %3502, 0
  br i1 %3503, label %return, label %OP1306.MLOAD.contd, !prof !2

OP1306.MLOAD.contd:                               ; preds = %OP1306.MLOAD
  %mload.out4671 = load i256, ptr %mload.out.slot4670, align 16
  %3504 = add i64 %stack_len4667, -1
  %sp4672 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3504
  store i256 %mload.out4671, ptr %sp4672, align 16
  br label %OP1307.PUSH1, !annotation !5

OP1307.PUSH1:                                     ; preds = %OP1306.MLOAD.contd
  %stack_len4673 = load i64, ptr %len.addr, align 8
  %3505 = add i64 %stack_len4673, 1
  store i64 %3505, ptr %len.addr, align 8
  %sp4674 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4673
  store i256 0, ptr %sp4674, align 16
  br label %OP1308.PUSH1, !annotation !5

OP1308.PUSH1:                                     ; preds = %OP1307.PUSH1
  %stack_len4675 = load i64, ptr %len.addr, align 8
  %3506 = add i64 %stack_len4675, 1
  store i64 %3506, ptr %len.addr, align 8
  %sp4676 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4675
  store i256 64, ptr %sp4676, align 16
  br label %OP1309.MLOAD, !annotation !5

OP1309.MLOAD:                                     ; preds = %OP1308.PUSH1
  %stack_len4677 = load i64, ptr %len.addr, align 8
  %3507 = add i64 %stack_len4677, -1
  %sp4678 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3507
  %a4679 = load i256, ptr %sp4678, align 16
  %mload.out.slot4680 = alloca i256, align 16
  %3508 = call i8 @__revmc_ir_builtin_mload(i256 %a4679, ptr %mload.out.slot4680, ptr %arg.ecx.addr)
  %3509 = icmp ne i8 %3508, 0
  br i1 %3509, label %return, label %OP1309.MLOAD.contd, !prof !2

OP1309.MLOAD.contd:                               ; preds = %OP1309.MLOAD
  %mload.out4681 = load i256, ptr %mload.out.slot4680, align 16
  %3510 = add i64 %stack_len4677, -1
  %sp4682 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3510
  store i256 %mload.out4681, ptr %sp4682, align 16
  br label %OP1310.DUP1, !annotation !5

OP1310.DUP1:                                      ; preds = %OP1309.MLOAD.contd
  %stack_len4683 = load i64, ptr %len.addr, align 8
  %3511 = add i64 %stack_len4683, 1
  store i64 %3511, ptr %len.addr, align 8
  %3512 = sub i64 %stack_len4683, 1
  %sp4684 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3512
  %dup14685 = load i256, ptr %sp4684, align 16
  %sp4686 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4683
  store i256 %dup14685, ptr %sp4686, align 16
  br label %OP1311.DUP4, !annotation !5

OP1311.DUP4:                                      ; preds = %OP1310.DUP1
  %stack_len4687 = load i64, ptr %len.addr, align 8
  %3513 = add i64 %stack_len4687, 1
  store i64 %3513, ptr %len.addr, align 8
  %3514 = sub i64 %stack_len4687, 4
  %sp4688 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3514
  %dup44689 = load i256, ptr %sp4688, align 16
  %sp4690 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4687
  store i256 %dup44689, ptr %sp4690, align 16
  br label %OP1312.SUB, !annotation !5

OP1312.SUB:                                       ; preds = %OP1311.DUP4
  %stack_len4691 = load i64, ptr %len.addr, align 8
  %3515 = add i64 %stack_len4691, -1
  store i64 %3515, ptr %len.addr, align 8
  %3516 = add i64 %stack_len4691, -1
  %sp4692 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3516
  %a4693 = load i256, ptr %sp4692, align 16
  %3517 = add i64 %stack_len4691, -2
  %sp4694 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3517
  %b4695 = load i256, ptr %sp4694, align 16
  %3518 = sub i256 %a4693, %b4695
  %3519 = add i64 %stack_len4691, -2
  %sp4696 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3519
  store i256 %3518, ptr %sp4696, align 16
  br label %OP1313.DUP2, !annotation !5

OP1313.DUP2:                                      ; preds = %OP1312.SUB
  %stack_len4697 = load i64, ptr %len.addr, align 8
  %3520 = add i64 %stack_len4697, 1
  store i64 %3520, ptr %len.addr, align 8
  %3521 = sub i64 %stack_len4697, 2
  %sp4698 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3521
  %dup24699 = load i256, ptr %sp4698, align 16
  %sp4700 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4697
  store i256 %dup24699, ptr %sp4700, align 16
  br label %OP1314.DUP6, !annotation !5

OP1314.DUP6:                                      ; preds = %OP1313.DUP2
  %stack_len4701 = load i64, ptr %len.addr, align 8
  %3522 = add i64 %stack_len4701, 1
  store i64 %3522, ptr %len.addr, align 8
  %3523 = sub i64 %stack_len4701, 6
  %sp4702 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3523
  %dup64703 = load i256, ptr %sp4702, align 16
  %sp4704 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4701
  store i256 %dup64703, ptr %sp4704, align 16
  br label %OP1315.DUP9, !annotation !5

OP1315.DUP9:                                      ; preds = %OP1314.DUP6
  %stack_len4705 = load i64, ptr %len.addr, align 8
  %3524 = add i64 %stack_len4705, 1
  store i64 %3524, ptr %len.addr, align 8
  %3525 = sub i64 %stack_len4705, 9
  %sp4706 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3525
  %dup9 = load i256, ptr %sp4706, align 16
  %sp4707 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4705
  store i256 %dup9, ptr %sp4707, align 16
  br label %OP1316.DUP9, !annotation !5

OP1316.DUP9:                                      ; preds = %OP1315.DUP9
  %stack_len4708 = load i64, ptr %len.addr, align 8
  %3526 = add i64 %stack_len4708, 1
  store i64 %3526, ptr %len.addr, align 8
  %3527 = sub i64 %stack_len4708, 9
  %sp4709 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3527
  %dup94710 = load i256, ptr %sp4709, align 16
  %sp4711 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4708
  store i256 %dup94710, ptr %sp4711, align 16
  br label %OP1317.CALL, !annotation !5

OP1317.CALL:                                      ; preds = %OP1316.DUP9
  %stack_len4712 = load i64, ptr %len.addr, align 8
  %3528 = add i64 %stack_len4712, -7
  store i64 %3528, ptr %len.addr, align 8
  %3529 = sub i64 %stack_len4712, 7
  %sp4713 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3529
  %3530 = call i8 @__revmc_builtin_call(ptr %arg.ecx.addr, ptr %sp4713, i8 19, i8 0)
  %3531 = icmp ne i8 %3530, 0
  br i1 %3531, label %return, label %OP1317.CALL.contd, !prof !2

OP1317.CALL.contd:                                ; preds = %OP1317.CALL
  br label %suspend

OP1318.SWAP4:                                     ; preds = %resume
  %gas.remaining4714 = load i64, ptr %gas.remaining.addr, align 8
  %3532 = sub i64 %gas.remaining4714, 30
  %3533 = icmp ult i64 %gas.remaining4714, 30
  store i64 %3532, ptr %gas.remaining.addr, align 8
  br i1 %3533, label %return, label %OP1318.SWAP4.contd, !prof !2, !annotation !3

OP1318.SWAP4.contd:                               ; preds = %OP1318.SWAP4
  %stack_len4715 = load i64, ptr %len.addr, align 8
  %3534 = icmp ult i64 %stack_len4715, 5
  br i1 %3534, label %return, label %OP1318.SWAP4.contd4716, !prof !2, !annotation !9

OP1318.SWAP4.contd4716:                           ; preds = %OP1318.SWAP4.contd
  %3535 = sub i64 %stack_len4715, 1
  %sp4717 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3535
  %swap.a4718 = load i256, ptr %sp4717, align 16
  %3536 = sub i64 %stack_len4715, 5
  %sp4719 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3536
  %swap.b4720 = load i256, ptr %sp4719, align 16
  store i256 %swap.a4718, ptr %sp4719, align 16
  store i256 %swap.b4720, ptr %sp4717, align 16
  br label %OP1319.POP, !annotation !5

OP1319.POP:                                       ; preds = %OP1318.SWAP4.contd4716
  %stack_len4721 = load i64, ptr %len.addr, align 8
  %3537 = add i64 %stack_len4721, -1
  store i64 %3537, ptr %len.addr, align 8
  br label %OP1320.POP, !annotation !5

OP1320.POP:                                       ; preds = %OP1319.POP
  %stack_len4722 = load i64, ptr %len.addr, align 8
  %3538 = add i64 %stack_len4722, -1
  store i64 %3538, ptr %len.addr, align 8
  br label %OP1321.POP, !annotation !5

OP1321.POP:                                       ; preds = %OP1320.POP
  %stack_len4723 = load i64, ptr %len.addr, align 8
  %3539 = add i64 %stack_len4723, -1
  store i64 %3539, ptr %len.addr, align 8
  br label %OP1322.POP, !annotation !5

OP1322.POP:                                       ; preds = %OP1321.POP
  %stack_len4724 = load i64, ptr %len.addr, align 8
  %3540 = add i64 %stack_len4724, -1
  store i64 %3540, ptr %len.addr, align 8
  br label %OP1323.ISZERO, !annotation !5

OP1323.ISZERO:                                    ; preds = %OP1322.POP
  %stack_len4725 = load i64, ptr %len.addr, align 8
  %3541 = add i64 %stack_len4725, -1
  %sp4726 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3541
  %a4727 = load i256, ptr %sp4726, align 16
  %3542 = icmp eq i256 %a4727, 0
  %3543 = zext i1 %3542 to i256
  %3544 = add i64 %stack_len4725, -1
  %sp4728 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3544
  store i256 %3543, ptr %sp4728, align 16
  br label %OP1324.ISZERO, !annotation !5

OP1324.ISZERO:                                    ; preds = %OP1323.ISZERO
  %stack_len4729 = load i64, ptr %len.addr, align 8
  %3545 = add i64 %stack_len4729, -1
  %sp4730 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3545
  %a4731 = load i256, ptr %sp4730, align 16
  %3546 = icmp eq i256 %a4731, 0
  %3547 = zext i1 %3546 to i256
  %3548 = add i64 %stack_len4729, -1
  %sp4732 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3548
  store i256 %3547, ptr %sp4732, align 16
  br label %OP1325.PUSH2, !annotation !5

OP1325.PUSH2:                                     ; preds = %OP1324.ISZERO
  br label %OP1326.JUMPI, !annotation !6

OP1326.JUMPI:                                     ; preds = %OP1325.PUSH2
  %stack_len4733 = load i64, ptr %len.addr, align 8
  %3549 = add i64 %stack_len4733, -1
  store i64 %3549, ptr %len.addr, align 8
  %3550 = add i64 %stack_len4733, -1
  %sp4734 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3550
  %a4735 = load i256, ptr %sp4734, align 16
  %3551 = icmp ne i256 %a4735, 0
  br i1 %3551, label %OP1330.JUMPDEST, label %OP1327.PUSH1

OP1327.PUSH1:                                     ; preds = %OP1326.JUMPI
  %gas.remaining4736 = load i64, ptr %gas.remaining.addr, align 8
  %3552 = sub i64 %gas.remaining4736, 6
  %3553 = icmp ult i64 %gas.remaining4736, 6
  store i64 %3552, ptr %gas.remaining.addr, align 8
  br i1 %3553, label %return, label %OP1327.PUSH1.contd, !prof !2, !annotation !3

OP1327.PUSH1.contd:                               ; preds = %OP1327.PUSH1
  %stack_len4737 = load i64, ptr %len.addr, align 8
  %3554 = icmp ugt i64 %stack_len4737, 1022
  br i1 %3554, label %return, label %OP1327.PUSH1.contd4738, !prof !2, !annotation !4

OP1327.PUSH1.contd4738:                           ; preds = %OP1327.PUSH1.contd
  %3555 = add i64 %stack_len4737, 1
  store i64 %3555, ptr %len.addr, align 8
  %sp4739 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4737
  store i256 0, ptr %sp4739, align 16
  br label %OP1328.DUP1, !annotation !5

OP1328.DUP1:                                      ; preds = %OP1327.PUSH1.contd4738
  %stack_len4740 = load i64, ptr %len.addr, align 8
  %3556 = add i64 %stack_len4740, 1
  store i64 %3556, ptr %len.addr, align 8
  %3557 = sub i64 %stack_len4740, 1
  %sp4741 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3557
  %dup14742 = load i256, ptr %sp4741, align 16
  %sp4743 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4740
  store i256 %dup14742, ptr %sp4743, align 16
  br label %OP1329.REVERT, !annotation !5

OP1329.REVERT:                                    ; preds = %OP1328.DUP1
  %stack_len4744 = load i64, ptr %len.addr, align 8
  %3558 = add i64 %stack_len4744, -2
  store i64 %3558, ptr %len.addr, align 8
  %3559 = sub i64 %stack_len4744, 2
  %sp4745 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3559
  %3560 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp4745, i8 16)
  %3561 = icmp ne i8 %3560, 0
  br i1 %3561, label %return, label %OP1329.REVERT.contd, !prof !2

OP1329.REVERT.contd:                              ; preds = %OP1329.REVERT
  br label %return, !annotation !8

OP1330.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1326.JUMPI
  %gas.remaining4746 = load i64, ptr %gas.remaining.addr, align 8
  %3562 = sub i64 %gas.remaining4746, 1199
  %3563 = icmp ult i64 %gas.remaining4746, 1199
  store i64 %3562, ptr %gas.remaining.addr, align 8
  br i1 %3563, label %return, label %OP1330.JUMPDEST.contd, !prof !2, !annotation !3

OP1330.JUMPDEST.contd:                            ; preds = %OP1330.JUMPDEST
  %stack_len4747 = load i64, ptr %len.addr, align 8
  %3564 = icmp ult i64 %stack_len4747, 2
  %3565 = icmp ugt i64 %stack_len4747, 1017
  %3566 = or i1 %3564, %3565
  %3567 = select i1 %3564, i8 91, i8 92
  br i1 %3566, label %return, label %OP1330.JUMPDEST.contd4748, !prof !2

OP1330.JUMPDEST.contd4748:                        ; preds = %OP1330.JUMPDEST.contd
  br label %OP1331.CALLER, !annotation !5

OP1331.CALLER:                                    ; preds = %OP1330.JUMPDEST.contd4748
  %stack_len4749 = load i64, ptr %len.addr, align 8
  %3568 = add i64 %stack_len4749, 1
  store i64 %3568, ptr %len.addr, align 8
  %contract.caller.addr4750 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4751 = load i160, ptr %contract.caller.addr4750, align 16
  %3569 = call i160 @llvm.bswap.i160(i160 %contract.caller4751)
  %3570 = zext i160 %3569 to i256
  %sp4752 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4749
  store i256 %3570, ptr %sp4752, align 16
  br label %OP1332.PUSH20, !annotation !5

OP1332.PUSH20:                                    ; preds = %OP1331.CALLER
  %stack_len4753 = load i64, ptr %len.addr, align 8
  %3571 = add i64 %stack_len4753, 1
  store i64 %3571, ptr %len.addr, align 8
  %sp4754 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4753
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp4754, align 16
  br label %OP1333.AND, !annotation !5

OP1333.AND:                                       ; preds = %OP1332.PUSH20
  %stack_len4755 = load i64, ptr %len.addr, align 8
  %3572 = add i64 %stack_len4755, -1
  store i64 %3572, ptr %len.addr, align 8
  %3573 = add i64 %stack_len4755, -1
  %sp4756 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3573
  %a4757 = load i256, ptr %sp4756, align 16
  %3574 = add i64 %stack_len4755, -2
  %sp4758 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3574
  %b4759 = load i256, ptr %sp4758, align 16
  %3575 = and i256 %a4757, %b4759
  %3576 = add i64 %stack_len4755, -2
  %sp4760 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3576
  store i256 %3575, ptr %sp4760, align 16
  br label %OP1334.PUSH32, !annotation !5

OP1334.PUSH32:                                    ; preds = %OP1333.AND
  %stack_len4761 = load i64, ptr %len.addr, align 8
  %3577 = add i64 %stack_len4761, 1
  store i64 %3577, ptr %len.addr, align 8
  %sp4762 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4761
  store i256 57810043145978950376228313794938171962422655018555593468903716172405399886693, ptr %sp4762, align 16
  br label %OP1335.DUP3, !annotation !5

OP1335.DUP3:                                      ; preds = %OP1334.PUSH32
  %stack_len4763 = load i64, ptr %len.addr, align 8
  %3578 = add i64 %stack_len4763, 1
  store i64 %3578, ptr %len.addr, align 8
  %3579 = sub i64 %stack_len4763, 3
  %sp4764 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3579
  %dup34765 = load i256, ptr %sp4764, align 16
  %sp4766 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4763
  store i256 %dup34765, ptr %sp4766, align 16
  br label %OP1336.PUSH1, !annotation !5

OP1336.PUSH1:                                     ; preds = %OP1335.DUP3
  %stack_len4767 = load i64, ptr %len.addr, align 8
  %3580 = add i64 %stack_len4767, 1
  store i64 %3580, ptr %len.addr, align 8
  %sp4768 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4767
  store i256 64, ptr %sp4768, align 16
  br label %OP1337.MLOAD, !annotation !5

OP1337.MLOAD:                                     ; preds = %OP1336.PUSH1
  %stack_len4769 = load i64, ptr %len.addr, align 8
  %3581 = add i64 %stack_len4769, -1
  %sp4770 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3581
  %a4771 = load i256, ptr %sp4770, align 16
  %mload.out.slot4772 = alloca i256, align 16
  %3582 = call i8 @__revmc_ir_builtin_mload(i256 %a4771, ptr %mload.out.slot4772, ptr %arg.ecx.addr)
  %3583 = icmp ne i8 %3582, 0
  br i1 %3583, label %return, label %OP1337.MLOAD.contd, !prof !2

OP1337.MLOAD.contd:                               ; preds = %OP1337.MLOAD
  %mload.out4773 = load i256, ptr %mload.out.slot4772, align 16
  %3584 = add i64 %stack_len4769, -1
  %sp4774 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3584
  store i256 %mload.out4773, ptr %sp4774, align 16
  br label %OP1338.DUP1, !annotation !5

OP1338.DUP1:                                      ; preds = %OP1337.MLOAD.contd
  %stack_len4775 = load i64, ptr %len.addr, align 8
  %3585 = add i64 %stack_len4775, 1
  store i64 %3585, ptr %len.addr, align 8
  %3586 = sub i64 %stack_len4775, 1
  %sp4776 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3586
  %dup14777 = load i256, ptr %sp4776, align 16
  %sp4778 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4775
  store i256 %dup14777, ptr %sp4778, align 16
  br label %OP1339.DUP3, !annotation !5

OP1339.DUP3:                                      ; preds = %OP1338.DUP1
  %stack_len4779 = load i64, ptr %len.addr, align 8
  %3587 = add i64 %stack_len4779, 1
  store i64 %3587, ptr %len.addr, align 8
  %3588 = sub i64 %stack_len4779, 3
  %sp4780 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3588
  %dup34781 = load i256, ptr %sp4780, align 16
  %sp4782 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4779
  store i256 %dup34781, ptr %sp4782, align 16
  br label %OP1340.DUP2, !annotation !5

OP1340.DUP2:                                      ; preds = %OP1339.DUP3
  %stack_len4783 = load i64, ptr %len.addr, align 8
  %3589 = add i64 %stack_len4783, 1
  store i64 %3589, ptr %len.addr, align 8
  %3590 = sub i64 %stack_len4783, 2
  %sp4784 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3590
  %dup24785 = load i256, ptr %sp4784, align 16
  %sp4786 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4783
  store i256 %dup24785, ptr %sp4786, align 16
  br label %OP1341.MSTORE, !annotation !5

OP1341.MSTORE:                                    ; preds = %OP1340.DUP2
  %stack_len4787 = load i64, ptr %len.addr, align 8
  %3591 = add i64 %stack_len4787, -2
  store i64 %3591, ptr %len.addr, align 8
  %3592 = add i64 %stack_len4787, -1
  %sp4788 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3592
  %a4789 = load i256, ptr %sp4788, align 16
  %3593 = add i64 %stack_len4787, -2
  %sp4790 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3593
  %b4791 = load i256, ptr %sp4790, align 16
  %3594 = call i8 @__revmc_ir_builtin_mstore(i256 %a4789, i256 %b4791, ptr %arg.ecx.addr)
  %3595 = icmp ne i8 %3594, 0
  br i1 %3595, label %return, label %OP1341.MSTORE.contd, !prof !2

OP1341.MSTORE.contd:                              ; preds = %OP1341.MSTORE
  br label %OP1342.PUSH1, !annotation !5

OP1342.PUSH1:                                     ; preds = %OP1341.MSTORE.contd
  %stack_len4792 = load i64, ptr %len.addr, align 8
  %3596 = add i64 %stack_len4792, 1
  store i64 %3596, ptr %len.addr, align 8
  %sp4793 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4792
  store i256 32, ptr %sp4793, align 16
  br label %OP1343.ADD, !annotation !5

OP1343.ADD:                                       ; preds = %OP1342.PUSH1
  %stack_len4794 = load i64, ptr %len.addr, align 8
  %3597 = add i64 %stack_len4794, -1
  store i64 %3597, ptr %len.addr, align 8
  %3598 = add i64 %stack_len4794, -1
  %sp4795 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3598
  %a4796 = load i256, ptr %sp4795, align 16
  %3599 = add i64 %stack_len4794, -2
  %sp4797 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3599
  %b4798 = load i256, ptr %sp4797, align 16
  %3600 = add i256 %a4796, %b4798
  %3601 = add i64 %stack_len4794, -2
  %sp4799 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3601
  store i256 %3600, ptr %sp4799, align 16
  br label %OP1344.SWAP2, !annotation !5

OP1344.SWAP2:                                     ; preds = %OP1343.ADD
  %stack_len4800 = load i64, ptr %len.addr, align 8
  %3602 = sub i64 %stack_len4800, 1
  %sp4801 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3602
  %swap.a4802 = load i256, ptr %sp4801, align 16
  %3603 = sub i64 %stack_len4800, 3
  %sp4803 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3603
  %swap.b4804 = load i256, ptr %sp4803, align 16
  store i256 %swap.a4802, ptr %sp4803, align 16
  store i256 %swap.b4804, ptr %sp4801, align 16
  br label %OP1345.POP, !annotation !5

OP1345.POP:                                       ; preds = %OP1344.SWAP2
  %stack_len4805 = load i64, ptr %len.addr, align 8
  %3604 = add i64 %stack_len4805, -1
  store i64 %3604, ptr %len.addr, align 8
  br label %OP1346.POP, !annotation !5

OP1346.POP:                                       ; preds = %OP1345.POP
  %stack_len4806 = load i64, ptr %len.addr, align 8
  %3605 = add i64 %stack_len4806, -1
  store i64 %3605, ptr %len.addr, align 8
  br label %OP1347.PUSH1, !annotation !5

OP1347.PUSH1:                                     ; preds = %OP1346.POP
  %stack_len4807 = load i64, ptr %len.addr, align 8
  %3606 = add i64 %stack_len4807, 1
  store i64 %3606, ptr %len.addr, align 8
  %sp4808 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4807
  store i256 64, ptr %sp4808, align 16
  br label %OP1348.MLOAD, !annotation !5

OP1348.MLOAD:                                     ; preds = %OP1347.PUSH1
  %stack_len4809 = load i64, ptr %len.addr, align 8
  %3607 = add i64 %stack_len4809, -1
  %sp4810 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3607
  %a4811 = load i256, ptr %sp4810, align 16
  %mload.out.slot4812 = alloca i256, align 16
  %3608 = call i8 @__revmc_ir_builtin_mload(i256 %a4811, ptr %mload.out.slot4812, ptr %arg.ecx.addr)
  %3609 = icmp ne i8 %3608, 0
  br i1 %3609, label %return, label %OP1348.MLOAD.contd, !prof !2

OP1348.MLOAD.contd:                               ; preds = %OP1348.MLOAD
  %mload.out4813 = load i256, ptr %mload.out.slot4812, align 16
  %3610 = add i64 %stack_len4809, -1
  %sp4814 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3610
  store i256 %mload.out4813, ptr %sp4814, align 16
  br label %OP1349.DUP1, !annotation !5

OP1349.DUP1:                                      ; preds = %OP1348.MLOAD.contd
  %stack_len4815 = load i64, ptr %len.addr, align 8
  %3611 = add i64 %stack_len4815, 1
  store i64 %3611, ptr %len.addr, align 8
  %3612 = sub i64 %stack_len4815, 1
  %sp4816 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3612
  %dup14817 = load i256, ptr %sp4816, align 16
  %sp4818 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4815
  store i256 %dup14817, ptr %sp4818, align 16
  br label %OP1350.SWAP2, !annotation !5

OP1350.SWAP2:                                     ; preds = %OP1349.DUP1
  %stack_len4819 = load i64, ptr %len.addr, align 8
  %3613 = sub i64 %stack_len4819, 1
  %sp4820 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3613
  %swap.a4821 = load i256, ptr %sp4820, align 16
  %3614 = sub i64 %stack_len4819, 3
  %sp4822 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3614
  %swap.b4823 = load i256, ptr %sp4822, align 16
  store i256 %swap.a4821, ptr %sp4822, align 16
  store i256 %swap.b4823, ptr %sp4820, align 16
  br label %OP1351.SUB, !annotation !5

OP1351.SUB:                                       ; preds = %OP1350.SWAP2
  %stack_len4824 = load i64, ptr %len.addr, align 8
  %3615 = add i64 %stack_len4824, -1
  store i64 %3615, ptr %len.addr, align 8
  %3616 = add i64 %stack_len4824, -1
  %sp4825 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3616
  %a4826 = load i256, ptr %sp4825, align 16
  %3617 = add i64 %stack_len4824, -2
  %sp4827 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3617
  %b4828 = load i256, ptr %sp4827, align 16
  %3618 = sub i256 %a4826, %b4828
  %3619 = add i64 %stack_len4824, -2
  %sp4829 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3619
  store i256 %3618, ptr %sp4829, align 16
  br label %OP1352.SWAP1, !annotation !5

OP1352.SWAP1:                                     ; preds = %OP1351.SUB
  %stack_len4830 = load i64, ptr %len.addr, align 8
  %3620 = sub i64 %stack_len4830, 1
  %sp4831 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3620
  %swap.a4832 = load i256, ptr %sp4831, align 16
  %3621 = sub i64 %stack_len4830, 2
  %sp4833 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3621
  %swap.b4834 = load i256, ptr %sp4833, align 16
  store i256 %swap.a4832, ptr %sp4833, align 16
  store i256 %swap.b4834, ptr %sp4831, align 16
  br label %OP1353.LOG2, !annotation !5

OP1353.LOG2:                                      ; preds = %OP1352.SWAP1
  %stack_len4835 = load i64, ptr %len.addr, align 8
  %3622 = add i64 %stack_len4835, -4
  store i64 %3622, ptr %len.addr, align 8
  %3623 = sub i64 %stack_len4835, 4
  %sp4836 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3623
  %3624 = call i8 @__revmc_builtin_log(ptr %arg.ecx.addr, ptr %sp4836, i8 2)
  %3625 = icmp ne i8 %3624, 0
  br i1 %3625, label %return, label %OP1353.LOG2.contd, !prof !2

OP1353.LOG2.contd:                                ; preds = %OP1353.LOG2
  br label %OP1354.POP, !annotation !5

OP1354.POP:                                       ; preds = %OP1353.LOG2.contd
  %stack_len4837 = load i64, ptr %len.addr, align 8
  %3626 = add i64 %stack_len4837, -1
  store i64 %3626, ptr %len.addr, align 8
  br label %OP1355.JUMP, !annotation !5

OP1355.JUMP:                                      ; preds = %OP1354.POP
  %stack_len4838 = load i64, ptr %len.addr, align 8
  %3627 = add i64 %stack_len4838, -1
  store i64 %3627, ptr %len.addr, align 8
  %3628 = add i64 %stack_len4838, -1
  %sp4839 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3628
  %a4840 = load i256, ptr %sp4839, align 16
  br label %dynamic_jump_table

OP1356.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP384.JUMP
  %gas.remaining4841 = load i64, ptr %gas.remaining.addr, align 8
  %3629 = sub i64 %gas.remaining4841, 51
  %3630 = icmp ult i64 %gas.remaining4841, 51
  store i64 %3629, ptr %gas.remaining.addr, align 8
  br i1 %3630, label %return, label %OP1356.JUMPDEST.contd, !prof !2, !annotation !3

OP1356.JUMPDEST.contd:                            ; preds = %OP1356.JUMPDEST
  %stack_len4842 = load i64, ptr %len.addr, align 8
  %3631 = icmp ult i64 %stack_len4842, 1
  %3632 = icmp ugt i64 %stack_len4842, 1021
  %3633 = or i1 %3631, %3632
  %3634 = select i1 %3631, i8 91, i8 92
  br i1 %3633, label %return, label %OP1356.JUMPDEST.contd4843, !prof !2

OP1356.JUMPDEST.contd4843:                        ; preds = %OP1356.JUMPDEST.contd
  br label %OP1357.PUSH1, !annotation !5

OP1357.PUSH1:                                     ; preds = %OP1356.JUMPDEST.contd4843
  %stack_len4844 = load i64, ptr %len.addr, align 8
  %3635 = add i64 %stack_len4844, 1
  store i64 %3635, ptr %len.addr, align 8
  %sp4845 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4844
  store i256 2, ptr %sp4845, align 16
  br label %OP1358.PUSH1, !annotation !5

OP1358.PUSH1:                                     ; preds = %OP1357.PUSH1
  %stack_len4846 = load i64, ptr %len.addr, align 8
  %3636 = add i64 %stack_len4846, 1
  store i64 %3636, ptr %len.addr, align 8
  %sp4847 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4846
  store i256 0, ptr %sp4847, align 16
  br label %OP1359.SWAP1, !annotation !5

OP1359.SWAP1:                                     ; preds = %OP1358.PUSH1
  %stack_len4848 = load i64, ptr %len.addr, align 8
  %3637 = sub i64 %stack_len4848, 1
  %sp4849 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3637
  %swap.a4850 = load i256, ptr %sp4849, align 16
  %3638 = sub i64 %stack_len4848, 2
  %sp4851 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3638
  %swap.b4852 = load i256, ptr %sp4851, align 16
  store i256 %swap.a4850, ptr %sp4851, align 16
  store i256 %swap.b4852, ptr %sp4849, align 16
  br label %OP1360.SLOAD, !annotation !5

OP1360.SLOAD:                                     ; preds = %OP1359.SWAP1
  %stack_len4853 = load i64, ptr %len.addr, align 8
  %3639 = sub i64 %stack_len4853, 1
  %sp4854 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3639
  %3640 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4854, i8 19)
  %3641 = icmp ne i8 %3640, 0
  br i1 %3641, label %return, label %OP1360.SLOAD.contd, !prof !2

OP1360.SLOAD.contd:                               ; preds = %OP1360.SLOAD
  br label %OP1361.SWAP1, !annotation !5

OP1361.SWAP1:                                     ; preds = %OP1360.SLOAD.contd
  %stack_len4855 = load i64, ptr %len.addr, align 8
  %3642 = sub i64 %stack_len4855, 1
  %sp4856 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3642
  %swap.a4857 = load i256, ptr %sp4856, align 16
  %3643 = sub i64 %stack_len4855, 2
  %sp4858 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3643
  %swap.b4859 = load i256, ptr %sp4858, align 16
  store i256 %swap.a4857, ptr %sp4858, align 16
  store i256 %swap.b4859, ptr %sp4856, align 16
  br label %OP1362.PUSH2, !annotation !5

OP1362.PUSH2:                                     ; preds = %OP1361.SWAP1
  %stack_len4860 = load i64, ptr %len.addr, align 8
  %3644 = add i64 %stack_len4860, 1
  store i64 %3644, ptr %len.addr, align 8
  %sp4861 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4860
  store i256 256, ptr %sp4861, align 16
  br label %OP1363.EXP, !annotation !5

OP1363.EXP:                                       ; preds = %OP1362.PUSH2
  %stack_len4862 = load i64, ptr %len.addr, align 8
  %3645 = add i64 %stack_len4862, -1
  store i64 %3645, ptr %len.addr, align 8
  %3646 = sub i64 %stack_len4862, 2
  %sp4863 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3646
  %3647 = call i8 @__revmc_builtin_exp(ptr %arg.ecx.addr, ptr %sp4863, i8 19)
  %3648 = icmp ne i8 %3647, 0
  br i1 %3648, label %return, label %OP1363.EXP.contd, !prof !2

OP1363.EXP.contd:                                 ; preds = %OP1363.EXP
  br label %OP1364.SWAP1, !annotation !5

OP1364.SWAP1:                                     ; preds = %OP1363.EXP.contd
  %stack_len4864 = load i64, ptr %len.addr, align 8
  %3649 = sub i64 %stack_len4864, 1
  %sp4865 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3649
  %swap.a4866 = load i256, ptr %sp4865, align 16
  %3650 = sub i64 %stack_len4864, 2
  %sp4867 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3650
  %swap.b4868 = load i256, ptr %sp4867, align 16
  store i256 %swap.a4866, ptr %sp4867, align 16
  store i256 %swap.b4868, ptr %sp4865, align 16
  br label %OP1365.DIV, !annotation !5

OP1365.DIV:                                       ; preds = %OP1364.SWAP1
  %stack_len4869 = load i64, ptr %len.addr, align 8
  %3651 = add i64 %stack_len4869, -1
  store i64 %3651, ptr %len.addr, align 8
  %3652 = add i64 %stack_len4869, -1
  %sp4870 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3652
  %a4871 = load i256, ptr %sp4870, align 16
  %3653 = add i64 %stack_len4869, -2
  %sp4872 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3653
  %b4873 = load i256, ptr %sp4872, align 16
  %3654 = icmp eq i256 %b4873, 0
  %3655 = udiv i256 %a4871, %b4873
  %3656 = select i1 %3654, i256 0, i256 %3655
  %3657 = add i64 %stack_len4869, -2
  %sp4874 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3657
  store i256 %3656, ptr %sp4874, align 16
  br label %OP1366.PUSH1, !annotation !5

OP1366.PUSH1:                                     ; preds = %OP1365.DIV
  %stack_len4875 = load i64, ptr %len.addr, align 8
  %3658 = add i64 %stack_len4875, 1
  store i64 %3658, ptr %len.addr, align 8
  %sp4876 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4875
  store i256 255, ptr %sp4876, align 16
  br label %OP1367.AND, !annotation !5

OP1367.AND:                                       ; preds = %OP1366.PUSH1
  %stack_len4877 = load i64, ptr %len.addr, align 8
  %3659 = add i64 %stack_len4877, -1
  store i64 %3659, ptr %len.addr, align 8
  %3660 = add i64 %stack_len4877, -1
  %sp4878 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3660
  %a4879 = load i256, ptr %sp4878, align 16
  %3661 = add i64 %stack_len4877, -2
  %sp4880 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3661
  %b4881 = load i256, ptr %sp4880, align 16
  %3662 = and i256 %a4879, %b4881
  %3663 = add i64 %stack_len4877, -2
  %sp4882 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3663
  store i256 %3662, ptr %sp4882, align 16
  br label %OP1368.DUP2, !annotation !5

OP1368.DUP2:                                      ; preds = %OP1367.AND
  %stack_len4883 = load i64, ptr %len.addr, align 8
  %3664 = add i64 %stack_len4883, 1
  store i64 %3664, ptr %len.addr, align 8
  %3665 = sub i64 %stack_len4883, 2
  %sp4884 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3665
  %dup24885 = load i256, ptr %sp4884, align 16
  %sp4886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4883
  store i256 %dup24885, ptr %sp4886, align 16
  br label %OP1369.JUMP, !annotation !5

OP1369.JUMP:                                      ; preds = %OP1368.DUP2
  %stack_len4887 = load i64, ptr %len.addr, align 8
  %3666 = add i64 %stack_len4887, -1
  store i64 %3666, ptr %len.addr, align 8
  %3667 = add i64 %stack_len4887, -1
  %sp4888 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3667
  %a4889 = load i256, ptr %sp4888, align 16
  br label %dynamic_jump_table

OP1370.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP433.JUMP
  %gas.remaining4890 = load i64, ptr %gas.remaining.addr, align 8
  %3668 = sub i64 %gas.remaining4890, 79
  %3669 = icmp ult i64 %gas.remaining4890, 79
  store i64 %3668, ptr %gas.remaining.addr, align 8
  br i1 %3669, label %return, label %OP1370.JUMPDEST.contd, !prof !2, !annotation !3

OP1370.JUMPDEST.contd:                            ; preds = %OP1370.JUMPDEST
  %stack_len4891 = load i64, ptr %len.addr, align 8
  %3670 = icmp ult i64 %stack_len4891, 2
  %3671 = icmp ugt i64 %stack_len4891, 1022
  %3672 = or i1 %3670, %3671
  %3673 = select i1 %3670, i8 91, i8 92
  br i1 %3672, label %return, label %OP1370.JUMPDEST.contd4892, !prof !2

OP1370.JUMPDEST.contd4892:                        ; preds = %OP1370.JUMPDEST.contd
  br label %OP1371.PUSH1, !annotation !5

OP1371.PUSH1:                                     ; preds = %OP1370.JUMPDEST.contd4892
  %stack_len4893 = load i64, ptr %len.addr, align 8
  %3674 = add i64 %stack_len4893, 1
  store i64 %3674, ptr %len.addr, align 8
  %sp4894 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4893
  store i256 3, ptr %sp4894, align 16
  br label %OP1372.PUSH1, !annotation !5

OP1372.PUSH1:                                     ; preds = %OP1371.PUSH1
  %stack_len4895 = load i64, ptr %len.addr, align 8
  %3675 = add i64 %stack_len4895, 1
  store i64 %3675, ptr %len.addr, align 8
  %sp4896 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4895
  store i256 32, ptr %sp4896, align 16
  br label %OP1373.MSTORE, !annotation !5

OP1373.MSTORE:                                    ; preds = %OP1372.PUSH1
  %stack_len4897 = load i64, ptr %len.addr, align 8
  %3676 = add i64 %stack_len4897, -2
  store i64 %3676, ptr %len.addr, align 8
  %3677 = add i64 %stack_len4897, -1
  %sp4898 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3677
  %a4899 = load i256, ptr %sp4898, align 16
  %3678 = add i64 %stack_len4897, -2
  %sp4900 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3678
  %b4901 = load i256, ptr %sp4900, align 16
  %3679 = call i8 @__revmc_ir_builtin_mstore(i256 %a4899, i256 %b4901, ptr %arg.ecx.addr)
  %3680 = icmp ne i8 %3679, 0
  br i1 %3680, label %return, label %OP1373.MSTORE.contd, !prof !2

OP1373.MSTORE.contd:                              ; preds = %OP1373.MSTORE
  br label %OP1374.DUP1, !annotation !5

OP1374.DUP1:                                      ; preds = %OP1373.MSTORE.contd
  %stack_len4902 = load i64, ptr %len.addr, align 8
  %3681 = add i64 %stack_len4902, 1
  store i64 %3681, ptr %len.addr, align 8
  %3682 = sub i64 %stack_len4902, 1
  %sp4903 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3682
  %dup14904 = load i256, ptr %sp4903, align 16
  %sp4905 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4902
  store i256 %dup14904, ptr %sp4905, align 16
  br label %OP1375.PUSH1, !annotation !5

OP1375.PUSH1:                                     ; preds = %OP1374.DUP1
  %stack_len4906 = load i64, ptr %len.addr, align 8
  %3683 = add i64 %stack_len4906, 1
  store i64 %3683, ptr %len.addr, align 8
  %sp4907 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4906
  store i256 0, ptr %sp4907, align 16
  br label %OP1376.MSTORE, !annotation !5

OP1376.MSTORE:                                    ; preds = %OP1375.PUSH1
  %stack_len4908 = load i64, ptr %len.addr, align 8
  %3684 = add i64 %stack_len4908, -2
  store i64 %3684, ptr %len.addr, align 8
  %3685 = add i64 %stack_len4908, -1
  %sp4909 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3685
  %a4910 = load i256, ptr %sp4909, align 16
  %3686 = add i64 %stack_len4908, -2
  %sp4911 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3686
  %b4912 = load i256, ptr %sp4911, align 16
  %3687 = call i8 @__revmc_ir_builtin_mstore(i256 %a4910, i256 %b4912, ptr %arg.ecx.addr)
  %3688 = icmp ne i8 %3687, 0
  br i1 %3688, label %return, label %OP1376.MSTORE.contd, !prof !2

OP1376.MSTORE.contd:                              ; preds = %OP1376.MSTORE
  br label %OP1377.PUSH1, !annotation !5

OP1377.PUSH1:                                     ; preds = %OP1376.MSTORE.contd
  %stack_len4913 = load i64, ptr %len.addr, align 8
  %3689 = add i64 %stack_len4913, 1
  store i64 %3689, ptr %len.addr, align 8
  %sp4914 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4913
  store i256 64, ptr %sp4914, align 16
  br label %OP1378.PUSH1, !annotation !5

OP1378.PUSH1:                                     ; preds = %OP1377.PUSH1
  %stack_len4915 = load i64, ptr %len.addr, align 8
  %3690 = add i64 %stack_len4915, 1
  store i64 %3690, ptr %len.addr, align 8
  %sp4916 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4915
  store i256 0, ptr %sp4916, align 16
  br label %OP1379.KECCAK256, !annotation !5

OP1379.KECCAK256:                                 ; preds = %OP1378.PUSH1
  %stack_len4917 = load i64, ptr %len.addr, align 8
  %3691 = add i64 %stack_len4917, -1
  store i64 %3691, ptr %len.addr, align 8
  %3692 = sub i64 %stack_len4917, 2
  %sp4918 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3692
  %3693 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp4918)
  %3694 = icmp ne i8 %3693, 0
  br i1 %3694, label %return, label %OP1379.KECCAK256.contd, !prof !2

OP1379.KECCAK256.contd:                           ; preds = %OP1379.KECCAK256
  br label %OP1380.PUSH1, !annotation !5

OP1380.PUSH1:                                     ; preds = %OP1379.KECCAK256.contd
  %stack_len4919 = load i64, ptr %len.addr, align 8
  %3695 = add i64 %stack_len4919, 1
  store i64 %3695, ptr %len.addr, align 8
  %sp4920 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4919
  store i256 0, ptr %sp4920, align 16
  br label %OP1381.SWAP2, !annotation !5

OP1381.SWAP2:                                     ; preds = %OP1380.PUSH1
  %stack_len4921 = load i64, ptr %len.addr, align 8
  %3696 = sub i64 %stack_len4921, 1
  %sp4922 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3696
  %swap.a4923 = load i256, ptr %sp4922, align 16
  %3697 = sub i64 %stack_len4921, 3
  %sp4924 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3697
  %swap.b4925 = load i256, ptr %sp4924, align 16
  store i256 %swap.a4923, ptr %sp4924, align 16
  store i256 %swap.b4925, ptr %sp4922, align 16
  br label %OP1382.POP, !annotation !5

OP1382.POP:                                       ; preds = %OP1381.SWAP2
  %stack_len4926 = load i64, ptr %len.addr, align 8
  %3698 = add i64 %stack_len4926, -1
  store i64 %3698, ptr %len.addr, align 8
  br label %OP1383.SWAP1, !annotation !5

OP1383.SWAP1:                                     ; preds = %OP1382.POP
  %stack_len4927 = load i64, ptr %len.addr, align 8
  %3699 = sub i64 %stack_len4927, 1
  %sp4928 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3699
  %swap.a4929 = load i256, ptr %sp4928, align 16
  %3700 = sub i64 %stack_len4927, 2
  %sp4930 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3700
  %swap.b4931 = load i256, ptr %sp4930, align 16
  store i256 %swap.a4929, ptr %sp4930, align 16
  store i256 %swap.b4931, ptr %sp4928, align 16
  br label %OP1384.POP, !annotation !5

OP1384.POP:                                       ; preds = %OP1383.SWAP1
  %stack_len4932 = load i64, ptr %len.addr, align 8
  %3701 = add i64 %stack_len4932, -1
  store i64 %3701, ptr %len.addr, align 8
  br label %OP1385.SLOAD, !annotation !5

OP1385.SLOAD:                                     ; preds = %OP1384.POP
  %stack_len4933 = load i64, ptr %len.addr, align 8
  %3702 = sub i64 %stack_len4933, 1
  %sp4934 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3702
  %3703 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4934, i8 19)
  %3704 = icmp ne i8 %3703, 0
  br i1 %3704, label %return, label %OP1385.SLOAD.contd, !prof !2

OP1385.SLOAD.contd:                               ; preds = %OP1385.SLOAD
  br label %OP1386.DUP2, !annotation !5

OP1386.DUP2:                                      ; preds = %OP1385.SLOAD.contd
  %stack_len4935 = load i64, ptr %len.addr, align 8
  %3705 = add i64 %stack_len4935, 1
  store i64 %3705, ptr %len.addr, align 8
  %3706 = sub i64 %stack_len4935, 2
  %sp4936 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3706
  %dup24937 = load i256, ptr %sp4936, align 16
  %sp4938 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4935
  store i256 %dup24937, ptr %sp4938, align 16
  br label %OP1387.JUMP, !annotation !5

OP1387.JUMP:                                      ; preds = %OP1386.DUP2
  %stack_len4939 = load i64, ptr %len.addr, align 8
  %3707 = add i64 %stack_len4939, -1
  store i64 %3707, ptr %len.addr, align 8
  %3708 = add i64 %stack_len4939, -1
  %sp4940 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3708
  %a4941 = load i256, ptr %sp4940, align 16
  br label %dynamic_jump_table

OP1388.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP464.JUMP
  %gas.remaining4942 = load i64, ptr %gas.remaining.addr, align 8
  %3709 = sub i64 %gas.remaining4942, 194
  %3710 = icmp ult i64 %gas.remaining4942, 194
  store i64 %3709, ptr %gas.remaining.addr, align 8
  br i1 %3710, label %return, label %OP1388.JUMPDEST.contd, !prof !2, !annotation !3

OP1388.JUMPDEST.contd:                            ; preds = %OP1388.JUMPDEST
  %stack_len4943 = load i64, ptr %len.addr, align 8
  %3711 = icmp ugt i64 %stack_len4943, 1015
  br i1 %3711, label %return, label %OP1388.JUMPDEST.contd4944, !prof !2, !annotation !4

OP1388.JUMPDEST.contd4944:                        ; preds = %OP1388.JUMPDEST.contd
  br label %OP1389.PUSH1, !annotation !5

OP1389.PUSH1:                                     ; preds = %OP1388.JUMPDEST.contd4944
  %stack_len4945 = load i64, ptr %len.addr, align 8
  %3712 = add i64 %stack_len4945, 1
  store i64 %3712, ptr %len.addr, align 8
  %sp4946 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4945
  store i256 1, ptr %sp4946, align 16
  br label %OP1390.DUP1, !annotation !5

OP1390.DUP1:                                      ; preds = %OP1389.PUSH1
  %stack_len4947 = load i64, ptr %len.addr, align 8
  %3713 = add i64 %stack_len4947, 1
  store i64 %3713, ptr %len.addr, align 8
  %3714 = sub i64 %stack_len4947, 1
  %sp4948 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3714
  %dup14949 = load i256, ptr %sp4948, align 16
  %sp4950 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4947
  store i256 %dup14949, ptr %sp4950, align 16
  br label %OP1391.SLOAD, !annotation !5

OP1391.SLOAD:                                     ; preds = %OP1390.DUP1
  %stack_len4951 = load i64, ptr %len.addr, align 8
  %3715 = sub i64 %stack_len4951, 1
  %sp4952 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3715
  %3716 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp4952, i8 19)
  %3717 = icmp ne i8 %3716, 0
  br i1 %3717, label %return, label %OP1391.SLOAD.contd, !prof !2

OP1391.SLOAD.contd:                               ; preds = %OP1391.SLOAD
  br label %OP1392.PUSH1, !annotation !5

OP1392.PUSH1:                                     ; preds = %OP1391.SLOAD.contd
  %stack_len4953 = load i64, ptr %len.addr, align 8
  %3718 = add i64 %stack_len4953, 1
  store i64 %3718, ptr %len.addr, align 8
  %sp4954 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4953
  store i256 1, ptr %sp4954, align 16
  br label %OP1393.DUP2, !annotation !5

OP1393.DUP2:                                      ; preds = %OP1392.PUSH1
  %stack_len4955 = load i64, ptr %len.addr, align 8
  %3719 = add i64 %stack_len4955, 1
  store i64 %3719, ptr %len.addr, align 8
  %3720 = sub i64 %stack_len4955, 2
  %sp4956 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3720
  %dup24957 = load i256, ptr %sp4956, align 16
  %sp4958 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4955
  store i256 %dup24957, ptr %sp4958, align 16
  br label %OP1394.PUSH1, !annotation !5

OP1394.PUSH1:                                     ; preds = %OP1393.DUP2
  %stack_len4959 = load i64, ptr %len.addr, align 8
  %3721 = add i64 %stack_len4959, 1
  store i64 %3721, ptr %len.addr, align 8
  %sp4960 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4959
  store i256 1, ptr %sp4960, align 16
  br label %OP1395.AND, !annotation !5

OP1395.AND:                                       ; preds = %OP1394.PUSH1
  %stack_len4961 = load i64, ptr %len.addr, align 8
  %3722 = add i64 %stack_len4961, -1
  store i64 %3722, ptr %len.addr, align 8
  %3723 = add i64 %stack_len4961, -1
  %sp4962 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3723
  %a4963 = load i256, ptr %sp4962, align 16
  %3724 = add i64 %stack_len4961, -2
  %sp4964 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3724
  %b4965 = load i256, ptr %sp4964, align 16
  %3725 = and i256 %a4963, %b4965
  %3726 = add i64 %stack_len4961, -2
  %sp4966 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3726
  store i256 %3725, ptr %sp4966, align 16
  br label %OP1396.ISZERO, !annotation !5

OP1396.ISZERO:                                    ; preds = %OP1395.AND
  %stack_len4967 = load i64, ptr %len.addr, align 8
  %3727 = add i64 %stack_len4967, -1
  %sp4968 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3727
  %a4969 = load i256, ptr %sp4968, align 16
  %3728 = icmp eq i256 %a4969, 0
  %3729 = zext i1 %3728 to i256
  %3730 = add i64 %stack_len4967, -1
  %sp4970 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3730
  store i256 %3729, ptr %sp4970, align 16
  br label %OP1397.PUSH2, !annotation !5

OP1397.PUSH2:                                     ; preds = %OP1396.ISZERO
  %stack_len4971 = load i64, ptr %len.addr, align 8
  %3731 = add i64 %stack_len4971, 1
  store i64 %3731, ptr %len.addr, align 8
  %sp4972 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4971
  store i256 256, ptr %sp4972, align 16
  br label %OP1398.MUL, !annotation !5

OP1398.MUL:                                       ; preds = %OP1397.PUSH2
  %stack_len4973 = load i64, ptr %len.addr, align 8
  %3732 = add i64 %stack_len4973, -1
  store i64 %3732, ptr %len.addr, align 8
  %3733 = add i64 %stack_len4973, -1
  %sp4974 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3733
  %a4975 = load i256, ptr %sp4974, align 16
  %3734 = add i64 %stack_len4973, -2
  %sp4976 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3734
  %b4977 = load i256, ptr %sp4976, align 16
  %3735 = mul i256 %a4975, %b4977
  %3736 = add i64 %stack_len4973, -2
  %sp4978 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3736
  store i256 %3735, ptr %sp4978, align 16
  br label %OP1399.SUB, !annotation !5

OP1399.SUB:                                       ; preds = %OP1398.MUL
  %stack_len4979 = load i64, ptr %len.addr, align 8
  %3737 = add i64 %stack_len4979, -1
  store i64 %3737, ptr %len.addr, align 8
  %3738 = add i64 %stack_len4979, -1
  %sp4980 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3738
  %a4981 = load i256, ptr %sp4980, align 16
  %3739 = add i64 %stack_len4979, -2
  %sp4982 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3739
  %b4983 = load i256, ptr %sp4982, align 16
  %3740 = sub i256 %a4981, %b4983
  %3741 = add i64 %stack_len4979, -2
  %sp4984 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3741
  store i256 %3740, ptr %sp4984, align 16
  br label %OP1400.AND, !annotation !5

OP1400.AND:                                       ; preds = %OP1399.SUB
  %stack_len4985 = load i64, ptr %len.addr, align 8
  %3742 = add i64 %stack_len4985, -1
  store i64 %3742, ptr %len.addr, align 8
  %3743 = add i64 %stack_len4985, -1
  %sp4986 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3743
  %a4987 = load i256, ptr %sp4986, align 16
  %3744 = add i64 %stack_len4985, -2
  %sp4988 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3744
  %b4989 = load i256, ptr %sp4988, align 16
  %3745 = and i256 %a4987, %b4989
  %3746 = add i64 %stack_len4985, -2
  %sp4990 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3746
  store i256 %3745, ptr %sp4990, align 16
  br label %OP1401.PUSH1, !annotation !5

OP1401.PUSH1:                                     ; preds = %OP1400.AND
  %stack_len4991 = load i64, ptr %len.addr, align 8
  %3747 = add i64 %stack_len4991, 1
  store i64 %3747, ptr %len.addr, align 8
  %sp4992 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4991
  store i256 2, ptr %sp4992, align 16
  br label %OP1402.SWAP1, !annotation !5

OP1402.SWAP1:                                     ; preds = %OP1401.PUSH1
  %stack_len4993 = load i64, ptr %len.addr, align 8
  %3748 = sub i64 %stack_len4993, 1
  %sp4994 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3748
  %swap.a4995 = load i256, ptr %sp4994, align 16
  %3749 = sub i64 %stack_len4993, 2
  %sp4996 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3749
  %swap.b4997 = load i256, ptr %sp4996, align 16
  store i256 %swap.a4995, ptr %sp4996, align 16
  store i256 %swap.b4997, ptr %sp4994, align 16
  br label %OP1403.DIV, !annotation !5

OP1403.DIV:                                       ; preds = %OP1402.SWAP1
  %stack_len4998 = load i64, ptr %len.addr, align 8
  %3750 = add i64 %stack_len4998, -1
  store i64 %3750, ptr %len.addr, align 8
  %3751 = add i64 %stack_len4998, -1
  %sp4999 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3751
  %a5000 = load i256, ptr %sp4999, align 16
  %3752 = add i64 %stack_len4998, -2
  %sp5001 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3752
  %b5002 = load i256, ptr %sp5001, align 16
  %3753 = icmp eq i256 %b5002, 0
  %3754 = udiv i256 %a5000, %b5002
  %3755 = select i1 %3753, i256 0, i256 %3754
  %3756 = add i64 %stack_len4998, -2
  %sp5003 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3756
  store i256 %3755, ptr %sp5003, align 16
  br label %OP1404.DUP1, !annotation !5

OP1404.DUP1:                                      ; preds = %OP1403.DIV
  %stack_len5004 = load i64, ptr %len.addr, align 8
  %3757 = add i64 %stack_len5004, 1
  store i64 %3757, ptr %len.addr, align 8
  %3758 = sub i64 %stack_len5004, 1
  %sp5005 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3758
  %dup15006 = load i256, ptr %sp5005, align 16
  %sp5007 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5004
  store i256 %dup15006, ptr %sp5007, align 16
  br label %OP1405.PUSH1, !annotation !5

OP1405.PUSH1:                                     ; preds = %OP1404.DUP1
  %stack_len5008 = load i64, ptr %len.addr, align 8
  %3759 = add i64 %stack_len5008, 1
  store i64 %3759, ptr %len.addr, align 8
  %sp5009 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5008
  store i256 31, ptr %sp5009, align 16
  br label %OP1406.ADD, !annotation !5

OP1406.ADD:                                       ; preds = %OP1405.PUSH1
  %stack_len5010 = load i64, ptr %len.addr, align 8
  %3760 = add i64 %stack_len5010, -1
  store i64 %3760, ptr %len.addr, align 8
  %3761 = add i64 %stack_len5010, -1
  %sp5011 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3761
  %a5012 = load i256, ptr %sp5011, align 16
  %3762 = add i64 %stack_len5010, -2
  %sp5013 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3762
  %b5014 = load i256, ptr %sp5013, align 16
  %3763 = add i256 %a5012, %b5014
  %3764 = add i64 %stack_len5010, -2
  %sp5015 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3764
  store i256 %3763, ptr %sp5015, align 16
  br label %OP1407.PUSH1, !annotation !5

OP1407.PUSH1:                                     ; preds = %OP1406.ADD
  %stack_len5016 = load i64, ptr %len.addr, align 8
  %3765 = add i64 %stack_len5016, 1
  store i64 %3765, ptr %len.addr, align 8
  %sp5017 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5016
  store i256 32, ptr %sp5017, align 16
  br label %OP1408.DUP1, !annotation !5

OP1408.DUP1:                                      ; preds = %OP1407.PUSH1
  %stack_len5018 = load i64, ptr %len.addr, align 8
  %3766 = add i64 %stack_len5018, 1
  store i64 %3766, ptr %len.addr, align 8
  %3767 = sub i64 %stack_len5018, 1
  %sp5019 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3767
  %dup15020 = load i256, ptr %sp5019, align 16
  %sp5021 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5018
  store i256 %dup15020, ptr %sp5021, align 16
  br label %OP1409.SWAP2, !annotation !5

OP1409.SWAP2:                                     ; preds = %OP1408.DUP1
  %stack_len5022 = load i64, ptr %len.addr, align 8
  %3768 = sub i64 %stack_len5022, 1
  %sp5023 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3768
  %swap.a5024 = load i256, ptr %sp5023, align 16
  %3769 = sub i64 %stack_len5022, 3
  %sp5025 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3769
  %swap.b5026 = load i256, ptr %sp5025, align 16
  store i256 %swap.a5024, ptr %sp5025, align 16
  store i256 %swap.b5026, ptr %sp5023, align 16
  br label %OP1410.DIV, !annotation !5

OP1410.DIV:                                       ; preds = %OP1409.SWAP2
  %stack_len5027 = load i64, ptr %len.addr, align 8
  %3770 = add i64 %stack_len5027, -1
  store i64 %3770, ptr %len.addr, align 8
  %3771 = add i64 %stack_len5027, -1
  %sp5028 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3771
  %a5029 = load i256, ptr %sp5028, align 16
  %3772 = add i64 %stack_len5027, -2
  %sp5030 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3772
  %b5031 = load i256, ptr %sp5030, align 16
  %3773 = icmp eq i256 %b5031, 0
  %3774 = udiv i256 %a5029, %b5031
  %3775 = select i1 %3773, i256 0, i256 %3774
  %3776 = add i64 %stack_len5027, -2
  %sp5032 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3776
  store i256 %3775, ptr %sp5032, align 16
  br label %OP1411.MUL, !annotation !5

OP1411.MUL:                                       ; preds = %OP1410.DIV
  %stack_len5033 = load i64, ptr %len.addr, align 8
  %3777 = add i64 %stack_len5033, -1
  store i64 %3777, ptr %len.addr, align 8
  %3778 = add i64 %stack_len5033, -1
  %sp5034 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3778
  %a5035 = load i256, ptr %sp5034, align 16
  %3779 = add i64 %stack_len5033, -2
  %sp5036 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3779
  %b5037 = load i256, ptr %sp5036, align 16
  %3780 = mul i256 %a5035, %b5037
  %3781 = add i64 %stack_len5033, -2
  %sp5038 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3781
  store i256 %3780, ptr %sp5038, align 16
  br label %OP1412.PUSH1, !annotation !5

OP1412.PUSH1:                                     ; preds = %OP1411.MUL
  %stack_len5039 = load i64, ptr %len.addr, align 8
  %3782 = add i64 %stack_len5039, 1
  store i64 %3782, ptr %len.addr, align 8
  %sp5040 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5039
  store i256 32, ptr %sp5040, align 16
  br label %OP1413.ADD, !annotation !5

OP1413.ADD:                                       ; preds = %OP1412.PUSH1
  %stack_len5041 = load i64, ptr %len.addr, align 8
  %3783 = add i64 %stack_len5041, -1
  store i64 %3783, ptr %len.addr, align 8
  %3784 = add i64 %stack_len5041, -1
  %sp5042 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3784
  %a5043 = load i256, ptr %sp5042, align 16
  %3785 = add i64 %stack_len5041, -2
  %sp5044 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3785
  %b5045 = load i256, ptr %sp5044, align 16
  %3786 = add i256 %a5043, %b5045
  %3787 = add i64 %stack_len5041, -2
  %sp5046 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3787
  store i256 %3786, ptr %sp5046, align 16
  br label %OP1414.PUSH1, !annotation !5

OP1414.PUSH1:                                     ; preds = %OP1413.ADD
  %stack_len5047 = load i64, ptr %len.addr, align 8
  %3788 = add i64 %stack_len5047, 1
  store i64 %3788, ptr %len.addr, align 8
  %sp5048 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5047
  store i256 64, ptr %sp5048, align 16
  br label %OP1415.MLOAD, !annotation !5

OP1415.MLOAD:                                     ; preds = %OP1414.PUSH1
  %stack_len5049 = load i64, ptr %len.addr, align 8
  %3789 = add i64 %stack_len5049, -1
  %sp5050 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3789
  %a5051 = load i256, ptr %sp5050, align 16
  %mload.out.slot5052 = alloca i256, align 16
  %3790 = call i8 @__revmc_ir_builtin_mload(i256 %a5051, ptr %mload.out.slot5052, ptr %arg.ecx.addr)
  %3791 = icmp ne i8 %3790, 0
  br i1 %3791, label %return, label %OP1415.MLOAD.contd, !prof !2

OP1415.MLOAD.contd:                               ; preds = %OP1415.MLOAD
  %mload.out5053 = load i256, ptr %mload.out.slot5052, align 16
  %3792 = add i64 %stack_len5049, -1
  %sp5054 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3792
  store i256 %mload.out5053, ptr %sp5054, align 16
  br label %OP1416.SWAP1, !annotation !5

OP1416.SWAP1:                                     ; preds = %OP1415.MLOAD.contd
  %stack_len5055 = load i64, ptr %len.addr, align 8
  %3793 = sub i64 %stack_len5055, 1
  %sp5056 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3793
  %swap.a5057 = load i256, ptr %sp5056, align 16
  %3794 = sub i64 %stack_len5055, 2
  %sp5058 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3794
  %swap.b5059 = load i256, ptr %sp5058, align 16
  store i256 %swap.a5057, ptr %sp5058, align 16
  store i256 %swap.b5059, ptr %sp5056, align 16
  br label %OP1417.DUP2, !annotation !5

OP1417.DUP2:                                      ; preds = %OP1416.SWAP1
  %stack_len5060 = load i64, ptr %len.addr, align 8
  %3795 = add i64 %stack_len5060, 1
  store i64 %3795, ptr %len.addr, align 8
  %3796 = sub i64 %stack_len5060, 2
  %sp5061 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3796
  %dup25062 = load i256, ptr %sp5061, align 16
  %sp5063 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5060
  store i256 %dup25062, ptr %sp5063, align 16
  br label %OP1418.ADD, !annotation !5

OP1418.ADD:                                       ; preds = %OP1417.DUP2
  %stack_len5064 = load i64, ptr %len.addr, align 8
  %3797 = add i64 %stack_len5064, -1
  store i64 %3797, ptr %len.addr, align 8
  %3798 = add i64 %stack_len5064, -1
  %sp5065 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3798
  %a5066 = load i256, ptr %sp5065, align 16
  %3799 = add i64 %stack_len5064, -2
  %sp5067 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3799
  %b5068 = load i256, ptr %sp5067, align 16
  %3800 = add i256 %a5066, %b5068
  %3801 = add i64 %stack_len5064, -2
  %sp5069 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3801
  store i256 %3800, ptr %sp5069, align 16
  br label %OP1419.PUSH1, !annotation !5

OP1419.PUSH1:                                     ; preds = %OP1418.ADD
  %stack_len5070 = load i64, ptr %len.addr, align 8
  %3802 = add i64 %stack_len5070, 1
  store i64 %3802, ptr %len.addr, align 8
  %sp5071 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5070
  store i256 64, ptr %sp5071, align 16
  br label %OP1420.MSTORE, !annotation !5

OP1420.MSTORE:                                    ; preds = %OP1419.PUSH1
  %stack_len5072 = load i64, ptr %len.addr, align 8
  %3803 = add i64 %stack_len5072, -2
  store i64 %3803, ptr %len.addr, align 8
  %3804 = add i64 %stack_len5072, -1
  %sp5073 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3804
  %a5074 = load i256, ptr %sp5073, align 16
  %3805 = add i64 %stack_len5072, -2
  %sp5075 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3805
  %b5076 = load i256, ptr %sp5075, align 16
  %3806 = call i8 @__revmc_ir_builtin_mstore(i256 %a5074, i256 %b5076, ptr %arg.ecx.addr)
  %3807 = icmp ne i8 %3806, 0
  br i1 %3807, label %return, label %OP1420.MSTORE.contd, !prof !2

OP1420.MSTORE.contd:                              ; preds = %OP1420.MSTORE
  br label %OP1421.DUP1, !annotation !5

OP1421.DUP1:                                      ; preds = %OP1420.MSTORE.contd
  %stack_len5077 = load i64, ptr %len.addr, align 8
  %3808 = add i64 %stack_len5077, 1
  store i64 %3808, ptr %len.addr, align 8
  %3809 = sub i64 %stack_len5077, 1
  %sp5078 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3809
  %dup15079 = load i256, ptr %sp5078, align 16
  %sp5080 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5077
  store i256 %dup15079, ptr %sp5080, align 16
  br label %OP1422.SWAP3, !annotation !5

OP1422.SWAP3:                                     ; preds = %OP1421.DUP1
  %stack_len5081 = load i64, ptr %len.addr, align 8
  %3810 = sub i64 %stack_len5081, 1
  %sp5082 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3810
  %swap.a5083 = load i256, ptr %sp5082, align 16
  %3811 = sub i64 %stack_len5081, 4
  %sp5084 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3811
  %swap.b5085 = load i256, ptr %sp5084, align 16
  store i256 %swap.a5083, ptr %sp5084, align 16
  store i256 %swap.b5085, ptr %sp5082, align 16
  br label %OP1423.SWAP2, !annotation !5

OP1423.SWAP2:                                     ; preds = %OP1422.SWAP3
  %stack_len5086 = load i64, ptr %len.addr, align 8
  %3812 = sub i64 %stack_len5086, 1
  %sp5087 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3812
  %swap.a5088 = load i256, ptr %sp5087, align 16
  %3813 = sub i64 %stack_len5086, 3
  %sp5089 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3813
  %swap.b5090 = load i256, ptr %sp5089, align 16
  store i256 %swap.a5088, ptr %sp5089, align 16
  store i256 %swap.b5090, ptr %sp5087, align 16
  br label %OP1424.SWAP1, !annotation !5

OP1424.SWAP1:                                     ; preds = %OP1423.SWAP2
  %stack_len5091 = load i64, ptr %len.addr, align 8
  %3814 = sub i64 %stack_len5091, 1
  %sp5092 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3814
  %swap.a5093 = load i256, ptr %sp5092, align 16
  %3815 = sub i64 %stack_len5091, 2
  %sp5094 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3815
  %swap.b5095 = load i256, ptr %sp5094, align 16
  store i256 %swap.a5093, ptr %sp5094, align 16
  store i256 %swap.b5095, ptr %sp5092, align 16
  br label %OP1425.DUP2, !annotation !5

OP1425.DUP2:                                      ; preds = %OP1424.SWAP1
  %stack_len5096 = load i64, ptr %len.addr, align 8
  %3816 = add i64 %stack_len5096, 1
  store i64 %3816, ptr %len.addr, align 8
  %3817 = sub i64 %stack_len5096, 2
  %sp5097 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3817
  %dup25098 = load i256, ptr %sp5097, align 16
  %sp5099 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5096
  store i256 %dup25098, ptr %sp5099, align 16
  br label %OP1426.DUP2, !annotation !5

OP1426.DUP2:                                      ; preds = %OP1425.DUP2
  %stack_len5100 = load i64, ptr %len.addr, align 8
  %3818 = add i64 %stack_len5100, 1
  store i64 %3818, ptr %len.addr, align 8
  %3819 = sub i64 %stack_len5100, 2
  %sp5101 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3819
  %dup25102 = load i256, ptr %sp5101, align 16
  %sp5103 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5100
  store i256 %dup25102, ptr %sp5103, align 16
  br label %OP1427.MSTORE, !annotation !5

OP1427.MSTORE:                                    ; preds = %OP1426.DUP2
  %stack_len5104 = load i64, ptr %len.addr, align 8
  %3820 = add i64 %stack_len5104, -2
  store i64 %3820, ptr %len.addr, align 8
  %3821 = add i64 %stack_len5104, -1
  %sp5105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3821
  %a5106 = load i256, ptr %sp5105, align 16
  %3822 = add i64 %stack_len5104, -2
  %sp5107 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3822
  %b5108 = load i256, ptr %sp5107, align 16
  %3823 = call i8 @__revmc_ir_builtin_mstore(i256 %a5106, i256 %b5108, ptr %arg.ecx.addr)
  %3824 = icmp ne i8 %3823, 0
  br i1 %3824, label %return, label %OP1427.MSTORE.contd, !prof !2

OP1427.MSTORE.contd:                              ; preds = %OP1427.MSTORE
  br label %OP1428.PUSH1, !annotation !5

OP1428.PUSH1:                                     ; preds = %OP1427.MSTORE.contd
  %stack_len5109 = load i64, ptr %len.addr, align 8
  %3825 = add i64 %stack_len5109, 1
  store i64 %3825, ptr %len.addr, align 8
  %sp5110 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5109
  store i256 32, ptr %sp5110, align 16
  br label %OP1429.ADD, !annotation !5

OP1429.ADD:                                       ; preds = %OP1428.PUSH1
  %stack_len5111 = load i64, ptr %len.addr, align 8
  %3826 = add i64 %stack_len5111, -1
  store i64 %3826, ptr %len.addr, align 8
  %3827 = add i64 %stack_len5111, -1
  %sp5112 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3827
  %a5113 = load i256, ptr %sp5112, align 16
  %3828 = add i64 %stack_len5111, -2
  %sp5114 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3828
  %b5115 = load i256, ptr %sp5114, align 16
  %3829 = add i256 %a5113, %b5115
  %3830 = add i64 %stack_len5111, -2
  %sp5116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3830
  store i256 %3829, ptr %sp5116, align 16
  br label %OP1430.DUP3, !annotation !5

OP1430.DUP3:                                      ; preds = %OP1429.ADD
  %stack_len5117 = load i64, ptr %len.addr, align 8
  %3831 = add i64 %stack_len5117, 1
  store i64 %3831, ptr %len.addr, align 8
  %3832 = sub i64 %stack_len5117, 3
  %sp5118 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3832
  %dup35119 = load i256, ptr %sp5118, align 16
  %sp5120 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5117
  store i256 %dup35119, ptr %sp5120, align 16
  br label %OP1431.DUP1, !annotation !5

OP1431.DUP1:                                      ; preds = %OP1430.DUP3
  %stack_len5121 = load i64, ptr %len.addr, align 8
  %3833 = add i64 %stack_len5121, 1
  store i64 %3833, ptr %len.addr, align 8
  %3834 = sub i64 %stack_len5121, 1
  %sp5122 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3834
  %dup15123 = load i256, ptr %sp5122, align 16
  %sp5124 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5121
  store i256 %dup15123, ptr %sp5124, align 16
  br label %OP1432.SLOAD, !annotation !5

OP1432.SLOAD:                                     ; preds = %OP1431.DUP1
  %stack_len5125 = load i64, ptr %len.addr, align 8
  %3835 = sub i64 %stack_len5125, 1
  %sp5126 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3835
  %3836 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp5126, i8 19)
  %3837 = icmp ne i8 %3836, 0
  br i1 %3837, label %return, label %OP1432.SLOAD.contd, !prof !2

OP1432.SLOAD.contd:                               ; preds = %OP1432.SLOAD
  br label %OP1433.PUSH1, !annotation !5

OP1433.PUSH1:                                     ; preds = %OP1432.SLOAD.contd
  %stack_len5127 = load i64, ptr %len.addr, align 8
  %3838 = add i64 %stack_len5127, 1
  store i64 %3838, ptr %len.addr, align 8
  %sp5128 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5127
  store i256 1, ptr %sp5128, align 16
  br label %OP1434.DUP2, !annotation !5

OP1434.DUP2:                                      ; preds = %OP1433.PUSH1
  %stack_len5129 = load i64, ptr %len.addr, align 8
  %3839 = add i64 %stack_len5129, 1
  store i64 %3839, ptr %len.addr, align 8
  %3840 = sub i64 %stack_len5129, 2
  %sp5130 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3840
  %dup25131 = load i256, ptr %sp5130, align 16
  %sp5132 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5129
  store i256 %dup25131, ptr %sp5132, align 16
  br label %OP1435.PUSH1, !annotation !5

OP1435.PUSH1:                                     ; preds = %OP1434.DUP2
  %stack_len5133 = load i64, ptr %len.addr, align 8
  %3841 = add i64 %stack_len5133, 1
  store i64 %3841, ptr %len.addr, align 8
  %sp5134 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5133
  store i256 1, ptr %sp5134, align 16
  br label %OP1436.AND, !annotation !5

OP1436.AND:                                       ; preds = %OP1435.PUSH1
  %stack_len5135 = load i64, ptr %len.addr, align 8
  %3842 = add i64 %stack_len5135, -1
  store i64 %3842, ptr %len.addr, align 8
  %3843 = add i64 %stack_len5135, -1
  %sp5136 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3843
  %a5137 = load i256, ptr %sp5136, align 16
  %3844 = add i64 %stack_len5135, -2
  %sp5138 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3844
  %b5139 = load i256, ptr %sp5138, align 16
  %3845 = and i256 %a5137, %b5139
  %3846 = add i64 %stack_len5135, -2
  %sp5140 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3846
  store i256 %3845, ptr %sp5140, align 16
  br label %OP1437.ISZERO, !annotation !5

OP1437.ISZERO:                                    ; preds = %OP1436.AND
  %stack_len5141 = load i64, ptr %len.addr, align 8
  %3847 = add i64 %stack_len5141, -1
  %sp5142 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3847
  %a5143 = load i256, ptr %sp5142, align 16
  %3848 = icmp eq i256 %a5143, 0
  %3849 = zext i1 %3848 to i256
  %3850 = add i64 %stack_len5141, -1
  %sp5144 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3850
  store i256 %3849, ptr %sp5144, align 16
  br label %OP1438.PUSH2, !annotation !5

OP1438.PUSH2:                                     ; preds = %OP1437.ISZERO
  %stack_len5145 = load i64, ptr %len.addr, align 8
  %3851 = add i64 %stack_len5145, 1
  store i64 %3851, ptr %len.addr, align 8
  %sp5146 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5145
  store i256 256, ptr %sp5146, align 16
  br label %OP1439.MUL, !annotation !5

OP1439.MUL:                                       ; preds = %OP1438.PUSH2
  %stack_len5147 = load i64, ptr %len.addr, align 8
  %3852 = add i64 %stack_len5147, -1
  store i64 %3852, ptr %len.addr, align 8
  %3853 = add i64 %stack_len5147, -1
  %sp5148 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3853
  %a5149 = load i256, ptr %sp5148, align 16
  %3854 = add i64 %stack_len5147, -2
  %sp5150 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3854
  %b5151 = load i256, ptr %sp5150, align 16
  %3855 = mul i256 %a5149, %b5151
  %3856 = add i64 %stack_len5147, -2
  %sp5152 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3856
  store i256 %3855, ptr %sp5152, align 16
  br label %OP1440.SUB, !annotation !5

OP1440.SUB:                                       ; preds = %OP1439.MUL
  %stack_len5153 = load i64, ptr %len.addr, align 8
  %3857 = add i64 %stack_len5153, -1
  store i64 %3857, ptr %len.addr, align 8
  %3858 = add i64 %stack_len5153, -1
  %sp5154 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3858
  %a5155 = load i256, ptr %sp5154, align 16
  %3859 = add i64 %stack_len5153, -2
  %sp5156 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3859
  %b5157 = load i256, ptr %sp5156, align 16
  %3860 = sub i256 %a5155, %b5157
  %3861 = add i64 %stack_len5153, -2
  %sp5158 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3861
  store i256 %3860, ptr %sp5158, align 16
  br label %OP1441.AND, !annotation !5

OP1441.AND:                                       ; preds = %OP1440.SUB
  %stack_len5159 = load i64, ptr %len.addr, align 8
  %3862 = add i64 %stack_len5159, -1
  store i64 %3862, ptr %len.addr, align 8
  %3863 = add i64 %stack_len5159, -1
  %sp5160 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3863
  %a5161 = load i256, ptr %sp5160, align 16
  %3864 = add i64 %stack_len5159, -2
  %sp5162 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3864
  %b5163 = load i256, ptr %sp5162, align 16
  %3865 = and i256 %a5161, %b5163
  %3866 = add i64 %stack_len5159, -2
  %sp5164 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3866
  store i256 %3865, ptr %sp5164, align 16
  br label %OP1442.PUSH1, !annotation !5

OP1442.PUSH1:                                     ; preds = %OP1441.AND
  %stack_len5165 = load i64, ptr %len.addr, align 8
  %3867 = add i64 %stack_len5165, 1
  store i64 %3867, ptr %len.addr, align 8
  %sp5166 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5165
  store i256 2, ptr %sp5166, align 16
  br label %OP1443.SWAP1, !annotation !5

OP1443.SWAP1:                                     ; preds = %OP1442.PUSH1
  %stack_len5167 = load i64, ptr %len.addr, align 8
  %3868 = sub i64 %stack_len5167, 1
  %sp5168 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3868
  %swap.a5169 = load i256, ptr %sp5168, align 16
  %3869 = sub i64 %stack_len5167, 2
  %sp5170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3869
  %swap.b5171 = load i256, ptr %sp5170, align 16
  store i256 %swap.a5169, ptr %sp5170, align 16
  store i256 %swap.b5171, ptr %sp5168, align 16
  br label %OP1444.DIV, !annotation !5

OP1444.DIV:                                       ; preds = %OP1443.SWAP1
  %stack_len5172 = load i64, ptr %len.addr, align 8
  %3870 = add i64 %stack_len5172, -1
  store i64 %3870, ptr %len.addr, align 8
  %3871 = add i64 %stack_len5172, -1
  %sp5173 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3871
  %a5174 = load i256, ptr %sp5173, align 16
  %3872 = add i64 %stack_len5172, -2
  %sp5175 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3872
  %b5176 = load i256, ptr %sp5175, align 16
  %3873 = icmp eq i256 %b5176, 0
  %3874 = udiv i256 %a5174, %b5176
  %3875 = select i1 %3873, i256 0, i256 %3874
  %3876 = add i64 %stack_len5172, -2
  %sp5177 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3876
  store i256 %3875, ptr %sp5177, align 16
  br label %OP1445.DUP1, !annotation !5

OP1445.DUP1:                                      ; preds = %OP1444.DIV
  %stack_len5178 = load i64, ptr %len.addr, align 8
  %3877 = add i64 %stack_len5178, 1
  store i64 %3877, ptr %len.addr, align 8
  %3878 = sub i64 %stack_len5178, 1
  %sp5179 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3878
  %dup15180 = load i256, ptr %sp5179, align 16
  %sp5181 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5178
  store i256 %dup15180, ptr %sp5181, align 16
  br label %OP1446.ISZERO, !annotation !5

OP1446.ISZERO:                                    ; preds = %OP1445.DUP1
  %stack_len5182 = load i64, ptr %len.addr, align 8
  %3879 = add i64 %stack_len5182, -1
  %sp5183 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3879
  %a5184 = load i256, ptr %sp5183, align 16
  %3880 = icmp eq i256 %a5184, 0
  %3881 = zext i1 %3880 to i256
  %3882 = add i64 %stack_len5182, -1
  %sp5185 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3882
  store i256 %3881, ptr %sp5185, align 16
  br label %OP1447.PUSH2, !annotation !5

OP1447.PUSH2:                                     ; preds = %OP1446.ISZERO
  br label %OP1448.JUMPI, !annotation !6

OP1448.JUMPI:                                     ; preds = %OP1447.PUSH2
  %stack_len5186 = load i64, ptr %len.addr, align 8
  %3883 = add i64 %stack_len5186, -1
  store i64 %3883, ptr %len.addr, align 8
  %3884 = add i64 %stack_len5186, -1
  %sp5187 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3884
  %a5188 = load i256, ptr %sp5187, align 16
  %3885 = icmp ne i256 %a5188, 0
  br i1 %3885, label %OP1503.JUMPDEST, label %OP1449.DUP1

OP1449.DUP1:                                      ; preds = %OP1448.JUMPI
  %gas.remaining5189 = load i64, ptr %gas.remaining.addr, align 8
  %3886 = sub i64 %gas.remaining5189, 22
  %3887 = icmp ult i64 %gas.remaining5189, 22
  store i64 %3886, ptr %gas.remaining.addr, align 8
  br i1 %3887, label %return, label %OP1449.DUP1.contd, !prof !2, !annotation !3

OP1449.DUP1.contd:                                ; preds = %OP1449.DUP1
  %stack_len5190 = load i64, ptr %len.addr, align 8
  %3888 = icmp ult i64 %stack_len5190, 1
  %3889 = icmp ugt i64 %stack_len5190, 1022
  %3890 = or i1 %3888, %3889
  %3891 = select i1 %3888, i8 91, i8 92
  br i1 %3890, label %return, label %OP1449.DUP1.contd5191, !prof !2

OP1449.DUP1.contd5191:                            ; preds = %OP1449.DUP1.contd
  %3892 = add i64 %stack_len5190, 1
  store i64 %3892, ptr %len.addr, align 8
  %3893 = sub i64 %stack_len5190, 1
  %sp5192 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3893
  %dup15193 = load i256, ptr %sp5192, align 16
  %sp5194 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5190
  store i256 %dup15193, ptr %sp5194, align 16
  br label %OP1450.PUSH1, !annotation !5

OP1450.PUSH1:                                     ; preds = %OP1449.DUP1.contd5191
  %stack_len5195 = load i64, ptr %len.addr, align 8
  %3894 = add i64 %stack_len5195, 1
  store i64 %3894, ptr %len.addr, align 8
  %sp5196 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5195
  store i256 31, ptr %sp5196, align 16
  br label %OP1451.LT, !annotation !5

OP1451.LT:                                        ; preds = %OP1450.PUSH1
  %stack_len5197 = load i64, ptr %len.addr, align 8
  %3895 = add i64 %stack_len5197, -1
  store i64 %3895, ptr %len.addr, align 8
  %3896 = add i64 %stack_len5197, -1
  %sp5198 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3896
  %a5199 = load i256, ptr %sp5198, align 16
  %3897 = add i64 %stack_len5197, -2
  %sp5200 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3897
  %b5201 = load i256, ptr %sp5200, align 16
  %3898 = icmp ult i256 %a5199, %b5201
  %3899 = zext i1 %3898 to i256
  %3900 = add i64 %stack_len5197, -2
  %sp5202 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3900
  store i256 %3899, ptr %sp5202, align 16
  br label %OP1452.PUSH2, !annotation !5

OP1452.PUSH2:                                     ; preds = %OP1451.LT
  br label %OP1453.JUMPI, !annotation !6

OP1453.JUMPI:                                     ; preds = %OP1452.PUSH2
  %stack_len5203 = load i64, ptr %len.addr, align 8
  %3901 = add i64 %stack_len5203, -1
  store i64 %3901, ptr %len.addr, align 8
  %3902 = add i64 %stack_len5203, -1
  %sp5204 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3902
  %a5205 = load i256, ptr %sp5204, align 16
  %3903 = icmp ne i256 %a5205, 0
  br i1 %3903, label %OP1468.JUMPDEST, label %OP1454.PUSH2

OP1454.PUSH2:                                     ; preds = %OP1453.JUMPI
  %gas.remaining5206 = load i64, ptr %gas.remaining.addr, align 8
  %3904 = sub i64 %gas.remaining5206, 48
  %3905 = icmp ult i64 %gas.remaining5206, 48
  store i64 %3904, ptr %gas.remaining.addr, align 8
  br i1 %3905, label %return, label %OP1454.PUSH2.contd, !prof !2, !annotation !3

OP1454.PUSH2.contd:                               ; preds = %OP1454.PUSH2
  %stack_len5207 = load i64, ptr %len.addr, align 8
  %3906 = icmp ult i64 %stack_len5207, 3
  %3907 = icmp ugt i64 %stack_len5207, 1021
  %3908 = or i1 %3906, %3907
  %3909 = select i1 %3906, i8 91, i8 92
  br i1 %3908, label %return, label %OP1454.PUSH2.contd5208, !prof !2

OP1454.PUSH2.contd5208:                           ; preds = %OP1454.PUSH2.contd
  %3910 = add i64 %stack_len5207, 1
  store i64 %3910, ptr %len.addr, align 8
  %sp5209 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5207
  store i256 256, ptr %sp5209, align 16
  br label %OP1455.DUP1, !annotation !5

OP1455.DUP1:                                      ; preds = %OP1454.PUSH2.contd5208
  %stack_len5210 = load i64, ptr %len.addr, align 8
  %3911 = add i64 %stack_len5210, 1
  store i64 %3911, ptr %len.addr, align 8
  %3912 = sub i64 %stack_len5210, 1
  %sp5211 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3912
  %dup15212 = load i256, ptr %sp5211, align 16
  %sp5213 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5210
  store i256 %dup15212, ptr %sp5213, align 16
  br label %OP1456.DUP4, !annotation !5

OP1456.DUP4:                                      ; preds = %OP1455.DUP1
  %stack_len5214 = load i64, ptr %len.addr, align 8
  %3913 = add i64 %stack_len5214, 1
  store i64 %3913, ptr %len.addr, align 8
  %3914 = sub i64 %stack_len5214, 4
  %sp5215 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3914
  %dup45216 = load i256, ptr %sp5215, align 16
  %sp5217 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5214
  store i256 %dup45216, ptr %sp5217, align 16
  br label %OP1457.SLOAD, !annotation !5

OP1457.SLOAD:                                     ; preds = %OP1456.DUP4
  %stack_len5218 = load i64, ptr %len.addr, align 8
  %3915 = sub i64 %stack_len5218, 1
  %sp5219 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3915
  %3916 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp5219, i8 19)
  %3917 = icmp ne i8 %3916, 0
  br i1 %3917, label %return, label %OP1457.SLOAD.contd, !prof !2

OP1457.SLOAD.contd:                               ; preds = %OP1457.SLOAD
  br label %OP1458.DIV, !annotation !5

OP1458.DIV:                                       ; preds = %OP1457.SLOAD.contd
  %stack_len5220 = load i64, ptr %len.addr, align 8
  %3918 = add i64 %stack_len5220, -1
  store i64 %3918, ptr %len.addr, align 8
  %3919 = add i64 %stack_len5220, -1
  %sp5221 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3919
  %a5222 = load i256, ptr %sp5221, align 16
  %3920 = add i64 %stack_len5220, -2
  %sp5223 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3920
  %b5224 = load i256, ptr %sp5223, align 16
  %3921 = icmp eq i256 %b5224, 0
  %3922 = udiv i256 %a5222, %b5224
  %3923 = select i1 %3921, i256 0, i256 %3922
  %3924 = add i64 %stack_len5220, -2
  %sp5225 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3924
  store i256 %3923, ptr %sp5225, align 16
  br label %OP1459.MUL, !annotation !5

OP1459.MUL:                                       ; preds = %OP1458.DIV
  %stack_len5226 = load i64, ptr %len.addr, align 8
  %3925 = add i64 %stack_len5226, -1
  store i64 %3925, ptr %len.addr, align 8
  %3926 = add i64 %stack_len5226, -1
  %sp5227 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3926
  %a5228 = load i256, ptr %sp5227, align 16
  %3927 = add i64 %stack_len5226, -2
  %sp5229 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3927
  %b5230 = load i256, ptr %sp5229, align 16
  %3928 = mul i256 %a5228, %b5230
  %3929 = add i64 %stack_len5226, -2
  %sp5231 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3929
  store i256 %3928, ptr %sp5231, align 16
  br label %OP1460.DUP4, !annotation !5

OP1460.DUP4:                                      ; preds = %OP1459.MUL
  %stack_len5232 = load i64, ptr %len.addr, align 8
  %3930 = add i64 %stack_len5232, 1
  store i64 %3930, ptr %len.addr, align 8
  %3931 = sub i64 %stack_len5232, 4
  %sp5233 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3931
  %dup45234 = load i256, ptr %sp5233, align 16
  %sp5235 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5232
  store i256 %dup45234, ptr %sp5235, align 16
  br label %OP1461.MSTORE, !annotation !5

OP1461.MSTORE:                                    ; preds = %OP1460.DUP4
  %stack_len5236 = load i64, ptr %len.addr, align 8
  %3932 = add i64 %stack_len5236, -2
  store i64 %3932, ptr %len.addr, align 8
  %3933 = add i64 %stack_len5236, -1
  %sp5237 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3933
  %a5238 = load i256, ptr %sp5237, align 16
  %3934 = add i64 %stack_len5236, -2
  %sp5239 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3934
  %b5240 = load i256, ptr %sp5239, align 16
  %3935 = call i8 @__revmc_ir_builtin_mstore(i256 %a5238, i256 %b5240, ptr %arg.ecx.addr)
  %3936 = icmp ne i8 %3935, 0
  br i1 %3936, label %return, label %OP1461.MSTORE.contd, !prof !2

OP1461.MSTORE.contd:                              ; preds = %OP1461.MSTORE
  br label %OP1462.SWAP2, !annotation !5

OP1462.SWAP2:                                     ; preds = %OP1461.MSTORE.contd
  %stack_len5241 = load i64, ptr %len.addr, align 8
  %3937 = sub i64 %stack_len5241, 1
  %sp5242 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3937
  %swap.a5243 = load i256, ptr %sp5242, align 16
  %3938 = sub i64 %stack_len5241, 3
  %sp5244 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3938
  %swap.b5245 = load i256, ptr %sp5244, align 16
  store i256 %swap.a5243, ptr %sp5244, align 16
  store i256 %swap.b5245, ptr %sp5242, align 16
  br label %OP1463.PUSH1, !annotation !5

OP1463.PUSH1:                                     ; preds = %OP1462.SWAP2
  %stack_len5246 = load i64, ptr %len.addr, align 8
  %3939 = add i64 %stack_len5246, 1
  store i64 %3939, ptr %len.addr, align 8
  %sp5247 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5246
  store i256 32, ptr %sp5247, align 16
  br label %OP1464.ADD, !annotation !5

OP1464.ADD:                                       ; preds = %OP1463.PUSH1
  %stack_len5248 = load i64, ptr %len.addr, align 8
  %3940 = add i64 %stack_len5248, -1
  store i64 %3940, ptr %len.addr, align 8
  %3941 = add i64 %stack_len5248, -1
  %sp5249 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3941
  %a5250 = load i256, ptr %sp5249, align 16
  %3942 = add i64 %stack_len5248, -2
  %sp5251 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3942
  %b5252 = load i256, ptr %sp5251, align 16
  %3943 = add i256 %a5250, %b5252
  %3944 = add i64 %stack_len5248, -2
  %sp5253 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3944
  store i256 %3943, ptr %sp5253, align 16
  br label %OP1465.SWAP2, !annotation !5

OP1465.SWAP2:                                     ; preds = %OP1464.ADD
  %stack_len5254 = load i64, ptr %len.addr, align 8
  %3945 = sub i64 %stack_len5254, 1
  %sp5255 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3945
  %swap.a5256 = load i256, ptr %sp5255, align 16
  %3946 = sub i64 %stack_len5254, 3
  %sp5257 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3946
  %swap.b5258 = load i256, ptr %sp5257, align 16
  store i256 %swap.a5256, ptr %sp5257, align 16
  store i256 %swap.b5258, ptr %sp5255, align 16
  br label %OP1466.PUSH2, !annotation !5

OP1466.PUSH2:                                     ; preds = %OP1465.SWAP2
  br label %OP1467.JUMP, !annotation !6

OP1467.JUMP:                                      ; preds = %OP1466.PUSH2
  %stack_len5259 = load i64, ptr %len.addr, align 8
  br label %OP1503.JUMPDEST

OP1468.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1453.JUMPI
  %gas.remaining5260 = load i64, ptr %gas.remaining.addr, align 8
  %3947 = sub i64 %gas.remaining5260, 58
  %3948 = icmp ult i64 %gas.remaining5260, 58
  store i64 %3947, ptr %gas.remaining.addr, align 8
  br i1 %3948, label %return, label %OP1468.JUMPDEST.contd, !prof !2, !annotation !3

OP1468.JUMPDEST.contd:                            ; preds = %OP1468.JUMPDEST
  %stack_len5261 = load i64, ptr %len.addr, align 8
  %3949 = icmp ult i64 %stack_len5261, 3
  %3950 = icmp ugt i64 %stack_len5261, 1023
  %3951 = or i1 %3949, %3950
  %3952 = select i1 %3949, i8 91, i8 92
  br i1 %3951, label %return, label %OP1468.JUMPDEST.contd5262, !prof !2

OP1468.JUMPDEST.contd5262:                        ; preds = %OP1468.JUMPDEST.contd
  br label %OP1469.DUP3, !annotation !5

OP1469.DUP3:                                      ; preds = %OP1468.JUMPDEST.contd5262
  %stack_len5263 = load i64, ptr %len.addr, align 8
  %3953 = add i64 %stack_len5263, 1
  store i64 %3953, ptr %len.addr, align 8
  %3954 = sub i64 %stack_len5263, 3
  %sp5264 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3954
  %dup35265 = load i256, ptr %sp5264, align 16
  %sp5266 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5263
  store i256 %dup35265, ptr %sp5266, align 16
  br label %OP1470.ADD, !annotation !5

OP1470.ADD:                                       ; preds = %OP1469.DUP3
  %stack_len5267 = load i64, ptr %len.addr, align 8
  %3955 = add i64 %stack_len5267, -1
  store i64 %3955, ptr %len.addr, align 8
  %3956 = add i64 %stack_len5267, -1
  %sp5268 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3956
  %a5269 = load i256, ptr %sp5268, align 16
  %3957 = add i64 %stack_len5267, -2
  %sp5270 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3957
  %b5271 = load i256, ptr %sp5270, align 16
  %3958 = add i256 %a5269, %b5271
  %3959 = add i64 %stack_len5267, -2
  %sp5272 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3959
  store i256 %3958, ptr %sp5272, align 16
  br label %OP1471.SWAP2, !annotation !5

OP1471.SWAP2:                                     ; preds = %OP1470.ADD
  %stack_len5273 = load i64, ptr %len.addr, align 8
  %3960 = sub i64 %stack_len5273, 1
  %sp5274 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3960
  %swap.a5275 = load i256, ptr %sp5274, align 16
  %3961 = sub i64 %stack_len5273, 3
  %sp5276 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3961
  %swap.b5277 = load i256, ptr %sp5276, align 16
  store i256 %swap.a5275, ptr %sp5276, align 16
  store i256 %swap.b5277, ptr %sp5274, align 16
  br label %OP1472.SWAP1, !annotation !5

OP1472.SWAP1:                                     ; preds = %OP1471.SWAP2
  %stack_len5278 = load i64, ptr %len.addr, align 8
  %3962 = sub i64 %stack_len5278, 1
  %sp5279 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3962
  %swap.a5280 = load i256, ptr %sp5279, align 16
  %3963 = sub i64 %stack_len5278, 2
  %sp5281 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3963
  %swap.b5282 = load i256, ptr %sp5281, align 16
  store i256 %swap.a5280, ptr %sp5281, align 16
  store i256 %swap.b5282, ptr %sp5279, align 16
  br label %OP1473.PUSH1, !annotation !5

OP1473.PUSH1:                                     ; preds = %OP1472.SWAP1
  %stack_len5283 = load i64, ptr %len.addr, align 8
  %3964 = add i64 %stack_len5283, 1
  store i64 %3964, ptr %len.addr, align 8
  %sp5284 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5283
  store i256 0, ptr %sp5284, align 16
  br label %OP1474.MSTORE, !annotation !5

OP1474.MSTORE:                                    ; preds = %OP1473.PUSH1
  %stack_len5285 = load i64, ptr %len.addr, align 8
  %3965 = add i64 %stack_len5285, -2
  store i64 %3965, ptr %len.addr, align 8
  %3966 = add i64 %stack_len5285, -1
  %sp5286 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3966
  %a5287 = load i256, ptr %sp5286, align 16
  %3967 = add i64 %stack_len5285, -2
  %sp5288 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3967
  %b5289 = load i256, ptr %sp5288, align 16
  %3968 = call i8 @__revmc_ir_builtin_mstore(i256 %a5287, i256 %b5289, ptr %arg.ecx.addr)
  %3969 = icmp ne i8 %3968, 0
  br i1 %3969, label %return, label %OP1474.MSTORE.contd, !prof !2

OP1474.MSTORE.contd:                              ; preds = %OP1474.MSTORE
  br label %OP1475.PUSH1, !annotation !5

OP1475.PUSH1:                                     ; preds = %OP1474.MSTORE.contd
  %stack_len5290 = load i64, ptr %len.addr, align 8
  %3970 = add i64 %stack_len5290, 1
  store i64 %3970, ptr %len.addr, align 8
  %sp5291 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5290
  store i256 32, ptr %sp5291, align 16
  br label %OP1476.PUSH1, !annotation !5

OP1476.PUSH1:                                     ; preds = %OP1475.PUSH1
  %stack_len5292 = load i64, ptr %len.addr, align 8
  %3971 = add i64 %stack_len5292, 1
  store i64 %3971, ptr %len.addr, align 8
  %sp5293 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5292
  store i256 0, ptr %sp5293, align 16
  br label %OP1477.KECCAK256, !annotation !5

OP1477.KECCAK256:                                 ; preds = %OP1476.PUSH1
  %stack_len5294 = load i64, ptr %len.addr, align 8
  %3972 = add i64 %stack_len5294, -1
  store i64 %3972, ptr %len.addr, align 8
  %3973 = sub i64 %stack_len5294, 2
  %sp5295 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3973
  %3974 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp5295)
  %3975 = icmp ne i8 %3974, 0
  br i1 %3975, label %return, label %OP1477.KECCAK256.contd, !prof !2

OP1477.KECCAK256.contd:                           ; preds = %OP1477.KECCAK256
  br label %OP1478.SWAP1, !annotation !5

OP1478.SWAP1:                                     ; preds = %OP1477.KECCAK256.contd
  %stack_len5296 = load i64, ptr %len.addr, align 8
  %3976 = sub i64 %stack_len5296, 1
  %sp5297 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3976
  %swap.a5298 = load i256, ptr %sp5297, align 16
  %3977 = sub i64 %stack_len5296, 2
  %sp5299 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3977
  %swap.b5300 = load i256, ptr %sp5299, align 16
  store i256 %swap.a5298, ptr %sp5299, align 16
  store i256 %swap.b5300, ptr %sp5297, align 16
  br label %OP1479.JUMPDEST, !annotation !5

OP1479.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1494.JUMPI, %OP1478.SWAP1
  %gas.remaining5301 = load i64, ptr %gas.remaining.addr, align 8
  %3978 = sub i64 %gas.remaining5301, 50
  %3979 = icmp ult i64 %gas.remaining5301, 50
  store i64 %3978, ptr %gas.remaining.addr, align 8
  br i1 %3979, label %return, label %OP1479.JUMPDEST.contd, !prof !2, !annotation !3

OP1479.JUMPDEST.contd:                            ; preds = %OP1479.JUMPDEST
  %stack_len5302 = load i64, ptr %len.addr, align 8
  %3980 = icmp ult i64 %stack_len5302, 3
  %3981 = icmp ugt i64 %stack_len5302, 1022
  %3982 = or i1 %3980, %3981
  %3983 = select i1 %3980, i8 91, i8 92
  br i1 %3982, label %return, label %OP1479.JUMPDEST.contd5303, !prof !2

OP1479.JUMPDEST.contd5303:                        ; preds = %OP1479.JUMPDEST.contd
  br label %OP1480.DUP2, !annotation !5

OP1480.DUP2:                                      ; preds = %OP1479.JUMPDEST.contd5303
  %stack_len5304 = load i64, ptr %len.addr, align 8
  %3984 = add i64 %stack_len5304, 1
  store i64 %3984, ptr %len.addr, align 8
  %3985 = sub i64 %stack_len5304, 2
  %sp5305 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3985
  %dup25306 = load i256, ptr %sp5305, align 16
  %sp5307 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5304
  store i256 %dup25306, ptr %sp5307, align 16
  br label %OP1481.SLOAD, !annotation !5

OP1481.SLOAD:                                     ; preds = %OP1480.DUP2
  %stack_len5308 = load i64, ptr %len.addr, align 8
  %3986 = sub i64 %stack_len5308, 1
  %sp5309 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3986
  %3987 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp5309, i8 19)
  %3988 = icmp ne i8 %3987, 0
  br i1 %3988, label %return, label %OP1481.SLOAD.contd, !prof !2

OP1481.SLOAD.contd:                               ; preds = %OP1481.SLOAD
  br label %OP1482.DUP2, !annotation !5

OP1482.DUP2:                                      ; preds = %OP1481.SLOAD.contd
  %stack_len5310 = load i64, ptr %len.addr, align 8
  %3989 = add i64 %stack_len5310, 1
  store i64 %3989, ptr %len.addr, align 8
  %3990 = sub i64 %stack_len5310, 2
  %sp5311 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3990
  %dup25312 = load i256, ptr %sp5311, align 16
  %sp5313 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5310
  store i256 %dup25312, ptr %sp5313, align 16
  br label %OP1483.MSTORE, !annotation !5

OP1483.MSTORE:                                    ; preds = %OP1482.DUP2
  %stack_len5314 = load i64, ptr %len.addr, align 8
  %3991 = add i64 %stack_len5314, -2
  store i64 %3991, ptr %len.addr, align 8
  %3992 = add i64 %stack_len5314, -1
  %sp5315 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3992
  %a5316 = load i256, ptr %sp5315, align 16
  %3993 = add i64 %stack_len5314, -2
  %sp5317 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3993
  %b5318 = load i256, ptr %sp5317, align 16
  %3994 = call i8 @__revmc_ir_builtin_mstore(i256 %a5316, i256 %b5318, ptr %arg.ecx.addr)
  %3995 = icmp ne i8 %3994, 0
  br i1 %3995, label %return, label %OP1483.MSTORE.contd, !prof !2

OP1483.MSTORE.contd:                              ; preds = %OP1483.MSTORE
  br label %OP1484.SWAP1, !annotation !5

OP1484.SWAP1:                                     ; preds = %OP1483.MSTORE.contd
  %stack_len5319 = load i64, ptr %len.addr, align 8
  %3996 = sub i64 %stack_len5319, 1
  %sp5320 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3996
  %swap.a5321 = load i256, ptr %sp5320, align 16
  %3997 = sub i64 %stack_len5319, 2
  %sp5322 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3997
  %swap.b5323 = load i256, ptr %sp5322, align 16
  store i256 %swap.a5321, ptr %sp5322, align 16
  store i256 %swap.b5323, ptr %sp5320, align 16
  br label %OP1485.PUSH1, !annotation !5

OP1485.PUSH1:                                     ; preds = %OP1484.SWAP1
  %stack_len5324 = load i64, ptr %len.addr, align 8
  %3998 = add i64 %stack_len5324, 1
  store i64 %3998, ptr %len.addr, align 8
  %sp5325 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5324
  store i256 1, ptr %sp5325, align 16
  br label %OP1486.ADD, !annotation !5

OP1486.ADD:                                       ; preds = %OP1485.PUSH1
  %stack_len5326 = load i64, ptr %len.addr, align 8
  %3999 = add i64 %stack_len5326, -1
  store i64 %3999, ptr %len.addr, align 8
  %4000 = add i64 %stack_len5326, -1
  %sp5327 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4000
  %a5328 = load i256, ptr %sp5327, align 16
  %4001 = add i64 %stack_len5326, -2
  %sp5329 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4001
  %b5330 = load i256, ptr %sp5329, align 16
  %4002 = add i256 %a5328, %b5330
  %4003 = add i64 %stack_len5326, -2
  %sp5331 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4003
  store i256 %4002, ptr %sp5331, align 16
  br label %OP1487.SWAP1, !annotation !5

OP1487.SWAP1:                                     ; preds = %OP1486.ADD
  %stack_len5332 = load i64, ptr %len.addr, align 8
  %4004 = sub i64 %stack_len5332, 1
  %sp5333 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4004
  %swap.a5334 = load i256, ptr %sp5333, align 16
  %4005 = sub i64 %stack_len5332, 2
  %sp5335 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4005
  %swap.b5336 = load i256, ptr %sp5335, align 16
  store i256 %swap.a5334, ptr %sp5335, align 16
  store i256 %swap.b5336, ptr %sp5333, align 16
  br label %OP1488.PUSH1, !annotation !5

OP1488.PUSH1:                                     ; preds = %OP1487.SWAP1
  %stack_len5337 = load i64, ptr %len.addr, align 8
  %4006 = add i64 %stack_len5337, 1
  store i64 %4006, ptr %len.addr, align 8
  %sp5338 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5337
  store i256 32, ptr %sp5338, align 16
  br label %OP1489.ADD, !annotation !5

OP1489.ADD:                                       ; preds = %OP1488.PUSH1
  %stack_len5339 = load i64, ptr %len.addr, align 8
  %4007 = add i64 %stack_len5339, -1
  store i64 %4007, ptr %len.addr, align 8
  %4008 = add i64 %stack_len5339, -1
  %sp5340 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4008
  %a5341 = load i256, ptr %sp5340, align 16
  %4009 = add i64 %stack_len5339, -2
  %sp5342 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4009
  %b5343 = load i256, ptr %sp5342, align 16
  %4010 = add i256 %a5341, %b5343
  %4011 = add i64 %stack_len5339, -2
  %sp5344 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4011
  store i256 %4010, ptr %sp5344, align 16
  br label %OP1490.DUP1, !annotation !5

OP1490.DUP1:                                      ; preds = %OP1489.ADD
  %stack_len5345 = load i64, ptr %len.addr, align 8
  %4012 = add i64 %stack_len5345, 1
  store i64 %4012, ptr %len.addr, align 8
  %4013 = sub i64 %stack_len5345, 1
  %sp5346 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4013
  %dup15347 = load i256, ptr %sp5346, align 16
  %sp5348 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5345
  store i256 %dup15347, ptr %sp5348, align 16
  br label %OP1491.DUP4, !annotation !5

OP1491.DUP4:                                      ; preds = %OP1490.DUP1
  %stack_len5349 = load i64, ptr %len.addr, align 8
  %4014 = add i64 %stack_len5349, 1
  store i64 %4014, ptr %len.addr, align 8
  %4015 = sub i64 %stack_len5349, 4
  %sp5350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4015
  %dup45351 = load i256, ptr %sp5350, align 16
  %sp5352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5349
  store i256 %dup45351, ptr %sp5352, align 16
  br label %OP1492.GT, !annotation !5

OP1492.GT:                                        ; preds = %OP1491.DUP4
  %stack_len5353 = load i64, ptr %len.addr, align 8
  %4016 = add i64 %stack_len5353, -1
  store i64 %4016, ptr %len.addr, align 8
  %4017 = add i64 %stack_len5353, -1
  %sp5354 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4017
  %a5355 = load i256, ptr %sp5354, align 16
  %4018 = add i64 %stack_len5353, -2
  %sp5356 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4018
  %b5357 = load i256, ptr %sp5356, align 16
  %4019 = icmp ugt i256 %a5355, %b5357
  %4020 = zext i1 %4019 to i256
  %4021 = add i64 %stack_len5353, -2
  %sp5358 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4021
  store i256 %4020, ptr %sp5358, align 16
  br label %OP1493.PUSH2, !annotation !5

OP1493.PUSH2:                                     ; preds = %OP1492.GT
  br label %OP1494.JUMPI, !annotation !6

OP1494.JUMPI:                                     ; preds = %OP1493.PUSH2
  %stack_len5359 = load i64, ptr %len.addr, align 8
  %4022 = add i64 %stack_len5359, -1
  store i64 %4022, ptr %len.addr, align 8
  %4023 = add i64 %stack_len5359, -1
  %sp5360 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4023
  %a5361 = load i256, ptr %sp5360, align 16
  %4024 = icmp ne i256 %a5361, 0
  br i1 %4024, label %OP1479.JUMPDEST, label %OP1495.DUP3

OP1495.DUP3:                                      ; preds = %OP1494.JUMPI
  %gas.remaining5362 = load i64, ptr %gas.remaining.addr, align 8
  %4025 = sub i64 %gas.remaining5362, 24
  %4026 = icmp ult i64 %gas.remaining5362, 24
  store i64 %4025, ptr %gas.remaining.addr, align 8
  br i1 %4026, label %return, label %OP1495.DUP3.contd, !prof !2, !annotation !3

OP1495.DUP3.contd:                                ; preds = %OP1495.DUP3
  %stack_len5363 = load i64, ptr %len.addr, align 8
  %4027 = icmp ult i64 %stack_len5363, 3
  %4028 = icmp ugt i64 %stack_len5363, 1023
  %4029 = or i1 %4027, %4028
  %4030 = select i1 %4027, i8 91, i8 92
  br i1 %4029, label %return, label %OP1495.DUP3.contd5364, !prof !2

OP1495.DUP3.contd5364:                            ; preds = %OP1495.DUP3.contd
  %4031 = add i64 %stack_len5363, 1
  store i64 %4031, ptr %len.addr, align 8
  %4032 = sub i64 %stack_len5363, 3
  %sp5365 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4032
  %dup35366 = load i256, ptr %sp5365, align 16
  %sp5367 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5363
  store i256 %dup35366, ptr %sp5367, align 16
  br label %OP1496.SWAP1, !annotation !5

OP1496.SWAP1:                                     ; preds = %OP1495.DUP3.contd5364
  %stack_len5368 = load i64, ptr %len.addr, align 8
  %4033 = sub i64 %stack_len5368, 1
  %sp5369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4033
  %swap.a5370 = load i256, ptr %sp5369, align 16
  %4034 = sub i64 %stack_len5368, 2
  %sp5371 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4034
  %swap.b5372 = load i256, ptr %sp5371, align 16
  store i256 %swap.a5370, ptr %sp5371, align 16
  store i256 %swap.b5372, ptr %sp5369, align 16
  br label %OP1497.SUB, !annotation !5

OP1497.SUB:                                       ; preds = %OP1496.SWAP1
  %stack_len5373 = load i64, ptr %len.addr, align 8
  %4035 = add i64 %stack_len5373, -1
  store i64 %4035, ptr %len.addr, align 8
  %4036 = add i64 %stack_len5373, -1
  %sp5374 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4036
  %a5375 = load i256, ptr %sp5374, align 16
  %4037 = add i64 %stack_len5373, -2
  %sp5376 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4037
  %b5377 = load i256, ptr %sp5376, align 16
  %4038 = sub i256 %a5375, %b5377
  %4039 = add i64 %stack_len5373, -2
  %sp5378 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4039
  store i256 %4038, ptr %sp5378, align 16
  br label %OP1498.PUSH1, !annotation !5

OP1498.PUSH1:                                     ; preds = %OP1497.SUB
  %stack_len5379 = load i64, ptr %len.addr, align 8
  %4040 = add i64 %stack_len5379, 1
  store i64 %4040, ptr %len.addr, align 8
  %sp5380 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5379
  store i256 31, ptr %sp5380, align 16
  br label %OP1499.AND, !annotation !5

OP1499.AND:                                       ; preds = %OP1498.PUSH1
  %stack_len5381 = load i64, ptr %len.addr, align 8
  %4041 = add i64 %stack_len5381, -1
  store i64 %4041, ptr %len.addr, align 8
  %4042 = add i64 %stack_len5381, -1
  %sp5382 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4042
  %a5383 = load i256, ptr %sp5382, align 16
  %4043 = add i64 %stack_len5381, -2
  %sp5384 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4043
  %b5385 = load i256, ptr %sp5384, align 16
  %4044 = and i256 %a5383, %b5385
  %4045 = add i64 %stack_len5381, -2
  %sp5386 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4045
  store i256 %4044, ptr %sp5386, align 16
  br label %OP1500.DUP3, !annotation !5

OP1500.DUP3:                                      ; preds = %OP1499.AND
  %stack_len5387 = load i64, ptr %len.addr, align 8
  %4046 = add i64 %stack_len5387, 1
  store i64 %4046, ptr %len.addr, align 8
  %4047 = sub i64 %stack_len5387, 3
  %sp5388 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4047
  %dup35389 = load i256, ptr %sp5388, align 16
  %sp5390 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5387
  store i256 %dup35389, ptr %sp5390, align 16
  br label %OP1501.ADD, !annotation !5

OP1501.ADD:                                       ; preds = %OP1500.DUP3
  %stack_len5391 = load i64, ptr %len.addr, align 8
  %4048 = add i64 %stack_len5391, -1
  store i64 %4048, ptr %len.addr, align 8
  %4049 = add i64 %stack_len5391, -1
  %sp5392 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4049
  %a5393 = load i256, ptr %sp5392, align 16
  %4050 = add i64 %stack_len5391, -2
  %sp5394 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4050
  %b5395 = load i256, ptr %sp5394, align 16
  %4051 = add i256 %a5393, %b5395
  %4052 = add i64 %stack_len5391, -2
  %sp5396 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4052
  store i256 %4051, ptr %sp5396, align 16
  br label %OP1502.SWAP2, !annotation !5

OP1502.SWAP2:                                     ; preds = %OP1501.ADD
  %stack_len5397 = load i64, ptr %len.addr, align 8
  %4053 = sub i64 %stack_len5397, 1
  %sp5398 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4053
  %swap.a5399 = load i256, ptr %sp5398, align 16
  %4054 = sub i64 %stack_len5397, 3
  %sp5400 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4054
  %swap.b5401 = load i256, ptr %sp5400, align 16
  store i256 %swap.a5399, ptr %sp5400, align 16
  store i256 %swap.b5401, ptr %sp5398, align 16
  br label %OP1503.JUMPDEST, !annotation !5

OP1503.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1502.SWAP2, %OP1467.JUMP, %OP1448.JUMPI
  %gas.remaining5402 = load i64, ptr %gas.remaining.addr, align 8
  %4055 = sub i64 %gas.remaining5402, 22
  %4056 = icmp ult i64 %gas.remaining5402, 22
  store i64 %4055, ptr %gas.remaining.addr, align 8
  br i1 %4056, label %return, label %OP1503.JUMPDEST.contd, !prof !2, !annotation !3

OP1503.JUMPDEST.contd:                            ; preds = %OP1503.JUMPDEST
  %stack_len5403 = load i64, ptr %len.addr, align 8
  %4057 = icmp ult i64 %stack_len5403, 7
  br i1 %4057, label %return, label %OP1503.JUMPDEST.contd5404, !prof !2, !annotation !9

OP1503.JUMPDEST.contd5404:                        ; preds = %OP1503.JUMPDEST.contd
  br label %OP1504.POP, !annotation !5

OP1504.POP:                                       ; preds = %OP1503.JUMPDEST.contd5404
  %stack_len5405 = load i64, ptr %len.addr, align 8
  %4058 = add i64 %stack_len5405, -1
  store i64 %4058, ptr %len.addr, align 8
  br label %OP1505.POP, !annotation !5

OP1505.POP:                                       ; preds = %OP1504.POP
  %stack_len5406 = load i64, ptr %len.addr, align 8
  %4059 = add i64 %stack_len5406, -1
  store i64 %4059, ptr %len.addr, align 8
  br label %OP1506.POP, !annotation !5

OP1506.POP:                                       ; preds = %OP1505.POP
  %stack_len5407 = load i64, ptr %len.addr, align 8
  %4060 = add i64 %stack_len5407, -1
  store i64 %4060, ptr %len.addr, align 8
  br label %OP1507.POP, !annotation !5

OP1507.POP:                                       ; preds = %OP1506.POP
  %stack_len5408 = load i64, ptr %len.addr, align 8
  %4061 = add i64 %stack_len5408, -1
  store i64 %4061, ptr %len.addr, align 8
  br label %OP1508.POP, !annotation !5

OP1508.POP:                                       ; preds = %OP1507.POP
  %stack_len5409 = load i64, ptr %len.addr, align 8
  %4062 = add i64 %stack_len5409, -1
  store i64 %4062, ptr %len.addr, align 8
  br label %OP1509.DUP2, !annotation !5

OP1509.DUP2:                                      ; preds = %OP1508.POP
  %stack_len5410 = load i64, ptr %len.addr, align 8
  %4063 = add i64 %stack_len5410, 1
  store i64 %4063, ptr %len.addr, align 8
  %4064 = sub i64 %stack_len5410, 2
  %sp5411 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4064
  %dup25412 = load i256, ptr %sp5411, align 16
  %sp5413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5410
  store i256 %dup25412, ptr %sp5413, align 16
  br label %OP1510.JUMP, !annotation !5

OP1510.JUMP:                                      ; preds = %OP1509.DUP2
  %stack_len5414 = load i64, ptr %len.addr, align 8
  %4065 = add i64 %stack_len5414, -1
  store i64 %4065, ptr %len.addr, align 8
  %4066 = add i64 %stack_len5414, -1
  %sp5415 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4066
  %a5416 = load i256, ptr %sp5415, align 16
  br label %dynamic_jump_table

OP1511.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP602.JUMP
  %gas.remaining5417 = load i64, ptr %gas.remaining.addr, align 8
  %4067 = sub i64 %gas.remaining5417, 26
  %4068 = icmp ult i64 %gas.remaining5417, 26
  store i64 %4067, ptr %gas.remaining.addr, align 8
  br i1 %4068, label %return, label %OP1511.JUMPDEST.contd, !prof !2, !annotation !3

OP1511.JUMPDEST.contd:                            ; preds = %OP1511.JUMPDEST
  %stack_len5418 = load i64, ptr %len.addr, align 8
  %4069 = icmp ult i64 %stack_len5418, 2
  %4070 = icmp ugt i64 %stack_len5418, 1018
  %4071 = or i1 %4069, %4070
  %4072 = select i1 %4069, i8 91, i8 92
  br i1 %4071, label %return, label %OP1511.JUMPDEST.contd5419, !prof !2

OP1511.JUMPDEST.contd5419:                        ; preds = %OP1511.JUMPDEST.contd
  br label %OP1512.PUSH1, !annotation !5

OP1512.PUSH1:                                     ; preds = %OP1511.JUMPDEST.contd5419
  %stack_len5420 = load i64, ptr %len.addr, align 8
  %4073 = add i64 %stack_len5420, 1
  store i64 %4073, ptr %len.addr, align 8
  %sp5421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5420
  store i256 0, ptr %sp5421, align 16
  br label %OP1513.PUSH2, !annotation !5

OP1513.PUSH2:                                     ; preds = %OP1512.PUSH1
  %stack_len5422 = load i64, ptr %len.addr, align 8
  %4074 = add i64 %stack_len5422, 1
  store i64 %4074, ptr %len.addr, align 8
  %sp5423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5422
  store i256 3035, ptr %sp5423, align 16
  br label %OP1514.CALLER, !annotation !5

OP1514.CALLER:                                    ; preds = %OP1513.PUSH2
  %stack_len5424 = load i64, ptr %len.addr, align 8
  %4075 = add i64 %stack_len5424, 1
  store i64 %4075, ptr %len.addr, align 8
  %contract.caller.addr5425 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller5426 = load i160, ptr %contract.caller.addr5425, align 16
  %4076 = call i160 @llvm.bswap.i160(i160 %contract.caller5426)
  %4077 = zext i160 %4076 to i256
  %sp5427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5424
  store i256 %4077, ptr %sp5427, align 16
  br label %OP1515.DUP5, !annotation !5

OP1515.DUP5:                                      ; preds = %OP1514.CALLER
  %stack_len5428 = load i64, ptr %len.addr, align 8
  %4078 = add i64 %stack_len5428, 1
  store i64 %4078, ptr %len.addr, align 8
  %4079 = sub i64 %stack_len5428, 5
  %sp5429 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4079
  %dup55430 = load i256, ptr %sp5429, align 16
  %sp5431 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5428
  store i256 %dup55430, ptr %sp5431, align 16
  br label %OP1516.DUP5, !annotation !5

OP1516.DUP5:                                      ; preds = %OP1515.DUP5
  %stack_len5432 = load i64, ptr %len.addr, align 8
  %4080 = add i64 %stack_len5432, 1
  store i64 %4080, ptr %len.addr, align 8
  %4081 = sub i64 %stack_len5432, 5
  %sp5433 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4081
  %dup55434 = load i256, ptr %sp5433, align 16
  %sp5435 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5432
  store i256 %dup55434, ptr %sp5435, align 16
  br label %OP1517.PUSH2, !annotation !5

OP1517.PUSH2:                                     ; preds = %OP1516.DUP5
  br label %OP1518.JUMP, !annotation !6

OP1518.JUMP:                                      ; preds = %OP1517.PUSH2
  %stack_len5436 = load i64, ptr %len.addr, align 8
  br label %OP952.JUMPDEST

OP1519.JUMPDEST:                                  ; preds = %dynamic_jump_table
  %gas.remaining5437 = load i64, ptr %gas.remaining.addr, align 8
  %4082 = sub i64 %gas.remaining5437, 24
  %4083 = icmp ult i64 %gas.remaining5437, 24
  store i64 %4082, ptr %gas.remaining.addr, align 8
  br i1 %4083, label %return, label %OP1519.JUMPDEST.contd, !prof !2, !annotation !3

OP1519.JUMPDEST.contd:                            ; preds = %OP1519.JUMPDEST
  %stack_len5438 = load i64, ptr %len.addr, align 8
  %4084 = icmp ult i64 %stack_len5438, 5
  br i1 %4084, label %return, label %OP1519.JUMPDEST.contd5439, !prof !2, !annotation !9

OP1519.JUMPDEST.contd5439:                        ; preds = %OP1519.JUMPDEST.contd
  br label %OP1520.SWAP1, !annotation !5

OP1520.SWAP1:                                     ; preds = %OP1519.JUMPDEST.contd5439
  %stack_len5440 = load i64, ptr %len.addr, align 8
  %4085 = sub i64 %stack_len5440, 1
  %sp5441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4085
  %swap.a5442 = load i256, ptr %sp5441, align 16
  %4086 = sub i64 %stack_len5440, 2
  %sp5443 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4086
  %swap.b5444 = load i256, ptr %sp5443, align 16
  store i256 %swap.a5442, ptr %sp5443, align 16
  store i256 %swap.b5444, ptr %sp5441, align 16
  br label %OP1521.POP, !annotation !5

OP1521.POP:                                       ; preds = %OP1520.SWAP1
  %stack_len5445 = load i64, ptr %len.addr, align 8
  %4087 = add i64 %stack_len5445, -1
  store i64 %4087, ptr %len.addr, align 8
  br label %OP1522.SWAP3, !annotation !5

OP1522.SWAP3:                                     ; preds = %OP1521.POP
  %stack_len5446 = load i64, ptr %len.addr, align 8
  %4088 = sub i64 %stack_len5446, 1
  %sp5447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4088
  %swap.a5448 = load i256, ptr %sp5447, align 16
  %4089 = sub i64 %stack_len5446, 4
  %sp5449 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4089
  %swap.b5450 = load i256, ptr %sp5449, align 16
  store i256 %swap.a5448, ptr %sp5449, align 16
  store i256 %swap.b5450, ptr %sp5447, align 16
  br label %OP1523.SWAP2, !annotation !5

OP1523.SWAP2:                                     ; preds = %OP1522.SWAP3
  %stack_len5451 = load i64, ptr %len.addr, align 8
  %4090 = sub i64 %stack_len5451, 1
  %sp5452 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4090
  %swap.a5453 = load i256, ptr %sp5452, align 16
  %4091 = sub i64 %stack_len5451, 3
  %sp5454 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4091
  %swap.b5455 = load i256, ptr %sp5454, align 16
  store i256 %swap.a5453, ptr %sp5454, align 16
  store i256 %swap.b5455, ptr %sp5452, align 16
  br label %OP1524.POP, !annotation !5

OP1524.POP:                                       ; preds = %OP1523.SWAP2
  %stack_len5456 = load i64, ptr %len.addr, align 8
  %4092 = add i64 %stack_len5456, -1
  store i64 %4092, ptr %len.addr, align 8
  br label %OP1525.POP, !annotation !5

OP1525.POP:                                       ; preds = %OP1524.POP
  %stack_len5457 = load i64, ptr %len.addr, align 8
  %4093 = add i64 %stack_len5457, -1
  store i64 %4093, ptr %len.addr, align 8
  br label %OP1526.JUMP, !annotation !5

OP1526.JUMP:                                      ; preds = %OP1525.POP
  %stack_len5458 = load i64, ptr %len.addr, align 8
  %4094 = add i64 %stack_len5458, -1
  store i64 %4094, ptr %len.addr, align 8
  %4095 = add i64 %stack_len5458, -1
  %sp5459 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4095
  %a5460 = load i256, ptr %sp5459, align 16
  br label %dynamic_jump_table

OP1527.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP667.JUMP
  %gas.remaining5461 = load i64, ptr %gas.remaining.addr, align 8
  %4096 = sub i64 %gas.remaining5461, 132
  %4097 = icmp ult i64 %gas.remaining5461, 132
  store i64 %4096, ptr %gas.remaining.addr, align 8
  br i1 %4097, label %return, label %OP1527.JUMPDEST.contd, !prof !2, !annotation !3

OP1527.JUMPDEST.contd:                            ; preds = %OP1527.JUMPDEST
  %stack_len5462 = load i64, ptr %len.addr, align 8
  %4098 = icmp ult i64 %stack_len5462, 3
  %4099 = icmp ugt i64 %stack_len5462, 1022
  %4100 = or i1 %4098, %4099
  %4101 = select i1 %4098, i8 91, i8 92
  br i1 %4100, label %return, label %OP1527.JUMPDEST.contd5463, !prof !2

OP1527.JUMPDEST.contd5463:                        ; preds = %OP1527.JUMPDEST.contd
  br label %OP1528.PUSH1, !annotation !5

OP1528.PUSH1:                                     ; preds = %OP1527.JUMPDEST.contd5463
  %stack_len5464 = load i64, ptr %len.addr, align 8
  %4102 = add i64 %stack_len5464, 1
  store i64 %4102, ptr %len.addr, align 8
  %sp5465 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5464
  store i256 4, ptr %sp5465, align 16
  br label %OP1529.PUSH1, !annotation !5

OP1529.PUSH1:                                     ; preds = %OP1528.PUSH1
  %stack_len5466 = load i64, ptr %len.addr, align 8
  %4103 = add i64 %stack_len5466, 1
  store i64 %4103, ptr %len.addr, align 8
  %sp5467 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5466
  store i256 32, ptr %sp5467, align 16
  br label %OP1530.MSTORE, !annotation !5

OP1530.MSTORE:                                    ; preds = %OP1529.PUSH1
  %stack_len5468 = load i64, ptr %len.addr, align 8
  %4104 = add i64 %stack_len5468, -2
  store i64 %4104, ptr %len.addr, align 8
  %4105 = add i64 %stack_len5468, -1
  %sp5469 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4105
  %a5470 = load i256, ptr %sp5469, align 16
  %4106 = add i64 %stack_len5468, -2
  %sp5471 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4106
  %b5472 = load i256, ptr %sp5471, align 16
  %4107 = call i8 @__revmc_ir_builtin_mstore(i256 %a5470, i256 %b5472, ptr %arg.ecx.addr)
  %4108 = icmp ne i8 %4107, 0
  br i1 %4108, label %return, label %OP1530.MSTORE.contd, !prof !2

OP1530.MSTORE.contd:                              ; preds = %OP1530.MSTORE
  br label %OP1531.DUP2, !annotation !5

OP1531.DUP2:                                      ; preds = %OP1530.MSTORE.contd
  %stack_len5473 = load i64, ptr %len.addr, align 8
  %4109 = add i64 %stack_len5473, 1
  store i64 %4109, ptr %len.addr, align 8
  %4110 = sub i64 %stack_len5473, 2
  %sp5474 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4110
  %dup25475 = load i256, ptr %sp5474, align 16
  %sp5476 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5473
  store i256 %dup25475, ptr %sp5476, align 16
  br label %OP1532.PUSH1, !annotation !5

OP1532.PUSH1:                                     ; preds = %OP1531.DUP2
  %stack_len5477 = load i64, ptr %len.addr, align 8
  %4111 = add i64 %stack_len5477, 1
  store i64 %4111, ptr %len.addr, align 8
  %sp5478 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5477
  store i256 0, ptr %sp5478, align 16
  br label %OP1533.MSTORE, !annotation !5

OP1533.MSTORE:                                    ; preds = %OP1532.PUSH1
  %stack_len5479 = load i64, ptr %len.addr, align 8
  %4112 = add i64 %stack_len5479, -2
  store i64 %4112, ptr %len.addr, align 8
  %4113 = add i64 %stack_len5479, -1
  %sp5480 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4113
  %a5481 = load i256, ptr %sp5480, align 16
  %4114 = add i64 %stack_len5479, -2
  %sp5482 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4114
  %b5483 = load i256, ptr %sp5482, align 16
  %4115 = call i8 @__revmc_ir_builtin_mstore(i256 %a5481, i256 %b5483, ptr %arg.ecx.addr)
  %4116 = icmp ne i8 %4115, 0
  br i1 %4116, label %return, label %OP1533.MSTORE.contd, !prof !2

OP1533.MSTORE.contd:                              ; preds = %OP1533.MSTORE
  br label %OP1534.PUSH1, !annotation !5

OP1534.PUSH1:                                     ; preds = %OP1533.MSTORE.contd
  %stack_len5484 = load i64, ptr %len.addr, align 8
  %4117 = add i64 %stack_len5484, 1
  store i64 %4117, ptr %len.addr, align 8
  %sp5485 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5484
  store i256 64, ptr %sp5485, align 16
  br label %OP1535.PUSH1, !annotation !5

OP1535.PUSH1:                                     ; preds = %OP1534.PUSH1
  %stack_len5486 = load i64, ptr %len.addr, align 8
  %4118 = add i64 %stack_len5486, 1
  store i64 %4118, ptr %len.addr, align 8
  %sp5487 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5486
  store i256 0, ptr %sp5487, align 16
  br label %OP1536.KECCAK256, !annotation !5

OP1536.KECCAK256:                                 ; preds = %OP1535.PUSH1
  %stack_len5488 = load i64, ptr %len.addr, align 8
  %4119 = add i64 %stack_len5488, -1
  store i64 %4119, ptr %len.addr, align 8
  %4120 = sub i64 %stack_len5488, 2
  %sp5489 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4120
  %4121 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp5489)
  %4122 = icmp ne i8 %4121, 0
  br i1 %4122, label %return, label %OP1536.KECCAK256.contd, !prof !2

OP1536.KECCAK256.contd:                           ; preds = %OP1536.KECCAK256
  br label %OP1537.PUSH1, !annotation !5

OP1537.PUSH1:                                     ; preds = %OP1536.KECCAK256.contd
  %stack_len5490 = load i64, ptr %len.addr, align 8
  %4123 = add i64 %stack_len5490, 1
  store i64 %4123, ptr %len.addr, align 8
  %sp5491 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5490
  store i256 32, ptr %sp5491, align 16
  br label %OP1538.MSTORE, !annotation !5

OP1538.MSTORE:                                    ; preds = %OP1537.PUSH1
  %stack_len5492 = load i64, ptr %len.addr, align 8
  %4124 = add i64 %stack_len5492, -2
  store i64 %4124, ptr %len.addr, align 8
  %4125 = add i64 %stack_len5492, -1
  %sp5493 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4125
  %a5494 = load i256, ptr %sp5493, align 16
  %4126 = add i64 %stack_len5492, -2
  %sp5495 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4126
  %b5496 = load i256, ptr %sp5495, align 16
  %4127 = call i8 @__revmc_ir_builtin_mstore(i256 %a5494, i256 %b5496, ptr %arg.ecx.addr)
  %4128 = icmp ne i8 %4127, 0
  br i1 %4128, label %return, label %OP1538.MSTORE.contd, !prof !2

OP1538.MSTORE.contd:                              ; preds = %OP1538.MSTORE
  br label %OP1539.DUP1, !annotation !5

OP1539.DUP1:                                      ; preds = %OP1538.MSTORE.contd
  %stack_len5497 = load i64, ptr %len.addr, align 8
  %4129 = add i64 %stack_len5497, 1
  store i64 %4129, ptr %len.addr, align 8
  %4130 = sub i64 %stack_len5497, 1
  %sp5498 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4130
  %dup15499 = load i256, ptr %sp5498, align 16
  %sp5500 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5497
  store i256 %dup15499, ptr %sp5500, align 16
  br label %OP1540.PUSH1, !annotation !5

OP1540.PUSH1:                                     ; preds = %OP1539.DUP1
  %stack_len5501 = load i64, ptr %len.addr, align 8
  %4131 = add i64 %stack_len5501, 1
  store i64 %4131, ptr %len.addr, align 8
  %sp5502 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5501
  store i256 0, ptr %sp5502, align 16
  br label %OP1541.MSTORE, !annotation !5

OP1541.MSTORE:                                    ; preds = %OP1540.PUSH1
  %stack_len5503 = load i64, ptr %len.addr, align 8
  %4132 = add i64 %stack_len5503, -2
  store i64 %4132, ptr %len.addr, align 8
  %4133 = add i64 %stack_len5503, -1
  %sp5504 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4133
  %a5505 = load i256, ptr %sp5504, align 16
  %4134 = add i64 %stack_len5503, -2
  %sp5506 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4134
  %b5507 = load i256, ptr %sp5506, align 16
  %4135 = call i8 @__revmc_ir_builtin_mstore(i256 %a5505, i256 %b5507, ptr %arg.ecx.addr)
  %4136 = icmp ne i8 %4135, 0
  br i1 %4136, label %return, label %OP1541.MSTORE.contd, !prof !2

OP1541.MSTORE.contd:                              ; preds = %OP1541.MSTORE
  br label %OP1542.PUSH1, !annotation !5

OP1542.PUSH1:                                     ; preds = %OP1541.MSTORE.contd
  %stack_len5508 = load i64, ptr %len.addr, align 8
  %4137 = add i64 %stack_len5508, 1
  store i64 %4137, ptr %len.addr, align 8
  %sp5509 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5508
  store i256 64, ptr %sp5509, align 16
  br label %OP1543.PUSH1, !annotation !5

OP1543.PUSH1:                                     ; preds = %OP1542.PUSH1
  %stack_len5510 = load i64, ptr %len.addr, align 8
  %4138 = add i64 %stack_len5510, 1
  store i64 %4138, ptr %len.addr, align 8
  %sp5511 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5510
  store i256 0, ptr %sp5511, align 16
  br label %OP1544.KECCAK256, !annotation !5

OP1544.KECCAK256:                                 ; preds = %OP1543.PUSH1
  %stack_len5512 = load i64, ptr %len.addr, align 8
  %4139 = add i64 %stack_len5512, -1
  store i64 %4139, ptr %len.addr, align 8
  %4140 = sub i64 %stack_len5512, 2
  %sp5513 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4140
  %4141 = call i8 @__revmc_builtin_keccak256(ptr %arg.ecx.addr, ptr %sp5513)
  %4142 = icmp ne i8 %4141, 0
  br i1 %4142, label %return, label %OP1544.KECCAK256.contd, !prof !2

OP1544.KECCAK256.contd:                           ; preds = %OP1544.KECCAK256
  br label %OP1545.PUSH1, !annotation !5

OP1545.PUSH1:                                     ; preds = %OP1544.KECCAK256.contd
  %stack_len5514 = load i64, ptr %len.addr, align 8
  %4143 = add i64 %stack_len5514, 1
  store i64 %4143, ptr %len.addr, align 8
  %sp5515 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5514
  store i256 0, ptr %sp5515, align 16
  br label %OP1546.SWAP2, !annotation !5

OP1546.SWAP2:                                     ; preds = %OP1545.PUSH1
  %stack_len5516 = load i64, ptr %len.addr, align 8
  %4144 = sub i64 %stack_len5516, 1
  %sp5517 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4144
  %swap.a5518 = load i256, ptr %sp5517, align 16
  %4145 = sub i64 %stack_len5516, 3
  %sp5519 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4145
  %swap.b5520 = load i256, ptr %sp5519, align 16
  store i256 %swap.a5518, ptr %sp5519, align 16
  store i256 %swap.b5520, ptr %sp5517, align 16
  br label %OP1547.POP, !annotation !5

OP1547.POP:                                       ; preds = %OP1546.SWAP2
  %stack_len5521 = load i64, ptr %len.addr, align 8
  %4146 = add i64 %stack_len5521, -1
  store i64 %4146, ptr %len.addr, align 8
  br label %OP1548.SWAP2, !annotation !5

OP1548.SWAP2:                                     ; preds = %OP1547.POP
  %stack_len5522 = load i64, ptr %len.addr, align 8
  %4147 = sub i64 %stack_len5522, 1
  %sp5523 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4147
  %swap.a5524 = load i256, ptr %sp5523, align 16
  %4148 = sub i64 %stack_len5522, 3
  %sp5525 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4148
  %swap.b5526 = load i256, ptr %sp5525, align 16
  store i256 %swap.a5524, ptr %sp5525, align 16
  store i256 %swap.b5526, ptr %sp5523, align 16
  br label %OP1549.POP, !annotation !5

OP1549.POP:                                       ; preds = %OP1548.SWAP2
  %stack_len5527 = load i64, ptr %len.addr, align 8
  %4149 = add i64 %stack_len5527, -1
  store i64 %4149, ptr %len.addr, align 8
  br label %OP1550.POP, !annotation !5

OP1550.POP:                                       ; preds = %OP1549.POP
  %stack_len5528 = load i64, ptr %len.addr, align 8
  %4150 = add i64 %stack_len5528, -1
  store i64 %4150, ptr %len.addr, align 8
  br label %OP1551.SLOAD, !annotation !5

OP1551.SLOAD:                                     ; preds = %OP1550.POP
  %stack_len5529 = load i64, ptr %len.addr, align 8
  %4151 = sub i64 %stack_len5529, 1
  %sp5530 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4151
  %4152 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp5530, i8 19)
  %4153 = icmp ne i8 %4152, 0
  br i1 %4153, label %return, label %OP1551.SLOAD.contd, !prof !2

OP1551.SLOAD.contd:                               ; preds = %OP1551.SLOAD
  br label %OP1552.DUP2, !annotation !5

OP1552.DUP2:                                      ; preds = %OP1551.SLOAD.contd
  %stack_len5531 = load i64, ptr %len.addr, align 8
  %4154 = add i64 %stack_len5531, 1
  store i64 %4154, ptr %len.addr, align 8
  %4155 = sub i64 %stack_len5531, 2
  %sp5532 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4155
  %dup25533 = load i256, ptr %sp5532, align 16
  %sp5534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5531
  store i256 %dup25533, ptr %sp5534, align 16
  br label %OP1553.JUMP, !annotation !5

OP1553.JUMP:                                      ; preds = %OP1552.DUP2
  %stack_len5535 = load i64, ptr %len.addr, align 8
  %4156 = add i64 %stack_len5535, -1
  store i64 %4156, ptr %len.addr, align 8
  %4157 = add i64 %stack_len5535, -1
  %sp5536 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4157
  %a5537 = load i256, ptr %sp5536, align 16
  br label %dynamic_jump_table

OP1554.STOP:                                      ; No predecessors!
  %stack_len5538 = load i64, ptr %len.addr, align 8
  br label %return, !annotation !7

dynamic_jump_table:                               ; preds = %OP1553.JUMP, %OP1526.JUMP, %OP1510.JUMP, %OP1387.JUMP, %OP1369.JUMP, %OP1355.JUMP, %OP1232.JUMP, %OP951.JUMP, %OP941.JUMP, %OP865.JUMP, %OP742.JUMP
  %4158 = phi i256 [ %a2608, %OP742.JUMP ], [ %a3083, %OP865.JUMP ], [ %a3360, %OP941.JUMP ], [ %a3391, %OP951.JUMP ], [ %a4402, %OP1232.JUMP ], [ %a4840, %OP1355.JUMP ], [ %a4889, %OP1369.JUMP ], [ %a4941, %OP1387.JUMP ], [ %a5416, %OP1510.JUMP ], [ %a5460, %OP1526.JUMP ], [ %a5537, %OP1553.JUMP ]
  switch i256 %4158, label %return [
    i256 175, label %OP70.JUMPDEST
    i256 183, label %OP74.JUMPDEST
    i256 185, label %OP76.JUMPDEST
    i256 196, label %OP84.JUMPDEST
    i256 204, label %OP88.JUMPDEST
    i256 241, label %OP120.JUMPDEST
    i256 268, label %OP142.JUMPDEST
    i256 313, label %OP179.JUMPDEST
    i256 327, label %OP192.JUMPDEST
    i256 338, label %OP200.JUMPDEST
    i256 391, label %OP226.JUMPDEST
    i256 417, label %OP249.JUMPDEST
    i256 428, label %OP257.JUMPDEST
    i256 436, label %OP261.JUMPDEST
    i256 458, label %OP280.JUMPDEST
    i256 469, label %OP288.JUMPDEST
    i256 553, label %OP324.JUMPDEST
    i256 579, label %OP347.JUMPDEST
    i256 590, label %OP355.JUMPDEST
    i256 612, label %OP371.JUMPDEST
    i256 614, label %OP373.JUMPDEST
    i256 625, label %OP381.JUMPDEST
    i256 633, label %OP385.JUMPDEST
    i256 661, label %OP408.JUMPDEST
    i256 672, label %OP416.JUMPDEST
    i256 716, label %OP434.JUMPDEST
    i256 738, label %OP453.JUMPDEST
    i256 749, label %OP461.JUMPDEST
    i256 757, label %OP465.JUMPDEST
    i256 794, label %OP497.JUMPDEST
    i256 821, label %OP519.JUMPDEST
    i256 866, label %OP556.JUMPDEST
    i256 880, label %OP569.JUMPDEST
    i256 891, label %OP577.JUMPDEST
    i256 944, label %OP603.JUMPDEST
    i256 970, label %OP626.JUMPDEST
    i256 978, label %OP630.JUMPDEST
    i256 980, label %OP632.JUMPDEST
    i256 991, label %OP640.JUMPDEST
    i256 1066, label %OP668.JUMPDEST
    i256 1088, label %OP687.JUMPDEST
    i256 1245, label %OP743.JUMPDEST
    i256 1352, label %OP823.JUMPDEST
    i256 1366, label %OP834.JUMPDEST
    i256 1395, label %OP858.JUMPDEST
    i256 1403, label %OP866.JUMPDEST
    i256 1645, label %OP942.JUMPDEST
    i256 1676, label %OP952.JUMPDEST
    i256 1756, label %OP983.JUMPDEST
    i256 1972, label %OP1036.JUMPDEST
    i256 2116, label %OP1086.JUMPDEST
    i256 2255, label %OP1135.JUMPDEST
    i256 2521, label %OP1233.JUMPDEST
    i256 2599, label %OP1263.JUMPDEST
    i256 2740, label %OP1330.JUMPDEST
    i256 2821, label %OP1356.JUMPDEST
    i256 2840, label %OP1370.JUMPDEST
    i256 2864, label %OP1388.JUMPDEST
    i256 2971, label %OP1468.JUMPDEST
    i256 2985, label %OP1479.JUMPDEST
    i256 3014, label %OP1503.JUMPDEST
    i256 3022, label %OP1511.JUMPDEST
    i256 3035, label %OP1519.JUMPDEST
    i256 3043, label %OP1527.JUMPDEST
  ], !prof !11

suspend:                                          ; preds = %OP1317.CALL.contd
  %4159 = phi ptr [ blockaddress(@custom, %OP1318.SWAP4), %OP1317.CALL.contd ]
  %ecx.resume_at.addr5540 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 32
  store ptr %4159, ptr %ecx.resume_at.addr5540, align 8
  br label %return, !annotation !12

failure:                                          ; No predecessors!
  unreachable

return:                                           ; preds = %suspend, %dynamic_jump_table, %OP1554.STOP, %OP1551.SLOAD, %OP1544.KECCAK256, %OP1541.MSTORE, %OP1538.MSTORE, %OP1536.KECCAK256, %OP1533.MSTORE, %OP1530.MSTORE, %OP1527.JUMPDEST.contd, %OP1527.JUMPDEST, %OP1519.JUMPDEST.contd, %OP1519.JUMPDEST, %OP1511.JUMPDEST.contd, %OP1511.JUMPDEST, %OP1503.JUMPDEST.contd, %OP1503.JUMPDEST, %OP1495.DUP3.contd, %OP1495.DUP3, %OP1483.MSTORE, %OP1481.SLOAD, %OP1479.JUMPDEST.contd, %OP1479.JUMPDEST, %OP1477.KECCAK256, %OP1474.MSTORE, %OP1468.JUMPDEST.contd, %OP1468.JUMPDEST, %OP1461.MSTORE, %OP1457.SLOAD, %OP1454.PUSH2.contd, %OP1454.PUSH2, %OP1449.DUP1.contd, %OP1449.DUP1, %OP1432.SLOAD, %OP1427.MSTORE, %OP1420.MSTORE, %OP1415.MLOAD, %OP1391.SLOAD, %OP1388.JUMPDEST.contd, %OP1388.JUMPDEST, %OP1385.SLOAD, %OP1379.KECCAK256, %OP1376.MSTORE, %OP1373.MSTORE, %OP1370.JUMPDEST.contd, %OP1370.JUMPDEST, %OP1363.EXP, %OP1360.SLOAD, %OP1356.JUMPDEST.contd, %OP1356.JUMPDEST, %OP1353.LOG2, %OP1348.MLOAD, %OP1341.MSTORE, %OP1337.MLOAD, %OP1330.JUMPDEST.contd, %OP1330.JUMPDEST, %OP1329.REVERT.contd, %OP1329.REVERT, %OP1327.PUSH1.contd, %OP1327.PUSH1, %OP1318.SWAP4.contd, %OP1318.SWAP4, %OP1317.CALL, %OP1309.MLOAD, %OP1306.MLOAD, %OP1294.POP.contd, %OP1294.POP, %OP1293.SSTORE, %OP1286.SLOAD, %OP1282.KECCAK256, %OP1278.MSTORE, %OP1273.MSTORE, %OP1263.JUMPDEST.contd, %OP1263.JUMPDEST, %OP1262.REVERT.contd, %OP1262.REVERT, %OP1260.PUSH1.contd, %OP1260.PUSH1, %OP1253.SLOAD, %OP1252.KECCAK256, %OP1248.MSTORE, %OP1243.MSTORE, %OP1233.JUMPDEST.contd, %OP1233.JUMPDEST, %OP1223.LOG3, %OP1218.MLOAD, %OP1211.MSTORE, %OP1207.MLOAD, %OP1197.POP.contd, %OP1197.POP, %OP1196.SSTORE, %OP1189.SLOAD, %OP1185.KECCAK256, %OP1181.MSTORE, %OP1176.MSTORE, %OP1166.POP.contd, %OP1166.POP, %OP1165.SSTORE, %OP1158.SLOAD, %OP1154.KECCAK256, %OP1150.MSTORE, %OP1145.MSTORE, %OP1135.JUMPDEST.contd, %OP1135.JUMPDEST, %OP1134.POP.contd, %OP1134.POP, %OP1133.SSTORE, %OP1126.SLOAD, %OP1122.KECCAK256, %OP1118.MSTORE, %OP1113.MSTORE, %OP1105.KECCAK256, %OP1101.MSTORE, %OP1096.MSTORE, %OP1086.JUMPDEST.contd, %OP1086.JUMPDEST, %OP1085.REVERT.contd, %OP1085.REVERT, %OP1083.PUSH1.contd, %OP1083.PUSH1, %OP1076.SLOAD, %OP1075.KECCAK256, %OP1071.MSTORE, %OP1066.MSTORE, %OP1058.KECCAK256, %OP1054.MSTORE, %OP1049.MSTORE, %OP1040.DUP2.contd, %OP1040.DUP2, %OP1036.JUMPDEST.contd, %OP1036.JUMPDEST, %OP1033.SLOAD, %OP1032.KECCAK256, %OP1028.MSTORE, %OP1023.MSTORE, %OP1015.KECCAK256, %OP1011.MSTORE, %OP1006.MSTORE, %OP996.POP.contd, %OP996.POP, %OP983.JUMPDEST.contd, %OP983.JUMPDEST, %OP982.REVERT.contd, %OP982.REVERT, %OP980.PUSH1.contd, %OP980.PUSH1, %OP973.SLOAD, %OP972.KECCAK256, %OP968.MSTORE, %OP963.MSTORE, %OP952.JUMPDEST.contd, %OP952.JUMPDEST, %OP947.BALANCE, %OP942.JUMPDEST.contd, %OP942.JUMPDEST, %OP933.LOG3, %OP928.MLOAD, %OP921.MSTORE, %OP917.MLOAD, %OP907.POP.contd, %OP907.POP, %OP906.SSTORE, %OP903.KECCAK256, %OP899.MSTORE, %OP894.MSTORE, %OP886.KECCAK256, %OP882.MSTORE, %OP877.MSTORE, %OP866.JUMPDEST.contd, %OP866.JUMPDEST, %OP858.JUMPDEST.contd, %OP858.JUMPDEST, %OP850.DUP3.contd, %OP850.DUP3, %OP838.MSTORE, %OP836.SLOAD, %OP834.JUMPDEST.contd, %OP834.JUMPDEST, %OP832.KECCAK256, %OP829.MSTORE, %OP823.JUMPDEST.contd, %OP823.JUMPDEST, %OP816.MSTORE, %OP812.SLOAD, %OP809.PUSH2.contd, %OP809.PUSH2, %OP804.DUP1.contd, %OP804.DUP1, %OP787.SLOAD, %OP782.MSTORE, %OP775.MSTORE, %OP770.MLOAD, %OP746.SLOAD, %OP743.JUMPDEST.contd, %OP743.JUMPDEST, %OP741.LOG2, %OP736.MLOAD, %OP729.MSTORE, %OP725.MLOAD, %OP718.POP.contd, %OP718.POP, %OP717.SSTORE, %OP710.SLOAD, %OP706.KECCAK256, %OP702.MSTORE, %OP697.MSTORE, %OP687.JUMPDEST.contd, %OP687.JUMPDEST, %OP686.RETURN.contd, %OP686.RETURN, %OP681.MLOAD, %OP674.MSTORE, %OP670.MLOAD, %OP668.JUMPDEST.contd, %OP668.JUMPDEST, %OP640.JUMPDEST.contd, %OP640.JUMPDEST, %OP639.REVERT.contd, %OP639.REVERT, %OP637.PUSH1.contd, %OP637.PUSH1, %OP632.JUMPDEST.contd, %OP632.JUMPDEST, %OP631.STOP, %OP630.JUMPDEST, %OP626.JUMPDEST.contd, %OP626.JUMPDEST, %OP625.RETURN.contd, %OP625.RETURN, %OP620.MLOAD, %OP613.MSTORE, %OP605.MLOAD, %OP603.JUMPDEST.contd, %OP603.JUMPDEST, %OP577.JUMPDEST.contd, %OP577.JUMPDEST, %OP576.REVERT.contd, %OP576.REVERT, %OP574.PUSH1.contd, %OP574.PUSH1, %OP569.JUMPDEST.contd, %OP569.JUMPDEST, %OP568.RETURN.contd, %OP568.RETURN, %OP563.MLOAD, %OP556.JUMPDEST.contd, %OP556.JUMPDEST, %OP551.MSTORE, %OP546.EXP, %OP540.MLOAD, %OP536.DUP1.contd, %OP536.DUP1, %OP519.JUMPDEST.contd, %OP519.JUMPDEST, %OP511.MSTORE, %OP507.MLOAD, %OP504.DUP1.contd, %OP504.DUP1, %OP497.JUMPDEST.contd, %OP497.JUMPDEST, %OP488.MLOAD, %OP482.MSTORE, %OP480.MLOAD, %OP476.MSTORE, %OP467.MLOAD, %OP465.JUMPDEST.contd, %OP465.JUMPDEST, %OP461.JUMPDEST.contd, %OP461.JUMPDEST, %OP460.REVERT.contd, %OP460.REVERT, %OP458.PUSH1.contd, %OP458.PUSH1, %OP453.JUMPDEST.contd, %OP453.JUMPDEST, %OP452.RETURN.contd, %OP452.RETURN, %OP447.MLOAD, %OP440.MSTORE, %OP436.MLOAD, %OP434.JUMPDEST.contd, %OP434.JUMPDEST, %OP416.JUMPDEST.contd, %OP416.JUMPDEST, %OP415.REVERT.contd, %OP415.REVERT, %OP413.PUSH1.contd, %OP413.PUSH1, %OP408.JUMPDEST.contd, %OP408.JUMPDEST, %OP407.RETURN.contd, %OP407.RETURN, %OP402.MLOAD, %OP395.MSTORE, %OP387.MLOAD, %OP385.JUMPDEST.contd, %OP385.JUMPDEST, %OP381.JUMPDEST.contd, %OP381.JUMPDEST, %OP380.REVERT.contd, %OP380.REVERT, %OP378.PUSH1.contd, %OP378.PUSH1, %OP373.JUMPDEST.contd, %OP373.JUMPDEST, %OP372.STOP, %OP371.JUMPDEST, %OP355.JUMPDEST.contd, %OP355.JUMPDEST, %OP354.REVERT.contd, %OP354.REVERT, %OP352.PUSH1.contd, %OP352.PUSH1, %OP347.JUMPDEST.contd, %OP347.JUMPDEST, %OP346.RETURN.contd, %OP346.RETURN, %OP341.MLOAD, %OP334.MSTORE, %OP326.MLOAD, %OP324.JUMPDEST.contd, %OP324.JUMPDEST, %OP288.JUMPDEST.contd, %OP288.JUMPDEST, %OP287.REVERT.contd, %OP287.REVERT, %OP285.PUSH1.contd, %OP285.PUSH1, %OP280.JUMPDEST.contd, %OP280.JUMPDEST, %OP279.RETURN.contd, %OP279.RETURN, %OP274.MLOAD, %OP267.MSTORE, %OP263.MLOAD, %OP261.JUMPDEST.contd, %OP261.JUMPDEST, %OP257.JUMPDEST.contd, %OP257.JUMPDEST, %OP256.REVERT.contd, %OP256.REVERT, %OP254.PUSH1.contd, %OP254.PUSH1, %OP249.JUMPDEST.contd, %OP249.JUMPDEST, %OP248.RETURN.contd, %OP248.RETURN, %OP243.MLOAD, %OP236.MSTORE, %OP228.MLOAD, %OP226.JUMPDEST.contd, %OP226.JUMPDEST, %OP200.JUMPDEST.contd, %OP200.JUMPDEST, %OP199.REVERT.contd, %OP199.REVERT, %OP197.PUSH1.contd, %OP197.PUSH1, %OP192.JUMPDEST.contd, %OP192.JUMPDEST, %OP191.RETURN.contd, %OP191.RETURN, %OP186.MLOAD, %OP179.JUMPDEST.contd, %OP179.JUMPDEST, %OP174.MSTORE, %OP169.EXP, %OP163.MLOAD, %OP159.DUP1.contd, %OP159.DUP1, %OP142.JUMPDEST.contd, %OP142.JUMPDEST, %OP134.MSTORE, %OP130.MLOAD, %OP127.DUP1.contd, %OP127.DUP1, %OP120.JUMPDEST.contd, %OP120.JUMPDEST, %OP111.MLOAD, %OP105.MSTORE, %OP103.MLOAD, %OP99.MSTORE, %OP90.MLOAD, %OP88.JUMPDEST.contd, %OP88.JUMPDEST, %OP84.JUMPDEST.contd, %OP84.JUMPDEST, %OP83.REVERT.contd, %OP83.REVERT, %OP81.PUSH1.contd, %OP81.PUSH1, %OP76.JUMPDEST.contd, %OP76.JUMPDEST, %OP75.STOP, %OP74.JUMPDEST, %OP70.JUMPDEST.contd, %OP70.JUMPDEST, %OP65.DUP1.contd, %OP65.DUP1, %OP60.DUP1.contd, %OP60.DUP1, %OP55.DUP1.contd, %OP55.DUP1, %OP50.DUP1.contd, %OP50.DUP1, %OP45.DUP1.contd, %OP45.DUP1, %OP40.DUP1.contd, %OP40.DUP1, %OP35.DUP1.contd, %OP35.DUP1, %OP30.DUP1.contd, %OP30.DUP1, %OP25.DUP1.contd, %OP25.DUP1, %OP20.DUP1.contd, %OP20.DUP1, %OP8.PUSH1.contd, %OP8.PUSH1, %OP2.MSTORE, %OP0.PUSH1.contd, %OP0.PUSH1
  %4160 = phi i8 [ 80, %OP0.PUSH1 ], [ 92, %OP0.PUSH1.contd ], [ %9, %OP2.MSTORE ], [ 80, %OP8.PUSH1 ], [ 92, %OP8.PUSH1.contd ], [ 80, %OP20.DUP1 ], [ %63, %OP20.DUP1.contd ], [ 80, %OP25.DUP1 ], [ %81, %OP25.DUP1.contd ], [ 80, %OP30.DUP1 ], [ %99, %OP30.DUP1.contd ], [ 80, %OP35.DUP1 ], [ %117, %OP35.DUP1.contd ], [ 80, %OP40.DUP1 ], [ %135, %OP40.DUP1.contd ], [ 80, %OP45.DUP1 ], [ %153, %OP45.DUP1.contd ], [ 80, %OP50.DUP1 ], [ %171, %OP50.DUP1.contd ], [ 80, %OP55.DUP1 ], [ %189, %OP55.DUP1.contd ], [ 80, %OP60.DUP1 ], [ %207, %OP60.DUP1.contd ], [ 80, %OP65.DUP1 ], [ %225, %OP65.DUP1.contd ], [ 80, %OP70.JUMPDEST ], [ 92, %OP70.JUMPDEST.contd ], [ 80, %OP74.JUMPDEST ], [ 1, %OP75.STOP ], [ 80, %OP76.JUMPDEST ], [ 92, %OP76.JUMPDEST.contd ], [ 80, %OP81.PUSH1 ], [ 92, %OP81.PUSH1.contd ], [ %263, %OP83.REVERT ], [ 16, %OP83.REVERT.contd ], [ 80, %OP84.JUMPDEST ], [ 92, %OP84.JUMPDEST.contd ], [ 80, %OP88.JUMPDEST ], [ %274, %OP88.JUMPDEST.contd ], [ %277, %OP90.MLOAD ], [ %304, %OP99.MSTORE ], [ %313, %OP103.MLOAD ], [ %321, %OP105.MSTORE ], [ %335, %OP111.MLOAD ], [ 80, %OP120.JUMPDEST ], [ %360, %OP120.JUMPDEST.contd ], [ 80, %OP127.DUP1 ], [ %383, %OP127.DUP1.contd ], [ %394, %OP130.MLOAD ], [ %409, %OP134.MSTORE ], [ 80, %OP142.JUMPDEST ], [ 91, %OP142.JUMPDEST.contd ], [ 80, %OP159.DUP1 ], [ %463, %OP159.DUP1.contd ], [ %476, %OP163.MLOAD ], [ %491, %OP169.EXP ], [ %511, %OP174.MSTORE ], [ 80, %OP179.JUMPDEST ], [ 91, %OP179.JUMPDEST.contd ], [ %533, %OP186.MLOAD ], [ %549, %OP191.RETURN ], [ 2, %OP191.RETURN.contd ], [ 80, %OP192.JUMPDEST ], [ 92, %OP192.JUMPDEST.contd ], [ 80, %OP197.PUSH1 ], [ 92, %OP197.PUSH1.contd ], [ %570, %OP199.REVERT ], [ 16, %OP199.REVERT.contd ], [ 80, %OP200.JUMPDEST ], [ 92, %OP200.JUMPDEST.contd ], [ 80, %OP226.JUMPDEST ], [ %630, %OP226.JUMPDEST.contd ], [ %633, %OP228.MLOAD ], [ %661, %OP236.MSTORE ], [ %675, %OP243.MLOAD ], [ %691, %OP248.RETURN ], [ 2, %OP248.RETURN.contd ], [ 80, %OP249.JUMPDEST ], [ 92, %OP249.JUMPDEST.contd ], [ 80, %OP254.PUSH1 ], [ 92, %OP254.PUSH1.contd ], [ %712, %OP256.REVERT ], [ 16, %OP256.REVERT.contd ], [ 80, %OP257.JUMPDEST ], [ 92, %OP257.JUMPDEST.contd ], [ 80, %OP261.JUMPDEST ], [ %723, %OP261.JUMPDEST.contd ], [ %726, %OP263.MLOAD ], [ %738, %OP267.MSTORE ], [ %752, %OP274.MLOAD ], [ %768, %OP279.RETURN ], [ 2, %OP279.RETURN.contd ], [ 80, %OP280.JUMPDEST ], [ 92, %OP280.JUMPDEST.contd ], [ 80, %OP285.PUSH1 ], [ 92, %OP285.PUSH1.contd ], [ %789, %OP287.REVERT ], [ 16, %OP287.REVERT.contd ], [ 80, %OP288.JUMPDEST ], [ 92, %OP288.JUMPDEST.contd ], [ 80, %OP324.JUMPDEST ], [ %874, %OP324.JUMPDEST.contd ], [ %877, %OP326.MLOAD ], [ %905, %OP334.MSTORE ], [ %919, %OP341.MLOAD ], [ %935, %OP346.RETURN ], [ 2, %OP346.RETURN.contd ], [ 80, %OP347.JUMPDEST ], [ 92, %OP347.JUMPDEST.contd ], [ 80, %OP352.PUSH1 ], [ 92, %OP352.PUSH1.contd ], [ %956, %OP354.REVERT ], [ 16, %OP354.REVERT.contd ], [ 80, %OP355.JUMPDEST ], [ 92, %OP355.JUMPDEST.contd ], [ 80, %OP371.JUMPDEST ], [ 1, %OP372.STOP ], [ 80, %OP373.JUMPDEST ], [ 92, %OP373.JUMPDEST.contd ], [ 80, %OP378.PUSH1 ], [ 92, %OP378.PUSH1.contd ], [ %1007, %OP380.REVERT ], [ 16, %OP380.REVERT.contd ], [ 80, %OP381.JUMPDEST ], [ 92, %OP381.JUMPDEST.contd ], [ 80, %OP385.JUMPDEST ], [ %1018, %OP385.JUMPDEST.contd ], [ %1021, %OP387.MLOAD ], [ %1045, %OP395.MSTORE ], [ %1059, %OP402.MLOAD ], [ %1075, %OP407.RETURN ], [ 2, %OP407.RETURN.contd ], [ 80, %OP408.JUMPDEST ], [ 92, %OP408.JUMPDEST.contd ], [ 80, %OP413.PUSH1 ], [ 92, %OP413.PUSH1.contd ], [ %1096, %OP415.REVERT ], [ 16, %OP415.REVERT.contd ], [ 80, %OP416.JUMPDEST ], [ 92, %OP416.JUMPDEST.contd ], [ 80, %OP434.JUMPDEST ], [ %1137, %OP434.JUMPDEST.contd ], [ %1140, %OP436.MLOAD ], [ %1152, %OP440.MSTORE ], [ %1166, %OP447.MLOAD ], [ %1182, %OP452.RETURN ], [ 2, %OP452.RETURN.contd ], [ 80, %OP453.JUMPDEST ], [ 92, %OP453.JUMPDEST.contd ], [ 80, %OP458.PUSH1 ], [ 92, %OP458.PUSH1.contd ], [ %1203, %OP460.REVERT ], [ 16, %OP460.REVERT.contd ], [ 80, %OP461.JUMPDEST ], [ 92, %OP461.JUMPDEST.contd ], [ 80, %OP465.JUMPDEST ], [ %1214, %OP465.JUMPDEST.contd ], [ %1217, %OP467.MLOAD ], [ %1244, %OP476.MSTORE ], [ %1253, %OP480.MLOAD ], [ %1261, %OP482.MSTORE ], [ %1275, %OP488.MLOAD ], [ 80, %OP497.JUMPDEST ], [ %1300, %OP497.JUMPDEST.contd ], [ 80, %OP504.DUP1 ], [ %1323, %OP504.DUP1.contd ], [ %1334, %OP507.MLOAD ], [ %1349, %OP511.MSTORE ], [ 80, %OP519.JUMPDEST ], [ 91, %OP519.JUMPDEST.contd ], [ 80, %OP536.DUP1 ], [ %1403, %OP536.DUP1.contd ], [ %1416, %OP540.MLOAD ], [ %1431, %OP546.EXP ], [ %1451, %OP551.MSTORE ], [ 80, %OP556.JUMPDEST ], [ 91, %OP556.JUMPDEST.contd ], [ %1473, %OP563.MLOAD ], [ %1489, %OP568.RETURN ], [ 2, %OP568.RETURN.contd ], [ 80, %OP569.JUMPDEST ], [ 92, %OP569.JUMPDEST.contd ], [ 80, %OP574.PUSH1 ], [ 92, %OP574.PUSH1.contd ], [ %1510, %OP576.REVERT ], [ 16, %OP576.REVERT.contd ], [ 80, %OP577.JUMPDEST ], [ 92, %OP577.JUMPDEST.contd ], [ 80, %OP603.JUMPDEST ], [ %1570, %OP603.JUMPDEST.contd ], [ %1573, %OP605.MLOAD ], [ %1601, %OP613.MSTORE ], [ %1615, %OP620.MLOAD ], [ %1631, %OP625.RETURN ], [ 2, %OP625.RETURN.contd ], [ 80, %OP626.JUMPDEST ], [ 92, %OP626.JUMPDEST.contd ], [ 80, %OP630.JUMPDEST ], [ 1, %OP631.STOP ], [ 80, %OP632.JUMPDEST ], [ 92, %OP632.JUMPDEST.contd ], [ 80, %OP637.PUSH1 ], [ 92, %OP637.PUSH1.contd ], [ %1658, %OP639.REVERT ], [ 16, %OP639.REVERT.contd ], [ 80, %OP640.JUMPDEST ], [ 92, %OP640.JUMPDEST.contd ], [ 80, %OP668.JUMPDEST ], [ %1724, %OP668.JUMPDEST.contd ], [ %1727, %OP670.MLOAD ], [ %1739, %OP674.MSTORE ], [ %1753, %OP681.MLOAD ], [ %1769, %OP686.RETURN ], [ 2, %OP686.RETURN.contd ], [ 80, %OP687.JUMPDEST ], [ 92, %OP687.JUMPDEST.contd ], [ %1797, %OP697.MSTORE ], [ %1812, %OP702.MSTORE ], [ %1823, %OP706.KECCAK256 ], [ %1831, %OP710.SLOAD ], [ %1848, %OP717.SSTORE ], [ 80, %OP718.POP ], [ %1855, %OP718.POP.contd ], [ %1870, %OP725.MLOAD ], [ %1882, %OP729.MSTORE ], [ %1896, %OP736.MLOAD ], [ %1912, %OP741.LOG2 ], [ 80, %OP743.JUMPDEST ], [ 92, %OP743.JUMPDEST.contd ], [ %1923, %OP746.SLOAD ], [ %1997, %OP770.MLOAD ], [ %2013, %OP775.MSTORE ], [ %2030, %OP782.MSTORE ], [ %2043, %OP787.SLOAD ], [ 80, %OP804.DUP1 ], [ %2098, %OP804.DUP1.contd ], [ 80, %OP809.PUSH2 ], [ %2116, %OP809.PUSH2.contd ], [ %2123, %OP812.SLOAD ], [ %2142, %OP816.MSTORE ], [ 80, %OP823.JUMPDEST ], [ %2159, %OP823.JUMPDEST.contd ], [ %2175, %OP829.MSTORE ], [ %2181, %OP832.KECCAK256 ], [ 80, %OP834.JUMPDEST ], [ %2190, %OP834.JUMPDEST.contd ], [ %2194, %OP836.SLOAD ], [ %2201, %OP838.MSTORE ], [ 80, %OP850.DUP3 ], [ %2237, %OP850.DUP3.contd ], [ 80, %OP858.JUMPDEST ], [ 91, %OP858.JUMPDEST.contd ], [ 80, %OP866.JUMPDEST ], [ %2279, %OP866.JUMPDEST.contd ], [ %2305, %OP877.MSTORE ], [ %2320, %OP882.MSTORE ], [ %2331, %OP886.KECCAK256 ], [ %2353, %OP894.MSTORE ], [ %2368, %OP899.MSTORE ], [ %2379, %OP903.KECCAK256 ], [ %2387, %OP906.SSTORE ], [ 80, %OP907.POP ], [ %2394, %OP907.POP.contd ], [ %2418, %OP917.MLOAD ], [ %2430, %OP921.MSTORE ], [ %2444, %OP928.MLOAD ], [ %2460, %OP933.LOG3 ], [ 80, %OP942.JUMPDEST ], [ %2479, %OP942.JUMPDEST.contd ], [ %2491, %OP947.BALANCE ], [ 80, %OP952.JUMPDEST ], [ %2505, %OP952.JUMPDEST.contd ], [ %2530, %OP963.MSTORE ], [ %2545, %OP968.MSTORE ], [ %2556, %OP972.KECCAK256 ], [ %2559, %OP973.SLOAD ], [ 80, %OP980.PUSH1 ], [ 92, %OP980.PUSH1.contd ], [ %2590, %OP982.REVERT ], [ 16, %OP982.REVERT.contd ], [ 80, %OP983.JUMPDEST ], [ %2597, %OP983.JUMPDEST.contd ], [ 80, %OP996.POP ], [ %2639, %OP996.POP.contd ], [ %2663, %OP1006.MSTORE ], [ %2678, %OP1011.MSTORE ], [ %2689, %OP1015.KECCAK256 ], [ %2712, %OP1023.MSTORE ], [ %2727, %OP1028.MSTORE ], [ %2738, %OP1032.KECCAK256 ], [ %2741, %OP1033.SLOAD ], [ 80, %OP1036.JUMPDEST ], [ %2758, %OP1036.JUMPDEST.contd ], [ 80, %OP1040.DUP2 ], [ %2771, %OP1040.DUP2.contd ], [ %2795, %OP1049.MSTORE ], [ %2810, %OP1054.MSTORE ], [ %2821, %OP1058.KECCAK256 ], [ %2844, %OP1066.MSTORE ], [ %2859, %OP1071.MSTORE ], [ %2870, %OP1075.KECCAK256 ], [ %2873, %OP1076.SLOAD ], [ 80, %OP1083.PUSH1 ], [ 92, %OP1083.PUSH1.contd ], [ %2904, %OP1085.REVERT ], [ 16, %OP1085.REVERT.contd ], [ 80, %OP1086.JUMPDEST ], [ %2911, %OP1086.JUMPDEST.contd ], [ %2935, %OP1096.MSTORE ], [ %2950, %OP1101.MSTORE ], [ %2961, %OP1105.KECCAK256 ], [ %2984, %OP1113.MSTORE ], [ %2999, %OP1118.MSTORE ], [ %3010, %OP1122.KECCAK256 ], [ %3018, %OP1126.SLOAD ], [ %3035, %OP1133.SSTORE ], [ 80, %OP1134.POP ], [ 91, %OP1134.POP.contd ], [ 80, %OP1135.JUMPDEST ], [ %3046, %OP1135.JUMPDEST.contd ], [ %3070, %OP1145.MSTORE ], [ %3085, %OP1150.MSTORE ], [ %3096, %OP1154.KECCAK256 ], [ %3104, %OP1158.SLOAD ], [ %3121, %OP1165.SSTORE ], [ 80, %OP1166.POP ], [ %3128, %OP1166.POP.contd ], [ %3153, %OP1176.MSTORE ], [ %3168, %OP1181.MSTORE ], [ %3179, %OP1185.KECCAK256 ], [ %3187, %OP1189.SLOAD ], [ %3204, %OP1196.SSTORE ], [ 80, %OP1197.POP ], [ %3211, %OP1197.POP.contd ], [ %3234, %OP1207.MLOAD ], [ %3246, %OP1211.MSTORE ], [ %3260, %OP1218.MLOAD ], [ %3276, %OP1223.LOG3 ], [ 80, %OP1233.JUMPDEST ], [ %3296, %OP1233.JUMPDEST.contd ], [ %3321, %OP1243.MSTORE ], [ %3336, %OP1248.MSTORE ], [ %3347, %OP1252.KECCAK256 ], [ %3350, %OP1253.SLOAD ], [ 80, %OP1260.PUSH1 ], [ 92, %OP1260.PUSH1.contd ], [ %3381, %OP1262.REVERT ], [ 16, %OP1262.REVERT.contd ], [ 80, %OP1263.JUMPDEST ], [ %3388, %OP1263.JUMPDEST.contd ], [ %3413, %OP1273.MSTORE ], [ %3428, %OP1278.MSTORE ], [ %3439, %OP1282.KECCAK256 ], [ %3447, %OP1286.SLOAD ], [ %3464, %OP1293.SSTORE ], [ 80, %OP1294.POP ], [ %3471, %OP1294.POP.contd ], [ %3502, %OP1306.MLOAD ], [ %3508, %OP1309.MLOAD ], [ %3530, %OP1317.CALL ], [ 80, %OP1318.SWAP4 ], [ 91, %OP1318.SWAP4.contd ], [ 80, %OP1327.PUSH1 ], [ 92, %OP1327.PUSH1.contd ], [ %3560, %OP1329.REVERT ], [ 16, %OP1329.REVERT.contd ], [ 80, %OP1330.JUMPDEST ], [ %3567, %OP1330.JUMPDEST.contd ], [ %3582, %OP1337.MLOAD ], [ %3594, %OP1341.MSTORE ], [ %3608, %OP1348.MLOAD ], [ %3624, %OP1353.LOG2 ], [ 80, %OP1356.JUMPDEST ], [ %3634, %OP1356.JUMPDEST.contd ], [ %3640, %OP1360.SLOAD ], [ %3647, %OP1363.EXP ], [ 80, %OP1370.JUMPDEST ], [ %3673, %OP1370.JUMPDEST.contd ], [ %3679, %OP1373.MSTORE ], [ %3687, %OP1376.MSTORE ], [ %3693, %OP1379.KECCAK256 ], [ %3703, %OP1385.SLOAD ], [ 80, %OP1388.JUMPDEST ], [ 92, %OP1388.JUMPDEST.contd ], [ %3716, %OP1391.SLOAD ], [ %3790, %OP1415.MLOAD ], [ %3806, %OP1420.MSTORE ], [ %3823, %OP1427.MSTORE ], [ %3836, %OP1432.SLOAD ], [ 80, %OP1449.DUP1 ], [ %3891, %OP1449.DUP1.contd ], [ 80, %OP1454.PUSH2 ], [ %3909, %OP1454.PUSH2.contd ], [ %3916, %OP1457.SLOAD ], [ %3935, %OP1461.MSTORE ], [ 80, %OP1468.JUMPDEST ], [ %3952, %OP1468.JUMPDEST.contd ], [ %3968, %OP1474.MSTORE ], [ %3974, %OP1477.KECCAK256 ], [ 80, %OP1479.JUMPDEST ], [ %3983, %OP1479.JUMPDEST.contd ], [ %3987, %OP1481.SLOAD ], [ %3994, %OP1483.MSTORE ], [ 80, %OP1495.DUP3 ], [ %4030, %OP1495.DUP3.contd ], [ 80, %OP1503.JUMPDEST ], [ 91, %OP1503.JUMPDEST.contd ], [ 80, %OP1511.JUMPDEST ], [ %4072, %OP1511.JUMPDEST.contd ], [ 80, %OP1519.JUMPDEST ], [ 91, %OP1519.JUMPDEST.contd ], [ 80, %OP1527.JUMPDEST ], [ %4101, %OP1527.JUMPDEST.contd ], [ %4107, %OP1530.MSTORE ], [ %4115, %OP1533.MSTORE ], [ %4121, %OP1536.KECCAK256 ], [ %4127, %OP1538.MSTORE ], [ %4135, %OP1541.MSTORE ], [ %4141, %OP1544.KECCAK256 ], [ %4152, %OP1551.SLOAD ], [ 1, %OP1554.STOP ], [ 89, %dynamic_jump_table ], [ 32, %suspend ]
  %stack_len5541 = load i64, ptr %len.addr, align 8
  store i64 %stack_len5541, ptr %arg.stack_len.addr, align 8
  ret i8 %4160
}

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define private i8 @__revmc_ir_builtin_mstore(i256 noundef %0, i256 noundef %1, ptr noalias nocapture noundef nonnull %2) #1 {
entry:
  %ecx.memory.addr = getelementptr inbounds i8, ptr %2, i64 40
  %ecx.memory = load ptr, ptr %ecx.memory.addr, align 8
  %ecx.memory.len.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 16
  %ecx.memory.len = load i64, ptr %ecx.memory.len.addr, align 8
  %ecx.memory.last_checkpoint.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 48
  %ecx.memory.last_checkpoint = load i64, ptr %ecx.memory.last_checkpoint.addr, align 8
  %3 = sub i64 %ecx.memory.len, %ecx.memory.last_checkpoint
  %4 = icmp ugt i256 %0, 18446744073709551615
  %5 = trunc i256 %0 to i64
  %6 = add i64 %5, 32
  %7 = icmp ult i64 %6, 32
  %8 = or i1 %4, %7
  %9 = select i1 %8, i64 -1, i64 %6
  %10 = icmp ugt i64 %9, %3
  br i1 %10, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %11 = call i8 @__revmc_builtin_resize_memory(ptr %2, i64 %9)
  %12 = icmp ne i8 %11, 0
  br i1 %12, label %OP2.MSTORE.return, label %OP2.MSTORE.contd, !prof !2

OP2.MSTORE.contd:                                 ; preds = %resize
  br label %contd

OP2.MSTORE.return:                                ; preds = %resize
  ret i8 %11

contd:                                            ; preds = %OP2.MSTORE.contd, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %13 = call i256 @llvm.bswap.i256(i256 %1)
  store i256 %13, ptr %slot, align 1
  ret i8 0
}

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_resize_memory(ptr noalias nocapture noundef align 8 dereferenceable(88), i64 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.bswap.i256(i256) #3

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define private i256 @__revmc_ir_builtin_calldataload(i256 noundef %0, ptr noundef %1) #1 {
entry:
  %contract.input.ptr.addr = getelementptr inbounds i8, ptr %1, i64 72
  %contract.input.ptr = load ptr, ptr %contract.input.ptr.addr, align 8
  %contract.input.len.addr = getelementptr inbounds i8, ptr %1, i64 80
  %contract.input.len = load i64, ptr %contract.input.len.addr, align 8
  %2 = zext i64 %contract.input.len to i256
  %3 = icmp ult i256 %0, %2
  br i1 %3, label %then, label %else

then:                                             ; preds = %entry
  %4 = trunc i256 %0 to i64
  %calldata.addr = getelementptr inbounds i8, ptr %contract.input.ptr, i64 %4
  %5 = sub i64 %contract.input.len, %4
  %6 = call i64 @llvm.umin.i64(i64 %5, i64 32)
  %calldata.addr1 = alloca i256, align 16
  store i256 0, ptr %calldata.addr1, align 16
  call void @llvm.memcpy.p0.p0.i64(ptr %calldata.addr1, ptr %calldata.addr, i64 %6, i1 false)
  %calldata.i256 = load i256, ptr %calldata.addr1, align 16
  %7 = call i256 @llvm.bswap.i256(i256 %calldata.i256)
  br label %contd

else:                                             ; preds = %entry
  br label %contd

contd:                                            ; preds = %else, %then
  %8 = phi i256 [ %7, %then ], [ 0, %else ]
  ret i256 %8
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_do_return(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) #2

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define private i8 @__revmc_ir_builtin_mload(i256 noundef %0, ptr noalias nocapture noundef nonnull writeonly %1, ptr noalias nocapture noundef nonnull %2) #1 {
entry:
  %ecx.memory.addr = getelementptr inbounds i8, ptr %2, i64 40
  %ecx.memory = load ptr, ptr %ecx.memory.addr, align 8
  %ecx.memory.len.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 16
  %ecx.memory.len = load i64, ptr %ecx.memory.len.addr, align 8
  %ecx.memory.last_checkpoint.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 48
  %ecx.memory.last_checkpoint = load i64, ptr %ecx.memory.last_checkpoint.addr, align 8
  %3 = sub i64 %ecx.memory.len, %ecx.memory.last_checkpoint
  %4 = icmp ugt i256 %0, 18446744073709551615
  %5 = trunc i256 %0 to i64
  %6 = add i64 %5, 32
  %7 = icmp ult i64 %6, 32
  %8 = or i1 %4, %7
  %9 = select i1 %8, i64 -1, i64 %6
  %10 = icmp ugt i64 %9, %3
  br i1 %10, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %11 = call i8 @__revmc_builtin_resize_memory(ptr %2, i64 %9)
  %12 = icmp ne i8 %11, 0
  br i1 %12, label %OP90.MLOAD.return, label %OP90.MLOAD.contd, !prof !2

OP90.MLOAD.contd:                                 ; preds = %resize
  br label %contd

OP90.MLOAD.return:                                ; preds = %resize
  ret i8 %11

contd:                                            ; preds = %OP90.MLOAD.contd, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %slot.value = load i256, ptr %slot, align 1
  %13 = call i256 @llvm.bswap.i256(i256 %slot.value)
  store i256 %13, ptr %1, align 16
  ret i8 0
}

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_exp(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(64), i8 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i160 @llvm.bswap.i160(i160) #3

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_keccak256(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(64)) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sload(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32), i8 noundef) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sstore(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_log(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8, i8 noundef) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_balance(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32), i8 noundef) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_call(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8, i8 noundef, i8 noundef) #2

attributes #0 = { norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="apple-m1" }
attributes #1 = { norecurse nosync nounwind speculatable willreturn "target-cpu"="apple-m1" }
attributes #2 = { nofree norecurse nosync nounwind speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"check StackOverflow"}
!5 = !{!"normal exit"}
!6 = !{!"skipped"}
!7 = !{!"return Stop"}
!8 = !{!"return Revert"}
!9 = !{!"check StackUnderflow"}
!10 = !{!"return Return"}
!11 = !{!"branch_weights", i32 1, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000}
!12 = !{!"return CallOrCreate"}

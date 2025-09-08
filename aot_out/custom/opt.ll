; ModuleID = 'custom'
source_filename = "evm"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin23.5.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
define i8 @custom(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture readnone align 16 %arg.env.addr, ptr noalias nocapture noundef readonly align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %ecx.resume_at.addr = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 32
  %ecx.resume_at = load ptr, ptr %ecx.resume_at.addr, align 8
  %0 = icmp eq ptr %ecx.resume_at, null
  br i1 %0, label %no_resume, label %resume

resume:                                           ; preds = %entry
  %stack_len5539 = load i64, ptr %arg.stack_len.addr, align 8
  br label %OP1318.SWAP4

no_resume:                                        ; preds = %entry
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %1 = add i64 %gas.remaining, -30
  %2 = icmp ult i64 %gas.remaining, 30
  store i64 %1, ptr %gas.remaining.addr, align 8
  br i1 %2, label %return, label %OP0.PUSH1.contd1, !prof !2, !annotation !3

OP0.PUSH1.contd1:                                 ; preds = %no_resume
  store i256 96, ptr %arg.stack.addr, align 16
  %sp3 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 1
  store i256 64, ptr %sp3, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !4)
  %ecx.memory.addr.i = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i = load ptr, ptr %ecx.memory.addr.i, align 8, !alias.scope !4
  %ecx.memory.len.addr.i = getelementptr inbounds i8, ptr %ecx.memory.i, i64 16
  %ecx.memory.len.i = load i64, ptr %ecx.memory.len.addr.i, align 8, !noalias !4
  %ecx.memory.last_checkpoint.addr.i = getelementptr inbounds i8, ptr %ecx.memory.i, i64 48
  %ecx.memory.last_checkpoint.i = load i64, ptr %ecx.memory.last_checkpoint.addr.i, align 8, !noalias !4
  %3 = sub i64 %ecx.memory.len.i, %ecx.memory.last_checkpoint.i
  %4 = icmp ult i64 %3, 96
  br i1 %4, label %resize.i, label %OP3.PUSH1, !prof !2

resize.i:                                         ; preds = %OP0.PUSH1.contd1
  %5 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96)
  %.not.i = icmp eq i8 %5, 0
  br i1 %.not.i, label %OP3.PUSH1, label %return, !prof !7

OP3.PUSH1:                                        ; preds = %OP0.PUSH1.contd1, %resize.i
  %ecx.memory.buffer.ptr.shared.addr.i = getelementptr inbounds i8, ptr %ecx.memory.i, i64 8
  %ecx.memory.buffer.ptr.shared.i = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i, align 8, !noalias !4
  %ecx.memory.buffer.ptr.i = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i, i64 %ecx.memory.last_checkpoint.i
  %slot.i = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i, i64 64
  store i256 43422033463993573283839119378257965444976244249615211514796594002967423614976, ptr %slot.i, align 1, !noalias !4
  %contract.input.len.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %contract.input.len = load i64, ptr %contract.input.len.addr, align 8
  %6 = zext i64 %contract.input.len to i256
  store i256 %6, ptr %sp3, align 16
  %7 = icmp ult i64 %contract.input.len, 4
  %8 = zext i1 %7 to i256
  store i256 %8, ptr %arg.stack.addr, align 16
  %gas.remaining231.pre = load i64, ptr %gas.remaining.addr, align 8
  br i1 %7, label %OP70.JUMPDEST, label %OP8.PUSH1

OP8.PUSH1:                                        ; preds = %OP3.PUSH1
  %9 = add i64 %gas.remaining231.pre, -45
  %10 = icmp ult i64 %gas.remaining231.pre, 45
  store i64 %9, ptr %gas.remaining.addr, align 8
  br i1 %10, label %return, label %OP8.PUSH1.contd22, !prof !2, !annotation !3

OP8.PUSH1.contd22:                                ; preds = %OP8.PUSH1
  store i256 0, ptr %arg.stack.addr, align 16
  %11 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7428 = load ptr, ptr %11, align 8
  %12 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 0, ptr %arg.contract.addr.val7428, i64 %contract.input.len)
  %13 = lshr i256 %12, 224
  store i256 %13, ptr %arg.stack.addr, align 16
  %sp51 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 2
  store i256 117300739, ptr %sp51, align 16
  %14 = icmp eq i256 %13, 117300739
  %15 = zext i1 %14 to i256
  store i256 %15, ptr %sp3, align 16
  br i1 %14, label %OP76.JUMPDEST.thread, label %OP20.DUP1

OP20.DUP1:                                        ; preds = %OP8.PUSH1.contd22
  %16 = add i64 %gas.remaining231.pre, -67
  %17 = icmp ult i64 %9, 22
  store i64 %16, ptr %gas.remaining.addr, align 8
  br i1 %17, label %return, label %OP20.DUP1.contd63, !prof !2, !annotation !3

OP20.DUP1.contd63:                                ; preds = %OP20.DUP1
  store i256 157198259, ptr %sp51, align 16
  %18 = icmp eq i256 %13, 157198259
  %19 = zext i1 %18 to i256
  store i256 %19, ptr %sp3, align 16
  br i1 %18, label %OP192.JUMPDEST.thread, label %OP25.DUP1

OP25.DUP1:                                        ; preds = %OP20.DUP1.contd63
  %20 = add i64 %gas.remaining231.pre, -89
  %21 = icmp ult i64 %16, 22
  store i64 %20, ptr %gas.remaining.addr, align 8
  br i1 %21, label %return, label %OP25.DUP1.contd80, !prof !2, !annotation !3

OP25.DUP1.contd80:                                ; preds = %OP25.DUP1
  store i256 404098525, ptr %sp51, align 16
  %22 = icmp eq i256 %13, 404098525
  %23 = zext i1 %22 to i256
  store i256 %23, ptr %sp3, align 16
  br i1 %22, label %OP249.JUMPDEST.thread, label %OP30.DUP1

OP30.DUP1:                                        ; preds = %OP25.DUP1.contd80
  %24 = add i64 %gas.remaining231.pre, -111
  %25 = icmp ult i64 %20, 22
  store i64 %24, ptr %gas.remaining.addr, align 8
  br i1 %25, label %return, label %OP30.DUP1.contd97, !prof !2, !annotation !3

OP30.DUP1.contd97:                                ; preds = %OP30.DUP1
  store i256 599290589, ptr %sp51, align 16
  %26 = icmp eq i256 %13, 599290589
  %27 = zext i1 %26 to i256
  store i256 %27, ptr %sp3, align 16
  br i1 %26, label %OP280.JUMPDEST.thread, label %OP35.DUP1

OP35.DUP1:                                        ; preds = %OP30.DUP1.contd97
  %28 = add i64 %gas.remaining231.pre, -133
  %29 = icmp ult i64 %24, 22
  store i64 %28, ptr %gas.remaining.addr, align 8
  br i1 %29, label %return, label %OP35.DUP1.contd114, !prof !2, !annotation !3

OP35.DUP1.contd114:                               ; preds = %OP35.DUP1
  store i256 773487949, ptr %sp51, align 16
  %30 = icmp eq i256 %13, 773487949
  %31 = zext i1 %30 to i256
  store i256 %31, ptr %sp3, align 16
  br i1 %30, label %OP347.JUMPDEST.thread, label %OP40.DUP1

OP40.DUP1:                                        ; preds = %OP35.DUP1.contd114
  %32 = add i64 %gas.remaining231.pre, -155
  %33 = icmp ult i64 %28, 22
  store i64 %32, ptr %gas.remaining.addr, align 8
  br i1 %33, label %return, label %OP40.DUP1.contd131, !prof !2, !annotation !3

OP40.DUP1.contd131:                               ; preds = %OP40.DUP1
  store i256 826074471, ptr %sp51, align 16
  %34 = icmp eq i256 %13, 826074471
  %35 = zext i1 %34 to i256
  store i256 %35, ptr %sp3, align 16
  br i1 %34, label %OP373.JUMPDEST.thread, label %OP45.DUP1

OP45.DUP1:                                        ; preds = %OP40.DUP1.contd131
  %36 = add i64 %gas.remaining231.pre, -177
  %37 = icmp ult i64 %32, 22
  store i64 %36, ptr %gas.remaining.addr, align 8
  br i1 %37, label %return, label %OP45.DUP1.contd148, !prof !2, !annotation !3

OP45.DUP1.contd148:                               ; preds = %OP45.DUP1
  store i256 1889567281, ptr %sp51, align 16
  %38 = icmp eq i256 %13, 1889567281
  %39 = zext i1 %38 to i256
  store i256 %39, ptr %sp3, align 16
  br i1 %38, label %OP408.JUMPDEST.thread, label %OP50.DUP1

OP50.DUP1:                                        ; preds = %OP45.DUP1.contd148
  %40 = add i64 %gas.remaining231.pre, -199
  %41 = icmp ult i64 %36, 22
  store i64 %40, ptr %gas.remaining.addr, align 8
  br i1 %41, label %return, label %OP50.DUP1.contd165, !prof !2, !annotation !3

OP50.DUP1.contd165:                               ; preds = %OP50.DUP1
  store i256 2514000705, ptr %sp51, align 16
  %42 = icmp eq i256 %13, 2514000705
  %43 = zext i1 %42 to i256
  store i256 %43, ptr %sp3, align 16
  br i1 %42, label %OP453.JUMPDEST.thread, label %OP55.DUP1

OP55.DUP1:                                        ; preds = %OP50.DUP1.contd165
  %44 = add i64 %gas.remaining231.pre, -221
  %45 = icmp ult i64 %40, 22
  store i64 %44, ptr %gas.remaining.addr, align 8
  br i1 %45, label %return, label %OP55.DUP1.contd182, !prof !2, !annotation !3

OP55.DUP1.contd182:                               ; preds = %OP55.DUP1
  store i256 2835717307, ptr %sp51, align 16
  %46 = icmp eq i256 %13, 2835717307
  %47 = zext i1 %46 to i256
  store i256 %47, ptr %sp3, align 16
  br i1 %46, label %OP569.JUMPDEST.thread, label %OP60.DUP1

OP60.DUP1:                                        ; preds = %OP55.DUP1.contd182
  %48 = add i64 %gas.remaining231.pre, -243
  %49 = icmp ult i64 %44, 22
  store i64 %48, ptr %gas.remaining.addr, align 8
  br i1 %49, label %return, label %OP60.DUP1.contd199, !prof !2, !annotation !3

OP60.DUP1.contd199:                               ; preds = %OP60.DUP1
  store i256 3504541104, ptr %sp51, align 16
  %50 = icmp eq i256 %13, 3504541104
  %51 = zext i1 %50 to i256
  store i256 %51, ptr %sp3, align 16
  br i1 %50, label %OP626.JUMPDEST.thread, label %OP65.DUP1

OP65.DUP1:                                        ; preds = %OP60.DUP1.contd199
  %52 = add i64 %gas.remaining231.pre, -265
  %53 = icmp ult i64 %48, 22
  store i64 %52, ptr %gas.remaining.addr, align 8
  br i1 %53, label %return, label %OP65.DUP1.contd216, !prof !2, !annotation !3

OP65.DUP1.contd216:                               ; preds = %OP65.DUP1
  store i256 3714247998, ptr %sp51, align 16
  %54 = icmp eq i256 %13, 3714247998
  %55 = zext i1 %54 to i256
  store i256 %55, ptr %sp3, align 16
  br i1 %54, label %OP632.JUMPDEST.thread, label %OP70.JUMPDEST

OP70.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP65.DUP1.contd216, %OP3.PUSH1
  %gas.remaining231 = phi i64 [ %gas.remaining231.pre, %OP3.PUSH1 ], [ %52, %OP65.DUP1.contd216 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.0 = phi i64 [ 0, %OP3.PUSH1 ], [ 1, %OP65.DUP1.contd216 ], [ %len.addr.51, %dynamic_jump_table ]
  %56 = add i64 %gas.remaining231, -15
  %57 = icmp ult i64 %gas.remaining231, 15
  store i64 %56, ptr %gas.remaining.addr, align 8
  br i1 %57, label %return, label %OP70.JUMPDEST.contd, !prof !2, !annotation !3

OP70.JUMPDEST.contd:                              ; preds = %OP70.JUMPDEST
  %58 = icmp ugt i64 %len.addr.0, 1022
  br i1 %58, label %return, label %OP687.JUMPDEST.sink.split, !prof !2, !annotation !8

OP74.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %59 = add i64 %gas.remaining237, -1
  %60 = icmp eq i64 %gas.remaining237, 0
  store i64 %59, ptr %gas.remaining.addr, align 8
  %spec.select = select i1 %60, i8 80, i8 1, !prof !2
  br label %return, !annotation !3

OP76.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %61 = add i64 %gas.remaining237, -19
  %62 = icmp ult i64 %gas.remaining237, 19
  store i64 %61, ptr %gas.remaining.addr, align 8
  br i1 %62, label %return, label %OP76.JUMPDEST.contd, !prof !2, !annotation !3

OP76.JUMPDEST.thread:                             ; preds = %OP8.PUSH1.contd22
  %63 = add i64 %gas.remaining231.pre, -64
  %64 = icmp ult i64 %9, 19
  store i64 %63, ptr %gas.remaining.addr, align 8
  br i1 %64, label %return, label %OP77.CALLVALUE, !prof !2, !annotation !3

OP76.JUMPDEST.contd:                              ; preds = %OP76.JUMPDEST
  %65 = icmp ugt i64 %len.addr.51, 1022
  br i1 %65, label %return, label %OP77.CALLVALUE, !prof !9, !annotation !8

OP77.CALLVALUE:                                   ; preds = %OP76.JUMPDEST.thread, %OP76.JUMPDEST.contd
  %len.addr.184958497 = phi i64 [ %len.addr.51, %OP76.JUMPDEST.contd ], [ 1, %OP76.JUMPDEST.thread ]
  %66 = phi i64 [ %61, %OP76.JUMPDEST.contd ], [ %63, %OP76.JUMPDEST.thread ]
  %contract.call_value.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value = load i256, ptr %contract.call_value.addr, align 16
  %sp244 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.184958497
  %67 = icmp eq i256 %contract.call_value, 0
  %68 = zext i1 %67 to i256
  store i256 %68, ptr %sp244, align 16
  br i1 %67, label %OP84.JUMPDEST, label %OP81.PUSH1

OP81.PUSH1:                                       ; preds = %OP77.CALLVALUE
  %69 = add i64 %66, -6
  %70 = icmp ult i64 %66, 6
  store i64 %69, ptr %gas.remaining.addr, align 8
  br i1 %70, label %return, label %OP81.PUSH1.contd254, !prof !2, !annotation !3

OP81.PUSH1.contd254:                              ; preds = %OP81.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp244, i8 0, i64 64, i1 false)
  %71 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp244, i8 16)
  %.not7395 = icmp eq i8 %71, 0
  %spec.select5542 = select i1 %.not7395, i8 16, i8 %71, !prof !7
  br label %return

OP84.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP77.CALLVALUE
  %gas.remaining262 = phi i64 [ %66, %OP77.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.2 = phi i64 [ %len.addr.184958497, %OP77.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %72 = add i64 %gas.remaining262, -15
  %73 = icmp ult i64 %gas.remaining262, 15
  store i64 %72, ptr %gas.remaining.addr, align 8
  br i1 %73, label %return, label %OP84.JUMPDEST.contd, !prof !2, !annotation !3

OP84.JUMPDEST.contd:                              ; preds = %OP84.JUMPDEST
  %74 = icmp ugt i64 %len.addr.2, 1022
  br i1 %74, label %return, label %OP85.PUSH2, !prof !2, !annotation !8

OP85.PUSH2:                                       ; preds = %OP84.JUMPDEST.contd
  %75 = add nuw nsw i64 %len.addr.2, 1
  %sp266 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.2
  store i256 204, ptr %sp266, align 16
  br label %OP743.JUMPDEST

OP88.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %76 = add i64 %gas.remaining237, -93
  %77 = icmp ult i64 %gas.remaining237, 93
  store i64 %76, ptr %gas.remaining.addr, align 8
  br i1 %77, label %return, label %OP88.JUMPDEST.contd, !prof !2, !annotation !3

OP88.JUMPDEST.contd:                              ; preds = %OP88.JUMPDEST
  %78 = icmp eq i64 %len.addr.51, 0
  %79 = add i64 %len.addr.51, -1016
  %80 = icmp ult i64 %79, -1015
  %81 = select i1 %78, i8 91, i8 92
  br i1 %80, label %return, label %OP89.PUSH1, !prof !2

OP89.PUSH1:                                       ; preds = %OP88.JUMPDEST.contd
  %82 = add nuw nsw i64 %len.addr.51, 1
  %sp272 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp272, align 16
  %mload.out.slot = alloca i256, align 16
  %83 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot, ptr %arg.ecx.addr)
  %.not7383 = icmp eq i8 %83, 0
  br i1 %.not7383, label %OP90.MLOAD.contd, label %return, !prof !7

OP90.MLOAD.contd:                                 ; preds = %OP89.PUSH1
  %mload.out = load i256, ptr %mload.out.slot, align 16
  store i256 %mload.out, ptr %sp272, align 16
  %sp280 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %82
  store i256 %mload.out, ptr %sp280, align 16
  %84 = add nuw nsw i64 %len.addr.51, 3
  %sp284 = getelementptr i256, ptr %sp272, i64 2
  %sp286 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %84
  %85 = add i256 %mload.out, 32
  store i256 %85, ptr %sp284, align 16
  %86 = add nuw nsw i64 %len.addr.51, 5
  %sp298 = getelementptr i256, ptr %sp272, i64 4
  store i256 32, ptr %sp286, align 16
  store i256 %mload.out, ptr %sp298, align 16
  %87 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out, i256 32, ptr %arg.ecx.addr)
  %.not7384 = icmp eq i8 %87, 0
  br i1 %.not7384, label %OP100.DUP4, label %return, !prof !7

OP100.DUP4:                                       ; preds = %OP90.MLOAD.contd
  %sp315 = getelementptr i256, ptr %sp272, i64 -1
  %dup4 = load i256, ptr %sp315, align 16
  store i256 %dup4, ptr %sp286, align 16
  %dup2319 = load i256, ptr %sp284, align 16
  store i256 %dup2319, ptr %sp298, align 16
  %88 = add nuw nsw i64 %len.addr.51, 6
  %sp324 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %86
  store i256 %dup4, ptr %sp324, align 16
  %mload.out.slot328 = alloca i256, align 16
  %89 = call fastcc i8 @__revmc_ir_builtin_mload(i256 %dup4, ptr %mload.out.slot328, ptr %arg.ecx.addr)
  %.not7385 = icmp eq i8 %89, 0
  br i1 %.not7385, label %OP103.MLOAD.contd, label %return, !prof !7

OP103.MLOAD.contd:                                ; preds = %OP100.DUP4
  %mload.out329 = load i256, ptr %mload.out.slot328, align 16
  store i256 %mload.out329, ptr %sp324, align 16
  %dup2333 = load i256, ptr %sp298, align 16
  %sp334 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %88
  store i256 %dup2333, ptr %sp334, align 16
  %90 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %dup2333, i256 %mload.out329, ptr %arg.ecx.addr)
  %.not7386 = icmp eq i8 %90, 0
  br i1 %.not7386, label %OP106.PUSH1, label %return, !prof !7

OP106.PUSH1:                                      ; preds = %OP103.MLOAD.contd
  store i256 32, ptr %sp324, align 16
  %b346 = load i256, ptr %sp298, align 16
  %91 = add i256 %b346, 32
  store i256 %91, ptr %sp284, align 16
  %dup1356 = load i256, ptr %sp286, align 16
  store i256 %dup1356, ptr %sp298, align 16
  %mload.out.slot361 = alloca i256, align 16
  %92 = call fastcc i8 @__revmc_ir_builtin_mload(i256 %dup1356, ptr %mload.out.slot361, ptr %arg.ecx.addr)
  %.not7387 = icmp eq i8 %92, 0
  br i1 %.not7387, label %OP111.MLOAD.contd, label %return, !prof !7

OP111.MLOAD.contd:                                ; preds = %OP106.PUSH1
  %mload.out362 = load i256, ptr %mload.out.slot361, align 16
  %swap.b368 = load i256, ptr %sp286, align 16
  %93 = add i256 %swap.b368, 32
  store i256 %93, ptr %sp286, align 16
  store i256 %mload.out362, ptr %sp298, align 16
  store i256 %mload.out362, ptr %sp324, align 16
  %dup4388 = load i256, ptr %sp284, align 16
  store i256 %dup4388, ptr %sp334, align 16
  %sp393 = getelementptr i256, ptr %sp272, i64 7
  store i256 %93, ptr %sp393, align 16
  %94 = add nuw nsw i64 %len.addr.51, 9
  %sp395 = getelementptr i256, ptr %sp272, i64 8
  store i256 0, ptr %sp395, align 16
  %gas.remaining3968821.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP120.JUMPDEST.preheader, !annotation !10

OP120.JUMPDEST.preheader:                         ; preds = %dynamic_jump_table, %OP111.MLOAD.contd
  %gas.remaining3968821 = phi i64 [ %gas.remaining3968821.pre, %OP111.MLOAD.contd ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.3.ph = phi i64 [ %94, %OP111.MLOAD.contd ], [ %len.addr.51, %dynamic_jump_table ]
  %len.addr.3.ph.fr = freeze i64 %len.addr.3.ph
  %95 = add i64 %gas.remaining3968821, -26
  %96 = icmp ult i64 %gas.remaining3968821, 26
  store i64 %95, ptr %gas.remaining.addr, align 8
  br i1 %96, label %return, label %OP120.JUMPDEST.contd.lr.ph, !prof !11, !annotation !3

OP120.JUMPDEST.contd.lr.ph:                       ; preds = %OP120.JUMPDEST.preheader
  %97 = add i64 %len.addr.3.ph.fr, -1023
  %98 = icmp ult i64 %97, -1019
  %99 = add nuw nsw i64 %len.addr.3.ph.fr, 1
  %100 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.3.ph.fr
  %sp400 = getelementptr i256, ptr %100, i64 -4
  %sp404 = getelementptr i256, ptr %100, i64 -1
  %sp406 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %99
  %sp427 = getelementptr i256, ptr %100, i64 -2
  %ecx.memory.addr.i7430 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %sp447 = getelementptr i256, ptr %100, i64 -3
  %sp448 = getelementptr i256, ptr %100, i64 2
  br i1 %98, label %return.loopexit8688.split.loop.exit8805, label %OP120.JUMPDEST.contd.lr.ph.split, !prof !2

OP120.JUMPDEST.contd.lr.ph.split:                 ; preds = %OP120.JUMPDEST.contd.lr.ph
  %101 = add nsw i64 %len.addr.3.ph.fr, -1022
  %102 = icmp ult i64 %101, -1019
  br i1 %102, label %OP120.JUMPDEST.contd.us, label %OP120.JUMPDEST.contd.preheader, !prof !2

OP120.JUMPDEST.contd.preheader:                   ; preds = %OP120.JUMPDEST.contd.lr.ph.split
  %dup2405.pre = load i256, ptr %sp404, align 16
  br label %OP120.JUMPDEST.contd

OP120.JUMPDEST.contd.us:                          ; preds = %OP120.JUMPDEST.contd.lr.ph.split
  %dup4401.us = load i256, ptr %sp400, align 16
  %dup2405.us = load i256, ptr %sp404, align 16
  store i256 %dup2405.us, ptr %sp406, align 16
  %103 = icmp uge i256 %dup2405.us, %dup4401.us
  %104 = zext i1 %103 to i256
  store i256 %104, ptr %100, align 16
  br i1 %103, label %OP142.JUMPDEST, label %OP127.DUP1.us

OP127.DUP1.us:                                    ; preds = %OP120.JUMPDEST.contd.us
  %105 = add i64 %gas.remaining3968821, -75
  %106 = icmp ult i64 %95, 49
  store i64 %105, ptr %gas.remaining.addr, align 8
  %spec.select9138 = select i1 %106, i8 80, i8 92, !prof !2
  br label %return, !annotation !3

OP120.JUMPDEST.contd:                             ; preds = %OP120.JUMPDEST.contd.preheader, %OP135.PUSH1
  %dup2405 = phi i256 [ %133, %OP135.PUSH1 ], [ %dup2405.pre, %OP120.JUMPDEST.contd.preheader ]
  %107 = phi i64 [ %134, %OP135.PUSH1 ], [ %95, %OP120.JUMPDEST.contd.preheader ]
  %gas.remaining3968822 = phi i64 [ %gas.remaining396, %OP135.PUSH1 ], [ %gas.remaining3968821, %OP120.JUMPDEST.contd.preheader ]
  %dup4401 = load i256, ptr %sp400, align 16
  store i256 %dup2405, ptr %sp406, align 16
  %108 = icmp uge i256 %dup2405, %dup4401
  %109 = zext i1 %108 to i256
  store i256 %109, ptr %100, align 16
  br i1 %108, label %OP142.JUMPDEST, label %OP127.DUP1

OP127.DUP1:                                       ; preds = %OP120.JUMPDEST.contd
  %110 = add i64 %gas.remaining3968822, -75
  %111 = icmp ult i64 %107, 49
  store i64 %110, ptr %gas.remaining.addr, align 8
  br i1 %111, label %return, label %OP127.DUP1.contd, !prof !2, !annotation !3

OP127.DUP1.contd:                                 ; preds = %OP127.DUP1
  %dup3428 = load i256, ptr %sp427, align 16
  store i256 %dup3428, ptr %sp406, align 16
  %112 = add i256 %dup3428, %dup2405
  store i256 %112, ptr %100, align 16
  %ecx.memory.i7431 = load ptr, ptr %ecx.memory.addr.i7430, align 8
  %ecx.memory.len.addr.i7432 = getelementptr inbounds i8, ptr %ecx.memory.i7431, i64 16
  %ecx.memory.len.i7433 = load i64, ptr %ecx.memory.len.addr.i7432, align 8, !noalias !12
  %ecx.memory.last_checkpoint.addr.i7434 = getelementptr inbounds i8, ptr %ecx.memory.i7431, i64 48
  %ecx.memory.last_checkpoint.i7435 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7434, align 8, !noalias !12
  %113 = sub i64 %ecx.memory.len.i7433, %ecx.memory.last_checkpoint.i7435
  %114 = icmp ugt i256 %112, 18446744073709551615
  %115 = trunc i256 %112 to i64
  %116 = add i64 %115, 32
  %117 = icmp ugt i64 %115, -33
  %118 = or i1 %114, %117
  %119 = select i1 %118, i64 -1, i64 %116
  %120 = icmp ugt i64 %119, %113
  br i1 %120, label %resize.i7442, label %OP130.MLOAD.contd, !prof !2

resize.i7442:                                     ; preds = %OP127.DUP1.contd
  %121 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %119), !noalias !16
  %.not.i7443 = icmp eq i8 %121, 0
  br i1 %.not.i7443, label %resize.i7442.OP130.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7442.OP130.MLOAD.contd_crit_edge:         ; preds = %resize.i7442
  %dup2444.pre = load i256, ptr %sp404, align 16
  %ecx.memory.i7445.pre = load ptr, ptr %ecx.memory.addr.i7430, align 8, !alias.scope !17
  br label %OP130.MLOAD.contd

OP130.MLOAD.contd:                                ; preds = %resize.i7442.OP130.MLOAD.contd_crit_edge, %OP127.DUP1.contd
  %ecx.memory.i7445 = phi ptr [ %ecx.memory.i7445.pre, %resize.i7442.OP130.MLOAD.contd_crit_edge ], [ %ecx.memory.i7431, %OP127.DUP1.contd ]
  %dup2444 = phi i256 [ %dup2444.pre, %resize.i7442.OP130.MLOAD.contd_crit_edge ], [ %dup2405, %OP127.DUP1.contd ]
  %ecx.memory.buffer.ptr.shared.addr.i7437 = getelementptr inbounds i8, ptr %ecx.memory.i7431, i64 8
  %ecx.memory.buffer.ptr.shared.i7438 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7437, align 8, !noalias !12
  %ecx.memory.buffer.ptr.i7439 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7438, i64 %ecx.memory.last_checkpoint.i7435
  %slot.i7440 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7439, i64 %115
  %slot.value.i = load i256, ptr %slot.i7440, align 1, !noalias !12
  %122 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i)
  store i256 %122, ptr %100, align 16
  %dup5 = load i256, ptr %sp447, align 16
  store i256 %dup5, ptr %sp448, align 16
  %123 = add i256 %dup5, %dup2444
  store i256 %123, ptr %sp406, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %ecx.memory.len.addr.i7446 = getelementptr inbounds i8, ptr %ecx.memory.i7445, i64 16
  %ecx.memory.len.i7447 = load i64, ptr %ecx.memory.len.addr.i7446, align 8, !noalias !17
  %ecx.memory.last_checkpoint.addr.i7448 = getelementptr inbounds i8, ptr %ecx.memory.i7445, i64 48
  %ecx.memory.last_checkpoint.i7449 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7448, align 8, !noalias !17
  %124 = sub i64 %ecx.memory.len.i7447, %ecx.memory.last_checkpoint.i7449
  %125 = icmp ugt i256 %123, 18446744073709551615
  %126 = trunc i256 %123 to i64
  %127 = add i64 %126, 32
  %128 = icmp ugt i64 %126, -33
  %129 = or i1 %125, %128
  %130 = select i1 %129, i64 -1, i64 %127
  %131 = icmp ugt i64 %130, %124
  br i1 %131, label %resize.i7456, label %OP135.PUSH1, !prof !2

resize.i7456:                                     ; preds = %OP130.MLOAD.contd
  %132 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %130)
  %.not.i7457 = icmp eq i8 %132, 0
  br i1 %.not.i7457, label %OP135.PUSH1, label %return, !prof !7

OP135.PUSH1:                                      ; preds = %OP130.MLOAD.contd, %resize.i7456
  %ecx.memory.buffer.ptr.shared.addr.i7451 = getelementptr inbounds i8, ptr %ecx.memory.i7445, i64 8
  %ecx.memory.buffer.ptr.shared.i7452 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7451, align 8, !noalias !17
  %ecx.memory.buffer.ptr.i7453 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7452, i64 %ecx.memory.last_checkpoint.i7449
  %slot.i7454 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7453, i64 %126
  store i256 %slot.value.i, ptr %slot.i7454, align 1, !noalias !17
  %dup2464 = load i256, ptr %sp404, align 16
  store i256 %dup2464, ptr %sp406, align 16
  %133 = add i256 %dup2464, 32
  store i256 %133, ptr %sp404, align 16
  store i256 %dup2464, ptr %100, align 16
  %gas.remaining396 = load i64, ptr %gas.remaining.addr, align 8
  %134 = add i64 %gas.remaining396, -26
  %135 = icmp ult i64 %gas.remaining396, 26
  store i64 %134, ptr %gas.remaining.addr, align 8
  br i1 %135, label %return, label %OP120.JUMPDEST.contd, !prof !20, !annotation !3

OP142.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP120.JUMPDEST.contd, %OP120.JUMPDEST.contd.us
  %gas.remaining479 = phi i64 [ %95, %OP120.JUMPDEST.contd.us ], [ %107, %OP120.JUMPDEST.contd ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.4 = phi i64 [ 1022, %OP120.JUMPDEST.contd.us ], [ %len.addr.3.ph.fr, %OP120.JUMPDEST.contd ], [ %len.addr.51, %dynamic_jump_table ]
  %136 = add i64 %gas.remaining479, -51
  %137 = icmp ult i64 %gas.remaining479, 51
  store i64 %136, ptr %gas.remaining.addr, align 8
  br i1 %137, label %return, label %OP142.JUMPDEST.contd, !prof !2, !annotation !3

OP142.JUMPDEST.contd:                             ; preds = %OP142.JUMPDEST
  %138 = icmp ult i64 %len.addr.4, 7
  br i1 %138, label %return, label %OP143.POP, !prof !2, !annotation !21

OP143.POP:                                        ; preds = %OP142.JUMPDEST.contd
  %139 = add i64 %len.addr.4, -1
  %140 = add i64 %len.addr.4, -3
  %141 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.4
  %sp487 = getelementptr i256, ptr %141, i64 -5
  %swap.a488 = load i256, ptr %sp487, align 16
  %sp489 = getelementptr i256, ptr %141, i64 -6
  %142 = add i64 %len.addr.4, -5
  %sp495 = getelementptr i256, ptr %141, i64 -7
  %swap.b496 = load i256, ptr %sp495, align 16
  %sp500 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %142
  %143 = add i256 %swap.b496, %swap.a488
  store i256 %143, ptr %sp495, align 16
  %144 = and i256 %swap.a488, 31
  store i256 %144, ptr %sp489, align 16
  %145 = icmp eq i256 %144, 0
  %146 = zext i1 %145 to i256
  store i256 %146, ptr %sp500, align 16
  br i1 %145, label %OP179.JUMPDEST, label %OP159.DUP1

OP159.DUP1:                                       ; preds = %OP143.POP
  %147 = add i64 %gas.remaining479, -117
  %148 = icmp ult i64 %136, 66
  store i64 %147, ptr %gas.remaining.addr, align 8
  br i1 %148, label %return, label %OP159.DUP1.contd, !prof !2, !annotation !3

OP159.DUP1.contd:                                 ; preds = %OP159.DUP1
  %149 = add i64 %len.addr.4, -1025
  %150 = icmp ult i64 %149, -1018
  br i1 %150, label %return, label %OP159.DUP1.contd533, !prof !2

OP159.DUP1.contd533:                              ; preds = %OP159.DUP1.contd
  %sp540 = getelementptr i256, ptr %141, i64 -4
  %151 = sub i256 %143, %144
  store i256 %151, ptr %sp487, align 16
  store i256 %151, ptr %sp540, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !22)
  %ecx.memory.addr.i7459 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7460 = load ptr, ptr %ecx.memory.addr.i7459, align 8, !alias.scope !22, !noalias !25
  %ecx.memory.len.addr.i7461 = getelementptr inbounds i8, ptr %ecx.memory.i7460, i64 16
  %ecx.memory.len.i7462 = load i64, ptr %ecx.memory.len.addr.i7461, align 8, !noalias !27
  %ecx.memory.last_checkpoint.addr.i7463 = getelementptr inbounds i8, ptr %ecx.memory.i7460, i64 48
  %ecx.memory.last_checkpoint.i7464 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7463, align 8, !noalias !27
  %152 = sub i64 %ecx.memory.len.i7462, %ecx.memory.last_checkpoint.i7464
  %153 = icmp ugt i256 %151, 18446744073709551615
  %154 = trunc i256 %151 to i64
  %155 = add i64 %154, 32
  %156 = icmp ugt i64 %154, -33
  %157 = or i1 %153, %156
  %158 = select i1 %157, i64 -1, i64 %155
  %159 = icmp ugt i64 %158, %152
  br i1 %159, label %resize.i7472, label %OP163.MLOAD.contd, !prof !2

resize.i7472:                                     ; preds = %OP159.DUP1.contd533
  %160 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %158), !noalias !25
  %.not.i7473 = icmp eq i8 %160, 0
  br i1 %.not.i7473, label %resize.i7472.OP163.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7472.OP163.MLOAD.contd_crit_edge:         ; preds = %resize.i7472
  %dup4561.pre = load i256, ptr %sp489, align 16
  br label %OP163.MLOAD.contd

OP163.MLOAD.contd:                                ; preds = %resize.i7472.OP163.MLOAD.contd_crit_edge, %OP159.DUP1.contd533
  %dup4561 = phi i256 [ %dup4561.pre, %resize.i7472.OP163.MLOAD.contd_crit_edge ], [ %144, %OP159.DUP1.contd533 ]
  %ecx.memory.buffer.ptr.shared.addr.i7466 = getelementptr inbounds i8, ptr %ecx.memory.i7460, i64 8
  %ecx.memory.buffer.ptr.shared.i7467 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7466, align 8, !noalias !27
  %ecx.memory.buffer.ptr.i7468 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7467, i64 %ecx.memory.last_checkpoint.i7464
  %slot.i7469 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7468, i64 %154
  %slot.value.i7470 = load i256, ptr %slot.i7469, align 1, !noalias !27
  %161 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7470)
  store i256 %161, ptr %sp540, align 16
  %sp558 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %140
  store i256 1, ptr %sp558, align 16
  %sp562 = getelementptr i256, ptr %141, i64 -2
  %sp564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %139
  %162 = sub i256 32, %dup4561
  store i256 %162, ptr %sp562, align 16
  store i256 256, ptr %sp564, align 16
  %163 = tail call i8 @__revmc_builtin_exp(ptr nonnull %arg.ecx.addr, ptr nonnull %sp562, i8 19)
  %.not7391 = icmp eq i8 %163, 0
  br i1 %.not7391, label %OP170.SUB, label %return, !prof !7

OP170.SUB:                                        ; preds = %OP163.MLOAD.contd
  %a577 = load i256, ptr %sp562, align 16
  %sp578 = getelementptr i256, ptr %141, i64 -3
  %b579 = load i256, ptr %sp578, align 16
  %164 = xor i256 %a577, -1
  %165 = add i256 %b579, %164
  %166 = add nsw i64 %len.addr.4, -4
  %sp588 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %166
  %b589 = load i256, ptr %sp588, align 16
  %167 = and i256 %b589, %165
  store i256 %167, ptr %sp588, align 16
  %dup2593 = load i256, ptr %sp487, align 16
  store i256 %dup2593, ptr %sp558, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !28)
  %ecx.memory.i7476 = load ptr, ptr %ecx.memory.addr.i7459, align 8, !alias.scope !28
  %ecx.memory.len.addr.i7477 = getelementptr inbounds i8, ptr %ecx.memory.i7476, i64 16
  %ecx.memory.len.i7478 = load i64, ptr %ecx.memory.len.addr.i7477, align 8, !noalias !28
  %ecx.memory.last_checkpoint.addr.i7479 = getelementptr inbounds i8, ptr %ecx.memory.i7476, i64 48
  %ecx.memory.last_checkpoint.i7480 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7479, align 8, !noalias !28
  %168 = sub i64 %ecx.memory.len.i7478, %ecx.memory.last_checkpoint.i7480
  %169 = icmp ugt i256 %dup2593, 18446744073709551615
  %170 = trunc i256 %dup2593 to i64
  %171 = add i64 %170, 32
  %172 = icmp ugt i64 %170, -33
  %173 = or i1 %169, %172
  %174 = select i1 %173, i64 -1, i64 %171
  %175 = icmp ugt i64 %174, %168
  br i1 %175, label %resize.i7487, label %OP175.PUSH1, !prof !2

resize.i7487:                                     ; preds = %OP170.SUB
  %176 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %174)
  %.not.i7488 = icmp eq i8 %176, 0
  br i1 %.not.i7488, label %OP175.PUSH1, label %return, !prof !7

OP175.PUSH1:                                      ; preds = %OP170.SUB, %resize.i7487
  %ecx.memory.buffer.ptr.shared.addr.i7482 = getelementptr inbounds i8, ptr %ecx.memory.i7476, i64 8
  %ecx.memory.buffer.ptr.shared.i7483 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7482, align 8, !noalias !28
  %ecx.memory.buffer.ptr.i7484 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7483, i64 %ecx.memory.last_checkpoint.i7480
  %slot.i7485 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7484, i64 %170
  %177 = tail call i256 @llvm.bswap.i256(i256 %167)
  store i256 %177, ptr %slot.i7485, align 1, !noalias !28
  store i256 32, ptr %sp588, align 16
  %b606 = load i256, ptr %sp487, align 16
  %178 = add i256 %b606, 32
  %swap.b612 = load i256, ptr %sp495, align 16
  store i256 %178, ptr %sp495, align 16
  store i256 %swap.b612, ptr %sp487, align 16
  %gas.remaining614.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP179.JUMPDEST, !annotation !10

OP179.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP175.PUSH1, %OP143.POP
  %gas.remaining614 = phi i64 [ %136, %OP143.POP ], [ %gas.remaining614.pre, %OP175.PUSH1 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.5 = phi i64 [ %142, %OP143.POP ], [ %142, %OP175.PUSH1 ], [ %len.addr.51, %dynamic_jump_table ]
  %179 = add i64 %gas.remaining614, -30
  %180 = icmp ult i64 %gas.remaining614, 30
  store i64 %179, ptr %gas.remaining.addr, align 8
  br i1 %180, label %return, label %OP179.JUMPDEST.contd, !prof !2, !annotation !3

OP179.JUMPDEST.contd:                             ; preds = %OP179.JUMPDEST
  %181 = icmp ult i64 %len.addr.5, 5
  br i1 %181, label %return, label %OP180.POP, !prof !2, !annotation !21

OP180.POP:                                        ; preds = %OP179.JUMPDEST.contd
  %182 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.5
  %sp619 = getelementptr i256, ptr %182, i64 -2
  %swap.a620 = load i256, ptr %sp619, align 16
  %sp621 = getelementptr i256, ptr %182, i64 -5
  %swap.b622 = load i256, ptr %sp621, align 16
  store i256 %swap.a620, ptr %sp621, align 16
  store i256 %swap.b622, ptr %sp619, align 16
  %sp627 = getelementptr i256, ptr %182, i64 -4
  store i256 64, ptr %sp627, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !31)
  %ecx.memory.addr.i7490 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7491 = load ptr, ptr %ecx.memory.addr.i7490, align 8, !alias.scope !31, !noalias !34
  %ecx.memory.len.addr.i7492 = getelementptr inbounds i8, ptr %ecx.memory.i7491, i64 16
  %ecx.memory.len.i7493 = load i64, ptr %ecx.memory.len.addr.i7492, align 8, !noalias !36
  %ecx.memory.last_checkpoint.addr.i7494 = getelementptr inbounds i8, ptr %ecx.memory.i7491, i64 48
  %ecx.memory.last_checkpoint.i7495 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7494, align 8, !noalias !36
  %183 = sub i64 %ecx.memory.len.i7493, %ecx.memory.last_checkpoint.i7495
  %184 = icmp ult i64 %183, 96
  br i1 %184, label %resize.i7503, label %OP186.MLOAD.contd, !prof !2

resize.i7503:                                     ; preds = %OP180.POP
  %185 = add i64 %len.addr.5, -3
  %186 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !34
  %.not.i7504 = icmp eq i8 %186, 0
  br i1 %.not.i7504, label %resize.i7503.OP186.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7503.OP186.MLOAD.contd_crit_edge:         ; preds = %resize.i7503
  %swap.b642.pre = load i256, ptr %sp621, align 16
  br label %OP186.MLOAD.contd

OP186.MLOAD.contd:                                ; preds = %resize.i7503.OP186.MLOAD.contd_crit_edge, %OP180.POP
  %swap.b642 = phi i256 [ %swap.b642.pre, %resize.i7503.OP186.MLOAD.contd_crit_edge ], [ %swap.a620, %OP180.POP ]
  %ecx.memory.buffer.ptr.shared.addr.i7497 = getelementptr inbounds i8, ptr %ecx.memory.i7491, i64 8
  %ecx.memory.buffer.ptr.shared.i7498 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7497, align 8, !noalias !36
  %ecx.memory.buffer.ptr.i7499 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7498, i64 %ecx.memory.last_checkpoint.i7495
  %slot.i7500 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7499, i64 64
  %slot.value.i7501 = load i256, ptr %slot.i7500, align 1, !noalias !36
  %187 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7501)
  %sp639 = getelementptr i256, ptr %182, i64 -3
  store i256 %swap.b642, ptr %sp639, align 16
  %188 = sub i256 %swap.b642, %187
  store i256 %188, ptr %sp621, align 16
  store i256 %187, ptr %sp627, align 16
  %189 = add i64 %len.addr.5, -5
  %190 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp621, i8 2)
  %.not7394 = icmp eq i8 %190, 0
  %spec.select5543 = select i1 %.not7394, i8 2, i8 %190, !prof !7
  br label %return

OP192.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %191 = add i64 %gas.remaining237, -19
  %192 = icmp ult i64 %gas.remaining237, 19
  store i64 %191, ptr %gas.remaining.addr, align 8
  br i1 %192, label %return, label %OP192.JUMPDEST.contd, !prof !2, !annotation !3

OP192.JUMPDEST.thread:                            ; preds = %OP20.DUP1.contd63
  %193 = add i64 %gas.remaining231.pre, -86
  %194 = icmp ult i64 %16, 19
  store i64 %193, ptr %gas.remaining.addr, align 8
  br i1 %194, label %return, label %OP193.CALLVALUE, !prof !2, !annotation !3

OP192.JUMPDEST.contd:                             ; preds = %OP192.JUMPDEST
  %195 = icmp ugt i64 %len.addr.51, 1022
  br i1 %195, label %return, label %OP193.CALLVALUE, !prof !37, !annotation !8

OP193.CALLVALUE:                                  ; preds = %OP192.JUMPDEST.thread, %OP192.JUMPDEST.contd
  %len.addr.685108512 = phi i64 [ %len.addr.51, %OP192.JUMPDEST.contd ], [ 1, %OP192.JUMPDEST.thread ]
  %196 = phi i64 [ %191, %OP192.JUMPDEST.contd ], [ %193, %OP192.JUMPDEST.thread ]
  %contract.call_value.addr660 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value661 = load i256, ptr %contract.call_value.addr660, align 16
  %sp662 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.685108512
  %197 = icmp eq i256 %contract.call_value661, 0
  %198 = zext i1 %197 to i256
  store i256 %198, ptr %sp662, align 16
  br i1 %197, label %OP200.JUMPDEST, label %OP197.PUSH1

OP197.PUSH1:                                      ; preds = %OP193.CALLVALUE
  %199 = add i64 %196, -6
  %200 = icmp ult i64 %196, 6
  store i64 %199, ptr %gas.remaining.addr, align 8
  br i1 %200, label %return, label %OP197.PUSH1.contd672, !prof !2, !annotation !3

OP197.PUSH1.contd672:                             ; preds = %OP197.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp662, i8 0, i64 64, i1 false)
  %201 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp662, i8 16)
  %.not7371 = icmp eq i8 %201, 0
  %spec.select5544 = select i1 %.not7371, i8 16, i8 %201, !prof !7
  br label %return

OP200.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP193.CALLVALUE
  %gas.remaining680 = phi i64 [ %196, %OP193.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.7 = phi i64 [ %len.addr.685108512, %OP193.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %202 = add i64 %gas.remaining680, -79
  %203 = icmp ult i64 %gas.remaining680, 79
  store i64 %202, ptr %gas.remaining.addr, align 8
  br i1 %203, label %return, label %OP200.JUMPDEST.contd, !prof !2, !annotation !3

OP200.JUMPDEST.contd:                             ; preds = %OP200.JUMPDEST
  %204 = icmp ugt i64 %len.addr.7, 1018
  br i1 %204, label %return, label %OP201.PUSH2, !prof !2, !annotation !8

OP201.PUSH2:                                      ; preds = %OP200.JUMPDEST.contd
  %sp684 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.7
  store i256 391, ptr %sp684, align 16
  %sp686 = getelementptr i256, ptr %sp684, i64 1
  store i256 4, ptr %sp686, align 16
  %205 = add nuw nsw i64 %len.addr.7, 3
  %sp690 = getelementptr i256, ptr %sp684, i64 2
  store i256 4, ptr %sp690, align 16
  %sp694 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %205
  store i256 4, ptr %sp694, align 16
  %206 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7426 = load ptr, ptr %206, align 8
  %207 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val7427 = load i64, ptr %207, align 8
  %208 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 4, ptr %arg.contract.addr.val7426, i64 %arg.contract.addr.val7427)
  %sp700 = getelementptr i256, ptr %sp684, i64 4
  %209 = and i256 %208, 1461501637330902918203684832716283019655932542975
  store i256 %209, ptr %sp686, align 16
  store i256 4, ptr %sp690, align 16
  store i256 36, ptr %sp694, align 16
  store i256 36, ptr %sp700, align 16
  %210 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 36, ptr %arg.contract.addr.val7426, i64 %arg.contract.addr.val7427)
  %sp749 = getelementptr i256, ptr %sp684, i64 5
  store i256 32, ptr %sp749, align 16
  store i256 %210, ptr %sp690, align 16
  store i256 4, ptr %sp694, align 16
  store i256 68, ptr %sp700, align 16
  br label %OP866.JUMPDEST

OP226.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %211 = add i64 %gas.remaining237, -62
  %212 = icmp ult i64 %gas.remaining237, 62
  store i64 %211, ptr %gas.remaining.addr, align 8
  br i1 %212, label %return, label %OP226.JUMPDEST.contd, !prof !2, !annotation !3

OP226.JUMPDEST.contd:                             ; preds = %OP226.JUMPDEST
  %213 = icmp eq i64 %len.addr.51, 0
  %214 = add i64 %len.addr.51, -1021
  %215 = icmp ult i64 %214, -1020
  %216 = select i1 %213, i8 91, i8 92
  br i1 %215, label %return, label %OP227.PUSH1, !prof !2

OP227.PUSH1:                                      ; preds = %OP226.JUMPDEST.contd
  %217 = add nuw nsw i64 %len.addr.51, 1
  %sp778 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp778, align 16
  %mload.out.slot782 = alloca i256, align 16
  %218 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot782, ptr %arg.ecx.addr)
  %.not7366 = icmp eq i8 %218, 0
  br i1 %.not7366, label %OP228.MLOAD.contd, label %return, !prof !7

OP228.MLOAD.contd:                                ; preds = %OP227.PUSH1
  %mload.out783 = load i256, ptr %mload.out.slot782, align 16
  store i256 %mload.out783, ptr %sp778, align 16
  %219 = add nuw nsw i64 %len.addr.51, 2
  %sp788 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %217
  store i256 %mload.out783, ptr %sp788, align 16
  %sp790 = getelementptr i256, ptr %sp778, i64 -1
  %dup3791 = load i256, ptr %sp790, align 16
  %sp792 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %219
  %.not7367 = icmp ne i256 %dup3791, 0
  %220 = zext i1 %.not7367 to i256
  store i256 %220, ptr %sp792, align 16
  %sp812 = getelementptr i256, ptr %sp778, i64 3
  store i256 %mload.out783, ptr %sp812, align 16
  %221 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out783, i256 %220, ptr %arg.ecx.addr)
  %.not7368 = icmp eq i8 %221, 0
  br i1 %.not7368, label %OP237.PUSH1, label %return, !prof !7

OP237.PUSH1:                                      ; preds = %OP228.MLOAD.contd
  store i256 32, ptr %sp792, align 16
  %b824 = load i256, ptr %sp788, align 16
  %222 = add i256 %b824, 32
  %swap.b830 = load i256, ptr %sp790, align 16
  store i256 %222, ptr %sp790, align 16
  store i256 %swap.b830, ptr %sp788, align 16
  store i256 64, ptr %sp778, align 16
  %mload.out.slot838 = alloca i256, align 16
  %223 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot838, ptr %arg.ecx.addr)
  %.not7369 = icmp eq i8 %223, 0
  br i1 %.not7369, label %OP243.MLOAD.contd, label %return, !prof !7

OP243.MLOAD.contd:                                ; preds = %OP237.PUSH1
  %mload.out839 = load i256, ptr %mload.out.slot838, align 16
  %swap.b849 = load i256, ptr %sp790, align 16
  store i256 %swap.b849, ptr %sp788, align 16
  %224 = sub i256 %swap.b849, %mload.out839
  store i256 %224, ptr %sp790, align 16
  store i256 %mload.out839, ptr %sp778, align 16
  %225 = add nsw i64 %len.addr.51, -1
  %226 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp790, i8 2)
  %.not7370 = icmp eq i8 %226, 0
  %spec.select5545 = select i1 %.not7370, i8 2, i8 %226, !prof !7
  br label %return

OP249.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %227 = add i64 %gas.remaining237, -19
  %228 = icmp ult i64 %gas.remaining237, 19
  store i64 %227, ptr %gas.remaining.addr, align 8
  br i1 %228, label %return, label %OP249.JUMPDEST.contd, !prof !2, !annotation !3

OP249.JUMPDEST.thread:                            ; preds = %OP25.DUP1.contd80
  %229 = add i64 %gas.remaining231.pre, -108
  %230 = icmp ult i64 %20, 19
  store i64 %229, ptr %gas.remaining.addr, align 8
  br i1 %230, label %return, label %OP250.CALLVALUE, !prof !2, !annotation !3

OP249.JUMPDEST.contd:                             ; preds = %OP249.JUMPDEST
  %231 = icmp ugt i64 %len.addr.51, 1022
  br i1 %231, label %return, label %OP250.CALLVALUE, !prof !38, !annotation !8

OP250.CALLVALUE:                                  ; preds = %OP249.JUMPDEST.thread, %OP249.JUMPDEST.contd
  %len.addr.885158517 = phi i64 [ %len.addr.51, %OP249.JUMPDEST.contd ], [ 1, %OP249.JUMPDEST.thread ]
  %232 = phi i64 [ %227, %OP249.JUMPDEST.contd ], [ %229, %OP249.JUMPDEST.thread ]
  %contract.call_value.addr867 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value868 = load i256, ptr %contract.call_value.addr867, align 16
  %sp869 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.885158517
  %233 = icmp eq i256 %contract.call_value868, 0
  %234 = zext i1 %233 to i256
  store i256 %234, ptr %sp869, align 16
  br i1 %233, label %OP257.JUMPDEST, label %OP254.PUSH1

OP254.PUSH1:                                      ; preds = %OP250.CALLVALUE
  %235 = add i64 %232, -6
  %236 = icmp ult i64 %232, 6
  store i64 %235, ptr %gas.remaining.addr, align 8
  br i1 %236, label %return, label %OP254.PUSH1.contd879, !prof !2, !annotation !3

OP254.PUSH1.contd879:                             ; preds = %OP254.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp869, i8 0, i64 64, i1 false)
  %237 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp869, i8 16)
  %.not7364 = icmp eq i8 %237, 0
  %spec.select5546 = select i1 %.not7364, i8 16, i8 %237, !prof !7
  br label %return

OP257.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP250.CALLVALUE
  %gas.remaining887 = phi i64 [ %232, %OP250.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.9 = phi i64 [ %len.addr.885158517, %OP250.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %238 = add i64 %gas.remaining887, -15
  %239 = icmp ult i64 %gas.remaining887, 15
  store i64 %238, ptr %gas.remaining.addr, align 8
  br i1 %239, label %return, label %OP257.JUMPDEST.contd, !prof !2, !annotation !3

OP257.JUMPDEST.contd:                             ; preds = %OP257.JUMPDEST
  %240 = icmp ugt i64 %len.addr.9, 1022
  br i1 %240, label %return, label %OP258.PUSH2, !prof !2, !annotation !8

OP258.PUSH2:                                      ; preds = %OP257.JUMPDEST.contd
  %241 = add nuw nsw i64 %len.addr.9, 1
  %sp891 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.9
  store i256 436, ptr %sp891, align 16
  br label %OP942.JUMPDEST

OP261.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %242 = add i64 %gas.remaining237, -50
  %243 = icmp ult i64 %gas.remaining237, 50
  store i64 %242, ptr %gas.remaining.addr, align 8
  br i1 %243, label %return, label %OP261.JUMPDEST.contd, !prof !2, !annotation !3

OP261.JUMPDEST.contd:                             ; preds = %OP261.JUMPDEST
  %244 = icmp eq i64 %len.addr.51, 0
  %245 = add i64 %len.addr.51, -1021
  %246 = icmp ult i64 %245, -1020
  %247 = select i1 %244, i8 91, i8 92
  br i1 %246, label %return, label %OP262.PUSH1, !prof !2

OP262.PUSH1:                                      ; preds = %OP261.JUMPDEST.contd
  %248 = add nuw nsw i64 %len.addr.51, 1
  %sp897 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp897, align 16
  %mload.out.slot901 = alloca i256, align 16
  %249 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot901, ptr %arg.ecx.addr)
  %.not7360 = icmp eq i8 %249, 0
  br i1 %.not7360, label %OP263.MLOAD.contd, label %return, !prof !7

OP263.MLOAD.contd:                                ; preds = %OP262.PUSH1
  %mload.out902 = load i256, ptr %mload.out.slot901, align 16
  store i256 %mload.out902, ptr %sp897, align 16
  %250 = add nuw nsw i64 %len.addr.51, 2
  %sp907 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %248
  store i256 %mload.out902, ptr %sp907, align 16
  %sp909 = getelementptr i256, ptr %sp897, i64 -1
  %dup3910 = load i256, ptr %sp909, align 16
  %sp911 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %250
  store i256 %dup3910, ptr %sp911, align 16
  %sp915 = getelementptr i256, ptr %sp897, i64 3
  store i256 %mload.out902, ptr %sp915, align 16
  %251 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out902, i256 %dup3910, ptr %arg.ecx.addr)
  %.not7361 = icmp eq i8 %251, 0
  br i1 %.not7361, label %OP268.PUSH1, label %return, !prof !7

OP268.PUSH1:                                      ; preds = %OP263.MLOAD.contd
  store i256 32, ptr %sp911, align 16
  %b927 = load i256, ptr %sp907, align 16
  %252 = add i256 %b927, 32
  %swap.b933 = load i256, ptr %sp909, align 16
  store i256 %252, ptr %sp909, align 16
  store i256 %swap.b933, ptr %sp907, align 16
  store i256 64, ptr %sp897, align 16
  %mload.out.slot941 = alloca i256, align 16
  %253 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot941, ptr %arg.ecx.addr)
  %.not7362 = icmp eq i8 %253, 0
  br i1 %.not7362, label %OP274.MLOAD.contd, label %return, !prof !7

OP274.MLOAD.contd:                                ; preds = %OP268.PUSH1
  %mload.out942 = load i256, ptr %mload.out.slot941, align 16
  %swap.b952 = load i256, ptr %sp909, align 16
  store i256 %swap.b952, ptr %sp907, align 16
  %254 = sub i256 %swap.b952, %mload.out942
  store i256 %254, ptr %sp909, align 16
  store i256 %mload.out942, ptr %sp897, align 16
  %255 = add nsw i64 %len.addr.51, -1
  %256 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp909, i8 2)
  %.not7363 = icmp eq i8 %256, 0
  %spec.select5547 = select i1 %.not7363, i8 2, i8 %256, !prof !7
  br label %return

OP280.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %257 = add i64 %gas.remaining237, -19
  %258 = icmp ult i64 %gas.remaining237, 19
  store i64 %257, ptr %gas.remaining.addr, align 8
  br i1 %258, label %return, label %OP280.JUMPDEST.contd, !prof !2, !annotation !3

OP280.JUMPDEST.thread:                            ; preds = %OP30.DUP1.contd97
  %259 = add i64 %gas.remaining231.pre, -130
  %260 = icmp ult i64 %24, 19
  store i64 %259, ptr %gas.remaining.addr, align 8
  br i1 %260, label %return, label %OP281.CALLVALUE, !prof !2, !annotation !3

OP280.JUMPDEST.contd:                             ; preds = %OP280.JUMPDEST
  %261 = icmp ugt i64 %len.addr.51, 1022
  br i1 %261, label %return, label %OP281.CALLVALUE, !prof !39, !annotation !8

OP281.CALLVALUE:                                  ; preds = %OP280.JUMPDEST.thread, %OP280.JUMPDEST.contd
  %len.addr.1085208522 = phi i64 [ %len.addr.51, %OP280.JUMPDEST.contd ], [ 1, %OP280.JUMPDEST.thread ]
  %262 = phi i64 [ %257, %OP280.JUMPDEST.contd ], [ %259, %OP280.JUMPDEST.thread ]
  %contract.call_value.addr970 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value971 = load i256, ptr %contract.call_value.addr970, align 16
  %sp972 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.1085208522
  %263 = icmp eq i256 %contract.call_value971, 0
  %264 = zext i1 %263 to i256
  store i256 %264, ptr %sp972, align 16
  br i1 %263, label %OP288.JUMPDEST, label %OP285.PUSH1

OP285.PUSH1:                                      ; preds = %OP281.CALLVALUE
  %265 = add i64 %262, -6
  %266 = icmp ult i64 %262, 6
  store i64 %265, ptr %gas.remaining.addr, align 8
  br i1 %266, label %return, label %OP285.PUSH1.contd982, !prof !2, !annotation !3

OP285.PUSH1.contd982:                             ; preds = %OP285.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp972, i8 0, i64 64, i1 false)
  %267 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp972, i8 16)
  %.not7315 = icmp eq i8 %267, 0
  %spec.select5548 = select i1 %.not7315, i8 16, i8 %267, !prof !7
  br label %return

OP288.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP281.CALLVALUE
  %gas.remaining990 = phi i64 [ %262, %OP281.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.11 = phi i64 [ %len.addr.1085208522, %OP281.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %268 = add i64 %gas.remaining990, -109
  %269 = icmp ult i64 %gas.remaining990, 109
  store i64 %268, ptr %gas.remaining.addr, align 8
  br i1 %269, label %return, label %OP288.JUMPDEST.contd, !prof !2, !annotation !3

OP288.JUMPDEST.contd:                             ; preds = %OP288.JUMPDEST
  %270 = icmp ugt i64 %len.addr.11, 1017
  br i1 %270, label %return, label %OP289.PUSH2, !prof !2, !annotation !8

OP289.PUSH2:                                      ; preds = %OP288.JUMPDEST.contd
  %sp994 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.11
  store i256 553, ptr %sp994, align 16
  %sp996 = getelementptr i256, ptr %sp994, i64 1
  store i256 4, ptr %sp996, align 16
  %sp1000 = getelementptr i256, ptr %sp994, i64 2
  store i256 4, ptr %sp1000, align 16
  %271 = add nuw nsw i64 %len.addr.11, 4
  %sp1004 = getelementptr i256, ptr %sp994, i64 3
  store i256 4, ptr %sp1004, align 16
  %272 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7422 = load ptr, ptr %272, align 8
  %273 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val7423 = load i64, ptr %273, align 8
  %274 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 4, ptr %arg.contract.addr.val7422, i64 %arg.contract.addr.val7423)
  %sp1010 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %271
  %275 = and i256 %274, 1461501637330902918203684832716283019655932542975
  store i256 %275, ptr %sp996, align 16
  store i256 4, ptr %sp1000, align 16
  store i256 36, ptr %sp1004, align 16
  store i256 36, ptr %sp1010, align 16
  %276 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 36, ptr %arg.contract.addr.val7422, i64 %arg.contract.addr.val7423)
  %sp1054 = getelementptr i256, ptr %sp994, i64 5
  %277 = and i256 %276, 1461501637330902918203684832716283019655932542975
  store i256 %277, ptr %sp1000, align 16
  store i256 4, ptr %sp1004, align 16
  store i256 68, ptr %sp1010, align 16
  store i256 68, ptr %sp1054, align 16
  %278 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 68, ptr %arg.contract.addr.val7422, i64 %arg.contract.addr.val7423)
  %sp1103 = getelementptr i256, ptr %sp994, i64 6
  store i256 32, ptr %sp1103, align 16
  store i256 %278, ptr %sp1004, align 16
  store i256 4, ptr %sp1010, align 16
  store i256 100, ptr %sp1054, align 16
  br label %OP952.JUMPDEST

OP324.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %279 = add i64 %gas.remaining237, -62
  %280 = icmp ult i64 %gas.remaining237, 62
  store i64 %279, ptr %gas.remaining.addr, align 8
  br i1 %280, label %return, label %OP324.JUMPDEST.contd, !prof !2, !annotation !3

OP324.JUMPDEST.contd:                             ; preds = %OP324.JUMPDEST
  %281 = icmp eq i64 %len.addr.51, 0
  %282 = add i64 %len.addr.51, -1021
  %283 = icmp ult i64 %282, -1020
  %284 = select i1 %281, i8 91, i8 92
  br i1 %283, label %return, label %OP325.PUSH1, !prof !2

OP325.PUSH1:                                      ; preds = %OP324.JUMPDEST.contd
  %285 = add nuw nsw i64 %len.addr.51, 1
  %sp1132 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp1132, align 16
  %mload.out.slot1136 = alloca i256, align 16
  %286 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1136, ptr %arg.ecx.addr)
  %.not7310 = icmp eq i8 %286, 0
  br i1 %.not7310, label %OP326.MLOAD.contd, label %return, !prof !7

OP326.MLOAD.contd:                                ; preds = %OP325.PUSH1
  %mload.out1137 = load i256, ptr %mload.out.slot1136, align 16
  store i256 %mload.out1137, ptr %sp1132, align 16
  %287 = add nuw nsw i64 %len.addr.51, 2
  %sp1142 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %285
  store i256 %mload.out1137, ptr %sp1142, align 16
  %sp1144 = getelementptr i256, ptr %sp1132, i64 -1
  %dup31145 = load i256, ptr %sp1144, align 16
  %sp1146 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %287
  %.not7311 = icmp ne i256 %dup31145, 0
  %288 = zext i1 %.not7311 to i256
  store i256 %288, ptr %sp1146, align 16
  %sp1166 = getelementptr i256, ptr %sp1132, i64 3
  store i256 %mload.out1137, ptr %sp1166, align 16
  %289 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out1137, i256 %288, ptr %arg.ecx.addr)
  %.not7312 = icmp eq i8 %289, 0
  br i1 %.not7312, label %OP335.PUSH1, label %return, !prof !7

OP335.PUSH1:                                      ; preds = %OP326.MLOAD.contd
  store i256 32, ptr %sp1146, align 16
  %b1178 = load i256, ptr %sp1142, align 16
  %290 = add i256 %b1178, 32
  %swap.b1184 = load i256, ptr %sp1144, align 16
  store i256 %290, ptr %sp1144, align 16
  store i256 %swap.b1184, ptr %sp1142, align 16
  store i256 64, ptr %sp1132, align 16
  %mload.out.slot1192 = alloca i256, align 16
  %291 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1192, ptr %arg.ecx.addr)
  %.not7313 = icmp eq i8 %291, 0
  br i1 %.not7313, label %OP341.MLOAD.contd, label %return, !prof !7

OP341.MLOAD.contd:                                ; preds = %OP335.PUSH1
  %mload.out1193 = load i256, ptr %mload.out.slot1192, align 16
  %swap.b1203 = load i256, ptr %sp1144, align 16
  store i256 %swap.b1203, ptr %sp1142, align 16
  %292 = sub i256 %swap.b1203, %mload.out1193
  store i256 %292, ptr %sp1144, align 16
  store i256 %mload.out1193, ptr %sp1132, align 16
  %293 = add nsw i64 %len.addr.51, -1
  %294 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1144, i8 2)
  %.not7314 = icmp eq i8 %294, 0
  %spec.select5549 = select i1 %.not7314, i8 2, i8 %294, !prof !7
  br label %return

OP347.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %295 = add i64 %gas.remaining237, -19
  %296 = icmp ult i64 %gas.remaining237, 19
  store i64 %295, ptr %gas.remaining.addr, align 8
  br i1 %296, label %return, label %OP347.JUMPDEST.contd, !prof !2, !annotation !3

OP347.JUMPDEST.thread:                            ; preds = %OP35.DUP1.contd114
  %297 = add i64 %gas.remaining231.pre, -152
  %298 = icmp ult i64 %28, 19
  store i64 %297, ptr %gas.remaining.addr, align 8
  br i1 %298, label %return, label %OP348.CALLVALUE, !prof !2, !annotation !3

OP347.JUMPDEST.contd:                             ; preds = %OP347.JUMPDEST
  %299 = icmp ugt i64 %len.addr.51, 1022
  br i1 %299, label %return, label %OP348.CALLVALUE, !prof !40, !annotation !8

OP348.CALLVALUE:                                  ; preds = %OP347.JUMPDEST.thread, %OP347.JUMPDEST.contd
  %len.addr.1285258527 = phi i64 [ %len.addr.51, %OP347.JUMPDEST.contd ], [ 1, %OP347.JUMPDEST.thread ]
  %300 = phi i64 [ %295, %OP347.JUMPDEST.contd ], [ %297, %OP347.JUMPDEST.thread ]
  %contract.call_value.addr1221 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1222 = load i256, ptr %contract.call_value.addr1221, align 16
  %sp1223 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.1285258527
  %301 = icmp eq i256 %contract.call_value1222, 0
  %302 = zext i1 %301 to i256
  store i256 %302, ptr %sp1223, align 16
  br i1 %301, label %OP355.JUMPDEST, label %OP352.PUSH1

OP352.PUSH1:                                      ; preds = %OP348.CALLVALUE
  %303 = add i64 %300, -6
  %304 = icmp ult i64 %300, 6
  store i64 %303, ptr %gas.remaining.addr, align 8
  br i1 %304, label %return, label %OP352.PUSH1.contd1233, !prof !2, !annotation !3

OP352.PUSH1.contd1233:                            ; preds = %OP352.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp1223, i8 0, i64 64, i1 false)
  %305 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1223, i8 16)
  %.not7295 = icmp eq i8 %305, 0
  %spec.select5550 = select i1 %.not7295, i8 16, i8 %305, !prof !7
  br label %return

OP355.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP348.CALLVALUE
  %gas.remaining1241 = phi i64 [ %300, %OP348.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.13 = phi i64 [ %len.addr.1285258527, %OP348.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %306 = add i64 %gas.remaining1241, -49
  %307 = icmp ult i64 %gas.remaining1241, 49
  store i64 %306, ptr %gas.remaining.addr, align 8
  br i1 %307, label %return, label %OP355.JUMPDEST.contd, !prof !2, !annotation !3

OP355.JUMPDEST.contd:                             ; preds = %OP355.JUMPDEST
  %308 = icmp ugt i64 %len.addr.13, 1019
  br i1 %308, label %return, label %OP356.PUSH2, !prof !2, !annotation !8

OP356.PUSH2:                                      ; preds = %OP355.JUMPDEST.contd
  %sp1245 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.13
  store i256 612, ptr %sp1245, align 16
  %309 = add nuw nsw i64 %len.addr.13, 2
  %sp1247 = getelementptr i256, ptr %sp1245, i64 1
  store i256 4, ptr %sp1247, align 16
  %sp1251 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %309
  store i256 4, ptr %sp1251, align 16
  %sp1255 = getelementptr i256, ptr %sp1245, i64 3
  store i256 4, ptr %sp1255, align 16
  %310 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7416 = load ptr, ptr %310, align 8
  %311 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val7417 = load i64, ptr %311, align 8
  %312 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 4, ptr %arg.contract.addr.val7416, i64 %arg.contract.addr.val7417)
  %sp1266 = getelementptr i256, ptr %sp1245, i64 4
  store i256 32, ptr %sp1266, align 16
  store i256 %312, ptr %sp1247, align 16
  store i256 4, ptr %sp1251, align 16
  store i256 36, ptr %sp1255, align 16
  br label %OP1233.JUMPDEST

OP371.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %313 = add i64 %gas.remaining237, -1
  %314 = icmp eq i64 %gas.remaining237, 0
  store i64 %313, ptr %gas.remaining.addr, align 8
  %spec.select5551 = select i1 %314, i8 80, i8 1, !prof !2
  br label %return, !annotation !3

OP373.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %315 = add i64 %gas.remaining237, -19
  %316 = icmp ult i64 %gas.remaining237, 19
  store i64 %315, ptr %gas.remaining.addr, align 8
  br i1 %316, label %return, label %OP373.JUMPDEST.contd, !prof !2, !annotation !3

OP373.JUMPDEST.thread:                            ; preds = %OP40.DUP1.contd131
  %317 = add i64 %gas.remaining231.pre, -174
  %318 = icmp ult i64 %32, 19
  store i64 %317, ptr %gas.remaining.addr, align 8
  br i1 %318, label %return, label %OP374.CALLVALUE, !prof !2, !annotation !3

OP373.JUMPDEST.contd:                             ; preds = %OP373.JUMPDEST
  %319 = icmp ugt i64 %len.addr.51, 1022
  br i1 %319, label %return, label %OP374.CALLVALUE, !prof !41, !annotation !8

OP374.CALLVALUE:                                  ; preds = %OP373.JUMPDEST.thread, %OP373.JUMPDEST.contd
  %len.addr.1485308532 = phi i64 [ %len.addr.51, %OP373.JUMPDEST.contd ], [ 1, %OP373.JUMPDEST.thread ]
  %320 = phi i64 [ %315, %OP373.JUMPDEST.contd ], [ %317, %OP373.JUMPDEST.thread ]
  %contract.call_value.addr1298 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1299 = load i256, ptr %contract.call_value.addr1298, align 16
  %sp1300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.1485308532
  %321 = icmp eq i256 %contract.call_value1299, 0
  %322 = zext i1 %321 to i256
  store i256 %322, ptr %sp1300, align 16
  br i1 %321, label %OP381.JUMPDEST, label %OP378.PUSH1

OP378.PUSH1:                                      ; preds = %OP374.CALLVALUE
  %323 = add i64 %320, -6
  %324 = icmp ult i64 %320, 6
  store i64 %323, ptr %gas.remaining.addr, align 8
  br i1 %324, label %return, label %OP378.PUSH1.contd1310, !prof !2, !annotation !3

OP378.PUSH1.contd1310:                            ; preds = %OP378.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp1300, i8 0, i64 64, i1 false)
  %325 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1300, i8 16)
  %.not7292 = icmp eq i8 %325, 0
  %spec.select5552 = select i1 %.not7292, i8 16, i8 %325, !prof !7
  br label %return

OP381.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP374.CALLVALUE
  %gas.remaining1318 = phi i64 [ %320, %OP374.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.15 = phi i64 [ %len.addr.1485308532, %OP374.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %326 = add i64 %gas.remaining1318, -15
  %327 = icmp ult i64 %gas.remaining1318, 15
  store i64 %326, ptr %gas.remaining.addr, align 8
  br i1 %327, label %return, label %OP381.JUMPDEST.contd, !prof !2, !annotation !3

OP381.JUMPDEST.contd:                             ; preds = %OP381.JUMPDEST
  %328 = icmp ugt i64 %len.addr.15, 1022
  br i1 %328, label %return, label %OP382.PUSH2, !prof !2, !annotation !8

OP382.PUSH2:                                      ; preds = %OP381.JUMPDEST.contd
  %329 = add nuw nsw i64 %len.addr.15, 1
  %sp1322 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.15
  store i256 633, ptr %sp1322, align 16
  br label %OP1356.JUMPDEST

OP385.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %330 = add i64 %gas.remaining237, -62
  %331 = icmp ult i64 %gas.remaining237, 62
  store i64 %330, ptr %gas.remaining.addr, align 8
  br i1 %331, label %return, label %OP385.JUMPDEST.contd, !prof !2, !annotation !3

OP385.JUMPDEST.contd:                             ; preds = %OP385.JUMPDEST
  %332 = icmp eq i64 %len.addr.51, 0
  %333 = add i64 %len.addr.51, -1021
  %334 = icmp ult i64 %333, -1020
  %335 = select i1 %332, i8 91, i8 92
  br i1 %334, label %return, label %OP386.PUSH1, !prof !2

OP386.PUSH1:                                      ; preds = %OP385.JUMPDEST.contd
  %336 = add nuw nsw i64 %len.addr.51, 1
  %sp1328 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp1328, align 16
  %mload.out.slot1332 = alloca i256, align 16
  %337 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1332, ptr %arg.ecx.addr)
  %.not7288 = icmp eq i8 %337, 0
  br i1 %.not7288, label %OP387.MLOAD.contd, label %return, !prof !7

OP387.MLOAD.contd:                                ; preds = %OP386.PUSH1
  %mload.out1333 = load i256, ptr %mload.out.slot1332, align 16
  store i256 %mload.out1333, ptr %sp1328, align 16
  %338 = add nuw nsw i64 %len.addr.51, 2
  %sp1338 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %336
  store i256 %mload.out1333, ptr %sp1338, align 16
  %sp1340 = getelementptr i256, ptr %sp1328, i64 -1
  %dup31341 = load i256, ptr %sp1340, align 16
  %sp1342 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %338
  %sp1344 = getelementptr i256, ptr %sp1328, i64 3
  %339 = and i256 %dup31341, 255
  store i256 %339, ptr %sp1342, align 16
  store i256 %mload.out1333, ptr %sp1344, align 16
  %340 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out1333, i256 %339, ptr %arg.ecx.addr)
  %.not7289 = icmp eq i8 %340, 0
  br i1 %.not7289, label %OP396.PUSH1, label %return, !prof !7

OP396.PUSH1:                                      ; preds = %OP387.MLOAD.contd
  store i256 32, ptr %sp1342, align 16
  %b1374 = load i256, ptr %sp1338, align 16
  %341 = add i256 %b1374, 32
  %swap.b1380 = load i256, ptr %sp1340, align 16
  store i256 %341, ptr %sp1340, align 16
  store i256 %swap.b1380, ptr %sp1338, align 16
  store i256 64, ptr %sp1328, align 16
  %mload.out.slot1388 = alloca i256, align 16
  %342 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1388, ptr %arg.ecx.addr)
  %.not7290 = icmp eq i8 %342, 0
  br i1 %.not7290, label %OP402.MLOAD.contd, label %return, !prof !7

OP402.MLOAD.contd:                                ; preds = %OP396.PUSH1
  %mload.out1389 = load i256, ptr %mload.out.slot1388, align 16
  %swap.b1399 = load i256, ptr %sp1340, align 16
  store i256 %swap.b1399, ptr %sp1338, align 16
  %343 = sub i256 %swap.b1399, %mload.out1389
  store i256 %343, ptr %sp1340, align 16
  store i256 %mload.out1389, ptr %sp1328, align 16
  %344 = add nsw i64 %len.addr.51, -1
  %345 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1340, i8 2)
  %.not7291 = icmp eq i8 %345, 0
  %spec.select5553 = select i1 %.not7291, i8 2, i8 %345, !prof !7
  br label %return

OP408.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %346 = add i64 %gas.remaining237, -19
  %347 = icmp ult i64 %gas.remaining237, 19
  store i64 %346, ptr %gas.remaining.addr, align 8
  br i1 %347, label %return, label %OP408.JUMPDEST.contd, !prof !2, !annotation !3

OP408.JUMPDEST.thread:                            ; preds = %OP45.DUP1.contd148
  %348 = add i64 %gas.remaining231.pre, -196
  %349 = icmp ult i64 %36, 19
  store i64 %348, ptr %gas.remaining.addr, align 8
  br i1 %349, label %return, label %OP409.CALLVALUE, !prof !2, !annotation !3

OP408.JUMPDEST.contd:                             ; preds = %OP408.JUMPDEST
  %350 = icmp ugt i64 %len.addr.51, 1022
  br i1 %350, label %return, label %OP409.CALLVALUE, !prof !42, !annotation !8

OP409.CALLVALUE:                                  ; preds = %OP408.JUMPDEST.thread, %OP408.JUMPDEST.contd
  %len.addr.1685358537 = phi i64 [ %len.addr.51, %OP408.JUMPDEST.contd ], [ 1, %OP408.JUMPDEST.thread ]
  %351 = phi i64 [ %346, %OP408.JUMPDEST.contd ], [ %348, %OP408.JUMPDEST.thread ]
  %contract.call_value.addr1417 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1418 = load i256, ptr %contract.call_value.addr1417, align 16
  %sp1419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.1685358537
  %352 = icmp eq i256 %contract.call_value1418, 0
  %353 = zext i1 %352 to i256
  store i256 %353, ptr %sp1419, align 16
  br i1 %352, label %OP416.JUMPDEST, label %OP413.PUSH1

OP413.PUSH1:                                      ; preds = %OP409.CALLVALUE
  %354 = add i64 %351, -6
  %355 = icmp ult i64 %351, 6
  store i64 %354, ptr %gas.remaining.addr, align 8
  br i1 %355, label %return, label %OP413.PUSH1.contd1429, !prof !2, !annotation !3

OP413.PUSH1.contd1429:                            ; preds = %OP413.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp1419, i8 0, i64 64, i1 false)
  %356 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1419, i8 16)
  %.not7283 = icmp eq i8 %356, 0
  %spec.select5554 = select i1 %.not7283, i8 16, i8 %356, !prof !7
  br label %return

OP416.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP409.CALLVALUE
  %gas.remaining1437 = phi i64 [ %351, %OP409.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.17 = phi i64 [ %len.addr.1685358537, %OP409.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %357 = add i64 %gas.remaining1437, -55
  %358 = icmp ult i64 %gas.remaining1437, 55
  store i64 %357, ptr %gas.remaining.addr, align 8
  br i1 %358, label %return, label %OP416.JUMPDEST.contd, !prof !2, !annotation !3

OP416.JUMPDEST.contd:                             ; preds = %OP416.JUMPDEST
  %359 = icmp ugt i64 %len.addr.17, 1019
  br i1 %359, label %return, label %OP417.PUSH2, !prof !2, !annotation !8

OP417.PUSH2:                                      ; preds = %OP416.JUMPDEST.contd
  %sp1441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.17
  store i256 716, ptr %sp1441, align 16
  %360 = add nuw nsw i64 %len.addr.17, 2
  %sp1443 = getelementptr i256, ptr %sp1441, i64 1
  store i256 4, ptr %sp1443, align 16
  %sp1447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %360
  store i256 4, ptr %sp1447, align 16
  %sp1451 = getelementptr i256, ptr %sp1441, i64 3
  store i256 4, ptr %sp1451, align 16
  %361 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7414 = load ptr, ptr %361, align 8
  %362 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val7415 = load i64, ptr %362, align 8
  %363 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 4, ptr %arg.contract.addr.val7414, i64 %arg.contract.addr.val7415)
  %sp1457 = getelementptr i256, ptr %sp1441, i64 4
  %364 = and i256 %363, 1461501637330902918203684832716283019655932542975
  store i256 32, ptr %sp1457, align 16
  store i256 %364, ptr %sp1443, align 16
  store i256 4, ptr %sp1447, align 16
  store i256 36, ptr %sp1451, align 16
  br label %OP1370.JUMPDEST

OP434.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %365 = add i64 %gas.remaining237, -50
  %366 = icmp ult i64 %gas.remaining237, 50
  store i64 %365, ptr %gas.remaining.addr, align 8
  br i1 %366, label %return, label %OP434.JUMPDEST.contd, !prof !2, !annotation !3

OP434.JUMPDEST.contd:                             ; preds = %OP434.JUMPDEST
  %367 = icmp eq i64 %len.addr.51, 0
  %368 = add i64 %len.addr.51, -1021
  %369 = icmp ult i64 %368, -1020
  %370 = select i1 %367, i8 91, i8 92
  br i1 %369, label %return, label %OP435.PUSH1, !prof !2

OP435.PUSH1:                                      ; preds = %OP434.JUMPDEST.contd
  %371 = add nuw nsw i64 %len.addr.51, 1
  %sp1499 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp1499, align 16
  %mload.out.slot1503 = alloca i256, align 16
  %372 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1503, ptr %arg.ecx.addr)
  %.not7279 = icmp eq i8 %372, 0
  br i1 %.not7279, label %OP436.MLOAD.contd, label %return, !prof !7

OP436.MLOAD.contd:                                ; preds = %OP435.PUSH1
  %mload.out1504 = load i256, ptr %mload.out.slot1503, align 16
  store i256 %mload.out1504, ptr %sp1499, align 16
  %373 = add nuw nsw i64 %len.addr.51, 2
  %sp1509 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %371
  store i256 %mload.out1504, ptr %sp1509, align 16
  %sp1511 = getelementptr i256, ptr %sp1499, i64 -1
  %dup31512 = load i256, ptr %sp1511, align 16
  %sp1513 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %373
  store i256 %dup31512, ptr %sp1513, align 16
  %sp1517 = getelementptr i256, ptr %sp1499, i64 3
  store i256 %mload.out1504, ptr %sp1517, align 16
  %374 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out1504, i256 %dup31512, ptr %arg.ecx.addr)
  %.not7280 = icmp eq i8 %374, 0
  br i1 %.not7280, label %OP441.PUSH1, label %return, !prof !7

OP441.PUSH1:                                      ; preds = %OP436.MLOAD.contd
  store i256 32, ptr %sp1513, align 16
  %b1529 = load i256, ptr %sp1509, align 16
  %375 = add i256 %b1529, 32
  %swap.b1535 = load i256, ptr %sp1511, align 16
  store i256 %375, ptr %sp1511, align 16
  store i256 %swap.b1535, ptr %sp1509, align 16
  store i256 64, ptr %sp1499, align 16
  %mload.out.slot1543 = alloca i256, align 16
  %376 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1543, ptr %arg.ecx.addr)
  %.not7281 = icmp eq i8 %376, 0
  br i1 %.not7281, label %OP447.MLOAD.contd, label %return, !prof !7

OP447.MLOAD.contd:                                ; preds = %OP441.PUSH1
  %mload.out1544 = load i256, ptr %mload.out.slot1543, align 16
  %swap.b1554 = load i256, ptr %sp1511, align 16
  store i256 %swap.b1554, ptr %sp1509, align 16
  %377 = sub i256 %swap.b1554, %mload.out1544
  store i256 %377, ptr %sp1511, align 16
  store i256 %mload.out1544, ptr %sp1499, align 16
  %378 = add nsw i64 %len.addr.51, -1
  %379 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1511, i8 2)
  %.not7282 = icmp eq i8 %379, 0
  %spec.select5555 = select i1 %.not7282, i8 2, i8 %379, !prof !7
  br label %return

OP453.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %380 = add i64 %gas.remaining237, -19
  %381 = icmp ult i64 %gas.remaining237, 19
  store i64 %380, ptr %gas.remaining.addr, align 8
  br i1 %381, label %return, label %OP453.JUMPDEST.contd, !prof !2, !annotation !3

OP453.JUMPDEST.thread:                            ; preds = %OP50.DUP1.contd165
  %382 = add i64 %gas.remaining231.pre, -218
  %383 = icmp ult i64 %40, 19
  store i64 %382, ptr %gas.remaining.addr, align 8
  br i1 %383, label %return, label %OP454.CALLVALUE, !prof !2, !annotation !3

OP453.JUMPDEST.contd:                             ; preds = %OP453.JUMPDEST
  %384 = icmp ugt i64 %len.addr.51, 1022
  br i1 %384, label %return, label %OP454.CALLVALUE, !prof !43, !annotation !8

OP454.CALLVALUE:                                  ; preds = %OP453.JUMPDEST.thread, %OP453.JUMPDEST.contd
  %len.addr.1885408542 = phi i64 [ %len.addr.51, %OP453.JUMPDEST.contd ], [ 1, %OP453.JUMPDEST.thread ]
  %385 = phi i64 [ %380, %OP453.JUMPDEST.contd ], [ %382, %OP453.JUMPDEST.thread ]
  %contract.call_value.addr1572 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1573 = load i256, ptr %contract.call_value.addr1572, align 16
  %sp1574 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.1885408542
  %386 = icmp eq i256 %contract.call_value1573, 0
  %387 = zext i1 %386 to i256
  store i256 %387, ptr %sp1574, align 16
  br i1 %386, label %OP461.JUMPDEST, label %OP458.PUSH1

OP458.PUSH1:                                      ; preds = %OP454.CALLVALUE
  %388 = add i64 %385, -6
  %389 = icmp ult i64 %385, 6
  store i64 %388, ptr %gas.remaining.addr, align 8
  br i1 %389, label %return, label %OP458.PUSH1.contd1584, !prof !2, !annotation !3

OP458.PUSH1.contd1584:                            ; preds = %OP458.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp1574, i8 0, i64 64, i1 false)
  %390 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1574, i8 16)
  %.not7267 = icmp eq i8 %390, 0
  %spec.select5556 = select i1 %.not7267, i8 16, i8 %390, !prof !7
  br label %return

OP461.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP454.CALLVALUE
  %gas.remaining1592 = phi i64 [ %385, %OP454.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.19 = phi i64 [ %len.addr.1885408542, %OP454.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %391 = add i64 %gas.remaining1592, -15
  %392 = icmp ult i64 %gas.remaining1592, 15
  store i64 %391, ptr %gas.remaining.addr, align 8
  br i1 %392, label %return, label %OP461.JUMPDEST.contd, !prof !2, !annotation !3

OP461.JUMPDEST.contd:                             ; preds = %OP461.JUMPDEST
  %393 = icmp ugt i64 %len.addr.19, 1022
  br i1 %393, label %return, label %OP462.PUSH2, !prof !2, !annotation !8

OP462.PUSH2:                                      ; preds = %OP461.JUMPDEST.contd
  %394 = add nuw nsw i64 %len.addr.19, 1
  %sp1596 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.19
  store i256 757, ptr %sp1596, align 16
  br label %OP1388.JUMPDEST

OP465.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %395 = add i64 %gas.remaining237, -93
  %396 = icmp ult i64 %gas.remaining237, 93
  store i64 %395, ptr %gas.remaining.addr, align 8
  br i1 %396, label %return, label %OP465.JUMPDEST.contd, !prof !2, !annotation !3

OP465.JUMPDEST.contd:                             ; preds = %OP465.JUMPDEST
  %397 = icmp eq i64 %len.addr.51, 0
  %398 = add i64 %len.addr.51, -1016
  %399 = icmp ult i64 %398, -1015
  %400 = select i1 %397, i8 91, i8 92
  br i1 %399, label %return, label %OP466.PUSH1, !prof !2

OP466.PUSH1:                                      ; preds = %OP465.JUMPDEST.contd
  %401 = add nuw nsw i64 %len.addr.51, 1
  %sp1602 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp1602, align 16
  %mload.out.slot1606 = alloca i256, align 16
  %402 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot1606, ptr %arg.ecx.addr)
  %.not7255 = icmp eq i8 %402, 0
  br i1 %.not7255, label %OP467.MLOAD.contd, label %return, !prof !7

OP467.MLOAD.contd:                                ; preds = %OP466.PUSH1
  %mload.out1607 = load i256, ptr %mload.out.slot1606, align 16
  store i256 %mload.out1607, ptr %sp1602, align 16
  %sp1612 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %401
  store i256 %mload.out1607, ptr %sp1612, align 16
  %403 = add nuw nsw i64 %len.addr.51, 3
  %sp1616 = getelementptr i256, ptr %sp1602, i64 2
  %sp1618 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %403
  %404 = add i256 %mload.out1607, 32
  store i256 %404, ptr %sp1616, align 16
  %405 = add nuw nsw i64 %len.addr.51, 5
  %sp1632 = getelementptr i256, ptr %sp1602, i64 4
  store i256 32, ptr %sp1618, align 16
  store i256 %mload.out1607, ptr %sp1632, align 16
  %406 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out1607, i256 32, ptr %arg.ecx.addr)
  %.not7256 = icmp eq i8 %406, 0
  br i1 %.not7256, label %OP477.DUP4, label %return, !prof !7

OP477.DUP4:                                       ; preds = %OP467.MLOAD.contd
  %sp1649 = getelementptr i256, ptr %sp1602, i64 -1
  %dup41650 = load i256, ptr %sp1649, align 16
  store i256 %dup41650, ptr %sp1618, align 16
  %dup21654 = load i256, ptr %sp1616, align 16
  store i256 %dup21654, ptr %sp1632, align 16
  %407 = add nuw nsw i64 %len.addr.51, 6
  %sp1659 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %405
  store i256 %dup41650, ptr %sp1659, align 16
  %mload.out.slot1663 = alloca i256, align 16
  %408 = call fastcc i8 @__revmc_ir_builtin_mload(i256 %dup41650, ptr %mload.out.slot1663, ptr %arg.ecx.addr)
  %.not7257 = icmp eq i8 %408, 0
  br i1 %.not7257, label %OP480.MLOAD.contd, label %return, !prof !7

OP480.MLOAD.contd:                                ; preds = %OP477.DUP4
  %mload.out1664 = load i256, ptr %mload.out.slot1663, align 16
  store i256 %mload.out1664, ptr %sp1659, align 16
  %dup21668 = load i256, ptr %sp1632, align 16
  %sp1669 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %407
  store i256 %dup21668, ptr %sp1669, align 16
  %409 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %dup21668, i256 %mload.out1664, ptr %arg.ecx.addr)
  %.not7258 = icmp eq i8 %409, 0
  br i1 %.not7258, label %OP483.PUSH1, label %return, !prof !7

OP483.PUSH1:                                      ; preds = %OP480.MLOAD.contd
  store i256 32, ptr %sp1659, align 16
  %b1681 = load i256, ptr %sp1632, align 16
  %410 = add i256 %b1681, 32
  store i256 %410, ptr %sp1616, align 16
  %dup11691 = load i256, ptr %sp1618, align 16
  store i256 %dup11691, ptr %sp1632, align 16
  %mload.out.slot1696 = alloca i256, align 16
  %411 = call fastcc i8 @__revmc_ir_builtin_mload(i256 %dup11691, ptr %mload.out.slot1696, ptr %arg.ecx.addr)
  %.not7259 = icmp eq i8 %411, 0
  br i1 %.not7259, label %OP488.MLOAD.contd, label %return, !prof !7

OP488.MLOAD.contd:                                ; preds = %OP483.PUSH1
  %mload.out1697 = load i256, ptr %mload.out.slot1696, align 16
  %swap.b1703 = load i256, ptr %sp1618, align 16
  %412 = add i256 %swap.b1703, 32
  store i256 %412, ptr %sp1618, align 16
  store i256 %mload.out1697, ptr %sp1632, align 16
  store i256 %mload.out1697, ptr %sp1659, align 16
  %dup41723 = load i256, ptr %sp1616, align 16
  store i256 %dup41723, ptr %sp1669, align 16
  %sp1728 = getelementptr i256, ptr %sp1602, i64 7
  store i256 %412, ptr %sp1728, align 16
  %413 = add nuw nsw i64 %len.addr.51, 9
  %sp1730 = getelementptr i256, ptr %sp1602, i64 8
  store i256 0, ptr %sp1730, align 16
  %gas.remaining17318784.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP497.JUMPDEST.preheader, !annotation !10

OP497.JUMPDEST.preheader:                         ; preds = %dynamic_jump_table, %OP488.MLOAD.contd
  %gas.remaining17318784 = phi i64 [ %gas.remaining17318784.pre, %OP488.MLOAD.contd ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.20.ph = phi i64 [ %413, %OP488.MLOAD.contd ], [ %len.addr.51, %dynamic_jump_table ]
  %len.addr.20.ph.fr = freeze i64 %len.addr.20.ph
  %414 = add i64 %gas.remaining17318784, -26
  %415 = icmp ult i64 %gas.remaining17318784, 26
  store i64 %414, ptr %gas.remaining.addr, align 8
  br i1 %415, label %return, label %OP497.JUMPDEST.contd.lr.ph, !prof !11, !annotation !3

OP497.JUMPDEST.contd.lr.ph:                       ; preds = %OP497.JUMPDEST.preheader
  %416 = add i64 %len.addr.20.ph.fr, -1023
  %417 = icmp ult i64 %416, -1019
  %418 = add nuw nsw i64 %len.addr.20.ph.fr, 1
  %419 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.20.ph.fr
  %sp1735 = getelementptr i256, ptr %419, i64 -4
  %sp1739 = getelementptr i256, ptr %419, i64 -1
  %sp1741 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %418
  %sp1762 = getelementptr i256, ptr %419, i64 -2
  %ecx.memory.addr.i7506 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %sp1782 = getelementptr i256, ptr %419, i64 -3
  %sp1784 = getelementptr i256, ptr %419, i64 2
  br i1 %417, label %return.loopexit8694.split.loop.exit8768, label %OP497.JUMPDEST.contd.lr.ph.split, !prof !2

OP497.JUMPDEST.contd.lr.ph.split:                 ; preds = %OP497.JUMPDEST.contd.lr.ph
  %420 = add nsw i64 %len.addr.20.ph.fr, -1022
  %421 = icmp ult i64 %420, -1019
  br i1 %421, label %OP497.JUMPDEST.contd.us, label %OP497.JUMPDEST.contd.preheader, !prof !2

OP497.JUMPDEST.contd.preheader:                   ; preds = %OP497.JUMPDEST.contd.lr.ph.split
  %dup21740.pre = load i256, ptr %sp1739, align 16
  br label %OP497.JUMPDEST.contd

OP497.JUMPDEST.contd.us:                          ; preds = %OP497.JUMPDEST.contd.lr.ph.split
  %dup41736.us = load i256, ptr %sp1735, align 16
  %dup21740.us = load i256, ptr %sp1739, align 16
  store i256 %dup21740.us, ptr %sp1741, align 16
  %422 = icmp uge i256 %dup21740.us, %dup41736.us
  %423 = zext i1 %422 to i256
  store i256 %423, ptr %419, align 16
  br i1 %422, label %OP519.JUMPDEST, label %OP504.DUP1.us

OP504.DUP1.us:                                    ; preds = %OP497.JUMPDEST.contd.us
  %424 = add i64 %gas.remaining17318784, -75
  %425 = icmp ult i64 %414, 49
  store i64 %424, ptr %gas.remaining.addr, align 8
  %spec.select9139 = select i1 %425, i8 80, i8 92, !prof !2
  br label %return, !annotation !3

OP497.JUMPDEST.contd:                             ; preds = %OP497.JUMPDEST.contd.preheader, %OP512.PUSH1
  %dup21740 = phi i256 [ %452, %OP512.PUSH1 ], [ %dup21740.pre, %OP497.JUMPDEST.contd.preheader ]
  %426 = phi i64 [ %453, %OP512.PUSH1 ], [ %414, %OP497.JUMPDEST.contd.preheader ]
  %gas.remaining17318785 = phi i64 [ %gas.remaining1731, %OP512.PUSH1 ], [ %gas.remaining17318784, %OP497.JUMPDEST.contd.preheader ]
  %dup41736 = load i256, ptr %sp1735, align 16
  store i256 %dup21740, ptr %sp1741, align 16
  %427 = icmp uge i256 %dup21740, %dup41736
  %428 = zext i1 %427 to i256
  store i256 %428, ptr %419, align 16
  br i1 %427, label %OP519.JUMPDEST, label %OP504.DUP1

OP504.DUP1:                                       ; preds = %OP497.JUMPDEST.contd
  %429 = add i64 %gas.remaining17318785, -75
  %430 = icmp ult i64 %426, 49
  store i64 %429, ptr %gas.remaining.addr, align 8
  br i1 %430, label %return, label %OP504.DUP1.contd, !prof !2, !annotation !3

OP504.DUP1.contd:                                 ; preds = %OP504.DUP1
  %dup31763 = load i256, ptr %sp1762, align 16
  store i256 %dup31763, ptr %sp1741, align 16
  %431 = add i256 %dup31763, %dup21740
  store i256 %431, ptr %419, align 16
  %ecx.memory.i7507 = load ptr, ptr %ecx.memory.addr.i7506, align 8
  %ecx.memory.len.addr.i7508 = getelementptr inbounds i8, ptr %ecx.memory.i7507, i64 16
  %ecx.memory.len.i7509 = load i64, ptr %ecx.memory.len.addr.i7508, align 8, !noalias !44
  %ecx.memory.last_checkpoint.addr.i7510 = getelementptr inbounds i8, ptr %ecx.memory.i7507, i64 48
  %ecx.memory.last_checkpoint.i7511 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7510, align 8, !noalias !44
  %432 = sub i64 %ecx.memory.len.i7509, %ecx.memory.last_checkpoint.i7511
  %433 = icmp ugt i256 %431, 18446744073709551615
  %434 = trunc i256 %431 to i64
  %435 = add i64 %434, 32
  %436 = icmp ugt i64 %434, -33
  %437 = or i1 %433, %436
  %438 = select i1 %437, i64 -1, i64 %435
  %439 = icmp ugt i64 %438, %432
  br i1 %439, label %resize.i7519, label %OP507.MLOAD.contd, !prof !2

resize.i7519:                                     ; preds = %OP504.DUP1.contd
  %440 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %438), !noalias !48
  %.not.i7520 = icmp eq i8 %440, 0
  br i1 %.not.i7520, label %resize.i7519.OP507.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7519.OP507.MLOAD.contd_crit_edge:         ; preds = %resize.i7519
  %dup21779.pre = load i256, ptr %sp1739, align 16
  %ecx.memory.i7523.pre = load ptr, ptr %ecx.memory.addr.i7506, align 8, !alias.scope !49
  br label %OP507.MLOAD.contd

OP507.MLOAD.contd:                                ; preds = %resize.i7519.OP507.MLOAD.contd_crit_edge, %OP504.DUP1.contd
  %ecx.memory.i7523 = phi ptr [ %ecx.memory.i7523.pre, %resize.i7519.OP507.MLOAD.contd_crit_edge ], [ %ecx.memory.i7507, %OP504.DUP1.contd ]
  %dup21779 = phi i256 [ %dup21779.pre, %resize.i7519.OP507.MLOAD.contd_crit_edge ], [ %dup21740, %OP504.DUP1.contd ]
  %ecx.memory.buffer.ptr.shared.addr.i7513 = getelementptr inbounds i8, ptr %ecx.memory.i7507, i64 8
  %ecx.memory.buffer.ptr.shared.i7514 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7513, align 8, !noalias !44
  %ecx.memory.buffer.ptr.i7515 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7514, i64 %ecx.memory.last_checkpoint.i7511
  %slot.i7516 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7515, i64 %434
  %slot.value.i7517 = load i256, ptr %slot.i7516, align 1, !noalias !44
  %441 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7517)
  store i256 %441, ptr %419, align 16
  %dup51783 = load i256, ptr %sp1782, align 16
  store i256 %dup51783, ptr %sp1784, align 16
  %442 = add i256 %dup51783, %dup21779
  store i256 %442, ptr %sp1741, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !49)
  %ecx.memory.len.addr.i7524 = getelementptr inbounds i8, ptr %ecx.memory.i7523, i64 16
  %ecx.memory.len.i7525 = load i64, ptr %ecx.memory.len.addr.i7524, align 8, !noalias !49
  %ecx.memory.last_checkpoint.addr.i7526 = getelementptr inbounds i8, ptr %ecx.memory.i7523, i64 48
  %ecx.memory.last_checkpoint.i7527 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7526, align 8, !noalias !49
  %443 = sub i64 %ecx.memory.len.i7525, %ecx.memory.last_checkpoint.i7527
  %444 = icmp ugt i256 %442, 18446744073709551615
  %445 = trunc i256 %442 to i64
  %446 = add i64 %445, 32
  %447 = icmp ugt i64 %445, -33
  %448 = or i1 %444, %447
  %449 = select i1 %448, i64 -1, i64 %446
  %450 = icmp ugt i64 %449, %443
  br i1 %450, label %resize.i7534, label %OP512.PUSH1, !prof !2

resize.i7534:                                     ; preds = %OP507.MLOAD.contd
  %451 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %449)
  %.not.i7535 = icmp eq i8 %451, 0
  br i1 %.not.i7535, label %OP512.PUSH1, label %return, !prof !7

OP512.PUSH1:                                      ; preds = %OP507.MLOAD.contd, %resize.i7534
  %ecx.memory.buffer.ptr.shared.addr.i7529 = getelementptr inbounds i8, ptr %ecx.memory.i7523, i64 8
  %ecx.memory.buffer.ptr.shared.i7530 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7529, align 8, !noalias !49
  %ecx.memory.buffer.ptr.i7531 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7530, i64 %ecx.memory.last_checkpoint.i7527
  %slot.i7532 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7531, i64 %445
  store i256 %slot.value.i7517, ptr %slot.i7532, align 1, !noalias !49
  %dup21800 = load i256, ptr %sp1739, align 16
  store i256 %dup21800, ptr %sp1741, align 16
  %452 = add i256 %dup21800, 32
  store i256 %452, ptr %sp1739, align 16
  store i256 %dup21800, ptr %419, align 16
  %gas.remaining1731 = load i64, ptr %gas.remaining.addr, align 8
  %453 = add i64 %gas.remaining1731, -26
  %454 = icmp ult i64 %gas.remaining1731, 26
  store i64 %453, ptr %gas.remaining.addr, align 8
  br i1 %454, label %return, label %OP497.JUMPDEST.contd, !prof !20, !annotation !3

OP519.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP497.JUMPDEST.contd, %OP497.JUMPDEST.contd.us
  %gas.remaining1815 = phi i64 [ %414, %OP497.JUMPDEST.contd.us ], [ %426, %OP497.JUMPDEST.contd ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.21 = phi i64 [ 1022, %OP497.JUMPDEST.contd.us ], [ %len.addr.20.ph.fr, %OP497.JUMPDEST.contd ], [ %len.addr.51, %dynamic_jump_table ]
  %455 = add i64 %gas.remaining1815, -51
  %456 = icmp ult i64 %gas.remaining1815, 51
  store i64 %455, ptr %gas.remaining.addr, align 8
  br i1 %456, label %return, label %OP519.JUMPDEST.contd, !prof !2, !annotation !3

OP519.JUMPDEST.contd:                             ; preds = %OP519.JUMPDEST
  %457 = icmp ult i64 %len.addr.21, 7
  br i1 %457, label %return, label %OP520.POP, !prof !2, !annotation !21

OP520.POP:                                        ; preds = %OP519.JUMPDEST.contd
  %458 = add i64 %len.addr.21, -1
  %459 = add i64 %len.addr.21, -3
  %460 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.21
  %sp1823 = getelementptr i256, ptr %460, i64 -5
  %swap.a1824 = load i256, ptr %sp1823, align 16
  %sp1825 = getelementptr i256, ptr %460, i64 -6
  %461 = add i64 %len.addr.21, -5
  %sp1831 = getelementptr i256, ptr %460, i64 -7
  %swap.b1832 = load i256, ptr %sp1831, align 16
  %sp1836 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %461
  %462 = add i256 %swap.b1832, %swap.a1824
  store i256 %462, ptr %sp1831, align 16
  %463 = and i256 %swap.a1824, 31
  store i256 %463, ptr %sp1825, align 16
  %464 = icmp eq i256 %463, 0
  %465 = zext i1 %464 to i256
  store i256 %465, ptr %sp1836, align 16
  br i1 %464, label %OP556.JUMPDEST, label %OP536.DUP1

OP536.DUP1:                                       ; preds = %OP520.POP
  %466 = add i64 %gas.remaining1815, -117
  %467 = icmp ult i64 %455, 66
  store i64 %466, ptr %gas.remaining.addr, align 8
  br i1 %467, label %return, label %OP536.DUP1.contd, !prof !2, !annotation !3

OP536.DUP1.contd:                                 ; preds = %OP536.DUP1
  %468 = add i64 %len.addr.21, -1025
  %469 = icmp ult i64 %468, -1018
  br i1 %469, label %return, label %OP536.DUP1.contd1869, !prof !2

OP536.DUP1.contd1869:                             ; preds = %OP536.DUP1.contd
  %sp1876 = getelementptr i256, ptr %460, i64 -4
  %470 = sub i256 %462, %463
  store i256 %470, ptr %sp1823, align 16
  store i256 %470, ptr %sp1876, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !52)
  %ecx.memory.addr.i7537 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7538 = load ptr, ptr %ecx.memory.addr.i7537, align 8, !alias.scope !52, !noalias !55
  %ecx.memory.len.addr.i7539 = getelementptr inbounds i8, ptr %ecx.memory.i7538, i64 16
  %ecx.memory.len.i7540 = load i64, ptr %ecx.memory.len.addr.i7539, align 8, !noalias !57
  %ecx.memory.last_checkpoint.addr.i7541 = getelementptr inbounds i8, ptr %ecx.memory.i7538, i64 48
  %ecx.memory.last_checkpoint.i7542 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7541, align 8, !noalias !57
  %471 = sub i64 %ecx.memory.len.i7540, %ecx.memory.last_checkpoint.i7542
  %472 = icmp ugt i256 %470, 18446744073709551615
  %473 = trunc i256 %470 to i64
  %474 = add i64 %473, 32
  %475 = icmp ugt i64 %473, -33
  %476 = or i1 %472, %475
  %477 = select i1 %476, i64 -1, i64 %474
  %478 = icmp ugt i64 %477, %471
  br i1 %478, label %resize.i7550, label %OP540.MLOAD.contd, !prof !2

resize.i7550:                                     ; preds = %OP536.DUP1.contd1869
  %479 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %477), !noalias !55
  %.not.i7551 = icmp eq i8 %479, 0
  br i1 %.not.i7551, label %resize.i7550.OP540.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7550.OP540.MLOAD.contd_crit_edge:         ; preds = %resize.i7550
  %dup41897.pre = load i256, ptr %sp1825, align 16
  br label %OP540.MLOAD.contd

OP540.MLOAD.contd:                                ; preds = %resize.i7550.OP540.MLOAD.contd_crit_edge, %OP536.DUP1.contd1869
  %dup41897 = phi i256 [ %dup41897.pre, %resize.i7550.OP540.MLOAD.contd_crit_edge ], [ %463, %OP536.DUP1.contd1869 ]
  %ecx.memory.buffer.ptr.shared.addr.i7544 = getelementptr inbounds i8, ptr %ecx.memory.i7538, i64 8
  %ecx.memory.buffer.ptr.shared.i7545 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7544, align 8, !noalias !57
  %ecx.memory.buffer.ptr.i7546 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7545, i64 %ecx.memory.last_checkpoint.i7542
  %slot.i7547 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7546, i64 %473
  %slot.value.i7548 = load i256, ptr %slot.i7547, align 1, !noalias !57
  %480 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7548)
  store i256 %480, ptr %sp1876, align 16
  %sp1894 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %459
  store i256 1, ptr %sp1894, align 16
  %sp1898 = getelementptr i256, ptr %460, i64 -2
  %sp1900 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %458
  %481 = sub i256 32, %dup41897
  store i256 %481, ptr %sp1898, align 16
  store i256 256, ptr %sp1900, align 16
  %482 = tail call i8 @__revmc_builtin_exp(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1898, i8 19)
  %.not7263 = icmp eq i8 %482, 0
  br i1 %.not7263, label %OP547.SUB, label %return, !prof !7

OP547.SUB:                                        ; preds = %OP540.MLOAD.contd
  %a1913 = load i256, ptr %sp1898, align 16
  %sp1914 = getelementptr i256, ptr %460, i64 -3
  %b1915 = load i256, ptr %sp1914, align 16
  %483 = xor i256 %a1913, -1
  %484 = add i256 %b1915, %483
  %485 = add nsw i64 %len.addr.21, -4
  %sp1924 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %485
  %b1925 = load i256, ptr %sp1924, align 16
  %486 = and i256 %b1925, %484
  store i256 %486, ptr %sp1924, align 16
  %dup21929 = load i256, ptr %sp1823, align 16
  store i256 %dup21929, ptr %sp1894, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !58)
  %ecx.memory.i7554 = load ptr, ptr %ecx.memory.addr.i7537, align 8, !alias.scope !58
  %ecx.memory.len.addr.i7555 = getelementptr inbounds i8, ptr %ecx.memory.i7554, i64 16
  %ecx.memory.len.i7556 = load i64, ptr %ecx.memory.len.addr.i7555, align 8, !noalias !58
  %ecx.memory.last_checkpoint.addr.i7557 = getelementptr inbounds i8, ptr %ecx.memory.i7554, i64 48
  %ecx.memory.last_checkpoint.i7558 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7557, align 8, !noalias !58
  %487 = sub i64 %ecx.memory.len.i7556, %ecx.memory.last_checkpoint.i7558
  %488 = icmp ugt i256 %dup21929, 18446744073709551615
  %489 = trunc i256 %dup21929 to i64
  %490 = add i64 %489, 32
  %491 = icmp ugt i64 %489, -33
  %492 = or i1 %488, %491
  %493 = select i1 %492, i64 -1, i64 %490
  %494 = icmp ugt i64 %493, %487
  br i1 %494, label %resize.i7565, label %OP552.PUSH1, !prof !2

resize.i7565:                                     ; preds = %OP547.SUB
  %495 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %493)
  %.not.i7566 = icmp eq i8 %495, 0
  br i1 %.not.i7566, label %OP552.PUSH1, label %return, !prof !7

OP552.PUSH1:                                      ; preds = %OP547.SUB, %resize.i7565
  %ecx.memory.buffer.ptr.shared.addr.i7560 = getelementptr inbounds i8, ptr %ecx.memory.i7554, i64 8
  %ecx.memory.buffer.ptr.shared.i7561 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7560, align 8, !noalias !58
  %ecx.memory.buffer.ptr.i7562 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7561, i64 %ecx.memory.last_checkpoint.i7558
  %slot.i7563 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7562, i64 %489
  %496 = tail call i256 @llvm.bswap.i256(i256 %486)
  store i256 %496, ptr %slot.i7563, align 1, !noalias !58
  store i256 32, ptr %sp1924, align 16
  %b1942 = load i256, ptr %sp1823, align 16
  %497 = add i256 %b1942, 32
  %swap.b1948 = load i256, ptr %sp1831, align 16
  store i256 %497, ptr %sp1831, align 16
  store i256 %swap.b1948, ptr %sp1823, align 16
  %gas.remaining1950.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP556.JUMPDEST, !annotation !10

OP556.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP552.PUSH1, %OP520.POP
  %gas.remaining1950 = phi i64 [ %455, %OP520.POP ], [ %gas.remaining1950.pre, %OP552.PUSH1 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.22 = phi i64 [ %461, %OP520.POP ], [ %461, %OP552.PUSH1 ], [ %len.addr.51, %dynamic_jump_table ]
  %498 = add i64 %gas.remaining1950, -30
  %499 = icmp ult i64 %gas.remaining1950, 30
  store i64 %498, ptr %gas.remaining.addr, align 8
  br i1 %499, label %return, label %OP556.JUMPDEST.contd, !prof !2, !annotation !3

OP556.JUMPDEST.contd:                             ; preds = %OP556.JUMPDEST
  %500 = icmp ult i64 %len.addr.22, 5
  br i1 %500, label %return, label %OP557.POP, !prof !2, !annotation !21

OP557.POP:                                        ; preds = %OP556.JUMPDEST.contd
  %501 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.22
  %sp1955 = getelementptr i256, ptr %501, i64 -2
  %swap.a1956 = load i256, ptr %sp1955, align 16
  %sp1957 = getelementptr i256, ptr %501, i64 -5
  %swap.b1958 = load i256, ptr %sp1957, align 16
  store i256 %swap.a1956, ptr %sp1957, align 16
  store i256 %swap.b1958, ptr %sp1955, align 16
  %sp1963 = getelementptr i256, ptr %501, i64 -4
  store i256 64, ptr %sp1963, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !61)
  %ecx.memory.addr.i7568 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7569 = load ptr, ptr %ecx.memory.addr.i7568, align 8, !alias.scope !61, !noalias !64
  %ecx.memory.len.addr.i7570 = getelementptr inbounds i8, ptr %ecx.memory.i7569, i64 16
  %ecx.memory.len.i7571 = load i64, ptr %ecx.memory.len.addr.i7570, align 8, !noalias !66
  %ecx.memory.last_checkpoint.addr.i7572 = getelementptr inbounds i8, ptr %ecx.memory.i7569, i64 48
  %ecx.memory.last_checkpoint.i7573 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7572, align 8, !noalias !66
  %502 = sub i64 %ecx.memory.len.i7571, %ecx.memory.last_checkpoint.i7573
  %503 = icmp ult i64 %502, 96
  br i1 %503, label %resize.i7581, label %OP563.MLOAD.contd, !prof !2

resize.i7581:                                     ; preds = %OP557.POP
  %504 = add i64 %len.addr.22, -3
  %505 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !64
  %.not.i7582 = icmp eq i8 %505, 0
  br i1 %.not.i7582, label %resize.i7581.OP563.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7581.OP563.MLOAD.contd_crit_edge:         ; preds = %resize.i7581
  %swap.b1978.pre = load i256, ptr %sp1957, align 16
  br label %OP563.MLOAD.contd

OP563.MLOAD.contd:                                ; preds = %resize.i7581.OP563.MLOAD.contd_crit_edge, %OP557.POP
  %swap.b1978 = phi i256 [ %swap.b1978.pre, %resize.i7581.OP563.MLOAD.contd_crit_edge ], [ %swap.a1956, %OP557.POP ]
  %ecx.memory.buffer.ptr.shared.addr.i7575 = getelementptr inbounds i8, ptr %ecx.memory.i7569, i64 8
  %ecx.memory.buffer.ptr.shared.i7576 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7575, align 8, !noalias !66
  %ecx.memory.buffer.ptr.i7577 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7576, i64 %ecx.memory.last_checkpoint.i7573
  %slot.i7578 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7577, i64 64
  %slot.value.i7579 = load i256, ptr %slot.i7578, align 1, !noalias !66
  %506 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7579)
  %sp1975 = getelementptr i256, ptr %501, i64 -3
  store i256 %swap.b1978, ptr %sp1975, align 16
  %507 = sub i256 %swap.b1978, %506
  store i256 %507, ptr %sp1957, align 16
  store i256 %506, ptr %sp1963, align 16
  %508 = add i64 %len.addr.22, -5
  %509 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1957, i8 2)
  %.not7266 = icmp eq i8 %509, 0
  %spec.select5557 = select i1 %.not7266, i8 2, i8 %509, !prof !7
  br label %return

OP569.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %510 = add i64 %gas.remaining237, -19
  %511 = icmp ult i64 %gas.remaining237, 19
  store i64 %510, ptr %gas.remaining.addr, align 8
  br i1 %511, label %return, label %OP569.JUMPDEST.contd, !prof !2, !annotation !3

OP569.JUMPDEST.thread:                            ; preds = %OP55.DUP1.contd182
  %512 = add i64 %gas.remaining231.pre, -240
  %513 = icmp ult i64 %44, 19
  store i64 %512, ptr %gas.remaining.addr, align 8
  br i1 %513, label %return, label %OP570.CALLVALUE, !prof !2, !annotation !3

OP569.JUMPDEST.contd:                             ; preds = %OP569.JUMPDEST
  %514 = icmp ugt i64 %len.addr.51, 1022
  br i1 %514, label %return, label %OP570.CALLVALUE, !prof !67, !annotation !8

OP570.CALLVALUE:                                  ; preds = %OP569.JUMPDEST.thread, %OP569.JUMPDEST.contd
  %len.addr.2385558557 = phi i64 [ %len.addr.51, %OP569.JUMPDEST.contd ], [ 1, %OP569.JUMPDEST.thread ]
  %515 = phi i64 [ %510, %OP569.JUMPDEST.contd ], [ %512, %OP569.JUMPDEST.thread ]
  %contract.call_value.addr1996 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value1997 = load i256, ptr %contract.call_value.addr1996, align 16
  %sp1998 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.2385558557
  %516 = icmp eq i256 %contract.call_value1997, 0
  %517 = zext i1 %516 to i256
  store i256 %517, ptr %sp1998, align 16
  br i1 %516, label %OP577.JUMPDEST, label %OP574.PUSH1

OP574.PUSH1:                                      ; preds = %OP570.CALLVALUE
  %518 = add i64 %515, -6
  %519 = icmp ult i64 %515, 6
  store i64 %518, ptr %gas.remaining.addr, align 8
  br i1 %519, label %return, label %OP574.PUSH1.contd2008, !prof !2, !annotation !3

OP574.PUSH1.contd2008:                            ; preds = %OP574.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp1998, i8 0, i64 64, i1 false)
  %520 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1998, i8 16)
  %.not7254 = icmp eq i8 %520, 0
  %spec.select5558 = select i1 %.not7254, i8 16, i8 %520, !prof !7
  br label %return

OP577.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP570.CALLVALUE
  %gas.remaining2016 = phi i64 [ %515, %OP570.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.24 = phi i64 [ %len.addr.2385558557, %OP570.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %521 = add i64 %gas.remaining2016, -79
  %522 = icmp ult i64 %gas.remaining2016, 79
  store i64 %521, ptr %gas.remaining.addr, align 8
  br i1 %522, label %return, label %OP577.JUMPDEST.contd, !prof !2, !annotation !3

OP577.JUMPDEST.contd:                             ; preds = %OP577.JUMPDEST
  %523 = icmp ugt i64 %len.addr.24, 1018
  br i1 %523, label %return, label %OP578.PUSH2, !prof !2, !annotation !8

OP578.PUSH2:                                      ; preds = %OP577.JUMPDEST.contd
  %sp2020 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.24
  store i256 944, ptr %sp2020, align 16
  %sp2022 = getelementptr i256, ptr %sp2020, i64 1
  store i256 4, ptr %sp2022, align 16
  %524 = add nuw nsw i64 %len.addr.24, 3
  %sp2026 = getelementptr i256, ptr %sp2020, i64 2
  store i256 4, ptr %sp2026, align 16
  %sp2030 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %524
  store i256 4, ptr %sp2030, align 16
  %525 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7412 = load ptr, ptr %525, align 8
  %526 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val7413 = load i64, ptr %526, align 8
  %527 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 4, ptr %arg.contract.addr.val7412, i64 %arg.contract.addr.val7413)
  %sp2036 = getelementptr i256, ptr %sp2020, i64 4
  %528 = and i256 %527, 1461501637330902918203684832716283019655932542975
  store i256 %528, ptr %sp2022, align 16
  store i256 4, ptr %sp2026, align 16
  store i256 36, ptr %sp2030, align 16
  store i256 36, ptr %sp2036, align 16
  %529 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 36, ptr %arg.contract.addr.val7412, i64 %arg.contract.addr.val7413)
  %sp2085 = getelementptr i256, ptr %sp2020, i64 5
  store i256 32, ptr %sp2085, align 16
  store i256 %529, ptr %sp2026, align 16
  store i256 4, ptr %sp2030, align 16
  store i256 68, ptr %sp2036, align 16
  br label %OP1511.JUMPDEST

OP603.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %530 = add i64 %gas.remaining237, -62
  %531 = icmp ult i64 %gas.remaining237, 62
  store i64 %530, ptr %gas.remaining.addr, align 8
  br i1 %531, label %return, label %OP603.JUMPDEST.contd, !prof !2, !annotation !3

OP603.JUMPDEST.contd:                             ; preds = %OP603.JUMPDEST
  %532 = icmp eq i64 %len.addr.51, 0
  %533 = add i64 %len.addr.51, -1021
  %534 = icmp ult i64 %533, -1020
  %535 = select i1 %532, i8 91, i8 92
  br i1 %534, label %return, label %OP604.PUSH1, !prof !2

OP604.PUSH1:                                      ; preds = %OP603.JUMPDEST.contd
  %536 = add nuw nsw i64 %len.addr.51, 1
  %sp2114 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp2114, align 16
  %mload.out.slot2118 = alloca i256, align 16
  %537 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot2118, ptr %arg.ecx.addr)
  %.not7249 = icmp eq i8 %537, 0
  br i1 %.not7249, label %OP605.MLOAD.contd, label %return, !prof !7

OP605.MLOAD.contd:                                ; preds = %OP604.PUSH1
  %mload.out2119 = load i256, ptr %mload.out.slot2118, align 16
  store i256 %mload.out2119, ptr %sp2114, align 16
  %538 = add nuw nsw i64 %len.addr.51, 2
  %sp2124 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %536
  store i256 %mload.out2119, ptr %sp2124, align 16
  %sp2126 = getelementptr i256, ptr %sp2114, i64 -1
  %dup32127 = load i256, ptr %sp2126, align 16
  %sp2128 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %538
  %.not7250 = icmp ne i256 %dup32127, 0
  %539 = zext i1 %.not7250 to i256
  store i256 %539, ptr %sp2128, align 16
  %sp2148 = getelementptr i256, ptr %sp2114, i64 3
  store i256 %mload.out2119, ptr %sp2148, align 16
  %540 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out2119, i256 %539, ptr %arg.ecx.addr)
  %.not7251 = icmp eq i8 %540, 0
  br i1 %.not7251, label %OP614.PUSH1, label %return, !prof !7

OP614.PUSH1:                                      ; preds = %OP605.MLOAD.contd
  store i256 32, ptr %sp2128, align 16
  %b2160 = load i256, ptr %sp2124, align 16
  %541 = add i256 %b2160, 32
  %swap.b2166 = load i256, ptr %sp2126, align 16
  store i256 %541, ptr %sp2126, align 16
  store i256 %swap.b2166, ptr %sp2124, align 16
  store i256 64, ptr %sp2114, align 16
  %mload.out.slot2174 = alloca i256, align 16
  %542 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot2174, ptr %arg.ecx.addr)
  %.not7252 = icmp eq i8 %542, 0
  br i1 %.not7252, label %OP620.MLOAD.contd, label %return, !prof !7

OP620.MLOAD.contd:                                ; preds = %OP614.PUSH1
  %mload.out2175 = load i256, ptr %mload.out.slot2174, align 16
  %swap.b2185 = load i256, ptr %sp2126, align 16
  store i256 %swap.b2185, ptr %sp2124, align 16
  %543 = sub i256 %swap.b2185, %mload.out2175
  store i256 %543, ptr %sp2126, align 16
  store i256 %mload.out2175, ptr %sp2114, align 16
  %544 = add nsw i64 %len.addr.51, -1
  %545 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2126, i8 2)
  %.not7253 = icmp eq i8 %545, 0
  %spec.select5559 = select i1 %.not7253, i8 2, i8 %545, !prof !7
  br label %return

OP626.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %546 = add i64 %gas.remaining237, -15
  %547 = icmp ult i64 %gas.remaining237, 15
  store i64 %546, ptr %gas.remaining.addr, align 8
  br i1 %547, label %return, label %OP626.JUMPDEST.contd, !prof !2, !annotation !3

OP626.JUMPDEST.thread:                            ; preds = %OP60.DUP1.contd199
  %548 = add i64 %gas.remaining231.pre, -258
  %549 = icmp ult i64 %48, 15
  store i64 %548, ptr %gas.remaining.addr, align 8
  br i1 %549, label %return, label %OP687.JUMPDEST.sink.split, !prof !2, !annotation !3

OP626.JUMPDEST.contd:                             ; preds = %OP626.JUMPDEST
  %550 = icmp ugt i64 %len.addr.51, 1022
  br i1 %550, label %return, label %OP687.JUMPDEST.sink.split, !prof !68, !annotation !8

OP630.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %551 = add i64 %gas.remaining237, -1
  %552 = icmp eq i64 %gas.remaining237, 0
  store i64 %551, ptr %gas.remaining.addr, align 8
  %spec.select5560 = select i1 %552, i8 80, i8 1, !prof !2
  br label %return, !annotation !3

OP632.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %553 = add i64 %gas.remaining237, -19
  %554 = icmp ult i64 %gas.remaining237, 19
  store i64 %553, ptr %gas.remaining.addr, align 8
  br i1 %554, label %return, label %OP632.JUMPDEST.contd, !prof !2, !annotation !3

OP632.JUMPDEST.thread:                            ; preds = %OP65.DUP1.contd216
  %555 = add i64 %gas.remaining231.pre, -284
  %556 = icmp ult i64 %52, 19
  store i64 %555, ptr %gas.remaining.addr, align 8
  br i1 %556, label %return, label %OP633.CALLVALUE, !prof !2, !annotation !3

OP632.JUMPDEST.contd:                             ; preds = %OP632.JUMPDEST
  %557 = icmp ugt i64 %len.addr.51, 1022
  br i1 %557, label %return, label %OP633.CALLVALUE, !prof !69, !annotation !8

OP633.CALLVALUE:                                  ; preds = %OP632.JUMPDEST.thread, %OP632.JUMPDEST.contd
  %len.addr.2685658567 = phi i64 [ %len.addr.51, %OP632.JUMPDEST.contd ], [ 1, %OP632.JUMPDEST.thread ]
  %558 = phi i64 [ %553, %OP632.JUMPDEST.contd ], [ %555, %OP632.JUMPDEST.thread ]
  %contract.call_value.addr2212 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value2213 = load i256, ptr %contract.call_value.addr2212, align 16
  %sp2214 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.2685658567
  %559 = icmp eq i256 %contract.call_value2213, 0
  %560 = zext i1 %559 to i256
  store i256 %560, ptr %sp2214, align 16
  br i1 %559, label %OP640.JUMPDEST, label %OP637.PUSH1

OP637.PUSH1:                                      ; preds = %OP633.CALLVALUE
  %561 = add i64 %558, -6
  %562 = icmp ult i64 %558, 6
  store i64 %561, ptr %gas.remaining.addr, align 8
  br i1 %562, label %return, label %OP637.PUSH1.contd2224, !prof !2, !annotation !3

OP637.PUSH1.contd2224:                            ; preds = %OP637.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp2214, i8 0, i64 64, i1 false)
  %563 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2214, i8 16)
  %.not7241 = icmp eq i8 %563, 0
  %spec.select5561 = select i1 %.not7241, i8 16, i8 %563, !prof !7
  br label %return

OP640.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP633.CALLVALUE
  %gas.remaining2232 = phi i64 [ %558, %OP633.CALLVALUE ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.27 = phi i64 [ %len.addr.2685658567, %OP633.CALLVALUE ], [ %len.addr.51, %dynamic_jump_table ]
  %564 = add i64 %gas.remaining2232, -85
  %565 = icmp ult i64 %gas.remaining2232, 85
  store i64 %564, ptr %gas.remaining.addr, align 8
  br i1 %565, label %return, label %OP640.JUMPDEST.contd, !prof !2, !annotation !3

OP640.JUMPDEST.contd:                             ; preds = %OP640.JUMPDEST
  %566 = icmp ugt i64 %len.addr.27, 1018
  br i1 %566, label %return, label %OP641.PUSH2, !prof !2, !annotation !8

OP641.PUSH2:                                      ; preds = %OP640.JUMPDEST.contd
  %sp2236 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.27
  store i256 1066, ptr %sp2236, align 16
  %sp2238 = getelementptr i256, ptr %sp2236, i64 1
  store i256 4, ptr %sp2238, align 16
  %567 = add nuw nsw i64 %len.addr.27, 3
  %sp2242 = getelementptr i256, ptr %sp2236, i64 2
  store i256 4, ptr %sp2242, align 16
  %sp2246 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %567
  store i256 4, ptr %sp2246, align 16
  %568 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val7408 = load ptr, ptr %568, align 8
  %569 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val7409 = load i64, ptr %569, align 8
  %570 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 4, ptr %arg.contract.addr.val7408, i64 %arg.contract.addr.val7409)
  %sp2252 = getelementptr i256, ptr %sp2236, i64 4
  %571 = and i256 %570, 1461501637330902918203684832716283019655932542975
  store i256 %571, ptr %sp2238, align 16
  store i256 4, ptr %sp2242, align 16
  store i256 36, ptr %sp2246, align 16
  store i256 36, ptr %sp2252, align 16
  %572 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 36, ptr %arg.contract.addr.val7408, i64 %arg.contract.addr.val7409)
  %sp2296 = getelementptr i256, ptr %sp2236, i64 5
  %573 = and i256 %572, 1461501637330902918203684832716283019655932542975
  store i256 32, ptr %sp2296, align 16
  store i256 %573, ptr %sp2242, align 16
  store i256 4, ptr %sp2246, align 16
  store i256 68, ptr %sp2252, align 16
  br label %OP1527.JUMPDEST

OP668.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %574 = add i64 %gas.remaining237, -50
  %575 = icmp ult i64 %gas.remaining237, 50
  store i64 %574, ptr %gas.remaining.addr, align 8
  br i1 %575, label %return, label %OP668.JUMPDEST.contd, !prof !2, !annotation !3

OP668.JUMPDEST.contd:                             ; preds = %OP668.JUMPDEST
  %576 = icmp eq i64 %len.addr.51, 0
  %577 = add i64 %len.addr.51, -1021
  %578 = icmp ult i64 %577, -1020
  %579 = select i1 %576, i8 91, i8 92
  br i1 %578, label %return, label %OP669.PUSH1, !prof !2

OP669.PUSH1:                                      ; preds = %OP668.JUMPDEST.contd
  %580 = add nuw nsw i64 %len.addr.51, 1
  %sp2338 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.51
  store i256 64, ptr %sp2338, align 16
  %mload.out.slot2342 = alloca i256, align 16
  %581 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot2342, ptr %arg.ecx.addr)
  %.not7237 = icmp eq i8 %581, 0
  br i1 %.not7237, label %OP670.MLOAD.contd, label %return, !prof !7

OP670.MLOAD.contd:                                ; preds = %OP669.PUSH1
  %mload.out2343 = load i256, ptr %mload.out.slot2342, align 16
  store i256 %mload.out2343, ptr %sp2338, align 16
  %582 = add nuw nsw i64 %len.addr.51, 2
  %sp2348 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %580
  store i256 %mload.out2343, ptr %sp2348, align 16
  %sp2350 = getelementptr i256, ptr %sp2338, i64 -1
  %dup32351 = load i256, ptr %sp2350, align 16
  %sp2352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %582
  store i256 %dup32351, ptr %sp2352, align 16
  %sp2356 = getelementptr i256, ptr %sp2338, i64 3
  store i256 %mload.out2343, ptr %sp2356, align 16
  %583 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %mload.out2343, i256 %dup32351, ptr %arg.ecx.addr)
  %.not7238 = icmp eq i8 %583, 0
  br i1 %.not7238, label %OP675.PUSH1, label %return, !prof !7

OP675.PUSH1:                                      ; preds = %OP670.MLOAD.contd
  store i256 32, ptr %sp2352, align 16
  %b2368 = load i256, ptr %sp2348, align 16
  %584 = add i256 %b2368, 32
  %swap.b2374 = load i256, ptr %sp2350, align 16
  store i256 %584, ptr %sp2350, align 16
  store i256 %swap.b2374, ptr %sp2348, align 16
  store i256 64, ptr %sp2338, align 16
  %mload.out.slot2382 = alloca i256, align 16
  %585 = call fastcc i8 @__revmc_ir_builtin_mload(i256 64, ptr %mload.out.slot2382, ptr %arg.ecx.addr)
  %.not7239 = icmp eq i8 %585, 0
  br i1 %.not7239, label %OP681.MLOAD.contd, label %return, !prof !7

OP681.MLOAD.contd:                                ; preds = %OP675.PUSH1
  %mload.out2383 = load i256, ptr %mload.out.slot2382, align 16
  %swap.b2393 = load i256, ptr %sp2350, align 16
  store i256 %swap.b2393, ptr %sp2348, align 16
  %586 = sub i256 %swap.b2393, %mload.out2383
  store i256 %586, ptr %sp2350, align 16
  store i256 %mload.out2383, ptr %sp2338, align 16
  %587 = add nsw i64 %len.addr.51, -1
  %588 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2350, i8 2)
  %.not7240 = icmp eq i8 %588, 0
  %spec.select5562 = select i1 %.not7240, i8 2, i8 %588, !prof !7
  br label %return

OP687.JUMPDEST.sink.split:                        ; preds = %OP626.JUMPDEST.contd, %OP626.JUMPDEST.thread, %OP70.JUMPDEST.contd
  %len.addr.2585608562.sink9140 = phi i64 [ %len.addr.0, %OP70.JUMPDEST.contd ], [ %len.addr.51, %OP626.JUMPDEST.contd ], [ 1, %OP626.JUMPDEST.thread ]
  %.sink = phi i256 [ 183, %OP70.JUMPDEST.contd ], [ 978, %OP626.JUMPDEST.contd ], [ 978, %OP626.JUMPDEST.thread ]
  %gas.remaining2407.ph = phi i64 [ %56, %OP70.JUMPDEST.contd ], [ %546, %OP626.JUMPDEST.contd ], [ %548, %OP626.JUMPDEST.thread ]
  %589 = add nuw nsw i64 %len.addr.2585608562.sink9140, 1
  %sp2203 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.2585608562.sink9140
  store i256 %.sink, ptr %sp2203, align 16
  br label %OP687.JUMPDEST

OP687.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP687.JUMPDEST.sink.split
  %gas.remaining2407 = phi i64 [ %gas.remaining2407.ph, %OP687.JUMPDEST.sink.split ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.28 = phi i64 [ %589, %OP687.JUMPDEST.sink.split ], [ %len.addr.51, %dynamic_jump_table ]
  %590 = add i64 %gas.remaining2407, -108
  %591 = icmp ult i64 %gas.remaining2407, 108
  store i64 %590, ptr %gas.remaining.addr, align 8
  br i1 %591, label %return, label %OP687.JUMPDEST.contd, !prof !2, !annotation !3

OP687.JUMPDEST.contd:                             ; preds = %OP687.JUMPDEST
  %592 = icmp ugt i64 %len.addr.28, 1019
  br i1 %592, label %return, label %OP688.CALLVALUE, !prof !2, !annotation !8

OP688.CALLVALUE:                                  ; preds = %OP687.JUMPDEST.contd
  %593 = add nuw nsw i64 %len.addr.28, 1
  %contract.call_value.addr2411 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value2412 = load i256, ptr %contract.call_value.addr2411, align 16
  %sp2413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.28
  store i256 %contract.call_value2412, ptr %sp2413, align 16
  %594 = add nuw nsw i64 %len.addr.28, 2
  %sp2415 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %593
  store i256 3, ptr %sp2415, align 16
  %595 = add nuw nsw i64 %len.addr.28, 3
  %sp2417 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %594
  store i256 0, ptr %sp2417, align 16
  %596 = add nuw nsw i64 %len.addr.28, 4
  %contract.caller.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller = load i160, ptr %contract.caller.addr, align 16
  %597 = tail call i160 @llvm.bswap.i160(i160 %contract.caller)
  %598 = zext i160 %597 to i256
  %sp2419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %595
  %599 = add nuw nsw i64 %len.addr.28, 5
  %sp2421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %596
  store i256 %598, ptr %sp2419, align 16
  store i256 0, ptr %sp2421, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !70)
  %ecx.memory.addr.i7584 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7585 = load ptr, ptr %ecx.memory.addr.i7584, align 8, !alias.scope !70
  %ecx.memory.len.addr.i7586 = getelementptr inbounds i8, ptr %ecx.memory.i7585, i64 16
  %ecx.memory.len.i7587 = load i64, ptr %ecx.memory.len.addr.i7586, align 8, !noalias !70
  %ecx.memory.last_checkpoint.addr.i7588 = getelementptr inbounds i8, ptr %ecx.memory.i7585, i64 48
  %ecx.memory.last_checkpoint.i7589 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7588, align 8, !noalias !70
  %600 = sub i64 %ecx.memory.len.i7587, %ecx.memory.last_checkpoint.i7589
  %601 = icmp ult i64 %600, 32
  br i1 %601, label %resize.i7596, label %OP698.PUSH1, !prof !2

resize.i7596:                                     ; preds = %OP688.CALLVALUE
  %602 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7597 = icmp eq i8 %602, 0
  br i1 %.not.i7597, label %OP698.PUSH1, label %return, !prof !7

OP698.PUSH1:                                      ; preds = %OP688.CALLVALUE, %resize.i7596
  %ecx.memory.buffer.ptr.shared.addr.i7591 = getelementptr inbounds i8, ptr %ecx.memory.i7585, i64 8
  %ecx.memory.buffer.ptr.shared.i7592 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7591, align 8, !noalias !70
  %ecx.memory.buffer.ptr.i7593 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7592, i64 %ecx.memory.last_checkpoint.i7589
  %603 = tail call i256 @llvm.bswap.i256(i256 %598)
  store i256 %603, ptr %ecx.memory.buffer.ptr.i7593, align 1, !noalias !70
  %b2451 = load i256, ptr %sp2417, align 16
  %604 = add i256 %b2451, 32
  %swap.b2457 = load i256, ptr %sp2415, align 16
  store i256 %604, ptr %sp2415, align 16
  store i256 %swap.b2457, ptr %sp2417, align 16
  store i256 %604, ptr %sp2419, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !73)
  %ecx.memory.i7600 = load ptr, ptr %ecx.memory.addr.i7584, align 8, !alias.scope !73
  %ecx.memory.len.addr.i7601 = getelementptr inbounds i8, ptr %ecx.memory.i7600, i64 16
  %ecx.memory.len.i7602 = load i64, ptr %ecx.memory.len.addr.i7601, align 8, !noalias !73
  %ecx.memory.last_checkpoint.addr.i7603 = getelementptr inbounds i8, ptr %ecx.memory.i7600, i64 48
  %ecx.memory.last_checkpoint.i7604 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7603, align 8, !noalias !73
  %605 = sub i64 %ecx.memory.len.i7602, %ecx.memory.last_checkpoint.i7604
  %606 = icmp ugt i256 %604, 18446744073709551615
  %607 = trunc i256 %604 to i64
  %608 = add i64 %607, 32
  %609 = icmp ugt i64 %607, -33
  %610 = or i1 %606, %609
  %611 = select i1 %610, i64 -1, i64 %608
  %612 = icmp ugt i64 %611, %605
  br i1 %612, label %resize.i7611, label %OP703.PUSH1, !prof !2

resize.i7611:                                     ; preds = %OP698.PUSH1
  %613 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %611)
  %.not.i7612 = icmp eq i8 %613, 0
  br i1 %.not.i7612, label %OP703.PUSH1, label %return, !prof !7

OP703.PUSH1:                                      ; preds = %OP698.PUSH1, %resize.i7611
  %ecx.memory.buffer.ptr.shared.addr.i7606 = getelementptr inbounds i8, ptr %ecx.memory.i7600, i64 8
  %ecx.memory.buffer.ptr.shared.i7607 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7606, align 8, !noalias !73
  %ecx.memory.buffer.ptr.i7608 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7607, i64 %ecx.memory.last_checkpoint.i7604
  %slot.i7609 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7608, i64 %607
  %614 = tail call i256 @llvm.bswap.i256(i256 %swap.b2457)
  store i256 %614, ptr %slot.i7609, align 1, !noalias !73
  %b2473 = load i256, ptr %sp2415, align 16
  %615 = add i256 %b2473, 32
  store i256 %615, ptr %sp2415, align 16
  store i256 0, ptr %sp2417, align 16
  %616 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2415)
  %.not7226 = icmp eq i8 %616, 0
  br i1 %.not7226, label %OP707.PUSH1, label %return, !prof !7

OP707.PUSH1:                                      ; preds = %OP703.PUSH1
  store i256 0, ptr %sp2417, align 16
  %dup32483 = load i256, ptr %sp2413, align 16
  store i256 %dup32483, ptr %sp2419, align 16
  %dup32487 = load i256, ptr %sp2415, align 16
  store i256 %dup32487, ptr %sp2421, align 16
  %617 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2421, i8 19)
  %.not7227 = icmp eq i8 %617, 0
  br i1 %.not7227, label %OP711.ADD, label %return, !prof !7

OP711.ADD:                                        ; preds = %OP707.PUSH1
  %a2493 = load i256, ptr %sp2421, align 16
  %b2495 = load i256, ptr %sp2419, align 16
  %618 = add i256 %b2495, %a2493
  %swap.b2501 = load i256, ptr %sp2413, align 16
  store i256 %618, ptr %sp2413, align 16
  store i256 %swap.b2501, ptr %sp2419, align 16
  %swap.b2512 = load i256, ptr %sp2415, align 16
  store i256 %618, ptr %sp2415, align 16
  store i256 %swap.b2512, ptr %sp2417, align 16
  %619 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2415, i8 19)
  %.not7228 = icmp eq i8 %619, 0
  br i1 %.not7228, label %OP718.POP, label %return, !prof !7

OP718.POP:                                        ; preds = %OP711.ADD
  %gas.remaining2515 = load i64, ptr %gas.remaining.addr, align 8
  %620 = add i64 %gas.remaining2515, -1197
  %621 = icmp ult i64 %gas.remaining2515, 1197
  store i64 %620, ptr %gas.remaining.addr, align 8
  br i1 %621, label %return, label %OP718.POP.contd, !prof !2, !annotation !3

OP718.POP.contd:                                  ; preds = %OP718.POP
  %622 = icmp eq i64 %len.addr.28, 0
  %623 = add nsw i64 %len.addr.28, -1018
  %624 = icmp ult i64 %623, -1017
  %625 = select i1 %622, i8 91, i8 92
  br i1 %624, label %return, label %OP718.POP.contd2517, !prof !2

OP718.POP.contd2517:                              ; preds = %OP718.POP.contd
  store i256 %598, ptr %sp2413, align 16
  store i256 -13569407764933135957707662995615205924891434450008393826643960198943177371492, ptr %sp2415, align 16
  store i256 %contract.call_value2412, ptr %sp2417, align 16
  store i256 64, ptr %sp2419, align 16
  %ecx.memory.i7615 = load ptr, ptr %ecx.memory.addr.i7584, align 8
  %ecx.memory.len.addr.i7616 = getelementptr inbounds i8, ptr %ecx.memory.i7615, i64 16
  %ecx.memory.len.i7617 = load i64, ptr %ecx.memory.len.addr.i7616, align 8, !noalias !76
  %ecx.memory.last_checkpoint.addr.i7618 = getelementptr inbounds i8, ptr %ecx.memory.i7615, i64 48
  %ecx.memory.last_checkpoint.i7619 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7618, align 8, !noalias !76
  %626 = sub i64 %ecx.memory.len.i7617, %ecx.memory.last_checkpoint.i7619
  %627 = icmp ult i64 %626, 96
  br i1 %627, label %resize.i7627, label %OP725.MLOAD.contd, !prof !2

resize.i7627:                                     ; preds = %OP718.POP.contd2517
  %628 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !80
  %.not.i7628 = icmp eq i8 %628, 0
  br i1 %.not.i7628, label %resize.i7627.OP725.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7627.OP725.MLOAD.contd_crit_edge:         ; preds = %resize.i7627
  %dup32550.pre = load i256, ptr %sp2417, align 16
  %ecx.memory.i7631.pre = load ptr, ptr %ecx.memory.addr.i7584, align 8, !alias.scope !81
  br label %OP725.MLOAD.contd

OP725.MLOAD.contd:                                ; preds = %resize.i7627.OP725.MLOAD.contd_crit_edge, %OP718.POP.contd2517
  %ecx.memory.i7631 = phi ptr [ %ecx.memory.i7631.pre, %resize.i7627.OP725.MLOAD.contd_crit_edge ], [ %ecx.memory.i7615, %OP718.POP.contd2517 ]
  %dup32550 = phi i256 [ %dup32550.pre, %resize.i7627.OP725.MLOAD.contd_crit_edge ], [ %contract.call_value2412, %OP718.POP.contd2517 ]
  %ecx.memory.buffer.ptr.shared.addr.i7621 = getelementptr inbounds i8, ptr %ecx.memory.i7615, i64 8
  %ecx.memory.buffer.ptr.shared.i7622 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7621, align 8, !noalias !76
  %ecx.memory.buffer.ptr.i7623 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7622, i64 %ecx.memory.last_checkpoint.i7619
  %slot.i7624 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7623, i64 64
  %slot.value.i7625 = load i256, ptr %slot.i7624, align 1, !noalias !76
  %629 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7625)
  store i256 %629, ptr %sp2419, align 16
  store i256 %629, ptr %sp2421, align 16
  %sp2551 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %599
  store i256 %dup32550, ptr %sp2551, align 16
  %sp2555 = getelementptr i256, ptr %sp2413, i64 6
  store i256 %629, ptr %sp2555, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !81)
  %ecx.memory.len.addr.i7632 = getelementptr inbounds i8, ptr %ecx.memory.i7631, i64 16
  %ecx.memory.len.i7633 = load i64, ptr %ecx.memory.len.addr.i7632, align 8, !noalias !81
  %ecx.memory.last_checkpoint.addr.i7634 = getelementptr inbounds i8, ptr %ecx.memory.i7631, i64 48
  %ecx.memory.last_checkpoint.i7635 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7634, align 8, !noalias !81
  %630 = sub i64 %ecx.memory.len.i7633, %ecx.memory.last_checkpoint.i7635
  %631 = icmp ugt i256 %629, 18446744073709551615
  %632 = trunc i256 %629 to i64
  %633 = add i64 %632, 32
  %634 = icmp ugt i64 %632, -33
  %635 = or i1 %631, %634
  %636 = select i1 %635, i64 -1, i64 %633
  %637 = icmp ugt i64 %636, %630
  br i1 %637, label %resize.i7642, label %OP730.PUSH1, !prof !2

resize.i7642:                                     ; preds = %OP725.MLOAD.contd
  %638 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %636)
  %.not.i7643 = icmp eq i8 %638, 0
  br i1 %.not.i7643, label %OP730.PUSH1, label %return, !prof !7

OP730.PUSH1:                                      ; preds = %OP725.MLOAD.contd, %resize.i7642
  %ecx.memory.buffer.ptr.shared.addr.i7637 = getelementptr inbounds i8, ptr %ecx.memory.i7631, i64 8
  %ecx.memory.buffer.ptr.shared.i7638 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7637, align 8, !noalias !81
  %ecx.memory.buffer.ptr.i7639 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7638, i64 %ecx.memory.last_checkpoint.i7635
  %slot.i7640 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7639, i64 %632
  %639 = tail call i256 @llvm.bswap.i256(i256 %dup32550)
  store i256 %639, ptr %slot.i7640, align 1, !noalias !81
  store i256 32, ptr %sp2551, align 16
  %b2567 = load i256, ptr %sp2421, align 16
  %640 = add i256 %b2567, 32
  %swap.b2573 = load i256, ptr %sp2417, align 16
  store i256 %640, ptr %sp2417, align 16
  store i256 %swap.b2573, ptr %sp2421, align 16
  store i256 64, ptr %sp2419, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !84)
  %ecx.memory.i7646 = load ptr, ptr %ecx.memory.addr.i7584, align 8, !alias.scope !84, !noalias !87
  %ecx.memory.len.addr.i7647 = getelementptr inbounds i8, ptr %ecx.memory.i7646, i64 16
  %ecx.memory.len.i7648 = load i64, ptr %ecx.memory.len.addr.i7647, align 8, !noalias !89
  %ecx.memory.last_checkpoint.addr.i7649 = getelementptr inbounds i8, ptr %ecx.memory.i7646, i64 48
  %ecx.memory.last_checkpoint.i7650 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7649, align 8, !noalias !89
  %641 = sub i64 %ecx.memory.len.i7648, %ecx.memory.last_checkpoint.i7650
  %642 = icmp ult i64 %641, 96
  br i1 %642, label %resize.i7658, label %OP736.MLOAD.contd, !prof !2

resize.i7658:                                     ; preds = %OP730.PUSH1
  %643 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !87
  %.not.i7659 = icmp eq i8 %643, 0
  br i1 %.not.i7659, label %resize.i7658.OP736.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7658.OP736.MLOAD.contd_crit_edge:         ; preds = %resize.i7658
  %swap.b2592.pre = load i256, ptr %sp2417, align 16
  br label %OP736.MLOAD.contd

OP736.MLOAD.contd:                                ; preds = %resize.i7658.OP736.MLOAD.contd_crit_edge, %OP730.PUSH1
  %swap.b2592 = phi i256 [ %swap.b2592.pre, %resize.i7658.OP736.MLOAD.contd_crit_edge ], [ %640, %OP730.PUSH1 ]
  %ecx.memory.buffer.ptr.shared.addr.i7652 = getelementptr inbounds i8, ptr %ecx.memory.i7646, i64 8
  %ecx.memory.buffer.ptr.shared.i7653 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7652, align 8, !noalias !89
  %ecx.memory.buffer.ptr.i7654 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7653, i64 %ecx.memory.last_checkpoint.i7650
  %slot.i7655 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7654, i64 64
  %slot.value.i7656 = load i256, ptr %slot.i7655, align 1, !noalias !89
  %644 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7656)
  store i256 %swap.b2592, ptr %sp2421, align 16
  %645 = sub i256 %swap.b2592, %644
  store i256 %645, ptr %sp2417, align 16
  store i256 %644, ptr %sp2419, align 16
  %646 = tail call i8 @__revmc_builtin_log(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2413, i8 2)
  %.not7232 = icmp eq i8 %646, 0
  br i1 %.not7232, label %OP742.JUMP, label %return, !prof !7

OP742.JUMP:                                       ; preds = %OP736.MLOAD.contd
  %647 = add nsw i64 %len.addr.28, -1
  %sp2607 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %647
  %a2608 = load i256, ptr %sp2607, align 16
  br label %dynamic_jump_table.preheader

OP743.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP85.PUSH2
  %gas.remaining2609 = phi i64 [ %72, %OP85.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.29 = phi i64 [ %75, %OP85.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %648 = add i64 %gas.remaining2609, -194
  %649 = icmp ult i64 %gas.remaining2609, 194
  store i64 %648, ptr %gas.remaining.addr, align 8
  br i1 %649, label %return, label %OP743.JUMPDEST.contd, !prof !2, !annotation !3

OP743.JUMPDEST.contd:                             ; preds = %OP743.JUMPDEST
  %650 = icmp ugt i64 %len.addr.29, 1015
  br i1 %650, label %return, label %OP744.PUSH1, !prof !2, !annotation !8

OP744.PUSH1:                                      ; preds = %OP743.JUMPDEST.contd
  %sp2613 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.29
  %651 = add nuw nsw i64 %len.addr.29, 2
  %sp2617 = getelementptr i256, ptr %sp2613, i64 1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp2613, i8 0, i64 64, i1 false)
  %652 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2617, i8 19)
  %.not7396 = icmp eq i8 %652, 0
  br i1 %.not7396, label %OP747.PUSH1, label %return, !prof !7

OP747.PUSH1:                                      ; preds = %OP744.PUSH1
  %653 = add nuw nsw i64 %len.addr.29, 3
  %sp2621 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %651
  %654 = add nuw nsw i64 %len.addr.29, 4
  %dup22624 = load i256, ptr %sp2617, align 16
  %sp2625 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %653
  %sp2627 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %654
  %655 = shl i256 %dup22624, 8
  %656 = and i256 %655, 256
  %657 = xor i256 %656, 256
  %658 = add nsw i256 %657, -1
  %659 = and i256 %658, %dup22624
  %660 = lshr i256 %659, 1
  store i256 %660, ptr %sp2617, align 16
  %661 = add nuw i256 %660, 31
  store i256 %661, ptr %sp2627, align 16
  %662 = and i256 %661, -32
  %663 = add nuw i256 %662, 32
  store i256 %663, ptr %sp2621, align 16
  store i256 64, ptr %sp2625, align 16
  %ecx.memory.addr.i7661 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7662 = load ptr, ptr %ecx.memory.addr.i7661, align 8
  %ecx.memory.len.addr.i7663 = getelementptr inbounds i8, ptr %ecx.memory.i7662, i64 16
  %ecx.memory.len.i7664 = load i64, ptr %ecx.memory.len.addr.i7663, align 8, !noalias !90
  %ecx.memory.last_checkpoint.addr.i7665 = getelementptr inbounds i8, ptr %ecx.memory.i7662, i64 48
  %ecx.memory.last_checkpoint.i7666 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7665, align 8, !noalias !90
  %664 = sub i64 %ecx.memory.len.i7664, %ecx.memory.last_checkpoint.i7666
  %665 = icmp ult i64 %664, 96
  br i1 %665, label %resize.i7674, label %OP770.MLOAD.contd, !prof !2

resize.i7674:                                     ; preds = %OP747.PUSH1
  %666 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !94
  %.not.i7675 = icmp eq i8 %666, 0
  br i1 %.not.i7675, label %resize.i7674.OP770.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7674.OP770.MLOAD.contd_crit_edge:         ; preds = %resize.i7674
  %swap.b2726.pre = load i256, ptr %sp2621, align 16
  %ecx.memory.i7678.pre = load ptr, ptr %ecx.memory.addr.i7661, align 8, !alias.scope !95
  br label %OP770.MLOAD.contd

OP770.MLOAD.contd:                                ; preds = %resize.i7674.OP770.MLOAD.contd_crit_edge, %OP747.PUSH1
  %ecx.memory.i7678 = phi ptr [ %ecx.memory.i7678.pre, %resize.i7674.OP770.MLOAD.contd_crit_edge ], [ %ecx.memory.i7662, %OP747.PUSH1 ]
  %swap.b2726 = phi i256 [ %swap.b2726.pre, %resize.i7674.OP770.MLOAD.contd_crit_edge ], [ %663, %OP747.PUSH1 ]
  %ecx.memory.buffer.ptr.shared.addr.i7668 = getelementptr inbounds i8, ptr %ecx.memory.i7662, i64 8
  %ecx.memory.buffer.ptr.shared.i7669 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7668, align 8, !noalias !90
  %ecx.memory.buffer.ptr.i7670 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7669, i64 %ecx.memory.last_checkpoint.i7666
  %slot.i7671 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7670, i64 64
  %slot.value.i7672 = load i256, ptr %slot.i7671, align 1, !noalias !90
  %667 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7672)
  store i256 %667, ptr %sp2621, align 16
  %668 = add i256 %swap.b2726, %667
  store i256 %668, ptr %sp2625, align 16
  store i256 64, ptr %sp2627, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !95)
  %ecx.memory.len.addr.i7679 = getelementptr inbounds i8, ptr %ecx.memory.i7678, i64 16
  %ecx.memory.len.i7680 = load i64, ptr %ecx.memory.len.addr.i7679, align 8, !noalias !95
  %ecx.memory.last_checkpoint.addr.i7681 = getelementptr inbounds i8, ptr %ecx.memory.i7678, i64 48
  %ecx.memory.last_checkpoint.i7682 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7681, align 8, !noalias !95
  %669 = sub i64 %ecx.memory.len.i7680, %ecx.memory.last_checkpoint.i7682
  %670 = icmp ult i64 %669, 96
  br i1 %670, label %resize.i7689, label %OP776.DUP1, !prof !2

resize.i7689:                                     ; preds = %OP770.MLOAD.contd
  %671 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96)
  %.not.i7690 = icmp eq i8 %671, 0
  br i1 %.not.i7690, label %OP776.DUP1, label %return, !prof !7

OP776.DUP1:                                       ; preds = %OP770.MLOAD.contd, %resize.i7689
  %ecx.memory.buffer.ptr.shared.addr.i7684 = getelementptr inbounds i8, ptr %ecx.memory.i7678, i64 8
  %ecx.memory.buffer.ptr.shared.i7685 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7684, align 8, !noalias !95
  %ecx.memory.buffer.ptr.i7686 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7685, i64 %ecx.memory.last_checkpoint.i7682
  %slot.i7687 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7686, i64 64
  %672 = tail call i256 @llvm.bswap.i256(i256 %668)
  store i256 %672, ptr %slot.i7687, align 1, !noalias !95
  %dup12746 = load i256, ptr %sp2621, align 16
  %swap.b2752 = load i256, ptr %sp2613, align 16
  store i256 %dup12746, ptr %sp2613, align 16
  %swap.b2757 = load i256, ptr %sp2617, align 16
  store i256 %swap.b2752, ptr %sp2617, align 16
  store i256 %swap.b2757, ptr %sp2621, align 16
  store i256 %dup12746, ptr %sp2625, align 16
  store i256 %swap.b2757, ptr %sp2627, align 16
  %673 = add nuw nsw i64 %len.addr.29, 6
  %sp2770 = getelementptr i256, ptr %sp2613, i64 5
  store i256 %dup12746, ptr %sp2770, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !98)
  %ecx.memory.i7693 = load ptr, ptr %ecx.memory.addr.i7661, align 8, !alias.scope !98
  %ecx.memory.len.addr.i7694 = getelementptr inbounds i8, ptr %ecx.memory.i7693, i64 16
  %ecx.memory.len.i7695 = load i64, ptr %ecx.memory.len.addr.i7694, align 8, !noalias !98
  %ecx.memory.last_checkpoint.addr.i7696 = getelementptr inbounds i8, ptr %ecx.memory.i7693, i64 48
  %ecx.memory.last_checkpoint.i7697 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7696, align 8, !noalias !98
  %674 = sub i64 %ecx.memory.len.i7695, %ecx.memory.last_checkpoint.i7697
  %675 = icmp ugt i256 %dup12746, 18446744073709551615
  %676 = trunc i256 %dup12746 to i64
  %677 = add i64 %676, 32
  %678 = icmp ugt i64 %676, -33
  %679 = or i1 %675, %678
  %680 = select i1 %679, i64 -1, i64 %677
  %681 = icmp ugt i64 %680, %674
  br i1 %681, label %resize.i7704, label %OP783.PUSH1, !prof !2

resize.i7704:                                     ; preds = %OP776.DUP1
  %682 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %680)
  %.not.i7705 = icmp eq i8 %682, 0
  br i1 %.not.i7705, label %OP783.PUSH1, label %return, !prof !7

OP783.PUSH1:                                      ; preds = %OP776.DUP1, %resize.i7704
  %ecx.memory.buffer.ptr.shared.addr.i7699 = getelementptr inbounds i8, ptr %ecx.memory.i7693, i64 8
  %ecx.memory.buffer.ptr.shared.i7700 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7699, align 8, !noalias !98
  %ecx.memory.buffer.ptr.i7701 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7700, i64 %ecx.memory.last_checkpoint.i7697
  %slot.i7702 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7701, i64 %676
  %683 = tail call i256 @llvm.bswap.i256(i256 %swap.b2757)
  store i256 %683, ptr %slot.i7702, align 1, !noalias !98
  %b2782 = load i256, ptr %sp2625, align 16
  %684 = add i256 %b2782, 32
  store i256 %684, ptr %sp2625, align 16
  %dup32786 = load i256, ptr %sp2617, align 16
  store i256 %dup32786, ptr %sp2627, align 16
  store i256 %dup32786, ptr %sp2770, align 16
  %685 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2770, i8 19)
  %.not7400 = icmp eq i8 %685, 0
  br i1 %.not7400, label %OP788.PUSH1, label %return, !prof !7

OP788.PUSH1:                                      ; preds = %OP783.PUSH1
  %sp2795 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %673
  %dup22798 = load i256, ptr %sp2770, align 16
  %sp2799 = getelementptr i256, ptr %sp2613, i64 7
  %686 = add nuw nsw i64 %len.addr.29, 9
  %sp2801 = getelementptr i256, ptr %sp2613, i64 8
  store i256 256, ptr %sp2801, align 16
  %687 = shl i256 %dup22798, 8
  %688 = and i256 %687, 256
  %689 = xor i256 %688, 256
  store i256 %689, ptr %sp2799, align 16
  %690 = add nsw i256 %689, -1
  %691 = and i256 %690, %dup22798
  %692 = lshr i256 %691, 1
  store i256 %692, ptr %sp2770, align 16
  %693 = icmp ult i256 %691, 2
  %694 = zext i1 %693 to i256
  store i256 %694, ptr %sp2795, align 16
  %gas.remaining3069.pre8992 = load i64, ptr %gas.remaining.addr, align 8
  br i1 %693, label %OP858.JUMPDEST, label %OP804.DUP1

OP804.DUP1:                                       ; preds = %OP788.PUSH1
  %695 = add i64 %gas.remaining3069.pre8992, -22
  %696 = icmp ult i64 %gas.remaining3069.pre8992, 22
  store i64 %695, ptr %gas.remaining.addr, align 8
  br i1 %696, label %return, label %OP804.DUP1.contd2858, !prof !2, !annotation !3

OP804.DUP1.contd2858:                             ; preds = %OP804.DUP1
  store i256 31, ptr %sp2799, align 16
  %697 = icmp ugt i256 %691, 63
  %698 = zext i1 %697 to i256
  store i256 %698, ptr %sp2795, align 16
  br i1 %697, label %OP823.JUMPDEST, label %OP809.PUSH2

OP809.PUSH2:                                      ; preds = %OP804.DUP1.contd2858
  %699 = add i64 %gas.remaining3069.pre8992, -70
  %700 = icmp ult i64 %695, 48
  store i64 %699, ptr %gas.remaining.addr, align 8
  br i1 %700, label %return, label %OP809.PUSH2.contd2875, !prof !2, !annotation !3

OP809.PUSH2.contd2875:                            ; preds = %OP809.PUSH2
  store i256 256, ptr %sp2795, align 16
  store i256 256, ptr %sp2799, align 16
  %sp2882 = getelementptr i256, ptr %sp2613, i64 4
  %dup42883 = load i256, ptr %sp2882, align 16
  store i256 %dup42883, ptr %sp2801, align 16
  %701 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2801, i8 19)
  %.not7401 = icmp eq i8 %701, 0
  br i1 %.not7401, label %OP813.DIV, label %return, !prof !7

OP813.DIV:                                        ; preds = %OP809.PUSH2.contd2875
  %a2889 = load i256, ptr %sp2801, align 16
  %b2891 = load i256, ptr %sp2799, align 16
  %702 = udiv i256 %a2889, %b2891
  %b2897 = load i256, ptr %sp2795, align 16
  %703 = mul i256 %b2897, %702
  store i256 %703, ptr %sp2795, align 16
  %sp2900 = getelementptr i256, ptr %sp2613, i64 3
  %dup42901 = load i256, ptr %sp2900, align 16
  store i256 %dup42901, ptr %sp2799, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !101)
  %ecx.memory.i7708 = load ptr, ptr %ecx.memory.addr.i7661, align 8, !alias.scope !101
  %ecx.memory.len.addr.i7709 = getelementptr inbounds i8, ptr %ecx.memory.i7708, i64 16
  %ecx.memory.len.i7710 = load i64, ptr %ecx.memory.len.addr.i7709, align 8, !noalias !101
  %ecx.memory.last_checkpoint.addr.i7711 = getelementptr inbounds i8, ptr %ecx.memory.i7708, i64 48
  %ecx.memory.last_checkpoint.i7712 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7711, align 8, !noalias !101
  %704 = sub i64 %ecx.memory.len.i7710, %ecx.memory.last_checkpoint.i7712
  %705 = icmp ugt i256 %dup42901, 18446744073709551615
  %706 = trunc i256 %dup42901 to i64
  %707 = add i64 %706, 32
  %708 = icmp ugt i64 %706, -33
  %709 = or i1 %705, %708
  %710 = select i1 %709, i64 -1, i64 %707
  %711 = icmp ugt i64 %710, %704
  br i1 %711, label %resize.i7719, label %OP817.SWAP2, !prof !2

resize.i7719:                                     ; preds = %OP813.DIV
  %712 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %710)
  %.not.i7720 = icmp eq i8 %712, 0
  br i1 %.not.i7720, label %OP817.SWAP2, label %return, !prof !7

OP817.SWAP2:                                      ; preds = %OP813.DIV, %resize.i7719
  %ecx.memory.buffer.ptr.shared.addr.i7714 = getelementptr inbounds i8, ptr %ecx.memory.i7708, i64 8
  %ecx.memory.buffer.ptr.shared.i7715 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7714, align 8, !noalias !101
  %ecx.memory.buffer.ptr.i7716 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7715, i64 %ecx.memory.last_checkpoint.i7712
  %slot.i7717 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7716, i64 %706
  %713 = tail call i256 @llvm.bswap.i256(i256 %703)
  store i256 %713, ptr %slot.i7717, align 1, !noalias !101
  %swap.b2912 = load i256, ptr %sp2625, align 16
  store i256 32, ptr %sp2795, align 16
  %714 = add i256 %swap.b2912, 32
  store i256 %714, ptr %sp2625, align 16
  %gas.remaining3069.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP858.JUMPDEST

OP823.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP804.DUP1.contd2858
  %gas.remaining2927 = phi i64 [ %695, %OP804.DUP1.contd2858 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.30 = phi i64 [ %673, %OP804.DUP1.contd2858 ], [ %len.addr.51, %dynamic_jump_table ]
  %715 = add i64 %gas.remaining2927, -58
  %716 = icmp ult i64 %gas.remaining2927, 58
  store i64 %715, ptr %gas.remaining.addr, align 8
  br i1 %716, label %return, label %OP823.JUMPDEST.contd, !prof !2, !annotation !3

OP823.JUMPDEST.contd:                             ; preds = %OP823.JUMPDEST
  %717 = icmp ult i64 %len.addr.30, 3
  %718 = add i64 %len.addr.30, -1024
  %719 = icmp ult i64 %718, -1021
  %720 = select i1 %717, i8 91, i8 92
  br i1 %719, label %return, label %OP824.DUP3, !prof !2

OP824.DUP3:                                       ; preds = %OP823.JUMPDEST.contd
  %721 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.30
  %sp2931 = getelementptr i256, ptr %721, i64 -3
  %dup32932 = load i256, ptr %sp2931, align 16
  %722 = add nsw i64 %len.addr.30, -1
  %sp2937 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %722
  %b2938 = load i256, ptr %sp2937, align 16
  %723 = add i256 %b2938, %dup32932
  %sp2941 = getelementptr i256, ptr %721, i64 -1
  store i256 %723, ptr %sp2931, align 16
  %sp2948 = getelementptr i256, ptr %721, i64 -2
  %swap.b2949 = load i256, ptr %sp2948, align 16
  store i256 %dup32932, ptr %sp2948, align 16
  store i256 %swap.b2949, ptr %sp2941, align 16
  store i256 0, ptr %721, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !104)
  %ecx.memory.addr.i7722 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7723 = load ptr, ptr %ecx.memory.addr.i7722, align 8, !alias.scope !104
  %ecx.memory.len.addr.i7724 = getelementptr inbounds i8, ptr %ecx.memory.i7723, i64 16
  %ecx.memory.len.i7725 = load i64, ptr %ecx.memory.len.addr.i7724, align 8, !noalias !104
  %ecx.memory.last_checkpoint.addr.i7726 = getelementptr inbounds i8, ptr %ecx.memory.i7723, i64 48
  %ecx.memory.last_checkpoint.i7727 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7726, align 8, !noalias !104
  %724 = sub i64 %ecx.memory.len.i7725, %ecx.memory.last_checkpoint.i7727
  %725 = icmp ult i64 %724, 32
  br i1 %725, label %resize.i7733, label %OP830.PUSH1, !prof !2

resize.i7733:                                     ; preds = %OP824.DUP3
  %726 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7734 = icmp eq i8 %726, 0
  br i1 %.not.i7734, label %OP830.PUSH1, label %return, !prof !7

OP830.PUSH1:                                      ; preds = %OP824.DUP3, %resize.i7733
  %ecx.memory.buffer.ptr.shared.addr.i7729 = getelementptr inbounds i8, ptr %ecx.memory.i7723, i64 8
  %ecx.memory.buffer.ptr.shared.i7730 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7729, align 8, !noalias !104
  %ecx.memory.buffer.ptr.i7731 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7730, i64 %ecx.memory.last_checkpoint.i7727
  %727 = tail call i256 @llvm.bswap.i256(i256 %swap.b2949)
  store i256 %727, ptr %ecx.memory.buffer.ptr.i7731, align 1, !noalias !104
  store i256 32, ptr %sp2937, align 16
  store i256 0, ptr %721, align 16
  %728 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp2941)
  %.not7404 = icmp eq i8 %728, 0
  br i1 %.not7404, label %OP833.SWAP1, label %return, !prof !7

OP833.SWAP1:                                      ; preds = %OP830.PUSH1
  %swap.a2965 = load i256, ptr %sp2941, align 16
  %swap.b2967 = load i256, ptr %sp2948, align 16
  store i256 %swap.a2965, ptr %sp2948, align 16
  store i256 %swap.b2967, ptr %sp2941, align 16
  br label %OP834.JUMPDEST.preheader, !annotation !10

OP834.JUMPDEST.preheader:                         ; preds = %dynamic_jump_table, %OP833.SWAP1
  %len.addr.31.ph = phi i64 [ %len.addr.30, %OP833.SWAP1 ], [ %len.addr.51, %dynamic_jump_table ]
  %len.addr.31.ph.fr = freeze i64 %len.addr.31.ph
  %729 = add i64 %len.addr.31.ph.fr, -1023
  %730 = icmp ult i64 %729, -1020
  %731 = add nuw nsw i64 %len.addr.31.ph.fr, 1
  %732 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.31.ph.fr
  %sp2972 = getelementptr i256, ptr %732, i64 -2
  %sp2978 = getelementptr i256, ptr %732, i64 -1
  %sp2980 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %731
  %ecx.memory.addr.i7736 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %sp3017 = getelementptr i256, ptr %732, i64 -3
  br i1 %730, label %OP834.JUMPDEST.us, label %OP834.JUMPDEST, !prof !2

OP834.JUMPDEST.us:                                ; preds = %OP834.JUMPDEST.preheader
  %gas.remaining2968.us = load i64, ptr %gas.remaining.addr, align 8
  %733 = add i64 %gas.remaining2968.us, -50
  %734 = icmp ult i64 %gas.remaining2968.us, 50
  store i64 %733, ptr %gas.remaining.addr, align 8
  br i1 %734, label %return, label %return.loopexit.split.loop.exit8831, !prof !2, !annotation !3

OP834.JUMPDEST:                                   ; preds = %OP834.JUMPDEST.preheader, %OP839.SWAP1
  %gas.remaining2968 = load i64, ptr %gas.remaining.addr, align 8
  %735 = add i64 %gas.remaining2968, -50
  %736 = icmp ult i64 %gas.remaining2968, 50
  store i64 %735, ptr %gas.remaining.addr, align 8
  br i1 %736, label %return, label %OP834.JUMPDEST.contd, !prof !2, !annotation !3

OP834.JUMPDEST.contd:                             ; preds = %OP834.JUMPDEST
  %dup22973 = load i256, ptr %sp2972, align 16
  store i256 %dup22973, ptr %732, align 16
  %737 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %732, i8 19)
  %.not7405 = icmp eq i8 %737, 0
  br i1 %.not7405, label %OP837.DUP2, label %return, !prof !7

OP837.DUP2:                                       ; preds = %OP834.JUMPDEST.contd
  %dup22979 = load i256, ptr %sp2978, align 16
  store i256 %dup22979, ptr %sp2980, align 16
  %b2985 = load i256, ptr %732, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !107)
  %ecx.memory.i7737 = load ptr, ptr %ecx.memory.addr.i7736, align 8, !alias.scope !107
  %ecx.memory.len.addr.i7738 = getelementptr inbounds i8, ptr %ecx.memory.i7737, i64 16
  %ecx.memory.len.i7739 = load i64, ptr %ecx.memory.len.addr.i7738, align 8, !noalias !107
  %ecx.memory.last_checkpoint.addr.i7740 = getelementptr inbounds i8, ptr %ecx.memory.i7737, i64 48
  %ecx.memory.last_checkpoint.i7741 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7740, align 8, !noalias !107
  %738 = sub i64 %ecx.memory.len.i7739, %ecx.memory.last_checkpoint.i7741
  %739 = icmp ugt i256 %dup22979, 18446744073709551615
  %740 = trunc i256 %dup22979 to i64
  %741 = add i64 %740, 32
  %742 = icmp ugt i64 %740, -33
  %743 = or i1 %739, %742
  %744 = select i1 %743, i64 -1, i64 %741
  %745 = icmp ugt i64 %744, %738
  br i1 %745, label %resize.i7748, label %OP839.SWAP1, !prof !2

resize.i7748:                                     ; preds = %OP837.DUP2
  %746 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %744)
  %.not.i7749 = icmp eq i8 %746, 0
  br i1 %.not.i7749, label %OP839.SWAP1, label %return, !prof !7

OP839.SWAP1:                                      ; preds = %OP837.DUP2, %resize.i7748
  %ecx.memory.buffer.ptr.shared.addr.i7743 = getelementptr inbounds i8, ptr %ecx.memory.i7737, i64 8
  %ecx.memory.buffer.ptr.shared.i7744 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7743, align 8, !noalias !107
  %ecx.memory.buffer.ptr.i7745 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7744, i64 %ecx.memory.last_checkpoint.i7741
  %slot.i7746 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7745, i64 %740
  %747 = tail call i256 @llvm.bswap.i256(i256 %b2985)
  store i256 %747, ptr %slot.i7746, align 1, !noalias !107
  %swap.a2988 = load i256, ptr %sp2978, align 16
  %swap.b2990 = load i256, ptr %sp2972, align 16
  %748 = add i256 %swap.b2990, 1
  store i256 %748, ptr %sp2972, align 16
  %749 = add i256 %swap.a2988, 32
  store i256 %749, ptr %sp2978, align 16
  %dup43018 = load i256, ptr %sp3017, align 16
  store i256 %dup43018, ptr %sp2980, align 16
  %750 = icmp ugt i256 %dup43018, %749
  %751 = zext i1 %750 to i256
  store i256 %751, ptr %732, align 16
  br i1 %750, label %OP834.JUMPDEST, label %OP850.DUP3

OP850.DUP3:                                       ; preds = %OP839.SWAP1
  %gas.remaining3029 = load i64, ptr %gas.remaining.addr, align 8
  %752 = add i64 %gas.remaining3029, -24
  %753 = icmp ult i64 %gas.remaining3029, 24
  store i64 %752, ptr %gas.remaining.addr, align 8
  br i1 %753, label %return, label %OP850.DUP3.contd3031, !prof !2, !annotation !3

OP850.DUP3.contd3031:                             ; preds = %OP850.DUP3
  %754 = sub i256 %swap.a2988, %dup43018
  %755 = and i256 %754, 31
  store i256 %dup43018, ptr %732, align 16
  %756 = add i256 %755, %dup43018
  store i256 %756, ptr %sp3017, align 16
  store i256 %dup43018, ptr %sp2978, align 16
  br label %OP858.JUMPDEST, !annotation !10

OP858.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP850.DUP3.contd3031, %OP817.SWAP2, %OP788.PUSH1
  %gas.remaining3069 = phi i64 [ %752, %OP850.DUP3.contd3031 ], [ %gas.remaining3069.pre8992, %OP788.PUSH1 ], [ %gas.remaining3069.pre, %OP817.SWAP2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.32 = phi i64 [ %len.addr.31.ph.fr, %OP850.DUP3.contd3031 ], [ %673, %OP788.PUSH1 ], [ %673, %OP817.SWAP2 ], [ %len.addr.51, %dynamic_jump_table ]
  %757 = add i64 %gas.remaining3069, -22
  %758 = icmp ult i64 %gas.remaining3069, 22
  store i64 %757, ptr %gas.remaining.addr, align 8
  br i1 %758, label %return, label %OP858.JUMPDEST.contd, !prof !2, !annotation !3

OP858.JUMPDEST.contd:                             ; preds = %OP858.JUMPDEST
  %759 = icmp ult i64 %len.addr.32, 7
  br i1 %759, label %return, label %OP859.POP, !prof !2, !annotation !21

OP859.POP:                                        ; preds = %OP858.JUMPDEST.contd
  %760 = add i64 %len.addr.32, -5
  %761 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.32
  %sp3078 = getelementptr i256, ptr %761, i64 -7
  %dup23079 = load i256, ptr %sp3078, align 16
  %sp3080 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %760
  store i256 %dup23079, ptr %sp3080, align 16
  br label %dynamic_jump_table.preheader

OP866.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP201.PUSH2
  %gas.remaining3084 = phi i64 [ %202, %OP201.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.33 = phi i64 [ %205, %OP201.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %762 = add i64 %gas.remaining3084, -171
  %763 = icmp ult i64 %gas.remaining3084, 171
  store i64 %762, ptr %gas.remaining.addr, align 8
  br i1 %763, label %return, label %OP866.JUMPDEST.contd, !prof !2, !annotation !3

OP866.JUMPDEST.contd:                             ; preds = %OP866.JUMPDEST
  %764 = icmp ult i64 %len.addr.33, 2
  %765 = add i64 %len.addr.33, -1019
  %766 = icmp ult i64 %765, -1017
  %767 = select i1 %764, i8 91, i8 92
  br i1 %766, label %return, label %OP867.PUSH1, !prof !2

OP867.PUSH1:                                      ; preds = %OP866.JUMPDEST.contd
  %sp3088 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.33
  store i256 0, ptr %sp3088, align 16
  %768 = add nuw nsw i64 %len.addr.33, 2
  %sp3090 = getelementptr i256, ptr %sp3088, i64 -1
  %dup23091 = load i256, ptr %sp3090, align 16
  %sp3092 = getelementptr i256, ptr %sp3088, i64 1
  store i256 %dup23091, ptr %sp3092, align 16
  %769 = add nuw nsw i64 %len.addr.33, 3
  %sp3094 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %768
  store i256 4, ptr %sp3094, align 16
  %770 = add nuw nsw i64 %len.addr.33, 4
  %sp3096 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %769
  store i256 0, ptr %sp3096, align 16
  %contract.caller.addr3098 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3099 = load i160, ptr %contract.caller.addr3098, align 16
  %771 = tail call i160 @llvm.bswap.i160(i160 %contract.caller3099)
  %772 = zext i160 %771 to i256
  %sp3100 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %770
  %773 = add nuw nsw i64 %len.addr.33, 6
  %sp3102 = getelementptr i256, ptr %sp3088, i64 5
  store i256 %772, ptr %sp3100, align 16
  store i256 0, ptr %sp3102, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !110)
  %ecx.memory.addr.i7751 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7752 = load ptr, ptr %ecx.memory.addr.i7751, align 8, !alias.scope !110
  %ecx.memory.len.addr.i7753 = getelementptr inbounds i8, ptr %ecx.memory.i7752, i64 16
  %ecx.memory.len.i7754 = load i64, ptr %ecx.memory.len.addr.i7753, align 8, !noalias !110
  %ecx.memory.last_checkpoint.addr.i7755 = getelementptr inbounds i8, ptr %ecx.memory.i7752, i64 48
  %ecx.memory.last_checkpoint.i7756 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7755, align 8, !noalias !110
  %774 = sub i64 %ecx.memory.len.i7754, %ecx.memory.last_checkpoint.i7756
  %775 = icmp ult i64 %774, 32
  br i1 %775, label %resize.i7763, label %OP878.PUSH1, !prof !2

resize.i7763:                                     ; preds = %OP867.PUSH1
  %776 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7764 = icmp eq i8 %776, 0
  br i1 %.not.i7764, label %OP878.PUSH1, label %return, !prof !7

OP878.PUSH1:                                      ; preds = %OP867.PUSH1, %resize.i7763
  %ecx.memory.buffer.ptr.shared.addr.i7758 = getelementptr inbounds i8, ptr %ecx.memory.i7752, i64 8
  %ecx.memory.buffer.ptr.shared.i7759 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7758, align 8, !noalias !110
  %ecx.memory.buffer.ptr.i7760 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7759, i64 %ecx.memory.last_checkpoint.i7756
  %777 = tail call i256 @llvm.bswap.i256(i256 %772)
  store i256 %777, ptr %ecx.memory.buffer.ptr.i7760, align 1, !noalias !110
  %b3132 = load i256, ptr %sp3096, align 16
  %778 = add i256 %b3132, 32
  %swap.b3138 = load i256, ptr %sp3094, align 16
  store i256 %778, ptr %sp3094, align 16
  store i256 %swap.b3138, ptr %sp3096, align 16
  store i256 %778, ptr %sp3100, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !113)
  %ecx.memory.i7767 = load ptr, ptr %ecx.memory.addr.i7751, align 8, !alias.scope !113
  %ecx.memory.len.addr.i7768 = getelementptr inbounds i8, ptr %ecx.memory.i7767, i64 16
  %ecx.memory.len.i7769 = load i64, ptr %ecx.memory.len.addr.i7768, align 8, !noalias !113
  %ecx.memory.last_checkpoint.addr.i7770 = getelementptr inbounds i8, ptr %ecx.memory.i7767, i64 48
  %ecx.memory.last_checkpoint.i7771 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7770, align 8, !noalias !113
  %779 = sub i64 %ecx.memory.len.i7769, %ecx.memory.last_checkpoint.i7771
  %780 = icmp ugt i256 %778, 18446744073709551615
  %781 = trunc i256 %778 to i64
  %782 = add i64 %781, 32
  %783 = icmp ugt i64 %781, -33
  %784 = or i1 %780, %783
  %785 = select i1 %784, i64 -1, i64 %782
  %786 = icmp ugt i64 %785, %779
  br i1 %786, label %resize.i7778, label %OP883.PUSH1, !prof !2

resize.i7778:                                     ; preds = %OP878.PUSH1
  %787 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %785)
  %.not.i7779 = icmp eq i8 %787, 0
  br i1 %.not.i7779, label %OP883.PUSH1, label %return, !prof !7

OP883.PUSH1:                                      ; preds = %OP878.PUSH1, %resize.i7778
  %ecx.memory.buffer.ptr.shared.addr.i7773 = getelementptr inbounds i8, ptr %ecx.memory.i7767, i64 8
  %ecx.memory.buffer.ptr.shared.i7774 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7773, align 8, !noalias !113
  %ecx.memory.buffer.ptr.i7775 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7774, i64 %ecx.memory.last_checkpoint.i7771
  %slot.i7776 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7775, i64 %781
  %788 = tail call i256 @llvm.bswap.i256(i256 %swap.b3138)
  store i256 %788, ptr %slot.i7776, align 1, !noalias !113
  %b3154 = load i256, ptr %sp3094, align 16
  %789 = add i256 %b3154, 32
  store i256 %789, ptr %sp3094, align 16
  store i256 0, ptr %sp3096, align 16
  %790 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3094)
  %.not7374 = icmp eq i8 %790, 0
  br i1 %.not7374, label %OP887.PUSH1, label %return, !prof !7

OP887.PUSH1:                                      ; preds = %OP883.PUSH1
  store i256 0, ptr %sp3096, align 16
  %sp3163 = getelementptr i256, ptr %sp3088, i64 -2
  %dup6 = load i256, ptr %sp3163, align 16
  %791 = and i256 %dup6, 1461501637330902918203684832716283019655932542975
  store i256 %791, ptr %sp3100, align 16
  store i256 0, ptr %sp3102, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !116)
  %ecx.memory.i7782 = load ptr, ptr %ecx.memory.addr.i7751, align 8, !alias.scope !116
  %ecx.memory.len.addr.i7783 = getelementptr inbounds i8, ptr %ecx.memory.i7782, i64 16
  %ecx.memory.len.i7784 = load i64, ptr %ecx.memory.len.addr.i7783, align 8, !noalias !116
  %ecx.memory.last_checkpoint.addr.i7785 = getelementptr inbounds i8, ptr %ecx.memory.i7782, i64 48
  %ecx.memory.last_checkpoint.i7786 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7785, align 8, !noalias !116
  %792 = sub i64 %ecx.memory.len.i7784, %ecx.memory.last_checkpoint.i7786
  %793 = icmp ult i64 %792, 32
  br i1 %793, label %resize.i7793, label %OP895.PUSH1, !prof !2

resize.i7793:                                     ; preds = %OP887.PUSH1
  %794 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7794 = icmp eq i8 %794, 0
  br i1 %.not.i7794, label %OP895.PUSH1, label %return, !prof !7

OP895.PUSH1:                                      ; preds = %OP887.PUSH1, %resize.i7793
  %ecx.memory.buffer.ptr.shared.addr.i7788 = getelementptr inbounds i8, ptr %ecx.memory.i7782, i64 8
  %ecx.memory.buffer.ptr.shared.i7789 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7788, align 8, !noalias !116
  %ecx.memory.buffer.ptr.i7790 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7789, i64 %ecx.memory.last_checkpoint.i7786
  %795 = tail call i256 @llvm.bswap.i256(i256 %791)
  store i256 %795, ptr %ecx.memory.buffer.ptr.i7790, align 1, !noalias !116
  %b3196 = load i256, ptr %sp3096, align 16
  %796 = add i256 %b3196, 32
  %swap.b3202 = load i256, ptr %sp3094, align 16
  store i256 %796, ptr %sp3094, align 16
  store i256 %swap.b3202, ptr %sp3096, align 16
  store i256 %796, ptr %sp3100, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !119)
  %ecx.memory.i7797 = load ptr, ptr %ecx.memory.addr.i7751, align 8, !alias.scope !119
  %ecx.memory.len.addr.i7798 = getelementptr inbounds i8, ptr %ecx.memory.i7797, i64 16
  %ecx.memory.len.i7799 = load i64, ptr %ecx.memory.len.addr.i7798, align 8, !noalias !119
  %ecx.memory.last_checkpoint.addr.i7800 = getelementptr inbounds i8, ptr %ecx.memory.i7797, i64 48
  %ecx.memory.last_checkpoint.i7801 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7800, align 8, !noalias !119
  %797 = sub i64 %ecx.memory.len.i7799, %ecx.memory.last_checkpoint.i7801
  %798 = icmp ugt i256 %796, 18446744073709551615
  %799 = trunc i256 %796 to i64
  %800 = add i64 %799, 32
  %801 = icmp ugt i64 %799, -33
  %802 = or i1 %798, %801
  %803 = select i1 %802, i64 -1, i64 %800
  %804 = icmp ugt i64 %803, %797
  br i1 %804, label %resize.i7808, label %OP900.PUSH1, !prof !2

resize.i7808:                                     ; preds = %OP895.PUSH1
  %805 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %803)
  %.not.i7809 = icmp eq i8 %805, 0
  br i1 %.not.i7809, label %OP900.PUSH1, label %return, !prof !7

OP900.PUSH1:                                      ; preds = %OP895.PUSH1, %resize.i7808
  %ecx.memory.buffer.ptr.shared.addr.i7803 = getelementptr inbounds i8, ptr %ecx.memory.i7797, i64 8
  %ecx.memory.buffer.ptr.shared.i7804 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7803, align 8, !noalias !119
  %ecx.memory.buffer.ptr.i7805 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7804, i64 %ecx.memory.last_checkpoint.i7801
  %slot.i7806 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7805, i64 %799
  %806 = tail call i256 @llvm.bswap.i256(i256 %swap.b3202)
  store i256 %806, ptr %slot.i7806, align 1, !noalias !119
  %b3218 = load i256, ptr %sp3094, align 16
  %807 = add i256 %b3218, 32
  store i256 %807, ptr %sp3094, align 16
  store i256 0, ptr %sp3096, align 16
  %808 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3094)
  %.not7377 = icmp eq i8 %808, 0
  br i1 %.not7377, label %OP904.DUP2, label %return, !prof !7

OP904.DUP2:                                       ; preds = %OP900.PUSH1
  %dup23226 = load i256, ptr %sp3092, align 16
  %swap.b3232 = load i256, ptr %sp3094, align 16
  store i256 %dup23226, ptr %sp3094, align 16
  store i256 %swap.b3232, ptr %sp3096, align 16
  %809 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3094, i8 19)
  %.not7378 = icmp eq i8 %809, 0
  br i1 %.not7378, label %OP907.POP, label %return, !prof !7

OP907.POP:                                        ; preds = %OP904.DUP2
  %gas.remaining3235 = load i64, ptr %gas.remaining.addr, align 8
  %810 = add i64 %gas.remaining3235, -1600
  %811 = icmp ult i64 %gas.remaining3235, 1600
  store i64 %810, ptr %gas.remaining.addr, align 8
  br i1 %811, label %return, label %OP907.POP.contd, !prof !2, !annotation !3

OP907.POP.contd:                                  ; preds = %OP907.POP
  %812 = icmp ult i64 %len.addr.33, 3
  %813 = add nsw i64 %len.addr.33, -1016
  %814 = icmp ult i64 %813, -1013
  %815 = select i1 %812, i8 91, i8 92
  br i1 %814, label %return, label %OP907.POP.contd3237, !prof !2

OP907.POP.contd3237:                              ; preds = %OP907.POP.contd
  %dup33240 = load i256, ptr %sp3163, align 16
  %816 = and i256 %dup33240, 1461501637330902918203684832716283019655932542975
  store i256 %816, ptr %sp3092, align 16
  store i256 %772, ptr %sp3094, align 16
  store i256 -52305948261162578668367882225327028569797882979485679342215860919519743330011, ptr %sp3096, align 16
  %dup53266 = load i256, ptr %sp3090, align 16
  store i256 %dup53266, ptr %sp3100, align 16
  store i256 64, ptr %sp3102, align 16
  %ecx.memory.i7812 = load ptr, ptr %ecx.memory.addr.i7751, align 8
  %ecx.memory.len.addr.i7813 = getelementptr inbounds i8, ptr %ecx.memory.i7812, i64 16
  %ecx.memory.len.i7814 = load i64, ptr %ecx.memory.len.addr.i7813, align 8, !noalias !122
  %ecx.memory.last_checkpoint.addr.i7815 = getelementptr inbounds i8, ptr %ecx.memory.i7812, i64 48
  %ecx.memory.last_checkpoint.i7816 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7815, align 8, !noalias !122
  %817 = sub i64 %ecx.memory.len.i7814, %ecx.memory.last_checkpoint.i7816
  %818 = icmp ult i64 %817, 96
  br i1 %818, label %resize.i7824, label %OP917.MLOAD.contd, !prof !2

resize.i7824:                                     ; preds = %OP907.POP.contd3237
  %819 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !126
  %.not.i7825 = icmp eq i8 %819, 0
  br i1 %.not.i7825, label %resize.i7824.OP917.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7824.OP917.MLOAD.contd_crit_edge:         ; preds = %resize.i7824
  %dup33282.pre = load i256, ptr %sp3100, align 16
  %ecx.memory.i7828.pre = load ptr, ptr %ecx.memory.addr.i7751, align 8, !alias.scope !127
  br label %OP917.MLOAD.contd

OP917.MLOAD.contd:                                ; preds = %resize.i7824.OP917.MLOAD.contd_crit_edge, %OP907.POP.contd3237
  %ecx.memory.i7828 = phi ptr [ %ecx.memory.i7828.pre, %resize.i7824.OP917.MLOAD.contd_crit_edge ], [ %ecx.memory.i7812, %OP907.POP.contd3237 ]
  %dup33282 = phi i256 [ %dup33282.pre, %resize.i7824.OP917.MLOAD.contd_crit_edge ], [ %dup53266, %OP907.POP.contd3237 ]
  %ecx.memory.buffer.ptr.shared.addr.i7818 = getelementptr inbounds i8, ptr %ecx.memory.i7812, i64 8
  %ecx.memory.buffer.ptr.shared.i7819 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7818, align 8, !noalias !122
  %ecx.memory.buffer.ptr.i7820 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7819, i64 %ecx.memory.last_checkpoint.i7816
  %slot.i7821 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7820, i64 64
  %slot.value.i7822 = load i256, ptr %slot.i7821, align 1, !noalias !122
  %820 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7822)
  store i256 %820, ptr %sp3102, align 16
  %821 = add nuw nsw i64 %len.addr.33, 7
  %sp3279 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %773
  store i256 %820, ptr %sp3279, align 16
  %sp3283 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %821
  store i256 %dup33282, ptr %sp3283, align 16
  %sp3287 = getelementptr i256, ptr %sp3088, i64 8
  store i256 %820, ptr %sp3287, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !127)
  %ecx.memory.len.addr.i7829 = getelementptr inbounds i8, ptr %ecx.memory.i7828, i64 16
  %ecx.memory.len.i7830 = load i64, ptr %ecx.memory.len.addr.i7829, align 8, !noalias !127
  %ecx.memory.last_checkpoint.addr.i7831 = getelementptr inbounds i8, ptr %ecx.memory.i7828, i64 48
  %ecx.memory.last_checkpoint.i7832 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7831, align 8, !noalias !127
  %822 = sub i64 %ecx.memory.len.i7830, %ecx.memory.last_checkpoint.i7832
  %823 = icmp ugt i256 %820, 18446744073709551615
  %824 = trunc i256 %820 to i64
  %825 = add i64 %824, 32
  %826 = icmp ugt i64 %824, -33
  %827 = or i1 %823, %826
  %828 = select i1 %827, i64 -1, i64 %825
  %829 = icmp ugt i64 %828, %822
  br i1 %829, label %resize.i7839, label %OP922.PUSH1, !prof !2

resize.i7839:                                     ; preds = %OP917.MLOAD.contd
  %830 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %828)
  %.not.i7840 = icmp eq i8 %830, 0
  br i1 %.not.i7840, label %OP922.PUSH1, label %return, !prof !7

OP922.PUSH1:                                      ; preds = %OP917.MLOAD.contd, %resize.i7839
  %ecx.memory.buffer.ptr.shared.addr.i7834 = getelementptr inbounds i8, ptr %ecx.memory.i7828, i64 8
  %ecx.memory.buffer.ptr.shared.i7835 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7834, align 8, !noalias !127
  %ecx.memory.buffer.ptr.i7836 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7835, i64 %ecx.memory.last_checkpoint.i7832
  %slot.i7837 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7836, i64 %824
  %831 = tail call i256 @llvm.bswap.i256(i256 %dup33282)
  store i256 %831, ptr %slot.i7837, align 1, !noalias !127
  store i256 32, ptr %sp3283, align 16
  %b3299 = load i256, ptr %sp3279, align 16
  %832 = add i256 %b3299, 32
  %swap.b3305 = load i256, ptr %sp3100, align 16
  store i256 %832, ptr %sp3100, align 16
  store i256 %swap.b3305, ptr %sp3279, align 16
  store i256 64, ptr %sp3102, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !130)
  %ecx.memory.i7843 = load ptr, ptr %ecx.memory.addr.i7751, align 8, !alias.scope !130, !noalias !133
  %ecx.memory.len.addr.i7844 = getelementptr inbounds i8, ptr %ecx.memory.i7843, i64 16
  %ecx.memory.len.i7845 = load i64, ptr %ecx.memory.len.addr.i7844, align 8, !noalias !135
  %ecx.memory.last_checkpoint.addr.i7846 = getelementptr inbounds i8, ptr %ecx.memory.i7843, i64 48
  %ecx.memory.last_checkpoint.i7847 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7846, align 8, !noalias !135
  %833 = sub i64 %ecx.memory.len.i7845, %ecx.memory.last_checkpoint.i7847
  %834 = icmp ult i64 %833, 96
  br i1 %834, label %resize.i7855, label %OP928.MLOAD.contd, !prof !2

resize.i7855:                                     ; preds = %OP922.PUSH1
  %835 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !133
  %.not.i7856 = icmp eq i8 %835, 0
  br i1 %.not.i7856, label %resize.i7855.OP928.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i7855.OP928.MLOAD.contd_crit_edge:         ; preds = %resize.i7855
  %swap.b3324.pre = load i256, ptr %sp3100, align 16
  br label %OP928.MLOAD.contd

OP928.MLOAD.contd:                                ; preds = %resize.i7855.OP928.MLOAD.contd_crit_edge, %OP922.PUSH1
  %swap.b3324 = phi i256 [ %swap.b3324.pre, %resize.i7855.OP928.MLOAD.contd_crit_edge ], [ %832, %OP922.PUSH1 ]
  %ecx.memory.buffer.ptr.shared.addr.i7849 = getelementptr inbounds i8, ptr %ecx.memory.i7843, i64 8
  %ecx.memory.buffer.ptr.shared.i7850 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7849, align 8, !noalias !135
  %ecx.memory.buffer.ptr.i7851 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7850, i64 %ecx.memory.last_checkpoint.i7847
  %slot.i7852 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7851, i64 64
  %slot.value.i7853 = load i256, ptr %slot.i7852, align 1, !noalias !135
  %836 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i7853)
  store i256 %swap.b3324, ptr %sp3279, align 16
  %837 = sub i256 %swap.b3324, %836
  store i256 %837, ptr %sp3100, align 16
  store i256 %836, ptr %sp3102, align 16
  %838 = add nuw nsw i64 %len.addr.33, 1
  %839 = tail call i8 @__revmc_builtin_log(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3092, i8 3)
  %.not7382 = icmp eq i8 %839, 0
  br i1 %.not7382, label %OP934.PUSH1, label %return, !prof !7

OP934.PUSH1:                                      ; preds = %OP928.MLOAD.contd
  %sp3339 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %838
  %swap.b3344 = load i256, ptr %sp3088, align 16
  store i256 %swap.b3344, ptr %sp3339, align 16
  %sp3349 = getelementptr i256, ptr %sp3088, i64 -3
  %swap.b3350 = load i256, ptr %sp3349, align 16
  store i256 1, ptr %sp3349, align 16
  %swap.b3355 = load i256, ptr %sp3163, align 16
  store i256 %swap.b3350, ptr %sp3163, align 16
  store i256 %swap.b3355, ptr %sp3088, align 16
  %840 = add nsw i64 %len.addr.33, -2
  br label %dynamic_jump_table.preheader

OP942.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP258.PUSH2
  %gas.remaining3361 = phi i64 [ %238, %OP258.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.34 = phi i64 [ %241, %OP258.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %841 = add i64 %gas.remaining3361, -28
  %842 = icmp ult i64 %gas.remaining3361, 28
  store i64 %841, ptr %gas.remaining.addr, align 8
  br i1 %842, label %return, label %OP942.JUMPDEST.contd, !prof !2, !annotation !3

OP942.JUMPDEST.contd:                             ; preds = %OP942.JUMPDEST
  %843 = icmp eq i64 %len.addr.34, 0
  %844 = add i64 %len.addr.34, -1022
  %845 = icmp ult i64 %844, -1021
  %846 = select i1 %843, i8 91, i8 92
  br i1 %845, label %return, label %OP943.PUSH1, !prof !2

OP943.PUSH1:                                      ; preds = %OP942.JUMPDEST.contd
  %sp3365 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 0, ptr %sp3365, align 16
  %847 = add nuw nsw i64 %len.addr.34, 2
  %contract.target_address.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 128
  %contract.target_address = load i160, ptr %contract.target_address.addr, align 16
  %848 = tail call i160 @llvm.bswap.i160(i160 %contract.target_address)
  %849 = zext i160 %848 to i256
  %sp3367 = getelementptr i256, ptr %sp3365, i64 1
  %sp3369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %847
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3369, align 16
  store i256 %849, ptr %sp3367, align 16
  %850 = tail call i8 @__revmc_builtin_balance(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3367, i8 19)
  %.not7365 = icmp eq i8 %850, 0
  br i1 %.not7365, label %OP948.SWAP1, label %return, !prof !7

OP948.SWAP1:                                      ; preds = %OP943.PUSH1
  %swap.a3380 = load i256, ptr %sp3367, align 16
  %swap.b3382 = load i256, ptr %sp3365, align 16
  store i256 %swap.b3382, ptr %sp3367, align 16
  %sp3387 = getelementptr i256, ptr %sp3365, i64 -1
  %swap.b3388 = load i256, ptr %sp3387, align 16
  store i256 %swap.a3380, ptr %sp3387, align 16
  store i256 %swap.b3388, ptr %sp3365, align 16
  br label %dynamic_jump_table.preheader

OP952.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP1512.PUSH1, %OP289.PUSH2
  %gas.remaining3392 = phi i64 [ %1419, %OP1512.PUSH1 ], [ %268, %OP289.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.35 = phi i64 [ %1427, %OP1512.PUSH1 ], [ %271, %OP289.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %851 = add i64 %gas.remaining3392, -113
  %852 = icmp ult i64 %gas.remaining3392, 113
  store i64 %851, ptr %gas.remaining.addr, align 8
  br i1 %852, label %return, label %OP952.JUMPDEST.contd, !prof !2, !annotation !3

OP952.JUMPDEST.contd:                             ; preds = %OP952.JUMPDEST
  %853 = icmp ult i64 %len.addr.35, 3
  %854 = add i64 %len.addr.35, -1019
  %855 = icmp ult i64 %854, -1016
  %856 = select i1 %853, i8 91, i8 92
  br i1 %855, label %return, label %OP953.PUSH1, !prof !2

OP953.PUSH1:                                      ; preds = %OP952.JUMPDEST.contd
  %857 = add nuw nsw i64 %len.addr.35, 1
  %sp3396 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.35
  store i256 0, ptr %sp3396, align 16
  %sp3398 = getelementptr i256, ptr %sp3396, i64 -1
  %dup23399 = load i256, ptr %sp3398, align 16
  %sp3400 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %857
  store i256 %dup23399, ptr %sp3400, align 16
  %858 = add nuw nsw i64 %len.addr.35, 3
  %sp3402 = getelementptr i256, ptr %sp3396, i64 2
  store i256 3, ptr %sp3402, align 16
  %859 = add nuw nsw i64 %len.addr.35, 4
  %sp3404 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %858
  store i256 0, ptr %sp3404, align 16
  %sp3406 = getelementptr i256, ptr %sp3396, i64 -3
  %dup7 = load i256, ptr %sp3406, align 16
  %sp3407 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %859
  %sp3409 = getelementptr i256, ptr %sp3396, i64 5
  %860 = and i256 %dup7, 1461501637330902918203684832716283019655932542975
  store i256 %860, ptr %sp3407, align 16
  store i256 0, ptr %sp3409, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !136)
  %ecx.memory.addr.i7858 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7859 = load ptr, ptr %ecx.memory.addr.i7858, align 8, !alias.scope !136
  %ecx.memory.len.addr.i7860 = getelementptr inbounds i8, ptr %ecx.memory.i7859, i64 16
  %ecx.memory.len.i7861 = load i64, ptr %ecx.memory.len.addr.i7860, align 8, !noalias !136
  %ecx.memory.last_checkpoint.addr.i7862 = getelementptr inbounds i8, ptr %ecx.memory.i7859, i64 48
  %ecx.memory.last_checkpoint.i7863 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7862, align 8, !noalias !136
  %861 = sub i64 %ecx.memory.len.i7861, %ecx.memory.last_checkpoint.i7863
  %862 = icmp ult i64 %861, 32
  br i1 %862, label %resize.i7870, label %OP964.PUSH1, !prof !2

resize.i7870:                                     ; preds = %OP953.PUSH1
  %863 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7871 = icmp eq i8 %863, 0
  br i1 %.not.i7871, label %OP964.PUSH1, label %return, !prof !7

OP964.PUSH1:                                      ; preds = %OP953.PUSH1, %resize.i7870
  %ecx.memory.buffer.ptr.shared.addr.i7865 = getelementptr inbounds i8, ptr %ecx.memory.i7859, i64 8
  %ecx.memory.buffer.ptr.shared.i7866 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7865, align 8, !noalias !136
  %ecx.memory.buffer.ptr.i7867 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7866, i64 %ecx.memory.last_checkpoint.i7863
  %864 = tail call i256 @llvm.bswap.i256(i256 %860)
  store i256 %864, ptr %ecx.memory.buffer.ptr.i7867, align 1, !noalias !136
  %b3439 = load i256, ptr %sp3404, align 16
  %865 = add i256 %b3439, 32
  %swap.b3445 = load i256, ptr %sp3402, align 16
  store i256 %865, ptr %sp3402, align 16
  store i256 %swap.b3445, ptr %sp3404, align 16
  store i256 %865, ptr %sp3407, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !139)
  %ecx.memory.i7874 = load ptr, ptr %ecx.memory.addr.i7858, align 8, !alias.scope !139
  %ecx.memory.len.addr.i7875 = getelementptr inbounds i8, ptr %ecx.memory.i7874, i64 16
  %ecx.memory.len.i7876 = load i64, ptr %ecx.memory.len.addr.i7875, align 8, !noalias !139
  %ecx.memory.last_checkpoint.addr.i7877 = getelementptr inbounds i8, ptr %ecx.memory.i7874, i64 48
  %ecx.memory.last_checkpoint.i7878 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7877, align 8, !noalias !139
  %866 = sub i64 %ecx.memory.len.i7876, %ecx.memory.last_checkpoint.i7878
  %867 = icmp ugt i256 %865, 18446744073709551615
  %868 = trunc i256 %865 to i64
  %869 = add i64 %868, 32
  %870 = icmp ugt i64 %868, -33
  %871 = or i1 %867, %870
  %872 = select i1 %871, i64 -1, i64 %869
  %873 = icmp ugt i64 %872, %866
  br i1 %873, label %resize.i7885, label %OP969.PUSH1, !prof !2

resize.i7885:                                     ; preds = %OP964.PUSH1
  %874 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %872)
  %.not.i7886 = icmp eq i8 %874, 0
  br i1 %.not.i7886, label %OP969.PUSH1, label %return, !prof !7

OP969.PUSH1:                                      ; preds = %OP964.PUSH1, %resize.i7885
  %ecx.memory.buffer.ptr.shared.addr.i7880 = getelementptr inbounds i8, ptr %ecx.memory.i7874, i64 8
  %ecx.memory.buffer.ptr.shared.i7881 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7880, align 8, !noalias !139
  %ecx.memory.buffer.ptr.i7882 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7881, i64 %ecx.memory.last_checkpoint.i7878
  %slot.i7883 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7882, i64 %868
  %875 = tail call i256 @llvm.bswap.i256(i256 %swap.b3445)
  store i256 %875, ptr %slot.i7883, align 1, !noalias !139
  %b3461 = load i256, ptr %sp3402, align 16
  %876 = add i256 %b3461, 32
  store i256 %876, ptr %sp3402, align 16
  store i256 0, ptr %sp3404, align 16
  %877 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3402)
  %.not7318 = icmp eq i8 %877, 0
  br i1 %.not7318, label %OP973.SLOAD, label %return, !prof !7

OP973.SLOAD:                                      ; preds = %OP969.PUSH1
  %878 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3402, i8 19)
  %.not7319 = icmp eq i8 %878, 0
  br i1 %.not7319, label %OP974.LT, label %return, !prof !7

OP974.LT:                                         ; preds = %OP973.SLOAD
  %879 = load <2 x i256>, ptr %sp3400, align 16
  %880 = extractelement <2 x i256> %879, i64 0
  %881 = extractelement <2 x i256> %879, i64 1
  %.not7320 = icmp uge i256 %881, %880
  %882 = zext i1 %.not7320 to i256
  store i256 %882, ptr %sp3400, align 16
  %gas.remaining3500.pre = load i64, ptr %gas.remaining.addr, align 8
  br i1 %.not7320, label %OP983.JUMPDEST, label %OP980.PUSH1

OP980.PUSH1:                                      ; preds = %OP974.LT
  %883 = add i64 %gas.remaining3500.pre, -6
  %884 = icmp ult i64 %gas.remaining3500.pre, 6
  store i64 %883, ptr %gas.remaining.addr, align 8
  br i1 %884, label %return, label %OP980.PUSH1.contd3492, !prof !2, !annotation !3

OP980.PUSH1.contd3492:                            ; preds = %OP980.PUSH1
  store i256 0, ptr %sp3400, align 16
  store i256 0, ptr %sp3402, align 16
  %885 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3400, i8 16)
  %.not7321 = icmp eq i8 %885, 0
  %spec.select5563 = select i1 %.not7321, i8 16, i8 %885, !prof !7
  br label %return

OP983.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP974.LT
  %gas.remaining3500 = phi i64 [ %gas.remaining3500.pre, %OP974.LT ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.36 = phi i64 [ %857, %OP974.LT ], [ %len.addr.51, %dynamic_jump_table ]
  %886 = add i64 %gas.remaining3500, -43
  %887 = icmp ult i64 %gas.remaining3500, 43
  store i64 %886, ptr %gas.remaining.addr, align 8
  br i1 %887, label %return, label %OP983.JUMPDEST.contd, !prof !2, !annotation !3

OP983.JUMPDEST.contd:                             ; preds = %OP983.JUMPDEST
  %888 = icmp ult i64 %len.addr.36, 4
  %889 = add i64 %len.addr.36, -1022
  %890 = icmp ult i64 %889, -1018
  %891 = select i1 %888, i8 91, i8 92
  br i1 %890, label %return, label %OP984.CALLER, !prof !2

OP984.CALLER:                                     ; preds = %OP983.JUMPDEST.contd
  %892 = add nuw nsw i64 %len.addr.36, 1
  %contract.caller.addr3504 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3505 = load i160, ptr %contract.caller.addr3504, align 16
  %893 = tail call i160 @llvm.bswap.i160(i160 %contract.caller3505)
  %894 = zext i160 %893 to i256
  %sp3506 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.36
  %895 = add nuw nsw i64 %len.addr.36, 2
  %sp3508 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %892
  %sp3516 = getelementptr i256, ptr %sp3506, i64 -4
  %dup53517 = load i256, ptr %sp3516, align 16
  %896 = add nuw nsw i64 %len.addr.36, 3
  %sp3520 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %895
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp3520, align 16
  %897 = and i256 %dup53517, 1461501637330902918203684832716283019655932542975
  %898 = icmp ne i256 %897, %894
  %899 = zext i1 %898 to i256
  store i256 %899, ptr %sp3506, align 16
  %900 = xor i1 %898, true
  %901 = zext i1 %900 to i256
  store i256 %901, ptr %sp3508, align 16
  br i1 %898, label %OP996.POP, label %OP1036.JUMPDEST

OP996.POP:                                        ; preds = %OP984.CALLER
  %902 = add i64 %gas.remaining3500, -212
  %903 = icmp ult i64 %886, 169
  store i64 %902, ptr %gas.remaining.addr, align 8
  br i1 %903, label %return, label %OP996.POP.contd, !prof !2, !annotation !3

OP996.POP.contd:                                  ; preds = %OP996.POP
  %904 = icmp ugt i64 %len.addr.36, 1019
  br i1 %904, label %return, label %OP996.POP.contd3550, !prof !2

OP996.POP.contd3550:                              ; preds = %OP996.POP.contd
  store i256 -1, ptr %sp3506, align 16
  store i256 4, ptr %sp3508, align 16
  store i256 0, ptr %sp3520, align 16
  %sp3560 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %896
  %sp3562 = getelementptr i256, ptr %sp3506, i64 4
  store i256 %897, ptr %sp3560, align 16
  store i256 0, ptr %sp3562, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !142)
  %ecx.memory.addr.i7888 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7889 = load ptr, ptr %ecx.memory.addr.i7888, align 8, !alias.scope !142
  %ecx.memory.len.addr.i7890 = getelementptr inbounds i8, ptr %ecx.memory.i7889, i64 16
  %ecx.memory.len.i7891 = load i64, ptr %ecx.memory.len.addr.i7890, align 8, !noalias !142
  %ecx.memory.last_checkpoint.addr.i7892 = getelementptr inbounds i8, ptr %ecx.memory.i7889, i64 48
  %ecx.memory.last_checkpoint.i7893 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7892, align 8, !noalias !142
  %905 = sub i64 %ecx.memory.len.i7891, %ecx.memory.last_checkpoint.i7893
  %906 = icmp ult i64 %905, 32
  br i1 %906, label %resize.i7900, label %OP1007.PUSH1, !prof !2

resize.i7900:                                     ; preds = %OP996.POP.contd3550
  %907 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7901 = icmp eq i8 %907, 0
  br i1 %.not.i7901, label %OP1007.PUSH1, label %return, !prof !7

OP1007.PUSH1:                                     ; preds = %OP996.POP.contd3550, %resize.i7900
  %ecx.memory.buffer.ptr.shared.addr.i7895 = getelementptr inbounds i8, ptr %ecx.memory.i7889, i64 8
  %ecx.memory.buffer.ptr.shared.i7896 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7895, align 8, !noalias !142
  %ecx.memory.buffer.ptr.i7897 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7896, i64 %ecx.memory.last_checkpoint.i7893
  %908 = tail call i256 @llvm.bswap.i256(i256 %897)
  store i256 %908, ptr %ecx.memory.buffer.ptr.i7897, align 1, !noalias !142
  %b3592 = load i256, ptr %sp3520, align 16
  %909 = add i256 %b3592, 32
  %swap.b3598 = load i256, ptr %sp3508, align 16
  store i256 %909, ptr %sp3508, align 16
  store i256 %swap.b3598, ptr %sp3520, align 16
  store i256 %909, ptr %sp3560, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !145)
  %ecx.memory.i7904 = load ptr, ptr %ecx.memory.addr.i7888, align 8, !alias.scope !145
  %ecx.memory.len.addr.i7905 = getelementptr inbounds i8, ptr %ecx.memory.i7904, i64 16
  %ecx.memory.len.i7906 = load i64, ptr %ecx.memory.len.addr.i7905, align 8, !noalias !145
  %ecx.memory.last_checkpoint.addr.i7907 = getelementptr inbounds i8, ptr %ecx.memory.i7904, i64 48
  %ecx.memory.last_checkpoint.i7908 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7907, align 8, !noalias !145
  %910 = sub i64 %ecx.memory.len.i7906, %ecx.memory.last_checkpoint.i7908
  %911 = icmp ugt i256 %909, 18446744073709551615
  %912 = trunc i256 %909 to i64
  %913 = add i64 %912, 32
  %914 = icmp ugt i64 %912, -33
  %915 = or i1 %911, %914
  %916 = select i1 %915, i64 -1, i64 %913
  %917 = icmp ugt i64 %916, %910
  br i1 %917, label %resize.i7915, label %OP1012.PUSH1, !prof !2

resize.i7915:                                     ; preds = %OP1007.PUSH1
  %918 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %916)
  %.not.i7916 = icmp eq i8 %918, 0
  br i1 %.not.i7916, label %OP1012.PUSH1, label %return, !prof !7

OP1012.PUSH1:                                     ; preds = %OP1007.PUSH1, %resize.i7915
  %ecx.memory.buffer.ptr.shared.addr.i7910 = getelementptr inbounds i8, ptr %ecx.memory.i7904, i64 8
  %ecx.memory.buffer.ptr.shared.i7911 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7910, align 8, !noalias !145
  %ecx.memory.buffer.ptr.i7912 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7911, i64 %ecx.memory.last_checkpoint.i7908
  %slot.i7913 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7912, i64 %912
  %919 = tail call i256 @llvm.bswap.i256(i256 %swap.b3598)
  store i256 %919, ptr %slot.i7913, align 1, !noalias !145
  %b3614 = load i256, ptr %sp3508, align 16
  %920 = add i256 %b3614, 32
  store i256 %920, ptr %sp3508, align 16
  store i256 0, ptr %sp3520, align 16
  %921 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3508)
  %.not7324 = icmp eq i8 %921, 0
  br i1 %.not7324, label %OP1016.PUSH1, label %return, !prof !7

OP1016.PUSH1:                                     ; preds = %OP1012.PUSH1
  store i256 0, ptr %sp3520, align 16
  store i256 %894, ptr %sp3560, align 16
  store i256 0, ptr %sp3562, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !148)
  %ecx.memory.i7919 = load ptr, ptr %ecx.memory.addr.i7888, align 8, !alias.scope !148
  %ecx.memory.len.addr.i7920 = getelementptr inbounds i8, ptr %ecx.memory.i7919, i64 16
  %ecx.memory.len.i7921 = load i64, ptr %ecx.memory.len.addr.i7920, align 8, !noalias !148
  %ecx.memory.last_checkpoint.addr.i7922 = getelementptr inbounds i8, ptr %ecx.memory.i7919, i64 48
  %ecx.memory.last_checkpoint.i7923 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7922, align 8, !noalias !148
  %922 = sub i64 %ecx.memory.len.i7921, %ecx.memory.last_checkpoint.i7923
  %923 = icmp ult i64 %922, 32
  br i1 %923, label %resize.i7930, label %OP1024.PUSH1, !prof !2

resize.i7930:                                     ; preds = %OP1016.PUSH1
  %924 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7931 = icmp eq i8 %924, 0
  br i1 %.not.i7931, label %OP1024.PUSH1, label %return, !prof !7

OP1024.PUSH1:                                     ; preds = %OP1016.PUSH1, %resize.i7930
  %ecx.memory.buffer.ptr.shared.addr.i7925 = getelementptr inbounds i8, ptr %ecx.memory.i7919, i64 8
  %ecx.memory.buffer.ptr.shared.i7926 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7925, align 8, !noalias !148
  %ecx.memory.buffer.ptr.i7927 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7926, i64 %ecx.memory.last_checkpoint.i7923
  %925 = tail call i256 @llvm.bswap.i256(i256 %894)
  store i256 %925, ptr %ecx.memory.buffer.ptr.i7927, align 1, !noalias !148
  %b3657 = load i256, ptr %sp3520, align 16
  %926 = add i256 %b3657, 32
  %swap.b3663 = load i256, ptr %sp3508, align 16
  store i256 %926, ptr %sp3508, align 16
  store i256 %swap.b3663, ptr %sp3520, align 16
  store i256 %926, ptr %sp3560, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !151)
  %ecx.memory.i7934 = load ptr, ptr %ecx.memory.addr.i7888, align 8, !alias.scope !151
  %ecx.memory.len.addr.i7935 = getelementptr inbounds i8, ptr %ecx.memory.i7934, i64 16
  %ecx.memory.len.i7936 = load i64, ptr %ecx.memory.len.addr.i7935, align 8, !noalias !151
  %ecx.memory.last_checkpoint.addr.i7937 = getelementptr inbounds i8, ptr %ecx.memory.i7934, i64 48
  %ecx.memory.last_checkpoint.i7938 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7937, align 8, !noalias !151
  %927 = sub i64 %ecx.memory.len.i7936, %ecx.memory.last_checkpoint.i7938
  %928 = icmp ugt i256 %926, 18446744073709551615
  %929 = trunc i256 %926 to i64
  %930 = add i64 %929, 32
  %931 = icmp ugt i64 %929, -33
  %932 = or i1 %928, %931
  %933 = select i1 %932, i64 -1, i64 %930
  %934 = icmp ugt i64 %933, %927
  br i1 %934, label %resize.i7945, label %OP1029.PUSH1, !prof !2

resize.i7945:                                     ; preds = %OP1024.PUSH1
  %935 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %933)
  %.not.i7946 = icmp eq i8 %935, 0
  br i1 %.not.i7946, label %OP1029.PUSH1, label %return, !prof !7

OP1029.PUSH1:                                     ; preds = %OP1024.PUSH1, %resize.i7945
  %ecx.memory.buffer.ptr.shared.addr.i7940 = getelementptr inbounds i8, ptr %ecx.memory.i7934, i64 8
  %ecx.memory.buffer.ptr.shared.i7941 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7940, align 8, !noalias !151
  %ecx.memory.buffer.ptr.i7942 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7941, i64 %ecx.memory.last_checkpoint.i7938
  %slot.i7943 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7942, i64 %929
  %936 = tail call i256 @llvm.bswap.i256(i256 %swap.b3663)
  store i256 %936, ptr %slot.i7943, align 1, !noalias !151
  %b3679 = load i256, ptr %sp3508, align 16
  %937 = add i256 %b3679, 32
  store i256 %937, ptr %sp3508, align 16
  store i256 0, ptr %sp3520, align 16
  %938 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3508)
  %.not7327 = icmp eq i8 %938, 0
  br i1 %.not7327, label %OP1033.SLOAD, label %return, !prof !7

OP1033.SLOAD:                                     ; preds = %OP1029.PUSH1
  %939 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3508, i8 19)
  %.not7328 = icmp eq i8 %939, 0
  br i1 %.not7328, label %OP1034.EQ, label %return, !prof !7

OP1034.EQ:                                        ; preds = %OP1033.SLOAD
  %940 = load <2 x i256>, ptr %sp3506, align 16
  %941 = extractelement <2 x i256> %940, i64 0
  %942 = extractelement <2 x i256> %940, i64 1
  %943 = icmp ne i256 %942, %941
  %944 = zext i1 %943 to i256
  store i256 %944, ptr %sp3506, align 16
  %gas.remaining3697.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP1036.JUMPDEST, !annotation !10

OP1036.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1034.EQ, %OP984.CALLER
  %gas.remaining3697 = phi i64 [ %886, %OP984.CALLER ], [ %gas.remaining3697.pre, %OP1034.EQ ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.37 = phi i64 [ %892, %OP984.CALLER ], [ %892, %OP1034.EQ ], [ %len.addr.51, %dynamic_jump_table ]
  %945 = add i64 %gas.remaining3697, -17
  %946 = icmp ult i64 %gas.remaining3697, 17
  store i64 %945, ptr %gas.remaining.addr, align 8
  br i1 %946, label %return, label %OP1036.JUMPDEST.contd, !prof !2, !annotation !3

OP1036.JUMPDEST.contd:                            ; preds = %OP1036.JUMPDEST
  %947 = icmp eq i64 %len.addr.37, 0
  %948 = add i64 %len.addr.37, -1024
  %949 = icmp ult i64 %948, -1023
  %950 = select i1 %947, i8 91, i8 92
  br i1 %949, label %return, label %OP1037.ISZERO, !prof !2

OP1037.ISZERO:                                    ; preds = %OP1036.JUMPDEST.contd
  %951 = add nsw i64 %len.addr.37, -1
  %sp3701 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %951
  %a3702 = load i256, ptr %sp3701, align 16
  %952 = icmp eq i256 %a3702, 0
  %953 = zext i1 %952 to i256
  store i256 %953, ptr %sp3701, align 16
  br i1 %952, label %OP1135.JUMPDEST, label %OP1040.DUP2

OP1040.DUP2:                                      ; preds = %OP1037.ISZERO
  %954 = add i64 %gas.remaining3697, -203
  %955 = icmp ult i64 %945, 186
  store i64 %954, ptr %gas.remaining.addr, align 8
  br i1 %955, label %return, label %OP1040.DUP2.contd, !prof !2, !annotation !3

OP1040.DUP2.contd:                                ; preds = %OP1040.DUP2
  %956 = icmp ult i64 %951, 4
  %957 = add nsw i64 %len.addr.37, -1021
  %958 = icmp ult i64 %957, -1016
  %959 = select i1 %956, i8 91, i8 92
  br i1 %958, label %return, label %OP1040.DUP2.contd3709, !prof !2

OP1040.DUP2.contd3709:                            ; preds = %OP1040.DUP2.contd
  %960 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.37
  %sp3710 = getelementptr i256, ptr %960, i64 -3
  %dup23711 = load i256, ptr %sp3710, align 16
  store i256 %dup23711, ptr %sp3701, align 16
  %961 = add nuw nsw i64 %len.addr.37, 1
  store i256 4, ptr %960, align 16
  %962 = add nuw nsw i64 %len.addr.37, 2
  %sp3716 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %961
  store i256 0, ptr %sp3716, align 16
  %sp3718 = getelementptr i256, ptr %960, i64 -5
  %dup73719 = load i256, ptr %sp3718, align 16
  %sp3720 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %962
  %sp3722 = getelementptr i256, ptr %960, i64 3
  %963 = and i256 %dup73719, 1461501637330902918203684832716283019655932542975
  store i256 %963, ptr %sp3720, align 16
  store i256 0, ptr %sp3722, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !154)
  %ecx.memory.addr.i7948 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i7949 = load ptr, ptr %ecx.memory.addr.i7948, align 8, !alias.scope !154
  %ecx.memory.len.addr.i7950 = getelementptr inbounds i8, ptr %ecx.memory.i7949, i64 16
  %ecx.memory.len.i7951 = load i64, ptr %ecx.memory.len.addr.i7950, align 8, !noalias !154
  %ecx.memory.last_checkpoint.addr.i7952 = getelementptr inbounds i8, ptr %ecx.memory.i7949, i64 48
  %ecx.memory.last_checkpoint.i7953 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7952, align 8, !noalias !154
  %964 = sub i64 %ecx.memory.len.i7951, %ecx.memory.last_checkpoint.i7953
  %965 = icmp ult i64 %964, 32
  br i1 %965, label %resize.i7960, label %OP1050.PUSH1, !prof !2

resize.i7960:                                     ; preds = %OP1040.DUP2.contd3709
  %966 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7961 = icmp eq i8 %966, 0
  br i1 %.not.i7961, label %OP1050.PUSH1, label %return, !prof !7

OP1050.PUSH1:                                     ; preds = %OP1040.DUP2.contd3709, %resize.i7960
  %ecx.memory.buffer.ptr.shared.addr.i7955 = getelementptr inbounds i8, ptr %ecx.memory.i7949, i64 8
  %ecx.memory.buffer.ptr.shared.i7956 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7955, align 8, !noalias !154
  %ecx.memory.buffer.ptr.i7957 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7956, i64 %ecx.memory.last_checkpoint.i7953
  %967 = tail call i256 @llvm.bswap.i256(i256 %963)
  store i256 %967, ptr %ecx.memory.buffer.ptr.i7957, align 1, !noalias !154
  %b3752 = load i256, ptr %sp3716, align 16
  %968 = add i256 %b3752, 32
  %swap.b3758 = load i256, ptr %960, align 16
  store i256 %968, ptr %960, align 16
  store i256 %swap.b3758, ptr %sp3716, align 16
  store i256 %968, ptr %sp3720, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !157)
  %ecx.memory.i7964 = load ptr, ptr %ecx.memory.addr.i7948, align 8, !alias.scope !157
  %ecx.memory.len.addr.i7965 = getelementptr inbounds i8, ptr %ecx.memory.i7964, i64 16
  %ecx.memory.len.i7966 = load i64, ptr %ecx.memory.len.addr.i7965, align 8, !noalias !157
  %ecx.memory.last_checkpoint.addr.i7967 = getelementptr inbounds i8, ptr %ecx.memory.i7964, i64 48
  %ecx.memory.last_checkpoint.i7968 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7967, align 8, !noalias !157
  %969 = sub i64 %ecx.memory.len.i7966, %ecx.memory.last_checkpoint.i7968
  %970 = icmp ugt i256 %968, 18446744073709551615
  %971 = trunc i256 %968 to i64
  %972 = add i64 %971, 32
  %973 = icmp ugt i64 %971, -33
  %974 = or i1 %970, %973
  %975 = select i1 %974, i64 -1, i64 %972
  %976 = icmp ugt i64 %975, %969
  br i1 %976, label %resize.i7975, label %OP1055.PUSH1, !prof !2

resize.i7975:                                     ; preds = %OP1050.PUSH1
  %977 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %975)
  %.not.i7976 = icmp eq i8 %977, 0
  br i1 %.not.i7976, label %OP1055.PUSH1, label %return, !prof !7

OP1055.PUSH1:                                     ; preds = %OP1050.PUSH1, %resize.i7975
  %ecx.memory.buffer.ptr.shared.addr.i7970 = getelementptr inbounds i8, ptr %ecx.memory.i7964, i64 8
  %ecx.memory.buffer.ptr.shared.i7971 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7970, align 8, !noalias !157
  %ecx.memory.buffer.ptr.i7972 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7971, i64 %ecx.memory.last_checkpoint.i7968
  %slot.i7973 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i7972, i64 %971
  %978 = tail call i256 @llvm.bswap.i256(i256 %swap.b3758)
  store i256 %978, ptr %slot.i7973, align 1, !noalias !157
  %b3774 = load i256, ptr %960, align 16
  %979 = add i256 %b3774, 32
  store i256 %979, ptr %960, align 16
  store i256 0, ptr %sp3716, align 16
  %980 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %960)
  %.not7331 = icmp eq i8 %980, 0
  br i1 %.not7331, label %OP1059.PUSH1, label %return, !prof !7

OP1059.PUSH1:                                     ; preds = %OP1055.PUSH1
  store i256 0, ptr %sp3716, align 16
  %contract.caller.addr3783 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3784 = load i160, ptr %contract.caller.addr3783, align 16
  %981 = tail call i160 @llvm.bswap.i160(i160 %contract.caller3784)
  %982 = zext i160 %981 to i256
  store i256 %982, ptr %sp3720, align 16
  store i256 0, ptr %sp3722, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !160)
  %ecx.memory.i7979 = load ptr, ptr %ecx.memory.addr.i7948, align 8, !alias.scope !160
  %ecx.memory.len.addr.i7980 = getelementptr inbounds i8, ptr %ecx.memory.i7979, i64 16
  %ecx.memory.len.i7981 = load i64, ptr %ecx.memory.len.addr.i7980, align 8, !noalias !160
  %ecx.memory.last_checkpoint.addr.i7982 = getelementptr inbounds i8, ptr %ecx.memory.i7979, i64 48
  %ecx.memory.last_checkpoint.i7983 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7982, align 8, !noalias !160
  %983 = sub i64 %ecx.memory.len.i7981, %ecx.memory.last_checkpoint.i7983
  %984 = icmp ult i64 %983, 32
  br i1 %984, label %resize.i7990, label %OP1067.PUSH1, !prof !2

resize.i7990:                                     ; preds = %OP1059.PUSH1
  %985 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i7991 = icmp eq i8 %985, 0
  br i1 %.not.i7991, label %OP1067.PUSH1, label %return, !prof !7

OP1067.PUSH1:                                     ; preds = %OP1059.PUSH1, %resize.i7990
  %ecx.memory.buffer.ptr.shared.addr.i7985 = getelementptr inbounds i8, ptr %ecx.memory.i7979, i64 8
  %ecx.memory.buffer.ptr.shared.i7986 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i7985, align 8, !noalias !160
  %ecx.memory.buffer.ptr.i7987 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i7986, i64 %ecx.memory.last_checkpoint.i7983
  %986 = tail call i256 @llvm.bswap.i256(i256 %982)
  store i256 %986, ptr %ecx.memory.buffer.ptr.i7987, align 1, !noalias !160
  %b3817 = load i256, ptr %sp3716, align 16
  %987 = add i256 %b3817, 32
  %swap.b3823 = load i256, ptr %960, align 16
  store i256 %987, ptr %960, align 16
  store i256 %swap.b3823, ptr %sp3716, align 16
  store i256 %987, ptr %sp3720, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !163)
  %ecx.memory.i7994 = load ptr, ptr %ecx.memory.addr.i7948, align 8, !alias.scope !163
  %ecx.memory.len.addr.i7995 = getelementptr inbounds i8, ptr %ecx.memory.i7994, i64 16
  %ecx.memory.len.i7996 = load i64, ptr %ecx.memory.len.addr.i7995, align 8, !noalias !163
  %ecx.memory.last_checkpoint.addr.i7997 = getelementptr inbounds i8, ptr %ecx.memory.i7994, i64 48
  %ecx.memory.last_checkpoint.i7998 = load i64, ptr %ecx.memory.last_checkpoint.addr.i7997, align 8, !noalias !163
  %988 = sub i64 %ecx.memory.len.i7996, %ecx.memory.last_checkpoint.i7998
  %989 = icmp ugt i256 %987, 18446744073709551615
  %990 = trunc i256 %987 to i64
  %991 = add i64 %990, 32
  %992 = icmp ugt i64 %990, -33
  %993 = or i1 %989, %992
  %994 = select i1 %993, i64 -1, i64 %991
  %995 = icmp ugt i64 %994, %988
  br i1 %995, label %resize.i8005, label %OP1072.PUSH1, !prof !2

resize.i8005:                                     ; preds = %OP1067.PUSH1
  %996 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %994)
  %.not.i8006 = icmp eq i8 %996, 0
  br i1 %.not.i8006, label %OP1072.PUSH1, label %return, !prof !7

OP1072.PUSH1:                                     ; preds = %OP1067.PUSH1, %resize.i8005
  %ecx.memory.buffer.ptr.shared.addr.i8000 = getelementptr inbounds i8, ptr %ecx.memory.i7994, i64 8
  %ecx.memory.buffer.ptr.shared.i8001 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8000, align 8, !noalias !163
  %ecx.memory.buffer.ptr.i8002 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8001, i64 %ecx.memory.last_checkpoint.i7998
  %slot.i8003 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8002, i64 %990
  %997 = tail call i256 @llvm.bswap.i256(i256 %swap.b3823)
  store i256 %997, ptr %slot.i8003, align 1, !noalias !163
  %b3839 = load i256, ptr %960, align 16
  %998 = add i256 %b3839, 32
  store i256 %998, ptr %960, align 16
  store i256 0, ptr %sp3716, align 16
  %999 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %960)
  %.not7334 = icmp eq i8 %999, 0
  br i1 %.not7334, label %OP1076.SLOAD, label %return, !prof !7

OP1076.SLOAD:                                     ; preds = %OP1072.PUSH1
  %1000 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %960, i8 19)
  %.not7335 = icmp eq i8 %1000, 0
  br i1 %.not7335, label %OP1077.LT, label %return, !prof !7

OP1077.LT:                                        ; preds = %OP1076.SLOAD
  %1001 = load <2 x i256>, ptr %sp3701, align 16
  %1002 = extractelement <2 x i256> %1001, i64 0
  %1003 = extractelement <2 x i256> %1001, i64 1
  %1004 = icmp uge i256 %1003, %1002
  %1005 = zext i1 %1004 to i256
  store i256 %1005, ptr %sp3701, align 16
  %gas.remaining3878.pre = load i64, ptr %gas.remaining.addr, align 8
  br i1 %1004, label %OP1086.JUMPDEST, label %OP1083.PUSH1

OP1083.PUSH1:                                     ; preds = %OP1077.LT
  %1006 = add i64 %gas.remaining3878.pre, -6
  %1007 = icmp ult i64 %gas.remaining3878.pre, 6
  store i64 %1006, ptr %gas.remaining.addr, align 8
  br i1 %1007, label %return, label %OP1083.PUSH1.contd3870, !prof !2, !annotation !3

OP1083.PUSH1.contd3870:                           ; preds = %OP1083.PUSH1
  store i256 0, ptr %sp3701, align 16
  %sp3873 = getelementptr i256, ptr %960, i64 -1
  store i256 0, ptr %960, align 16
  %1008 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3873, i8 16)
  %.not7337 = icmp eq i8 %1008, 0
  %spec.select5564 = select i1 %.not7337, i8 16, i8 %1008, !prof !7
  br label %return

OP1086.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1077.LT
  %gas.remaining3878 = phi i64 [ %gas.remaining3878.pre, %OP1077.LT ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.38 = phi i64 [ %951, %OP1077.LT ], [ %len.addr.51, %dynamic_jump_table ]
  %1009 = add i64 %gas.remaining3878, -187
  %1010 = icmp ult i64 %gas.remaining3878, 187
  store i64 %1009, ptr %gas.remaining.addr, align 8
  br i1 %1010, label %return, label %OP1086.JUMPDEST.contd, !prof !2, !annotation !3

OP1086.JUMPDEST.contd:                            ; preds = %OP1086.JUMPDEST
  %1011 = icmp ult i64 %len.addr.38, 4
  %1012 = add i64 %len.addr.38, -1020
  %1013 = icmp ult i64 %1012, -1016
  %1014 = select i1 %1011, i8 91, i8 92
  br i1 %1013, label %return, label %OP1087.DUP2, !prof !2

OP1087.DUP2:                                      ; preds = %OP1086.JUMPDEST.contd
  %1015 = add nuw nsw i64 %len.addr.38, 1
  %1016 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.38
  %sp3882 = getelementptr i256, ptr %1016, i64 -2
  %dup23883 = load i256, ptr %sp3882, align 16
  store i256 %dup23883, ptr %1016, align 16
  %1017 = add nuw nsw i64 %len.addr.38, 2
  %sp3886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1015
  store i256 4, ptr %sp3886, align 16
  %1018 = add nuw nsw i64 %len.addr.38, 3
  %sp3888 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1017
  store i256 0, ptr %sp3888, align 16
  %sp3890 = getelementptr i256, ptr %1016, i64 -4
  %dup73891 = load i256, ptr %sp3890, align 16
  %sp3892 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1018
  %1019 = add nuw nsw i64 %len.addr.38, 5
  %sp3894 = getelementptr i256, ptr %1016, i64 4
  %1020 = and i256 %dup73891, 1461501637330902918203684832716283019655932542975
  store i256 %1020, ptr %sp3892, align 16
  store i256 0, ptr %sp3894, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !166)
  %ecx.memory.addr.i8008 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8009 = load ptr, ptr %ecx.memory.addr.i8008, align 8, !alias.scope !166
  %ecx.memory.len.addr.i8010 = getelementptr inbounds i8, ptr %ecx.memory.i8009, i64 16
  %ecx.memory.len.i8011 = load i64, ptr %ecx.memory.len.addr.i8010, align 8, !noalias !166
  %ecx.memory.last_checkpoint.addr.i8012 = getelementptr inbounds i8, ptr %ecx.memory.i8009, i64 48
  %ecx.memory.last_checkpoint.i8013 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8012, align 8, !noalias !166
  %1021 = sub i64 %ecx.memory.len.i8011, %ecx.memory.last_checkpoint.i8013
  %1022 = icmp ult i64 %1021, 32
  br i1 %1022, label %resize.i8020, label %OP1097.PUSH1, !prof !2

resize.i8020:                                     ; preds = %OP1087.DUP2
  %1023 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8021 = icmp eq i8 %1023, 0
  br i1 %.not.i8021, label %OP1097.PUSH1, label %return, !prof !7

OP1097.PUSH1:                                     ; preds = %OP1087.DUP2, %resize.i8020
  %ecx.memory.buffer.ptr.shared.addr.i8015 = getelementptr inbounds i8, ptr %ecx.memory.i8009, i64 8
  %ecx.memory.buffer.ptr.shared.i8016 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8015, align 8, !noalias !166
  %ecx.memory.buffer.ptr.i8017 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8016, i64 %ecx.memory.last_checkpoint.i8013
  %1024 = tail call i256 @llvm.bswap.i256(i256 %1020)
  store i256 %1024, ptr %ecx.memory.buffer.ptr.i8017, align 1, !noalias !166
  %b3924 = load i256, ptr %sp3888, align 16
  %1025 = add i256 %b3924, 32
  %swap.b3930 = load i256, ptr %sp3886, align 16
  store i256 %1025, ptr %sp3886, align 16
  store i256 %swap.b3930, ptr %sp3888, align 16
  store i256 %1025, ptr %sp3892, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !169)
  %ecx.memory.i8024 = load ptr, ptr %ecx.memory.addr.i8008, align 8, !alias.scope !169
  %ecx.memory.len.addr.i8025 = getelementptr inbounds i8, ptr %ecx.memory.i8024, i64 16
  %ecx.memory.len.i8026 = load i64, ptr %ecx.memory.len.addr.i8025, align 8, !noalias !169
  %ecx.memory.last_checkpoint.addr.i8027 = getelementptr inbounds i8, ptr %ecx.memory.i8024, i64 48
  %ecx.memory.last_checkpoint.i8028 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8027, align 8, !noalias !169
  %1026 = sub i64 %ecx.memory.len.i8026, %ecx.memory.last_checkpoint.i8028
  %1027 = icmp ugt i256 %1025, 18446744073709551615
  %1028 = trunc i256 %1025 to i64
  %1029 = add i64 %1028, 32
  %1030 = icmp ugt i64 %1028, -33
  %1031 = or i1 %1027, %1030
  %1032 = select i1 %1031, i64 -1, i64 %1029
  %1033 = icmp ugt i64 %1032, %1026
  br i1 %1033, label %resize.i8035, label %OP1102.PUSH1, !prof !2

resize.i8035:                                     ; preds = %OP1097.PUSH1
  %1034 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1032)
  %.not.i8036 = icmp eq i8 %1034, 0
  br i1 %.not.i8036, label %OP1102.PUSH1, label %return, !prof !7

OP1102.PUSH1:                                     ; preds = %OP1097.PUSH1, %resize.i8035
  %ecx.memory.buffer.ptr.shared.addr.i8030 = getelementptr inbounds i8, ptr %ecx.memory.i8024, i64 8
  %ecx.memory.buffer.ptr.shared.i8031 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8030, align 8, !noalias !169
  %ecx.memory.buffer.ptr.i8032 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8031, i64 %ecx.memory.last_checkpoint.i8028
  %slot.i8033 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8032, i64 %1028
  %1035 = tail call i256 @llvm.bswap.i256(i256 %swap.b3930)
  store i256 %1035, ptr %slot.i8033, align 1, !noalias !169
  %b3946 = load i256, ptr %sp3886, align 16
  %1036 = add i256 %b3946, 32
  store i256 %1036, ptr %sp3886, align 16
  store i256 0, ptr %sp3888, align 16
  %1037 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3886)
  %.not7340 = icmp eq i8 %1037, 0
  br i1 %.not7340, label %OP1106.PUSH1, label %return, !prof !7

OP1106.PUSH1:                                     ; preds = %OP1102.PUSH1
  store i256 0, ptr %sp3888, align 16
  %contract.caller.addr3955 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller3956 = load i160, ptr %contract.caller.addr3955, align 16
  %1038 = tail call i160 @llvm.bswap.i160(i160 %contract.caller3956)
  %1039 = zext i160 %1038 to i256
  store i256 %1039, ptr %sp3892, align 16
  store i256 0, ptr %sp3894, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !172)
  %ecx.memory.i8039 = load ptr, ptr %ecx.memory.addr.i8008, align 8, !alias.scope !172
  %ecx.memory.len.addr.i8040 = getelementptr inbounds i8, ptr %ecx.memory.i8039, i64 16
  %ecx.memory.len.i8041 = load i64, ptr %ecx.memory.len.addr.i8040, align 8, !noalias !172
  %ecx.memory.last_checkpoint.addr.i8042 = getelementptr inbounds i8, ptr %ecx.memory.i8039, i64 48
  %ecx.memory.last_checkpoint.i8043 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8042, align 8, !noalias !172
  %1040 = sub i64 %ecx.memory.len.i8041, %ecx.memory.last_checkpoint.i8043
  %1041 = icmp ult i64 %1040, 32
  br i1 %1041, label %resize.i8050, label %OP1114.PUSH1, !prof !2

resize.i8050:                                     ; preds = %OP1106.PUSH1
  %1042 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8051 = icmp eq i8 %1042, 0
  br i1 %.not.i8051, label %OP1114.PUSH1, label %return, !prof !7

OP1114.PUSH1:                                     ; preds = %OP1106.PUSH1, %resize.i8050
  %ecx.memory.buffer.ptr.shared.addr.i8045 = getelementptr inbounds i8, ptr %ecx.memory.i8039, i64 8
  %ecx.memory.buffer.ptr.shared.i8046 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8045, align 8, !noalias !172
  %ecx.memory.buffer.ptr.i8047 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8046, i64 %ecx.memory.last_checkpoint.i8043
  %1043 = tail call i256 @llvm.bswap.i256(i256 %1039)
  store i256 %1043, ptr %ecx.memory.buffer.ptr.i8047, align 1, !noalias !172
  %b3989 = load i256, ptr %sp3888, align 16
  %1044 = add i256 %b3989, 32
  %swap.b3995 = load i256, ptr %sp3886, align 16
  store i256 %1044, ptr %sp3886, align 16
  store i256 %swap.b3995, ptr %sp3888, align 16
  store i256 %1044, ptr %sp3892, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !175)
  %ecx.memory.i8054 = load ptr, ptr %ecx.memory.addr.i8008, align 8, !alias.scope !175
  %ecx.memory.len.addr.i8055 = getelementptr inbounds i8, ptr %ecx.memory.i8054, i64 16
  %ecx.memory.len.i8056 = load i64, ptr %ecx.memory.len.addr.i8055, align 8, !noalias !175
  %ecx.memory.last_checkpoint.addr.i8057 = getelementptr inbounds i8, ptr %ecx.memory.i8054, i64 48
  %ecx.memory.last_checkpoint.i8058 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8057, align 8, !noalias !175
  %1045 = sub i64 %ecx.memory.len.i8056, %ecx.memory.last_checkpoint.i8058
  %1046 = icmp ugt i256 %1044, 18446744073709551615
  %1047 = trunc i256 %1044 to i64
  %1048 = add i64 %1047, 32
  %1049 = icmp ugt i64 %1047, -33
  %1050 = or i1 %1046, %1049
  %1051 = select i1 %1050, i64 -1, i64 %1048
  %1052 = icmp ugt i64 %1051, %1045
  br i1 %1052, label %resize.i8065, label %OP1119.PUSH1, !prof !2

resize.i8065:                                     ; preds = %OP1114.PUSH1
  %1053 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1051)
  %.not.i8066 = icmp eq i8 %1053, 0
  br i1 %.not.i8066, label %OP1119.PUSH1, label %return, !prof !7

OP1119.PUSH1:                                     ; preds = %OP1114.PUSH1, %resize.i8065
  %ecx.memory.buffer.ptr.shared.addr.i8060 = getelementptr inbounds i8, ptr %ecx.memory.i8054, i64 8
  %ecx.memory.buffer.ptr.shared.i8061 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8060, align 8, !noalias !175
  %ecx.memory.buffer.ptr.i8062 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8061, i64 %ecx.memory.last_checkpoint.i8058
  %slot.i8063 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8062, i64 %1047
  %1054 = tail call i256 @llvm.bswap.i256(i256 %swap.b3995)
  store i256 %1054, ptr %slot.i8063, align 1, !noalias !175
  %b4011 = load i256, ptr %sp3886, align 16
  %1055 = add i256 %b4011, 32
  store i256 %1055, ptr %sp3886, align 16
  store i256 0, ptr %sp3888, align 16
  %1056 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3886)
  %.not7343 = icmp eq i8 %1056, 0
  br i1 %.not7343, label %OP1123.PUSH1, label %return, !prof !7

OP1123.PUSH1:                                     ; preds = %OP1119.PUSH1
  store i256 0, ptr %sp3888, align 16
  %dup34021 = load i256, ptr %1016, align 16
  store i256 %dup34021, ptr %sp3892, align 16
  %dup34025 = load i256, ptr %sp3886, align 16
  store i256 %dup34025, ptr %sp3894, align 16
  %1057 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3894, i8 19)
  %.not7344 = icmp eq i8 %1057, 0
  br i1 %.not7344, label %OP1127.SUB, label %return, !prof !7

OP1127.SUB:                                       ; preds = %OP1123.PUSH1
  %a4031 = load i256, ptr %sp3894, align 16
  %b4033 = load i256, ptr %sp3892, align 16
  %1058 = sub i256 %a4031, %b4033
  %swap.b4039 = load i256, ptr %1016, align 16
  store i256 %1058, ptr %1016, align 16
  store i256 %swap.b4039, ptr %sp3892, align 16
  %swap.b4050 = load i256, ptr %sp3886, align 16
  store i256 %1058, ptr %sp3886, align 16
  store i256 %swap.b4050, ptr %sp3888, align 16
  %1059 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp3886, i8 19)
  %.not7345 = icmp eq i8 %1059, 0
  br i1 %.not7345, label %OP1134.POP, label %return, !prof !7

OP1134.POP:                                       ; preds = %OP1127.SUB
  %gas.remaining4053 = load i64, ptr %gas.remaining.addr, align 8
  %1060 = add i64 %gas.remaining4053, -2
  %1061 = icmp ult i64 %gas.remaining4053, 2
  store i64 %1060, ptr %gas.remaining.addr, align 8
  br i1 %1061, label %return, label %OP1135.JUMPDEST, !prof !2, !annotation !3

OP1135.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1037.ISZERO, %OP1134.POP
  %gas.remaining4056 = phi i64 [ %1060, %OP1134.POP ], [ %945, %OP1037.ISZERO ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.39 = phi i64 [ %len.addr.38, %OP1134.POP ], [ %951, %OP1037.ISZERO ], [ %len.addr.51, %dynamic_jump_table ]
  %1062 = add i64 %gas.remaining4056, -110
  %1063 = icmp ult i64 %gas.remaining4056, 110
  store i64 %1062, ptr %gas.remaining.addr, align 8
  br i1 %1063, label %return, label %OP1135.JUMPDEST.contd, !prof !2, !annotation !3

OP1135.JUMPDEST.contd:                            ; preds = %OP1135.JUMPDEST
  %1064 = icmp ult i64 %len.addr.39, 4
  %1065 = add i64 %len.addr.39, -1020
  %1066 = icmp ult i64 %1065, -1016
  %1067 = select i1 %1064, i8 91, i8 92
  br i1 %1066, label %return, label %OP1136.DUP2, !prof !2

OP1136.DUP2:                                      ; preds = %OP1135.JUMPDEST.contd
  %1068 = add nuw nsw i64 %len.addr.39, 1
  %1069 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.39
  %sp4060 = getelementptr i256, ptr %1069, i64 -2
  %dup24061 = load i256, ptr %sp4060, align 16
  store i256 %dup24061, ptr %1069, align 16
  %1070 = add nuw nsw i64 %len.addr.39, 2
  %sp4064 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1068
  store i256 3, ptr %sp4064, align 16
  %1071 = add nuw nsw i64 %len.addr.39, 3
  %sp4066 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1070
  store i256 0, ptr %sp4066, align 16
  %sp4068 = getelementptr i256, ptr %1069, i64 -4
  %dup74069 = load i256, ptr %sp4068, align 16
  %sp4070 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1071
  %1072 = add nuw nsw i64 %len.addr.39, 5
  %sp4072 = getelementptr i256, ptr %1069, i64 4
  %1073 = and i256 %dup74069, 1461501637330902918203684832716283019655932542975
  store i256 %1073, ptr %sp4070, align 16
  store i256 0, ptr %sp4072, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !178)
  %ecx.memory.addr.i8068 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8069 = load ptr, ptr %ecx.memory.addr.i8068, align 8, !alias.scope !178
  %ecx.memory.len.addr.i8070 = getelementptr inbounds i8, ptr %ecx.memory.i8069, i64 16
  %ecx.memory.len.i8071 = load i64, ptr %ecx.memory.len.addr.i8070, align 8, !noalias !178
  %ecx.memory.last_checkpoint.addr.i8072 = getelementptr inbounds i8, ptr %ecx.memory.i8069, i64 48
  %ecx.memory.last_checkpoint.i8073 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8072, align 8, !noalias !178
  %1074 = sub i64 %ecx.memory.len.i8071, %ecx.memory.last_checkpoint.i8073
  %1075 = icmp ult i64 %1074, 32
  br i1 %1075, label %resize.i8080, label %OP1146.PUSH1, !prof !2

resize.i8080:                                     ; preds = %OP1136.DUP2
  %1076 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8081 = icmp eq i8 %1076, 0
  br i1 %.not.i8081, label %OP1146.PUSH1, label %return, !prof !7

OP1146.PUSH1:                                     ; preds = %OP1136.DUP2, %resize.i8080
  %ecx.memory.buffer.ptr.shared.addr.i8075 = getelementptr inbounds i8, ptr %ecx.memory.i8069, i64 8
  %ecx.memory.buffer.ptr.shared.i8076 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8075, align 8, !noalias !178
  %ecx.memory.buffer.ptr.i8077 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8076, i64 %ecx.memory.last_checkpoint.i8073
  %1077 = tail call i256 @llvm.bswap.i256(i256 %1073)
  store i256 %1077, ptr %ecx.memory.buffer.ptr.i8077, align 1, !noalias !178
  %b4102 = load i256, ptr %sp4066, align 16
  %1078 = add i256 %b4102, 32
  %swap.b4108 = load i256, ptr %sp4064, align 16
  store i256 %1078, ptr %sp4064, align 16
  store i256 %swap.b4108, ptr %sp4066, align 16
  store i256 %1078, ptr %sp4070, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !181)
  %ecx.memory.i8084 = load ptr, ptr %ecx.memory.addr.i8068, align 8, !alias.scope !181
  %ecx.memory.len.addr.i8085 = getelementptr inbounds i8, ptr %ecx.memory.i8084, i64 16
  %ecx.memory.len.i8086 = load i64, ptr %ecx.memory.len.addr.i8085, align 8, !noalias !181
  %ecx.memory.last_checkpoint.addr.i8087 = getelementptr inbounds i8, ptr %ecx.memory.i8084, i64 48
  %ecx.memory.last_checkpoint.i8088 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8087, align 8, !noalias !181
  %1079 = sub i64 %ecx.memory.len.i8086, %ecx.memory.last_checkpoint.i8088
  %1080 = icmp ugt i256 %1078, 18446744073709551615
  %1081 = trunc i256 %1078 to i64
  %1082 = add i64 %1081, 32
  %1083 = icmp ugt i64 %1081, -33
  %1084 = or i1 %1080, %1083
  %1085 = select i1 %1084, i64 -1, i64 %1082
  %1086 = icmp ugt i64 %1085, %1079
  br i1 %1086, label %resize.i8095, label %OP1151.PUSH1, !prof !2

resize.i8095:                                     ; preds = %OP1146.PUSH1
  %1087 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1085)
  %.not.i8096 = icmp eq i8 %1087, 0
  br i1 %.not.i8096, label %OP1151.PUSH1, label %return, !prof !7

OP1151.PUSH1:                                     ; preds = %OP1146.PUSH1, %resize.i8095
  %ecx.memory.buffer.ptr.shared.addr.i8090 = getelementptr inbounds i8, ptr %ecx.memory.i8084, i64 8
  %ecx.memory.buffer.ptr.shared.i8091 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8090, align 8, !noalias !181
  %ecx.memory.buffer.ptr.i8092 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8091, i64 %ecx.memory.last_checkpoint.i8088
  %slot.i8093 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8092, i64 %1081
  %1088 = tail call i256 @llvm.bswap.i256(i256 %swap.b4108)
  store i256 %1088, ptr %slot.i8093, align 1, !noalias !181
  %b4124 = load i256, ptr %sp4064, align 16
  %1089 = add i256 %b4124, 32
  store i256 %1089, ptr %sp4064, align 16
  store i256 0, ptr %sp4066, align 16
  %1090 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4064)
  %.not7348 = icmp eq i8 %1090, 0
  br i1 %.not7348, label %OP1155.PUSH1, label %return, !prof !7

OP1155.PUSH1:                                     ; preds = %OP1151.PUSH1
  store i256 0, ptr %sp4066, align 16
  %dup34134 = load i256, ptr %1069, align 16
  store i256 %dup34134, ptr %sp4070, align 16
  %dup34138 = load i256, ptr %sp4064, align 16
  store i256 %dup34138, ptr %sp4072, align 16
  %1091 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4072, i8 19)
  %.not7349 = icmp eq i8 %1091, 0
  br i1 %.not7349, label %OP1159.SUB, label %return, !prof !7

OP1159.SUB:                                       ; preds = %OP1155.PUSH1
  %a4144 = load i256, ptr %sp4072, align 16
  %b4146 = load i256, ptr %sp4070, align 16
  %1092 = sub i256 %a4144, %b4146
  %swap.b4152 = load i256, ptr %1069, align 16
  store i256 %1092, ptr %1069, align 16
  store i256 %swap.b4152, ptr %sp4070, align 16
  %swap.b4163 = load i256, ptr %sp4064, align 16
  store i256 %1092, ptr %sp4064, align 16
  store i256 %swap.b4163, ptr %sp4066, align 16
  %1093 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4064, i8 19)
  %.not7350 = icmp eq i8 %1093, 0
  br i1 %.not7350, label %OP1166.POP, label %return, !prof !7

OP1166.POP:                                       ; preds = %OP1159.SUB
  %gas.remaining4166 = load i64, ptr %gas.remaining.addr, align 8
  %1094 = add i64 %gas.remaining4166, -111
  %1095 = icmp ult i64 %gas.remaining4166, 111
  store i64 %1094, ptr %gas.remaining.addr, align 8
  br i1 %1095, label %return, label %OP1166.POP.contd4168, !prof !2, !annotation !3

OP1166.POP.contd4168:                             ; preds = %OP1166.POP
  %dup24171 = load i256, ptr %sp4060, align 16
  store i256 %dup24171, ptr %1069, align 16
  store i256 3, ptr %sp4064, align 16
  store i256 0, ptr %sp4066, align 16
  %sp4178 = getelementptr i256, ptr %1069, i64 -3
  %dup64179 = load i256, ptr %sp4178, align 16
  %1096 = and i256 %dup64179, 1461501637330902918203684832716283019655932542975
  store i256 %1096, ptr %sp4070, align 16
  store i256 0, ptr %sp4072, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !184)
  %ecx.memory.i8099 = load ptr, ptr %ecx.memory.addr.i8068, align 8, !alias.scope !184
  %ecx.memory.len.addr.i8100 = getelementptr inbounds i8, ptr %ecx.memory.i8099, i64 16
  %ecx.memory.len.i8101 = load i64, ptr %ecx.memory.len.addr.i8100, align 8, !noalias !184
  %ecx.memory.last_checkpoint.addr.i8102 = getelementptr inbounds i8, ptr %ecx.memory.i8099, i64 48
  %ecx.memory.last_checkpoint.i8103 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8102, align 8, !noalias !184
  %1097 = sub i64 %ecx.memory.len.i8101, %ecx.memory.last_checkpoint.i8103
  %1098 = icmp ult i64 %1097, 32
  br i1 %1098, label %resize.i8110, label %OP1177.PUSH1, !prof !2

resize.i8110:                                     ; preds = %OP1166.POP.contd4168
  %1099 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8111 = icmp eq i8 %1099, 0
  br i1 %.not.i8111, label %OP1177.PUSH1, label %return, !prof !7

OP1177.PUSH1:                                     ; preds = %OP1166.POP.contd4168, %resize.i8110
  %ecx.memory.buffer.ptr.shared.addr.i8105 = getelementptr inbounds i8, ptr %ecx.memory.i8099, i64 8
  %ecx.memory.buffer.ptr.shared.i8106 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8105, align 8, !noalias !184
  %ecx.memory.buffer.ptr.i8107 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8106, i64 %ecx.memory.last_checkpoint.i8103
  %1100 = tail call i256 @llvm.bswap.i256(i256 %1096)
  store i256 %1100, ptr %ecx.memory.buffer.ptr.i8107, align 1, !noalias !184
  %b4212 = load i256, ptr %sp4066, align 16
  %1101 = add i256 %b4212, 32
  %swap.b4218 = load i256, ptr %sp4064, align 16
  store i256 %1101, ptr %sp4064, align 16
  store i256 %swap.b4218, ptr %sp4066, align 16
  store i256 %1101, ptr %sp4070, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !187)
  %ecx.memory.i8114 = load ptr, ptr %ecx.memory.addr.i8068, align 8, !alias.scope !187
  %ecx.memory.len.addr.i8115 = getelementptr inbounds i8, ptr %ecx.memory.i8114, i64 16
  %ecx.memory.len.i8116 = load i64, ptr %ecx.memory.len.addr.i8115, align 8, !noalias !187
  %ecx.memory.last_checkpoint.addr.i8117 = getelementptr inbounds i8, ptr %ecx.memory.i8114, i64 48
  %ecx.memory.last_checkpoint.i8118 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8117, align 8, !noalias !187
  %1102 = sub i64 %ecx.memory.len.i8116, %ecx.memory.last_checkpoint.i8118
  %1103 = icmp ugt i256 %1101, 18446744073709551615
  %1104 = trunc i256 %1101 to i64
  %1105 = add i64 %1104, 32
  %1106 = icmp ugt i64 %1104, -33
  %1107 = or i1 %1103, %1106
  %1108 = select i1 %1107, i64 -1, i64 %1105
  %1109 = icmp ugt i64 %1108, %1102
  br i1 %1109, label %resize.i8125, label %OP1182.PUSH1, !prof !2

resize.i8125:                                     ; preds = %OP1177.PUSH1
  %1110 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1108)
  %.not.i8126 = icmp eq i8 %1110, 0
  br i1 %.not.i8126, label %OP1182.PUSH1, label %return, !prof !7

OP1182.PUSH1:                                     ; preds = %OP1177.PUSH1, %resize.i8125
  %ecx.memory.buffer.ptr.shared.addr.i8120 = getelementptr inbounds i8, ptr %ecx.memory.i8114, i64 8
  %ecx.memory.buffer.ptr.shared.i8121 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8120, align 8, !noalias !187
  %ecx.memory.buffer.ptr.i8122 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8121, i64 %ecx.memory.last_checkpoint.i8118
  %slot.i8123 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8122, i64 %1104
  %1111 = tail call i256 @llvm.bswap.i256(i256 %swap.b4218)
  store i256 %1111, ptr %slot.i8123, align 1, !noalias !187
  %b4234 = load i256, ptr %sp4064, align 16
  %1112 = add i256 %b4234, 32
  store i256 %1112, ptr %sp4064, align 16
  store i256 0, ptr %sp4066, align 16
  %1113 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4064)
  %.not7353 = icmp eq i8 %1113, 0
  br i1 %.not7353, label %OP1186.PUSH1, label %return, !prof !7

OP1186.PUSH1:                                     ; preds = %OP1182.PUSH1
  store i256 0, ptr %sp4066, align 16
  %dup34244 = load i256, ptr %1069, align 16
  store i256 %dup34244, ptr %sp4070, align 16
  %dup34248 = load i256, ptr %sp4064, align 16
  store i256 %dup34248, ptr %sp4072, align 16
  %1114 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4072, i8 19)
  %.not7354 = icmp eq i8 %1114, 0
  br i1 %.not7354, label %OP1190.ADD, label %return, !prof !7

OP1190.ADD:                                       ; preds = %OP1186.PUSH1
  %a4254 = load i256, ptr %sp4072, align 16
  %b4256 = load i256, ptr %sp4070, align 16
  %1115 = add i256 %b4256, %a4254
  %swap.b4262 = load i256, ptr %1069, align 16
  store i256 %1115, ptr %1069, align 16
  store i256 %swap.b4262, ptr %sp4070, align 16
  %swap.b4273 = load i256, ptr %sp4064, align 16
  store i256 %1115, ptr %sp4064, align 16
  store i256 %swap.b4273, ptr %sp4066, align 16
  %1116 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4064, i8 19)
  %.not7355 = icmp eq i8 %1116, 0
  br i1 %.not7355, label %OP1197.POP, label %return, !prof !7

OP1197.POP:                                       ; preds = %OP1190.ADD
  %gas.remaining4276 = load i64, ptr %gas.remaining.addr, align 8
  %1117 = add i64 %gas.remaining4276, -1603
  %1118 = icmp ult i64 %gas.remaining4276, 1603
  store i64 %1117, ptr %gas.remaining.addr, align 8
  br i1 %1118, label %return, label %OP1197.POP.contd, !prof !2, !annotation !3

OP1197.POP.contd:                                 ; preds = %OP1197.POP
  %1119 = icmp ult i64 %len.addr.39, 5
  %1120 = add nsw i64 %len.addr.39, -1017
  %1121 = icmp ult i64 %1120, -1012
  %1122 = select i1 %1119, i8 91, i8 92
  br i1 %1121, label %return, label %OP1197.POP.contd4278, !prof !2

OP1197.POP.contd4278:                             ; preds = %OP1197.POP.contd
  %dup34281 = load i256, ptr %sp4178, align 16
  %1123 = and i256 %dup34281, 1461501637330902918203684832716283019655932542975
  store i256 %1123, ptr %1069, align 16
  %dup54293 = load i256, ptr %sp4068, align 16
  %1124 = and i256 %dup54293, 1461501637330902918203684832716283019655932542975
  store i256 %1124, ptr %sp4064, align 16
  store i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, ptr %sp4066, align 16
  %dup54307 = load i256, ptr %sp4060, align 16
  store i256 %dup54307, ptr %sp4070, align 16
  store i256 64, ptr %sp4072, align 16
  %ecx.memory.i8129 = load ptr, ptr %ecx.memory.addr.i8068, align 8
  %ecx.memory.len.addr.i8130 = getelementptr inbounds i8, ptr %ecx.memory.i8129, i64 16
  %ecx.memory.len.i8131 = load i64, ptr %ecx.memory.len.addr.i8130, align 8, !noalias !190
  %ecx.memory.last_checkpoint.addr.i8132 = getelementptr inbounds i8, ptr %ecx.memory.i8129, i64 48
  %ecx.memory.last_checkpoint.i8133 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8132, align 8, !noalias !190
  %1125 = sub i64 %ecx.memory.len.i8131, %ecx.memory.last_checkpoint.i8133
  %1126 = icmp ult i64 %1125, 96
  br i1 %1126, label %resize.i8141, label %OP1207.MLOAD.contd, !prof !2

resize.i8141:                                     ; preds = %OP1197.POP.contd4278
  %1127 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !194
  %.not.i8142 = icmp eq i8 %1127, 0
  br i1 %.not.i8142, label %resize.i8141.OP1207.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8141.OP1207.MLOAD.contd_crit_edge:        ; preds = %resize.i8141
  %dup34323.pre = load i256, ptr %sp4070, align 16
  %ecx.memory.i8145.pre = load ptr, ptr %ecx.memory.addr.i8068, align 8, !alias.scope !195
  br label %OP1207.MLOAD.contd

OP1207.MLOAD.contd:                               ; preds = %resize.i8141.OP1207.MLOAD.contd_crit_edge, %OP1197.POP.contd4278
  %ecx.memory.i8145 = phi ptr [ %ecx.memory.i8145.pre, %resize.i8141.OP1207.MLOAD.contd_crit_edge ], [ %ecx.memory.i8129, %OP1197.POP.contd4278 ]
  %dup34323 = phi i256 [ %dup34323.pre, %resize.i8141.OP1207.MLOAD.contd_crit_edge ], [ %dup54307, %OP1197.POP.contd4278 ]
  %ecx.memory.buffer.ptr.shared.addr.i8135 = getelementptr inbounds i8, ptr %ecx.memory.i8129, i64 8
  %ecx.memory.buffer.ptr.shared.i8136 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8135, align 8, !noalias !190
  %ecx.memory.buffer.ptr.i8137 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8136, i64 %ecx.memory.last_checkpoint.i8133
  %slot.i8138 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8137, i64 64
  %slot.value.i8139 = load i256, ptr %slot.i8138, align 1, !noalias !190
  %1128 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8139)
  store i256 %1128, ptr %sp4072, align 16
  %1129 = add nuw nsw i64 %len.addr.39, 6
  %sp4320 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1072
  store i256 %1128, ptr %sp4320, align 16
  %sp4324 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1129
  store i256 %dup34323, ptr %sp4324, align 16
  %sp4328 = getelementptr i256, ptr %1069, i64 7
  store i256 %1128, ptr %sp4328, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !195)
  %ecx.memory.len.addr.i8146 = getelementptr inbounds i8, ptr %ecx.memory.i8145, i64 16
  %ecx.memory.len.i8147 = load i64, ptr %ecx.memory.len.addr.i8146, align 8, !noalias !195
  %ecx.memory.last_checkpoint.addr.i8148 = getelementptr inbounds i8, ptr %ecx.memory.i8145, i64 48
  %ecx.memory.last_checkpoint.i8149 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8148, align 8, !noalias !195
  %1130 = sub i64 %ecx.memory.len.i8147, %ecx.memory.last_checkpoint.i8149
  %1131 = icmp ugt i256 %1128, 18446744073709551615
  %1132 = trunc i256 %1128 to i64
  %1133 = add i64 %1132, 32
  %1134 = icmp ugt i64 %1132, -33
  %1135 = or i1 %1131, %1134
  %1136 = select i1 %1135, i64 -1, i64 %1133
  %1137 = icmp ugt i64 %1136, %1130
  br i1 %1137, label %resize.i8156, label %OP1212.PUSH1, !prof !2

resize.i8156:                                     ; preds = %OP1207.MLOAD.contd
  %1138 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1136)
  %.not.i8157 = icmp eq i8 %1138, 0
  br i1 %.not.i8157, label %OP1212.PUSH1, label %return, !prof !7

OP1212.PUSH1:                                     ; preds = %OP1207.MLOAD.contd, %resize.i8156
  %ecx.memory.buffer.ptr.shared.addr.i8151 = getelementptr inbounds i8, ptr %ecx.memory.i8145, i64 8
  %ecx.memory.buffer.ptr.shared.i8152 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8151, align 8, !noalias !195
  %ecx.memory.buffer.ptr.i8153 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8152, i64 %ecx.memory.last_checkpoint.i8149
  %slot.i8154 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8153, i64 %1132
  %1139 = tail call i256 @llvm.bswap.i256(i256 %dup34323)
  store i256 %1139, ptr %slot.i8154, align 1, !noalias !195
  store i256 32, ptr %sp4324, align 16
  %b4340 = load i256, ptr %sp4320, align 16
  %1140 = add i256 %b4340, 32
  %swap.b4346 = load i256, ptr %sp4070, align 16
  store i256 %1140, ptr %sp4070, align 16
  store i256 %swap.b4346, ptr %sp4320, align 16
  store i256 64, ptr %sp4072, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !198)
  %ecx.memory.i8160 = load ptr, ptr %ecx.memory.addr.i8068, align 8, !alias.scope !198, !noalias !201
  %ecx.memory.len.addr.i8161 = getelementptr inbounds i8, ptr %ecx.memory.i8160, i64 16
  %ecx.memory.len.i8162 = load i64, ptr %ecx.memory.len.addr.i8161, align 8, !noalias !203
  %ecx.memory.last_checkpoint.addr.i8163 = getelementptr inbounds i8, ptr %ecx.memory.i8160, i64 48
  %ecx.memory.last_checkpoint.i8164 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8163, align 8, !noalias !203
  %1141 = sub i64 %ecx.memory.len.i8162, %ecx.memory.last_checkpoint.i8164
  %1142 = icmp ult i64 %1141, 96
  br i1 %1142, label %resize.i8172, label %OP1218.MLOAD.contd, !prof !2

resize.i8172:                                     ; preds = %OP1212.PUSH1
  %1143 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !201
  %.not.i8173 = icmp eq i8 %1143, 0
  br i1 %.not.i8173, label %resize.i8172.OP1218.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8172.OP1218.MLOAD.contd_crit_edge:        ; preds = %resize.i8172
  %swap.b4365.pre = load i256, ptr %sp4070, align 16
  br label %OP1218.MLOAD.contd

OP1218.MLOAD.contd:                               ; preds = %resize.i8172.OP1218.MLOAD.contd_crit_edge, %OP1212.PUSH1
  %swap.b4365 = phi i256 [ %swap.b4365.pre, %resize.i8172.OP1218.MLOAD.contd_crit_edge ], [ %1140, %OP1212.PUSH1 ]
  %ecx.memory.buffer.ptr.shared.addr.i8166 = getelementptr inbounds i8, ptr %ecx.memory.i8160, i64 8
  %ecx.memory.buffer.ptr.shared.i8167 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8166, align 8, !noalias !203
  %ecx.memory.buffer.ptr.i8168 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8167, i64 %ecx.memory.last_checkpoint.i8164
  %slot.i8169 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8168, i64 64
  %slot.value.i8170 = load i256, ptr %slot.i8169, align 1, !noalias !203
  %1144 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8170)
  store i256 %swap.b4365, ptr %sp4320, align 16
  %1145 = sub i256 %swap.b4365, %1144
  store i256 %1145, ptr %sp4070, align 16
  store i256 %1144, ptr %sp4072, align 16
  %1146 = tail call i8 @__revmc_builtin_log(ptr nonnull %arg.ecx.addr, ptr nonnull %1069, i8 3)
  %.not7359 = icmp eq i8 %1146, 0
  br i1 %.not7359, label %OP1224.PUSH1, label %return, !prof !7

OP1224.PUSH1:                                     ; preds = %OP1218.MLOAD.contd
  %sp4384 = getelementptr i256, ptr %1069, i64 -1
  %swap.b4385 = load i256, ptr %sp4384, align 16
  store i256 %swap.b4385, ptr %1069, align 16
  %sp4390 = getelementptr i256, ptr %1069, i64 -5
  %swap.b4391 = load i256, ptr %sp4390, align 16
  store i256 1, ptr %sp4390, align 16
  %swap.b4396 = load i256, ptr %sp4068, align 16
  store i256 %swap.b4391, ptr %sp4068, align 16
  store i256 %swap.b4396, ptr %sp4384, align 16
  %1147 = add nsw i64 %len.addr.39, -4
  br label %dynamic_jump_table.preheader

OP1233.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP356.PUSH2
  %gas.remaining4403 = phi i64 [ %306, %OP356.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.40 = phi i64 [ %309, %OP356.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1148 = add i64 %gas.remaining4403, -109
  %1149 = icmp ult i64 %gas.remaining4403, 109
  store i64 %1148, ptr %gas.remaining.addr, align 8
  br i1 %1149, label %return, label %OP1233.JUMPDEST.contd, !prof !2, !annotation !3

OP1233.JUMPDEST.contd:                            ; preds = %OP1233.JUMPDEST
  %1150 = icmp eq i64 %len.addr.40, 0
  %1151 = add i64 %len.addr.40, -1020
  %1152 = icmp ult i64 %1151, -1019
  %1153 = select i1 %1150, i8 91, i8 92
  br i1 %1152, label %return, label %OP1234.DUP1, !prof !2

OP1234.DUP1:                                      ; preds = %OP1233.JUMPDEST.contd
  %1154 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.40
  %sp4407 = getelementptr i256, ptr %1154, i64 -1
  %dup14408 = load i256, ptr %sp4407, align 16
  store i256 %dup14408, ptr %1154, align 16
  %1155 = add nuw nsw i64 %len.addr.40, 2
  %sp4411 = getelementptr i256, ptr %1154, i64 1
  store i256 3, ptr %sp4411, align 16
  %1156 = add nuw nsw i64 %len.addr.40, 3
  %sp4413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1155
  store i256 0, ptr %sp4413, align 16
  %contract.caller.addr4415 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4416 = load i160, ptr %contract.caller.addr4415, align 16
  %1157 = tail call i160 @llvm.bswap.i160(i160 %contract.caller4416)
  %1158 = zext i160 %1157 to i256
  %sp4417 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1156
  %sp4419 = getelementptr i256, ptr %1154, i64 4
  store i256 %1158, ptr %sp4417, align 16
  store i256 0, ptr %sp4419, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !204)
  %ecx.memory.addr.i8175 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8176 = load ptr, ptr %ecx.memory.addr.i8175, align 8, !alias.scope !204
  %ecx.memory.len.addr.i8177 = getelementptr inbounds i8, ptr %ecx.memory.i8176, i64 16
  %ecx.memory.len.i8178 = load i64, ptr %ecx.memory.len.addr.i8177, align 8, !noalias !204
  %ecx.memory.last_checkpoint.addr.i8179 = getelementptr inbounds i8, ptr %ecx.memory.i8176, i64 48
  %ecx.memory.last_checkpoint.i8180 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8179, align 8, !noalias !204
  %1159 = sub i64 %ecx.memory.len.i8178, %ecx.memory.last_checkpoint.i8180
  %1160 = icmp ult i64 %1159, 32
  br i1 %1160, label %resize.i8187, label %OP1244.PUSH1, !prof !2

resize.i8187:                                     ; preds = %OP1234.DUP1
  %1161 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8188 = icmp eq i8 %1161, 0
  br i1 %.not.i8188, label %OP1244.PUSH1, label %return, !prof !7

OP1244.PUSH1:                                     ; preds = %OP1234.DUP1, %resize.i8187
  %ecx.memory.buffer.ptr.shared.addr.i8182 = getelementptr inbounds i8, ptr %ecx.memory.i8176, i64 8
  %ecx.memory.buffer.ptr.shared.i8183 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8182, align 8, !noalias !204
  %ecx.memory.buffer.ptr.i8184 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8183, i64 %ecx.memory.last_checkpoint.i8180
  %1162 = tail call i256 @llvm.bswap.i256(i256 %1158)
  store i256 %1162, ptr %ecx.memory.buffer.ptr.i8184, align 1, !noalias !204
  %b4449 = load i256, ptr %sp4413, align 16
  %1163 = add i256 %b4449, 32
  %swap.b4455 = load i256, ptr %sp4411, align 16
  store i256 %1163, ptr %sp4411, align 16
  store i256 %swap.b4455, ptr %sp4413, align 16
  store i256 %1163, ptr %sp4417, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !207)
  %ecx.memory.i8191 = load ptr, ptr %ecx.memory.addr.i8175, align 8, !alias.scope !207
  %ecx.memory.len.addr.i8192 = getelementptr inbounds i8, ptr %ecx.memory.i8191, i64 16
  %ecx.memory.len.i8193 = load i64, ptr %ecx.memory.len.addr.i8192, align 8, !noalias !207
  %ecx.memory.last_checkpoint.addr.i8194 = getelementptr inbounds i8, ptr %ecx.memory.i8191, i64 48
  %ecx.memory.last_checkpoint.i8195 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8194, align 8, !noalias !207
  %1164 = sub i64 %ecx.memory.len.i8193, %ecx.memory.last_checkpoint.i8195
  %1165 = icmp ugt i256 %1163, 18446744073709551615
  %1166 = trunc i256 %1163 to i64
  %1167 = add i64 %1166, 32
  %1168 = icmp ugt i64 %1166, -33
  %1169 = or i1 %1165, %1168
  %1170 = select i1 %1169, i64 -1, i64 %1167
  %1171 = icmp ugt i64 %1170, %1164
  br i1 %1171, label %resize.i8202, label %OP1249.PUSH1, !prof !2

resize.i8202:                                     ; preds = %OP1244.PUSH1
  %1172 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1170)
  %.not.i8203 = icmp eq i8 %1172, 0
  br i1 %.not.i8203, label %OP1249.PUSH1, label %return, !prof !7

OP1249.PUSH1:                                     ; preds = %OP1244.PUSH1, %resize.i8202
  %ecx.memory.buffer.ptr.shared.addr.i8197 = getelementptr inbounds i8, ptr %ecx.memory.i8191, i64 8
  %ecx.memory.buffer.ptr.shared.i8198 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8197, align 8, !noalias !207
  %ecx.memory.buffer.ptr.i8199 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8198, i64 %ecx.memory.last_checkpoint.i8195
  %slot.i8200 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8199, i64 %1166
  %1173 = tail call i256 @llvm.bswap.i256(i256 %swap.b4455)
  store i256 %1173, ptr %slot.i8200, align 1, !noalias !207
  %b4471 = load i256, ptr %sp4411, align 16
  %1174 = add i256 %b4471, 32
  store i256 %1174, ptr %sp4411, align 16
  store i256 0, ptr %sp4413, align 16
  %1175 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4411)
  %.not7298 = icmp eq i8 %1175, 0
  br i1 %.not7298, label %OP1253.SLOAD, label %return, !prof !7

OP1253.SLOAD:                                     ; preds = %OP1249.PUSH1
  %1176 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4411, i8 19)
  %.not7299 = icmp eq i8 %1176, 0
  br i1 %.not7299, label %OP1254.LT, label %return, !prof !7

OP1254.LT:                                        ; preds = %OP1253.SLOAD
  %1177 = load <2 x i256>, ptr %1154, align 16
  %1178 = extractelement <2 x i256> %1177, i64 0
  %1179 = extractelement <2 x i256> %1177, i64 1
  %.not7300 = icmp uge i256 %1179, %1178
  %1180 = zext i1 %.not7300 to i256
  store i256 %1180, ptr %1154, align 16
  %gas.remaining4510.pre = load i64, ptr %gas.remaining.addr, align 8
  br i1 %.not7300, label %OP1263.JUMPDEST, label %OP1260.PUSH1

OP1260.PUSH1:                                     ; preds = %OP1254.LT
  %1181 = add i64 %gas.remaining4510.pre, -6
  %1182 = icmp ult i64 %gas.remaining4510.pre, 6
  store i64 %1181, ptr %gas.remaining.addr, align 8
  br i1 %1182, label %return, label %OP1260.PUSH1.contd4502, !prof !2, !annotation !3

OP1260.PUSH1.contd4502:                           ; preds = %OP1260.PUSH1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %1154, i8 0, i64 64, i1 false)
  %1183 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %1154, i8 16)
  %.not7301 = icmp eq i8 %1183, 0
  %spec.select5565 = select i1 %.not7301, i8 16, i8 %1183, !prof !7
  br label %return

OP1263.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1254.LT
  %gas.remaining4510 = phi i64 [ %gas.remaining4510.pre, %OP1254.LT ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.41 = phi i64 [ %len.addr.40, %OP1254.LT ], [ %len.addr.51, %dynamic_jump_table ]
  %1184 = add i64 %gas.remaining4510, -109
  %1185 = icmp ult i64 %gas.remaining4510, 109
  store i64 %1184, ptr %gas.remaining.addr, align 8
  br i1 %1185, label %return, label %OP1263.JUMPDEST.contd, !prof !2, !annotation !3

OP1263.JUMPDEST.contd:                            ; preds = %OP1263.JUMPDEST
  %1186 = icmp eq i64 %len.addr.41, 0
  %1187 = add i64 %len.addr.41, -1020
  %1188 = icmp ult i64 %1187, -1019
  %1189 = select i1 %1186, i8 91, i8 92
  br i1 %1188, label %return, label %OP1264.DUP1, !prof !2

OP1264.DUP1:                                      ; preds = %OP1263.JUMPDEST.contd
  %1190 = add nuw nsw i64 %len.addr.41, 1
  %1191 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.41
  %sp4514 = getelementptr i256, ptr %1191, i64 -1
  %dup14515 = load i256, ptr %sp4514, align 16
  store i256 %dup14515, ptr %1191, align 16
  %1192 = add nuw nsw i64 %len.addr.41, 2
  %sp4518 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1190
  store i256 3, ptr %sp4518, align 16
  %1193 = add nuw nsw i64 %len.addr.41, 3
  %sp4520 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1192
  store i256 0, ptr %sp4520, align 16
  %1194 = add nuw nsw i64 %len.addr.41, 4
  %contract.caller.addr4522 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4523 = load i160, ptr %contract.caller.addr4522, align 16
  %1195 = tail call i160 @llvm.bswap.i160(i160 %contract.caller4523)
  %1196 = zext i160 %1195 to i256
  %sp4524 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1193
  %1197 = add nuw nsw i64 %len.addr.41, 5
  %sp4526 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1194
  store i256 %1196, ptr %sp4524, align 16
  store i256 0, ptr %sp4526, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !210)
  %ecx.memory.addr.i8205 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8206 = load ptr, ptr %ecx.memory.addr.i8205, align 8, !alias.scope !210
  %ecx.memory.len.addr.i8207 = getelementptr inbounds i8, ptr %ecx.memory.i8206, i64 16
  %ecx.memory.len.i8208 = load i64, ptr %ecx.memory.len.addr.i8207, align 8, !noalias !210
  %ecx.memory.last_checkpoint.addr.i8209 = getelementptr inbounds i8, ptr %ecx.memory.i8206, i64 48
  %ecx.memory.last_checkpoint.i8210 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8209, align 8, !noalias !210
  %1198 = sub i64 %ecx.memory.len.i8208, %ecx.memory.last_checkpoint.i8210
  %1199 = icmp ult i64 %1198, 32
  br i1 %1199, label %resize.i8217, label %OP1274.PUSH1, !prof !2

resize.i8217:                                     ; preds = %OP1264.DUP1
  %1200 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8218 = icmp eq i8 %1200, 0
  br i1 %.not.i8218, label %OP1274.PUSH1, label %return, !prof !7

OP1274.PUSH1:                                     ; preds = %OP1264.DUP1, %resize.i8217
  %ecx.memory.buffer.ptr.shared.addr.i8212 = getelementptr inbounds i8, ptr %ecx.memory.i8206, i64 8
  %ecx.memory.buffer.ptr.shared.i8213 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8212, align 8, !noalias !210
  %ecx.memory.buffer.ptr.i8214 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8213, i64 %ecx.memory.last_checkpoint.i8210
  %1201 = tail call i256 @llvm.bswap.i256(i256 %1196)
  store i256 %1201, ptr %ecx.memory.buffer.ptr.i8214, align 1, !noalias !210
  %b4556 = load i256, ptr %sp4520, align 16
  %1202 = add i256 %b4556, 32
  %swap.b4562 = load i256, ptr %sp4518, align 16
  store i256 %1202, ptr %sp4518, align 16
  store i256 %swap.b4562, ptr %sp4520, align 16
  store i256 %1202, ptr %sp4524, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !213)
  %ecx.memory.i8221 = load ptr, ptr %ecx.memory.addr.i8205, align 8, !alias.scope !213
  %ecx.memory.len.addr.i8222 = getelementptr inbounds i8, ptr %ecx.memory.i8221, i64 16
  %ecx.memory.len.i8223 = load i64, ptr %ecx.memory.len.addr.i8222, align 8, !noalias !213
  %ecx.memory.last_checkpoint.addr.i8224 = getelementptr inbounds i8, ptr %ecx.memory.i8221, i64 48
  %ecx.memory.last_checkpoint.i8225 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8224, align 8, !noalias !213
  %1203 = sub i64 %ecx.memory.len.i8223, %ecx.memory.last_checkpoint.i8225
  %1204 = icmp ugt i256 %1202, 18446744073709551615
  %1205 = trunc i256 %1202 to i64
  %1206 = add i64 %1205, 32
  %1207 = icmp ugt i64 %1205, -33
  %1208 = or i1 %1204, %1207
  %1209 = select i1 %1208, i64 -1, i64 %1206
  %1210 = icmp ugt i64 %1209, %1203
  br i1 %1210, label %resize.i8232, label %OP1279.PUSH1, !prof !2

resize.i8232:                                     ; preds = %OP1274.PUSH1
  %1211 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1209)
  %.not.i8233 = icmp eq i8 %1211, 0
  br i1 %.not.i8233, label %OP1279.PUSH1, label %return, !prof !7

OP1279.PUSH1:                                     ; preds = %OP1274.PUSH1, %resize.i8232
  %ecx.memory.buffer.ptr.shared.addr.i8227 = getelementptr inbounds i8, ptr %ecx.memory.i8221, i64 8
  %ecx.memory.buffer.ptr.shared.i8228 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8227, align 8, !noalias !213
  %ecx.memory.buffer.ptr.i8229 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8228, i64 %ecx.memory.last_checkpoint.i8225
  %slot.i8230 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8229, i64 %1205
  %1212 = tail call i256 @llvm.bswap.i256(i256 %swap.b4562)
  store i256 %1212, ptr %slot.i8230, align 1, !noalias !213
  %b4578 = load i256, ptr %sp4518, align 16
  %1213 = add i256 %b4578, 32
  store i256 %1213, ptr %sp4518, align 16
  store i256 0, ptr %sp4520, align 16
  %1214 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4518)
  %.not7304 = icmp eq i8 %1214, 0
  br i1 %.not7304, label %OP1283.PUSH1, label %return, !prof !7

OP1283.PUSH1:                                     ; preds = %OP1279.PUSH1
  store i256 0, ptr %sp4520, align 16
  %dup34588 = load i256, ptr %1191, align 16
  store i256 %dup34588, ptr %sp4524, align 16
  %dup34592 = load i256, ptr %sp4518, align 16
  store i256 %dup34592, ptr %sp4526, align 16
  %1215 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4526, i8 19)
  %.not7305 = icmp eq i8 %1215, 0
  br i1 %.not7305, label %OP1287.SUB, label %return, !prof !7

OP1287.SUB:                                       ; preds = %OP1283.PUSH1
  %a4598 = load i256, ptr %sp4526, align 16
  %b4600 = load i256, ptr %sp4524, align 16
  %1216 = sub i256 %a4598, %b4600
  %swap.b4606 = load i256, ptr %1191, align 16
  store i256 %1216, ptr %1191, align 16
  store i256 %swap.b4606, ptr %sp4524, align 16
  %swap.b4617 = load i256, ptr %sp4518, align 16
  store i256 %1216, ptr %sp4518, align 16
  store i256 %swap.b4617, ptr %sp4520, align 16
  %1217 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4518, i8 19)
  %.not7306 = icmp eq i8 %1217, 0
  br i1 %.not7306, label %OP1294.POP, label %return, !prof !7

OP1294.POP:                                       ; preds = %OP1287.SUB
  %gas.remaining4620 = load i64, ptr %gas.remaining.addr, align 8
  %1218 = add i64 %gas.remaining4620, -69
  %1219 = icmp ult i64 %gas.remaining4620, 69
  store i64 %1218, ptr %gas.remaining.addr, align 8
  br i1 %1219, label %return, label %OP1294.POP.contd, !prof !2, !annotation !3

OP1294.POP.contd:                                 ; preds = %OP1294.POP
  %1220 = icmp ugt i64 %len.addr.41, 1013
  br i1 %1220, label %return, label %OP1294.POP.contd4622, !prof !2

OP1294.POP.contd4622:                             ; preds = %OP1294.POP.contd
  store i256 %1196, ptr %1191, align 16
  %dup34639 = load i256, ptr %sp4514, align 16
  %1221 = icmp eq i256 %dup34639, 0
  %1222 = select i1 %1221, i256 2300, i256 0
  store i256 %1222, ptr %sp4518, align 16
  store i256 %dup34639, ptr %sp4520, align 16
  store i256 64, ptr %sp4524, align 16
  %ecx.memory.i8236 = load ptr, ptr %ecx.memory.addr.i8205, align 8, !noalias !216
  %ecx.memory.len.addr.i8237 = getelementptr inbounds i8, ptr %ecx.memory.i8236, i64 16
  %ecx.memory.len.i8238 = load i64, ptr %ecx.memory.len.addr.i8237, align 8, !noalias !217
  %ecx.memory.last_checkpoint.addr.i8239 = getelementptr inbounds i8, ptr %ecx.memory.i8236, i64 48
  %ecx.memory.last_checkpoint.i8240 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8239, align 8, !noalias !217
  %1223 = sub i64 %ecx.memory.len.i8238, %ecx.memory.last_checkpoint.i8240
  %1224 = icmp ult i64 %1223, 96
  br i1 %1224, label %resize.i8248, label %OP1306.MLOAD.contd, !prof !2

resize.i8248:                                     ; preds = %OP1294.POP.contd4622
  %1225 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !221
  %.not.i8249 = icmp eq i8 %1225, 0
  br i1 %.not.i8249, label %resize.i8248.OP1306.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8248.OP1306.MLOAD.contd_crit_edge:        ; preds = %resize.i8248
  %ecx.memory.i8252.pre = load ptr, ptr %ecx.memory.addr.i8205, align 8, !alias.scope !222, !noalias !225
  br label %OP1306.MLOAD.contd

OP1306.MLOAD.contd:                               ; preds = %resize.i8248.OP1306.MLOAD.contd_crit_edge, %OP1294.POP.contd4622
  %ecx.memory.i8252 = phi ptr [ %ecx.memory.i8252.pre, %resize.i8248.OP1306.MLOAD.contd_crit_edge ], [ %ecx.memory.i8236, %OP1294.POP.contd4622 ]
  %ecx.memory.buffer.ptr.shared.addr.i8242 = getelementptr inbounds i8, ptr %ecx.memory.i8236, i64 8
  %ecx.memory.buffer.ptr.shared.i8243 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8242, align 8, !noalias !217
  %ecx.memory.buffer.ptr.i8244 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8243, i64 %ecx.memory.last_checkpoint.i8240
  %slot.i8245 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8244, i64 64
  %slot.value.i8246 = load i256, ptr %slot.i8245, align 1, !noalias !217
  %1226 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8246)
  store i256 %1226, ptr %sp4524, align 16
  store i256 0, ptr %sp4526, align 16
  %1227 = add nuw nsw i64 %len.addr.41, 6
  %sp4676 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1197
  store i256 64, ptr %sp4676, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !222)
  %ecx.memory.len.addr.i8253 = getelementptr inbounds i8, ptr %ecx.memory.i8252, i64 16
  %ecx.memory.len.i8254 = load i64, ptr %ecx.memory.len.addr.i8253, align 8, !noalias !227
  %ecx.memory.last_checkpoint.addr.i8255 = getelementptr inbounds i8, ptr %ecx.memory.i8252, i64 48
  %ecx.memory.last_checkpoint.i8256 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8255, align 8, !noalias !227
  %1228 = sub i64 %ecx.memory.len.i8254, %ecx.memory.last_checkpoint.i8256
  %1229 = icmp ult i64 %1228, 96
  br i1 %1229, label %resize.i8264, label %OP1309.MLOAD.contd, !prof !2

resize.i8264:                                     ; preds = %OP1306.MLOAD.contd
  %1230 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !225
  %.not.i8265 = icmp eq i8 %1230, 0
  br i1 %.not.i8265, label %resize.i8264.OP1309.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8264.OP1309.MLOAD.contd_crit_edge:        ; preds = %resize.i8264
  %sp4688.phi.trans.insert = getelementptr i256, ptr %1191, i64 3
  %dup44689.pre = load i256, ptr %sp4688.phi.trans.insert, align 16
  br label %OP1309.MLOAD.contd

OP1309.MLOAD.contd:                               ; preds = %resize.i8264.OP1309.MLOAD.contd_crit_edge, %OP1306.MLOAD.contd
  %dup44689 = phi i256 [ %dup44689.pre, %resize.i8264.OP1309.MLOAD.contd_crit_edge ], [ %1226, %OP1306.MLOAD.contd ]
  %ecx.memory.buffer.ptr.shared.addr.i8258 = getelementptr inbounds i8, ptr %ecx.memory.i8252, i64 8
  %ecx.memory.buffer.ptr.shared.i8259 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8258, align 8, !noalias !227
  %ecx.memory.buffer.ptr.i8260 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8259, i64 %ecx.memory.last_checkpoint.i8256
  %slot.i8261 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8260, i64 64
  %slot.value.i8262 = load i256, ptr %slot.i8261, align 1, !noalias !227
  %1231 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8262)
  store i256 %1231, ptr %sp4676, align 16
  %sp4686 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1227
  %sp4690 = getelementptr i256, ptr %1191, i64 7
  %1232 = sub i256 %dup44689, %1231
  store i256 %1232, ptr %sp4686, align 16
  store i256 %1231, ptr %sp4690, align 16
  %sp4702 = getelementptr i256, ptr %1191, i64 2
  %dup64703 = load i256, ptr %sp4702, align 16
  %sp4704 = getelementptr i256, ptr %1191, i64 8
  store i256 %dup64703, ptr %sp4704, align 16
  %dup9 = load i256, ptr %1191, align 16
  %sp4707 = getelementptr i256, ptr %1191, i64 9
  store i256 %dup9, ptr %sp4707, align 16
  %sp4709 = getelementptr i256, ptr %1191, i64 1
  %dup94710 = load i256, ptr %sp4709, align 16
  %sp4711 = getelementptr i256, ptr %1191, i64 10
  store i256 %dup94710, ptr %sp4711, align 16
  %sp4713 = getelementptr i256, ptr %1191, i64 4
  %1233 = tail call i8 @__revmc_builtin_call(ptr nonnull %arg.ecx.addr, ptr %sp4713, i8 19, i8 0)
  %.not7309 = icmp eq i8 %1233, 0
  br i1 %.not7309, label %suspend, label %return, !prof !7

OP1318.SWAP4:                                     ; preds = %resume
  %gas.remaining4714 = load i64, ptr %gas.remaining.addr, align 8
  %1234 = add i64 %gas.remaining4714, -30
  %1235 = icmp ult i64 %gas.remaining4714, 30
  store i64 %1234, ptr %gas.remaining.addr, align 8
  br i1 %1235, label %return, label %OP1318.SWAP4.contd, !prof !2, !annotation !3

OP1318.SWAP4.contd:                               ; preds = %OP1318.SWAP4
  %1236 = icmp ult i64 %stack_len5539, 5
  br i1 %1236, label %return, label %OP1318.SWAP4.contd4716, !prof !2, !annotation !21

OP1318.SWAP4.contd4716:                           ; preds = %OP1318.SWAP4.contd
  %1237 = getelementptr i256, ptr %arg.stack.addr, i64 %stack_len5539
  %sp4717 = getelementptr i256, ptr %1237, i64 -1
  %swap.a4718 = load i256, ptr %sp4717, align 16
  %sp4719 = getelementptr i256, ptr %1237, i64 -5
  %swap.b4720 = load i256, ptr %sp4719, align 16
  store i256 %swap.b4720, ptr %sp4717, align 16
  %1238 = add i64 %stack_len5539, -5
  %sp4726 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1238
  %1239 = icmp ne i256 %swap.a4718, 0
  %1240 = zext i1 %1239 to i256
  store i256 %1240, ptr %sp4726, align 16
  br i1 %1239, label %OP1330.JUMPDEST, label %OP1327.PUSH1

OP1327.PUSH1:                                     ; preds = %OP1318.SWAP4.contd4716
  %1241 = add i64 %gas.remaining4714, -36
  %1242 = icmp ult i64 %1234, 6
  store i64 %1241, ptr %gas.remaining.addr, align 8
  br i1 %1242, label %return, label %OP1327.PUSH1.contd, !prof !2, !annotation !3

OP1327.PUSH1.contd:                               ; preds = %OP1327.PUSH1
  %1243 = icmp ugt i64 %1238, 1022
  br i1 %1243, label %return, label %OP1327.PUSH1.contd4738, !prof !2, !annotation !8

OP1327.PUSH1.contd4738:                           ; preds = %OP1327.PUSH1.contd
  store i256 0, ptr %sp4726, align 16
  %sp4743 = getelementptr i256, ptr %1237, i64 -4
  store i256 0, ptr %sp4743, align 16
  %1244 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4719, i8 16)
  %.not = icmp eq i8 %1244, 0
  %spec.select5566 = select i1 %.not, i8 16, i8 %1244, !prof !7
  br label %return

OP1330.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1318.SWAP4.contd4716
  %gas.remaining4746 = phi i64 [ %1234, %OP1318.SWAP4.contd4716 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.42 = phi i64 [ %1238, %OP1318.SWAP4.contd4716 ], [ %len.addr.51, %dynamic_jump_table ]
  %1245 = add i64 %gas.remaining4746, -1199
  %1246 = icmp ult i64 %gas.remaining4746, 1199
  store i64 %1245, ptr %gas.remaining.addr, align 8
  br i1 %1246, label %return, label %OP1330.JUMPDEST.contd, !prof !2, !annotation !3

OP1330.JUMPDEST.contd:                            ; preds = %OP1330.JUMPDEST
  %1247 = icmp ult i64 %len.addr.42, 2
  %1248 = add i64 %len.addr.42, -1018
  %1249 = icmp ult i64 %1248, -1016
  %1250 = select i1 %1247, i8 91, i8 92
  br i1 %1249, label %return, label %OP1331.CALLER, !prof !2

OP1331.CALLER:                                    ; preds = %OP1330.JUMPDEST.contd
  %contract.caller.addr4750 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller4751 = load i160, ptr %contract.caller.addr4750, align 16
  %1251 = tail call i160 @llvm.bswap.i160(i160 %contract.caller4751)
  %1252 = zext i160 %1251 to i256
  %sp4752 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.42
  %sp4754 = getelementptr i256, ptr %sp4752, i64 1
  store i256 %1252, ptr %sp4752, align 16
  store i256 57810043145978950376228313794938171962422655018555593468903716172405399886693, ptr %sp4754, align 16
  %sp4764 = getelementptr i256, ptr %sp4752, i64 -1
  %dup34765 = load i256, ptr %sp4764, align 16
  %sp4766 = getelementptr i256, ptr %sp4752, i64 2
  store i256 %dup34765, ptr %sp4766, align 16
  %1253 = add nuw nsw i64 %len.addr.42, 4
  %sp4768 = getelementptr i256, ptr %sp4752, i64 3
  store i256 64, ptr %sp4768, align 16
  %ecx.memory.addr.i8267 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8268 = load ptr, ptr %ecx.memory.addr.i8267, align 8
  %ecx.memory.len.addr.i8269 = getelementptr inbounds i8, ptr %ecx.memory.i8268, i64 16
  %ecx.memory.len.i8270 = load i64, ptr %ecx.memory.len.addr.i8269, align 8, !noalias !228
  %ecx.memory.last_checkpoint.addr.i8271 = getelementptr inbounds i8, ptr %ecx.memory.i8268, i64 48
  %ecx.memory.last_checkpoint.i8272 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8271, align 8, !noalias !228
  %1254 = sub i64 %ecx.memory.len.i8270, %ecx.memory.last_checkpoint.i8272
  %1255 = icmp ult i64 %1254, 96
  br i1 %1255, label %resize.i8280, label %OP1337.MLOAD.contd, !prof !2

resize.i8280:                                     ; preds = %OP1331.CALLER
  %1256 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !232
  %.not.i8281 = icmp eq i8 %1256, 0
  br i1 %.not.i8281, label %resize.i8280.OP1337.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8280.OP1337.MLOAD.contd_crit_edge:        ; preds = %resize.i8280
  %dup34781.pre = load i256, ptr %sp4766, align 16
  %ecx.memory.i8284.pre = load ptr, ptr %ecx.memory.addr.i8267, align 8, !alias.scope !233
  br label %OP1337.MLOAD.contd

OP1337.MLOAD.contd:                               ; preds = %resize.i8280.OP1337.MLOAD.contd_crit_edge, %OP1331.CALLER
  %ecx.memory.i8284 = phi ptr [ %ecx.memory.i8284.pre, %resize.i8280.OP1337.MLOAD.contd_crit_edge ], [ %ecx.memory.i8268, %OP1331.CALLER ]
  %dup34781 = phi i256 [ %dup34781.pre, %resize.i8280.OP1337.MLOAD.contd_crit_edge ], [ %dup34765, %OP1331.CALLER ]
  %ecx.memory.buffer.ptr.shared.addr.i8274 = getelementptr inbounds i8, ptr %ecx.memory.i8268, i64 8
  %ecx.memory.buffer.ptr.shared.i8275 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8274, align 8, !noalias !228
  %ecx.memory.buffer.ptr.i8276 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8275, i64 %ecx.memory.last_checkpoint.i8272
  %slot.i8277 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8276, i64 64
  %slot.value.i8278 = load i256, ptr %slot.i8277, align 1, !noalias !228
  %1257 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8278)
  store i256 %1257, ptr %sp4768, align 16
  %1258 = add nuw nsw i64 %len.addr.42, 5
  %sp4778 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1253
  store i256 %1257, ptr %sp4778, align 16
  %sp4782 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1258
  store i256 %dup34781, ptr %sp4782, align 16
  %sp4786 = getelementptr i256, ptr %sp4752, i64 6
  store i256 %1257, ptr %sp4786, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !233)
  %ecx.memory.len.addr.i8285 = getelementptr inbounds i8, ptr %ecx.memory.i8284, i64 16
  %ecx.memory.len.i8286 = load i64, ptr %ecx.memory.len.addr.i8285, align 8, !noalias !233
  %ecx.memory.last_checkpoint.addr.i8287 = getelementptr inbounds i8, ptr %ecx.memory.i8284, i64 48
  %ecx.memory.last_checkpoint.i8288 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8287, align 8, !noalias !233
  %1259 = sub i64 %ecx.memory.len.i8286, %ecx.memory.last_checkpoint.i8288
  %1260 = icmp ugt i256 %1257, 18446744073709551615
  %1261 = trunc i256 %1257 to i64
  %1262 = add i64 %1261, 32
  %1263 = icmp ugt i64 %1261, -33
  %1264 = or i1 %1260, %1263
  %1265 = select i1 %1264, i64 -1, i64 %1262
  %1266 = icmp ugt i64 %1265, %1259
  br i1 %1266, label %resize.i8295, label %OP1342.PUSH1, !prof !2

resize.i8295:                                     ; preds = %OP1337.MLOAD.contd
  %1267 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1265)
  %.not.i8296 = icmp eq i8 %1267, 0
  br i1 %.not.i8296, label %OP1342.PUSH1, label %return, !prof !7

OP1342.PUSH1:                                     ; preds = %OP1337.MLOAD.contd, %resize.i8295
  %ecx.memory.buffer.ptr.shared.addr.i8290 = getelementptr inbounds i8, ptr %ecx.memory.i8284, i64 8
  %ecx.memory.buffer.ptr.shared.i8291 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8290, align 8, !noalias !233
  %ecx.memory.buffer.ptr.i8292 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8291, i64 %ecx.memory.last_checkpoint.i8288
  %slot.i8293 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8292, i64 %1261
  %1268 = tail call i256 @llvm.bswap.i256(i256 %dup34781)
  store i256 %1268, ptr %slot.i8293, align 1, !noalias !233
  store i256 32, ptr %sp4782, align 16
  %b4798 = load i256, ptr %sp4778, align 16
  %1269 = add i256 %b4798, 32
  %swap.b4804 = load i256, ptr %sp4766, align 16
  store i256 %1269, ptr %sp4766, align 16
  store i256 %swap.b4804, ptr %sp4778, align 16
  store i256 64, ptr %sp4768, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !236)
  %ecx.memory.i8299 = load ptr, ptr %ecx.memory.addr.i8267, align 8, !alias.scope !236, !noalias !239
  %ecx.memory.len.addr.i8300 = getelementptr inbounds i8, ptr %ecx.memory.i8299, i64 16
  %ecx.memory.len.i8301 = load i64, ptr %ecx.memory.len.addr.i8300, align 8, !noalias !241
  %ecx.memory.last_checkpoint.addr.i8302 = getelementptr inbounds i8, ptr %ecx.memory.i8299, i64 48
  %ecx.memory.last_checkpoint.i8303 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8302, align 8, !noalias !241
  %1270 = sub i64 %ecx.memory.len.i8301, %ecx.memory.last_checkpoint.i8303
  %1271 = icmp ult i64 %1270, 96
  br i1 %1271, label %resize.i8311, label %OP1348.MLOAD.contd, !prof !2

resize.i8311:                                     ; preds = %OP1342.PUSH1
  %1272 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !239
  %.not.i8312 = icmp eq i8 %1272, 0
  br i1 %.not.i8312, label %resize.i8311.OP1348.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8311.OP1348.MLOAD.contd_crit_edge:        ; preds = %resize.i8311
  %swap.b4823.pre = load i256, ptr %sp4766, align 16
  br label %OP1348.MLOAD.contd

OP1348.MLOAD.contd:                               ; preds = %resize.i8311.OP1348.MLOAD.contd_crit_edge, %OP1342.PUSH1
  %swap.b4823 = phi i256 [ %swap.b4823.pre, %resize.i8311.OP1348.MLOAD.contd_crit_edge ], [ %1269, %OP1342.PUSH1 ]
  %ecx.memory.buffer.ptr.shared.addr.i8305 = getelementptr inbounds i8, ptr %ecx.memory.i8299, i64 8
  %ecx.memory.buffer.ptr.shared.i8306 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8305, align 8, !noalias !241
  %ecx.memory.buffer.ptr.i8307 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8306, i64 %ecx.memory.last_checkpoint.i8303
  %slot.i8308 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8307, i64 64
  %slot.value.i8309 = load i256, ptr %slot.i8308, align 1, !noalias !241
  %1273 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8309)
  store i256 %swap.b4823, ptr %sp4778, align 16
  %1274 = sub i256 %swap.b4823, %1273
  store i256 %1274, ptr %sp4766, align 16
  store i256 %1273, ptr %sp4768, align 16
  %1275 = tail call i8 @__revmc_builtin_log(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4752, i8 2)
  %.not7236 = icmp eq i8 %1275, 0
  br i1 %.not7236, label %OP1354.POP, label %return, !prof !7

OP1354.POP:                                       ; preds = %OP1348.MLOAD.contd
  %1276 = add nsw i64 %len.addr.42, -2
  %sp4839 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1276
  %a4840 = load i256, ptr %sp4839, align 16
  br label %dynamic_jump_table.preheader

OP1356.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP382.PUSH2
  %gas.remaining4841 = phi i64 [ %326, %OP382.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.43 = phi i64 [ %329, %OP382.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1277 = add i64 %gas.remaining4841, -51
  %1278 = icmp ult i64 %gas.remaining4841, 51
  store i64 %1277, ptr %gas.remaining.addr, align 8
  br i1 %1278, label %return, label %OP1356.JUMPDEST.contd, !prof !2, !annotation !3

OP1356.JUMPDEST.contd:                            ; preds = %OP1356.JUMPDEST
  %1279 = icmp eq i64 %len.addr.43, 0
  %1280 = add i64 %len.addr.43, -1022
  %1281 = icmp ult i64 %1280, -1021
  %1282 = select i1 %1279, i8 91, i8 92
  br i1 %1281, label %return, label %OP1357.PUSH1, !prof !2

OP1357.PUSH1:                                     ; preds = %OP1356.JUMPDEST.contd
  %1283 = add nuw nsw i64 %len.addr.43, 1
  %sp4845 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.43
  %1284 = add nuw nsw i64 %len.addr.43, 2
  %sp4847 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1283
  store i256 0, ptr %sp4845, align 16
  store i256 2, ptr %sp4847, align 16
  %1285 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4847, i8 19)
  %.not7293 = icmp eq i8 %1285, 0
  br i1 %.not7293, label %OP1361.SWAP1, label %return, !prof !7

OP1361.SWAP1:                                     ; preds = %OP1357.PUSH1
  %swap.a4857 = load i256, ptr %sp4847, align 16
  %swap.b4859 = load i256, ptr %sp4845, align 16
  store i256 %swap.a4857, ptr %sp4845, align 16
  store i256 %swap.b4859, ptr %sp4847, align 16
  %sp4861 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1284
  store i256 256, ptr %sp4861, align 16
  %1286 = tail call i8 @__revmc_builtin_exp(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4847, i8 19)
  %.not7294 = icmp eq i8 %1286, 0
  br i1 %.not7294, label %OP1364.SWAP1, label %return, !prof !7

OP1364.SWAP1:                                     ; preds = %OP1361.SWAP1
  %swap.a4866 = load i256, ptr %sp4847, align 16
  %swap.b4868 = load i256, ptr %sp4845, align 16
  %1287 = udiv i256 %swap.b4868, %swap.a4866
  %1288 = and i256 %1287, 255
  store i256 %1288, ptr %sp4845, align 16
  %sp4884 = getelementptr i256, ptr %sp4845, i64 -1
  %dup24885 = load i256, ptr %sp4884, align 16
  store i256 %dup24885, ptr %sp4847, align 16
  br label %dynamic_jump_table.preheader

OP1370.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP417.PUSH2
  %gas.remaining4890 = phi i64 [ %357, %OP417.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.44 = phi i64 [ %360, %OP417.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1289 = add i64 %gas.remaining4890, -79
  %1290 = icmp ult i64 %gas.remaining4890, 79
  store i64 %1289, ptr %gas.remaining.addr, align 8
  br i1 %1290, label %return, label %OP1370.JUMPDEST.contd, !prof !2, !annotation !3

OP1370.JUMPDEST.contd:                            ; preds = %OP1370.JUMPDEST
  %1291 = icmp ult i64 %len.addr.44, 2
  %1292 = add i64 %len.addr.44, -1023
  %1293 = icmp ult i64 %1292, -1021
  %1294 = select i1 %1291, i8 91, i8 92
  br i1 %1293, label %return, label %OP1371.PUSH1, !prof !2

OP1371.PUSH1:                                     ; preds = %OP1370.JUMPDEST.contd
  %1295 = add nuw nsw i64 %len.addr.44, 1
  %sp4894 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.44
  store i256 3, ptr %sp4894, align 16
  %sp4896 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1295
  store i256 32, ptr %sp4896, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !242)
  %ecx.memory.addr.i8314 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8315 = load ptr, ptr %ecx.memory.addr.i8314, align 8, !alias.scope !242
  %ecx.memory.len.addr.i8316 = getelementptr inbounds i8, ptr %ecx.memory.i8315, i64 16
  %ecx.memory.len.i8317 = load i64, ptr %ecx.memory.len.addr.i8316, align 8, !noalias !242
  %ecx.memory.last_checkpoint.addr.i8318 = getelementptr inbounds i8, ptr %ecx.memory.i8315, i64 48
  %ecx.memory.last_checkpoint.i8319 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8318, align 8, !noalias !242
  %1296 = sub i64 %ecx.memory.len.i8317, %ecx.memory.last_checkpoint.i8319
  %1297 = icmp ult i64 %1296, 64
  br i1 %1297, label %resize.i8326, label %OP1374.DUP1, !prof !2

resize.i8326:                                     ; preds = %OP1371.PUSH1
  %1298 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 64)
  %.not.i8327 = icmp eq i8 %1298, 0
  br i1 %.not.i8327, label %OP1374.DUP1, label %return, !prof !7

OP1374.DUP1:                                      ; preds = %OP1371.PUSH1, %resize.i8326
  %ecx.memory.buffer.ptr.shared.addr.i8321 = getelementptr inbounds i8, ptr %ecx.memory.i8315, i64 8
  %ecx.memory.buffer.ptr.shared.i8322 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8321, align 8, !noalias !242
  %ecx.memory.buffer.ptr.i8323 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8322, i64 %ecx.memory.last_checkpoint.i8319
  %slot.i8324 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8323, i64 32
  store i256 1356938545749799165119972480570561420155507632800475359837393562592731987968, ptr %slot.i8324, align 1, !noalias !242
  %sp4903 = getelementptr i256, ptr %sp4894, i64 -1
  %dup14904 = load i256, ptr %sp4903, align 16
  store i256 %dup14904, ptr %sp4894, align 16
  store i256 0, ptr %sp4896, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !245)
  %ecx.memory.i8330 = load ptr, ptr %ecx.memory.addr.i8314, align 8, !alias.scope !245
  %ecx.memory.len.addr.i8331 = getelementptr inbounds i8, ptr %ecx.memory.i8330, i64 16
  %ecx.memory.len.i8332 = load i64, ptr %ecx.memory.len.addr.i8331, align 8, !noalias !245
  %ecx.memory.last_checkpoint.addr.i8333 = getelementptr inbounds i8, ptr %ecx.memory.i8330, i64 48
  %ecx.memory.last_checkpoint.i8334 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8333, align 8, !noalias !245
  %1299 = sub i64 %ecx.memory.len.i8332, %ecx.memory.last_checkpoint.i8334
  %1300 = icmp ult i64 %1299, 32
  br i1 %1300, label %resize.i8340, label %OP1377.PUSH1, !prof !2

resize.i8340:                                     ; preds = %OP1374.DUP1
  %1301 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8341 = icmp eq i8 %1301, 0
  br i1 %.not.i8341, label %OP1377.PUSH1, label %return, !prof !7

OP1377.PUSH1:                                     ; preds = %OP1374.DUP1, %resize.i8340
  %ecx.memory.buffer.ptr.shared.addr.i8336 = getelementptr inbounds i8, ptr %ecx.memory.i8330, i64 8
  %ecx.memory.buffer.ptr.shared.i8337 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8336, align 8, !noalias !245
  %ecx.memory.buffer.ptr.i8338 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8337, i64 %ecx.memory.last_checkpoint.i8334
  %1302 = tail call i256 @llvm.bswap.i256(i256 %dup14904)
  store i256 %1302, ptr %ecx.memory.buffer.ptr.i8338, align 1, !noalias !245
  store i256 64, ptr %sp4894, align 16
  store i256 0, ptr %sp4896, align 16
  %1303 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4894)
  %.not7286 = icmp eq i8 %1303, 0
  br i1 %.not7286, label %OP1380.PUSH1, label %return, !prof !7

OP1380.PUSH1:                                     ; preds = %OP1377.PUSH1
  %swap.b4925 = load i256, ptr %sp4903, align 16
  store i256 %swap.b4925, ptr %sp4896, align 16
  %swap.a4929 = load i256, ptr %sp4894, align 16
  store i256 %swap.a4929, ptr %sp4903, align 16
  store i256 0, ptr %sp4894, align 16
  %1304 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4903, i8 19)
  %.not7287 = icmp eq i8 %1304, 0
  br i1 %.not7287, label %OP1386.DUP2, label %return, !prof !7

OP1386.DUP2:                                      ; preds = %OP1380.PUSH1
  %sp4936 = getelementptr i256, ptr %sp4894, i64 -2
  %dup24937 = load i256, ptr %sp4936, align 16
  store i256 %dup24937, ptr %sp4894, align 16
  br label %dynamic_jump_table.preheader

OP1388.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP462.PUSH2
  %gas.remaining4942 = phi i64 [ %391, %OP462.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.45 = phi i64 [ %394, %OP462.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1305 = add i64 %gas.remaining4942, -194
  %1306 = icmp ult i64 %gas.remaining4942, 194
  store i64 %1305, ptr %gas.remaining.addr, align 8
  br i1 %1306, label %return, label %OP1388.JUMPDEST.contd, !prof !2, !annotation !3

OP1388.JUMPDEST.contd:                            ; preds = %OP1388.JUMPDEST
  %1307 = icmp ugt i64 %len.addr.45, 1015
  br i1 %1307, label %return, label %OP1389.PUSH1, !prof !2, !annotation !8

OP1389.PUSH1:                                     ; preds = %OP1388.JUMPDEST.contd
  %sp4946 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.45
  store i256 1, ptr %sp4946, align 16
  %1308 = add nuw nsw i64 %len.addr.45, 2
  %sp4950 = getelementptr i256, ptr %sp4946, i64 1
  store i256 1, ptr %sp4950, align 16
  %1309 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp4950, i8 19)
  %.not7268 = icmp eq i8 %1309, 0
  br i1 %.not7268, label %OP1392.PUSH1, label %return, !prof !7

OP1392.PUSH1:                                     ; preds = %OP1389.PUSH1
  %1310 = add nuw nsw i64 %len.addr.45, 3
  %sp4954 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1308
  %1311 = add nuw nsw i64 %len.addr.45, 4
  %dup24957 = load i256, ptr %sp4950, align 16
  %sp4958 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1310
  %sp4960 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1311
  %1312 = shl i256 %dup24957, 8
  %1313 = and i256 %1312, 256
  %1314 = xor i256 %1313, 256
  %1315 = add nsw i256 %1314, -1
  %1316 = and i256 %1315, %dup24957
  %1317 = lshr i256 %1316, 1
  store i256 %1317, ptr %sp4950, align 16
  %1318 = add nuw i256 %1317, 31
  store i256 %1318, ptr %sp4960, align 16
  %1319 = and i256 %1318, -32
  %1320 = add nuw i256 %1319, 32
  store i256 %1320, ptr %sp4954, align 16
  store i256 64, ptr %sp4958, align 16
  %ecx.memory.addr.i8343 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8344 = load ptr, ptr %ecx.memory.addr.i8343, align 8
  %ecx.memory.len.addr.i8345 = getelementptr inbounds i8, ptr %ecx.memory.i8344, i64 16
  %ecx.memory.len.i8346 = load i64, ptr %ecx.memory.len.addr.i8345, align 8, !noalias !248
  %ecx.memory.last_checkpoint.addr.i8347 = getelementptr inbounds i8, ptr %ecx.memory.i8344, i64 48
  %ecx.memory.last_checkpoint.i8348 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8347, align 8, !noalias !248
  %1321 = sub i64 %ecx.memory.len.i8346, %ecx.memory.last_checkpoint.i8348
  %1322 = icmp ult i64 %1321, 96
  br i1 %1322, label %resize.i8356, label %OP1415.MLOAD.contd, !prof !2

resize.i8356:                                     ; preds = %OP1392.PUSH1
  %1323 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !252
  %.not.i8357 = icmp eq i8 %1323, 0
  br i1 %.not.i8357, label %resize.i8356.OP1415.MLOAD.contd_crit_edge, label %return, !prof !7

resize.i8356.OP1415.MLOAD.contd_crit_edge:        ; preds = %resize.i8356
  %swap.b5059.pre = load i256, ptr %sp4954, align 16
  %ecx.memory.i8360.pre = load ptr, ptr %ecx.memory.addr.i8343, align 8, !alias.scope !253
  br label %OP1415.MLOAD.contd

OP1415.MLOAD.contd:                               ; preds = %resize.i8356.OP1415.MLOAD.contd_crit_edge, %OP1392.PUSH1
  %ecx.memory.i8360 = phi ptr [ %ecx.memory.i8360.pre, %resize.i8356.OP1415.MLOAD.contd_crit_edge ], [ %ecx.memory.i8344, %OP1392.PUSH1 ]
  %swap.b5059 = phi i256 [ %swap.b5059.pre, %resize.i8356.OP1415.MLOAD.contd_crit_edge ], [ %1320, %OP1392.PUSH1 ]
  %ecx.memory.buffer.ptr.shared.addr.i8350 = getelementptr inbounds i8, ptr %ecx.memory.i8344, i64 8
  %ecx.memory.buffer.ptr.shared.i8351 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8350, align 8, !noalias !248
  %ecx.memory.buffer.ptr.i8352 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8351, i64 %ecx.memory.last_checkpoint.i8348
  %slot.i8353 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8352, i64 64
  %slot.value.i8354 = load i256, ptr %slot.i8353, align 1, !noalias !248
  %1324 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i8354)
  store i256 %1324, ptr %sp4954, align 16
  %1325 = add i256 %swap.b5059, %1324
  store i256 %1325, ptr %sp4958, align 16
  store i256 64, ptr %sp4960, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !253)
  %ecx.memory.len.addr.i8361 = getelementptr inbounds i8, ptr %ecx.memory.i8360, i64 16
  %ecx.memory.len.i8362 = load i64, ptr %ecx.memory.len.addr.i8361, align 8, !noalias !253
  %ecx.memory.last_checkpoint.addr.i8363 = getelementptr inbounds i8, ptr %ecx.memory.i8360, i64 48
  %ecx.memory.last_checkpoint.i8364 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8363, align 8, !noalias !253
  %1326 = sub i64 %ecx.memory.len.i8362, %ecx.memory.last_checkpoint.i8364
  %1327 = icmp ult i64 %1326, 96
  br i1 %1327, label %resize.i8371, label %OP1421.DUP1, !prof !2

resize.i8371:                                     ; preds = %OP1415.MLOAD.contd
  %1328 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96)
  %.not.i8372 = icmp eq i8 %1328, 0
  br i1 %.not.i8372, label %OP1421.DUP1, label %return, !prof !7

OP1421.DUP1:                                      ; preds = %OP1415.MLOAD.contd, %resize.i8371
  %ecx.memory.buffer.ptr.shared.addr.i8366 = getelementptr inbounds i8, ptr %ecx.memory.i8360, i64 8
  %ecx.memory.buffer.ptr.shared.i8367 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8366, align 8, !noalias !253
  %ecx.memory.buffer.ptr.i8368 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8367, i64 %ecx.memory.last_checkpoint.i8364
  %slot.i8369 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8368, i64 64
  %1329 = tail call i256 @llvm.bswap.i256(i256 %1325)
  store i256 %1329, ptr %slot.i8369, align 1, !noalias !253
  %dup15079 = load i256, ptr %sp4954, align 16
  %swap.b5085 = load i256, ptr %sp4946, align 16
  store i256 %dup15079, ptr %sp4946, align 16
  %swap.b5090 = load i256, ptr %sp4950, align 16
  store i256 %swap.b5085, ptr %sp4950, align 16
  store i256 %swap.b5090, ptr %sp4954, align 16
  store i256 %dup15079, ptr %sp4958, align 16
  store i256 %swap.b5090, ptr %sp4960, align 16
  %1330 = add nuw nsw i64 %len.addr.45, 6
  %sp5103 = getelementptr i256, ptr %sp4946, i64 5
  store i256 %dup15079, ptr %sp5103, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !256)
  %ecx.memory.i8375 = load ptr, ptr %ecx.memory.addr.i8343, align 8, !alias.scope !256
  %ecx.memory.len.addr.i8376 = getelementptr inbounds i8, ptr %ecx.memory.i8375, i64 16
  %ecx.memory.len.i8377 = load i64, ptr %ecx.memory.len.addr.i8376, align 8, !noalias !256
  %ecx.memory.last_checkpoint.addr.i8378 = getelementptr inbounds i8, ptr %ecx.memory.i8375, i64 48
  %ecx.memory.last_checkpoint.i8379 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8378, align 8, !noalias !256
  %1331 = sub i64 %ecx.memory.len.i8377, %ecx.memory.last_checkpoint.i8379
  %1332 = icmp ugt i256 %dup15079, 18446744073709551615
  %1333 = trunc i256 %dup15079 to i64
  %1334 = add i64 %1333, 32
  %1335 = icmp ugt i64 %1333, -33
  %1336 = or i1 %1332, %1335
  %1337 = select i1 %1336, i64 -1, i64 %1334
  %1338 = icmp ugt i64 %1337, %1331
  br i1 %1338, label %resize.i8386, label %OP1428.PUSH1, !prof !2

resize.i8386:                                     ; preds = %OP1421.DUP1
  %1339 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1337)
  %.not.i8387 = icmp eq i8 %1339, 0
  br i1 %.not.i8387, label %OP1428.PUSH1, label %return, !prof !7

OP1428.PUSH1:                                     ; preds = %OP1421.DUP1, %resize.i8386
  %ecx.memory.buffer.ptr.shared.addr.i8381 = getelementptr inbounds i8, ptr %ecx.memory.i8375, i64 8
  %ecx.memory.buffer.ptr.shared.i8382 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8381, align 8, !noalias !256
  %ecx.memory.buffer.ptr.i8383 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8382, i64 %ecx.memory.last_checkpoint.i8379
  %slot.i8384 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8383, i64 %1333
  %1340 = tail call i256 @llvm.bswap.i256(i256 %swap.b5090)
  store i256 %1340, ptr %slot.i8384, align 1, !noalias !256
  %b5115 = load i256, ptr %sp4958, align 16
  %1341 = add i256 %b5115, 32
  store i256 %1341, ptr %sp4958, align 16
  %dup35119 = load i256, ptr %sp4950, align 16
  store i256 %dup35119, ptr %sp4960, align 16
  store i256 %dup35119, ptr %sp5103, align 16
  %1342 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp5103, i8 19)
  %.not7272 = icmp eq i8 %1342, 0
  br i1 %.not7272, label %OP1433.PUSH1, label %return, !prof !7

OP1433.PUSH1:                                     ; preds = %OP1428.PUSH1
  %sp5128 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1330
  %dup25131 = load i256, ptr %sp5103, align 16
  %sp5132 = getelementptr i256, ptr %sp4946, i64 7
  %1343 = add nuw nsw i64 %len.addr.45, 9
  %sp5134 = getelementptr i256, ptr %sp4946, i64 8
  store i256 256, ptr %sp5134, align 16
  %1344 = shl i256 %dup25131, 8
  %1345 = and i256 %1344, 256
  %1346 = xor i256 %1345, 256
  store i256 %1346, ptr %sp5132, align 16
  %1347 = add nsw i256 %1346, -1
  %1348 = and i256 %1347, %dup25131
  %1349 = lshr i256 %1348, 1
  store i256 %1349, ptr %sp5103, align 16
  %1350 = icmp ult i256 %1348, 2
  %1351 = zext i1 %1350 to i256
  store i256 %1351, ptr %sp5128, align 16
  %gas.remaining5402.pre8952 = load i64, ptr %gas.remaining.addr, align 8
  br i1 %1350, label %OP1503.JUMPDEST, label %OP1449.DUP1

OP1449.DUP1:                                      ; preds = %OP1433.PUSH1
  %1352 = add i64 %gas.remaining5402.pre8952, -22
  %1353 = icmp ult i64 %gas.remaining5402.pre8952, 22
  store i64 %1352, ptr %gas.remaining.addr, align 8
  br i1 %1353, label %return, label %OP1449.DUP1.contd5191, !prof !2, !annotation !3

OP1449.DUP1.contd5191:                            ; preds = %OP1449.DUP1
  store i256 31, ptr %sp5132, align 16
  %1354 = icmp ugt i256 %1348, 63
  %1355 = zext i1 %1354 to i256
  store i256 %1355, ptr %sp5128, align 16
  br i1 %1354, label %OP1468.JUMPDEST, label %OP1454.PUSH2

OP1454.PUSH2:                                     ; preds = %OP1449.DUP1.contd5191
  %1356 = add i64 %gas.remaining5402.pre8952, -70
  %1357 = icmp ult i64 %1352, 48
  store i64 %1356, ptr %gas.remaining.addr, align 8
  br i1 %1357, label %return, label %OP1454.PUSH2.contd5208, !prof !2, !annotation !3

OP1454.PUSH2.contd5208:                           ; preds = %OP1454.PUSH2
  store i256 256, ptr %sp5128, align 16
  store i256 256, ptr %sp5132, align 16
  %sp5215 = getelementptr i256, ptr %sp4946, i64 4
  %dup45216 = load i256, ptr %sp5215, align 16
  store i256 %dup45216, ptr %sp5134, align 16
  %1358 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp5134, i8 19)
  %.not7273 = icmp eq i8 %1358, 0
  br i1 %.not7273, label %OP1458.DIV, label %return, !prof !7

OP1458.DIV:                                       ; preds = %OP1454.PUSH2.contd5208
  %a5222 = load i256, ptr %sp5134, align 16
  %b5224 = load i256, ptr %sp5132, align 16
  %1359 = udiv i256 %a5222, %b5224
  %b5230 = load i256, ptr %sp5128, align 16
  %1360 = mul i256 %b5230, %1359
  store i256 %1360, ptr %sp5128, align 16
  %sp5233 = getelementptr i256, ptr %sp4946, i64 3
  %dup45234 = load i256, ptr %sp5233, align 16
  store i256 %dup45234, ptr %sp5132, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !259)
  %ecx.memory.i8390 = load ptr, ptr %ecx.memory.addr.i8343, align 8, !alias.scope !259
  %ecx.memory.len.addr.i8391 = getelementptr inbounds i8, ptr %ecx.memory.i8390, i64 16
  %ecx.memory.len.i8392 = load i64, ptr %ecx.memory.len.addr.i8391, align 8, !noalias !259
  %ecx.memory.last_checkpoint.addr.i8393 = getelementptr inbounds i8, ptr %ecx.memory.i8390, i64 48
  %ecx.memory.last_checkpoint.i8394 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8393, align 8, !noalias !259
  %1361 = sub i64 %ecx.memory.len.i8392, %ecx.memory.last_checkpoint.i8394
  %1362 = icmp ugt i256 %dup45234, 18446744073709551615
  %1363 = trunc i256 %dup45234 to i64
  %1364 = add i64 %1363, 32
  %1365 = icmp ugt i64 %1363, -33
  %1366 = or i1 %1362, %1365
  %1367 = select i1 %1366, i64 -1, i64 %1364
  %1368 = icmp ugt i64 %1367, %1361
  br i1 %1368, label %resize.i8401, label %OP1462.SWAP2, !prof !2

resize.i8401:                                     ; preds = %OP1458.DIV
  %1369 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1367)
  %.not.i8402 = icmp eq i8 %1369, 0
  br i1 %.not.i8402, label %OP1462.SWAP2, label %return, !prof !7

OP1462.SWAP2:                                     ; preds = %OP1458.DIV, %resize.i8401
  %ecx.memory.buffer.ptr.shared.addr.i8396 = getelementptr inbounds i8, ptr %ecx.memory.i8390, i64 8
  %ecx.memory.buffer.ptr.shared.i8397 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8396, align 8, !noalias !259
  %ecx.memory.buffer.ptr.i8398 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8397, i64 %ecx.memory.last_checkpoint.i8394
  %slot.i8399 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8398, i64 %1363
  %1370 = tail call i256 @llvm.bswap.i256(i256 %1360)
  store i256 %1370, ptr %slot.i8399, align 1, !noalias !259
  %swap.b5245 = load i256, ptr %sp4958, align 16
  store i256 32, ptr %sp5128, align 16
  %1371 = add i256 %swap.b5245, 32
  store i256 %1371, ptr %sp4958, align 16
  %gas.remaining5402.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP1503.JUMPDEST

OP1468.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1449.DUP1.contd5191
  %gas.remaining5260 = phi i64 [ %1352, %OP1449.DUP1.contd5191 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.46 = phi i64 [ %1330, %OP1449.DUP1.contd5191 ], [ %len.addr.51, %dynamic_jump_table ]
  %1372 = add i64 %gas.remaining5260, -58
  %1373 = icmp ult i64 %gas.remaining5260, 58
  store i64 %1372, ptr %gas.remaining.addr, align 8
  br i1 %1373, label %return, label %OP1468.JUMPDEST.contd, !prof !2, !annotation !3

OP1468.JUMPDEST.contd:                            ; preds = %OP1468.JUMPDEST
  %1374 = icmp ult i64 %len.addr.46, 3
  %1375 = add i64 %len.addr.46, -1024
  %1376 = icmp ult i64 %1375, -1021
  %1377 = select i1 %1374, i8 91, i8 92
  br i1 %1376, label %return, label %OP1469.DUP3, !prof !2

OP1469.DUP3:                                      ; preds = %OP1468.JUMPDEST.contd
  %1378 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.46
  %sp5264 = getelementptr i256, ptr %1378, i64 -3
  %dup35265 = load i256, ptr %sp5264, align 16
  %1379 = add nsw i64 %len.addr.46, -1
  %sp5270 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1379
  %b5271 = load i256, ptr %sp5270, align 16
  %1380 = add i256 %b5271, %dup35265
  %sp5274 = getelementptr i256, ptr %1378, i64 -1
  store i256 %1380, ptr %sp5264, align 16
  %sp5281 = getelementptr i256, ptr %1378, i64 -2
  %swap.b5282 = load i256, ptr %sp5281, align 16
  store i256 %dup35265, ptr %sp5281, align 16
  store i256 %swap.b5282, ptr %sp5274, align 16
  store i256 0, ptr %1378, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !262)
  %ecx.memory.addr.i8404 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8405 = load ptr, ptr %ecx.memory.addr.i8404, align 8, !alias.scope !262
  %ecx.memory.len.addr.i8406 = getelementptr inbounds i8, ptr %ecx.memory.i8405, i64 16
  %ecx.memory.len.i8407 = load i64, ptr %ecx.memory.len.addr.i8406, align 8, !noalias !262
  %ecx.memory.last_checkpoint.addr.i8408 = getelementptr inbounds i8, ptr %ecx.memory.i8405, i64 48
  %ecx.memory.last_checkpoint.i8409 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8408, align 8, !noalias !262
  %1381 = sub i64 %ecx.memory.len.i8407, %ecx.memory.last_checkpoint.i8409
  %1382 = icmp ult i64 %1381, 32
  br i1 %1382, label %resize.i8415, label %OP1475.PUSH1, !prof !2

resize.i8415:                                     ; preds = %OP1469.DUP3
  %1383 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8416 = icmp eq i8 %1383, 0
  br i1 %.not.i8416, label %OP1475.PUSH1, label %return, !prof !7

OP1475.PUSH1:                                     ; preds = %OP1469.DUP3, %resize.i8415
  %ecx.memory.buffer.ptr.shared.addr.i8411 = getelementptr inbounds i8, ptr %ecx.memory.i8405, i64 8
  %ecx.memory.buffer.ptr.shared.i8412 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8411, align 8, !noalias !262
  %ecx.memory.buffer.ptr.i8413 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8412, i64 %ecx.memory.last_checkpoint.i8409
  %1384 = tail call i256 @llvm.bswap.i256(i256 %swap.b5282)
  store i256 %1384, ptr %ecx.memory.buffer.ptr.i8413, align 1, !noalias !262
  store i256 32, ptr %sp5270, align 16
  store i256 0, ptr %1378, align 16
  %1385 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp5274)
  %.not7276 = icmp eq i8 %1385, 0
  br i1 %.not7276, label %OP1478.SWAP1, label %return, !prof !7

OP1478.SWAP1:                                     ; preds = %OP1475.PUSH1
  %swap.a5298 = load i256, ptr %sp5274, align 16
  %swap.b5300 = load i256, ptr %sp5281, align 16
  store i256 %swap.a5298, ptr %sp5281, align 16
  store i256 %swap.b5300, ptr %sp5274, align 16
  br label %OP1479.JUMPDEST.preheader, !annotation !10

OP1479.JUMPDEST.preheader:                        ; preds = %dynamic_jump_table, %OP1478.SWAP1
  %len.addr.47.ph = phi i64 [ %len.addr.46, %OP1478.SWAP1 ], [ %len.addr.51, %dynamic_jump_table ]
  %len.addr.47.ph.fr = freeze i64 %len.addr.47.ph
  %1386 = add i64 %len.addr.47.ph.fr, -1023
  %1387 = icmp ult i64 %1386, -1020
  %1388 = add nuw nsw i64 %len.addr.47.ph.fr, 1
  %1389 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.47.ph.fr
  %sp5305 = getelementptr i256, ptr %1389, i64 -2
  %sp5311 = getelementptr i256, ptr %1389, i64 -1
  %sp5313 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1388
  %ecx.memory.addr.i8418 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %sp5350 = getelementptr i256, ptr %1389, i64 -3
  br i1 %1387, label %OP1479.JUMPDEST.us, label %OP1479.JUMPDEST, !prof !2

OP1479.JUMPDEST.us:                               ; preds = %OP1479.JUMPDEST.preheader
  %gas.remaining5301.us = load i64, ptr %gas.remaining.addr, align 8
  %1390 = add i64 %gas.remaining5301.us, -50
  %1391 = icmp ult i64 %gas.remaining5301.us, 50
  store i64 %1390, ptr %gas.remaining.addr, align 8
  br i1 %1391, label %return, label %return.loopexit8691.split.loop.exit8791, !prof !2, !annotation !3

OP1479.JUMPDEST:                                  ; preds = %OP1479.JUMPDEST.preheader, %OP1484.SWAP1
  %gas.remaining5301 = load i64, ptr %gas.remaining.addr, align 8
  %1392 = add i64 %gas.remaining5301, -50
  %1393 = icmp ult i64 %gas.remaining5301, 50
  store i64 %1392, ptr %gas.remaining.addr, align 8
  br i1 %1393, label %return, label %OP1479.JUMPDEST.contd, !prof !2, !annotation !3

OP1479.JUMPDEST.contd:                            ; preds = %OP1479.JUMPDEST
  %dup25306 = load i256, ptr %sp5305, align 16
  store i256 %dup25306, ptr %1389, align 16
  %1394 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %1389, i8 19)
  %.not7277 = icmp eq i8 %1394, 0
  br i1 %.not7277, label %OP1482.DUP2, label %return, !prof !7

OP1482.DUP2:                                      ; preds = %OP1479.JUMPDEST.contd
  %dup25312 = load i256, ptr %sp5311, align 16
  store i256 %dup25312, ptr %sp5313, align 16
  %b5318 = load i256, ptr %1389, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !265)
  %ecx.memory.i8419 = load ptr, ptr %ecx.memory.addr.i8418, align 8, !alias.scope !265
  %ecx.memory.len.addr.i8420 = getelementptr inbounds i8, ptr %ecx.memory.i8419, i64 16
  %ecx.memory.len.i8421 = load i64, ptr %ecx.memory.len.addr.i8420, align 8, !noalias !265
  %ecx.memory.last_checkpoint.addr.i8422 = getelementptr inbounds i8, ptr %ecx.memory.i8419, i64 48
  %ecx.memory.last_checkpoint.i8423 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8422, align 8, !noalias !265
  %1395 = sub i64 %ecx.memory.len.i8421, %ecx.memory.last_checkpoint.i8423
  %1396 = icmp ugt i256 %dup25312, 18446744073709551615
  %1397 = trunc i256 %dup25312 to i64
  %1398 = add i64 %1397, 32
  %1399 = icmp ugt i64 %1397, -33
  %1400 = or i1 %1396, %1399
  %1401 = select i1 %1400, i64 -1, i64 %1398
  %1402 = icmp ugt i64 %1401, %1395
  br i1 %1402, label %resize.i8430, label %OP1484.SWAP1, !prof !2

resize.i8430:                                     ; preds = %OP1482.DUP2
  %1403 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 %1401)
  %.not.i8431 = icmp eq i8 %1403, 0
  br i1 %.not.i8431, label %OP1484.SWAP1, label %return, !prof !7

OP1484.SWAP1:                                     ; preds = %OP1482.DUP2, %resize.i8430
  %ecx.memory.buffer.ptr.shared.addr.i8425 = getelementptr inbounds i8, ptr %ecx.memory.i8419, i64 8
  %ecx.memory.buffer.ptr.shared.i8426 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8425, align 8, !noalias !265
  %ecx.memory.buffer.ptr.i8427 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8426, i64 %ecx.memory.last_checkpoint.i8423
  %slot.i8428 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8427, i64 %1397
  %1404 = tail call i256 @llvm.bswap.i256(i256 %b5318)
  store i256 %1404, ptr %slot.i8428, align 1, !noalias !265
  %swap.a5321 = load i256, ptr %sp5311, align 16
  %swap.b5323 = load i256, ptr %sp5305, align 16
  %1405 = add i256 %swap.b5323, 1
  store i256 %1405, ptr %sp5305, align 16
  %1406 = add i256 %swap.a5321, 32
  store i256 %1406, ptr %sp5311, align 16
  %dup45351 = load i256, ptr %sp5350, align 16
  store i256 %dup45351, ptr %sp5313, align 16
  %1407 = icmp ugt i256 %dup45351, %1406
  %1408 = zext i1 %1407 to i256
  store i256 %1408, ptr %1389, align 16
  br i1 %1407, label %OP1479.JUMPDEST, label %OP1495.DUP3

OP1495.DUP3:                                      ; preds = %OP1484.SWAP1
  %gas.remaining5362 = load i64, ptr %gas.remaining.addr, align 8
  %1409 = add i64 %gas.remaining5362, -24
  %1410 = icmp ult i64 %gas.remaining5362, 24
  store i64 %1409, ptr %gas.remaining.addr, align 8
  br i1 %1410, label %return, label %OP1495.DUP3.contd5364, !prof !2, !annotation !3

OP1495.DUP3.contd5364:                            ; preds = %OP1495.DUP3
  %1411 = sub i256 %swap.a5321, %dup45351
  %1412 = and i256 %1411, 31
  store i256 %dup45351, ptr %1389, align 16
  %1413 = add i256 %1412, %dup45351
  store i256 %1413, ptr %sp5350, align 16
  store i256 %dup45351, ptr %sp5311, align 16
  br label %OP1503.JUMPDEST, !annotation !10

OP1503.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP1495.DUP3.contd5364, %OP1462.SWAP2, %OP1433.PUSH1
  %gas.remaining5402 = phi i64 [ %1409, %OP1495.DUP3.contd5364 ], [ %gas.remaining5402.pre8952, %OP1433.PUSH1 ], [ %gas.remaining5402.pre, %OP1462.SWAP2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.48 = phi i64 [ %len.addr.47.ph.fr, %OP1495.DUP3.contd5364 ], [ %1330, %OP1433.PUSH1 ], [ %1330, %OP1462.SWAP2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1414 = add i64 %gas.remaining5402, -22
  %1415 = icmp ult i64 %gas.remaining5402, 22
  store i64 %1414, ptr %gas.remaining.addr, align 8
  br i1 %1415, label %return, label %OP1503.JUMPDEST.contd, !prof !2, !annotation !3

OP1503.JUMPDEST.contd:                            ; preds = %OP1503.JUMPDEST
  %1416 = icmp ult i64 %len.addr.48, 7
  br i1 %1416, label %return, label %OP1504.POP, !prof !2, !annotation !21

OP1504.POP:                                       ; preds = %OP1503.JUMPDEST.contd
  %1417 = add i64 %len.addr.48, -5
  %1418 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.48
  %sp5411 = getelementptr i256, ptr %1418, i64 -7
  %dup25412 = load i256, ptr %sp5411, align 16
  %sp5413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1417
  store i256 %dup25412, ptr %sp5413, align 16
  br label %dynamic_jump_table.preheader

OP1511.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP578.PUSH2
  %gas.remaining5417 = phi i64 [ %521, %OP578.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.49 = phi i64 [ %524, %OP578.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1419 = add i64 %gas.remaining5417, -26
  %1420 = icmp ult i64 %gas.remaining5417, 26
  store i64 %1419, ptr %gas.remaining.addr, align 8
  br i1 %1420, label %return, label %OP1511.JUMPDEST.contd, !prof !2, !annotation !3

OP1511.JUMPDEST.contd:                            ; preds = %OP1511.JUMPDEST
  %1421 = icmp ult i64 %len.addr.49, 2
  %1422 = add i64 %len.addr.49, -1019
  %1423 = icmp ult i64 %1422, -1017
  %1424 = select i1 %1421, i8 91, i8 92
  br i1 %1423, label %return, label %OP1512.PUSH1, !prof !2

OP1512.PUSH1:                                     ; preds = %OP1511.JUMPDEST.contd
  %sp5421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.49
  store i256 0, ptr %sp5421, align 16
  %sp5423 = getelementptr i256, ptr %sp5421, i64 1
  store i256 3035, ptr %sp5423, align 16
  %contract.caller.addr5425 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller5426 = load i160, ptr %contract.caller.addr5425, align 16
  %1425 = tail call i160 @llvm.bswap.i160(i160 %contract.caller5426)
  %1426 = zext i160 %1425 to i256
  %sp5427 = getelementptr i256, ptr %sp5421, i64 2
  store i256 %1426, ptr %sp5427, align 16
  %sp5429 = getelementptr i256, ptr %sp5421, i64 -2
  %dup55430 = load i256, ptr %sp5429, align 16
  %sp5431 = getelementptr i256, ptr %sp5421, i64 3
  store i256 %dup55430, ptr %sp5431, align 16
  %1427 = add nuw nsw i64 %len.addr.49, 5
  %sp5433 = getelementptr i256, ptr %sp5421, i64 -1
  %dup55434 = load i256, ptr %sp5433, align 16
  %sp5435 = getelementptr i256, ptr %sp5421, i64 4
  store i256 %dup55434, ptr %sp5435, align 16
  br label %OP952.JUMPDEST

OP1519.JUMPDEST:                                  ; preds = %dynamic_jump_table
  %1428 = add i64 %gas.remaining237, -24
  %1429 = icmp ult i64 %gas.remaining237, 24
  store i64 %1428, ptr %gas.remaining.addr, align 8
  br i1 %1429, label %return, label %OP1519.JUMPDEST.contd, !prof !2, !annotation !3

OP1519.JUMPDEST.contd:                            ; preds = %OP1519.JUMPDEST
  %1430 = icmp ult i64 %len.addr.51, 5
  br i1 %1430, label %return, label %OP1520.SWAP1, !prof !2, !annotation !21

OP1520.SWAP1:                                     ; preds = %OP1519.JUMPDEST.contd
  %1431 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.51
  %sp5441 = getelementptr i256, ptr %1431, i64 -1
  %swap.a5442 = load i256, ptr %sp5441, align 16
  %sp5443 = getelementptr i256, ptr %1431, i64 -2
  %swap.b5444 = load i256, ptr %sp5443, align 16
  store i256 %swap.b5444, ptr %sp5441, align 16
  %sp5449 = getelementptr i256, ptr %1431, i64 -5
  %swap.b5450 = load i256, ptr %sp5449, align 16
  store i256 %swap.a5442, ptr %sp5449, align 16
  %sp5454 = getelementptr i256, ptr %1431, i64 -4
  %swap.b5455 = load i256, ptr %sp5454, align 16
  store i256 %swap.b5450, ptr %sp5454, align 16
  store i256 %swap.b5455, ptr %sp5443, align 16
  %1432 = add i64 %len.addr.51, -4
  br label %dynamic_jump_table

OP1527.JUMPDEST:                                  ; preds = %dynamic_jump_table, %OP641.PUSH2
  %gas.remaining5461 = phi i64 [ %564, %OP641.PUSH2 ], [ %gas.remaining237, %dynamic_jump_table ]
  %len.addr.50 = phi i64 [ %567, %OP641.PUSH2 ], [ %len.addr.51, %dynamic_jump_table ]
  %1433 = add i64 %gas.remaining5461, -132
  %1434 = icmp ult i64 %gas.remaining5461, 132
  store i64 %1433, ptr %gas.remaining.addr, align 8
  br i1 %1434, label %return, label %OP1527.JUMPDEST.contd, !prof !2, !annotation !3

OP1527.JUMPDEST.contd:                            ; preds = %OP1527.JUMPDEST
  %1435 = icmp ult i64 %len.addr.50, 3
  %1436 = add i64 %len.addr.50, -1023
  %1437 = icmp ult i64 %1436, -1020
  %1438 = select i1 %1435, i8 91, i8 92
  br i1 %1437, label %return, label %OP1528.PUSH1, !prof !2

OP1528.PUSH1:                                     ; preds = %OP1527.JUMPDEST.contd
  %1439 = add nuw nsw i64 %len.addr.50, 1
  %sp5465 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.50
  store i256 4, ptr %sp5465, align 16
  %sp5467 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1439
  store i256 32, ptr %sp5467, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !268)
  %ecx.memory.addr.i8433 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  %ecx.memory.i8434 = load ptr, ptr %ecx.memory.addr.i8433, align 8, !alias.scope !268
  %ecx.memory.len.addr.i8435 = getelementptr inbounds i8, ptr %ecx.memory.i8434, i64 16
  %ecx.memory.len.i8436 = load i64, ptr %ecx.memory.len.addr.i8435, align 8, !noalias !268
  %ecx.memory.last_checkpoint.addr.i8437 = getelementptr inbounds i8, ptr %ecx.memory.i8434, i64 48
  %ecx.memory.last_checkpoint.i8438 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8437, align 8, !noalias !268
  %1440 = sub i64 %ecx.memory.len.i8436, %ecx.memory.last_checkpoint.i8438
  %1441 = icmp ult i64 %1440, 64
  br i1 %1441, label %resize.i8445, label %OP1531.DUP2, !prof !2

resize.i8445:                                     ; preds = %OP1528.PUSH1
  %1442 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 64)
  %.not.i8446 = icmp eq i8 %1442, 0
  br i1 %.not.i8446, label %OP1531.DUP2, label %return, !prof !7

OP1531.DUP2:                                      ; preds = %OP1528.PUSH1, %resize.i8445
  %ecx.memory.buffer.ptr.shared.addr.i8440 = getelementptr inbounds i8, ptr %ecx.memory.i8434, i64 8
  %ecx.memory.buffer.ptr.shared.i8441 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8440, align 8, !noalias !268
  %ecx.memory.buffer.ptr.i8442 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8441, i64 %ecx.memory.last_checkpoint.i8438
  %slot.i8443 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8442, i64 32
  store i256 1809251394333065553493296640760748560207343510400633813116524750123642650624, ptr %slot.i8443, align 1, !noalias !268
  %sp5474 = getelementptr i256, ptr %sp5465, i64 -2
  %dup25475 = load i256, ptr %sp5474, align 16
  store i256 %dup25475, ptr %sp5465, align 16
  store i256 0, ptr %sp5467, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !271)
  %ecx.memory.i8449 = load ptr, ptr %ecx.memory.addr.i8433, align 8, !alias.scope !271
  %ecx.memory.len.addr.i8450 = getelementptr inbounds i8, ptr %ecx.memory.i8449, i64 16
  %ecx.memory.len.i8451 = load i64, ptr %ecx.memory.len.addr.i8450, align 8, !noalias !271
  %ecx.memory.last_checkpoint.addr.i8452 = getelementptr inbounds i8, ptr %ecx.memory.i8449, i64 48
  %ecx.memory.last_checkpoint.i8453 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8452, align 8, !noalias !271
  %1443 = sub i64 %ecx.memory.len.i8451, %ecx.memory.last_checkpoint.i8453
  %1444 = icmp ult i64 %1443, 32
  br i1 %1444, label %resize.i8459, label %OP1534.PUSH1, !prof !2

resize.i8459:                                     ; preds = %OP1531.DUP2
  %1445 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8460 = icmp eq i8 %1445, 0
  br i1 %.not.i8460, label %OP1534.PUSH1, label %return, !prof !7

OP1534.PUSH1:                                     ; preds = %OP1531.DUP2, %resize.i8459
  %ecx.memory.buffer.ptr.shared.addr.i8455 = getelementptr inbounds i8, ptr %ecx.memory.i8449, i64 8
  %ecx.memory.buffer.ptr.shared.i8456 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8455, align 8, !noalias !271
  %ecx.memory.buffer.ptr.i8457 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8456, i64 %ecx.memory.last_checkpoint.i8453
  %1446 = tail call i256 @llvm.bswap.i256(i256 %dup25475)
  store i256 %1446, ptr %ecx.memory.buffer.ptr.i8457, align 1, !noalias !271
  store i256 64, ptr %sp5465, align 16
  store i256 0, ptr %sp5467, align 16
  %1447 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp5465)
  %.not7244 = icmp eq i8 %1447, 0
  br i1 %.not7244, label %OP1537.PUSH1, label %return, !prof !7

OP1537.PUSH1:                                     ; preds = %OP1534.PUSH1
  store i256 32, ptr %sp5467, align 16
  %b5496 = load i256, ptr %sp5465, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !274)
  %ecx.memory.i8463 = load ptr, ptr %ecx.memory.addr.i8433, align 8, !alias.scope !274
  %ecx.memory.len.addr.i8464 = getelementptr inbounds i8, ptr %ecx.memory.i8463, i64 16
  %ecx.memory.len.i8465 = load i64, ptr %ecx.memory.len.addr.i8464, align 8, !noalias !274
  %ecx.memory.last_checkpoint.addr.i8466 = getelementptr inbounds i8, ptr %ecx.memory.i8463, i64 48
  %ecx.memory.last_checkpoint.i8467 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8466, align 8, !noalias !274
  %1448 = sub i64 %ecx.memory.len.i8465, %ecx.memory.last_checkpoint.i8467
  %1449 = icmp ult i64 %1448, 64
  br i1 %1449, label %resize.i8474, label %OP1539.DUP1, !prof !2

resize.i8474:                                     ; preds = %OP1537.PUSH1
  %1450 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 64)
  %.not.i8475 = icmp eq i8 %1450, 0
  br i1 %.not.i8475, label %OP1539.DUP1, label %return, !prof !7

OP1539.DUP1:                                      ; preds = %OP1537.PUSH1, %resize.i8474
  %ecx.memory.buffer.ptr.shared.addr.i8469 = getelementptr inbounds i8, ptr %ecx.memory.i8463, i64 8
  %ecx.memory.buffer.ptr.shared.i8470 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8469, align 8, !noalias !274
  %ecx.memory.buffer.ptr.i8471 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8470, i64 %ecx.memory.last_checkpoint.i8467
  %slot.i8472 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i8471, i64 32
  %1451 = tail call i256 @llvm.bswap.i256(i256 %b5496)
  store i256 %1451, ptr %slot.i8472, align 1, !noalias !274
  %sp5498 = getelementptr i256, ptr %sp5465, i64 -1
  %dup15499 = load i256, ptr %sp5498, align 16
  store i256 %dup15499, ptr %sp5465, align 16
  store i256 0, ptr %sp5467, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !277)
  %ecx.memory.i8478 = load ptr, ptr %ecx.memory.addr.i8433, align 8, !alias.scope !277
  %ecx.memory.len.addr.i8479 = getelementptr inbounds i8, ptr %ecx.memory.i8478, i64 16
  %ecx.memory.len.i8480 = load i64, ptr %ecx.memory.len.addr.i8479, align 8, !noalias !277
  %ecx.memory.last_checkpoint.addr.i8481 = getelementptr inbounds i8, ptr %ecx.memory.i8478, i64 48
  %ecx.memory.last_checkpoint.i8482 = load i64, ptr %ecx.memory.last_checkpoint.addr.i8481, align 8, !noalias !277
  %1452 = sub i64 %ecx.memory.len.i8480, %ecx.memory.last_checkpoint.i8482
  %1453 = icmp ult i64 %1452, 32
  br i1 %1453, label %resize.i8488, label %OP1542.PUSH1, !prof !2

resize.i8488:                                     ; preds = %OP1539.DUP1
  %1454 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 32)
  %.not.i8489 = icmp eq i8 %1454, 0
  br i1 %.not.i8489, label %OP1542.PUSH1, label %return, !prof !7

OP1542.PUSH1:                                     ; preds = %OP1539.DUP1, %resize.i8488
  %ecx.memory.buffer.ptr.shared.addr.i8484 = getelementptr inbounds i8, ptr %ecx.memory.i8478, i64 8
  %ecx.memory.buffer.ptr.shared.i8485 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i8484, align 8, !noalias !277
  %ecx.memory.buffer.ptr.i8486 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i8485, i64 %ecx.memory.last_checkpoint.i8482
  %1455 = tail call i256 @llvm.bswap.i256(i256 %dup15499)
  store i256 %1455, ptr %ecx.memory.buffer.ptr.i8486, align 1, !noalias !277
  store i256 64, ptr %sp5465, align 16
  store i256 0, ptr %sp5467, align 16
  %1456 = tail call i8 @__revmc_builtin_keccak256(ptr nonnull %arg.ecx.addr, ptr nonnull %sp5465)
  %.not7247 = icmp eq i8 %1456, 0
  br i1 %.not7247, label %OP1545.PUSH1, label %return, !prof !7

OP1545.PUSH1:                                     ; preds = %OP1542.PUSH1
  %swap.b5520 = load i256, ptr %sp5498, align 16
  store i256 0, ptr %sp5498, align 16
  store i256 %swap.b5520, ptr %sp5467, align 16
  %swap.a5524 = load i256, ptr %sp5465, align 16
  %swap.b5526 = load i256, ptr %sp5474, align 16
  store i256 %swap.a5524, ptr %sp5474, align 16
  store i256 %swap.b5526, ptr %sp5465, align 16
  %1457 = add nsw i64 %len.addr.50, -1
  %1458 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp5474, i8 19)
  %.not7248 = icmp eq i8 %1458, 0
  br i1 %.not7248, label %OP1552.DUP2, label %return, !prof !7

OP1552.DUP2:                                      ; preds = %OP1545.PUSH1
  %sp5532 = getelementptr i256, ptr %sp5465, i64 -3
  %dup25533 = load i256, ptr %sp5532, align 16
  %sp5534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1457
  store i256 %dup25533, ptr %sp5534, align 16
  br label %dynamic_jump_table.preheader

dynamic_jump_table.preheader:                     ; preds = %OP742.JUMP, %OP859.POP, %OP934.PUSH1, %OP948.SWAP1, %OP1224.PUSH1, %OP1354.POP, %OP1364.SWAP1, %OP1386.DUP2, %OP1504.POP, %OP1552.DUP2
  %len.addr.51.ph = phi i64 [ %760, %OP859.POP ], [ %840, %OP934.PUSH1 ], [ %len.addr.34, %OP948.SWAP1 ], [ %1276, %OP1354.POP ], [ %1283, %OP1364.SWAP1 ], [ %len.addr.44, %OP1386.DUP2 ], [ %1417, %OP1504.POP ], [ %1147, %OP1224.PUSH1 ], [ %1457, %OP1552.DUP2 ], [ %647, %OP742.JUMP ]
  %.ph8697 = phi i256 [ %dup23079, %OP859.POP ], [ %swap.b3350, %OP934.PUSH1 ], [ %swap.b3388, %OP948.SWAP1 ], [ %a4840, %OP1354.POP ], [ %dup24885, %OP1364.SWAP1 ], [ %dup24937, %OP1386.DUP2 ], [ %dup25412, %OP1504.POP ], [ %swap.b4391, %OP1224.PUSH1 ], [ %dup25533, %OP1552.DUP2 ], [ %a2608, %OP742.JUMP ]
  %gas.remaining.addr.promoted = load i64, ptr %gas.remaining.addr, align 8
  br label %dynamic_jump_table

dynamic_jump_table:                               ; preds = %dynamic_jump_table.preheader, %OP1520.SWAP1
  %gas.remaining237 = phi i64 [ %1428, %OP1520.SWAP1 ], [ %gas.remaining.addr.promoted, %dynamic_jump_table.preheader ]
  %len.addr.51 = phi i64 [ %1432, %OP1520.SWAP1 ], [ %len.addr.51.ph, %dynamic_jump_table.preheader ]
  %1459 = phi i256 [ %swap.b5450, %OP1520.SWAP1 ], [ %.ph8697, %dynamic_jump_table.preheader ]
  switch i256 %1459, label %return [
    i256 175, label %OP70.JUMPDEST
    i256 183, label %OP74.JUMPDEST
    i256 185, label %OP76.JUMPDEST
    i256 196, label %OP84.JUMPDEST
    i256 204, label %OP88.JUMPDEST
    i256 241, label %OP120.JUMPDEST.preheader
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
    i256 794, label %OP497.JUMPDEST.preheader
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
    i256 1366, label %OP834.JUMPDEST.preheader
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
    i256 2985, label %OP1479.JUMPDEST.preheader
    i256 3014, label %OP1503.JUMPDEST
    i256 3022, label %OP1511.JUMPDEST
    i256 3035, label %OP1519.JUMPDEST
    i256 3043, label %OP1527.JUMPDEST
  ], !prof !280

suspend:                                          ; preds = %OP1309.MLOAD.contd
  store ptr blockaddress(@custom, %OP1318.SWAP4), ptr %ecx.resume_at.addr, align 8
  br label %return, !annotation !281

return.loopexit.split.loop.exit8831:              ; preds = %OP834.JUMPDEST.us
  %1460 = icmp ult i64 %len.addr.31.ph.fr, 3
  %1461 = select i1 %1460, i8 91, i8 92
  br label %return

return.loopexit8688.split.loop.exit8805:          ; preds = %OP120.JUMPDEST.contd.lr.ph
  %1462 = icmp ult i64 %len.addr.3.ph.fr, 4
  %1463 = select i1 %1462, i8 91, i8 92
  br label %return

return.loopexit8691.split.loop.exit8791:          ; preds = %OP1479.JUMPDEST.us
  %1464 = icmp ult i64 %len.addr.47.ph.fr, 3
  %1465 = select i1 %1464, i8 91, i8 92
  br label %return

return.loopexit8694.split.loop.exit8768:          ; preds = %OP497.JUMPDEST.contd.lr.ph
  %1466 = icmp ult i64 %len.addr.20.ph.fr, 4
  %1467 = select i1 %1466, i8 91, i8 92
  br label %return

return:                                           ; preds = %dynamic_jump_table, %OP1519.JUMPDEST.contd, %OP1519.JUMPDEST, %OP512.PUSH1, %OP504.DUP1, %resize.i7519, %resize.i7534, %OP1479.JUMPDEST, %OP1479.JUMPDEST.contd, %resize.i8430, %OP135.PUSH1, %OP127.DUP1, %resize.i7442, %resize.i7456, %OP834.JUMPDEST, %OP834.JUMPDEST.contd, %resize.i7748, %OP504.DUP1.us, %OP127.DUP1.us, %return.loopexit8694.split.loop.exit8768, %OP497.JUMPDEST.preheader, %return.loopexit8691.split.loop.exit8791, %OP1479.JUMPDEST.us, %return.loopexit8688.split.loop.exit8805, %OP120.JUMPDEST.preheader, %return.loopexit.split.loop.exit8831, %OP834.JUMPDEST.us, %resize.i8488, %resize.i8474, %resize.i8459, %resize.i8445, %resize.i8415, %resize.i8401, %resize.i8386, %resize.i8371, %resize.i8356, %resize.i8340, %resize.i8326, %resize.i8311, %resize.i8295, %resize.i8280, %resize.i8264, %resize.i8248, %resize.i8232, %resize.i8217, %resize.i8202, %resize.i8187, %resize.i8172, %resize.i8156, %resize.i8141, %resize.i8125, %resize.i8110, %resize.i8095, %resize.i8080, %resize.i8065, %resize.i8050, %resize.i8035, %resize.i8020, %resize.i8005, %resize.i7990, %resize.i7975, %resize.i7960, %resize.i7945, %resize.i7930, %resize.i7915, %resize.i7900, %resize.i7885, %resize.i7870, %resize.i7855, %resize.i7839, %resize.i7824, %resize.i7808, %resize.i7793, %resize.i7778, %resize.i7763, %resize.i7733, %resize.i7719, %resize.i7704, %resize.i7689, %resize.i7674, %resize.i7658, %resize.i7642, %resize.i7627, %resize.i7611, %resize.i7596, %OP632.JUMPDEST.thread, %OP626.JUMPDEST.thread, %OP569.JUMPDEST.thread, %resize.i7581, %resize.i7565, %resize.i7550, %OP453.JUMPDEST.thread, %OP408.JUMPDEST.thread, %OP373.JUMPDEST.thread, %OP347.JUMPDEST.thread, %OP280.JUMPDEST.thread, %OP249.JUMPDEST.thread, %OP192.JUMPDEST.thread, %resize.i7503, %resize.i7487, %resize.i7472, %OP76.JUMPDEST.thread, %resize.i, %OP1327.PUSH1.contd4738, %OP1260.PUSH1.contd4502, %OP1083.PUSH1.contd3870, %OP980.PUSH1.contd3492, %OP681.MLOAD.contd, %OP637.PUSH1.contd2224, %OP630.JUMPDEST, %OP620.MLOAD.contd, %OP574.PUSH1.contd2008, %OP563.MLOAD.contd, %OP458.PUSH1.contd1584, %OP447.MLOAD.contd, %OP413.PUSH1.contd1429, %OP402.MLOAD.contd, %OP378.PUSH1.contd1310, %OP371.JUMPDEST, %OP352.PUSH1.contd1233, %OP341.MLOAD.contd, %OP285.PUSH1.contd982, %OP274.MLOAD.contd, %OP254.PUSH1.contd879, %OP243.MLOAD.contd, %OP197.PUSH1.contd672, %OP186.MLOAD.contd, %OP81.PUSH1.contd254, %OP74.JUMPDEST, %suspend, %OP1545.PUSH1, %OP1542.PUSH1, %OP1534.PUSH1, %OP1527.JUMPDEST.contd, %OP1527.JUMPDEST, %OP1511.JUMPDEST.contd, %OP1511.JUMPDEST, %OP1503.JUMPDEST.contd, %OP1503.JUMPDEST, %OP1495.DUP3, %OP1475.PUSH1, %OP1468.JUMPDEST.contd, %OP1468.JUMPDEST, %OP1454.PUSH2.contd5208, %OP1454.PUSH2, %OP1449.DUP1, %OP1428.PUSH1, %OP1389.PUSH1, %OP1388.JUMPDEST.contd, %OP1388.JUMPDEST, %OP1380.PUSH1, %OP1377.PUSH1, %OP1370.JUMPDEST.contd, %OP1370.JUMPDEST, %OP1361.SWAP1, %OP1357.PUSH1, %OP1356.JUMPDEST.contd, %OP1356.JUMPDEST, %OP1348.MLOAD.contd, %OP1330.JUMPDEST.contd, %OP1330.JUMPDEST, %OP1327.PUSH1.contd, %OP1327.PUSH1, %OP1318.SWAP4.contd, %OP1318.SWAP4, %OP1309.MLOAD.contd, %OP1294.POP.contd, %OP1294.POP, %OP1287.SUB, %OP1283.PUSH1, %OP1279.PUSH1, %OP1263.JUMPDEST.contd, %OP1263.JUMPDEST, %OP1260.PUSH1, %OP1253.SLOAD, %OP1249.PUSH1, %OP1233.JUMPDEST.contd, %OP1233.JUMPDEST, %OP1218.MLOAD.contd, %OP1197.POP.contd, %OP1197.POP, %OP1190.ADD, %OP1186.PUSH1, %OP1182.PUSH1, %OP1166.POP, %OP1159.SUB, %OP1155.PUSH1, %OP1151.PUSH1, %OP1135.JUMPDEST.contd, %OP1135.JUMPDEST, %OP1134.POP, %OP1127.SUB, %OP1123.PUSH1, %OP1119.PUSH1, %OP1102.PUSH1, %OP1086.JUMPDEST.contd, %OP1086.JUMPDEST, %OP1083.PUSH1, %OP1076.SLOAD, %OP1072.PUSH1, %OP1055.PUSH1, %OP1040.DUP2.contd, %OP1040.DUP2, %OP1036.JUMPDEST.contd, %OP1036.JUMPDEST, %OP1033.SLOAD, %OP1029.PUSH1, %OP1012.PUSH1, %OP996.POP.contd, %OP996.POP, %OP983.JUMPDEST.contd, %OP983.JUMPDEST, %OP980.PUSH1, %OP973.SLOAD, %OP969.PUSH1, %OP952.JUMPDEST.contd, %OP952.JUMPDEST, %OP943.PUSH1, %OP942.JUMPDEST.contd, %OP942.JUMPDEST, %OP928.MLOAD.contd, %OP907.POP.contd, %OP907.POP, %OP904.DUP2, %OP900.PUSH1, %OP883.PUSH1, %OP866.JUMPDEST.contd, %OP866.JUMPDEST, %OP858.JUMPDEST.contd, %OP858.JUMPDEST, %OP850.DUP3, %OP830.PUSH1, %OP823.JUMPDEST.contd, %OP823.JUMPDEST, %OP809.PUSH2.contd2875, %OP809.PUSH2, %OP804.DUP1, %OP783.PUSH1, %OP744.PUSH1, %OP743.JUMPDEST.contd, %OP743.JUMPDEST, %OP736.MLOAD.contd, %OP718.POP.contd, %OP718.POP, %OP711.ADD, %OP707.PUSH1, %OP703.PUSH1, %OP687.JUMPDEST.contd, %OP687.JUMPDEST, %OP675.PUSH1, %OP670.MLOAD.contd, %OP669.PUSH1, %OP668.JUMPDEST.contd, %OP668.JUMPDEST, %OP640.JUMPDEST.contd, %OP640.JUMPDEST, %OP637.PUSH1, %OP632.JUMPDEST.contd, %OP632.JUMPDEST, %OP626.JUMPDEST.contd, %OP626.JUMPDEST, %OP614.PUSH1, %OP605.MLOAD.contd, %OP604.PUSH1, %OP603.JUMPDEST.contd, %OP603.JUMPDEST, %OP577.JUMPDEST.contd, %OP577.JUMPDEST, %OP574.PUSH1, %OP569.JUMPDEST.contd, %OP569.JUMPDEST, %OP556.JUMPDEST.contd, %OP556.JUMPDEST, %OP540.MLOAD.contd, %OP536.DUP1.contd, %OP536.DUP1, %OP519.JUMPDEST.contd, %OP519.JUMPDEST, %OP483.PUSH1, %OP480.MLOAD.contd, %OP477.DUP4, %OP467.MLOAD.contd, %OP466.PUSH1, %OP465.JUMPDEST.contd, %OP465.JUMPDEST, %OP461.JUMPDEST.contd, %OP461.JUMPDEST, %OP458.PUSH1, %OP453.JUMPDEST.contd, %OP453.JUMPDEST, %OP441.PUSH1, %OP436.MLOAD.contd, %OP435.PUSH1, %OP434.JUMPDEST.contd, %OP434.JUMPDEST, %OP416.JUMPDEST.contd, %OP416.JUMPDEST, %OP413.PUSH1, %OP408.JUMPDEST.contd, %OP408.JUMPDEST, %OP396.PUSH1, %OP387.MLOAD.contd, %OP386.PUSH1, %OP385.JUMPDEST.contd, %OP385.JUMPDEST, %OP381.JUMPDEST.contd, %OP381.JUMPDEST, %OP378.PUSH1, %OP373.JUMPDEST.contd, %OP373.JUMPDEST, %OP355.JUMPDEST.contd, %OP355.JUMPDEST, %OP352.PUSH1, %OP347.JUMPDEST.contd, %OP347.JUMPDEST, %OP335.PUSH1, %OP326.MLOAD.contd, %OP325.PUSH1, %OP324.JUMPDEST.contd, %OP324.JUMPDEST, %OP288.JUMPDEST.contd, %OP288.JUMPDEST, %OP285.PUSH1, %OP280.JUMPDEST.contd, %OP280.JUMPDEST, %OP268.PUSH1, %OP263.MLOAD.contd, %OP262.PUSH1, %OP261.JUMPDEST.contd, %OP261.JUMPDEST, %OP257.JUMPDEST.contd, %OP257.JUMPDEST, %OP254.PUSH1, %OP249.JUMPDEST.contd, %OP249.JUMPDEST, %OP237.PUSH1, %OP228.MLOAD.contd, %OP227.PUSH1, %OP226.JUMPDEST.contd, %OP226.JUMPDEST, %OP200.JUMPDEST.contd, %OP200.JUMPDEST, %OP197.PUSH1, %OP192.JUMPDEST.contd, %OP192.JUMPDEST, %OP179.JUMPDEST.contd, %OP179.JUMPDEST, %OP163.MLOAD.contd, %OP159.DUP1.contd, %OP159.DUP1, %OP142.JUMPDEST.contd, %OP142.JUMPDEST, %OP106.PUSH1, %OP103.MLOAD.contd, %OP100.DUP4, %OP90.MLOAD.contd, %OP89.PUSH1, %OP88.JUMPDEST.contd, %OP88.JUMPDEST, %OP84.JUMPDEST.contd, %OP84.JUMPDEST, %OP81.PUSH1, %OP76.JUMPDEST.contd, %OP76.JUMPDEST, %OP70.JUMPDEST.contd, %OP70.JUMPDEST, %OP65.DUP1, %OP60.DUP1, %OP55.DUP1, %OP50.DUP1, %OP45.DUP1, %OP40.DUP1, %OP35.DUP1, %OP30.DUP1, %OP25.DUP1, %OP20.DUP1, %OP8.PUSH1, %no_resume
  %len.addr.52 = phi i64 [ 0, %no_resume ], [ %len.addr.0, %OP70.JUMPDEST ], [ %len.addr.0, %OP70.JUMPDEST.contd ], [ %len.addr.28, %OP687.JUMPDEST ], [ %len.addr.28, %OP687.JUMPDEST.contd ], [ %594, %OP703.PUSH1 ], [ %599, %OP707.PUSH1 ], [ %593, %OP711.ADD ], [ %593, %OP718.POP ], [ %593, %OP718.POP.contd ], [ %len.addr.28, %OP736.MLOAD.contd ], [ %len.addr.50, %OP1527.JUMPDEST ], [ %len.addr.50, %OP1527.JUMPDEST.contd ], [ %1439, %OP1534.PUSH1 ], [ %1439, %OP1542.PUSH1 ], [ %1457, %OP1545.PUSH1 ], [ %len.addr.49, %OP1511.JUMPDEST ], [ %len.addr.49, %OP1511.JUMPDEST.contd ], [ %len.addr.35, %OP952.JUMPDEST ], [ %len.addr.35, %OP952.JUMPDEST.contd ], [ %858, %OP969.PUSH1 ], [ %858, %OP973.SLOAD ], [ %len.addr.36, %OP983.JUMPDEST ], [ %len.addr.36, %OP983.JUMPDEST.contd ], [ %len.addr.37, %OP1036.JUMPDEST ], [ %len.addr.37, %OP1036.JUMPDEST.contd ], [ %len.addr.39, %OP1135.JUMPDEST ], [ %len.addr.39, %OP1135.JUMPDEST.contd ], [ %1070, %OP1151.PUSH1 ], [ %1072, %OP1155.PUSH1 ], [ %1068, %OP1159.SUB ], [ %1068, %OP1166.POP ], [ %1070, %OP1182.PUSH1 ], [ %1072, %OP1186.PUSH1 ], [ %1068, %OP1190.ADD ], [ %1068, %OP1197.POP ], [ %1068, %OP1197.POP.contd ], [ %len.addr.39, %OP1218.MLOAD.contd ], [ %951, %OP1040.DUP2 ], [ %951, %OP1040.DUP2.contd ], [ %961, %OP1055.PUSH1 ], [ %961, %OP1072.PUSH1 ], [ %961, %OP1076.SLOAD ], [ %len.addr.38, %OP1086.JUMPDEST ], [ %len.addr.38, %OP1086.JUMPDEST.contd ], [ %1017, %OP1102.PUSH1 ], [ %1017, %OP1119.PUSH1 ], [ %1019, %OP1123.PUSH1 ], [ %1015, %OP1127.SUB ], [ %1015, %OP1134.POP ], [ %951, %OP1083.PUSH1 ], [ %951, %OP1083.PUSH1.contd3870 ], [ %892, %OP996.POP ], [ %892, %OP996.POP.contd ], [ %895, %OP1012.PUSH1 ], [ %895, %OP1029.PUSH1 ], [ %895, %OP1033.SLOAD ], [ %857, %OP980.PUSH1 ], [ %857, %OP980.PUSH1.contd3492 ], [ %len.addr.48, %OP1503.JUMPDEST ], [ %len.addr.48, %OP1503.JUMPDEST.contd ], [ %len.addr.47.ph.fr, %OP1495.DUP3 ], [ %len.addr.46, %OP1468.JUMPDEST ], [ %len.addr.46, %OP1468.JUMPDEST.contd ], [ %len.addr.46, %OP1475.PUSH1 ], [ %len.addr.45, %OP1388.JUMPDEST ], [ %len.addr.45, %OP1388.JUMPDEST.contd ], [ %1308, %OP1389.PUSH1 ], [ %1330, %OP1428.PUSH1 ], [ %1330, %OP1449.DUP1 ], [ %1330, %OP1454.PUSH2 ], [ %1343, %OP1454.PUSH2.contd5208 ], [ %len.addr.44, %OP1370.JUMPDEST ], [ %len.addr.44, %OP1370.JUMPDEST.contd ], [ %1295, %OP1377.PUSH1 ], [ %len.addr.44, %OP1380.PUSH1 ], [ %len.addr.43, %OP1356.JUMPDEST ], [ %len.addr.43, %OP1356.JUMPDEST.contd ], [ %1284, %OP1357.PUSH1 ], [ %1284, %OP1361.SWAP1 ], [ %len.addr.42, %OP1330.JUMPDEST ], [ %len.addr.42, %OP1330.JUMPDEST.contd ], [ %len.addr.42, %OP1348.MLOAD.contd ], [ %len.addr.41, %OP1263.JUMPDEST ], [ %len.addr.41, %OP1263.JUMPDEST.contd ], [ %1192, %OP1279.PUSH1 ], [ %1197, %OP1283.PUSH1 ], [ %1190, %OP1287.SUB ], [ %1190, %OP1294.POP ], [ %1190, %OP1294.POP.contd ], [ %1194, %OP1309.MLOAD.contd ], [ %1194, %suspend ], [ %len.addr.40, %OP1233.JUMPDEST ], [ %len.addr.40, %OP1233.JUMPDEST.contd ], [ %1155, %OP1249.PUSH1 ], [ %1155, %OP1253.SLOAD ], [ %len.addr.40, %OP1260.PUSH1 ], [ %len.addr.40, %OP1260.PUSH1.contd4502 ], [ %len.addr.34, %OP942.JUMPDEST ], [ %len.addr.34, %OP942.JUMPDEST.contd ], [ %847, %OP943.PUSH1 ], [ %len.addr.33, %OP866.JUMPDEST ], [ %len.addr.33, %OP866.JUMPDEST.contd ], [ %769, %OP883.PUSH1 ], [ %769, %OP900.PUSH1 ], [ %768, %OP904.DUP2 ], [ %768, %OP907.POP ], [ %768, %OP907.POP.contd ], [ %838, %OP928.MLOAD.contd ], [ %len.addr.32, %OP858.JUMPDEST ], [ %len.addr.32, %OP858.JUMPDEST.contd ], [ %len.addr.31.ph.fr, %OP850.DUP3 ], [ %len.addr.30, %OP823.JUMPDEST ], [ %len.addr.30, %OP823.JUMPDEST.contd ], [ %len.addr.30, %OP830.PUSH1 ], [ %len.addr.29, %OP743.JUMPDEST ], [ %len.addr.29, %OP743.JUMPDEST.contd ], [ %651, %OP744.PUSH1 ], [ %673, %OP783.PUSH1 ], [ %673, %OP804.DUP1 ], [ %673, %OP809.PUSH2 ], [ %686, %OP809.PUSH2.contd2875 ], [ %len.addr.51, %OP668.JUMPDEST ], [ %len.addr.51, %OP668.JUMPDEST.contd ], [ %580, %OP669.PUSH1 ], [ %582, %OP670.MLOAD.contd ], [ %580, %OP675.PUSH1 ], [ %587, %OP681.MLOAD.contd ], [ %len.addr.27, %OP640.JUMPDEST ], [ %len.addr.27, %OP640.JUMPDEST.contd ], [ %len.addr.51, %OP632.JUMPDEST ], [ %len.addr.51, %OP632.JUMPDEST.contd ], [ %len.addr.2685658567, %OP637.PUSH1 ], [ %len.addr.2685658567, %OP637.PUSH1.contd2224 ], [ %len.addr.51, %OP630.JUMPDEST ], [ %len.addr.51, %OP626.JUMPDEST ], [ %len.addr.51, %OP626.JUMPDEST.contd ], [ %len.addr.51, %OP603.JUMPDEST ], [ %len.addr.51, %OP603.JUMPDEST.contd ], [ %536, %OP604.PUSH1 ], [ %538, %OP605.MLOAD.contd ], [ %536, %OP614.PUSH1 ], [ %544, %OP620.MLOAD.contd ], [ %len.addr.24, %OP577.JUMPDEST ], [ %len.addr.24, %OP577.JUMPDEST.contd ], [ %len.addr.51, %OP569.JUMPDEST ], [ %len.addr.51, %OP569.JUMPDEST.contd ], [ %len.addr.2385558557, %OP574.PUSH1 ], [ %len.addr.2385558557, %OP574.PUSH1.contd2008 ], [ %len.addr.22, %OP556.JUMPDEST ], [ %len.addr.22, %OP556.JUMPDEST.contd ], [ %508, %OP563.MLOAD.contd ], [ %len.addr.21, %OP519.JUMPDEST ], [ %len.addr.21, %OP519.JUMPDEST.contd ], [ %461, %OP536.DUP1 ], [ %461, %OP536.DUP1.contd ], [ %458, %OP540.MLOAD.contd ], [ %len.addr.51, %OP465.JUMPDEST ], [ %len.addr.51, %OP465.JUMPDEST.contd ], [ %401, %OP466.PUSH1 ], [ %403, %OP467.MLOAD.contd ], [ %407, %OP477.DUP4 ], [ %405, %OP480.MLOAD.contd ], [ %405, %OP483.PUSH1 ], [ %len.addr.19, %OP461.JUMPDEST ], [ %len.addr.19, %OP461.JUMPDEST.contd ], [ %len.addr.51, %OP453.JUMPDEST ], [ %len.addr.51, %OP453.JUMPDEST.contd ], [ %len.addr.1885408542, %OP458.PUSH1 ], [ %len.addr.1885408542, %OP458.PUSH1.contd1584 ], [ %len.addr.51, %OP434.JUMPDEST ], [ %len.addr.51, %OP434.JUMPDEST.contd ], [ %371, %OP435.PUSH1 ], [ %373, %OP436.MLOAD.contd ], [ %371, %OP441.PUSH1 ], [ %378, %OP447.MLOAD.contd ], [ %len.addr.17, %OP416.JUMPDEST ], [ %len.addr.17, %OP416.JUMPDEST.contd ], [ %len.addr.51, %OP408.JUMPDEST ], [ %len.addr.51, %OP408.JUMPDEST.contd ], [ %len.addr.1685358537, %OP413.PUSH1 ], [ %len.addr.1685358537, %OP413.PUSH1.contd1429 ], [ %len.addr.51, %OP385.JUMPDEST ], [ %len.addr.51, %OP385.JUMPDEST.contd ], [ %336, %OP386.PUSH1 ], [ %338, %OP387.MLOAD.contd ], [ %336, %OP396.PUSH1 ], [ %344, %OP402.MLOAD.contd ], [ %len.addr.15, %OP381.JUMPDEST ], [ %len.addr.15, %OP381.JUMPDEST.contd ], [ %len.addr.51, %OP373.JUMPDEST ], [ %len.addr.51, %OP373.JUMPDEST.contd ], [ %len.addr.1485308532, %OP378.PUSH1 ], [ %len.addr.1485308532, %OP378.PUSH1.contd1310 ], [ %len.addr.51, %OP371.JUMPDEST ], [ %len.addr.13, %OP355.JUMPDEST ], [ %len.addr.13, %OP355.JUMPDEST.contd ], [ %len.addr.51, %OP347.JUMPDEST ], [ %len.addr.51, %OP347.JUMPDEST.contd ], [ %len.addr.1285258527, %OP352.PUSH1 ], [ %len.addr.1285258527, %OP352.PUSH1.contd1233 ], [ %len.addr.51, %OP324.JUMPDEST ], [ %len.addr.51, %OP324.JUMPDEST.contd ], [ %285, %OP325.PUSH1 ], [ %287, %OP326.MLOAD.contd ], [ %285, %OP335.PUSH1 ], [ %293, %OP341.MLOAD.contd ], [ %len.addr.11, %OP288.JUMPDEST ], [ %len.addr.11, %OP288.JUMPDEST.contd ], [ %len.addr.51, %OP280.JUMPDEST ], [ %len.addr.51, %OP280.JUMPDEST.contd ], [ %len.addr.1085208522, %OP285.PUSH1 ], [ %len.addr.1085208522, %OP285.PUSH1.contd982 ], [ %len.addr.51, %OP261.JUMPDEST ], [ %len.addr.51, %OP261.JUMPDEST.contd ], [ %248, %OP262.PUSH1 ], [ %250, %OP263.MLOAD.contd ], [ %248, %OP268.PUSH1 ], [ %255, %OP274.MLOAD.contd ], [ %len.addr.9, %OP257.JUMPDEST ], [ %len.addr.9, %OP257.JUMPDEST.contd ], [ %len.addr.51, %OP249.JUMPDEST ], [ %len.addr.51, %OP249.JUMPDEST.contd ], [ %len.addr.885158517, %OP254.PUSH1 ], [ %len.addr.885158517, %OP254.PUSH1.contd879 ], [ %len.addr.51, %OP226.JUMPDEST ], [ %len.addr.51, %OP226.JUMPDEST.contd ], [ %217, %OP227.PUSH1 ], [ %219, %OP228.MLOAD.contd ], [ %217, %OP237.PUSH1 ], [ %225, %OP243.MLOAD.contd ], [ %len.addr.7, %OP200.JUMPDEST ], [ %len.addr.7, %OP200.JUMPDEST.contd ], [ %len.addr.51, %OP192.JUMPDEST ], [ %len.addr.51, %OP192.JUMPDEST.contd ], [ %len.addr.685108512, %OP197.PUSH1 ], [ %len.addr.685108512, %OP197.PUSH1.contd672 ], [ %len.addr.5, %OP179.JUMPDEST ], [ %len.addr.5, %OP179.JUMPDEST.contd ], [ %189, %OP186.MLOAD.contd ], [ %len.addr.4, %OP142.JUMPDEST ], [ %len.addr.4, %OP142.JUMPDEST.contd ], [ %142, %OP159.DUP1 ], [ %142, %OP159.DUP1.contd ], [ %139, %OP163.MLOAD.contd ], [ %len.addr.51, %OP88.JUMPDEST ], [ %len.addr.51, %OP88.JUMPDEST.contd ], [ %82, %OP89.PUSH1 ], [ %84, %OP90.MLOAD.contd ], [ %88, %OP100.DUP4 ], [ %86, %OP103.MLOAD.contd ], [ %86, %OP106.PUSH1 ], [ %len.addr.2, %OP84.JUMPDEST ], [ %len.addr.2, %OP84.JUMPDEST.contd ], [ %len.addr.51, %OP76.JUMPDEST ], [ %len.addr.51, %OP76.JUMPDEST.contd ], [ %len.addr.184958497, %OP81.PUSH1 ], [ %len.addr.184958497, %OP81.PUSH1.contd254 ], [ %len.addr.51, %OP74.JUMPDEST ], [ 0, %OP8.PUSH1 ], [ 1, %OP20.DUP1 ], [ 1, %OP25.DUP1 ], [ 1, %OP30.DUP1 ], [ 1, %OP35.DUP1 ], [ 1, %OP40.DUP1 ], [ 1, %OP45.DUP1 ], [ 1, %OP50.DUP1 ], [ 1, %OP55.DUP1 ], [ 1, %OP60.DUP1 ], [ 1, %OP65.DUP1 ], [ %stack_len5539, %OP1318.SWAP4 ], [ %stack_len5539, %OP1318.SWAP4.contd ], [ %1238, %OP1327.PUSH1 ], [ %1238, %OP1327.PUSH1.contd ], [ %1238, %OP1327.PUSH1.contd4738 ], [ 0, %resize.i ], [ 1, %OP76.JUMPDEST.thread ], [ %140, %resize.i7472 ], [ %166, %resize.i7487 ], [ %185, %resize.i7503 ], [ 1, %OP192.JUMPDEST.thread ], [ 1, %OP249.JUMPDEST.thread ], [ 1, %OP280.JUMPDEST.thread ], [ 1, %OP347.JUMPDEST.thread ], [ 1, %OP373.JUMPDEST.thread ], [ 1, %OP408.JUMPDEST.thread ], [ 1, %OP453.JUMPDEST.thread ], [ %459, %resize.i7550 ], [ %485, %resize.i7565 ], [ %504, %resize.i7581 ], [ 1, %OP569.JUMPDEST.thread ], [ 1, %OP626.JUMPDEST.thread ], [ 1, %OP632.JUMPDEST.thread ], [ %595, %resize.i7596 ], [ %594, %resize.i7611 ], [ %596, %resize.i7627 ], [ %599, %resize.i7642 ], [ %596, %resize.i7658 ], [ %654, %resize.i7674 ], [ %653, %resize.i7689 ], [ %654, %resize.i7704 ], [ %673, %resize.i7719 ], [ %722, %resize.i7733 ], [ %770, %resize.i7763 ], [ %769, %resize.i7778 ], [ %770, %resize.i7793 ], [ %769, %resize.i7808 ], [ %773, %resize.i7824 ], [ %821, %resize.i7839 ], [ %773, %resize.i7855 ], [ %859, %resize.i7870 ], [ %858, %resize.i7885 ], [ %896, %resize.i7900 ], [ %895, %resize.i7915 ], [ %896, %resize.i7930 ], [ %895, %resize.i7945 ], [ %962, %resize.i7960 ], [ %961, %resize.i7975 ], [ %962, %resize.i7990 ], [ %961, %resize.i8005 ], [ %1018, %resize.i8020 ], [ %1017, %resize.i8035 ], [ %1018, %resize.i8050 ], [ %1017, %resize.i8065 ], [ %1071, %resize.i8080 ], [ %1070, %resize.i8095 ], [ %1071, %resize.i8110 ], [ %1070, %resize.i8125 ], [ %1072, %resize.i8141 ], [ %1129, %resize.i8156 ], [ %1072, %resize.i8172 ], [ %1156, %resize.i8187 ], [ %1155, %resize.i8202 ], [ %1193, %resize.i8217 ], [ %1192, %resize.i8232 ], [ %1194, %resize.i8248 ], [ %1227, %resize.i8264 ], [ %1253, %resize.i8280 ], [ %1258, %resize.i8295 ], [ %1253, %resize.i8311 ], [ %len.addr.44, %resize.i8326 ], [ %len.addr.44, %resize.i8340 ], [ %1311, %resize.i8356 ], [ %1310, %resize.i8371 ], [ %1311, %resize.i8386 ], [ %1330, %resize.i8401 ], [ %1379, %resize.i8415 ], [ %len.addr.50, %resize.i8445 ], [ %len.addr.50, %resize.i8459 ], [ %len.addr.50, %resize.i8474 ], [ %len.addr.50, %resize.i8488 ], [ %len.addr.31.ph.fr, %return.loopexit.split.loop.exit8831 ], [ %len.addr.31.ph.fr, %OP834.JUMPDEST.us ], [ %len.addr.3.ph.fr, %return.loopexit8688.split.loop.exit8805 ], [ %len.addr.3.ph.fr, %OP120.JUMPDEST.preheader ], [ %len.addr.47.ph.fr, %return.loopexit8691.split.loop.exit8791 ], [ %len.addr.47.ph.fr, %OP1479.JUMPDEST.us ], [ %len.addr.20.ph.fr, %return.loopexit8694.split.loop.exit8768 ], [ %len.addr.20.ph.fr, %OP497.JUMPDEST.preheader ], [ 1022, %OP127.DUP1.us ], [ 1022, %OP504.DUP1.us ], [ %len.addr.31.ph.fr, %OP834.JUMPDEST ], [ %731, %OP834.JUMPDEST.contd ], [ %len.addr.31.ph.fr, %resize.i7748 ], [ %len.addr.3.ph.fr, %OP135.PUSH1 ], [ %len.addr.3.ph.fr, %OP127.DUP1 ], [ %99, %resize.i7442 ], [ %len.addr.3.ph.fr, %resize.i7456 ], [ %len.addr.47.ph.fr, %OP1479.JUMPDEST ], [ %1388, %OP1479.JUMPDEST.contd ], [ %len.addr.47.ph.fr, %resize.i8430 ], [ %len.addr.20.ph.fr, %OP512.PUSH1 ], [ %len.addr.20.ph.fr, %OP504.DUP1 ], [ %418, %resize.i7519 ], [ %len.addr.20.ph.fr, %resize.i7534 ], [ %len.addr.51, %OP1519.JUMPDEST ], [ %len.addr.51, %OP1519.JUMPDEST.contd ], [ %len.addr.51, %dynamic_jump_table ]
  %1468 = phi i8 [ 80, %no_resume ], [ 80, %OP70.JUMPDEST ], [ 92, %OP70.JUMPDEST.contd ], [ 80, %OP687.JUMPDEST ], [ 92, %OP687.JUMPDEST.contd ], [ %616, %OP703.PUSH1 ], [ %617, %OP707.PUSH1 ], [ %619, %OP711.ADD ], [ 80, %OP718.POP ], [ %625, %OP718.POP.contd ], [ %646, %OP736.MLOAD.contd ], [ 80, %OP1527.JUMPDEST ], [ %1438, %OP1527.JUMPDEST.contd ], [ %1447, %OP1534.PUSH1 ], [ %1456, %OP1542.PUSH1 ], [ %1458, %OP1545.PUSH1 ], [ 80, %OP1511.JUMPDEST ], [ %1424, %OP1511.JUMPDEST.contd ], [ 80, %OP952.JUMPDEST ], [ %856, %OP952.JUMPDEST.contd ], [ %877, %OP969.PUSH1 ], [ %878, %OP973.SLOAD ], [ 80, %OP983.JUMPDEST ], [ %891, %OP983.JUMPDEST.contd ], [ 80, %OP1036.JUMPDEST ], [ %950, %OP1036.JUMPDEST.contd ], [ 80, %OP1135.JUMPDEST ], [ %1067, %OP1135.JUMPDEST.contd ], [ %1090, %OP1151.PUSH1 ], [ %1091, %OP1155.PUSH1 ], [ %1093, %OP1159.SUB ], [ 80, %OP1166.POP ], [ %1113, %OP1182.PUSH1 ], [ %1114, %OP1186.PUSH1 ], [ %1116, %OP1190.ADD ], [ 80, %OP1197.POP ], [ %1122, %OP1197.POP.contd ], [ %1146, %OP1218.MLOAD.contd ], [ 80, %OP1040.DUP2 ], [ %959, %OP1040.DUP2.contd ], [ %980, %OP1055.PUSH1 ], [ %999, %OP1072.PUSH1 ], [ %1000, %OP1076.SLOAD ], [ 80, %OP1086.JUMPDEST ], [ %1014, %OP1086.JUMPDEST.contd ], [ %1037, %OP1102.PUSH1 ], [ %1056, %OP1119.PUSH1 ], [ %1057, %OP1123.PUSH1 ], [ %1059, %OP1127.SUB ], [ 80, %OP1134.POP ], [ 80, %OP1083.PUSH1 ], [ %spec.select5564, %OP1083.PUSH1.contd3870 ], [ 80, %OP996.POP ], [ 92, %OP996.POP.contd ], [ %921, %OP1012.PUSH1 ], [ %938, %OP1029.PUSH1 ], [ %939, %OP1033.SLOAD ], [ 80, %OP980.PUSH1 ], [ %spec.select5563, %OP980.PUSH1.contd3492 ], [ 80, %OP1503.JUMPDEST ], [ 91, %OP1503.JUMPDEST.contd ], [ 80, %OP1495.DUP3 ], [ 80, %OP1468.JUMPDEST ], [ %1377, %OP1468.JUMPDEST.contd ], [ %1385, %OP1475.PUSH1 ], [ 80, %OP1388.JUMPDEST ], [ 92, %OP1388.JUMPDEST.contd ], [ %1309, %OP1389.PUSH1 ], [ %1342, %OP1428.PUSH1 ], [ 80, %OP1449.DUP1 ], [ 80, %OP1454.PUSH2 ], [ %1358, %OP1454.PUSH2.contd5208 ], [ 80, %OP1370.JUMPDEST ], [ %1294, %OP1370.JUMPDEST.contd ], [ %1303, %OP1377.PUSH1 ], [ %1304, %OP1380.PUSH1 ], [ 80, %OP1356.JUMPDEST ], [ %1282, %OP1356.JUMPDEST.contd ], [ %1285, %OP1357.PUSH1 ], [ %1286, %OP1361.SWAP1 ], [ 80, %OP1330.JUMPDEST ], [ %1250, %OP1330.JUMPDEST.contd ], [ %1275, %OP1348.MLOAD.contd ], [ 80, %OP1263.JUMPDEST ], [ %1189, %OP1263.JUMPDEST.contd ], [ %1214, %OP1279.PUSH1 ], [ %1215, %OP1283.PUSH1 ], [ %1217, %OP1287.SUB ], [ 80, %OP1294.POP ], [ 92, %OP1294.POP.contd ], [ %1233, %OP1309.MLOAD.contd ], [ 32, %suspend ], [ 80, %OP1233.JUMPDEST ], [ %1153, %OP1233.JUMPDEST.contd ], [ %1175, %OP1249.PUSH1 ], [ %1176, %OP1253.SLOAD ], [ 80, %OP1260.PUSH1 ], [ %spec.select5565, %OP1260.PUSH1.contd4502 ], [ 80, %OP942.JUMPDEST ], [ %846, %OP942.JUMPDEST.contd ], [ %850, %OP943.PUSH1 ], [ 80, %OP866.JUMPDEST ], [ %767, %OP866.JUMPDEST.contd ], [ %790, %OP883.PUSH1 ], [ %808, %OP900.PUSH1 ], [ %809, %OP904.DUP2 ], [ 80, %OP907.POP ], [ %815, %OP907.POP.contd ], [ %839, %OP928.MLOAD.contd ], [ 80, %OP858.JUMPDEST ], [ 91, %OP858.JUMPDEST.contd ], [ 80, %OP850.DUP3 ], [ 80, %OP823.JUMPDEST ], [ %720, %OP823.JUMPDEST.contd ], [ %728, %OP830.PUSH1 ], [ 80, %OP743.JUMPDEST ], [ 92, %OP743.JUMPDEST.contd ], [ %652, %OP744.PUSH1 ], [ %685, %OP783.PUSH1 ], [ 80, %OP804.DUP1 ], [ 80, %OP809.PUSH2 ], [ %701, %OP809.PUSH2.contd2875 ], [ 80, %OP668.JUMPDEST ], [ %579, %OP668.JUMPDEST.contd ], [ %581, %OP669.PUSH1 ], [ %583, %OP670.MLOAD.contd ], [ %585, %OP675.PUSH1 ], [ %spec.select5562, %OP681.MLOAD.contd ], [ 80, %OP640.JUMPDEST ], [ 92, %OP640.JUMPDEST.contd ], [ 80, %OP632.JUMPDEST ], [ 92, %OP632.JUMPDEST.contd ], [ 80, %OP637.PUSH1 ], [ %spec.select5561, %OP637.PUSH1.contd2224 ], [ %spec.select5560, %OP630.JUMPDEST ], [ 80, %OP626.JUMPDEST ], [ 92, %OP626.JUMPDEST.contd ], [ 80, %OP603.JUMPDEST ], [ %535, %OP603.JUMPDEST.contd ], [ %537, %OP604.PUSH1 ], [ %540, %OP605.MLOAD.contd ], [ %542, %OP614.PUSH1 ], [ %spec.select5559, %OP620.MLOAD.contd ], [ 80, %OP577.JUMPDEST ], [ 92, %OP577.JUMPDEST.contd ], [ 80, %OP569.JUMPDEST ], [ 92, %OP569.JUMPDEST.contd ], [ 80, %OP574.PUSH1 ], [ %spec.select5558, %OP574.PUSH1.contd2008 ], [ 80, %OP556.JUMPDEST ], [ 91, %OP556.JUMPDEST.contd ], [ %spec.select5557, %OP563.MLOAD.contd ], [ 80, %OP519.JUMPDEST ], [ 91, %OP519.JUMPDEST.contd ], [ 80, %OP536.DUP1 ], [ 92, %OP536.DUP1.contd ], [ %482, %OP540.MLOAD.contd ], [ 80, %OP465.JUMPDEST ], [ %400, %OP465.JUMPDEST.contd ], [ %402, %OP466.PUSH1 ], [ %406, %OP467.MLOAD.contd ], [ %408, %OP477.DUP4 ], [ %409, %OP480.MLOAD.contd ], [ %411, %OP483.PUSH1 ], [ 80, %OP461.JUMPDEST ], [ 92, %OP461.JUMPDEST.contd ], [ 80, %OP453.JUMPDEST ], [ 92, %OP453.JUMPDEST.contd ], [ 80, %OP458.PUSH1 ], [ %spec.select5556, %OP458.PUSH1.contd1584 ], [ 80, %OP434.JUMPDEST ], [ %370, %OP434.JUMPDEST.contd ], [ %372, %OP435.PUSH1 ], [ %374, %OP436.MLOAD.contd ], [ %376, %OP441.PUSH1 ], [ %spec.select5555, %OP447.MLOAD.contd ], [ 80, %OP416.JUMPDEST ], [ 92, %OP416.JUMPDEST.contd ], [ 80, %OP408.JUMPDEST ], [ 92, %OP408.JUMPDEST.contd ], [ 80, %OP413.PUSH1 ], [ %spec.select5554, %OP413.PUSH1.contd1429 ], [ 80, %OP385.JUMPDEST ], [ %335, %OP385.JUMPDEST.contd ], [ %337, %OP386.PUSH1 ], [ %340, %OP387.MLOAD.contd ], [ %342, %OP396.PUSH1 ], [ %spec.select5553, %OP402.MLOAD.contd ], [ 80, %OP381.JUMPDEST ], [ 92, %OP381.JUMPDEST.contd ], [ 80, %OP373.JUMPDEST ], [ 92, %OP373.JUMPDEST.contd ], [ 80, %OP378.PUSH1 ], [ %spec.select5552, %OP378.PUSH1.contd1310 ], [ %spec.select5551, %OP371.JUMPDEST ], [ 80, %OP355.JUMPDEST ], [ 92, %OP355.JUMPDEST.contd ], [ 80, %OP347.JUMPDEST ], [ 92, %OP347.JUMPDEST.contd ], [ 80, %OP352.PUSH1 ], [ %spec.select5550, %OP352.PUSH1.contd1233 ], [ 80, %OP324.JUMPDEST ], [ %284, %OP324.JUMPDEST.contd ], [ %286, %OP325.PUSH1 ], [ %289, %OP326.MLOAD.contd ], [ %291, %OP335.PUSH1 ], [ %spec.select5549, %OP341.MLOAD.contd ], [ 80, %OP288.JUMPDEST ], [ 92, %OP288.JUMPDEST.contd ], [ 80, %OP280.JUMPDEST ], [ 92, %OP280.JUMPDEST.contd ], [ 80, %OP285.PUSH1 ], [ %spec.select5548, %OP285.PUSH1.contd982 ], [ 80, %OP261.JUMPDEST ], [ %247, %OP261.JUMPDEST.contd ], [ %249, %OP262.PUSH1 ], [ %251, %OP263.MLOAD.contd ], [ %253, %OP268.PUSH1 ], [ %spec.select5547, %OP274.MLOAD.contd ], [ 80, %OP257.JUMPDEST ], [ 92, %OP257.JUMPDEST.contd ], [ 80, %OP249.JUMPDEST ], [ 92, %OP249.JUMPDEST.contd ], [ 80, %OP254.PUSH1 ], [ %spec.select5546, %OP254.PUSH1.contd879 ], [ 80, %OP226.JUMPDEST ], [ %216, %OP226.JUMPDEST.contd ], [ %218, %OP227.PUSH1 ], [ %221, %OP228.MLOAD.contd ], [ %223, %OP237.PUSH1 ], [ %spec.select5545, %OP243.MLOAD.contd ], [ 80, %OP200.JUMPDEST ], [ 92, %OP200.JUMPDEST.contd ], [ 80, %OP192.JUMPDEST ], [ 92, %OP192.JUMPDEST.contd ], [ 80, %OP197.PUSH1 ], [ %spec.select5544, %OP197.PUSH1.contd672 ], [ 80, %OP179.JUMPDEST ], [ 91, %OP179.JUMPDEST.contd ], [ %spec.select5543, %OP186.MLOAD.contd ], [ 80, %OP142.JUMPDEST ], [ 91, %OP142.JUMPDEST.contd ], [ 80, %OP159.DUP1 ], [ 92, %OP159.DUP1.contd ], [ %163, %OP163.MLOAD.contd ], [ 80, %OP88.JUMPDEST ], [ %81, %OP88.JUMPDEST.contd ], [ %83, %OP89.PUSH1 ], [ %87, %OP90.MLOAD.contd ], [ %89, %OP100.DUP4 ], [ %90, %OP103.MLOAD.contd ], [ %92, %OP106.PUSH1 ], [ 80, %OP84.JUMPDEST ], [ 92, %OP84.JUMPDEST.contd ], [ 80, %OP76.JUMPDEST ], [ 92, %OP76.JUMPDEST.contd ], [ 80, %OP81.PUSH1 ], [ %spec.select5542, %OP81.PUSH1.contd254 ], [ %spec.select, %OP74.JUMPDEST ], [ 80, %OP8.PUSH1 ], [ 80, %OP20.DUP1 ], [ 80, %OP25.DUP1 ], [ 80, %OP30.DUP1 ], [ 80, %OP35.DUP1 ], [ 80, %OP40.DUP1 ], [ 80, %OP45.DUP1 ], [ 80, %OP50.DUP1 ], [ 80, %OP55.DUP1 ], [ 80, %OP60.DUP1 ], [ 80, %OP65.DUP1 ], [ 80, %OP1318.SWAP4 ], [ 91, %OP1318.SWAP4.contd ], [ 80, %OP1327.PUSH1 ], [ 92, %OP1327.PUSH1.contd ], [ %spec.select5566, %OP1327.PUSH1.contd4738 ], [ %5, %resize.i ], [ 80, %OP76.JUMPDEST.thread ], [ %160, %resize.i7472 ], [ %176, %resize.i7487 ], [ %186, %resize.i7503 ], [ 80, %OP192.JUMPDEST.thread ], [ 80, %OP249.JUMPDEST.thread ], [ 80, %OP280.JUMPDEST.thread ], [ 80, %OP347.JUMPDEST.thread ], [ 80, %OP373.JUMPDEST.thread ], [ 80, %OP408.JUMPDEST.thread ], [ 80, %OP453.JUMPDEST.thread ], [ %479, %resize.i7550 ], [ %495, %resize.i7565 ], [ %505, %resize.i7581 ], [ 80, %OP569.JUMPDEST.thread ], [ 80, %OP626.JUMPDEST.thread ], [ 80, %OP632.JUMPDEST.thread ], [ %602, %resize.i7596 ], [ %613, %resize.i7611 ], [ %628, %resize.i7627 ], [ %638, %resize.i7642 ], [ %643, %resize.i7658 ], [ %666, %resize.i7674 ], [ %671, %resize.i7689 ], [ %682, %resize.i7704 ], [ %712, %resize.i7719 ], [ %726, %resize.i7733 ], [ %776, %resize.i7763 ], [ %787, %resize.i7778 ], [ %794, %resize.i7793 ], [ %805, %resize.i7808 ], [ %819, %resize.i7824 ], [ %830, %resize.i7839 ], [ %835, %resize.i7855 ], [ %863, %resize.i7870 ], [ %874, %resize.i7885 ], [ %907, %resize.i7900 ], [ %918, %resize.i7915 ], [ %924, %resize.i7930 ], [ %935, %resize.i7945 ], [ %966, %resize.i7960 ], [ %977, %resize.i7975 ], [ %985, %resize.i7990 ], [ %996, %resize.i8005 ], [ %1023, %resize.i8020 ], [ %1034, %resize.i8035 ], [ %1042, %resize.i8050 ], [ %1053, %resize.i8065 ], [ %1076, %resize.i8080 ], [ %1087, %resize.i8095 ], [ %1099, %resize.i8110 ], [ %1110, %resize.i8125 ], [ %1127, %resize.i8141 ], [ %1138, %resize.i8156 ], [ %1143, %resize.i8172 ], [ %1161, %resize.i8187 ], [ %1172, %resize.i8202 ], [ %1200, %resize.i8217 ], [ %1211, %resize.i8232 ], [ %1225, %resize.i8248 ], [ %1230, %resize.i8264 ], [ %1256, %resize.i8280 ], [ %1267, %resize.i8295 ], [ %1272, %resize.i8311 ], [ %1298, %resize.i8326 ], [ %1301, %resize.i8340 ], [ %1323, %resize.i8356 ], [ %1328, %resize.i8371 ], [ %1339, %resize.i8386 ], [ %1369, %resize.i8401 ], [ %1383, %resize.i8415 ], [ %1442, %resize.i8445 ], [ %1445, %resize.i8459 ], [ %1450, %resize.i8474 ], [ %1454, %resize.i8488 ], [ %1461, %return.loopexit.split.loop.exit8831 ], [ 80, %OP834.JUMPDEST.us ], [ %1463, %return.loopexit8688.split.loop.exit8805 ], [ 80, %OP120.JUMPDEST.preheader ], [ %1465, %return.loopexit8691.split.loop.exit8791 ], [ 80, %OP1479.JUMPDEST.us ], [ %1467, %return.loopexit8694.split.loop.exit8768 ], [ 80, %OP497.JUMPDEST.preheader ], [ %spec.select9138, %OP127.DUP1.us ], [ %spec.select9139, %OP504.DUP1.us ], [ 80, %OP834.JUMPDEST ], [ %737, %OP834.JUMPDEST.contd ], [ %746, %resize.i7748 ], [ 80, %OP135.PUSH1 ], [ 80, %OP127.DUP1 ], [ %121, %resize.i7442 ], [ %132, %resize.i7456 ], [ 80, %OP1479.JUMPDEST ], [ %1394, %OP1479.JUMPDEST.contd ], [ %1403, %resize.i8430 ], [ 80, %OP512.PUSH1 ], [ 80, %OP504.DUP1 ], [ %440, %resize.i7519 ], [ %451, %resize.i7534 ], [ 89, %dynamic_jump_table ], [ 91, %OP1519.JUMPDEST.contd ], [ 80, %OP1519.JUMPDEST ]
  store i64 %len.addr.52, ptr %arg.stack_len.addr, align 8
  ret i8 %1468
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
define private fastcc i8 @__revmc_ir_builtin_mstore(i256 noundef %0, i256 noundef %1, ptr noalias nocapture noundef nonnull %2) unnamed_addr #1 {
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
  %7 = icmp ugt i64 %5, -33
  %8 = or i1 %4, %7
  %9 = select i1 %8, i64 -1, i64 %6
  %10 = icmp ugt i64 %9, %3
  br i1 %10, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %11 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %2, i64 %9)
  %.not = icmp eq i8 %11, 0
  br i1 %.not, label %contd, label %common.ret, !prof !7

common.ret:                                       ; preds = %resize, %contd
  %common.ret.op = phi i8 [ 0, %contd ], [ %11, %resize ]
  ret i8 %common.ret.op

contd:                                            ; preds = %resize, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %12 = tail call i256 @llvm.bswap.i256(i256 %1)
  store i256 %12, ptr %slot, align 1
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_resize_memory(ptr noalias nocapture noundef align 8 dereferenceable(88), i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.bswap.i256(i256) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite)
define private fastcc i256 @__revmc_ir_builtin_calldataload(i256 noundef %0, ptr nocapture readonly %.72.val, i64 %.80.val) unnamed_addr #4 {
entry:
  %1 = zext i64 %.80.val to i256
  %2 = icmp ugt i256 %1, %0
  br i1 %2, label %then, label %contd

then:                                             ; preds = %entry
  %3 = trunc i256 %0 to i64
  %calldata.addr = getelementptr inbounds i8, ptr %.72.val, i64 %3
  %4 = sub i64 %.80.val, %3
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 32)
  %calldata.addr1 = alloca i256, align 16
  store i256 0, ptr %calldata.addr1, align 16
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 16 %calldata.addr1, ptr align 1 %calldata.addr, i64 %5, i1 false)
  %calldata.i256 = load i256, ptr %calldata.addr1, align 16
  %6 = tail call i256 @llvm.bswap.i256(i256 %calldata.i256)
  br label %contd

contd:                                            ; preds = %entry, %then
  %7 = phi i256 [ %6, %then ], [ 0, %entry ]
  ret i256 %7
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_do_return(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
define private fastcc i8 @__revmc_ir_builtin_mload(i256 noundef %0, ptr noalias nocapture noundef nonnull writeonly %1, ptr noalias nocapture noundef nonnull %2) unnamed_addr #1 {
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
  %7 = icmp ugt i64 %5, -33
  %8 = or i1 %4, %7
  %9 = select i1 %8, i64 -1, i64 %6
  %10 = icmp ugt i64 %9, %3
  br i1 %10, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %11 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %2, i64 %9)
  %.not = icmp eq i8 %11, 0
  br i1 %.not, label %contd, label %common.ret, !prof !7

common.ret:                                       ; preds = %resize, %contd
  %common.ret.op = phi i8 [ 0, %contd ], [ %11, %resize ]
  ret i8 %common.ret.op

contd:                                            ; preds = %resize, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %slot.value = load i256, ptr %slot, align 1
  %12 = tail call i256 @llvm.bswap.i256(i256 %slot.value)
  store i256 %12, ptr %1, align 16
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_exp(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(64), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i160 @llvm.bswap.i160(i160) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_keccak256(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(64)) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sload(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sstore(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_log(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8, i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_balance(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_call(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8, i8 noundef, i8 noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="apple-m1" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn "target-cpu"="apple-m1" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite) "target-cpu"="apple-m1" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!5}
!5 = distinct !{!5, !6, !"__revmc_ir_builtin_mstore: argument 0"}
!6 = distinct !{!6, !"__revmc_ir_builtin_mstore"}
!7 = !{!"branch_weights", i32 20000, i32 1}
!8 = !{!"check StackOverflow"}
!9 = !{!"branch_weights", i32 118245, i32 2147365403}
!10 = !{!"normal exit"}
!11 = !{!"branch_weights", i32 1, i32 127}
!12 = !{!13, !15}
!13 = distinct !{!13, !14, !"__revmc_ir_builtin_mload: argument 0"}
!14 = distinct !{!14, !"__revmc_ir_builtin_mload"}
!15 = distinct !{!15, !14, !"__revmc_ir_builtin_mload: argument 1"}
!16 = !{!13}
!17 = !{!18}
!18 = distinct !{!18, !19, !"__revmc_ir_builtin_mstore: argument 0"}
!19 = distinct !{!19, !"__revmc_ir_builtin_mstore"}
!20 = !{!"branch_weights", i32 127, i32 2559873}
!21 = !{!"check StackUnderflow"}
!22 = !{!23}
!23 = distinct !{!23, !24, !"__revmc_ir_builtin_mload: argument 1"}
!24 = distinct !{!24, !"__revmc_ir_builtin_mload"}
!25 = !{!26}
!26 = distinct !{!26, !24, !"__revmc_ir_builtin_mload: argument 0"}
!27 = !{!26, !23}
!28 = !{!29}
!29 = distinct !{!29, !30, !"__revmc_ir_builtin_mstore: argument 0"}
!30 = distinct !{!30, !"__revmc_ir_builtin_mstore"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"__revmc_ir_builtin_mload: argument 1"}
!33 = distinct !{!33, !"__revmc_ir_builtin_mload"}
!34 = !{!35}
!35 = distinct !{!35, !33, !"__revmc_ir_builtin_mload: argument 0"}
!36 = !{!35, !32}
!37 = !{!"branch_weights", i32 112545, i32 2147371103}
!38 = !{!"branch_weights", i32 109895, i32 2147373753}
!39 = !{!"branch_weights", i32 108618, i32 2147375030}
!40 = !{!"branch_weights", i32 146250, i32 2147337398}
!41 = !{!"branch_weights", i32 107678, i32 2147375970}
!42 = !{!"branch_weights", i32 107523, i32 2147376125}
!43 = !{!"branch_weights", i32 107446, i32 2147376202}
!44 = !{!45, !47}
!45 = distinct !{!45, !46, !"__revmc_ir_builtin_mload: argument 0"}
!46 = distinct !{!46, !"__revmc_ir_builtin_mload"}
!47 = distinct !{!47, !46, !"__revmc_ir_builtin_mload: argument 1"}
!48 = !{!45}
!49 = !{!50}
!50 = distinct !{!50, !51, !"__revmc_ir_builtin_mstore: argument 0"}
!51 = distinct !{!51, !"__revmc_ir_builtin_mstore"}
!52 = !{!53}
!53 = distinct !{!53, !54, !"__revmc_ir_builtin_mload: argument 1"}
!54 = distinct !{!54, !"__revmc_ir_builtin_mload"}
!55 = !{!56}
!56 = distinct !{!56, !54, !"__revmc_ir_builtin_mload: argument 0"}
!57 = !{!56, !53}
!58 = !{!59}
!59 = distinct !{!59, !60, !"__revmc_ir_builtin_mstore: argument 0"}
!60 = distinct !{!60, !"__revmc_ir_builtin_mstore"}
!61 = !{!62}
!62 = distinct !{!62, !63, !"__revmc_ir_builtin_mload: argument 1"}
!63 = distinct !{!63, !"__revmc_ir_builtin_mload"}
!64 = !{!65}
!65 = distinct !{!65, !63, !"__revmc_ir_builtin_mload: argument 0"}
!66 = !{!65, !62}
!67 = !{!"branch_weights", i32 107407, i32 2147376241}
!68 = !{!"branch_weights", i32 107388, i32 2147376260}
!69 = !{!"branch_weights", i32 107379, i32 2147376269}
!70 = !{!71}
!71 = distinct !{!71, !72, !"__revmc_ir_builtin_mstore: argument 0"}
!72 = distinct !{!72, !"__revmc_ir_builtin_mstore"}
!73 = !{!74}
!74 = distinct !{!74, !75, !"__revmc_ir_builtin_mstore: argument 0"}
!75 = distinct !{!75, !"__revmc_ir_builtin_mstore"}
!76 = !{!77, !79}
!77 = distinct !{!77, !78, !"__revmc_ir_builtin_mload: argument 0"}
!78 = distinct !{!78, !"__revmc_ir_builtin_mload"}
!79 = distinct !{!79, !78, !"__revmc_ir_builtin_mload: argument 1"}
!80 = !{!77}
!81 = !{!82}
!82 = distinct !{!82, !83, !"__revmc_ir_builtin_mstore: argument 0"}
!83 = distinct !{!83, !"__revmc_ir_builtin_mstore"}
!84 = !{!85}
!85 = distinct !{!85, !86, !"__revmc_ir_builtin_mload: argument 1"}
!86 = distinct !{!86, !"__revmc_ir_builtin_mload"}
!87 = !{!88}
!88 = distinct !{!88, !86, !"__revmc_ir_builtin_mload: argument 0"}
!89 = !{!88, !85}
!90 = !{!91, !93}
!91 = distinct !{!91, !92, !"__revmc_ir_builtin_mload: argument 0"}
!92 = distinct !{!92, !"__revmc_ir_builtin_mload"}
!93 = distinct !{!93, !92, !"__revmc_ir_builtin_mload: argument 1"}
!94 = !{!91}
!95 = !{!96}
!96 = distinct !{!96, !97, !"__revmc_ir_builtin_mstore: argument 0"}
!97 = distinct !{!97, !"__revmc_ir_builtin_mstore"}
!98 = !{!99}
!99 = distinct !{!99, !100, !"__revmc_ir_builtin_mstore: argument 0"}
!100 = distinct !{!100, !"__revmc_ir_builtin_mstore"}
!101 = !{!102}
!102 = distinct !{!102, !103, !"__revmc_ir_builtin_mstore: argument 0"}
!103 = distinct !{!103, !"__revmc_ir_builtin_mstore"}
!104 = !{!105}
!105 = distinct !{!105, !106, !"__revmc_ir_builtin_mstore: argument 0"}
!106 = distinct !{!106, !"__revmc_ir_builtin_mstore"}
!107 = !{!108}
!108 = distinct !{!108, !109, !"__revmc_ir_builtin_mstore: argument 0"}
!109 = distinct !{!109, !"__revmc_ir_builtin_mstore"}
!110 = !{!111}
!111 = distinct !{!111, !112, !"__revmc_ir_builtin_mstore: argument 0"}
!112 = distinct !{!112, !"__revmc_ir_builtin_mstore"}
!113 = !{!114}
!114 = distinct !{!114, !115, !"__revmc_ir_builtin_mstore: argument 0"}
!115 = distinct !{!115, !"__revmc_ir_builtin_mstore"}
!116 = !{!117}
!117 = distinct !{!117, !118, !"__revmc_ir_builtin_mstore: argument 0"}
!118 = distinct !{!118, !"__revmc_ir_builtin_mstore"}
!119 = !{!120}
!120 = distinct !{!120, !121, !"__revmc_ir_builtin_mstore: argument 0"}
!121 = distinct !{!121, !"__revmc_ir_builtin_mstore"}
!122 = !{!123, !125}
!123 = distinct !{!123, !124, !"__revmc_ir_builtin_mload: argument 0"}
!124 = distinct !{!124, !"__revmc_ir_builtin_mload"}
!125 = distinct !{!125, !124, !"__revmc_ir_builtin_mload: argument 1"}
!126 = !{!123}
!127 = !{!128}
!128 = distinct !{!128, !129, !"__revmc_ir_builtin_mstore: argument 0"}
!129 = distinct !{!129, !"__revmc_ir_builtin_mstore"}
!130 = !{!131}
!131 = distinct !{!131, !132, !"__revmc_ir_builtin_mload: argument 1"}
!132 = distinct !{!132, !"__revmc_ir_builtin_mload"}
!133 = !{!134}
!134 = distinct !{!134, !132, !"__revmc_ir_builtin_mload: argument 0"}
!135 = !{!134, !131}
!136 = !{!137}
!137 = distinct !{!137, !138, !"__revmc_ir_builtin_mstore: argument 0"}
!138 = distinct !{!138, !"__revmc_ir_builtin_mstore"}
!139 = !{!140}
!140 = distinct !{!140, !141, !"__revmc_ir_builtin_mstore: argument 0"}
!141 = distinct !{!141, !"__revmc_ir_builtin_mstore"}
!142 = !{!143}
!143 = distinct !{!143, !144, !"__revmc_ir_builtin_mstore: argument 0"}
!144 = distinct !{!144, !"__revmc_ir_builtin_mstore"}
!145 = !{!146}
!146 = distinct !{!146, !147, !"__revmc_ir_builtin_mstore: argument 0"}
!147 = distinct !{!147, !"__revmc_ir_builtin_mstore"}
!148 = !{!149}
!149 = distinct !{!149, !150, !"__revmc_ir_builtin_mstore: argument 0"}
!150 = distinct !{!150, !"__revmc_ir_builtin_mstore"}
!151 = !{!152}
!152 = distinct !{!152, !153, !"__revmc_ir_builtin_mstore: argument 0"}
!153 = distinct !{!153, !"__revmc_ir_builtin_mstore"}
!154 = !{!155}
!155 = distinct !{!155, !156, !"__revmc_ir_builtin_mstore: argument 0"}
!156 = distinct !{!156, !"__revmc_ir_builtin_mstore"}
!157 = !{!158}
!158 = distinct !{!158, !159, !"__revmc_ir_builtin_mstore: argument 0"}
!159 = distinct !{!159, !"__revmc_ir_builtin_mstore"}
!160 = !{!161}
!161 = distinct !{!161, !162, !"__revmc_ir_builtin_mstore: argument 0"}
!162 = distinct !{!162, !"__revmc_ir_builtin_mstore"}
!163 = !{!164}
!164 = distinct !{!164, !165, !"__revmc_ir_builtin_mstore: argument 0"}
!165 = distinct !{!165, !"__revmc_ir_builtin_mstore"}
!166 = !{!167}
!167 = distinct !{!167, !168, !"__revmc_ir_builtin_mstore: argument 0"}
!168 = distinct !{!168, !"__revmc_ir_builtin_mstore"}
!169 = !{!170}
!170 = distinct !{!170, !171, !"__revmc_ir_builtin_mstore: argument 0"}
!171 = distinct !{!171, !"__revmc_ir_builtin_mstore"}
!172 = !{!173}
!173 = distinct !{!173, !174, !"__revmc_ir_builtin_mstore: argument 0"}
!174 = distinct !{!174, !"__revmc_ir_builtin_mstore"}
!175 = !{!176}
!176 = distinct !{!176, !177, !"__revmc_ir_builtin_mstore: argument 0"}
!177 = distinct !{!177, !"__revmc_ir_builtin_mstore"}
!178 = !{!179}
!179 = distinct !{!179, !180, !"__revmc_ir_builtin_mstore: argument 0"}
!180 = distinct !{!180, !"__revmc_ir_builtin_mstore"}
!181 = !{!182}
!182 = distinct !{!182, !183, !"__revmc_ir_builtin_mstore: argument 0"}
!183 = distinct !{!183, !"__revmc_ir_builtin_mstore"}
!184 = !{!185}
!185 = distinct !{!185, !186, !"__revmc_ir_builtin_mstore: argument 0"}
!186 = distinct !{!186, !"__revmc_ir_builtin_mstore"}
!187 = !{!188}
!188 = distinct !{!188, !189, !"__revmc_ir_builtin_mstore: argument 0"}
!189 = distinct !{!189, !"__revmc_ir_builtin_mstore"}
!190 = !{!191, !193}
!191 = distinct !{!191, !192, !"__revmc_ir_builtin_mload: argument 0"}
!192 = distinct !{!192, !"__revmc_ir_builtin_mload"}
!193 = distinct !{!193, !192, !"__revmc_ir_builtin_mload: argument 1"}
!194 = !{!191}
!195 = !{!196}
!196 = distinct !{!196, !197, !"__revmc_ir_builtin_mstore: argument 0"}
!197 = distinct !{!197, !"__revmc_ir_builtin_mstore"}
!198 = !{!199}
!199 = distinct !{!199, !200, !"__revmc_ir_builtin_mload: argument 1"}
!200 = distinct !{!200, !"__revmc_ir_builtin_mload"}
!201 = !{!202}
!202 = distinct !{!202, !200, !"__revmc_ir_builtin_mload: argument 0"}
!203 = !{!202, !199}
!204 = !{!205}
!205 = distinct !{!205, !206, !"__revmc_ir_builtin_mstore: argument 0"}
!206 = distinct !{!206, !"__revmc_ir_builtin_mstore"}
!207 = !{!208}
!208 = distinct !{!208, !209, !"__revmc_ir_builtin_mstore: argument 0"}
!209 = distinct !{!209, !"__revmc_ir_builtin_mstore"}
!210 = !{!211}
!211 = distinct !{!211, !212, !"__revmc_ir_builtin_mstore: argument 0"}
!212 = distinct !{!212, !"__revmc_ir_builtin_mstore"}
!213 = !{!214}
!214 = distinct !{!214, !215, !"__revmc_ir_builtin_mstore: argument 0"}
!215 = distinct !{!215, !"__revmc_ir_builtin_mstore"}
!216 = !{}
!217 = !{!218, !220}
!218 = distinct !{!218, !219, !"__revmc_ir_builtin_mload: argument 0"}
!219 = distinct !{!219, !"__revmc_ir_builtin_mload"}
!220 = distinct !{!220, !219, !"__revmc_ir_builtin_mload: argument 1"}
!221 = !{!218}
!222 = !{!223}
!223 = distinct !{!223, !224, !"__revmc_ir_builtin_mload: argument 1"}
!224 = distinct !{!224, !"__revmc_ir_builtin_mload"}
!225 = !{!226}
!226 = distinct !{!226, !224, !"__revmc_ir_builtin_mload: argument 0"}
!227 = !{!226, !223}
!228 = !{!229, !231}
!229 = distinct !{!229, !230, !"__revmc_ir_builtin_mload: argument 0"}
!230 = distinct !{!230, !"__revmc_ir_builtin_mload"}
!231 = distinct !{!231, !230, !"__revmc_ir_builtin_mload: argument 1"}
!232 = !{!229}
!233 = !{!234}
!234 = distinct !{!234, !235, !"__revmc_ir_builtin_mstore: argument 0"}
!235 = distinct !{!235, !"__revmc_ir_builtin_mstore"}
!236 = !{!237}
!237 = distinct !{!237, !238, !"__revmc_ir_builtin_mload: argument 1"}
!238 = distinct !{!238, !"__revmc_ir_builtin_mload"}
!239 = !{!240}
!240 = distinct !{!240, !238, !"__revmc_ir_builtin_mload: argument 0"}
!241 = !{!240, !237}
!242 = !{!243}
!243 = distinct !{!243, !244, !"__revmc_ir_builtin_mstore: argument 0"}
!244 = distinct !{!244, !"__revmc_ir_builtin_mstore"}
!245 = !{!246}
!246 = distinct !{!246, !247, !"__revmc_ir_builtin_mstore: argument 0"}
!247 = distinct !{!247, !"__revmc_ir_builtin_mstore"}
!248 = !{!249, !251}
!249 = distinct !{!249, !250, !"__revmc_ir_builtin_mload: argument 0"}
!250 = distinct !{!250, !"__revmc_ir_builtin_mload"}
!251 = distinct !{!251, !250, !"__revmc_ir_builtin_mload: argument 1"}
!252 = !{!249}
!253 = !{!254}
!254 = distinct !{!254, !255, !"__revmc_ir_builtin_mstore: argument 0"}
!255 = distinct !{!255, !"__revmc_ir_builtin_mstore"}
!256 = !{!257}
!257 = distinct !{!257, !258, !"__revmc_ir_builtin_mstore: argument 0"}
!258 = distinct !{!258, !"__revmc_ir_builtin_mstore"}
!259 = !{!260}
!260 = distinct !{!260, !261, !"__revmc_ir_builtin_mstore: argument 0"}
!261 = distinct !{!261, !"__revmc_ir_builtin_mstore"}
!262 = !{!263}
!263 = distinct !{!263, !264, !"__revmc_ir_builtin_mstore: argument 0"}
!264 = distinct !{!264, !"__revmc_ir_builtin_mstore"}
!265 = !{!266}
!266 = distinct !{!266, !267, !"__revmc_ir_builtin_mstore: argument 0"}
!267 = distinct !{!267, !"__revmc_ir_builtin_mstore"}
!268 = !{!269}
!269 = distinct !{!269, !270, !"__revmc_ir_builtin_mstore: argument 0"}
!270 = distinct !{!270, !"__revmc_ir_builtin_mstore"}
!271 = !{!272}
!272 = distinct !{!272, !273, !"__revmc_ir_builtin_mstore: argument 0"}
!273 = distinct !{!273, !"__revmc_ir_builtin_mstore"}
!274 = !{!275}
!275 = distinct !{!275, !276, !"__revmc_ir_builtin_mstore: argument 0"}
!276 = distinct !{!276, !"__revmc_ir_builtin_mstore"}
!277 = !{!278}
!278 = distinct !{!278, !279, !"__revmc_ir_builtin_mstore: argument 0"}
!279 = distinct !{!279, !"__revmc_ir_builtin_mstore"}
!280 = !{!"branch_weights", i32 1, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000}
!281 = !{!"return CallOrCreate"}

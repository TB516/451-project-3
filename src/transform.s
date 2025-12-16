.text
    .globl transformArray
    .type transformArray, @function
transformArray:
    pushq   %rbx
    pushq   %r12
    pushq   %r13

    movq    %rdi, %r13    # r13 <- src pointer (preserve across calls)
    movq    %rsi, %rbx    # rbx <- dst pointer
    movq    %rcx, %r12    # r12 <- factor (preserve across calls)

    testq   %rdx, %rdx
    jz      .Ldone

.Lloop:
    movl    (%r13), %edi      # load *src directly into edi (first arg)
    movl    %r12d, %esi       # esi = factor (second arg)
    call    multiply          # call assembly multiply
    movl    %eax, (%rbx)      # store result into *dst

    addq    $4, %r13          # advance src pointer (r13)
    addq    $4, %rbx          # advance dst pointer
    decq    %rdx              # decrement count
    jnz     .Lloop

.Ldone:
    popq    %r13
    popq    %r12
    popq    %rbx
    ret
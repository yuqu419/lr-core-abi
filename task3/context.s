/*
extern int set_ctx(context_t *ctx);
extern void jmp_to(context_t *ctx, int value);
typedef struct {
        uintptr_t rbx,rbp,r12,r13,r14,r15;
        uintptr_t rsp;
        uintptr_t rip; 
} context_t;
*/
.section .text
.global set_ctx
.global jmp_to
# 保存rbx,rbp,r12,r13,r14,r15
set_ctx:
    movq %rbx,  0(%rdi)
    movq %rbp,  8(%rdi)
    movq %r12, 16(%rdi)
    movq %r13, 24(%rdi)
    movq %r14, 32(%rdi)
    movq %r15, 40(%rdi)
    # 保存调用函数栈顶
    leaq 8(%rsp), %rax
    movq %rax, 48(%rdi)
    # 保存返回地址
    movq (%rsp), %rax
    movq %rax, 56(%rdi)

    # 第一次返回 0
    xorl %eax, %eax
    ret
jmp_to:
    movq 0(%rdi), %rbx
    movq 8(%rdi), %rbp
    movq 16(%rdi), %r12
    movq 24(%rdi), %r13
    movq 32(%rdi), %r14
    movq 40(%rdi), %r15
    movq 48(%rdi), %rsp
    movq %rsi,%rax
    jmp *56(%rdi)
    

/* 要求：完整保存程序执行所需上下文；切回后调用者应能继续往下执行。 */
#include <stdint.h>
typedef struct {
        uintptr_t rbx,rbp,r12,r13,r14,r15;
        uintptr_t rsp;
        uintptr_t rip; 
} context_t;

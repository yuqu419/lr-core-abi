.section .text
.global my_strlen
my_strlen:
        pushq %rbp
        movq %rsp, %rbp
        subq $4, %rsp
        movl $0, -4(%rbp)
        jmp .L1
.L1:    
        movq %rdi, %rax
        movb (%rax), %al #char c = str[i]
        testb %al, %al #if(c != '0')
        jne .L2
        movl -4(%rbp), %eax
        leave
        ret
.L2:
        addl $1, -4(%rbp)
        addq $1, %rdi
        jmp .L1
/*
int my_strlen(char* str){
        int i = 0;
        while(true){
                char c = str[i];
                if(c != '\0'){
                        i++;
                        continue;
                }
                return i;
        }
}
*/
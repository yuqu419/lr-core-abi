.section .text
.global my_strlen
my_strlen:
        pushq %rbp
        movq %rsp, %rbp
        subq $16, %rsp
        movq $0, -8(%rbp) # size_t i = 0
        jmp .L1
.L1:    
        movb (%rdi), %al # char c = str[i]
        testb %al, %al # if(c != '\0')
        jne .L2
        movq -8(%rbp), %rax
        leave
        ret
.L2:
        incq -8(%rbp) # i++
        incq %rdi
        jmp .L1
/*
size_t my_strlen(char* str){
        size_t i = 0;
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
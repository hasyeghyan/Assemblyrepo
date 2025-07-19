extern printf
extern scanf

section .data
        prompt db "Enter a number:",0
        b db "%d"
        text db "You entered: %d",10,0
        a dd 0

section .text
       global main
main:
                   push rbp
                   mov rbp, rsp

                   xor rax, rax
                   mov rdi, prompt
                   call printf
                   
                   xor rax, rax
                   mov rdi, b
                   mov rsi, a
                   call scanf
                    
                   xor rax, rax
                   mov rdi, text
                   mov rsi, [a]
                   call printf

                   mov rsp, rbp
                   pop rbp
                   ret
              
 section .note.GNU-stack noalloc noexec nowrite progbits

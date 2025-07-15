extern printf

section .data
        text db "The number is: %d",10,0
        a   dd 42

section .text
       global main
 main:
                   push rbp
                   mov rbp, rsp

                   xor rax, rax
                   mov rdi, text
                   mov rsi, [a]

                   call printf

                   mov rsp, rbp
                   pop rbp
                   ret




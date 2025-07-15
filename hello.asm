extern printf

section .data
        text db "Hello, World!",10,0

section .text
       global main
 main:
                   push rbp
                   mov rbp, rsp

                   xor rax, rax
                   mov rdi, text

                   call printf

                   mov rsp, rbp
                   pop rbp
                   ret



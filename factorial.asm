extern printf
extern scanf

section .data
        prompt db "Enter a number:",0
        format  db "%d"
        text db "Factorial: %d",10,0

section .bss

        num resd 1


section .text

       global main

main:
                   push rbp
                   mov rbp, rsp

                   xor rax, rax
                   mov rdi, prompt
                   call printf

                   xor rax, rax
                   mov rdi, format
                   lea  rsi, [num]
                   call scanf

                   mov rax, 1
                   mov rbx, 1
                   mov rcx, [num]
count:
                   mul rbx
                   inc rbx  
                   loop count
                   
                   mov rbx, rax
                   xor rax, rax
                   mov rdi, text
                   mov rsi, rbx
                   call printf

                   mov rsp, rbp
                   pop rbp
                   ret



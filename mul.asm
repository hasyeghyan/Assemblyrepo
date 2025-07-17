extern printf
extern scanf

section .data
        prompt1 db "Enter first number:",0
        prompt2 db "Enter second number:",0
        format  db "%d"
        text db "Product: %d",10,0

section .bss
        num1 resd 1
        num2 resd 1         

section .text

       global main

main:
                   push rbp
                   mov rbp, rsp

                   xor rax, rax
                   mov rdi, prompt1
                   call printf

                   xor rax, rax
                   mov rdi, format
                   lea  rsi, [num1]
                   call scanf

                   xor rax, rax
                   mov rdi, prompt2
                   call printf

                   xor rax, rax
                   mov rdi, format
                   lea rsi, [num2]
                   call scanf

                   mov rax, [num1]
                   mov rbx, [num2]
                   imul rbx
                   

                   
                   mov rdi, text
                   mov rsi, rax
                   call printf 
                  
                   mov rsp, rbp
                   pop rbp
                   ret


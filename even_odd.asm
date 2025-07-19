extern printf
extern scanf

section .data
        prompt db "Enter a number:",0
        format  db "%d"
        text1 db " %d is even",10,0
        text2 db "%d is odd",10,0

section .bss

        num resb 1

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
                   lea  rsi, 

extern printf
extern scanf

section .data
        prompt1 db "Enter first number:",0
        prompt2 db "Enter second number:",0
        format  db "%d"
        text db "Sum: %d",10,0
        a dd 0
        b dd 0
        sum dd 0

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
                   mov rsi, a
                   call scanf
 
                   xor rax, rax
                   mov rdi, prompt2
                   call printf

                   xor rax, rax
                   mov rdi, format
                   mov rsi, b
                   call scanf
                   
                   mov rax, [a]
                   add rax, [b]
                   mov [sum], rax
                   
                   xor rax, rax
                   mov rdi, text
                   mov rsi, [sum]
                   call printf

                   mov rsp, rbp
                   pop rbp
                   ret
          

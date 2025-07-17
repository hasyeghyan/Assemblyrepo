extern printf
extern scanf

section .data
        prompt1 db "Enter first number:",0
        format1  db "%d",0
        format2 db " %c",0
        prompt2 db "Enter second number:",0
        prompt3 db "Enter operation (+,-,*,/):",0
        prompt4 db "Result: %d",10,0

section .bss

        num1 resq 1
        num2 resq 1
        op  resb 1

section .text

       global main

main:
                   push rbp
                   mov rbp, rsp

                   xor rax, rax
                   mov rdi, prompt1
                   call printf

                   xor rax, rax
                   mov rdi, format1
                   lea  rsi, [num1]
                   call scanf

                   xor rax, rax
                   mov rdi, prompt2
                   call printf
                   
                   xor rax, rax
                   mov rdi, format1
                   lea  rsi, [num2]
                   call scanf
                   
                   xor rax, rax
                   mov rdi, prompt3
                   call printf

                   xor rax, rax
                   mov rdi, format2
                   lea  rsi, [op]
                   call scanf
                     
                   mov al, [op]
                   cmp al, '+'
                   je addop
                  
                   cmp al, '-'
                   je subop
                   cmp al, '*'
                   je imulop
                   cmp al, '/'
                   je idivop

addop:
                   mov rbx, [num1]
                   mov rcx, [num2]
                   add rbx, rcx
                   mov rdi, prompt4
                   mov rsi, rbx
                   call printf
                   jmp end 
       
subop:
                   mov rbx, [num1]
                   mov rcx, [num2]
                   sub rbx, rcx
                   mov rdi, prompt4
                   mov rsi, rbx
                   call printf
                   jmp end

imulop:
                 
                   mov rax, [num1]
                   mov rbx, [num2]
                   imul  rbx
                   mov rdi, prompt4
                   mov rsi, rax
                   call printf
                   jmp end
idivop: 


                   mov rax, [num1]
                   cqo
                   mov rbx, [num2]
                   idiv rbx
                   mov rdi, prompt4
                   mov rsi, rax
                   xor rax, rax
                   call printf
                   jmp end

end:
                   mov rsp, rbp
                   pop rbp
                   ret


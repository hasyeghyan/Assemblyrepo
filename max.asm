extern printf
extern scanf

section .data
        prompt1 db "Enter first number:",0
        prompt2 db "Enter second number:",0
        format  db "%d"
        text db "Max: %d",10,0
        a dd 0
        b dd 0
        max dd 0

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
                  
                   
                   mov eax, [a]
                   mov ebx, [b] 


                   cmp eax, ebx 
                   jae maxa
                   mov [max], ebx
                   jmp  print
maxa:
                   mov [max], eax 

                   
                  
print:
                   xor rax, rax
                   mov rdi, text
                   mov rsi, [max]
                   call printf
 
                   mov rsp, rbp
                   pop rbp
                   ret
 
section .note.GNU-stack noalloc noexec nowrite progbits


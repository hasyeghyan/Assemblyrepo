extern printf
extern scanf

section .data
        prompt db "Enter the number of terms:",0
        format  db "%d",0
        format1 db "%d , ",0
        text db "Fibonachi sequence:",10,0
        text1 db "Invalid number of terms",10,0
        saved_rcx dq 0
        
section .bss

        num resd 1
        saved_rax resq 1

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
                  
                   
                   xor rax, rax
                   mov rdi, text
                   call printf
                 
                   movsx rcx, dword[num]

                   cmp rcx, 0
                   jle invalid
                     
                   mov rax, 0
                   mov rbx, 1
                          
fib:               
                   mov [saved_rcx], rcx
                   mov [saved_rax], rax
                   mov rdi, format1  
                   mov rsi, rax
                   xor rax, rax
                   call printf  
                   mov rcx, [saved_rcx]
                    
                   mov rax, [saved_rax]
                   mov rdx, rax
                   add rax, rbx
                   mov rbx, rdx
                   loop  fib
                   jmp end
                   
invalid: 
                   xor rax, rax
                   mov rdi, text1
                   call printf
end:
                   mov rax, 0
                   mov rsp, rbp 
                   pop rbp
                   ret


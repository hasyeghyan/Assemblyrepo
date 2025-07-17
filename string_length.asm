extern printf
extern scanf

section .data
        prompt db "Enter a string:",0
        format  db "%s"
        text db "Length: %d",10,0

section .bss 
     
        string resb 100
        
        
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
                   lea  rsi, [string] 
                   call scanf
                   
                   
                   lea rbx, [string]  
                   xor rcx, rcx   

count_loop:
                   mov al, [rbx + rcx]
                   cmp al, 0           
                   je print             
                   inc rcx             
                   jmp count_loop      

print:
                      
                   
                   xor rax, rax                    
                   mov rdi, text
                   mov rsi, rcx

                   call printf

                   mov rsp, rbp
                   pop rbp
                   ret



extiern printf
extern scanf

section .data
        prompt db "Enter a number:",0
        format  db "%d",0
        text1 db "%d is even",10,0
        text2 db "%d is odd",10,0

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

                   mov rax, [num] 
                   and rax, 1 
                   cmp rax, 0
                   je print1
                   jmp print2

print1:
                   xor rax, rax
                   mov rdi, text1
                   mov rsi, [num]
                   call printf
                   jmp end

print2:  
                   xor rax, rax
                   mov rdi, text2
                   mov rsi, [num]
                   call printf

end:
                   mov rsp, rbp
                   pop rbp
                   ret

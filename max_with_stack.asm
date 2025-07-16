extern printf
extern scanf

section .data
        prompt1 db "Enter first number:",0
        prompt2 db "Enter second number:",0
        output_msg db "Max: %d",10,0
        frmt db "%d",0

section .text
        global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, 16

        mov rdi, prompt1
        xor rax, rax
        call printf

        mov rdi, frmt
        lea rsi, [rbp - 8]
        xor rax, rax
        call scanf

        mov rdi, prompt2
        xor rax, rax
        call printf

        mov rdi, frmt
        lea rsi, [rbp - 16]
        xor rax, rax
        call scanf

        mov rax, qword[rbp - 8]
        mov rbx, qword[rbp - 16]

        cmp rax, rbx
        jg maxa
        mov rbx, [rbp - 16]
        jmp print
maxa:
        mov rbx, [rbp - 8]

print:
        mov rdi, output_msg
        mov rsi, rbx
        xor rax, rax
        call printf

        mov rsp, rbp
        pop rbp






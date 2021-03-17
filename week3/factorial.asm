%include "convascii.asm"

section .data 
    msg1 db "Factorial of "
    m1len equ $ - msg1
    msg2 db "equals to "
    m2len equ $ - msg2
    num db 8

section .bss
    fact resb 4

section .text
    global _start  

_start:

    mov ebx, [num]
    call check_fact
    mov [fact], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, m1len
    int 0x80
    
    mov eax, [num]
    call print

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, m2len
    int 0x80

    mov eax, [fact]
    call print
    call exit    

check_fact:
    cmp ebx, 1
    jg fact_mul
    mov eax, 1
    ret

fact_mul:
    dec ebx
    call check_fact
    inc ebx
    mul ebx         ; ax = al * bl
    ret

exit:
    mov eax, 1
    int 0x80

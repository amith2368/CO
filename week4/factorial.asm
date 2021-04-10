%include "functions.asm"

section .data 
    msg1 db "Factorial of "
    m1len equ $ - msg1
    msg2 db "equals to "
    m2len equ $ - msg2


section .text
    global _start  

_start:

    mov ebx, 14
    call check_fact
    call iprintLF
    push eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, m1len
    int 0x80
    
    mov eax, 14
    call iprintLF

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, m2len
    int 0x80

    pop eax
    call iprintLF
    xor eax, eax
    call quit    

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
    call iprintLF
    push eax
    mov eax, ebx
    call iprintLF
    pop eax
    ret

exit:
    mov eax, 1
    int 0x80

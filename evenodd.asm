section .text 
    global _start

_start: 
    mov ax, 09h
    and ax, 01h 
    jz evnn

    mov edx, len1
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp outp

evnn:
    
    mov edx, len2
    mov ecx, msg2
    mov ebx, 1
    mov eax, 4
    int 0x80

outp:
    mov eax, 1
    int 0x80

section .data
    msg1 db 'ODD!'
    len1 equ $ - msg1
    msg2 db 'EVEN!'
    len2 equ $ - msg2


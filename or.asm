%include "functions.asm"
section .text 
   global _start

_start:
   mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, mlen
    int 0x80

    mov eax, [num1]
    mov ebx, [num2]
    or eax, ebx
    call iprintLF
    call quit

section .data
    msg db "The bitwise OR result is: "
    mlen equ $ - msg
    num1 dq 422   ;binary form: 00001 1010 0110
    num2 dq 120   ;binary form: 00000 0111 1000
    nl db 0xa    ;new line ;OR  00001 1111 1110 (510)

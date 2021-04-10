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
    sub eax, ebx

    call iprintLF
    call quit

section .data
    msg db "The Difference is: "
    mlen equ $ - msg
    num1 dq 422
    num2 dq 90
    nl db 0xa

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
    inc eax
    call iprintLF
    call quit   


section .data
    msg db "The Incremented value is: "
    mlen equ $ - msg
    num1 dq 419

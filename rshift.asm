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
    shr eax, 2
    call iprintLF
    call quit

section .data
    msg db "The Right shifted value is: "
    mlen equ $ - msg
    num1 dq 512     ;binary form: 0010 0000 0000
    nl db 0xa       ;rshift res:  0000 1000 0000 (128)

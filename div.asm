%include "functions.asm"
section .text 
   global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, mlen
    int 0x80

    xor edx, edx
    mov eax, [num1]
    mov ebx, [num2]
    div ebx

    call iprintLF
    call quit

section .data
    msg db "The quotient is: "
    mlen equ $ - msg
    num1 dq 622
    num2 dq 100
    nl db 0xa
    

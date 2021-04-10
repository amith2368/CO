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
    shl eax, 3
    call iprintLF
    call quit


section .data
    msg db "The Left shifted value is: "
    mlen equ $ - msg
    num1 dq 128     ;binary form: 0000 1000 0000
    nl db 0xa       ;lshift res:  0100 0000 0000 (1024)

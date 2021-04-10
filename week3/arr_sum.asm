%include "functions.asm"

section .data 
    num: dd 10, 20, 40, 30
    total: dd 0
    msg db "The total sum :"
    mlen equ $ - msg

section .text
    extern _printf
    global _start

_start:
   mov   eax,4
   mov   ebx,1
   mov   ecx, msg
   mov   edx, mlen
   int   0x80

   mov esi, 4
   xor eax, eax

get_sum:
    mov ebx, DWORD[num + esi * 4 - 4]
    add eax, ebx
    dec esi
    test esi, esi 
    jnz get_sum

    call iprintLF

    call quit

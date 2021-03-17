%include "functions.asm"

SECTION .text
global  _start
 
_start:
 
    mov     ecx, 0
 
nextNumber:
    mov     rax, 9000000000
    mov     ebx, 1002
    add     eax, ebx
    call    iprintLF        ; NOTE call our new integer printing function (itoa)

 
    call    quit
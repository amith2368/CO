%include "functions.asm"

SECTION .data
    msg1 db "The number is palindrome", 0h
    msg2 db "The number is not palindrome", 0h
    num dd 121

SECTION .bss
    digits resb 2
    result resb 4
    temp   resb 4

SECTION .text
global  _start
 
_start:

    mov     eax, [num]
    mov     [temp], eax
    mov     ecx, 0
reverse:
    inc     ecx
    mov     eax, [num]
    mov     edx, 0
    mov     esi, 10
    div     esi
    push    edx
    mov     [num], eax
    cmp     ecx, 1
    je      initial
    mov     eax, [result]
    mul     esi
    pop     edx
    add     eax, edx
    mov     [result], eax
check:
    mov     eax, [num]
    cmp     eax, 0
    jne     reverse

    mov     eax, [result]
    call    iprintLF

    cmp     eax, [temp]
    jnz     not_pal

pal:    
    mov     eax, msg1
    call    sprintLF
    call    call_quit

not_pal:
    mov     eax, msg2
    call    sprintLF
    call    call_quit

initial:
    pop     eax
    mov     [result], eax
    jmp     check


call_quit:
    call    quit
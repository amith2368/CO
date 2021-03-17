%include "functions.asm"

SECTION .data
    msg1 db "The number is prime", 0h
    msg2 db "The number is not prime", 0h
    num dd 12
    factor dd 1

SECTION .text
global  _start
 
_start:
 
    mov     eax, [num]    
    call    iprintLF
    mov     ebx, [factor]  

check_fact:
    inc     ebx
    cmp     eax, ebx
    jz     is_prime
    idiv    ebx
    cmp     edx, 0
    jz      not_prime

is_prime:
    mov     eax, msg1 
    call    sprintLF
    call    quit 

not_prime:
    mov     eax, msg2   
    call    sprintLF

call_quit:
    call    quit
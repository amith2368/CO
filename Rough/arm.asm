%include "functions.asm"

SECTION .data
    num dd 2
    msg1 db "It is a armstrong number", 0h
    msg2 db "It is not a armstrong number", 0h

SECTION .bss
    digit   resb 3
    result  resb 4
    temp    resb 2

SECTION .text
global  _start
 
_start:
    
    mov     eax, [num]    
    call    iprintLF

    cmp     eax, 10
    jl      exclude

    ;Getting No of digits 
    push    eax
    mov     ecx, 1
    call    ilen 
    mov     [digit], ecx
    mov     ecx, 0
    mov     eax, [digit]
    call    iprintLF
    pop     eax

    ;Getting different digits
    xor     edx, edx
    xor     eax, eax
    xor     ecx, ecx
    mov     eax, [num]
    mov     ecx, [digit]

    
seperate:
    dec     ecx
    mov     ebx, 10
    div     ebx
    push    edx    
    ; call    iprintLF
    cmp     ecx, 1
    jg      seperate  
    push    eax 

summing_1:
    pop     edx
    mov     [temp], edx
    mov     eax, edx
    call    iprintLF
    xor     ecx, ecx
    mov     ecx, [digit]
    call    power_1           ;First digit power 

power_1:
    dec     ecx
    mov     edx, [temp]
    mul     edx
    ; call    iprintLF
    cmp     ecx, 1
    jnz     power_1  

    mov     [result], eax

    pop     edx
    pop     edx
    mov     [temp], edx
    mov     eax, edx
    ; call    iprintLF
    xor     ecx, ecx
    mov     ecx, 3 

power_2:
    dec     ecx
    mov     edx, [temp]
    mul     edx
    ; call    iprintLF
    cmp     ecx, 1
    jnz     power_2

    add     [result], eax

    pop     edx
    mov     [temp], edx
    mov     eax, edx
    ; call    iprintLF
    xor     ecx, ecx
    mov     ecx, 3 

power_3:
    dec     ecx
    mov     edx, [temp]
    mul     edx
    ; call    iprintLF
    cmp     ecx, 1
    jnz     power_3

    add     [result], eax

    mov     eax, [result]
    call    iprintLF 

    cmp      eax, [num]
    jne      arm_no

arm_yes:
    mov     eax, msg1
    call    sprintLF
    call    call_quit

arm_no:
    mov     eax, msg2
    call    sprintLF
    call    call_quit
    

ilen: 
    inc     ecx 
    mov     esi, 10
    idiv    esi
    cmp     eax, 10
    jnl     ilen
    ret


exclude:
    mov     eax, msg1
    call    sprintLF

call_quit:
    call    quit
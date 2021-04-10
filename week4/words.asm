%include "functions.asm"

SECTION .data
    msgCh db "Characters: ", 0h
    msgWo db "Words: ", 0h
    msgVe db "Verbs: ", 0h
    msgCo db "Consonants: ", 0h
    text db "Hello IIITDM"
    wlength dd 0
    vlength dd 0
    clength dd 0

SECTION .text
global  _start
 
_start:
    mov     eax, text
    mov     ebx, eax
    mov     ecx, 0

checkChar:
    cmp     byte [eax], 0
    jz      compChar
    cmp     byte [eax], " "
    jz      compWord
    cmp     byte [eax], "a"
    jz      compVerb
    cmp     byte [eax], "e"
    jz      compVerb
    cmp     byte [eax], "i"
    jz      compVerb
    cmp     byte [eax], "o"
    jz      compVerb
    cmp     byte [eax], "u"
    jz      compVerb
    jmp    compCons
resume:
    inc     ecx
    inc     eax
    jmp     checkChar

compChar:
    mov     eax, msgCh
    call    sprint
    mov     eax, ecx
    sub     eax, 1  
    call    iprintLF

    mov     eax, msgWo
    call    sprint
    mov     eax, [wlength]
    add     eax, 1
    call    iprintLF
    
    mov     eax, msgVe
    call    sprint
    mov     eax, [vlength]
    call    iprintLF
    
    mov     eax, msgCo
    call    sprint
    mov     eax, [clength]
    call    iprintLF

    mov     eax, text
    call    sprintLF
    
    call    call_quit

compWord: 
    push    ecx
    mov     ecx, [wlength]
    add     ecx, 1
    mov     [wlength], ecx
    pop     ecx
    jmp     resume

compVerb: 
    push    ecx
    mov     ecx, [vlength]
    add     ecx, 1
    mov     [vlength], ecx
    pop     ecx
    jmp     resume

compCons: 
    push    ecx
    mov     ecx, [clength]
    add     ecx, 1
    mov     [clength], ecx
    pop     ecx
    jmp     resume

call_quit:
    call    quit
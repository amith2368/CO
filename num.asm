section .data 
    userMsg db 'Enter your number'
    len equ $ - userMsg
    display db 0xa, "You have entered: "
    lend equ $ - display

section .bss
    num resb 5

section .text 
    global _start

_start:
    mov edx, len
    mov ecx, userMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 5
    mov ecx, num
    mov ebx, 2
    mov eax, 3
    int 0x80

    mov edx, lend 
    mov ecx, display 
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 5
    mov ecx, num 
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80




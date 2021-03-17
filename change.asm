section .data 
    name db 'Zara Ali Khan '
    len equ $ - name

section .text 
    global _start

_start:

    ;writing the first name
    mov edx, len
    mov ecx, name
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov [name], word 'Nu'
    

    mov edx, len
    mov ecx, name
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax,1 
    int 0x80
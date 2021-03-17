%include "convascii.asm"

section .data
    limit dd 50
    num dd 1

section .text
    global _start

_start:
loop:
    mov eax, [num]      ;get the number from buffer
    call print          ;print function and clear eax

    mov eax, [num]      ;move the buffer data(number) to eax
    inc eax             ;increment the number
    mov [num], eax      ;again move number to buffer

    cmp eax, [limit]    ;compare if the number is at limit
    jne loop            ;if not loop again

    call print          ;last print
    

    mov eax, 1          ;exit
    int 0x80
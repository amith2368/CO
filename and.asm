section .text 
   global _start

_start:
   mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, mlen
    int 0x80

    mov eax, [num1]
    mov ebx, [num2]
    and eax, ebx



    mov ecx, 10     ;divide by 10
    xor bx, bx      ; digit counter reset to 0 

divide:
    xor edx, edx    ; remainder reset to 0
    div ecx         ; eax/ecx, eax = quotient edx = remainder
    push dx         ; push a single digit 
    inc bx          ; digit counter incremented
    test eax, eax   ; see if eax 0
    jnz divide      ; if not, continue loop

    ;; length adjust
    xor eax, eax    ;clear eax register
    mov ax, rlen    ;result length
    sub ax, bx      ;

    ;; eax is now zero
    mov cx, bx      ; bx is num of digits
    mov esi, eax    ; ds:si points to string buffer starting

reverse:
    pop ax          ;pop the last digit
    add ax, '0'     ;convert decimal to ascii
    mov [result+esi], ax ;the memory buffer is given the char   
    inc esi         ;increment cell location
    loop reverse  

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, rlen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    mov ecx, 5
zero_strResult:
    mov byte [result+ecx], "0"
    loop zero_strResult

    mov eax, 1
    int 0x80

section .data
    msg db "The bitwise AND result is: "
    mlen equ $ - msg
    result db '0000'
    rlen equ $ - result
    num1 dq 422   ;binary form: 00010 1010 0110
    num2 dq 120   ;binary form: 00000 0111 1000
    nl db 0xa    ;new line ;AND 00000 0010 0000 (32)
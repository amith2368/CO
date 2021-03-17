section .data
    result db "00000"
    rlen equ $ - result
    nl db 0xa


; EAX - The Number to be converted
; EBX - Counter
; ECX - Divisor ( /10)
; EDX - Remainder

print:
    mov ecx, 10     ;divide by 10
    xor ebx, ebx      ; digit counter reset to 0 

divide:
    xor edx, edx    ; remainder reset to 0
    div ecx         ; eax/ecx, eax = quotient edx = remainder
    push dx         ; push a single digit to the stack
    inc bx          ; digit counter incremented
    test eax, eax   ; see if eax 0
    jnz divide      ; if not, continue loop

    
    xor esi, esi    ;clear esi register
    mov si, rlen    ;result length
    sub si, bx      ;give the result pointer

    
    mov cx, bx      ; bx is num of digits

reverse:
    pop ax          ;pop the last digit added
    add al, '0'     ;convert decimal to ascii
    mov [result+esi], al ;the memory buffer is given the char   
    inc esi         ;increment string cell location
    loop reverse  

    mov eax, 4	     ;Std Display Code for result
    mov ebx, 1
    mov ecx, result
    mov edx, rlen
    int 0x80

    mov eax, 4	     ;Std Display Code for Newline
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    mov ecx, rlen   ;Reset the length		
zero_reset:				
    mov byte [result + ecx - 1], "0"		
    loop zero_reset 
    ret

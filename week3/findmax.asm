
%include "convascii.asm"
section .data
	num1 dd 143
	num2 dd 193
	num3 dd 873
	num4 dd 993
	num5 dd 444

	msg db "The max of 5 is: "
	mlen equ $ - msg

section .text
	global _start

_start:
	mov   eax,4
	mov   ebx,1
	mov   ecx, msg
 	mov   edx, mlen
	int   0x80

    mov eax, [num1]      ;get the number from buffer
    call print 
	
	mov eax, [num1]
	cmp eax, [num2]
	jg compare_third	; if num1 > num2 jump
	mov eax, [num2]		; else max = num2


compare_third:
	cmp eax, [num3]
	jg compare_forth	; if num3 > max jump
	mov eax, [num3]		; else max = num3 

compare_forth:
	cmp eax, [num4]
	jg compare_fifth	; if num4 > max jump
	mov eax, [num4]		; else max = num4


compare_fifth:
	cmp eax, [num5]
	jg exit			; if num5 > max jump
	mov eax, [num5]		; else max = num5

exit:
	call print          ;converts in ascii and print it

	mov eax, 1          ;exit
	int 0x80

%include "functions.asm"

SECTION .data 
	num1 dd 80
	num2 dd 20

SECTION .bss
	sub1 resb 2
	sub2 resb 2

SECTION .text 
	global _start

_start: 
	mov 	dword [sub1], num1
	mov 	ebx, [sub1]
	mov 	eax, [ebx]
	mov 	dword [sub2], num2
	mov 	ebx, [sub2]
	add 	eax, [ebx]	
	call 	iprintLF
	call 	quit

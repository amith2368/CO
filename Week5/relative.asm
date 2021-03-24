%include "functions.asm"

SECTION .data
	num1 dd 8
	num2 dd 9
	
SECTION .bss
	sub1 resw 1
	sub2 resw 1

SECTION .text 
	global _start

_start:
	mov 	dword [sub1], num1
	mov 	ecx, sub1
	mov 	ebx, [ecx]
	mov 	eax, [ebx]
	
	mov 	ecx, 0
	mov 	ebx, 0
	
	mov 	dword [sub2], num2
	mov 	ecx, sub2
	mov 	ebx, [ecx]
	add 	eax, [ebx]
	call 	iprintLF
	
	call 	quit

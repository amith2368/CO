%include "functions.asm"
SECTION .data
	num1 dd 15
	num2 dd 20

SECTION .text
	global _start

_start:
	mov	eax, [num1]
	mov 	ebx, num2
	add 	eax, [ebx]
	call 	iprintLF
	call	quit
	

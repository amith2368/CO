%include "functions.asm"

SECTION .data
	num dq 10, 100, 500

SECTION .text 
	global _start

_start:
	mov	ecx, num
	mov	ebx, 8
	mov 	eax, [ecx]
	add	eax, [ecx + ebx]
	call 	iprintLF
	call 	quit
	

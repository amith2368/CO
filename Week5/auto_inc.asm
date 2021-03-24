%include "functions.asm"

SECTION .data
	num dd 10, 21, 30, 90

SECTION .text
	global _start

_start:
	mov 	ecx, 4
	mov	ebx, num
	mov	eax, [ebx]
	
auto_inc:
	add 	eax, [ebx + ecx]
	add 	ecx, 4
	cmp	ecx, 16
	jne	auto_inc
	
	call	iprintLF
	call 	quit
	

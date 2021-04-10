%include "functions.asm"

SECTION .data
	num dd 10, 21, 30, 90

SECTION .text
	global _start

_start:
	mov 	ecx, 12
	mov	ebx, num
	mov	eax, [ebx + 16]
	
auto_dec:
	add 	eax, [ebx + ecx]
	sub 	ecx, 4
	cmp	ecx, -4
	jne	auto_dec
	
	call	iprintLF
	call 	quit
	
	

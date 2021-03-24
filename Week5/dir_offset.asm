%include "functions.asm"

SECTION .data
	num dd 10, 2, 4

SECTION .text 
	global _start

_start: 
	mov 	ecx, num
	mov 	eax, [num]
	add 	eax, [num + 4]
	call 	iprintLF
	call 	quit

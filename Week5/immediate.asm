%include "functions.asm"

SECTION .text
	global _start

_start:
	mov 	eax, 10
	add	eax, 30
	call 	iprintLF
	call 	quit

%include "functions.asm"

SECTION .data
	num1 dd 4
	num2 dd 10

SECTION .text
	global _start

_start:
	mov	eax, [num1]
	add 	eax, [num2]
	call 	iprintLF

	call	quit

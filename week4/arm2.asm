%include "functions.asm"

SECTION .data
	msg1 db "It is armstrong number", 0h
	msg2 db "It is not armstrong number", 0h
	num dd 370
	digit dd 0
	ctr dd 0
	result dd 0

SECTION .text
	global _start
	
_start:
	mov 	eax, [num]
	call	iprintLF
	
	cmp 	eax, 10
	jl	is_arm
	
	mov 	ecx, 0
count:
	inc 	ecx
	mov 	edx, 0
	mov 	esi, 10
	idiv 	esi 
	push 	edx
	
	cmp 	eax, 0
	jnz	count	

	mov 	[digit], ecx
	mov 	[ctr], ecx

popAndAdd:
	dec	ecx
	pop 	eax
	mov 	ebx, eax
	push 	ecx
	mov 	ecx, [ctr]
	call	powering
	pop	ecx
	add	[result], eax
	cmp 	ecx, 0 
	jnz 	popAndAdd
	jmp 	call_check


powering:
	dec 	ecx
	mul 	ebx
	
	cmp	ecx, 1
	jnz 	powering 	
	ret


call_check:
	mov 	eax, [result]
	cmp 	eax, [num]
	jnz 	not_arm
	
is_arm:
	mov 	eax, msg1
	call	sprintLF	
	call	call_quit

not_arm:
	mov 	eax, msg2
	call	sprintLF
	



call_quit:
	
	call	quit  


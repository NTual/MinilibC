	BITS 64
	section .text

	global fstat

fstat:
	mov rax, 5
	syscall
	ret

	BITS 64
	section .text

	global open

open:
	mov rax, 2
	syscall
	ret

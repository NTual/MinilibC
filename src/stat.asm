	BITS 64
	section .text

	global stat

stat:
	mov rax, 4
	syscall
	ret

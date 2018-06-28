	BITS 64
	section .text

	global read

read:
	mov rax, 0
	syscall
	ret

	BITS 64
	section .text

	global lstat

lstat:
	mov rax, 6
	syscall
	ret

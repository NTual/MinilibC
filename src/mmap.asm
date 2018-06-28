	BITS 64
	section .text

	global mmap

mmap:
	mov rax, 9
	syscall
	ret

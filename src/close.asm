	BITS 64
	section .text

	global close

close:
	mov rax, 3
	syscall
	ret

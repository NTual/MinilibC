	BITS 64
	section .text

	global strlen

strlen:
	push rbp
	mov rbp, rsp
	
	mov rax, -1
loop:	
	add rax, 1
	cmp BYTE[rdi + rax], 0
	jnz loop

	mov rsp, rbp
	pop rbp
	ret
	

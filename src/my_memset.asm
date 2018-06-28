	BITS 64
	section .text

	global memset

memset:
	push rbp
	mov rbp, rsp

	mov r10, -1
	sub rdx, 1

loop:
	add r10, 1
	mov BYTE[rdi + r10], sil
	cmp r10, rdx
	jnz loop

	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
	

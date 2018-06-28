	BITS 64
	section .text

	global memcpy

memcpy:
	push rbp
	mov rbp, rsp

	mov r10, -1
	cmp rdx, 0
	jz end
	sub rdx, 1
	
loop:
	add r10, 1
	mov r9b, BYTE[rsi + r10]
	mov BYTE[rdi + r10], r9b
	cmp r10, rdx
	jnz loop

end:	
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

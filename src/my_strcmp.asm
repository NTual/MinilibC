	BITS 64
	section .text

	global strcmp

strcmp:
	push rbp
	mov rbp, rsp

	mov rdx, -1

loop:
	add rdx, 1
	cmp BYTE[rsi + rdx], 0
	jz retend
	cmp BYTE[rdi + rdx], 0
	jz retend
	mov r10b, BYTE[rsi + rdx]
	cmp BYTE[rdi + rdx], r10b
	jz loop

retend:
	mov r9b, BYTE[rdi + rdx]
	sub r9b, BYTE[rsi + rdx]
	movsx rax, r9b

	mov rsp, rbp
	pop rbp
	ret

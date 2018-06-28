	BITS 64
	section .text

	global strncmp

strncmp:
	push rbp
	mov rbp, rsp

	mov r8, -1
	cmp rdx, 0
	je retnull

loop:
	add r8, 1
	cmp r8, rdx
	je retn
	cmp BYTE[rsi + r8], 0
	je retend
	cmp BYTE[rdi + r8], 0
	je retend
	mov r10b, BYTE[rsi + r8]
	cmp BYTE[rdi + r8], r10b
	je loop

retend:
	mov r9b, BYTE[rdi + r8]
	sub r9b, BYTE[rsi + r8]
	movsx rax, r9b

	mov rsp, rbp
	pop rbp
	ret

retn:
	sub r8, 1
	mov r9b, BYTE[rdi + r8]
	sub r9b, BYTE[rsi + r8]
	movsx rax, r9b

	mov rsp, rbp
	pop rbp
	ret
	
retnull:
	mov rax, 0

	mov rsp, rbp
	pop rbp
	ret

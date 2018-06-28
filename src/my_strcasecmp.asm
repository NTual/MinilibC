	BITS 64
	section .text

	global strcasecmp

strcasecmp:
	push rbp
	mov rbp, rsp

	mov rdx, -1

loop:
	add rdx, 1
	mov r8b, BYTE[rdi + rdx]
	mov r11b, BYTE[rsi + rdx]
	cmp r8b, 0
	jz retend
	cmp r11b, 0
	jz retend
	cmp r8b, 97
	jge first_minus
loop2:
	cmp r11b, 97
	jge sec_minus
loop3:	
	cmp r8b, r11b
	jz loop

retend:
	mov r9b, r8b
	sub r9b, r11b
	movsx rax, r9b

	mov rsp, rbp
	pop rbp
	ret

first_minus:
	cmp r8b, 122
	jle sub_minus
	jmp loop2
	
sub_minus:
	sub r8b, 32
	jmp loop2

sec_minus:
	cmp r11b, 122
	jle sub_sec_minus
	jmp loop3
	
sub_sec_minus:
	sub r11b, 32
	jmp loop3

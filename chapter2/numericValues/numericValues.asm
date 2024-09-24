; numericValues.asm	; display some numeric values
; Assemble:		; nasm -f elf64 -o numericValues.o numericValues.asm
; Link:			; gcc -pie -nostartfiles -o numericValues numericValues.o
; Run:			; ./numericValues

section .data
	
	i dq 1
	j dq 123
	k dq 456789
	
	fmtStrI db "i=%ld, converted to hex=%lx", 10, 0
	fmtStrJ db "j=%ld, converted to hex=%lx", 10, 0
	fmtStrK db "k=%ld, converted to hex=%lx", 10, 0

section .text
	extern printf
	global _start

_start:
	
	sub rsp, 16		; "magic" instruction offered without explanation
	
	lea rdi, [rel fmtStrI]	; first argument: format string
	mov rsi, [rel i]	; second argument: data
	mov rdx, [rel i]	; third argument: hex value
	call printf wrt ..plt

	lea rdi, [rel fmtStrJ]	; first argument: format string
	mov rsi, [rel j]	; second argument: data
	mov rdx, [rel j]	; third argument: hex value
	call printf wrt ..plt

	lea rdi, [rel fmtStrK]	; first argument: format string
	mov rsi, [rel k]	; second argument: data
	mov rdx, [rel k]	; third argument: hex value
	call printf wrt ..plt

	add rsp, 16

	mov rax, 60		; syscall number of sys_exit in 64-bit linux
	xor rdi, rdi		; exit code 0
	syscall


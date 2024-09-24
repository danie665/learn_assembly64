; procedure.asm		demonstrate a user-defined procedure
; Assemble:		nasm -f elf64 -o procedure.o procedure.asm
; Link: 		gcc -pie -nostartfiles -o procedure procedure.o
; Run:			./procedure

section	.text
	global _start	; declare the entry point

myProc:
	ret

_start:
	call myProc

	; exit the program properly
	mov rax, 60	; syscall: exit
	xor rdi, rdi	; status: 0
	syscall

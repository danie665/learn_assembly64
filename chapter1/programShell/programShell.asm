; programShell.asm	do nothing
; Assemble:		nasm -f elf64 -o programShell.o programShell.asm
; Link:			gcc -pie -nostartfiles -o programShell programShell.o
; Run:			./programShell

section	.text
	global _start	; Declare the entry point

_start:	

	; Exit system call
	mov rax, 60	; syscall number of sys_exit in 64-bit Linux
	xor rdi, rdi	; exit code 0
	syscall		; make the syscall to exit the program

; programShell.asm	do nothing
; Assemble:		nasm -f elf64 -o programShell.o programShell.asm
; Link:			ld -o programShell programShell.o
; Run:			./programShell

; Comments consist of all text from a semicolon character
; to the end of the line

; The ".text" directive tells NASM that the statements following
; this directive go in the section of memory reserved for machine
; instructions (code).

section	.text
	global _start	; Declare the entry point

_start:	

	; Exit system call
	mov rax, 60	; syscall number of sys_exit in 64-bit Linux
	xor rdi, rdi	; exit code 0
	syscall		; make the syscall to exit the program

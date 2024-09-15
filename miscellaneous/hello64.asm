; hello_64.asm	print a string using printf
; Assemble:	nasm -f elf64 -o hello64.o hello64.asm
; Link:		ld -o hello64 hello64.o
; Run: 		./hello_64

section .data
	hello db 'Hello, world!', 0

section .text
	global _start

_start:
	
	; write (1, hello, 13)
	mov rax, 1		; syscall number of sys_write
	mov rdi, 1		; file descriptor (stdout)
	mov rsi, hello		; message to write
	mov rdx, 13		; message length
	syscall			; invoke syscall

	; exit(0)
	mov rax, 60		; syscall for sys_exit
	xor rdi, rdi		; return 0 status
	syscall			; invoke syscall


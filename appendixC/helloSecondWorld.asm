; helloSecondWorld.asm	pure-assembly hello world
; Assemble:		nasm -f elf64 -o helloSecondWorld.o helloSecondWorld.asm
; Link:			ld -o helloSecondWorld helloSecondWorld.o
; Run:			./helloSecondWorld

section .data
	hwStr db "Hello, world!", 0xA	; our hello world string with a newline
	hwLen equ $-hwStr		; length of the string

section .text
	global _start			; declare the entry point

_start:

	; sys_write (write to stdout)
	mov rax, 1			; syscall number for sys_write (1)
	mov rdi, 1			; file descriptor for stdout (1)
	mov rsi, hwStr			; pointer to the string
	mov rdx, hwLen			; length of the string
	syscall				; invoke the syscall

	; exit system call
	mov rax, 60			; syscall number of sys_exit in 64-bit Linux
	xor rdi, rdi			; exit code 0
	syscall				; make the syscall to exit the program


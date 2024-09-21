; helloWorld.asm	write a hello world program
; Assemble:		nasm -f elf64 -o helloWorld.o helloWorld.asm

section .data
	fmtStr	db 'Hello world!', 10, 0

section .text
	extern printf
	global asmFunc

asmFunc:
	sub 	rsp, 56		; allocate space on the stack
	lea	rcx, [fmtStr]	; load address of fmtStr into rcx
	call	printf		; call printf
	add	rsp, 56		; deallocate stack space
	ret			; return from the function

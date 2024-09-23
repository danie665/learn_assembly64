; helloWorld.asm	write a hello world program
; Assemble:		nasm -f elf64 -o helloWorld.o helloWorld.asm

section .data
	fmtStr	db 'Hello world!', 10, 0

section .text
	extern printf
	global asmFunc

asmFunc:
	sub rsp, 8		; align stack to 16-byte boundary
	lea rdi, [fmtStr]	; load address of fmtStr into rdi
	call printf		; call printf
	add rsp, 8		; deallocate stack space
	ret			; return from the function

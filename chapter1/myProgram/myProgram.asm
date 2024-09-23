; asmProgram.asm	example program to illustrate asm/cpp hybrid
; Assemble:		nasm -f elf64 -o asmProgram.o asmProgram.asm

section .text
	global asmFunc	; Declares the function to be global (visible to the linker)

asmFunc:
	ret		; Return to caller


; asmProgram.asm	example program to illustrate asm/cpp hybrid
; Assemble:		nasm -f elf64 -o asmProgram.o asmProgram.asm
; Link:			ld -o asmProgram asmProgram.o

section .text

	option casemap:none

	public asmFunc
asmFunc PROC

	ret		; Returns to caller

asmFunc ENDP
	END

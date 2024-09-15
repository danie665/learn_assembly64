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

_start:			; Entry point label
	ret		; Returns to caller

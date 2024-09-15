; programShell.asm	do nothing
; Assemble:		nasm -f elf64 -l programShell.lst programShell.asm
; Link:			gcc -m64 -no-pie -o programShell programShell.o
; Run:			./programShell

; Comments consist of all text from a semicolon character
; to the end of the line

; The ".text" directive tells NASM that the statements following
; this directive go in the section of memory reserved for machine
; instructions (code).

	section	.text

; Here is the "main" function. (This example assumes that the
; assembly language program is a stand-alone program with its
; own main function.)

	global main

main:

	ret	; returns to caller

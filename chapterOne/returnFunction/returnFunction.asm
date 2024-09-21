; returnFunction.asm	Return function results from assembly language to C++
; Assemble:		nasm -f elf64 -o returnFunction.o returnFunction.asm

maxLen equ 256		; Maximum string size + 1

section .data
	titleStr db 'Listing 1-8', 0
	prompt db 'Enter a string: ', 0
	fmtStr db "User entered: '%s'", 10, 0

section .bss
	input resb maxLen		; Reserve space for input buffer

section .text
	extern printf
	extern readLine
	global getTitle
	global asmMain
	
getTitle:
	lea rax, [titleStr]		; Return the address of titleStr in RAX
	ret

asmMain:
	
	sub rsp, 8			; Align stack
	
	; Prompt the user to enter a string
	lea rdi, [prompt]
	call printf
	
	; Ensure the input string is zero-terminated
	mov byte [input], 0		; Null-terminate the input string

	; Read a line of text from the user
	lea rdi, [input]
	mov rsi, maxLen			; Pass maxLen as the second arg to readLine
	call readLine

	; Print the string input by the user
	lea rdi, [fmtStr]		; First argument: format string
	lea rsi, [input]		; Second argument: user input string
	call printf

	add rsp, 8			; Restore the stack
	ret

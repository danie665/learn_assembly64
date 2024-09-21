; returnFunction.asm	Return function results from assembly language to C++
; Assemble:		nasm -f elf64 -o returnFunction.o returnFunction.asm

nl = 10			; ASCII code for newline
maxLen = 256		; Maximum string size + 1

section .data
	titleStr db 'Listing 1-8', 0
	prompt db 'Enter a string: ', 0
	fmtStr db "User entered: '%s'", nl, 0
	input db maxLen dup (?)

section .text
	extern printf
	extern readLine
	global getTitle

getTitle:
	lea rax, titleStr
	ret

asmMain:
	
	sub rsp, 8
	
	; Prompt the user to enter a string
	lea rdi, prompt
	call printf
	
	; Ensure the input string is zero-terminated
	mov input, 0

	; Read a line of text from the user
	lea rdi, input
	mov rdx, maxLen
	call readLine

	; Print the string input y the user calling printf()
	lea rdi, fmtStr
	lea rdx, input
	call printf

	add rsp, 8
	ret

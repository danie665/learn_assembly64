; helloWorld.asm	; display a gtk window
; Assemble:		; nasm -f elf64 -o helloWorld.o helloWorld.asm
; Link:			; gcc -no-pie -nostartfiles -o helloWorld helloWorld.o $(pkg-config --cflags --libs gtk+-3.0)
; Run:			; ./helloWorld

section .data
	title db "Hello world", 0

section .bss
	window resq 1

section .text
	global _start
	extern gtk_init
	extern gtk_window_new
	extern gtk_window_set_title
	extern gtk_widget_show
	extern gtk_main

_start:
	
	; initialize gtk
	push 0				; set ARGC
	push 0				; set ARGV
	call gtk_init

	; create a new window
	mov rdi, 0			; GTK_WINDOW_TOPLEVEL
	call gtk_window_new
	mov [window], rax		; store the window pointer

	; set the window title
	mov rdi, [window]		; window
	lea rsi, [title]		; window title
	call gtk_window_set_title

	; show the window
	mov rdi, [window]
	call gtk_widget_show

	call gtk_main

	; exit
	mov rax, 60
	xor rdi, rdi
	syscall
	
	



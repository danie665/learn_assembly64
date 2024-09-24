; dialogBox.asm		; display a dialog box
; Assemble:		; nasm -f elf64 -o dialogBox.o dialogBox.asm
; Link:			; gcc -no-pie -nostartfiles -o dialogBox dialogBox.o $(pkg-config --cflags --libs gtk+-3.0)
; Run:			; ./dialogBox

section .data
	appName db "Hello world", 0
	dialogTitle db "Greeting", 0
	dialogMessage db "Hello, world!", 0

section .bss
	window resq 1			; allocate space for uninitialized variable
	label resq 1

section .text
	extern gtk_init			; import stuff
	extern gtk_window_new
	extern gtk_window_set_title
	extern gtk_label_new
	extern gtk_container_add
	extern gtk_widget_show
	extern gtk_main

	global _start			; export starting point

_start:

	; initialize gtk
	push 0				; NULL for argv
	push 0				; NULL for argc
	call gtk_init			; initialize gtk

	; create the window
	mov rdi, 0			; set gtk window to top level
	call gtk_window_new		; create gtk window
	mov [window], rax		; store the window pointer

	; set the window title
	mov rdi, [window]		; pass the window pointer
	lea rsi, [dialogTitle]		; pass the window title
	call gtk_window_set_title	; set the window title

	; create a label
	lea rdi, [dialogMessage]	; pass the message
	call gtk_label_new		; create the label
	mov [label], rax		; store the label pointer

	; add label to window
	mov rdi, [window]		; pass the window
	mov rsi, [label]		; pass the label
	call gtk_container_add		; add the label to the window

	; show the label and window
	mov rdi, [label]		; pass the label
	call gtk_widget_show		; show the label
	mov rdi, [window]		; pass the winow
	call gtk_widget_show		; show the window

	; run gtk main loop
	call gtk_main			; run gtk

	; exit
	mov rax, 60			; syscall: exit
	xor rdi, rdi			; exit code 0
	syscall

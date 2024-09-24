; helloWorld2.asm	; display a gtk window with more safety built-in
; Assemble		; nasm -f elf64 -o helloWorld2.o helloWorld2.asm
; Link			; gcc -no-pie -nostartfiles -o helloWorld2 helloWorld2.o $(pkg-config --cflags --libs gtk+-3.0)
; Run			; ./helloWorld2

section .data
	title_text db "Hello world!", 0
	label_text db "Hello world", 0

section .bss
	window resq 1
	label resq 1

section .text
	global _start
	extern gtk_init
	extern gtk_window_new
	extern gtk_window_set_title
	extern gtk_container_set_border_width
	extern gtk_widget_set_size_request
	extern gtk_label_new
	extern gtk_label_set_selectable
	extern gtk_container_add
	extern gtk_widget_show_all
	extern gtk_main
	
destroy:

_start:

	; initialize gtk
	xor rdi, rdi
	xor rsi, rsi
	call gtk_init

	; create a new window
	mov rdi, 0
	call gtk_window_new
	mov [window], rax

	; set the window title
	mov rdi, [window]
	lea rsi, [title_text]
	call gtk_window_set_title

	; set window border width
	mov rdi, [window]
	mov rsi, 10
	call gtk_container_set_border_width

	; set widget size
	mov rdi, [window]
	mov rsi, 200
	mov rdx, 100
	call gtk_widget_set_size_request

	; create new label
	lea rdi, [label_text]
	call gtk_label_new
	mov [label], rax
	
	; make label selectable
	mov rdi, [label]
	mov rsi, 1
	call gtk_label_set_selectable

	; add the label to the window
	mov rdi, [window]
	mov rsi, [label]
	call gtk_container_add

	; set window to show
	mov rdi, [window]
	call gtk_widget_show_all

	; run gtk main loop
	call gtk_main

	; exit
	mov rax, 60
	xor rdi, rdi
	syscall
	

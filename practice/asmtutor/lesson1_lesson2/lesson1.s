%define		MACH_SYSCALL(nb)		0x2000000 | nb
%define		STDOUT					1
%define		WRITE					4
%define		EXIT					1


section		.data
	msg db		`hello world!\n`

section		.text
global		start

; write systemcall takes 3 arguments
start:
	mov		rdi, STDOUT		; destination index 1 paremeter
	mov		rsi, msg		; source index 2 parameter
	mov		rdx, 13			; data register 3 parameter
	mov		rax, MACH_SYSCALL(WRITE)	; calling write syscall
	syscall
	mov		rdi, 0						; loading first argument with 0 - 0 errors
	mov		rax, MACH_SYSCALL(EXIT)		; loading rax with syscal 1 - exit
	syscall

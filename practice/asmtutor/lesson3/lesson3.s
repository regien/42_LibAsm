%define		MACHO_SYSCALL(nb)		0x2000000 | nb
%define		WRITE					4
%define		EXIT					1
%define		STDOUT					1

section		.data
	msg		db		`Hello, brave new world!\n`

section		.text
global		start

start:
	mov		rdi, msg		; moving the addres of the message to rdi
	mov		rax, rdi		; acumulator register and destination index have the same address

nextchar:
	cmp		byte [rax], 0	; compare if is end of the string -> \0
	jz		finished		; if is end of line then exit the program
	inc		rax
	jmp		nextchar

finished:
	sub		rax, rdi		; oh simple math, because the address is aligned if you susbtract
							; initial address rdi, with the modified one in rax then the
							; substract should have the len of the string

	mov		rdx, rax
	mov		rsi, msg
	mov		rdi, STDOUT
	mov		rax, MACHO_SYSCALL(WRITE)
	syscall

	mov		rax, MACHO_SYSCALL(EXIT)
	syscall

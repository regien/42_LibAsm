%define		MACHO_SYSCALL(nb)		0x2000000 | nb
%define		WRITE					4
%define		EXIT					1
%define		STDOUT					1
%include	'functions.s'

section		.data
	msg1	db		`Hello, brave new world!Changing this message of just testing\0`
	msg2	db		`This is how we recycle in NASM\0`

section		.text
global		start

start:
	mov		rax, msg1
	call	_ft_putendl

	mov		rax, msg2
	call	_ft_putendl
	
	call	_ft_exit

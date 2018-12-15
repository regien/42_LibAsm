;%define		MACHO_SYSCALL(nb)		0x2000000 | nb
;%define		WRITE					4
;%define		EXIT					1
;%define		STDOUT					1
%include	'functions.s'

;section		.data
;	msg1	db		`Hello, brave new world!Changing this message of just testing\0`
;	msg2	db		`This is how we recycle in NASM\0`

section		.text
global		start

start:
	pop		rcx

next_arg:
	cmp		rcx, 0				; if argc it's 0 then
	jz		no_more_args		; finish the project
	pop		rax,
	mov		rbp, rsp				; PENDEJADA - FIX THIS
	and		rsp, 0xffffff0
	sub		rsp, 16
	call	_ft_putendl
	dec		rcx
	jmp		next_arg

no_more_args:
	call	_ft_exit

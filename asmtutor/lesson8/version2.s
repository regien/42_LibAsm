%include 'functions.s'

section		.text
global	start

start:
	pop		rcx

next_arg:
	cmp		rcx, 0
	jz		no_more_args
	pop		rax
	call	_ft_putstr
	dec		rcx
	jmp		next_arg

no_more_args:
	call _ft_exit

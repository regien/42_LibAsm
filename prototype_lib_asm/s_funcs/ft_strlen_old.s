;------------------------------------------------------------------
;	prototype of the function:
;			size_t		_ft_strlen(const char *str)
;------------------------------------------------------------------
			default		rel
			global		_ft_strlen

			section		.text
_ft_strlen:
	push	rbp
	mov		rbp, rdi ; initializing value of rax to 0 (to use it as a counter)

next_char:
	cmp		byte [rdi], 0
	jz		finished
	inc		rdi
	jmp		next_char

finished:
	sub		rdi, rbp
	mov		rax, rdi
	pop		rbp
	ret

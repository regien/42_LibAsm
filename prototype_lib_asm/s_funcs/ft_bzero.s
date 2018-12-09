;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_bzero(void *s, size_t n)
;------------------------------------------------------------------

			default		rel
			global		_ft_bzero

			section		.text
_ft_bzero:
			cld								; because of the rep instrc
			cmp			rdi, 0
			jz			finished			; checking for NULL
			mov			rcx, rsi			; 2arg -> counter
			xor			rax, rax
			rep			stosb				; store AL in EDI until RCX is 0

finished:
			ret

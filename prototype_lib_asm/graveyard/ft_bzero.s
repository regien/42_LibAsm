;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_bzero(void *s, size_t n)
;------------------------------------------------------------------

			default		rel
			global		_ft_bzero

_ft_bzero:
			cmp			rdi, 0						; checkhing for null
			jz			finished					; not sure if bzero
			cmp			rsi, 0						; doest this
			jle			finished					; error checking

loop:
			mov			byte [rdi], 0		; setting to 0
			dec			rsi
			add			rdi, 1
			jnz			loop

finished:
			ret

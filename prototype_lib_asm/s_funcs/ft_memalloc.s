;------------------------------------------------------------------
;	prototype of the function:
;			void		*_ft_memalloc(size_t size)
;------------------------------------------------------------------
; given a size allocate memory and then initialize to 0

			default		rel
			global		_ft_memalloc
			extern		_malloc
			section		.text

_ft_memalloc:
			push		rdi
			call		_malloc
			pop			rcx
			cmp			rax, 0			; Check NULL
			jz			finish
			mov			rdi, rax
			push		rax
			xor			rax, rax
			rep			stosb			; store AL in EDI until RCX is 0
			pop			rax

finish:
			ret

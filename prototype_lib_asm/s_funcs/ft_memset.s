;------------------------------------------------------------------
;	prototype of the function:
;	void*		ft_memset(void *b, int c, size_t len)
;------------------------------------------------------------------

			default			rel
			global			_ft_memset

_ft_memset:
			cld
			mov				rax, rdi
			push			rax
			xor				rax, rax
			mov				rcx, rdx
			or				al, sil
			rep				stosb			; store AL at (E)DI until rcx is 0
			pop				rax
			ret 


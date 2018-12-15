;------------------------------------------------------------------
;	prototype of the function:
;			int			isprint(int c)
;------------------------------------------------------------------

				default			rel
				global			_ft_isprint

				section			.text
_ft_isprint:
			xor			eax, eax
			xor			ecx, ecx
			push		rdi					; preserve edi
			sub			edi, 32				; begining of range 0 to 32
			cmp			edi, 32
			setbe		al
			pop			rdi
			sub			edi, 64				; 0 to 62 in second range
			cmp			edi, 62
			setbe		cl
			or			al, cl
			ret

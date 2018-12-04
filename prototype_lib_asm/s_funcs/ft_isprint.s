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
			sub			edi, 32				; begining of range
			cmp			edi, 126
			setbe		al					; if carry is 1 or zero
			ret

;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_tolower(int c)
;------------------------------------------------------------------
;	conditional movements only works for 32 bits values
				default			rel
				global			_ft_tolower

				section			.text
_ft_tolower:
				mov				eax, edi
				or				edi, 32
				sub				edi, 97
				cmp				edi, 25		; range of alphabet
;				add				edi, 97		; restoring edi
				cmovbe			eax, edi	; only work with 32 bits reg
				ret

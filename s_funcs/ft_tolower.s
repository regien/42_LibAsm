;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_tolower(int c)
;------------------------------------------------------------------
;	conditional movements only works for 32 bits values
;	this is basicaly a ternary operator

				default			rel
				global			_ft_tolower
				section			.text
_ft_tolower:
				mov				eax, edi		; saving regular answer
				mov				edx, edi
				or				edx, 32			; right answer if below
				sub				edi, 65			; x = x - 'A'
				cmp				edi, 25			; range of alphabet
				cmovbe			eax, edx
				ret

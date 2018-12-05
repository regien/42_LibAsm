;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_toupper(int c)
;------------------------------------------------------------------
; Lower case to uppercase
				default			rel
				global			_ft_toupper

				section			.text
; possibly nulify this one
_ft_toupper:
				xor				eax, eax
				or				edi, 32
				sub				edi, 97
				cmp				edi,

_ft_toupper:
				mov				eax, edi
				sub				edi, 

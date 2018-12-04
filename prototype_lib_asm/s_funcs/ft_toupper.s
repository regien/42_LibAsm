;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_toupper(int c)
;------------------------------------------------------------------
				default			rel
				global			_ft_toupper

				section			.text
_ft_toupper:
				xor				eax, eax
				or				edi, 32
				sub				edi, 97
				cmp				edi, 

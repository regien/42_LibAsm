;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_toupper(int c)
;------------------------------------------------------------------
; Lower case to uppercase
				default			rel
				global			_ft_toupper

; incomplete
				section			.text
_ft_toupper:
				mov				eax, edi
				and				edi, 32
				sub				edi, 65
				cmp				edi, 25
				add				edi, 65
				cmovbe			eax, edi
				ret

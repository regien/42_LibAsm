;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_toupper(int c)
;------------------------------------------------------------------
; Lower case to uppercase
; this is basically a ternary operator
			default			rel
			global			_ft_toupper

_ft_toupper:
			mov				eax, edi		; saving default answer
			mov				edx, edi		; possibly answer
			and				edx, 0xFFFFFFDF	; convert to capital
			sub				edi, 97			; x = x - 'a'
			cmp				edi, 25			; alphabet range
			cmovbe			eax, edx
			ret

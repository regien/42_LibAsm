;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_isalnum(int c)
;------------------------------------------------------------------

				default		rel
				global		_ft_isalnum

				section		.text

; you store this part in rax - al <- first 8 bits
_ft_isalnum:								; ft_isdigit part
			xor				eax, eax
			sub				edi, 48			; x = x - '0' 
			cmp				edi, 9
			setbe			al
			add				edi, 48			; x = x + '0'

; You store this part in rcx - cl <- first 8 bits
; then you do -> or al, cl
_ft_is_alpha:								; ft_isalpha part
			xor				ecx, ecx
			or				edi, 32
			sub				edi, 97
			cmp				edi, 25
			setbe			cl
			or				al, cl			; if one of them is true
			ret

;------------------------------------------------------------------
;	prototype of the function:
;			int		_ft_isalpha(int c)
; return value:
; 0 if false 1 (or x != 0) if true - (valid A-Z ~ a-z)
;------------------------------------------------------------------

; do an or so you always give +32 to whatever number they pass you in
; so you only check for minus characters

			default			rel
			global			_ft_isalpha

			section			.text

_ft_isalpha:
			xor				eax, eax
			or				edi, 32		; just to turn on the 32 flag
			sub				edi, 97		; value of a (97)
			cmp				edi, 25		; 26 (0 included)
			setbe			al			; to treat like an unsigned
			ret							; suppose to return something
										; else than 0 if correct

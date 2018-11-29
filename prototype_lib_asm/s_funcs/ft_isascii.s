;------------------------------------------------------------------
;	prototype of the function:
;			int			isascii(int c)
;------------------------------------------------------------------

; Using range trick - changing and modiying the result of the rax value
; whitouth any kind of problem
; DOUBLE CHECK

				default		rel
				global		_ft_isascii

				section		.text

_ft_isascii:
				xor			eax, eax	; returning an int value size
				sub			edi, 127	; total number of ascii values
				cmp			edi, 0
				setbe		al			; using al instead of ah
				ret

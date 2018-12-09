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
				cmp			edi, 127	; dont need to subtract because this
										; range start at 0
				setbe		al			; using al instead of ah
				ret

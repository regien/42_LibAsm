;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_strcat(char *str1, const char *str2)
;------------------------------------------------------------------

			default			rel
			global			_ft_strcat


; Simplier version, just go around the string and reuse the loop
; Second time

; use two varaibles 
			section			.text

_ft_strcat:
			mov				rax, rdi			; you are gonna ret that pointer

loop:											; not implementing NULL protection
			cmp				byte [rdi], 0		; can change for the rep version
			jz				continue_merg
			inc				rdi
			jmp				loop

continue_merg:
			cmp				byte [rsi], 0
			xor				rdx, rdx
			or				rdx, [byte rsi]		; not sure if this gonna work
			mov				[byte rdi], rdx
			jz				finished
			inc				rdi
			inc				rsi
			jmp				continue_merg

finished:
			ret

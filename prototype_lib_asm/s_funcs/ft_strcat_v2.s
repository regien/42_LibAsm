
;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_strcat(char *str1, const char *str2)
;------------------------------------------------------------------

;			%include		'ft_strlen.s'
			default			rel
			global			_ft_strcat


; Simplier version, just go around the string and reuse the loop
; Second time

; use two varaibles 
			section			.text

_ft_strcat:
			mov				rax, rdi			; you are gonna ret that pointer

loop:											; not implementing NULL protection
			cmp				byte [rdi], 0
			jz				continue_merg
			add				rdi
			jmp				loop

continue_merg:
			cmp				byte [rsi], 0
			mov				byte [rdi], byte [rsi]
			jz				finished
			add				rdi
			add				rsi


finished:
			ret

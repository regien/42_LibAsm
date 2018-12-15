;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_strcat(char *str1, const char *str2)
;------------------------------------------------------------------

			%include		'ft_strlen.s'
			default			rel
			global			_ft_strcat


; Simplier version, just go around the string and reuse the loop
; Second time

; use two varaibles 
			section			.text
_ft_strcat:
			cmp				rdi, 0
			jz				finished
			cmp				rsi, 0
			jz				finished
			xor				r9, r9						; Num from first '\0'

			call			_ft_strlen
			mov				rcx, rdi					; pointer to mod
			push			rdi							; to save the beginning of the pointer s1
			add				rcx, rax					; position '\0'
			
loop:
			cmp				byte [rsi], 0				; detec if zero, put null on string
			mov				byte [rdi], byte [rsi]		
			jz				finished					; then die
			add				rdi
			add				rsi
			jne				loop

; intento de loop para llegar al '\0' de S2

; RDX RCX

finished:
; MAYBE YOU HAVE TO DO A POP HERE
			pop				rax
			ret

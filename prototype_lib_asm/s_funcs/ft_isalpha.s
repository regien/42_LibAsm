;------------------------------------------------------------------
;	prototype of the function:
;			int		_ft_islalpha(int c)
; return value:
; 0 if false 1 (or x != 0) if true - (valid A-Z ~ a-z)
;------------------------------------------------------------------

			default			rel
			global			_ft_isalpha

			section			.text

; two comparision and then the end
; save 0 to rax at the beginning then save 1 for succes if things
; happens

_ft_isalpha:
			xor				rax, rax			; default answer
			xor				rdx, rdx
			or				rdx, 32
			and				rdx, rdi			; if zero the minus
			mov				rdx, rdi
			jz				mayus
			jnz				minus

mayus:
			cmp				rdx, 65
			cmovge			rsi, 1	
			cmp				rdx, 90
			cmovle			rcx, 1
			cmp				rsi, rcx
			cmove			rax, 1
			jmp				finished

minus:
			cmp				rdx, 97
			cmovge			rsi, 1	
			cmp				rdx, 122
			cmovle			rcx, 1
			cmp				rsi, rcx
			cmove			rax, 1
			

finished:
			ret

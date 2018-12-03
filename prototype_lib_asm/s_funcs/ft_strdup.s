;------------------------------------------------------------------
;	prototype of the function:
;			char		*_ft_strdup(const char *str)
;------------------------------------------------------------------
; 1 PUSH at the beginning then when you call MALLOC
; the RSP -8
; and now you are making another pop to align the stack

			default		rel
			global		_ft_strdup
			extern		_malloc

			section		.text
_ft_strdup:
			xor			rax, rax		; DOESNT MATTER
			cmp			rdi, 0			; checking for NULL
			jz			finished
			cmp			byte [rdi], 0	; checking for '\0'
			jz			finished

_ft_str_len:
			mov			rcx, rdi
			push		rdi				; SAVE ADDRESS
			xor			rdi, rdi

next_char:
			cmp			byte [rcx], 0	; checking for '\0'
			jz			create_str
			inc			rcx
			inc			rdi
			jmp			next_char

create_str:								; check rsp in case is not aligned
			inc			rdi				; + 1 for the '\0' char
			call		_malloc
			cmp			rax, 0			; checking for NULL
			mov			rcx, rax		; adrs RCX and RAX

dup_str:
			pop			rdi
			cmp			byte [rdi], 0	; checking '\0'
			xor			rsi, rsi
			or			rsi, [byte rdi]
			mov			[byte rcx], rsi
			jz			finished
			jmp			dup_str

finished:
			ret

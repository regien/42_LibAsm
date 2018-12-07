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
			cld								; clearing Direct flag
;			mov			rdx, rdi			; saving addres of 1arg
			push		rdi					; saving addres of 1arg
			xor			rax, rax
			xor			rcx, rcx
			not			rcx
			repnz		scasb				; compare edi to al
			mov			rdi, rcx
			not			rdi
			push		rdi
			sub			rsp, 8				; align stack
			
; CREATING STR
			call		_malloc
			add			rsp, 8
			pop			rcx
			pop			rsi
			cmp			rax, 0
			jz			finished
;			mov			rcx, rdi
			mov			rdi, rax			; TESTING
			rep			movsb

finished:
			ret

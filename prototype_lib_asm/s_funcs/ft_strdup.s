;------------------------------------------------------------------
;	prototype of the function:
;			char		*_ft_strdup(const char *str)
;------------------------------------------------------------------
; While doing a push you preserve the value of the register
; In the stack and in the register
			default		rel
			global		_ft_strdup
			extern		_malloc

			section		.text
_ft_strdup:
			cld								; clearing Direct flag
			push		rdi					; saving addres of 1arg
			xor			rax, rax
			xor			rcx, rcx
			not			rcx
			repnz		scasb				; Compare edi to al
			mov			rdi, rcx
			not			rdi
			push		rdi
			sub			rsp, 8				; Align stack
			call		_malloc				; Allocating string
			add			rsp, 8
			pop			rcx					; restoring counter
			pop			rsi					; restoring 1arg
			cmp			rax, 0
			jz			finished
			mov			rdi, rax
			rep			movsb

finished:
			ret

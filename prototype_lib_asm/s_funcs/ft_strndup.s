;------------------------------------------------------------------
;	prototype of the function:
;			char		*_ft_strdup(const char *str, size_t size)
;------------------------------------------------------------------
; While doing a push you preserve the value of the register
; In the stack and in the register

			default		rel
			global		_ft_strndup
			extern		_malloc
			section		.text

; Im supposing that this doesn't check for maximum leng of the string
; if just gonna try to copy until rcx (rsi) reach 0, no matter the
; errors
; adding more checking for the program like checking the len in case
; rsi is not the right one or for the good len you want to use it for

_ft_strndup:
			cld
			xor			rax, rax
			cmp			rsi, 0
			jb			finished
			push		rdi					; preserving the first argument
;			inc			rsi					; len + 1 for '\0'
			mov			rdi, rsi			; len of the string to call malloc
			push		rsi
			sub			rsp, 8
			call		_malloc
			add			rsp, 8
			pop			rsi
			mov			rcx, rsi			; saving len in rcx for rep instr
			pop			rsi					; aligning and filling second str
			cmp			rax, 0				; checking for NULL
			jz			finished
			mov			rdi, rax
			rep			movsb
			xor			rdi, rdi
			
finished:
			ret

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
			cld								; clear DF just in case
			mov			rdx, rdi
			xor			rax, rax
			xor			rcx, rcx
			not			rcx
			repnz		scasb
			mov			rdi, rcx			; move the counter to rdi
;			inc			rdi					; you can - lea rdi, [- 1 - rcx]
; you don't have to -1 this is not strlen, is strlen + 1 for null char
			not			rdi
; Creating str after this point
;			push		rax					; align and save address of rdi
			call		_malloc				; allocating memory no matter is 0
			pop			rsi
			ret ; TESTING
			cmp			rax, 0				; checking for NULL
			jz			finished
			mov			rcx,rdi				; len in Counter reg
			mov			rdi, rax
			repnz		movsb				; copying byte by byte

finished:
			ret


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
			
; CREATING STR
			call		_malloc
			pop			rsi
			

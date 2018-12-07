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
;			xor			rax, rax		; DOESNT MATTER <- commenting
			cmp			rdi, 0			; checking for NULL
			jz			finished
			cmp			byte [rdi], 0	; checking for '\0'
			jz			create_str		; have to go to create str instead of finished
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
;			sub			rsp, 8			; <- trying to align stack
			call		_malloc
;			add			rsp, 8
			cmp			rax, 0			; checking for NULL
			jz			finished
			mov			rsi, rax		; adrs RCX and RAX
;			ret			; <---------- CUTTING THE SHIT


dupping:
			pop			rdi
;			repnz		movs byte [rsi], byte[rdi]   ; <-- comenting this
			

;dup_str:
;			pop			rdi
;			cmp			byte [rdi], 0	; checking '\0'
;			xor			rsi, rsi
;			or			rsi, [byte rdi]
;			lea			[byte rsi], rsi
;			jz			finished
;			jmp			dup_str

finished:
			ret


;; HOLDER > |

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

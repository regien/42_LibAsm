			global		_main
			extern		_printf

			section		.text
_main:
			push		rbx					; saving the value of RBX (IT'S A PRESERVED REGISTER)

			mov			ecx, 90				; the counter will countdown to 0
;			mov			r9, 90
			xor			rax, rax			; will hold current number
			xor			rbx, rbx			; will hold the next number
			inc			rbx					; is originally 1

print:
	; We need to call printf, but we are using rax, rbx and rcx. printf
	; may destroy rax and rcx so we will save thse before the call and
	; restore them afterwards

			push		rax					; caller-save register
			push		rcx					; caller-save register
			
			mov			rdi, [rel format]	; set 1 parameter
			mov			rsi, rax			; set second parameter
			xor			rax, rax			; because printf is varargs
;			sub			rsp, 16

	; stack is already aligned bcause we pushed three 8 byte registers
			call		_printf				; printf(format, current_number)

;			add			rsp, 16
			pop			rcx					; restore caller-save register
			pop			rax					; restore caller-save register

			mov			rdx, rax			; save the current number
			mov			rax, rbx			; next number is now current
			add			rbx, rdx			; get the new next number
			dec			ecx					; count down
;			dec			r9
			jnz			print

			pop			rbx					; restore rbx before returing
			ret

			section		.data
format:		db			"%20ld", 10, 0		; new line and null terminated

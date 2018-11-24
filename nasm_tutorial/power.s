;---------------------------------------------------------
; a 64 bits program to compute  x^y
;
; syntax: power x y
; x and y are (32-bits) integers
;---------------------------------------------------------

			global		_main
			extern		_printf
			extern		_puts
			extern		_atoi

_main:
			push		r12				; save callee-save register
			push		r13
			push		r14
			; Stack is aligned because of these 3 pushes
			
			cmp			rdi, 3

			// INCOMPLETE

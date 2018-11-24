;---------------------------------------------------------
; prototype for the function in c
; int64_t maxofthree(int64_t x, int64_t y, int64_t z)
;---------------------------------------------------------

		global		_maxofthree
		section		.text
_maxofthree:
		mov			rax, rdi				; result (rax) initially hold x
		cmp			rax, rsi				; compare first with second argument
		cmovl		rax, rsi				; conditional movement if less by the cmp
		cmp			rax, rdx				; new comparation
		cmovl		rax, rdx				; if less then rdx is the greater
		ret

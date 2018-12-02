;------------------------------------------------------------------
;	prototype of the function:
;	void*		ft_memset(void *b, int c, size_t len)
;------------------------------------------------------------------

			default			rel
			global			ft_memset
_ft_memset:
			inc				rdx				; incrementing len for loop
			mov				rax, rdi		; saving the addr in rax

loop:
;			cmp				rdi, 0			; checking if zero
; you don't have to compare to zero you dont know what is that memory
			dec				rdx
			jz				finish
			mov				[byte rdi], rsi	; loading value of 2arg to adr
			jmp				loop

finish:
			ret								; so you can return the adr

;------------------------------------------------------------------
;	prototype of the function:
;	void*		ft_memcpy(void *dst, void *src, size_t len)
;------------------------------------------------------------------

			default			rel
			global			ft_memcpy

ft_memcpy:
			mov				rax, rdi

loop:											; copying the value of what
			cmp				rdx, 0				; inside the address into
			jz				finish				; the *dst
			dec				rdx
			xor				rcx, rcx
			or				rcx, [byte rsi]
			mov				[byte rdi], rcx
			jmp				loop

finish:
			ret

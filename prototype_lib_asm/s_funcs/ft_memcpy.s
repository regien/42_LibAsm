;------------------------------------------------------------------
;	prototype of the function:
;	void*		ft_memcpy(void *dst, void *src, size_t len)
;------------------------------------------------------------------

			default			rel
			global			ft_memcpy

; NOT FULLY DONE

ft_memcpy:
			mov				rax, rdi

loop:
			cmp				rdx, 0
			jz				finish
			dec				rdx
			mov				[byte rdi], [byte rsi]
			jmp				loop

finish:
			ret

;------------------------------------------------------------------
;	prototype of the function:
;	void*		ft_memcpy(void *dst, void *src, size_t len)
;------------------------------------------------------------------
; the purpose of cleaning the direction flag is to avoid a very
; unlikely problem (some function or subrotine could change it) and
; then we call the repetation is gonna start going backwards instead
; of the usual forward.

			default			rel
			global			_ft_memcpy

_ft_memcpy:
			cld
			mov				rax, rdi			; saving the return ptr
			cmp				rdx, 0
			jb				finished
			mov				rcx, rdx			; initializing counter with len
			rep				movsb

finished:
			ret

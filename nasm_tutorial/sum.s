; --------------------------------------------------------------------
; example of how to use floating-point argments in the xmm registers
; return the sum of the elements in floating-point array. The function
; Has prototype:
;
; double sum(double[] array, uint64_t length)
; --------------------------------------------------------------------

			global		_sum
			section		.text

_sum:
			xorpd		xmm0, xmm0			; special xor for double point precision
			cmp			rsi, 0				; special case for length 0
			je			done

next:
			addsd		xmm0, [rdi]			; add the current element in the array
			add			rdi, 8				; move to the next array element
			dec			rsi					; count down
			jnz			next				; if not done counting, continue

done:
			ret

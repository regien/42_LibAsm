; Simple test to use C functions so of course you are link this with
; gcc

		global		_main
		extern		_puts

		section		.text
_main:
		push		rbx						; Call stack must be aligned
		lea			rdi, [rel msg]			; First argument is address of message
;					^ because the addres is a named variable you need to use rel
		call		_puts					; puts(message)
		pop			rbx						; Fix up stack before returning
		ret

		section		.data
msg:	db			"Simple text message", 0	; Null terminated string, it's C function

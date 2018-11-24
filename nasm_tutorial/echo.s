	global		_main
	extern		_puts
	section		.text
_main:
	push	rdi				; saves register that puts use
	push	rsi
	sub		rsp, 8			; must align stack before call

	mov		rdi, [rsi]		; the argument string to display
	call	_puts			; puts call

	add		rsp, 8			; restore the stack pointer to pre aligned value
	pop		rsi				; restore registers puts used
	pop		rdi

	add		rsi, 8			; point to next argument
	dec		rdi				; count down if this is 0 then the Z flag is on
	jnz		_main			; if not done counting keep going
	
	ret

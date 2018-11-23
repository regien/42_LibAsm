	global		_main
	extern		_puts
	section		.text
_main:
	push	rdi
	push	rsi
	sub		rsp, 8

	mov		rdi, [rsi]
	call	_puts

	add		rsp, 8
	pop		rsi
	pop		rdi

	add		rsi, 8
	dec		rdi
	jnz		_main
	
	ret

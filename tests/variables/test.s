			global		_main
			extern		_printf
			section		.data
vaina		dq			14					; initialized to 0
msg			db			"%d", 10, 0		; new line and null terminated

			section		.text
_main:
	lea		rdi,		[rel msg]
;	xor		rsi, rsi
;	add		qword [vaina], 16
	add		qword [rel vaina], 16
	mov		rsi,		[rel vaina]
	add		rsp,		8
	call	_printf
	sub		rsp,		8
	mov		rax,		0x2000001
	syscall

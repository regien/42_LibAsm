;----------------------------------------------------------------------
; takes an n number of arguments, treats them like integers and then
; gives you the average
;----------------------------------------------------------------------

			global		_main
			extern		_atoi
			extern		_printf
			default		rel

			section		.data
count		dq			0						; a dq quadword is 64 bytes
sum			dq			0						; but a dw is 32
format		db			"%g", 10, 0				; as usual new line and null char
error		db			"There are no command line arguments to average", 10, 0

			section		.text
_main:
			dec			rdi						; argc - 1 - name of program dont count
			jz			nothing_to_average
			mov			[count], rdi			; save number of real arguments

accumulate:
			push		rdi
			push		rsi
			mov			rdi, [rsi+rdi*8]		; argv[rdi]
			call		_atoi					; rax has the value of arg
			pop			rsi
			pop			rdi
			add			[sum], rax				; accumulate the sum as you go
			dec			rdi
			jnz			accumulate				; more arguments?

average:
			cvtsi2sd	xmm0, [sum]
			cvtsi2sd	xmm1, [count]
			divsd		xmm0, xmm1				; xmm0 is sum/count
			lea			rdi, [rel format]		; 1st ag to printf
			mov			rax, 1					; printf is varargs, there is 1 non-int argument

			sub			rsp, 8					; aligning stack pointer
			call		_printf					; printf(format, sum/count)
			add			rsp, 8					; restore stack pointer

			ret


nothing_to_average:
			lea			rdi,  [rel error]
			xor			rax, rax
			add			rsp, 8
			call		_printf
			sub			rsp, 8
			mov			rax, 0x2000001
			syscall								; exiting program here
			ret


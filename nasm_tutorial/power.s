;---------------------------------------------------------
; a 64 bits program to compute  x^y
;
; syntax: power x y
; x and y are (32-bits) integers
;---------------------------------------------------------

			global		_main
			extern		_printf
			extern		_puts
			extern		_atoi

			section		.data
messages:
	.answer	db			"%d", 10, 0
	.badarg	db			"Requires exactly two arguments", 10, 0
	.negexp	db			"The exponent may not be negative", 10, 0

			section		.text
_main:
			push		r12				; save callee-save register
			push		r13
			push		r14
			; Stack is aligned because of these 3 pushes
			
			cmp			rdi, 3			; exactly two arguments
			jne			error1

			mov			r12, rsi		; argv <- saving it (THIS MIGHT CAUSE AN ERROR)

; We will use rcx (the counter register) to count down the exponent to zero
; rsi to hold the value of the base, and rax to hold the running product

			mov			rdi, [r12 + 16]	; argv[2] equivalent
			call		_atoi			; y in rax
			cmp			rax, 0			; disallow negative exponents
			jl			error2			; if less than 0 then jump
			mov			r13d, rax		; y in r13d (short) two bytes

			mov			rdi, [r12 + 8]	; argv
			call		_atoi			; x in rax
			mov			r14d, rax		; x in r14d

			mov			rax, 1			; start with answer = 1

check:
			test		r13d, r13d		; we are counting y downto 0
			jz			gotit
			imul		rax, r14d		; multiply in another x (1st * 2nd)
			dec			r13d
			jmp			check

gotit:									; print report on succes
;			mov			rdi, answer
			lea			rdi, messages.answer
			movsxd		rsi, rax		; move with all and the sign
;			movsx		rsi, rax
			xor			rax, rax		; setting to 0
			call		_printf
			jmp			done

error1:
;			mov			rdi, messages.badarg
			lea			rdi, messages.badarg
			call		_puts
			jmp			done

error2:
;			mov			rdi, messages.negexp
			lea			rdi, messages.negexp
			call		_puts

done:
			pop			r14
			pop			r13
			pop			r12
			ret

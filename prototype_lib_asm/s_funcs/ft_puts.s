;------------------------------------------------------------------
;	prototype of the function:
;			int		_ft_puts(const char *str)
;------------------------------------------------------------------

%define		MACHO_SYSCALL(nb)	0x2000000 | nb
%define		WRITE				4
%define		STDIN				1
%define		LEN_NU				7

			default			rel
			global			_ft_puts

			section			.data
no_str		db				`(null)\n`
nl			db				`\n`

			section			.text
_ft_puts:
			cmp				rdi, 0				; checking for NULL
			jz				print_null
			push			rdi
			xor				rax, rax
			xor				rcx, rcx
			not				rcx
			repnz			scasb
			mov				rax, rcx			; moving counter
			inc				rax
			not				rax
			mov				rdx, rax			; size of str
			mov				rdi, STDIN			; target fd
			pop				rsi					; popping str addr
			mov				rax, MACHO_SYSCALL(WRITE)
			sub				rsp, 8
			syscall								; write syscall
			lea				rsi, [rel nl]
			mov				rdi, STDIN
			mov				rdx, 1				; len of newline
			mov				rax, MACHO_SYSCALL(WRITE)
			syscall
			add				rsp, 8
			ret

print_null:
			mov				rax, MACHO_SYSCALL(WRITE)
			mov				rdi, STDIN
			lea				rsi, [rel no_str]
			mov				rdx, LEN_NU
			sub				rsp, 8
			syscall
			add				rsp, 8
			ret

;------------------------------------------------------------------
;	prototype of the function:
;			int		_ft_puts(const char *str)
;------------------------------------------------------------------

%define		MACHO_SYSCALL(nb)	0x2000000 | nb
%define		STDIN				1
%define		LEN_NU				7

			default			rel
			global			_ft_puts

			section			.data
no_str		db				`(null)\n`

			section			.text
_ft_puts:
			cmp				rdi, 0			; checking for null
			jz				print_null
			push			rdi
			xor				rax, rax		; getting the len
			xor				rcx, rcx
			not				rcx
			repnz			scasb
			mov				rax, rcx
			inc				rax
			not				rax
			mov				rdx, rax
			mov				rdi, STDIN
			pop				rsi

;;; FORGOT TO CALL SYSCALL HERE

print_null:
			mov				rdi, STDIN
			lea				rsi, [rel no_str]
			mov				rdx, LEN_NU
			sub				rsp, 8
			syscall
			add				rsp, 8
			ret

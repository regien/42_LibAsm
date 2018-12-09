;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_cat(int fd)
;------------------------------------------------------------------
; The received file descriptor should be open
; buffer is 4kb basically can open most files

%define		MACHO_SYSCALL(nb)	0x2000000 | nb
%define		WRITE				4
%define		CLOSE				6
%define		READ				3
%define		STDIN				1
%define		SIZE_BUF			4096

			default			rel
			global			_ft_cat

			section			.data					; creating a buffer
buffer:		times			SIZE_BUF db 0

			section			.text
_ft_cat:
			lea				rsi, [rel buffer]
	
reading:
			mov				rdx, SIZE_BUF
			mov				rax, MACHO_SYSCALL(READ)
			syscall
			jc				finished				; negative numbers
			cmp				rax, 0
			jz				finished				; read EOF when rax = 0

writing:
			push			rdi
			mov				rdi, STDIN
			mov				rdx, rax				; number of bytes readed
			mov				rax, MACHO_SYSCALL(WRITE)
			syscall
			jc				finished				; negative numbers
			pop				rdi
			jmp				reading

finished:
			ret

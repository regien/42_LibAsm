;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_cat(int fd)
;------------------------------------------------------------------
; The received file descriptor should be open
; buffer is 4kb basically can open most files
%define		MACHO_SYSCALL(nb)	0x2000000 | nb
%define		WRITE				4
;%define		OPEN				5
%define		CLOSE				6
%define		READ				3
%define		SIZE_BUF			4096

			default			rel
			global			_ft_cat

			section			.data					; creating a buffer
buffer:		times			SIZE_BUF db 0

			section			.text
_ft_cat:
			cmp				rdi, 0
			jl				finished

reading:
			mov				eax, MACHO_SYSCALL(READ)
			lea				esi, [rel buffer]
			mov				edx, SIZE_BUF
			sub				rsp, 8					; aligning stack
			syscall
			
writing:

			add				rsp, 8

finished:
			ret

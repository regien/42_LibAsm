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
%define		STDIN				1
%define		SIZE_BUF			4096

			default			rel
			global			_ft_cat

			section			.data					; creating a buffer
buffer:		times			SIZE_BUF db 0

			section			.text
_ft_cat:
			cmp				rdi, 0
			jl				finished
;			push			rdi						; preserving the FD
; GET the size of what is gonna print and then print it
; most of the time 4096 is way more than enough

reading:
			push			rdi						; saving FD
			mov				eax, MACHO_SYSCALL(READ)
			lea				esi, [rel buffer]
			mov				edx, SIZE_BUF
;			sub				rsp, 8					; aligning stack because of push
			syscall
			cmp				rax, 0					; if < 0 then exit
			jl				finished

writing:
			mov				rdx, rax				; number of bytes to print
			mov				rdi, STDIN
			lea				esi, [rel buffer]
			mov				rax, MACHO_SYSCALL(WRITE)
			syscall
			jc				finished
			pop				rdi						; restoring fd for read
			add				rsp, 8
			jmp				reading					; loop for reading

finished:
			pop				rdi						; restoring stack pointer
			ret

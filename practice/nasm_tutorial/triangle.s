; Simple exercise of printing a triangle
; ---------------------------------------------------------------------------------
; You reserved memory in the stack in the "section .bss"
; so what you basically do it's writing on that prealocated array and then you
; print your array because you already have the size
; ---------------------------------------------------------------------------------
%define		MACH_SYSCALL(nb)		0x2000000 | nb
%define		WRITE					4
%define		EXIT					1


			global	start
			section		.text

start:
			mov		rdx, output		; rdx (3args) hold addres of next byte to write(reserved)
			mov		r8, 1			; initial line length
			mov		r9, 0			; number of starts written on line so far

line:
			mov		byte [rdx], '*'	; write a single start 
			inc		rdx				; advance pointer to next cell to write
			inc		r9				; increment counter
			cmp		r9, r8			; have we reach the number of stars in this line
			jne		line			; if not equal keep writing and also the counter

lineDone:
			mov		byte[rdx], 10	; write a new line character
			inc		rdx				; move pointer to where next char goes aka.move pointer
			inc		r8				; jumping to next line and length
			mov		r9, 0			; reset count of starts written on this line
			cmp		r8, maxlines	; are we on the last line?
			jng		line			; if not greater

done:
			mov		rax, MACH_SYSCALL(WRITE)	; putting syscall write on rax
			mov		rdi, 1						; first argument
			mov		rsi, output					; the address you been writing as 2 arg
			mov		rdx, dataSize				; len of bytes to write
			syscall
			mov		rax, MACH_SYSCALL(EXIT)		; exit syscall
			xor		rdi, rdi					; setting the value as 0 no errors
			syscall


; The good thing about the bss is that it's preallocated memory
			section		.bss		; section to reserve data
maxlines	equ		8
dataSize	equ		44
output:		resb	dataSize		; reserve certain number of bytes
									; You can also reserve with other keywords like:
									; resb - reserve bytes
									; resw - reserve a word
									; resq - reserve a array of ten reals

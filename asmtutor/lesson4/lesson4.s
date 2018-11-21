%define		MACHO_SYSCALL(nb)		0x2000000 | nb
%define		WRITE					4
%define		EXIT					1
%define		STDOUT					1

section		.data
	msg		db		`Hello, brave new world!Changing this message of just testing\n`

section		.text
global		start

start:
	mov		rax, msg
	call	_strlen
	
	mov		rdi, STDOUT
	mov		rsi, msg
	mov		rdx, rax
	mov		rax, MACHO_SYSCALL(WRITE)
	syscall

	mov		rdi, 0		; 0 success no errors
	mov		rax, MACHO_SYSCALL(EXIT)
	syscall

_strlen:
	push	rbp			; this 3
;	mov		rbp, rsp	; lines are supposed to allign
;	sub		rsp, 16		; the stack on Mac Osx
	mov		rbp, rax

nextchar:
	cmp		byte [rax], 0		; compare to set the ZF zero flag (related to JZ)
	jz		finished
	inc		rax
	jmp		nextchar

finished:
	sub		rax, rbp
	pop		rbp
	ret

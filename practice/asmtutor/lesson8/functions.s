; int strlen(string message)
; string length calculation function
; this strlen is not essentially correct
; you are passing rax as first argument but you should pass
; rdi
_ft_strlen:
	push	rbp			; this 3
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

; this is basically put_str
; void sprint(String message)

_ft_putstr:
	push	rdi			; 1 args - saving all the arguments
	push	rsi			; 2 args -before modifying them
	push	rdx			; 3 args
	push	rax
	call	_ft_strlen		; gonna save the result in rax

	mov		rdx, rax
	pop		rax

	mov		rsi, rax	; third argument
	mov		rdi, 1		; first argument
	mov		rax, 0x2000004		; write syscall
	syscall
	
	pop		rdx
	pop		rsi
	pop		rdi
	ret

; ft_putendl ? (not sure yet)
; it's a putstr with linefeed function
_ft_putendl:
	call	_ft_putstr
	
	push	rax				; preserve rax so we can use it
	mov		rax, 10			; `\n` in rax
	push	rax				; put the \n in the stack
	mov		rax, rsp		; so the stack pointer can have the same addres as rax
	call	_ft_putstr		; take address and print the thing
	pop		rax				; erasing the \n
	pop		rax				; restore original value of rax
	ret


_ft_exit:
	mov		rdi, 0
	mov		rax, 0x2000001		; exit syscall
	syscall


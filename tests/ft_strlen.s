	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.intel_syntax noprefix
	.globl	_ft_strlen              ## -- Begin function ft_strlen
	.p2align	4, 0x90
_ft_strlen:                             ## @ft_strlen
	.cfi_startproc
## BB#0:
	push	rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Lcfi2:
	.cfi_def_cfa_register rbp
	mov	al, byte ptr [rdi]
	test	al, al
	je	LBB0_1
## BB#2:
	not	al
	movzx	eax, al
	inc	eax
	mov	byte ptr [rdi], 0
	pop	rbp
	ret
LBB0_1:
	xor	eax, eax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols

			default			rel
			extern			_printf
			global			_example
			global			_main

; has to be compiled with gcc bc of library
; i dont think the define would be neccesary
; %define		SYSCALL_MACHO(nb)	0x2000000 | nb

			section			.data
pend:
	.vaina	db				"%d\n"

			section			.text
_main:
			xor				eax, eax
			mov				edi, 41
			sub				edi, 48
			cmp				edi, 9
			setbe			ah
			lea				edi, [rel pend.vaina]
			sub				rsp, 16
			mov				esi, edi
			call			_printf
			add				rsp, 8
			ret

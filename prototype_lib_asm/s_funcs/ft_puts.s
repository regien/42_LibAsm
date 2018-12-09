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

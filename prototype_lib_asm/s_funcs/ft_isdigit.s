;------------------------------------------------------------------
;	prototype of the function:
;			int			ft_isdigit(int c)
;------------------------------------------------------------------
;	Range trick:
;	- Kinda similar to what someone does in putnbr
;	(arg - '0') -> has to be bigger than 0 and lower than nice
;	so you substract the value of '0' and then you compare
;	why make it an unsigned at the end, so we can safely check
;	it will make the negative number into a big one so defitenely
;	bigger than 9

			default			rel
			global			_ft_isdigit

			section			.text

_ft_isdigit:
			xor				eax, eax
			sub				edi, 48			; x = x - '0' 
			cmp				edi, 9
			setbe			al		; set below to treat as an unsigned
; ah or al refers bot to the 
			ret						; also set be require a 8 bit register
									; should be the same ah or al both are 8 bits
									; I think is not returning the correct "Boolean"

;------------------------------------------------------------------
;	prototype of the function:
;			size_t		_ft_strlen(const char *str)
;------------------------------------------------------------------
			default			rel
			global			_ft_strlen

			section			.text
_ft_strlen:
			cld							; clear the Direction Flag - in case is DF = 1
										; otherwise is just gonna go backwards
			xor				rax, rax
			xor				rcx, rcx
			not				rcx			; because rep only decrement the counter reg
			repnz			scasb		;
			mov				rax, rcx
			inc				rax
			not				rax
			ret

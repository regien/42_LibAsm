;------------------------------------------------------------------
;	prototype of the function:
;			char		*_ft_strdup(const char *str)
;------------------------------------------------------------------
; 1 PUSH at the beginning then when you call MALLOC
; the RSP -8
; and now you are making another pop to align the stack

			default		rel
			global		_ft_strdup
			extern		_malloc

			section		.text
_ft_strdup:
			cld								; clear DF just in case
			

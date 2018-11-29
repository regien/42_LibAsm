;------------------------------------------------------------------
;	prototype of the function:
;			void		_ft_strcat(char *str1, const char *str2)
;------------------------------------------------------------------

			%include		'ft_strlen.s'
			default			rel
			global			_ft_strcat

; use two varaibles 
			section			.text
_ft_strcat:
			cmp

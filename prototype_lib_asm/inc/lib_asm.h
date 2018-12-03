#ifndef LIB_ASM_H
# define LIB_ASM_H
# include <stdio.h>
# include <unistd.h>
# include <ctype.h>
# include <string.h>

// not done

// done
size_t		ft_strlen(const char *str);
int			ft_isdigit(int c);
void		ft_bzero(void *s, size_t n);


/*
* Test cases functions
*/

void		run_is_funcs_tests(int debug);
void		run_strlen_tests(int debug);

#endif

#ifndef LIB_ASM_H
# define LIB_ASM_H
# include <stdio.h>
# include <unistd.h>
# include <ctype.h>
# include <string.h>
# include <stdint.h> // for extended int

// not done

// done
size_t		ft_strlen(const char *str);
int			ft_isdigit(int c);
void		ft_bzero(void *s, size_t n);
int			ft_isalpha(int c);

char		*ft_strdup(char *str);

/*
** Test cases functions
*/

void		run_is_digit_test(int debug);
void		run_strlen_tests(int debug);
void		run_is_alpha_test(int debug);
void		run_strdup_test(int debug);

#endif

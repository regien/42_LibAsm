#ifndef LIB_ASM_H
# define LIB_ASM_H
# include <stdio.h>
# include <unistd.h>
# include <ctype.h>
# include <string.h>
# include <stdint.h>
# include <stdlib.h>
# include <fcntl.h>

// done
size_t		ft_strlen(const char *str);
int			ft_isdigit(int c);
void		ft_bzero(void *s, size_t n);
int			ft_isalpha(int c);
char		*ft_strdup(char *str);
void		*ft_memset(void *b, int c, size_t len);
int			ft_puts(const char *str);
void		ft_cat(int fd);
int			ft_toupper(int c);
int			ft_tolower(int c);

/*
** Test cases functions
*/

void		run_is_digit_test(int debug);
void		run_strlen_tests(int debug);
void		run_is_alpha_test(int debug);
void		run_strdup_test(int debug);
void		run_memset_tests(int debug);
void		run_puts_test(int debug);
void		run_test_bzero(int debug);
void		run_to_lower(int debug);
void		run_to_upper(int debug);
void				run_cat(int debug);

#endif

#include "lib_asm.h"


static void		test_once(char *str, char *str2, int debug, int *status)
{
	char			*t1 = NULL;
	char			*t2 = NULL;

	t1 = ft_strcat(realloc(ft_strdup(str), \
		(ft_strlen(str) + ft_strlen(str2) + 1)), \
		str2);
	t2 = strcat(realloc(strdup(str), \
		(strlen(str) + strlen(str2) + 1)), \
		str2);

	if (debug == 1)
		printf("Your ft_isalpha = |%d|, system = |%d|\n", t1, t2);
	if (t1 != t2)
		*status = -1;
}

void			run_strcat_test(int debug)
{
	int				status = -1;

	test_once("vaina", " pendejada");
	printf("ft_strcat: %s\n", status ? "ok" : "ko");
}

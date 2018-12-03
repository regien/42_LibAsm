#include "lib_asm.h"

// not done

static void		test_once(char *str, char *str2, int debug, int *status)
{
	char			*t1 = NULL;
	char			*t2 = NULL;

	t1 = ft_strcat(realloc(ft_strdup(str), ft_strlen()), \
			);

	if (debug == 1)
		printf("Your ft_isalpha = |%d|, system = |%d|\n", t1, t2);
	if (t1 != t2)
		*status = -1;
}

void			run_strcat_test(int debug)
{
	int				status = -1;

	test_once(realloc(strdup("vaina"), 15), " pendejada");
}

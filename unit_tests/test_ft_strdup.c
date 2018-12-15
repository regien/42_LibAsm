#include "lib_asm.h"

/*
** If you pass a NULL is supposed to segfault
*/

static void		test_once(char *str, int debug, int *status)
{
	char		*t1 = ft_strdup(str);
	char		*t2 = strdup(str);

	if (debug == 1)
	{
		printf("your ft_strdup = |%s|, system = |%s|\n", t1, t2);
//		printf("your addr ft_strdup = |%p|, system = |%p|\n", t1, t2);
	}
	if (strcmp(t1, t2) != 0)
		*status = -1;
}

void			run_strdup_test(int debug)
{
	int			status = 1;
	uint64_t	sp;

	asm( "mov %%rsp, %0" : "=rm" ( sp ));
	printf("printing stack pointer %p\n", &sp);
	test_once("s", debug, &status);
	test_once("something never ending", debug, &status);
	test_once("", debug, &status);
	printf("ft_strdup: %s\n", status == 1 ? "ok" : "ko");
}

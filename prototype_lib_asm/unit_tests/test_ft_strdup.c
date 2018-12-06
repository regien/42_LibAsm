#include "lib_asm.h"

static void		test_once(char *str, int debug, int *status)
{
	char		*t1 = ft_strdup(str);
	char		*t2 = strdup(str);

	printf("entering\n");
	if (debug == 1)
	{
		printf("your ft_strdup = |%s|, system = |%s|\n", t1, t2);
		printf("your addr ft_strdup = |%p|, system = |%p|\n", t1, t2);
	}
	if (t1 != t2)
		*status = -1;
	printf("exiting\n");
}

void			run_strdup_test(int debug)
{
	int			status = 1;
	uint64_t	sp;

	asm( "mov %%rsp, %0" : "=rm" ( sp ));
	printf("printing stack pointer %p\n", &sp);
	test_once("s", debug, &status);
//	test_once("something never ending", debug, &status);
//	test_once("", debug, &status);
	
	printf("ft_strdupt: %s\n", status ? "ok" : "ko");
}

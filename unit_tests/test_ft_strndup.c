#include "lib_asm.h"

/*
** If you pass a NULL is supposed to segfault
*/

static void		test_once(char *str, int len, int debug, int *status)
{
	char		*t1 = ft_strndup(str, len);
	char		*t2 = strndup(str, len);

	if (debug == 1)
	{
		printf("your ft_strndup = |%s|, system = |%s|\n", t1, t2);
//		printf("your addr ft_strdup = |%p|, system = |%p|\n", t1, t2);
	}
	if (strcmp(t1, t2) != 0)
		*status = -1;
}

void			run_strndup_test(int debug)
{
	int			status = 1;
	uint64_t	sp;

	asm( "mov %%rsp, %0" : "=rm" ( sp ));
	printf("printing stack pointer %p\n", &sp);
	test_once("s", 1,  debug, &status);
	test_once("something never ending", 6, debug, &status);
	test_once("", 0, debug, &status);
	test_once("something never ending", 0, debug, &status);
//	test_once("something never ending", -1, debug, &status);
//	should print the whole string (allocate it)
	printf("ft_strndup: %s\n", status == 1 ? "ok" : "ko");
}

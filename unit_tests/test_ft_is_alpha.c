#include "lib_asm.h"

static void		test_once(int c, int debug, int *status)
{
	int			t1 = ft_isalpha(c);
	int			t2 = isalpha(c);

	if (debug == 1)
		printf("Your ft_isalpha = |%d|, system = |%d|\n", t1, t2);
	if (t1 != t2)
		*status = -1;
}

void			run_is_alpha_test(int debug)
{
	int			status = 1;

	test_once('A', debug, &status);
	test_once('a', debug, &status);
	test_once('Z', debug, &status);
	test_once('z', debug, &status);
	test_once('5', debug, &status);
	test_once('1', debug, &status);
	test_once('2', debug, &status);
	test_once('3', debug, &status);
	printf("ft_isalpha: %s\n", status == 1 ? "ok" : "ko");
}

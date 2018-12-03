#include "lib_asm.h"

static void		test_once(int c, int debug, int *status)
{
	int		t1 = ft_isdigit(c);
	int		t2 = isdigit(c);

	if (debug == 1)
		printf("Your ft_digit = |%d|, system = |%d|\n", t1, t2);
	if (t1 != t2)
		*status = -1;
}

void			run_is_digit_test(int debug)
{
	int			status = 1;

	test_once('a', debug, &status);
	test_once('4', debug, &status);
	test_once('5', debug, &status);
	test_once('9' + 10, debug, &status);
	printf("ft_isdigit: %s\n", status ? "ok" : "ko");
}

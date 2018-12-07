#include "lib_asm.h"

static void			test_once(char *str, int debug, int *status)
{
	int				t1 = puts(str);
	int				t2 = ft_puts(str);

	if (debug == 1)
		printf("Your ft_puts = |%d| system = |%d|\n", t2, t1);
	if (t1 != t2)
		*status = -1;
}

void				run_puts_test(int debug)
{
	int				status = 1;

	test_once("something\n", debug, &status)
	test_once(NULL, debug, &status)
	test_once("testing", debug, &status)

	printf("ft_puts: %s\n", status == 1 ? "ok" : "ko");
}

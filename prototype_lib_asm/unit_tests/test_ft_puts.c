#include "lib_asm.h"

static void			test_once(char *str, int debug, int *status)
{
//	printf("Systems = |");
	int				t1 = puts(str);
//	printf("|\n");
//	printf("yours puts = |");
	int				t2 = ft_puts(str);
//	printf("|\n");
	if (debug == 1)
		printf("Your ft_puts = |%d| system = |%d|\n", t2, t1);
	if (t1 != t2)
		*status = -1;
}

void				run_puts_test(int debug)
{
	int				status = 1;

	test_once("something", debug, &status);
	test_once(NULL, debug, &status);
	test_once("testing", debug, &status);
	test_once("This is just a super giant enormous string that is suppose to print", \
			debug, &status);

	printf("ft_puts: %s\n", status == 1 ? "ok" : "ko");
}

#include "lib_asm.h"

static void			test_once(int vaina, int debug, int *status)
{
	int			t1 = toupper(vaina);
	int			t2 = ft_toupper(vaina);

	if (debug == 1)
		printf("your ft_toupper = |%c|, System = |%c|\n", t2, t1);
	if (t1 != t2)
		*status = -1;
}

void			run_to_upper(int debug)
{
	int			status = 1;

	for (int i = ('a' - 2) ; i < ('z' + 1); i++)
		test_once(i, debug, &status);
	printf("ft_toupper: %s\n", status == 1 ? "ok" : "ko");
}

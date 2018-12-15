#include "lib_asm.h"

static void			test_once(int vaina, int debug, int *status)
{
	int			t1 = tolower(vaina);
	int			t2 = ft_tolower(vaina);

	if (debug == 1)
		printf("your ft_tolower = |%c| |%d|, System = |%c|\n", t2, t2, t1);
	if (t1 != t2)
		*status = -1;
}

void			run_to_lower(int debug)
{
	int			status = 1;

	for (int i = ('A' - 2) ; i < ('Z' + 1); i++)
		test_once(i, debug, &status);
	printf("ft_tolower: %s\n", status == 1 ? "ok" : "ko");
}

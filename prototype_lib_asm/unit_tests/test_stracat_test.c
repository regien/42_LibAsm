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



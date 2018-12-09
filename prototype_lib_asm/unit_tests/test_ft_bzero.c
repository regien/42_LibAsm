#include "lib_asm.h"

static void		test_once(void *ptr, int *status, int debug)
{
	int			len = strlen((char*)ptr);

	ft_bzero(ptr, len);
	if (debug == 1)
		for (int i = 0; i < len; ++i)
			printf("value of arr[%d] = |%c|\n", i, ((char*)ptr)[i]);
}

void		run_test_bzero(int debug)
{
	int		status = 1;

	test_once(strdup("vaina"), &status, debug);
	printf("ft_bzero: %s\n", status == 1 ? "ok" : "ko");
}

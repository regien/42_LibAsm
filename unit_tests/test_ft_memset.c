#include "lib_asm.h"

static void				test_once(void *ptr, int c, size_t len, int *status, int debug)
{
	void	*t1 = ft_memset(ptr, c, len);
	void	*t2 = memset(ptr, c, len);

	if (debug == 1)
		printf("Your ft_memset = |%s| System = |%s|\n", t1, t2);
	if (strcmp((char*)t1, (char*)t2) != 0)
		*status = -1;
}

void					run_memset_tests(int debug)
{
	int		status = 1;

	test_once(strdup("testcase"), (int)'a', ft_strlen("testcase"), &status, debug);
	test_once(strdup("testcase"), 37474, ft_strlen("testcase"), &status, debug);
	test_once(strdup(""), 37474, ft_strlen(""), &status, debug);
	printf("ft_memset: %s\n", status == 1 ? "ok" : "ko");
}

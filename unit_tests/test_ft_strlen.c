#include "lib_asm.h"

char	*str = "test1";
char	*str2 = NULL;

static void		test_once(char *str, int debug, int *status)
{
	size_t			t1 = ft_strlen(str);
	size_t			t2 = strlen(str);

	if (debug == 1)
		printf("Your ft_strlen = |%lu| System = |%lu|\n", t1, t2);
	if (t1 != t2)
		*status = -1;
}

void	run_strlen_tests(int debug)
{
	int		status = 1;


	test_once(str, debug, &status);
	test_once("vaina", debug, &status);
	test_once("", debug, &status);
	test_once("SOMETHING", debug, &status);
	printf("ft_strlen: %s\n", status == 1 ? "ok" : "ko");
}

#include "lib_asm.h"

static void			test_once(char *str, size_t len, int *status, int debug)
{
	char		*test = ft_memalloc(len);
	char		*target = NULL;

	strcpy(target, str);
	if (debug == 1)
		printf("Printing copy ft_memalloc = |%s|\n", target);
	if (!(strcmp(target, test)))
		*status = -1;
}

void			run_memalloc_test(int debug)
{
	int			status = 1;
	char		test[] = "Something kinda useful and super long don't judge me";

	test_once("vaina", strlen("vaina"), &status, debug);
	test_once("something", 15, &status, debug);
	test_once(test, strlen(test), &status, debug);
	test_once("another one", strlen("another one"), &status, debug);

	printf("ft_memalloc: %s\n", status == 1 ? "ok" : "ko");
}

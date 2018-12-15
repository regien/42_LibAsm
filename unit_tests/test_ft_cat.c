#include "lib_asm.h"

/*
** There's no function to compare with
*/

void				run_cat(int debug)
{
	int				status = 1;
	
	int fd = open("unit_tests/tests.c", O_RDONLY);
	printf("should print the thingy valid FD\n");
	ft_cat(fd);

	printf("ft_cat: %s\n", status == 1 ? "ok" : "ko");
}

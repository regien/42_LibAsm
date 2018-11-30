#include "lib_asm.h"

char	*str = "test1";
char	*str2 = NULL;
int		status = 1;


void	run_is_funcs_tests(int debug)
{
	if (debug == 1)
	{
	}
	printf("ft_strlen: %s\n", status ? "ok" : "ko");
}

void	run_strlen_tests(int debug)
{
	if (debug == 1)
	{
		printf("yours = %zu | library = %lu\n", ft_strlen(str) , strlen(str));
//		printf("yours = %zu | library = %lu\n", ft_strlen(str2) , strlen(str2));
		printf("yours = %zu | library = %lu\n", ft_strlen("vaina") , strlen("vaina"));
		printf("yours = %zu | library = %lu\n", ft_strlen("") , strlen(""));
//		printf("yours = dummy | library = %lu\n",strlen(str2));
	}
	if ((ft_strlen(str) != strlen(str)) || \
		(ft_strlen("vaina") != strlen("vaina")) || \
		(ft_strlen("") != strlen("")))
		status = -1;
	printf("ft_strlen: %s\n", status ? "ok" : "ko");
}

/*
void	run_puts_tests(int debug)
{
	char	*str = "test1";
	char	*str2 = NULL;
	int		status = 1;

	if (debug == 1)
	{
		puts()
	}
}
*/

int main(int ac, char **argv)
{
	int		debug = -1;

	if (ac == 2)
		if (strcmp(argv[1], "-g") == 0)
			debug = 1;

	run_strlen_tests(debug);
}

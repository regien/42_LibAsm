#include "lib_asm.h"

char	*str = "test1";
char	*str2 = NULL;
int		status = 1;

// You can make this function modular by passing a third argument
// as a function pointer
void	test_once(int c, int debug)
{
	int		t1 = ft_isdigit(c);
	int		t2 = isdigit(c);

	if (debug == 1)
		printf("Your ft_digit = |%d|, system = |%d|\n", t1, t2);
	if (t1 != t2)
		status = -1;
}

void	run_is_funcs_tests(int debug)
{
	test_once('a', debug);
	test_once('4', debug);
	test_once('5', debug);
	test_once('9' + 10, debug);
	printf("ft_isdigit: %s\n", status ? "ok" : "ko");
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
	run_is_funcs_tests(debug);
}

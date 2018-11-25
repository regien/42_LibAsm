#include "lib_asm.h"

void	run_strlen_tests(int debug)
{
	char	*str = "test1\n";
	char	*str2 = NULL;
	int		status = 0;

	if (debug)
	{
		printf("yours = %zu | library = %lu\n", ft_strlen(str) , strlen(str));
//		printf("yours = %zu | library = %lu\n", ft_strlen(str2) , strlen(str2));
		printf("yours = %zu | library = %lu\n", ft_strlen("vaina") , strlen("vaina"));
		printf("yours = dummy | library = %lu\n",strlen(str2));
	}
	if (ft_strlen(str) != strlen(str) || \
		ft_strlen(str2) != strlen(str2) || \
		ft_strlen("vaina") != strlen("vaina"))
		status = -1;
	printf("ft_strlen: %s\n", status ? "ok" : "ko");

}

int main(int ac, char **argv)
{
	int		debug = -1;

	if (ac == 2)
		if (strcmp(argv[1], "-g"))
			debug = 0;

	run_strlen_tests(debug);
}

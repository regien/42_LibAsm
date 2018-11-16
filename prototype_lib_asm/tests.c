#include "lib_asm.h"
#define RESET status = 0

void	run_strlen_tests(int debug)
{
	char	*str = "test1\n";
	char	*str2 = NULL;

	if (debug)
	{
		printf("yours = %d | library = %d\n", ft_strlen(str) , strlen(str));
		printf("yours = %d | library = %d\n", ft_strlen(str2) , strlen(str2));
		printf("yours = %d | library = %d\n", ft_strlen("vaina") , strlen("vaina"));
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
	int		status = 0;

	if (ac == 2)
		if (argv[1] == "-g")
			debug = 0;

	run_strlen_tests(debug);
	RESET
}

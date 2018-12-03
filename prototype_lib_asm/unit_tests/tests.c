#include "lib_asm.h"

int main(int ac, char **argv)
{
	int		debug = -1;

	if (ac == 2)
		if (strcmp(argv[1], "-g") == 0)
			debug = 1;

	run_strlen_tests(debug);
	run_is_funcs_tests(debug);
}

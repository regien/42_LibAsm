#include "lib_asm.h"

int main(int ac, char **argv)
{
	int		debug = -1;

	if (ac == 2)
		if (strcmp(argv[1], "-g") == 0)
			debug = 1;

// run strdup first | you might have to align the stack with rsp+8 the stack
	run_strlen_tests(debug);
	run_is_digit_test(debug);
	run_is_alpha_test(debug);
	run_strcat_test(debug);
}

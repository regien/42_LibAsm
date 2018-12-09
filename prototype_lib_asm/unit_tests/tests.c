#include "lib_asm.h"

int main(int ac, char **argv)
{
	int		debug = -1;

	if (ac == 2)
		if (strcmp(argv[1], "-g") == 0)
			debug = 1;

	run_strlen_tests(debug);
	run_memset_tests(debug);
	run_is_digit_test(debug);
	run_is_alpha_test(debug);
//	run_puts_test(debug);
	run_strdup_test(debug); // sound and safe
	run_puts_test(debug);
//	run_is_tolower(debug);
//	run_strcat_test(debug); still on testing
}

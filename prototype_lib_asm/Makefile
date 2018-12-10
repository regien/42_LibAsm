NAME = libfts.a

AS = nasm
ASFLAGS = -f macho64
CC = gcc
GCC_FLGSTESTS = -I inc -o 
DIR_S = s_funcs/
DIR_T = unit_tests/
DIR_OBJS = objs/
NAME_TEST = test

#to upper not workin yet
S_FILES = ft_bzero.s \
		ft_strcat.s \
		ft_isalpha.s \
		ft_isascii.s \
		ft_isdigit.s \
		ft_isalnum.s \
		ft_isprint.s \
		ft_tolower.s \
		ft_toupper.s \
		ft_memcpy.s \
		ft_memset.s \
		ft_strlen.s \
		ft_strdup.s \
		ft_puts.s \
		ft_cat.s

# Cheatset $< evaluate afirst item in the list
# $@ evaluate NAme or calling label
# $^ evaluates everything at once

TEST_CASES = tests.c \
			test_ft_strlen.c \
			test_ft_isdigit.c \
			test_ft_is_alpha.c \
			test_ft_strdup.c \
			test_ft_memset.c \
			test_ft_puts.c \
			test_ft_cat.c \
			test_strcat_test.c \
			test_ft_bzero.c \
			test_ft_tolower.c \
			test_ft_toupper.c
# strcat test currently not being used

DIR_TESTS = $(addprefix $(DIR_T), $(TEST_CASES))

OBJECTS = $(addprefix $(DIR_S), $(S_FILES))

TARGETS_OBJ = $(addprefix $(DIR_OBJS), $(S_FILES))

AFTARGETS_OBJ = $(TARGETS_OBJ:.s=.o)

all: $(NAME)

objs:
	@echo "Creating Directory of Objects"
	@if [ -d "./objs" ] ; \
	then \
		echo "Directory already exist" ; \
	else \
		mkdir $(DIR_OBJS); \
	fi;

$(NAME): objs $(AFTARGETS_OBJ)
	ar rcs $(NAME) $(AFTARGETS_OBJ)

$(DIR_OBJS)%.o: $(DIR_S)%.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf objs

fclean: clean
	rm -rf $(NAME)
	rm -rf $(NAME_TEST)

re: fclean all

test:
	$(CC) -o $(NAME_TEST) -I inc $(DIR_TESTS) $(NAME)

runtest: re test


.PHONY: fclean clean re all ob

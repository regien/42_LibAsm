NAME = libfts.a

AS = nasm
ASFLAGS = -f macho64
CC = gcc
GCC_FLGSTESTS = -I inc -o 
DIR_S = s_funcs/
DIR_T = unit_tests/
DIR_OBJS = objs/
NAME_TEST = test

S_FILES = ft_bzero.s \
		ft_isalpha.s \
		ft_isascii.s \
		ft_isdigit.s \
		ft_strcat.s \
		ft_strlen.s

# Cheatset $< evaluate afirst item in the list
# $@ evaluate NAme or calling label
# $^ evaluates everything at once

TEST_CASES = tests.c

DIR_TESTS = $(addprefix $(DIR_T), $(TEST_CASES))

OBJECTS = $(addprefix $(DIR_S), $(S_FILES))

TARGETS_OBJ = $(addprefix $(DIR_OBJS), $(S_FILES))

AFTARGETS_OBJ = $(TARGETS_OBJ:.s=.o)

all: $(NAME)
	ar rcs $(NAME) $(AFTARGETS_OBJ)

obj:
	$(AS) $(ASFLAGS)

$(NAME): $(AFTARGETS_OBJ)

$(DIR_OBJS)%.o: $(DIR_S)%.s
	$(AS) $(ASFLAGS) $< -o $@

# | requirements
$(AFTARGETS_OBJ): | ob

ob:
	@echo "Creating Directory of Objects"
	@mkdir $(DIR_OBJS)

clean:
	rm -rf objs
	rm $(NAME_TEST)

fclean: clean
	rm $(NAME)

re: fclean all

test:
	$(CC) -o $(NAME_TEST) -I inc $(DIR_TESTS) $(NAME)


.PHONY: fclean clean all re

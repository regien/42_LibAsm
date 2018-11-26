NAME = libfts.a
AS = nasm
# I could specify the macosx version (not neccesary but could be good)
ASFLAGS = -f macho64

GCC = gcc
GCC_FLGSTESTS = -I inc -o 

S_FILES = ft_bzero.s \
		  ft_strlen.s

OBJECTS = $(addprefix s_funcs/, $(S_FILES))

#RECUR_OBJECTS = $(pat)

all: $(NAME)

$(NAME): $(OBJECTS)
	$(AS) $(ASFLAGS) $^ 

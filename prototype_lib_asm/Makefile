NAME = libfts.a
AS = nasm
# I could specify the macosx version (not neccesary but could be good)
ASFLAGS = -f macho64

GCC = gcc
GCC_FLGSTESTS = -I inc -o 
DIR_S = s_funcs/
DIR_OBJS = objs/

S_FILES = ft_bzero.s \
		  ft_strlen.s



OBJECTS = $(addprefix $(DIR_S), $(S_FILES))

#TARGETS_OBJ = $(OBJECTS:.s=.o)
TARGETS_OBJ = $(addprefix $(DIR_OBJS), $(S_FILES))
AFTARGETS_OBJ = $(TARGETS_OBJ:.s=.o)

#RECUR_OBJECTS = $(pat)

all: $(NAME)

obj:
	$(AS) $(ASFLAGS)

# Cheatset $< evaluate afirst item in the list
# $@ evaluate NAme or calling label
# $^ evaluates everything at once

#$(NAME): $(OBJECTS)
#Expansion of th
#$(NAME): $(TARGETS_OBJ)
$(NAME): $(AFTARGETS_OBJ)
	echo "pendejada"
#	$(AS) $(ASFLAGS) $<
#	$(AS) $(ASFLAGS) $^ 

$(DIR_OBJS)%.o: $(DIR_S)%.s
	$(AS) $(ASFLAGS) $< -o $@

$(AFTARGETS_OBJ): | ob

ob:
	echo "entering ob"
	mkdir $(DIR_OBJS)

#objects/%.o: %.s
#	$(AS) $(ASFLAGS) -o $@ $<

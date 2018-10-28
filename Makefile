##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## makefile
##

CC	=	gcc

LD	=	ld

RM	=	rm -f

SRC	=	src/

TESTS	=	tests/

SRCS	=	$(SRC)my_strlen.asm \
		$(SRC)my_strchr.asm \
		$(SRC)my_memset.asm \
		$(SRC)my_memcpy.asm \
		$(SRC)my_strcmp.asm \
		$(SRC)my_rindex.asm \
		$(SRC)my_strstr.asm \
		$(SRC)my_strcspn.asm \
		$(SRC)my_strpbrk.asm \
		$(SRC)my_memmove.asm \
		$(SRC)my_strncmp.asm \
		$(SRC)my_strcasecmp.asm \
		$(SRC)write.asm \
		$(SRC)read.asm \
		$(SRC)open.asm \
		$(SRC)close.asm \
		$(SRC)stat.asm \
		$(SRC)lstat.asm \
		$(SRC)fstat.asm \
		$(SRC)mmap.asm

OBJ	=	$(SRCS:.asm=.o)

NAME	=	libasm.so

CFLAGS	+=	-W -Wextra -Wall -Werror

%.o:		%.asm
		nasm -f elf64 -o $@ $<

all:		$(NAME)

$(NAME):	$(OBJ)
		$(LD) $(OBJ) -o $(NAME) -shared

clean:
		make clean -C $(TESTS) --no-print-directory
		$(RM) $(OBJ)

fclean:		clean
		make fclean -C $(TESTS) --no-print-directory
		$(RM) $(NAME)

re:		fclean all

tests_run:	re
		mv $(NAME) $(TESTS)
		make -C $(TESTS) --no-print-directory

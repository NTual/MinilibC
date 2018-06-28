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

TESTSRC	=	$(TESTS)tests-my_strlen.c \
		$(TESTS)tests-my_strchr.c \
		$(TESTS)tests-my_memset.c \
		$(TESTS)tests-my_memcpy.c \
		$(TESTS)tests-my_strcmp.c \
		$(TESTS)tests-my_rindex.c \
		$(TESTS)tests-my_strstr.c \
		$(TESTS)tests-my_strcspn.c \
		$(TESTS)tests-my_strpbrk.c \
		$(TESTS)tests-my_strncmp.c \
		$(TESTS)tests-my_strcasecmp.c

OBJ	=	$(SRCS:.asm=.o)

OBJTEST	=	$(TESTSRC:.c=.o)

NAME	=	libasm.so

NAME_TEST	=	criterion

CFLAGS	+=	-W -Wextra -Wall -Werror

%.o: %.asm
	nasm -f elf64 -o $@ $<

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LD) $(OBJ) -o $(NAME) -shared

clean:
	$(RM) $(OBJ)
	$(RM) $(SRCS:.asm=.asm~)
	$(RM) $(SRCS:.asm=.asm#)
	$(RM) $(OBJTEST)
	$(RM) $(TESTSRC:.c=.c~)
	$(RM) $(TESTSRC:.c=.c#)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(NAME_TEST)

re: fclean all

tests_run:	re $(OBJTEST)
	$(CC) $(OBJTEST) -o $(NAME_TEST) -lcriterion -coverage -ldl
	./criterion --verbose

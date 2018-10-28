##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Makefile
##

SRC		=			\
		tests-my_strlen.c	\
		tests-my_strchr.c	\
		tests-my_memset.c	\
		tests-my_memcpy.c	\
		tests-my_strcmp.c	\
		tests-my_rindex.c	\
		tests-my_strstr.c	\
		tests-my_strcspn.c	\
		tests-my_strpbrk.c	\
		tests-my_strncmp.c	\
		tests-my_strcasecmp.c

OBJ		=	$(SRC:.c=.o)

LDFLAGS		=	-lcriterion --coverage -ldl

CFLAGS		+=	-W -Wall -Wextra

NAME		=	criterion

all:		$(NAME)

$(NAME):	$(OBJ)
		$(CC) -o $(NAME) $(OBJ) $(LDFLAGS)
		./$(NAME)

clean:
		@$(RM) $(OBJ)

fclean:		clean
		@$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re

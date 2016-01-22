#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Debaz <klescaud@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/01/07 12:30:09 by Debaz             #+#    #+#              #
#    Updated: 2016/01/22 14:57:59 by klescaud         ###   ########.fr        #
#                                                                              #
#******************************************************************************#
SRC_PATH =			sources/

SRC_NAME =			bar.c

OBJ_PATH =			obj/

INC_PATH =			includes/

CPPFLAGS =			-I$(INC_PATH)

NAME =				fractol

CC =				clang

CFLAGS =			-Werror -Wall -Wextra

OBJ_NAME =			$(SRC_NAME:.c=.o)

SRC =				$(addprefix $(SRC_PATH)/,$(SRC_NAME))

OBJ =				$(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

all:				$(NAME)

$(NAME):			$(OBJ)
		$(CC) $^ -o $@

$(OBJ_PATH)%.o:		$(SRC_PATH)%.c
		@mkdir $(OBJ_PATH) 2> /dev/null || true
		$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

clean:
		rm -fv $(OBJ)
		@rmdir $(OBJ_PATH) 2> /dev/null || true

fclean:				clean
		rm -fv $(NAME)
re:					fclean all

.PHONY:				all, clean, fclean, re

norme:
		norminette $(SRC)
		norminette $(INC_PATH)*.h

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbousque <tbousque@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/22 12:44:46 by tbousque          #+#    #+#              #
#    Updated: 2024/11/15 06:12:15 by tbousque         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				= gcc
ASM				= nasm
CFLAGS			= -Wall -Wextra -Werror -g3

NAME			= program

all:			$(NAME)

$(ASM): ft_strlen.s
	$(ASM) -felf64 -gdwarf ft_strlen.s -o ft_strlen.o

$(CC): main.c
	$(CC) $(CFLAGS) main.c ft_strlen.o -o a.out

$(NAME): $(ASM) $(CC)
		

clean:
	rm -rf ft_strlen.o main.o

fclean:			clean
	rm -rf a.out

re:	fclean $(NAME)

.PHONY:			all clean fclean re bonus

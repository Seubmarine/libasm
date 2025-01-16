# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbousque <tbousque@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/22 12:44:46 by tbousque          #+#    #+#              #
#    Updated: 2025/01/16 13:54:59 by tbousque         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				= gcc
ASM				= nasm
CFLAGS			= -Wall -Wextra -Werror -g3

NAME			= program

all:			$(NAME)

$(ASM): ft_strlen.s
	$(ASM) -felf64 -gdwarf ft_strlen.s -o ft_strlen.o
	$(ASM) -felf64 -gdwarf ft_strcpy.s -o ft_strcpy.o
	$(ASM) -felf64 -gdwarf ft_strcmp.s -o ft_strcmp.o
	$(ASM) -felf64 -gdwarf ft_read.s -o ft_read.o
	$(ASM) -felf64 -gdwarf ft_write.s -o ft_write.o 
	$(ASM) -felf64 -gdwarf ft_strdup.s -o ft_strdup.o

$(CC): main.c
	$(CC) $(CFLAGS) main.c ft_strlen.o ft_strcpy.o ft_strcmp.o ft_read.o ft_write.o ft_strdup.o -o a.out

$(NAME): $(ASM) $(CC)
		

clean:
	rm -rf ft_strlen.o main.o

fclean:			clean
	rm -rf a.out

re:	fclean $(NAME)

.PHONY:			all clean fclean re bonus

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbousque <tbousque@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/22 12:44:46 by tbousque          #+#    #+#              #
#    Updated: 2025/01/16 19:44:12 by tbousque         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				= gcc
CFLAGS			= -Wall -Wextra -Werror

ASM				= nasm
ASMFLAGS		= -felf64 -gdwarf
NAME			= libasm.so

SRCS = ft_strlen.s \
ft_strcpy.s \
ft_strcmp.s \
ft_read.s \
ft_write.s \
ft_strdup.s \


%.o : %.s
	$(ASM) $(ASMFLAGS) $< -o $@

OBJS = $(SRCS:.s=.o)

all: $(NAME) 

$(NAME) : $(OBJS)
	ar rcs $(NAME) $(OBJS)

test : $(NAME)
	$(CC) $(CFLAGS) main.c $(NAME) -o test.o
	./test.o
clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(NAME)
	rm -f ./test.o

re: fclean all

.PHONY: all clean fclean re test
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anazar <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/06/05 10:07:33 by anazar            #+#    #+#              #
#    Updated: 2017/08/25 21:59:06 by anazar           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
PART1_0 = ft_memset ft_bzero ft_memcpy ft_memccpy ft_memmove 
PART1_1 = ft_memchr ft_memcmp ft_strcat ft_strchr ft_strcpy 
PART1_2 = ft_strdup ft_strlcat ft_strlen ft_strncat ft_strncpy
PART1_3 = ft_strrchr ft_strstr ft_strnstr ft_strcmp ft_strncmp
PART1_4 = ft_atoi ft_isalpha ft_isdigit ft_isalnum ft_isascii
PART1_5 = ft_isprint ft_toupper ft_tolower
PART2_0 = ft_memalloc ft_memdel ft_strnew ft_strdel ft_strclr 
PART2_1 = ft_striter ft_striteri ft_strmap ft_strmapi ft_strequ 
PART2_2 = ft_strnequ ft_strsub ft_strtrim ft_strsplit ft_itoa
PART2_3 = ft_putchar ft_putstr ft_putnbr ft_putendl ft_putchar_fd 
PART2_4 = ft_putstr_fd ft_putnbr_fd ft_putendl_fd ft_strjoin
BONUS = ft_lstnew ft_lstdelone ft_lstdel ft_lstadd ft_lstiter ft_lstmap
ADDIT_1 = ft_iswhitespace ft_split_by_function ft_split_by_delims ft_swap 
ADDIT_2 = ft_isupper ft_islower ft_find_and_replace ft_find ft_trim_by_function ft_trim_by_delims
PART1 = $(PART1_0) $(PART1_1) $(PART1_2) $(PART1_3) $(PART1_4) $(PART1_5)
PART2 = $(PART2_0) $(PART2_1) $(PART2_2) $(PART2_3) $(PART2_4)
ADDIT = $(ADDIT_1) $(ADDIT_2)
FILES = $(PART1) $(PART2) $(BONUS) $(ADDIT)
MAINSRC = tst/main.c
MAINOBJ = main.o
TESTOUT = libtest
LIB = ar rc
FLAGS = -Wall -Werror -Wextra
MEMFLAG = -fsanitize=address -fno-omit-frame-pointer
MEMLINK = -fsanitize=address
SRCS = $(patsubst %, %.c, $(FILES))
OBJS = $(patsubst %, %.o, $(FILES))

all:	$(NAME)

test:
	gcc $(FLAGS) -c $(SRCS) $(MAINSRC)
	gcc $(OBJS) $(MAINOBJ) -o $(TESTOUT)
	$(MAKE) clean
	rm -rf *.gch

tclean:
	rm -rf $(TESTOUT)

$(OBJS): $(SRCS)
	@gcc $(FLAGS) -c $(SRCS) -I ./

$(NAME): $(OBJS)
	@$(LIB) $(NAME) $(OBJS)
	@ranlib $(NAME)

clean:
	@rm -f $(OBJS) $(MAINOBJ)

fclean:	clean
	@rm -f $(NAME)

re:	fclean all

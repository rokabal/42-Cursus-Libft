# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rkassouf <rkassouf@student.42abudhabi.ae>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/28 12:48:30 by rkassouf          #+#    #+#              #
#    Updated: 2022/07/26 21:48:14 by rkassouf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFLAGS = -Wall -Wextra -Werror
CC = gcc $(CFLAGS)
ARFLAGS	=	-rcs
AR		=	ar $(ARFLAGS)
RM = rm -rf

SRCS_DIR = ./src
OBJS_DIR = ./obj
INCLUDES_DIR = ./includes

NAME		= libft.a

CFILES		= ft_memset.c \
			  ft_bzero.c \
			  ft_memcpy.c \
			  ft_strlen.c \
			  ft_isalpha.c \
			  ft_isdigit.c \
			  ft_isalnum.c \
			  ft_isascii.c \
			  ft_isprint.c \
			  ft_toupper.c \
			  ft_tolower.c \
			  ft_calloc.c \
			  ft_strchr.c \
			  ft_strrchr.c \
			  ft_strdup.c \
			  ft_strlcpy.c \
			  ft_strlcat.c \
			  ft_memcmp.c \
			  ft_memchr.c \
			  ft_memmove.c \
			  ft_strnstr.c \
			  ft_strncmp.c \
			  ft_atoi.c \
			  ft_putchar_fd.c \
			  ft_putstr_fd.c \
			  ft_putendl_fd.c \
			  ft_putnbr_fd.c \
			  ft_substr.c \
			  ft_strjoin.c \
			  ft_strtrim.c \
			  ft_split.c \
			  ft_itoa.c \
			  ft_strmapi.c \
			  ft_striteri.c \
			  ft_exit_on_err.c

CFILES_B	= ft_lstnew.c \
			  ft_lstadd_front.c \
			  ft_lstsize.c \
			  ft_lstlast.c \
			  ft_lstadd_back.c \
			  ft_lstdelone.c \
			  ft_lstclear.c \
			  ft_lstiter.c \
			  ft_lstmap.c

SRCS	=	$(CFILES)
OBJS	=	$(addprefix $(OBJS_DIR)/,$(CFILES:.c=.o))
SRCS_B	=	$(CFILES_B)
OBJS_B	=	$(addprefix $(OBJS_DIR)/,$(CFILES_B:.c=.o))

INCLUDES_FILES = libft.h
INCLUDES = $(addprefix $(INCLUDES_DIR)/, $(INCLUDES_FILES))

all: $(NAME)

${NAME}:	${OBJS}
	${AR} $@ $^

${OBJS_DIR}/%.o: ${SRCS_DIR}/%.c
	@mkdir -p obj
	$(CC) -I$(INCLUDES_DIR) -o $@ -c $<

bonus:	${OBJS} ${OBJS_B}
	${AR} ${NAME} $^

clean:
	${RM} ${OBJS_DIR}

fclean: clean
	${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re bonus

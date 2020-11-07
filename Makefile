# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rjeraldi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/21 21:58:57 by rjeraldi          #+#    #+#              #
#    Updated: 2020/11/07 18:09:22 by rjeraldi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

DEPSDIR = .
DEPS = libft.h
DEPS = $(addprefix $(DEPSDIR)/, $(DEP))

SRCSDIR = .
SRC = ft_putchar_fd.c\
			ft_putchar.c\
			ft_strnlen.c\
			ft_strlen.c\
			ft_putstr_fd.c\
			ft_putstr.c\
			ft_isdigit.c\
			ft_isspace.c\
			ft_isupper.c\
			ft_islower.c\
			ft_toupper.c\
			ft_tolower.c\
			ft_isalpha.c\
			ft_isalnum.c\
			ft_isprint.c\
			ft_isascii.c\
			ft_striter.c\
			ft_striteri.c\
			ft_isascii_str.c\
			ft_putendl_fd.c\
			ft_putendl.c\
			ft_strmap.c\
			ft_strmapi.c\
			ft_strncmp.c\
			ft_strcmp.c\
			ft_strnchr.c\
			ft_strchr.c\
			ft_strrnchr.c\
			ft_strrchr.c\
			ft_strnequ.c\
			ft_strequ.c\
			ft_strncpy.c\
			ft_strcpy.c\
			ft_memcpy.c\
			ft_memcmp.c\
			ft_memset.c\
			ft_memchr.c\
			ft_bzero.c\
			ft_memalloc.c\
			ft_memccpy.c\
			ft_memdel.c\
			ft_memmove.c\
			ft_putnbr_fd.c\
			ft_putnbr.c\
			ft_strncat.c\
			ft_strcat.c\
			ft_strlcat.c\
			ft_strclr.c\
			ft_strdel.c\
			ft_strjoin.c\
			ft_strdup.c\
			ft_strnew.c\
			ft_strnstr.c\
			ft_strstr.c\
			ft_strsub.c\
			ft_strtrim.c\
			ft_strstrim.c\
			ft_strsplit.c\
			ft_atoi.c\
			ft_strrev.c\
			ft_itoa.c\
			ft_lstnew.c\
			ft_lstdelone.c\
			ft_lstdel.c\
			ft_lstadd.c\
			ft_lstiter.c\
			ft_lstmap.c\
			get_next_line.c
SRCS = $(addprefix $(SRCSDIR)/, $(SRC))

OBJSDIR = ./obj
OBJS = $(addprefix $(OBJSDIR)/, $(SRC:.c=.o))

CC = /usr/bin/gcc
CCFLAGS = -Wall -Wextra -Werror
CCIFLAGS = -I$(DEPSDIR)

AR = /usr/bin/ar
ARFLAGS = rc
RANLIB = /usr/bin/ranlib
RANLIBFLAGS =

RM = /bin/rm
RMFLAGS = -rf

MKDIR = /bin/mkdir
MKDIRFLAGS = -p

WORKINGDIR = `basename \`pwd\``

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJS)
	@echo "$(NAME): Creating static library"
	@$(AR) $(ARFLAGS) $@ $^
	@$(RANLIB) $(RANLIBFLAGS) $@

$(OBJSDIR)/%.o: $(SRCSDIR)/%.c
	@$(MKDIR) $(MKDIRFLAGS) $(OBJSDIR)
	@$(CC) $(CCFLAGS) $(CCIFLAGS) $< -c -o $@

clean:
	@echo "$(NAME): Cleaning $(WORKINGDIR)/`basename $(OBJSDIR)`"
	@$(RM) $(RMFLAGS) $(OBJSDIR)

fclean: clean
	@echo "$(NAME): Cleaning $(WORKINGDIR)"
	@$(RM) $(RMFLAGS) $(NAME)

re: fclean all

norm: fclean
	@norminette $(DEPSDIR) $(SRCSDIR)

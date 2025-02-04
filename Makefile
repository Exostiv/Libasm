NAME = libasm.a

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJ = $(SRC:.s=.o)

NASM = nasm
NASMFLAGS = -f elf64# Supprimé -fPIC car NASM ne le supporte pas

AR = ar
ARFLAGS = rcs

CC = gcc
CFLAGS = -Wall -Wextra -Werror -fPIE -pie # Ajout de -fPIE pour l'exécutable
LDFLAGS = -pie  # Activation de PIE pour l'édition de liens

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $(NAME) $(OBJ)

all: $(NAME)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

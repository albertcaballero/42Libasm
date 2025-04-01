# gcc -m32 -O3 -masm=intel -fno-omit-frame-pointer -S -o- source.c  -> transform C into assembly

NAME := libasm.a
OUTPUT := test

ASM := nasm -f elf64

TMP := .obj/

FUNCS = ft_strlen ft_strcpy ft_strcmp ft_write ft_read  ft_strdup

SRC := $(addprefix src/,$(addsuffix .s,$(FUNCS)))
OBJ := $(addprefix $(TMP),$(addsuffix .o,$(FUNCS)))

all: $(NAME) 

$(NAME): $(TMP) $(OBJ)
	ar rcs $(NAME) $(OBJ)
	ranlib $(NAME)

$(TMP):
	mkdir -p $(TMP)

main: all
	cc $(NAME) main.c -L. -lasm -o $(OUTPUT) -z noexecstack

$(TMP)%.o: src/%.s Makefile $(TMP)
	$(ASM) $< -o $@

clean:
	rm -rf $(TMP)

fclean: clean
	rm -rf $(NAME)
	rm -rf $(OUTPUT)

re: fclean all
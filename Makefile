TARGET 			= cub3d
OBJDIR 			= obj
SRCDIR 			= src
INCLUDE_DIR 	= include
CC 				= cc

SRC 			= main.c
OBJ 			= $(addprefix obj/, $(SRC:.c=.o))

INC 			:= -I $(INCLUDE_DIR)

LIBFT_DIR		= libft/
LIBFT 			= libft/libft.a

MLX 			= ./MLX42/build/
MLX_LIB 		= $(addprefix $(MLX), libmlx42.a)
MLX_INC			= -I ./MLX42/include
CFLAGS 			= -Wall -Werror -Wextra -pthread -Ofast -march=native -mtune=native

GREEN		=	\e[38;5;118m
YELLOW		=	\e[38;5;226m
BLUE 		= 	\033[34;01m
RESET		=	\e[0m
_SUCCESS	=	[$(GREEN)[+] SUCCESS$(RESET)]
_INFO		=	[$(YELLOW)[?] INFO$(RESET)]
_ID			=	[$(BLUE)$(TARGET)$(RESET)]

all: $(TARGET) $(LIBFT) $(MLX42_BUILD)

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Linux)
	MLXFLAGS = -ldl -lglfw -pthread -lm

else ifeq ($(UNAME_S), Darwin)
	MLXFLAGS = -lglfw -L /Users/$(USER)/.brew/opt/glfw/lib/
endif

$(LIBFT):
	@make -C $(LIBFT_DIR) --silent

$(TARGET): $(OBJ)
	@make -C $(MLX) --silent
	@printf "$(_INFO) Compiling main executable $(_ID)\n"
	@$(CC) $(OBJ) $(CFLAGS) $(INC) $(MLX_INC) $(MLX_LIB) $(MLXFLAGS) -o $(TARGET)
	@printf "$(_SUCCESS) $(TARGET) compiled $(_ID)\n";

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INCLUDE_DIR)/* Makefile
	@mkdir -p $(dir $@)
	@printf "$(_INFO) Compiling: $< $(_ID)\n"
	@$(CC) $(CFLAGS) $(INC) $(MLX_INC) -c -o $@ $<

clean:
	@printf "$(_INFO) Cleaning Object Files $(_ID)\n"
	@make -C $(MLX) clean --silent
	@make -C libft clean --silent
	@rm -f $(OBJ)
	@printf "$(_INFO) Objs deleted.$(RESET) $(_ID)\n"

fclean: clean
	@printf "$(_INFO) cleaning remaining files.\n"
	@make -C $(MLX) clean --silent
	@make -C libft fclean --silent
	@rm -rf $(TARGET)
	@rm -rf $(OBJDIR)
	@printf "$(_INFO)$(GREEN) project folder cleaned.$(RESET)$(_ID)\n"

re: fclean all

.PHONY: all clean fclean re bonus
# Имя исполняемого бинарного файла
NAME = RT

# Пути до *.cpp
DIR_SRCS = srcs
SRCS = main.cpp

# Parser
DIR_PARSER = Parser
SRCS_PARSER = Parser.cpp
SRCS += $(addprefix $(DIR_PARSER)/, $(SRCS_PARSER))
DIRS = $(DIR_PARSER)

# Пути до *.o
DIR_OBJS = objs
OBJS = $(patsubst %.cpp, %.o, $(SRCS))
PATH_OBJS = $(addprefix $(DIR_OBJS)/, $(OBJS))
DIR_SRCS_OBJS = $(addprefix $(DIR_OBJS)/, $(DIRS))

# Компилятор и вспомогательные файлы
CC = clang++
FLAGS = -g -O3 -std=c++17 -Wall -Werror -Wextra
RM = rm -rf

# VCPKG - установщик библиотек
VCPKG_DIR = vcpkg/packages

# Путь до jsoncpp
JSONCPP_DIR = $(addprefix $(VCPKG_DIR)/, jsoncpp_x64-osx)
JSONCPP_LIB = $(addprefix $(JSONCPP_DIR)/, lib/libjsoncpp.a)
JSONCPP_INCLUDES = $(addprefix $(JSONCPP_DIR)/, include)

# Пути до *.hpp
DIR_INCLUDES = includes
INCLUDES = Parser.hpp
INCLUDES_PATH = $(addprefix $(DIR_INCLUDES)/, $(INCLUDES))

# Цвета
GREEN = \033[0;32m
RESET = \033[0m

all: $(NAME)

$(NAME): write_logo create_dirs $(PATH_OBJS)
	@echo "$(GREEN)\nObjects was created $(RESET)"
	@$(CC) $(FLAGS) $(PATH_OBJS) -o $@ $(JSONCPP_LIB)
	@echo "$(GREEN)Simply the best hard multi-d ray-tracing mother lover by peace dukes was compiled $(RESET)"

# Чтобы было красиво
write_logo:
	@echo "$(GREEN)\n\
	░██████╗██╗███╗░░░███╗██████╗░██╗░░░░░██╗░░░██╗  ████████╗██╗░░██╗███████╗  ██████╗░███████╗░██████╗████████╗\n\
	██╔════╝██║████╗░████║██╔══██╗██║░░░░░╚██╗░██╔╝  ╚══██╔══╝██║░░██║██╔════╝  ██╔══██╗██╔════╝██╔════╝╚══██╔══╝\n\
	╚█████╗░██║██╔████╔██║██████╔╝██║░░░░░░╚████╔╝░  ░░░██║░░░███████║█████╗░░  ██████╦╝█████╗░░╚█████╗░░░░██║░░░\n\
	░╚═══██╗██║██║╚██╔╝██║██╔═══╝░██║░░░░░░░╚██╔╝░░  ░░░██║░░░██╔══██║██╔══╝░░  ██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░\n\
	██████╔╝██║██║░╚═╝░██║██║░░░░░███████╗░░░██║░░░  ░░░██║░░░██║░░██║███████╗  ██████╦╝███████╗██████╔╝░░░██║░░░\n\
	╚═════╝░╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝░░░╚═╝░░░  ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ╚═════╝░╚══════╝╚═════╝░░░░╚═╝░░░\n\
\n\
	██╗░░██╗░█████╗░██████╗░██████╗░  ███╗░░░███╗██╗░░░██╗██╗░░░░░████████╗██╗░░░░░░██████╗░\n\
	██║░░██║██╔══██╗██╔══██╗██╔══██╗  ████╗░████║██║░░░██║██║░░░░░╚══██╔══╝██║░░░░░░██╔══██╗\n\
	███████║███████║██████╔╝██║░░██║  ██╔████╔██║██║░░░██║██║░░░░░░░░██║░░░██║█████╗██║░░██║\n\
	██╔══██║██╔══██║██╔══██╗██║░░██║  ██║╚██╔╝██║██║░░░██║██║░░░░░░░░██║░░░██║╚════╝██║░░██║\n\
	██║░░██║██║░░██║██║░░██║██████╔╝  ██║░╚═╝░██║╚██████╔╝███████╗░░░██║░░░██║░░░░░░██████╔╝\n\
	╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░  ╚═╝░░░░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░░░░╚═════╝░\n\
\n\
	██████╗░░█████╗░██╗░░░██╗░░░░░░████████╗██████╗░░█████╗░░█████╗░██╗███╗░░██╗░██████╗░\n\
	██╔══██╗██╔══██╗╚██╗░██╔╝░░░░░░╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║████╗░██║██╔════╝░\n\
	██████╔╝███████║░╚████╔╝░█████╗░░░██║░░░██████╔╝███████║██║░░╚═╝██║██╔██╗██║██║░░██╗░\n\
	██╔══██╗██╔══██║░░╚██╔╝░░╚════╝░░░██║░░░██╔══██╗██╔══██║██║░░██╗██║██║╚████║██║░░╚██╗\n\
	██║░░██║██║░░██║░░░██║░░░░░░░░░░░░██║░░░██║░░██║██║░░██║╚█████╔╝██║██║░╚███║╚██████╔╝\n\
	╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░░░░░░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝╚═╝░░╚══╝░╚═════╝░\n\
\n\
	███╗░░░███╗░█████╗░████████╗██╗░░██╗███████╗██████╗░  ██╗░░░░░░█████╗░██╗░░░██╗███████╗██████╗░  ██████╗░██╗░░░██╗\n\
	████╗░████║██╔══██╗╚══██╔══╝██║░░██║██╔════╝██╔══██╗  ██║░░░░░██╔══██╗██║░░░██║██╔════╝██╔══██╗  ██╔══██╗╚██╗░██╔╝\n\
	██╔████╔██║██║░░██║░░░██║░░░███████║█████╗░░██████╔╝  ██║░░░░░██║░░██║╚██╗░██╔╝█████╗░░██████╔╝  ██████╦╝░╚████╔╝░\n\
	██║╚██╔╝██║██║░░██║░░░██║░░░██╔══██║██╔══╝░░██╔══██╗  ██║░░░░░██║░░██║░╚████╔╝░██╔══╝░░██╔══██╗  ██╔══██╗░░╚██╔╝░░\n\
	██║░╚═╝░██║╚█████╔╝░░░██║░░░██║░░██║███████╗██║░░██║  ███████╗╚█████╔╝░░╚██╔╝░░███████╗██║░░██║  ██████╦╝░░░██║░░░\n\
	╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝  ╚══════╝░╚════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝  ╚═════╝░░░░╚═╝░░░\n\
\n\
	██████╗░███████╗░█████╗░░█████╗░███████╗  ██████╗░██╗░░░██╗██╗░░██╗███████╗░██████╗\n\
	██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██║░░░██║██║░██╔╝██╔════╝██╔════╝\n\
	██████╔╝█████╗░░███████║██║░░╚═╝█████╗░░  ██║░░██║██║░░░██║█████═╝░█████╗░░╚█████╗░\n\
	██╔═══╝░██╔══╝░░██╔══██║██║░░██╗██╔══╝░░  ██║░░██║██║░░░██║██╔═██╗░██╔══╝░░░╚═══██╗\n\
	██║░░░░░███████╗██║░░██║╚█████╔╝███████╗  ██████╔╝╚██████╔╝██║░╚██╗███████╗██████╔╝\n\
	╚═╝░░░░░╚══════╝╚═╝░░╚═╝░╚════╝░╚══════╝  ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░\n\
		$(RESET)"

create_dirs:
	@mkdir -p $(DIR_OBJS) $(DIR_SRCS_OBJS)

$(DIR_OBJS)/%.o: $(DIR_SRCS)/%.cpp $(INCLUDES_PATH) Makefile
	@$(CC) $(FLAGS) -I $(JSONCPP_INCLUDES) -I $(DIR_INCLUDES) -c $< -o $@
	@echo "$(GREEN).$(RESET)\c"

clean:
	@$(RM) $(DIR_OBJS)
	@echo "$(GREEN) clean instruction was executed $(RESET)"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(GREEN) fclean instruction was executed $(RESET)"

re: fclean all

.PHONY: all clean fclean re write_logo create_dirs

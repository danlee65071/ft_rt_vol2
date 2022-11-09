NAME = unittest

SRCS = unittest.cpp

DIR_PARSER = Parser
SRCS_PARSER = test_parser.cpp
SRCS += $(addprefix $(DIR_PARSER)/, $(SRCS_PARSER))
DIRS = $(DIR_PARSER)

DIR_INCLUDES = ../includes

OBJS = $(patsubst %.cpp, %.o, $(SRCS))
DIR_OBJS = objs
PATH_OBJS = $(addprefix $(DIR_OBJS)/, $(OBJS))
DIRS_IN_OBJS = $(addprefix $(DIR_OBJS)/, $(DIRS))

DIR_PROJECT_OBJS = ../objs
PROJECT_OBJS = $(shell find $(DIR_PROJECT_OBJS) -name '*.o')
PATH_PROJECT_OBJS = $(filter-out ../objs/main.o, $(PROJECT_OBJS))

CC = clang++
FLAGS = -g -O3 -std=c++17 -Wall -Werror -Wextra
RM = rm -rf

VCPKG_DIR = ../vcpkg/packages

JSONCPP_DIR = $(addprefix $(VCPKG_DIR)/, jsoncpp_x64-osx)
JSONCPP_LIB = $(addprefix $(JSONCPP_DIR)/, lib/libjsoncpp.a)
JSONCPP_INCLUDES = $(addprefix $(JSONCPP_DIR)/, include)

GREEN = \033[0;32m
RESET = \033[0m

all: $(NAME)

$(NAME): make_project create_dirs $(PATH_OBJS)
	@echo "$(GREEN)\nObjects was created $(RESET)"
	@$(CC) $(FLAGS) $(PATH_OBJS) $(PATH_PROJECT_OBJS) -o $@ $(JSONCPP_LIB)

create_dirs:
	@mkdir -p $(DIR_OBJS) $(DIRS_IN_OBJS)

make_project:
	@make -C ..

$(DIR_OBJS)/%.o: %.cpp Makefile
	@$(CC) $(FLAGS) -I $(JSONCPP_INCLUDES) -I $(DIR_INCLUDES) -c $< -o $@
	@echo "$(GREEN).$(RESET)\c"

clean:
	@$(RM) $(DIR_OBJS)
	@echo "$(GREEN) clean instruction was executed $(RESET)"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(GREEN) fclean instruction was executed $(RESET)"
	@make fclean -C ..

re: fclean all

.PHONY: all clean fclean re write_logo create_dirs make_project

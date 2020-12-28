#Makefile template for project creation - created by talberko1

#---TARGET EXECUTABLE / LIBRARY NAME---

TARGET	:=	app

#---REQUIRED DIRECTORIES---

SRC_DIR	:=	src
INC_DIR	:=	include

#---AUTO GENERATED DIRECTORIES---

OBJ_DIR	:=	build
DEP_DIR	:=	dep
BIN_DIR	:=	bin

#---FILE EXTENSIONS---

OBJECT_EXT	:=	o
DEPENDENCY_EXT	:=	d
SOURCE_EXT	:=	cpp

#---COMPILER---

CC	:=	g++

COMPILE	:=	-c
OUTPUT	:=	-o

WFLAGS	:=	-Wall -Werror

#---COMPILER FLAGS--- (-I<include path>, Example: -I/usr/local/include)

CFLAGS	:=	$(WFLAGS) -I$(INC_DIR) $(COMPILE)

#---LINKER FLAGS--- (-L<library path>, Example: -L/usr/local/lib)

LDFLAGS	:=	$(WFLAGS)

#---LIBRARIES--- (-l<lib name>, Example: -llibPcap++, -llibmongocxx.so)

LIBS	:=	

#==============DO=NOT=EDIT=BELOW=THIS=LINE==============#

SRCS	:=	$(wildcard $(SRC_DIR)/*.$(SOURCE_EXT))
OBJS	=	$(addprefix $(OBJ_DIR)/,$(patsubst $(SRC_DIR)/%.$(SOURCE_EXT),%.$(OBJECT_EXT),$(SRCS)))
GENERATED_DIRS	:=	$(OBJ_DIR)	$(DEP_DIR)	$(BIN_DIR)

#Make target application
all:	$(SRCS)	$(GENERATED_DIRS)	$(TARGET)

#Make the needed directories
$(GENERATED_DIRS):
	@mkdir $@

#Make target application
$(TARGET):	$(OBJS)
	@echo "Building target: $(BIN_DIR)/$@"
	@$(CC) $(LDFLAGS) $^ $(OUTPUT) $(BIN_DIR)/$@ $(LIBS)
	@echo "Done!"

#Make object files and put them in the 'obj' directory
$(OBJ_DIR)/%.$(OBJECT_EXT):	$(SRC_DIR)/%.$(SOURCE_EXT)
	@echo "Building file: $<"
	@$(CC) $(CFLAGS) $< $(OUTPUT) $@	$(DEPFLAGS)

#Clean target application
clean:
	@echo "Cleaning.."
	$(foreach dir,$(GENERATED_DIRS),@rm -rf $(dir))
	@echo "Done!"

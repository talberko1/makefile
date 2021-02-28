#Makefile for project creation - created by talberko1

#---QUICK GUIDE---

#In order to initialize the project with the required directories, use 'make init'.
#This command will generate the source and header directories.
#The default values of each variable below may be altered to your preference.
#Editing the internal makefile is at your own risk.

#In order to compile your project, use 'make' or 'make all'


#*****START OF MAKEFILE*****


#---TARGET EXECUTABLE / LIBRARY NAME---

TARGET	:=	app

#---AUTO GENERATED DIRECTORIES

SRC_DIR	:=	src
INC_DIR	:=	include
OBJ_DIR	:=	build
BIN_DIR	:=	bin

#---FILE EXTENSIONS---

OBJ_EXT	:=	o
DEP_EXT	:=	d
SRC_EXT	:=	cpp

#---COMPILER---

CC	:=	g++


#*****START OF USER DATA*****





#*****END OF USER DATA*****


#*****START OF FLAGS*****



#---WARNING FLAGS--- (-W<flag name>)

WFLAGS	:=

#---COMPILER FLAGS--- (-I<include path>, Example: -I/usr/local/include)

CFLAGS	:=

#---LINKER FLAGS--- (-L<library path>, Example: -L/usr/local/lib)

LDFLAGS	:=

#---LIBRARIES--- (-l<lib name>, Example: -lPcap++, -lmongocxx.so)

LDLIBS	:=



#*****END OF FLAGS*****


#*****START OF INTERNAL MAKEFILE*****

COMPILE	:=	-c
OUTPUT	:=	-o

#---RECURSIVE WILDCARD FUNCTION---

recursive_wildcard=$(foreach d,$(wildcard $(1:=/*)),$(call recursive_wildcard,$d,$2,)	$(filter $(subst *,%,$2),$d))

#---GETTING ALL SOURCE FILES USING THE RECURSIVE WILDCARD FUNCTION---

SRCS	:=	$(call recursive_wildcard,$(SRC_DIR),*.$(SRC_EXT))
OBJS	:=	$(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%.$(OBJ_EXT),$(basename $(SRCS)))
DEPS	:=	$(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%.$(DEP_EXT),$(basename $(SRCS)))

GENERATED_DIRS	:=	$(OBJ_DIR)	$(BIN_DIR)

#---DEPENDENCY FLAGS---

DEPFLAGS	:=	-MMD	-MP

#---COMPILE & BUILD RULE---

.PHONY: all
all:	$(SRCS)	$(GENERATED_DIRS)	$(TARGET)

#---INIT RULE---

.PHONY: init
init:
	@echo "Building source directory: $(SRC_DIR)"
	@mkdir	$(SRC_DIR)
	@echo "Building include directory: $(INC_DIR)"
	@mkdir	$(INC_DIR)
	@echo "Created base directories!"

#---OUTPUT DIRECTORIES CREATION RULE---

$(GENERATED_DIRS):
	@mkdir $@

#---LINK RULE---

$(TARGET):	$(OBJS)
	@echo "Building target: $(BIN_DIR)/$@"
	@$(CC)	$(WFLAGS)	$(LDFLAGS) $^ $(OUTPUT) $(BIN_DIR)/$@ $(LDLIBS)
	@echo "Done!"

.PRECIOUS:	$(OBJ_DIR)/.	$(OBJ_DIR)%/.

$(OBJ_DIR)/.:
	@mkdir -p $@

$(OBJ_DIR)%/.:
	@mkdir -p $@	

.SECONDEXPANSION:

#---COMPILE RULE---

$(OBJ_DIR)/%.$(OBJ_EXT):	$(SRC_DIR)/%.$(SRC_EXT) | $$(@D)/.
	@echo "Building file: $@"
	@$(CC)	$(WFLAGS)	$(DEPFLAGS)	$(CFLAGS)	$(COMPILE)	$< $(OUTPUT)	$@

#---CLEAN RULE---

clean:
	@echo "Cleaning.."
	$(foreach dir,$(GENERATED_DIRS),@rm -rf $(dir))
	@echo "Done!"
-include $(DEPS)

#*****END OF INTERNAL MAKEFILE*****

#*****END OF MAKEFILE*****
PROJECT_ROOT_PATH = $(dir $(shell pwd))
PROJECT_MAIN_PATH = $(PROJECT_ROOT_PATH)main
PROJECT_OBJ_PATH = $(PROJECT_ROOT_PATH)obj
PROJECT_BIN_PATH = $(PROJECT_ROOT_PATH)bin
PROJECT_LIB_PATH = $(PROJECT_ROOT_PATH)lib
PROJECT_ANALYSIS_PATH = $(PROJECT_ROOT_PATH)analysis
CMN_SRC_PATH = $(PROJECT_MAIN_PATH)/common
APPLICATION_PATH = $(PROJECT_MAIN_PATH)/src
APPLICATION_MAKEPATH =  $(APPLICATION_PATH)/build

CC := gcc
CPP := g++
MKDIR = mkdir -p
RM = rm -rf
PRINT = echo
AR = ar

CCCC_CPP_FILES :=
CCCC_C_FILES :=

INCLUDES :=
CFLAGS :=

#Check if tput exists
TINPUT_EXISTS := $(shell which tput 2>/dev/null)
ifdef TINPUT_EXISTS
  include colorEcho.mk
else
  define echoInfo
    @echo $1
  endef
  define echoError
    @echo $1
  endef
  define echoWarning
    @echo $1
  endef
  define echoDone
    @echo $1
  endef
endif

include $(APPLICATION_MAKEPATH)/application.mk

CFLAGS += -Wall
CFLAGS += -Wextra 
CFLAGS += -Wfatal-errors
CFLAGS += $(INCLUDES)

##
# Verbose ENABLE/DISABLE
# invoke make V=1
# Ensure its upper case 'V'
##
AT=@
ifeq ($(V),1)
    AT=
endif  

.c.o :
	$(call echoInfo,"Compiling $<")
	$(AT)$(CC) $(CFLAGS) -c $< -o $(<:.c=.o)

.cpp.o:
	$(call echoInfo,"Compiling $<")
	$(AT)$(CPP) $(CFLAGS) -c $< -o $(<:.cpp=.o)

# print: application_print drivers_print pss_print rrs_print
all: application

clean ::
	@$(PRINT) "Cleaning Complete $@\n"

setuid:
	chmod +s $(APPLICATION_TARGET)
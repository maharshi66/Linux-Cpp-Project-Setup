PROJECT_ROOT_PATH = $(dir $(shell pwd))
PROJECT_SRC_PATH = $(PROJECT_ROOT_PATH)src
PROJECT_OBJ_PATH = $(PROJECT_ROOT_PATH)obj
PROJECT_BIN_PATH = $(PROJECT_ROOT_PATH)bin
PROJECT_LIB_PATH = $(PROJECT_ROOT_PATH)lib
PROJECT_ANALYSIS_PATH = $(PROJECT_ROOT_PATH)analysis

CMN_SRC_PATH = $(PROJECT_SRC_PATH)/common

CTRL_PATH = $(PROJECT_SRC_PATH)/ctrl
CTRL_MAKEPATH =  $(CTRL_PATH)/build

CTRL_DRVRS_PATH = $(CTRL_PATH)/drivers
CTRL_DRVRS_MAKEPATH =  $(CTRL_DRVRS_PATH)/build

PSS_PATH = $(PROJECT_SRC_PATH)/ps
PSS_MAKEPATH =  $(PSS_PATH)/build

RRS_PATH = $(PROJECT_SRC_PATH)/rr
RRS_MAKEPATH =  $(RRS_PATH)/build

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


include $(CTRL_MAKEPATH)/ctrl.mk
include $(PSS_MAKEPATH)/pss.mk
include $(RRS_MAKEPATH)/rrs.mk
include $(CTRL_DRVRS_MAKEPATH)/drivers.mk
include analysis.mk

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

.cc.o:
	$(call echoInfo,"Compiling $<")
	$(AT)$(CPP) $(CFLAGS) -c $< -o $(<:.cc=.o)

# print: ctrl_print drivers_print pss_print rrs_print
print: ctrl_print
	echo Drivers Target  $(DRVRS_TARGET)
	$(call echoDone,"Root Path $(PROJECT_ROOT_PATH)")

all: ctrl pss rrs

clean ::
	@$(PRINT) "Cleaning done.. $@\n"

amit:
	echo CFLAGS $(CFLAGS)
	echo PSS $(PSS_PRE_PROCESSOR_FLAG)

setuid:
	chmod +s $(CTRL_TARGET)
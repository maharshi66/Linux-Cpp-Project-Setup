APPLICATION_SRC_PATH = $(APPLICATION_PATH)
APPLICATION_TARGET = $(PROJECT_BIN_PATH)/application.exe

APPLICATION_CPPSRCS =  $(APPLICATION_PATH)/
APPLICATION_CPPSRCS += 

APPLICATION_CSRCS =   $(CMN_SRC_PATH)/
APPLICATION_CSRCS +=  

APPLICATION_INCLUDEPATH = 
APPLICATION_INCLUDEPATH += $(APPLICATION_PATH)/

#-lrt for mqueue
APPLICATION_DYN_LIBS = rt
APPLICATION_DYN_LIBS += pthread
APPLICATION_DYN_LIBS += m

# APPLICATION_STATIC_LIBS = $(addprefix -l,$(DRVRS_LIB))

override INCLUDES += $(addprefix -I,$(APPLICATION_INCLUDEPATH))

APPLICATION_OPTIMIZATION = 0
APPLICATION_OFLAGS = -O$(APPLICATION_OPTIMIZATION)

APPLICATION_LFLAGS = $(APPLICATION_OFLAGS)
APPLICATION_LFLAGS += -L$(PROJECT_LIB_PATH) $(APPLICATION_STATIC_LIBS)
APPLICATION_LFLAGS += $(addprefix -l,$(APPLICATION_DYN_LIBS))

APPLICATION_OBJECTS =
# APPLICATION_OBJECTS += $(APPLICATION_CSRCS:.c=.o)
APPLICATION_OBJECTS += $(APPLICATION_CSRCS:.c=.o)
APPLICATION_OBJECTS += $(APPLICATION_CPPSRCS:.cc=.o)

$(APPLICATION_TARGET): $(APPLICATION_OBJECTS) 
	$(call echoInfo,"Linking.. $@\n")
	$(AT)$(CPP) $(APPLICATION_OBJECTS) $(APPLICATION_CFLAGS) $(APPLICATION_LFLAGS) -o $@
	echoDone,"\nBuild successfully: o\n")

clean ::
	$(RM) $(APPLICATION_TARGET)
	$(RM) $(APPLICATION_OBJECTS)
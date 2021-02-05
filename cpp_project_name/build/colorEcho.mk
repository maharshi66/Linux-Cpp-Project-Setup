
# Color       #define       Value
# black     COLOR_BLACK       0
# red       COLOR_RED         1
# green     COLOR_GREEN       2
# yellow    COLOR_YELLOW      3
# blue      COLOR_BLUE        4
# magenta   COLOR_MAGENTA     5
# cyan      COLOR_CYAN        6
# white     COLOR_WHITE       7

define echoInfo
	@tput setaf 6
	@echo $1
	@tput sgr0
endef

define echoError
	@tput setaf 1
	@echo $1
	@tput sgr0
endef

define echoWarning
	@tput setaf 3
	@echo $1
	@tput sgr0
endef

define echoDone
	@tput setaf 2
	@echo $1
	@tput sgr0
endef

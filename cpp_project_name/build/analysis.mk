CPPCHECK = cpp check

CPPCHECK_SUPRESS := 
CPPCHECK_SUPRESS += missingIncludeSystem
CPPCHECK_SUPRESS += unusedFunction
CPPCHECK_SUPRESSFLAG = $(patsubst %,--suppress=%,$(CPPCHECK_SUPRESS))

CPPCHECK_INCLUDE_PATH :=
CPPCHECK_INCLUDE_PATH += $(CTRL_INCLUDEPATH)
CPPCHECK_INCLUDE_PATH += $(DRVRS_INCLUDEPATH)
CPPCHECK_INCLUDE_FLAG = $(patsubst %,-I%,$(CPPCHECK_INCLUDE_PATH))

PROJECT_ROOT_PATH = $(dir $(shell pwd))
PROJECT_ANALYSIS_PATH = $(PROJECT_ROOT_PATH)analysis

CPP_CHECK_ANALYSIS_PATH = $(PROJECT_ANALYSIS_PATH)/cppCheck
CPP_CHECK_RESULT_DIR = $(CPP_CHECK_ANALYSIS_PATH)/result
CPP_CHECK_RESULT_FILE = $(CPP_CHECK_RESULT_DIR)/cppCheckResults.xml

# ########################################################
# cppCheck
# ########################################################

beforeScriptCC:
	chmod +x $(CPP_CHECK_ANALYSIS_PATH)/beforeScript.sh
	sh $(CPP_CHECK_ANALYSIS_PATH)/beforeScript.sh

analysisCppCheck:
	@$(PRINT) "Running Analysis with CppCheck on $(PROJECT_SRC_PATH)"
	rm -rf  $(CPP_CHECK_RESULT_DIR)
	mkdir -p $(CPP_CHECK_RESULT_DIR)
	@$(PRINT) "Analysis with CppCheck results can be found at $(CPP_CHECK_RESULT_FILE)"
	$(CPPCHECK) --report-progress --platform=unix64 $(CPPCHECK_SUPRESSFLAG) \
	--error-exitcode=1 --enable=all --xml-version=2 $(CPPCHECK_INCLUDE_FLAG) \
	--xml $(PROJECT_SRC_PATH)/ > $(CPP_CHECK_RESULT_FILE) 2>&1

genCCHtml:
	cppcheck-htmlreport  --file=$(CPP_CHECK_RESULT_FILE) --source-dir=$(PROJECT_SRC_PATH) --report-dir=$(CPP_CHECK_RESULT_DIR)

# ########################################################
# cccc
# ########################################################

CCCC_ANALYSIS_PATH 	= $(PROJECT_ANALYSIS_PATH)/cccc
CCCC_RESULT_DIR 	= $(CCCC_ANALYSIS_PATH)/result
CCCC_RESULT_FILE 	= $(CCCC_RESULT_DIR)/ccccResults

beforeScriptCCCC:
	chmod +x $(CCCC_ANALYSIS_PATH)/beforeScript.sh
	sh $(CCCC_ANALYSIS_PATH)/beforeScript.sh

analysisCCCC:
	@$(PRINT) "Running Analysis with cccc on $(PROJECT_SRC_PATH)"
	rm -rf   $(CCCC_RESULT_DIR)
	mkdir -p $(CCCC_RESULT_DIR)

	@$(PRINT) "Analysis with cccc results can be found at $(CCCC_RESULT_FILE).xml & $(CCCC_RESULT_FILE).html"
	cccc --outdir=$(CCCC_RESULT_DIR) --xml_outfile=$(CCCC_RESULT_FILE).xml  --html_outfile=$(CCCC_RESULT_FILE).html --lang=c++ $(CCCC_CPP_FILES) $(CCCC_C_FILES)

parseCCCCxml:
	python3 $(CCCC_ANALYSIS_PATH)/ccccXMLParser.py $(CCCC_RESULT_FILE).xml

PROJECT_NAME     := template
TARGETS          := app_main app_test
OUTPUT_DIRECTORY := _build

# For cross platform
# GNU_INSTALL_ROOT := 
# GNU_PREFIX := 

PROJ_DIR := .

APP_MAIN_DIR  :=$(PROJ_DIR)/src/app_main
APP_MAIN_SRCS := $(wildcard $(APP_MAIN_DIR)/*.c)

APP_TEST_DIR  :=$(PROJ_DIR)/src/app_test
APP_TEST_SRCS := $(wildcard $(APP_TEST_DIR)/*.c)

# Source files common to all targets
SRC_FILES += \

# Source files app_main target
SRC_FILES_app_main += \
	$(APP_MAIN_SRCS)

# Source files app_main target
SRC_FILES_app_test += \
	$(APP_TEST_SRCS)

# Include folders common to all targets
INC_FOLDERS +=  \

# Include folders app_main target
INC_FOLDERS_app_main += \
	$(APP_MAIN_DIR)

# Include folders app_test target
INC_FOLDERS_app_test += \
	$(APP_TEST_DIR)

# Libraries common to all targets
LIB_FILES += \

# Optimization flags
OPT = -O3 -g3
# Uncomment the line below to enable link time optimization
# OPT += -flto

# C flags common to all targets
CFLAGS += $(OPT)
CFLAGS += -Wall -Werror

# C++ flags common to all targets
CXXFLAGS += $(OPT)

# Assembler flags common to all targets
ASMFLAGS += -g3

# Linker flags
LDFLAGS += $(OPT)

app_test: CFLAGS += -DDEBUG

# Add standard libraries at the very end of the linker input, after all objects
# that may need symbols provided by these libraries.
LIB_FILES += 

.PHONY: default help

# Default target - first one defined
default: $(TARGETS)

# Print all targets that can be built
help:
	@echo following targets are available:
	@echo		$(TARGETS)

TEMPLATE_PATH := $(PROJ_DIR)/toolchain

include $(TEMPLATE_PATH)/Makefile.common

$(foreach target, $(TARGETS), $(call define_target, $(target)))

# default: all


all: compile_vpp execute_vpp

ROOT = $(abspath .)
CSRCS = $(shell find $(ROOT)/csrc -name "*.c" -o -name "*.cpp" -o -name "*.cc")
VSRCS = $(shell find $(ROOT)/vsrc -name "*.v" -o -name "*.sv")

VERILATOR_FLAGS = -Wall --cc --exe --build --trace -O2 -Ivsrc
CFLAGS += -I$(ROOT)/csrc -I$(ROOT)/csrc/include

# the name of the "top" module
TOPNAME = i2c_top

BUILD_DIR = $(ROOT)/build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/V$(TOPNAME)
$(shell mkdir -p $(BUILD_DIR))

# all: $(BIN)

$(BIN): $(CSRCS) $(VSRCS)
	@verilator $(VERILATOR_FLAGS) \
		--top-module $(TOPNAME) $^ \
		$(addprefix -CFLAGS , $(CFLAGS)) \
		$(addprefix -LDFLAGS , $(LDFLAGS)) \
		-o $(abspath $(BIN)) --Mdir $(OBJ_DIR)

run: $(BIN) $(IMG)
	@ARCH=$(ARCH) $(BIN) --debug $(IMG)

clean:
	@$(RM) -rf $(BUILD_DIR)


# Define default values for parameters
MODULE_NAME ?= default_module # Module name
VSRCDIR = $(ROOT)/vsrc        # Verilog source directory
TESTDIR = $(ROOT)/test        # Test directory

TBFILE = $(shell find $(ROOT)/test/$(MODULE_NAME) -name "$(MODULE_NAME)_tb.v") # Testbench file

VPPFILE = $(ROOT)/test/$(MODULE_NAME)/$(MODULE_NAME).vpp

# File paths
VSRCDIR = $(ROOT)/vsrc
TESTDIR = $(ROOT)/test

# Support for multiple module names
MODULES := $(MODULE_NAME)
VFILES = $(addprefix $(VSRCDIR)/, $(addsuffix .v, $(MODULES)))
TBFILES = $(addprefix $(TESTDIR)/, $(addsuffix /$(MODULES)_tb.v, $(MODULES)))
VPPFILES = $(addprefix $(TESTDIR)/, $(addsuffix /$(MODULES).vpp, $(MODULES)))

all: compile_vpp execute_vpp

# Compile the Verilog module and testbench to a VPP file
compile_vpp: $(VFILES) $(TBFILES)
	@echo "Compiling Verilog files and creating VPP..."
	# Assuming you have a tool to compile VPP, e.g., `vcs` or another simulator
	# Replace `vcs` with your tool for compiling Verilog
	@for module in $(MODULES); do \
		echo "Compiling Verilog files for module $$module"; \
		iverilog -g relative-include $(VSRCDIR)/$$module.v $(TESTDIR)/$$module/$$module_tb.v -o $(TESTDIR)/$$module/$$module.vpp; \
	done

# Execute the compiled VPP file
execute_vpp: $(VPPFILES)
	@echo "Executing VPP files..."
	# Assuming you run the simulation with the compiled VPP files
	@for module in $(MODULES); do \
		echo "Running simulation for $$module"; \
		vvp $(TESTDIR)/$$module/$$module.vpp; \
	done

# Display the parameters being used
show_params:
	@echo "Module Names: $(MODULES)"
	@echo "Verilog Source Directory: $(VSRCDIR)"
	@echo "Test Directory: $(TESTDIR)"
	@echo "Verilog Files: $(VFILES)"
	@echo "Testbench Files: $(TBFILES)"
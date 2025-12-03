# Build `program` from sources in `src/` and place outputs in `out/`.
CXX := g++
CC  := gcc

# Directories
SRC_DIR := src
OUT_DIR := out

# Debug-friendly flags for stepping in VS Code/GDB
CXXFLAGS := -g -O0 -fno-omit-frame-pointer -Wall -std=c++17
ASFLAGS  := -g

# Sources discovered under src/
CPP_SRCS := $(wildcard $(SRC_DIR)/*.cpp)
ASM_SRCS := $(wildcard $(SRC_DIR)/*.S) $(wildcard $(SRC_DIR)/*.s)

# Object files will live in out/ with same basename
CPP_OBJS := $(CPP_SRCS:$(SRC_DIR)/%.cpp=$(OUT_DIR)/%.o)
ASM_OBJS := $(ASM_SRCS:$(SRC_DIR)/%.S=$(OUT_DIR)/%.o)
ASM_OBJS := $(ASM_OBJS:$(SRC_DIR)/%.s=$(OUT_DIR)/%.o)

TARGET := $(OUT_DIR)/program

all: $(TARGET)

# Link step: link all object files into the final binary using the C++ linker
$(TARGET): $(CPP_OBJS) $(ASM_OBJS)
	@mkdir -p $(OUT_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile C++ sources to object files in out/
$(OUT_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OUT_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Assemble GAS assembly (.S and .s) into object files in out/ using gcc (as)
$(OUT_DIR)/%.o: $(SRC_DIR)/%.S
	@mkdir -p $(OUT_DIR)
	$(CC) $(ASFLAGS) -c -o $@ $<
$(OUT_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OUT_DIR)
	$(CC) $(ASFLAGS) -c -o $@ $<

# Run with runtime args: make run ARGS="arg1 arg2"
run: $(TARGET)
	$(TARGET) $(ARGS)

clean:
	rm -rf $(OUT_DIR)

.PHONY: all run clean
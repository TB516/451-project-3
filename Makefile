# Makefile: build `program` from program.cpp and any NASM .asm files.
# - Debug-friendly flags (-g -O0) so you can step through in VS Code/gdb.
# - Assemble .asm files (NASM) into .o and link with the C++ program.

CXX := g++
NASM := nasm

# Debug flags for C++ and NASM (DWARF)
CXXFLAGS := -g -O0 -fno-omit-frame-pointer -Wall -std=c++17
NASMFLAGS := -f elf64 -g -F dwarf

ASM_SRCS := $(wildcard *.asm)
ASM_OBJS := $(ASM_SRCS:.asm=.o)

all: program

program: $(ASM_OBJS) program.cpp
	$(CXX) $(CXXFLAGS) -o $@ program.cpp $(ASM_OBJS)

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

run: program
	./program $(ARGS)

clean:
	rm -f program $(ASM_OBJS)

.PHONY: all run clean

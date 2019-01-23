# SLAE

This repo is to track my progress through the SLAE 32 bit certification.

# Useful commands:

# Compile .asm files
nasm -f elf32 -o file.o file.asm -- Create an object file (32bit) from .asm file

ld -o file file.o -- link the object file to a binary



# Basic Stuff

db == byte (0x00)
dw == word (0x000)
dd == double word (0x00000000)

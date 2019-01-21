# SLAE

This repo is to track my progress through the SLAE 32 bit certification.

Useful commands:

# Compile .asm files
nasm -f elf32 -o file.o <file>.asm -- Create an object file (32bit) from .asm file

ld -o <file> <file>.o -- link the object file to a binary

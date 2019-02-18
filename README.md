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


Find what a variable's value is: 

x/x[b,h,w] &*variable_name*
x/x[b,h,w] *memory address of variable*
<<<<<<< HEAD
=======

# Getting Shellcode from objdump

objdump -d ./PROGRAM|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
>>>>>>> 0ac521f77c6da238b56ad1ed99102062c8a36fba

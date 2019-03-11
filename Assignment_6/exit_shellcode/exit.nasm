global _start

section .text

_start:

	inc eax
	mov ebx, 23
	int 0x80

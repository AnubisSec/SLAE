global _start

section .text

_start:

	mov al, 37
	mov ebx, 0
	sub ebx, 1
	mov ecx, 8
	int 0x80

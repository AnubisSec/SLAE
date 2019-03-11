global _start

section .text


_start:

	mov al, 0x24
	int 0x80
	xor eax, eax
	mov al, 0x58
	mov ebx, 0xfee1dead
	mov ecx, 0x28121969
	mov edx, 0x1234567
	int 0x80
	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	int 0x80

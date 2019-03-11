; Author: Anubis
; SLAE

global _start

section .text

_start:

	xor ebx, ebx ; Used ebx instead of eax
	push ebx
	push 0x68732f2f
	push 0x6e69622f
	mov ebx, esp ; After this line, no need to zero out any othe registers
	mov al, 11 ; Ascii number instead of hex
	int 0x80
	mov al, 1
	int 0x80

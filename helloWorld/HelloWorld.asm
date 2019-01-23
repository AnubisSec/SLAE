; HelloWorld.asm
; Author: Dylan Makowski


; Defines "_start" as the starting point
global _start


section .text

; Starting point
_start: 

	mov eax, 0x4 ; Setting EAX to system number 4 (write)
	mov ebx, 0x1 ; Setting file descriptor to stdout
	mov ecx, message ; Setting the buffer containing what to write to the message declared below
	mov edx, mlen ; Setting the length of what to print ("Hello World")
	int 0x80 ; Issue the system call

	mov eax, 0x1 ; Setting EAC to system number 1 (exit)
	mov ebx, 0x5 ; Returns the value 5
	int 0x80 ; Issue the system call
	

section .data


	message: db "Hello World!"
	mlen equ $-message ; Way to define the length of the buffer being printed to the screen














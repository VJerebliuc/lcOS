PrintString:
	mov ah, 0x0e
	.Loop:
		cmp [si], byte 0x00
		je .Exit
		mov al, [si]
		int 0x10
		inc si
		jmp .Loop
	.Exit:
	ret
	
GetChar:
	mov ax, 0x00
	int 0x16
	ret

ClearScreen:
	mov ax, 0x03
	int 0x10
	ret
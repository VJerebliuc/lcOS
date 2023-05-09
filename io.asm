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

ReadString:
	jmp Loop
	Loop:
		call GetChar
		cmp al, 0x0d
		je enter
		cmp al, 0x08
		je backspace
		cmp al, 0x03
		je escape
		mov ah, 0x0e
		int 0x10
		jmp Loop
	Exit:
	ret

enter:
	mov si, nl
	call PrintString
	jmp Loop
backspace:
	mov ah, 0x0e
	mov al, 0x08
	int 0x10
	mov al, ' '
	int 0x10
	mov al, 0x08
	int 0x10
	jmp Loop
escape:
	jmp Exit

nl:
	db 0x0d,0x0a, 0x00
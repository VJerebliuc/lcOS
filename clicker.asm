RunClicker:
	call EnableTextMode
	mov si, ClickerHelp
	call PrintString
	call GetChar
	cmp al, 0x03
	je .Exit
	call ClearScreen

	mov si, Zero_msg
	call PrintString

	mov ax, 0

	.Game:
		push ax
		call GetChar
		cmp al, 0x03
		mov ah, 0x86
		mov cx, 0x01
		int 0x15
		pop ax
		je .Exit
		inc ax
		push ax
		call ClearScreen
		pop ax
		push ax
		call IntToStr
		call PrintString
		pop ax
		jmp .Game

	.Exit:
	mov di, 5
	call Draw_headbar
	ret

ClickerHelp:
	db 'Clicker 1.1. Press Ctrl+C to exit. Press any to start...', 0x00

Zero_msg:
	db '0',0x00
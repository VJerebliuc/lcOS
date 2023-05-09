RunDisplayTest:
	call EnableTextMode
	mov si, First_help
	call PrintString
	call GetChar
	cmp al, 0x03
	je .Exit
	call EnableVideoMode

	call ClearScreen
	mov al, WHITE
	call FillScreen
	mov bl, WHITE
	mov si, White_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, BLUE
	call FillScreen
	mov bl, WHITE
	mov si, Blue_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, DARK_RED
	call FillScreen
	mov bl, WHITE
	mov si, Dark_red_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, YELLOW
	call FillScreen
	mov bl, WHITE
	mov si, Yellow_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, ORANGE
	call FillScreen
	mov bl, WHITE
	mov si, Orange_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, MAGENTA
	call FillScreen
	mov bl, WHITE
	mov si, Magenta_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, VIOLET
	call FillScreen
	mov bl, WHITE
	mov si, Violet_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, GREEN
	call FillScreen
	mov bl, WHITE
	mov si, Green_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, CYAN
	call FillScreen
	mov bl, WHITE
	mov si, Cyan_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, DARK_BLUE
	call FillScreen
	mov bl, WHITE
	mov si, Dark_blue_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	call ClearScreen
	mov al, BLACK
	call FillScreen
	mov bl, WHITE
	mov si, Black_text
	call PrintString
	mov ah, 0x86
	mov cx, 0x10
	int 0x15
	.Exit:
	cmp [MinimalMode], byte 0x01
	je .FastExit
	mov di, 2
	call Draw_headbar
	.FastExit:
	ret

White_text:
	db 'White', 0x00

Blue_text:
	db 'Blue', 0x00

Dark_red_text:
	db 'Red', 0x00

Yellow_text:
	db 'Yellow', 0x00

Orange_text:
	db 'Orange', 0x00

Magenta_text:
	db 'Magenta', 0x00

Violet_text:
	db 'Violet', 0x00

Green_text:
	db 'Green', 0x00

Cyan_text:
	db 'Cyan', 0x00
	
Dark_blue_text:
	db 'Dark blue', 0x00

Black_text:
	db 'Black', 0x00

First_help:
	db 'Display test 1.1. You should compare the text and color on the screen.          Press Ctrl+C to exit. Press any key to start...', 0x00
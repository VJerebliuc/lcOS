SCREEN_WIDTH equ 320
SCREEN_HEIGHT equ 200

EnableVideoMode:
	mov ax, 0x13
	int 0x10
	ret

EnableTextMode:
	mov ax, 0x03
	int 0x10
	ret

ClearScreen:
	call EnableTextMode
	call EnableVideoMode
	ret

FillScreen:
	mov ah, 0x0c
	mov cx, 0
	mov dx, -1
	.Loop1:
		inc dx
		cmp dx, SCREEN_HEIGHT
		je .Exit
		mov cx, 0
		.Loop2:
			int 0x10
			cmp cx, SCREEN_WIDTH
			je .Loop1
			inc cx
			jmp .Loop2
	.Exit:
	ret

%include "colors.asm"
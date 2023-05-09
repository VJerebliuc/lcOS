RunNotepad:
	call EnableTextMode
	mov si, Help_text
	call PrintString
	call ReadString
	cmp [MinimalMode], byte 0x01
	je .Exit
	mov di, 2
	call Draw_headbar
	.Exit:
	ret

Help_text:
	db 'Notepad 1.1. Press Ctrl+C to exit.', 0x0a, 0x0d, 0x00
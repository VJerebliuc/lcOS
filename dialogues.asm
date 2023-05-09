SetUp:
	cmp [First_start], byte 0x01
	je FirstStart
	mov [First_start], byte 0x00
	mov si, Welcome_dialog
	call PrintString
	call GetChar
	cmp al, 0x0d
	je Ready
	jne Shutdown_jmp
	ret

FirstStart:
	mov [First_start], byte 0x00
	mov si, First_Welcome_dialog
	call PrintString
	call GetChar
	cmp al, 0x0d
	je Ready
	jne Shutdown_jmp

Ready:
	call ClearScreen
	mov si, Ready_dialog
	call PrintString
	call SaveToHDD
	call GetChar
	call Draw_headbar
	jmp main	

First_Welcome_dialog:
	db 'Hello! I am computer and i want to get  to know you. Do you want? If you want   press Enter.', 0x00

Welcome_dialog:
	db 'Hello again! Glad to see you ',0x03,'.         Press Enter to continue.', 0x00

Ready_dialog:
	db 'Okay! Lets start! ', 0x03, 0x00
SetUp:
	cmp [First_start], byte 0x01
	je FirstStart
	mov [First_start], byte 0x00
	mov si, Welcome_dialog
	call PrintString
	call GetChar
	jmp AlmostMain
	ret

FirstStart:
	mov [First_start], byte 0x00
	mov si, First_Welcome_dialog
	call PrintString
	call GetChar
	call RunColorSettings
	mov bl, [Headbar_Color]
	jmp Ready

Ready:
	call ClearScreen
	mov si, Ready_dialog
	call PrintString
	call SaveToHDD
	call GetChar
	jmp AlmostMain
	
AlmostMain:
	call Draw_headbar
	jmp main	

First_Welcome_dialog:
	db 'Welcome to lcOS! Lets set it up. Please select a color.', 0x00

Welcome_dialog:
	db 'Welcome back!', 0x00

Ready_dialog:
	db 'All is ready. Lets start!', 0x00
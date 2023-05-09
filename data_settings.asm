RunSaveDataSetting:
	call ClearScreen
	mov si, Save_data
	call PrintString
	mov bl, GREEN
	mov si, Data_first_answer
	call PrintString
	mov bl, DARK_RED
	mov si, Data_second_answer
	call PrintString
	call GetChar
	cmp al, 49
	je AllowSaveData
	cmp al, 50
	je .DontAllowSaveData
	.DontAllowSaveData:
		mov [SaveData], byte 0x00
		jmp DataExit
	DataExit:
	mov di, 8
	call Draw_headbar
	ret

AllowSaveData:
	mov [SaveData], byte 0x01
	call SaveToHDD
	jmp DataExit

RunEraseDataSetting:
	call ClearScreen
	mov si, Erase_data
	call PrintString
	mov bl, GREEN
	mov si, Data_first_answer
	call PrintString
	mov bl, DARK_RED
	mov si, Data_second_answer
	call PrintString
	call GetChar
	cmp al, 49
	je .EraseData
	cmp al, 50
	je .Exit
	.EraseData:
		mov bl, WHITE
		mov [Headbar_Color], bl
		mov [First_start], byte 0x01
		call SaveToHDD
		mov bl, WHITE
		mov si, 0x00
		jmp 0x7e00
		jmp .Exit
	.Exit:
	mov di, 8
	call Draw_headbar
	ret

Save_data:
	db 'Allow me save data?', 0x0d,0x0a,0x0a,0x00

Data_first_answer:
	db '1-Yes', 0x0d, 0x0a,0x0a, 0x00

Data_second_answer:
	db '2-No', 0x0d,0x0a,0x00

Erase_data:
	db 'Do you really want to erase your data?', 0x0d,0x0a,0x0a,0x00
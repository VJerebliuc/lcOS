Draw_headbar:
	call ClearScreen
	mov bl, [Headbar_Color]
	cmp di, 0
	je .Draw_first
	cmp di, 1
	je .Draw_second
	cmp di, 2
	je .Draw_utils
	cmp di, 4
	je .Draw_power
	cmp di, 5
	je .Draw_games
	cmp di, 6
	je .Draw_third
	cmp di, 7
	je .Draw_settings
	cmp di, 8
	je .Draw_data_settings
	cmp di, 9
	je .Draw_about_settings
	.Draw_first:
		mov si, First_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_second:
		mov si, Second_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_third:
		mov si, Third_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_utils:
		mov si, Utils_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_power:
		mov si, Power_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_games:
		mov si, Games_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_settings:
		mov si, Settings_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_data_settings:
		mov si, Data_settings_Items_str
		call PrintString
		jmp .hb_Exit
	.Draw_about_settings:
		mov si, About_settings_Items_str
		call PrintString
		mov si, KERNEL_VER
		call PrintString
		jmp .hb_Exit
	.hb_Exit:
	ret

Process_input:
	call GetChar
	cmp di, 0
	je CheckFirst
	cmp di, 1
	je CheckSecond
	cmp di, 2
	je CheckUtils
	cmp di, 4
	je CheckPower
	cmp di, 5
	je CheckGames
	cmp di, 6
	je CheckThird
	cmp di, 7
	je CheckSettings
	cmp di, 8
	je CheckDataSettings
	cmp di, 9
	je CheckAboutSettings
	
	chk_Exit:
	ret

CheckFirst:
	cmp al, 49
	je Power_jmp
	cmp al, 50
	je Second_jmp
	jmp chk_Exit

CheckSecond:
	cmp al, 51
	je First_jmp
	cmp al, 52
	je Clear_jmp
	cmp al, 53
	je Utils_jmp
	cmp al, 54
	je Games_jmp
	cmp al, 55
	je Third_jmp
	jmp chk_Exit

CheckThird:
	cmp al, 56
	je Second_jmp
	cmp al, 57
	je Settings_jmp
	jmp chk_Exit

CheckUtils:
	cmp al, 49
	je Second_jmp
	cmp al, 50
	je Notepad_jmp
	cmp al, 51
	je Display_test_jmp
	jmp chk_Exit

CheckPower:
	cmp al, 49
	je First_jmp
	cmp al, 50
	je Reboot_jmp
	cmp al, 51
	je Shutdown_jmp
	jmp chk_Exit

CheckGames:
	cmp al, 49
	je Second_jmp
	cmp al, 50
	je Clicker_jmp
	;cmp al, 51
	;je TicTacToe_jmp
	jmp chk_Exit

CheckSettings:
	cmp al, 49
	je Third_jmp
	cmp al, 50
	je Color_Settings_jmp
	cmp al, 51
	je Data_Settings_jmp
	cmp al, 52
	je About_setting_jmp
	jmp chk_Exit

CheckDataSettings:
	cmp al, 49
	je Settings_jmp
	cmp al, 50
	je Save_data_setting_jmp
	cmp al, 51
	je Erase_data_setting_jmp
	jmp chk_Exit

CheckAboutSettings:
	cmp al, 49
	je Settings_jmp
	jmp chk_Exit

%include "headbar_items.asm"
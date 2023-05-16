First_Items_str:
	db '1-Power, 2-Next', 0

Second_Items_str:
	db '3-Previous, 4-Clear, 5-Utils, 6-Games,  7-Next', 0

Third_Items_str:
	db '8-Previous, 9-Settings', 0

Utils_Items_str:
	db '1-Back, 2-Notepad, 3-Display test', 0

Power_Items_str:
	db '1-Back, 2-Reboot, 3-Shutdown', 0

Games_Items_str:
	db '1-Back, 2-Clicker', 0

Settings_Items_str:
	db '1-Back, 2-Color, 3-Data, 4-About', 0

Data_settings_Items_str:
	db '1-Back, 2-Save Data, 3-Erase Data', 0

About_settings_Items_str:
	db '1-Back, ',0

Reboot_jmp:
	call ClearScreen
	mov si, Goodbye
	call PrintString
	call GetChar
	call Reboot
	jmp main

Shutdown_jmp:
	call ClearScreen
	mov si, Goodbye
	call PrintString
	call GetChar
	call Shutdown
	jmp main

First_jmp:
	mov di, 0
	call Draw_headbar
	jmp main

Second_jmp:
	mov di, 1
	call Draw_headbar
	jmp main

Third_jmp:
	mov di, 6
	call Draw_headbar
	jmp main

Utils_jmp:
	mov di, 2
	call Draw_headbar
	jmp main

Clear_jmp:
	call Draw_headbar
	jmp main

Power_jmp:
	mov di, 4
	call Draw_headbar
	jmp main

Games_jmp:
	mov di, 5
	call Draw_headbar
	jmp main

Settings_jmp:
	mov di, 7
	call Draw_headbar
	jmp main

Notepad_jmp:
	call RunNotepad
	jmp main

Color_Settings_jmp:
	call RunColorSettings
	call Draw_headbar
	jmp main

Display_test_jmp:
	call RunDisplayTest
	jmp main

Clicker_jmp:
	call RunClicker
	jmp main

Data_Settings_jmp:
	mov di, 8
	call Draw_headbar
	jmp main

Save_data_setting_jmp:
	call RunSaveDataSetting
	jmp main

Erase_data_setting_jmp:
	call RunEraseDataSetting
	jmp main

About_setting_jmp:
	mov di, 9
	call Draw_headbar
	jmp main

;TicTacToe_jmp:
;	call RunTicTacToe
;	jmp main
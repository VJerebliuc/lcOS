variants_of_actions:
	db '1-Reboot',0x0a,0x0d,'2-Shutdown',0x0a,0x0d,'3-Redraw Display',0x0a,0x0d,'4-Display Test',0x0a,0x0d,'5-Notepad', 0x00

min_input:
	db 0x0a,0x0d,0x0a,'Choose: ',0x00

MiniReboot_jmp:
	call Reboot
	jmp minimal_main

MiniShutdown_jmp:
	call Shutdown
	jmp minimal_main

MiniClear_jmp:
	call ClearScreen
	call EnableTextMode
	jmp minimal_main

MiniDisplayTest_jmp:
	call RunDisplayTest
	jmp minimal_main

MiniNotepad_jmp:
	call RunNotepad
	jmp minimal_main
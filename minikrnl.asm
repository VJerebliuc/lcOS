minimal_main:
	call Draw_actions
	call Process_mini_input
	jmp minimal_main

MINIKRNL_VER:
	db 'lcOS kernel minimal mode version 1.0.',0x0a,0x0d,0x0a,0x00

%include "actions.asm"
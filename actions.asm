Draw_actions:
	call ClearScreen
	call EnableTextMode

	mov si, MINIKRNL_VER
	call PrintString

	mov si, variants_of_actions
	call PrintString

	mov si, min_input
	call PrintString
	ret

Process_mini_input:
	call GetChar

	cmp al, 49
	je MiniReboot_jmp
	cmp al, 50
	je MiniShutdown_jmp
	cmp al, 51
	je MiniClear_jmp
	cmp al, 52
	je MiniDisplayTest_jmp
	cmp al, 53
	je MiniNotepad_jmp

	mini_chk_exit:
	ret

%include "actions_items.asm"
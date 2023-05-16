RunColorSettings:
	call ClearScreen
	mov si, table_first
	mov bl, WHITE
	call PrintString
	mov si, table_second
	mov bl, BLUE
	call PrintString
	mov si, table_third
	mov bl, DARK_RED
	call PrintString
	mov si, table_fourth
	mov bl, YELLOW
	call PrintString
	mov si, table_fifth
	mov bl, ORANGE
	call PrintString
	mov si, table_sixth
	mov bl, MAGENTA
	call PrintString
	mov si, table_seventh
	mov bl, VIOLET
	call PrintString
	mov si, table_eighth
	mov bl, GREEN
	call PrintString
	mov si, table_nineth
	mov bl, CYAN
	call PrintString
	mov si, table_tenth
	mov bl, PINK
	call PrintString
	mov bl, WHITE

	call GetChar

	cmp al, 49
	je switch_to_white
	cmp al, 50
	je switch_to_blue
	cmp al, 51
	je switch_to_red
	cmp al, 52
	je switch_to_yellow
	cmp al, 53
	je switch_to_orange
	cmp al, 54
	je switch_to_magenta
	cmp al, 55
	je switch_to_violet
	cmp al, 56
	je switch_to_green
	cmp al, 57
	je switch_to_cyan
	cmp al, 48
	je switch_to_pink

	jmp cs_Exit
	
	cs_Exit:
	mov [Headbar_Color], bl
	call SaveToHDD
	ret

switch_to_white:
	mov bl, WHITE
	jmp cs_Exit

switch_to_blue:
	mov bl, BLUE
	jmp cs_Exit

switch_to_red:
	mov bl, DARK_RED
	jmp cs_Exit

switch_to_yellow:
	mov bl, YELLOW
	jmp cs_Exit
	
switch_to_orange:
	mov bl, ORANGE
	jmp cs_Exit

switch_to_magenta:
	mov bl, MAGENTA
	jmp cs_Exit

switch_to_violet:
	mov bl, VIOLET
	jmp cs_Exit

switch_to_green:
	mov bl, GREEN
	jmp cs_Exit

switch_to_cyan:
	mov bl, CYAN
	jmp cs_Exit

switch_to_pink:
	mov bl, PINK
	jmp cs_Exit


table_first:
	db '1-White', 0x0a, 0x0d,0x00

table_second:
	db '2-Blue', 0x0a,0x0d,0x00

table_third:
	db '3-Red', 0x0a,0x0d, 0x00

table_fourth:
	db '4-Yellow', 0x0a,0x0d,0x00

table_fifth:
	db '5-Orange', 0x0a,0x0d,0x00

table_sixth:
	db '6-Magenta', 0x0a,0x0d,0x00

table_seventh:
	db '7-Violet', 0x0a,0x0d,0x00

table_eighth:
	db '8-Green', 0x0a,0x0d,0x00

table_nineth:
	db '9-Cyan', 0x0a,0x0d,0x00

table_tenth:
	db '0-Pink', 0x0a,0x0d, 0x00
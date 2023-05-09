[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

.PrepareText:
	call ClearScreen
	mov si, Bootloader_msg
	call PrintString
	mov si, Input_msg
	call PrintString

call GetChar

cmp al, 49
je .StartNormally
cmp al, 50
je .StartMinimal
cmp al, 51
je .StartReboot
cmp al, 52
je .StartShutdown

jmp .PrepareText

.StartNormally:
	call ReadKernelFromHDD
	xor si, si
	jmp 0x7e00
.StartMinimal:
	call ReadKernelFromHDD
	mov si, 0x01
	jmp 0x7e00
.StartReboot:
	call Reboot
	jmp $
.StartShutdown:
	call Shutdown
	jmp $

%include "disk.asm"
%include "mini_io.asm"
%include "mini_power.asm"

Bootloader_msg:
	db 'lcOS start settings:',0x0a,0x0d,'  1-Start lcOS normally',0x0a,0x0d,'  2-Start lcOS in minimal kernel mode',0x0a,0x0d,'  3-Reboot PC',0x0a,0x0d,'  4-Shutdown PC', 0x00

Input_msg:
	db 0x0a,0x0d,0x0a,'Choose: ', 0x00

times 510-($-$$) db 0x00

db 0x55, 0xaa
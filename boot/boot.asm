    org 0x7c00
BaseOfStack equ 0x7c00
    jmp short LABEL_START
    nop

%include "fat12hdr.inc"

LABEL_START:
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, BaseOfStack

    ;软驱复位
    xor ah, ah
    xor dl, dl
    int 0x13

    ;显示欢迎信息
    call DisplayMessage
    jmp $
DisplayMessage:
    mov ax, Message
    mov bp, ax
    mov cx, 16
    mov ax, 0x1301
    mov bx, 0x000c
    mov dl, 0
    int 0x10
    ret
Message:  db "Hello, OS world!"
times 510-($-$$) db 0
dw 0xaa55

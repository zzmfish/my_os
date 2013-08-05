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

    call Clear

    mov ax, MessageBooting
    mov bx, 11
    call DisplayString
    call NewLine

    ;软驱复位
    xor dl, dl
    int 0x13


    ; 在A盘根目录寻找loader.bin
    mov word [wSectorNo], SectorNoOfRootDir
SEARCH_ROOT_DIR:
    cmp word [wSectorNo], SectorNoOfRootDir + RootDirSectors
    jz NO_LOADER

    mov ax, word [wSectorNo]
    call DisplayNumber
    call NewLine

    add word [wSectorNo], 1
    jmp SEARCH_ROOT_DIR

NO_LOADER:
    ;显示欢迎信息
    mov ax, MessageHello
    mov bx, 16
    call DisplayString

    jmp $

;===============================================================================
; 变量
;-------------------------------------------------------------------------------
wSectorNo               dw  0               ; 扇区号


%include "display.asm"

;===============================================================================
; 字符串
;-------------------------------------------------------------------------------
MessageHello:  db   "Hello, OS world!"
MessageBooting:db   "Booting ..."
MessageDigit:  db   "0123456789"

times 510-($-$$) db 0   ; 填充剩下的空间
dw 0xaa55               ; 扇区结束标志

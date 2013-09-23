
;============================================
; 读取扇区
; 从序号ax的扇区开始读取cl个扇区到es:bx
;--------------------------------------------
ReadSector:
    ; 分配栈空间
    push bp
    mov bp, sp
    sub esp, 2

    mov byte [bp - 2], cl
    push bx

    mov bl, [BPB_SectorPerTrack]
    div bl                      ;ax/bl，余数在ah，商在al
    inc ah
    mov cl, ah                  ;扇区号
    mov dh, al
    and dh, 1                   ;磁头号
    shr al, 1
    mov ch, al                  ;柱面号
    pop bx
    mov dl, [BS_DriverNumber]   ;驱动器号
.ReadAgain:
    mov ah, 2                   ;读
    mov al, byte [bp - 2]       ;扇区数
    int 0x13
    jc .ReadAgain

    ; 恢复栈空间
    add esp, 2
    pop bp
    ; 返回
    ret



;==========================
; 显示数字
; 参数：ax：要显示的数字
;--------------------------
DisplayNumber:
    ; 保存寄存器
    push bx
    ; 求个位数和更高位数
    mov bl, 10
    div bl
    cmp al, 0
    je .displaydigit
    ; 显示更高位数
    push ax
    xor ah, ah
    call DisplayNumber
    pop ax
.displaydigit:
    ; 显示个位数
    mov al, ah
    xor ah, ah
    add ax, MessageDigit
    mov bx, 1
    call DisplayString
    ;恢复寄存器
    pop bx
    ret

;========================================
; 显示字符串
; 参数：ax，字符串地址；bx，字符串长度
;----------------------------------------
DisplayString:
    ; 保存寄存器
    push ax
    push bx
    push cx
    push dx
    push bp
    ; 显示字符串
    mov bp, ax
    mov cx, bx
    mov ax, 0x1301
    mov bx, 0x000c
    mov dh, byte [bRow]
    mov dl, byte [bColumn]
    add byte [bColumn], cl
    int 0x10
    ; 恢复寄存器
    pop bp
    pop dx
    pop cx
    pop bx
    pop ax
    ret

;=======
; 换行
;-------
NewLine:
    add byte [bRow], 1
    mov byte [bColumn], 0
    ret

;=======
; 清屏
;-------
Clear:
    push ax
    push bx
    push cx
    push dx
    mov ax, 0x0600
    mov bx, 0x0700
    mov cx, 0
    mov dx, 0x184f
    int 0x10
    pop dx
    pop cx
    pop bx
    pop ax
    ret



;=======
; 变量
;-------
bColumn                 db  0               ; 行号
bRow                    db  0               ; 列号

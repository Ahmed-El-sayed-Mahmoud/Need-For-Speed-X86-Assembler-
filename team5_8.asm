extrn powerUpBlue:byte
extrn powerUpRed:byte
extrn enablePowerUpBlue:byte
extrn enablePowerUpRed:byte
extrn username1:byte
extrn username2:byte
extrn powerUpRed:byte
extrn second:byte
extrn is_Blue_Win:byte
extrn power1:byte
extrn power2:byte
extrn power3:byte 
extrn power4:byte
extrn noPower:byte
public PowerUp
.model small
.code

PowerUp proc far 
mov ah,2h
mov bh,0h
mov dh,23d
mov dl,4d
int 10h
 
 mov ah,9h
 lea dx,username1
 int 21h
;;powerup numbers
mov ah,2h
mov bh,0h
mov dh,24d
mov dl,4d
int 10h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp enablePowerUpBlue,0
jnz power1_lable_blue
lea dx, noPower
jmp bluePower
power1_lable_blue:
cmp enablePowerUpBlue,1
jnz power2_lable_blue
lea dx, power1
jmp bluePower
power2_lable_blue:
cmp enablePowerUpBlue,2
jnz power3_lable_blue
lea dx, power2
jmp bluePower
power3_lable_blue:
cmp enablePowerUpBlue,3
jnz power4_lable_blue
lea dx, power3
jmp bluePower
power4_lable_blue:
lea dx, power4

bluePower:
mov ah,09h
 int 21h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;user two
mov ah,2h
mov bh,0h
mov dh,23d
mov dl,20d
int 10h
 
 mov ah,9h
 lea dx,username2
 int 21h

mov ah,2h
mov bh,0h
mov dh,24d
mov dl,20d
int 10h

cmp enablePowerUpRed,0
jnz power1_lable_Red
lea dx, noPower
jmp RedPower
power1_lable_Red:
cmp enablePowerUpRed,1
jnz power2_lable_Red
lea dx, power1
jmp RedPower
power2_lable_Red:
cmp enablePowerUpRed,2
jnz power3_lable_Red
lea dx, power2
jmp RedPower
power3_lable_Red:
cmp enablePowerUpRed,3
jnz power4_lable_Red
lea dx, power3
jmp RedPower
power4_lable_Red:
lea dx, power4

RedPower:
mov ah,09h
 int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;timer
mov ah,0h
mov al,second
mov dl,60d;;get minute
div dl
mov bl,ah;seconds

mov ah,2h;mov curser
mov bh,0h
mov dh,24d
mov dl,29d
int 10h
;;;print minute
mov ah,2h
 mov dl,al
 add dl,30h
 int 21h

mov ah,2h
 mov dl,':'
 int 21h
 ;;;;;;;;;;;;;;;;;;;;; print second
 mov ah,0h
mov al,bl
mov dl,10d;for print second
div dl
mov bl,ah

;;;second digit
mov ah,2h
 mov dl,al
 add dl,30h
 int 21h
 ;;;first
 mov ah,2h
 mov dl,bl
 add dl,30h
 int 21h

RET
 PowerUp endp
 end
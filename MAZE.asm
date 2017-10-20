;maze path finder -game
;created by muhammad nouman anjum   AND FARUKH ASLAM
;this game have 2 levels

.MODEL SMALL
.STACK 100H
;==============================================================================================
.DATA

welcm db "========================================",0
      db "-- MAZE PATH FINDER --",0
      db "========================================",0

nam   db "CREATED BY :-",0
      DB "BCSF11A001",0
      DB "BCSF11A007",0

prmt  DB "press any key to continue ...",0

MEN   DB "* START GAME   ",0
      DB "* INSTRUCTIONS ",0
      DB "* HIGH SCORES  ",0
      DB "* QUIT GAME    ",0

INST  DB " Find The Path With In Max Moves Given And "
      DB " Navigate With Minimum Moves To Score Extra.Use"
      DB " Arow Keys To Control Directions And "
      DB " Use 'escape key' To Quit Any Time. "

GREET DB "CONGREJULATIONS !!!",0

SCORE DB "YOUR SCORES: "

TOTAL DW '0'    ;scores for each level
POINT DW '0'    ;scores of the game

GAM  DB "* GAME OVER!!! ",0

LEVEL DB "Do You Want To play Next level?(y/n)"

CONG  DB "Thanks For Playing ",0
      db "Total Scores:",0

WRNG  DB " * Do You Want TO quit ?",0
      DB "Press Enter Key To Quit",0


bool  db 0          ;used in boundry checks

P1    DB '0'
P2    DB '0'        ;counter digite
P3    DB '0'
COUNT DW 0          ;counter max=500

Li    DB 0          ;used in checking line no
L     DB 0          ;used for checkin level number
X     DB 0          ;used in exiting from levels

;==============================================================================================

.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    CALL RESET
    CALL HEAD
    CALL NAMES
    CALL INPUT
    CALL RESET
    CALL HEAD

    mov dl, 8       ;col.
    mov dh, 10      ;row.

    cALL MENUE

    MOV AH,0        ;back to default mode
    MOV AL,3
    INT 10H

    MOV AH,4CH      ;return to dos
    INT 21H

MAIN ENDP
;--------------------------------------------
INPUT PROC
    PUSH AX
    PUSH BX
    PUSH DX

    mov bh, 0       ;current page.
    mov Dl, 33      ;col.
    mov dh, 23      ;row.

    mov ah, 02      ;changes cursor position
    int 10h

    MOV AH,0
    INT 16H         ;prompts for input

    POP DX
    POP BX
    POP AX
    RET
INPUT ENDP
;--------------------------------------------
RESET PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    mov ah,0
    mov al,1           ; changes cursor position
    int 10h

    Mov  ah, 06h       ; scroll up function id.
    mov  al, 0         ; scroll all lines!

    mov  bh, 0110000B  ; attribute for new lines.

    mov ch, 0          ; upper row.
    mov cl, 0          ; upper col.
    mov di, 30         ; rows on screen -1,
    mov dh, [di]       ; lower row (byte).
    mov di, 0          ; columns on screen,
    mov dl, [di]
    dec dl             ; lower col.
    int 10h

    POP DX
    POP CX
    POP BX
    POP AX
    RET
RESET ENDP
;--------------------------------------------
DISP PROC
    PUSH AX

    MOV ES,AX
    MOV AH,31
    DO:
    LODSB                ;diplays on ram
    STOSW
    LOOP DO

    POP AX
    RET
DISP ENDP
;-----------------------------------------
HEAD PROC
    PUSH AX
    PUSH CX

    MOV AX,0B80BH
    LEA SI,WELCM
    MOV CX,24
    CALL DISP

    MOV AX,0B817H
    LEA SI,WELCM+40
    MOV CX,24                          ;upper headings
    CALL DISP

    MOV AX,0B81EH
    LEA SI,WELCM+64
    MOV CX,24
    CALL DISP

    POP CX
    POP AX
    ret
HEAD ENDP
;-----------------------------------------
NAMES PROC
    PUSH AX
    PUSH CX

    MOV AX,0B829H
    LEA SI,nam
    MOV CX,13
    CALL DISP
                                           ;displays names

    MOV AX,0B841H
    LEA SI,nam+13
    MOV CX,32
    CALL DISP


    MOV AX,0B84CH
    LEA SI,nam+44
    MOV CX,32
    CALL DISP


    MOV AX,0B861H
    LEA SI,prmt
    MOV CX,30
    CALL DISP

    POP CX
    POP AX
    ret

NAMES ENDP
;-----------------------------------------


;--------------------------------------------
DISPLAY PROC
    PUSH AX
    PUSH CX
    PUSH DX
    PUSH BX

    D1:
    PUSH CX
    D2:
    int 10h
    INC CX
    DEC BL
    CMP BL,0       ;display  ball of order 5x5
    JNE D2

    DEC BH
    INC DX
    POP CX
    MOV BL,5
    CMP BH,0
    JNE D1

    POP BX
    POP DX
    POP CX
    POP AX
    ret
DISPLAY ENDP
;----------------------------------------
WARN PROC
    PUSH CX

    CALL RESET
    CALL HEAD

    MOV AX,0B82FH
    LEA SI,WRNG
    MOV CX,25
    CALL DISP

    MOV AX,0B868H        ;asks for exit confermation
    LEA SI,WRNG +25
    MOV CX,23
    CALL DISP

    POP CX

    RET
WARN ENDP
;-------------------------------------------
check proc
    push  bx

    MOV AH,0DH
    MOV BH,0
    INT 10H

    cmp al,10             ;reads the pixel colour to b used for boundry check
    jne ex
    mov bool,1
    ex:
    pop bx
    ret
check endp
;-------------------------------------------
LINE PROC

   CMP DX,21
   JE KL
   CMP DX,32
   JE KL
   CMP DX,43
   JE KL
   CMP DX,54
   JE KL
   CMP DX,65
   JE KL
   CMP DX,76
   JE KL
   CMP DX,87
   JE KL                         ;check these lines for skiping to next five lines
   CMP DX,98                     ;leaving horizontal coloured boundry lines
   JE KL
   CMP DX,109
   JE KL
   CMP DX,120
   JE KL
   CMP DX,131
   JE KL
   CMP DX,142
   JE KL
   CMP DX,153
   JE KL
   CMP DX,164
   JE KL
   CMP DX,175
   JE KL
   CMP DX,186
   JNE EF

   KL:
   MOV LI,1

   EF:
   RET
LINE ENDP

;----------------------------------------------
COUNTER PROC

    PUSH CX
    PUSH DX
    PUSH BX

    mov ah,2

    mov dl,P1
    int 21h
    mov dl,P2               ; counter digits display
    int 21h
    mov dl,P3
    int 21h

    mov dl,6
    mov dh,0
    mov ah,02               ;move cursor back to position
    MOV BH,0
    int 10h

    cmp P3,'9'
    je nex1

    inc  P3
    jmp sec

    nex1:
    CMP P2,'9'
    JE NEX2

    mov P3,'0'
    INC P2

    JMP SEC
    NEX2:
    INC P1
    MOV P2,'0'
    MOV P3,'0'

    sec:
    add count,1
    POP BX
    POP DX
    POP CX

    RET
COUNTER ENDP

;--------------------------------------------
GAME_OVER PROC

    CALL RESET
    CALL HEAD

    MOV AX,0B82aH
    LEA SI,GAM
    MOV CX,16
    CALL DISP                        ;displays game over mesage

    MOV AX,0B832H
    LEA SI,score
    MOV CX,14
    CALL DISP

    MOV COUNT,0
    MOV P1,'0'
    MOV P2,'0'
    MOV P3,'0'

    MOV AH,0
    INT 16H

    RET
GAME_OVER ENDP
;--------------------------------------------------
restore proc
    mov count,0
    mov p1,'0'
    mov p2,'0'
    mov p3,'0'
    call reset                        ;reset the valus for new session
    call head
    ret
restore endp
;--------------------------------------------------
Select PROC

    mov ah, 2
    mov bh, 0
    int 10h

    MOV AH,0                   ;user selections from the menue
    INT 16H

    CMP AH,1CH
    JE ENTER1

    CMP AH,72
    JE UP

    CMP AH,80
    JE DOWN

    CMP AH,01
    JNE EXIT1

    MOV DH,16
    JMP EXIT1

    ENTER1:
    CMP DH,10
    JE  STRT_GAME
    CMP DH,16
    JE  CNFRM
    CMP DH,12
    JE  INSTRUCT
    CMP DH,14
    JE  SCOR

    JMP EXIT1

    DOWN:
    CMP DH,16
    JE  EXIT1
    ADD DH,2
    JMP EXIT1


    UP:
    CMP DH,10
    JE  EXIT1
    SUB DH,2
    JMP EXIT1



    SCOR:
    CALL RESET
    CALL HEAD

    MOV AX,0B82fH
    LEA SI,SCORE
    MOV CX,12
    CALL DISP

    push ax
    push dx
    push bx
    SUB POINT,48
    mov ax,point
    mov cx,10
    cwd
    div cx
    add dx,48
    push dx
    cwd
    div cx
    add dx,48                 ;using decimal output method for displaying 2 digit total score
    push dx
    mov bh, 0    ; current page.
    mov dl, 20   ; col.
    mov dh, 11   ; row.
    mov ah, 02
    int 10h
    mov ah,2
    pop dx
    int 21h
    mov bh, 0    ; current page.
    mov dl, 21   ; col.
    mov dh, 11   ; row.
    mov ah, 02
    int 10h
    mov ah,2
    pop dx
    int 21h
    pop bx
    pop dx
    pop ax




    MOV AX,0B850H
    LEA SI,prmt
    MOV CX,30
    CALL DISP
    CALL INPUT
    add POINT,48

    JMP EXIT1

    INSTRUCT:
    CALL RESET
    CALL HEAD

    MOV AX,0B82EH
    LEA SI,INST
    MOV CX,159
    CALL DISP

    MOV AX,0B852H
    LEA SI,prmt
    MOV CX,30
    CALL DISP

    CALL input

    JMP EXIT1

    STRT_GAME:
    MOV  L,1
    CALL LEVEL1
    CALL GAME1
    MOV X,0         ;x=0 reseting exit signal
    MOV L,1         ;l=1 reset level value to 1 for 1st level


    EXIT1:


    CALL RESET
    CALL HEAD
    CALL MENUE       ;nested loops "menue->select " "select->menue"
    JMP OK

    CNFRM:
    CALL WARN
    MOV AH,0
    INT 16H
    CMP AH,1CH
    JE  OK

    JMP EXIT1

    OK:
    RET
Select ENDP
;-------------------------------------------------

KBHIT proc
    mov ah,00h
    int 16h              ;waits for user input

    cmp aH,01
    je exit

    cmp ah,72
    jz up1
    cmp ah,80
    jz down1
    cmp ah,75
    jz left
    cmp ah,77
    jz right
    JMP EXIT

    UP1:
    push dx
    sub dx,1
    call check
    cmp bool,1
    pop dx
    je exit

    MOV AX,0C00H
    call display

    DEC DX
    CALL LINE
    SUB DX,4
    CMP LI,1
    JNE EXIT
    MOV LI,0
    DEC DX
    call COUNTER
    JMP EXIT

    DOWN1:
    push dx
    add dx,5
    call check
    cmp bool,1
    pop dx
    je exit

    MOV AX,0C00H
    call display
    ADD DX,5

    CALL LINE
    CMP LI,1
    JNE EXIT
    MOV LI,0
    INC DX

    call COUNTER
    JMP EXIT

    LEFT:
    push cx
    sub cx,1
    call check
    cmp bool,1
    pop cx
    je exit

    MOV AX,0C00H
    call display
    SUB CX,5
    call COUNTER
    JMP EXIT

    RIGHT:
    push cx
    add  cx,9
    call check
    cmp bool,1
    pop cx
    je exit

    CMP AL,14          ; cmp for exit line with colour 14
    Jne fff

    CMP L,1
    mov x,1
    JE ps
    call congrets
    call input
    jmp exit
    ps:
    mov x,0
    call next_level      ;prompt for next level continue

    ask:
    mov ah,0
    int 16h

    cmp ah,1ch
    je lvl2              ; waits untill "enter -> continue to 2nd level" " escape -> main menue"
    cmp ah,1
    jne ask

    mov x,1
    jmp exit

    lvl2:
    call restore
    CALL LEVEL2
    mov cx,1
    mov dx,11
    MOV L,2
    jMP EXIT

    fff:
    MOV AX,0C00H
    call display
    ADD CX,5
    call COUNTER

    exit:
    mov bool,0
    RET
KBHIT ENDP
;------------------------------------------
MENUE PROC
    PUSH AX
    PUSH CX

    MOV AX,0B82AH
    LEA SI,MEN
    MOV CX,16
    CALL DISP

    MOV AX,0B832H
    LEA SI,MEN+16                     ;menue on main screen
    MOV CX,16
    CALL DISP

    MOV AX,0B83AH
    LEA SI,MEN+32
    MOV CX,16
    CALL DISP

    MOV AX,0B842H
    LEA SI,MEN+48
    MOV CX,16
    CALL DISP

    CALL SELECT

    POP CX
    POP AX
    ret
MENUE ENDP

;------------------------------------------
GAME1 PROC

    MOV DX,11
    MOV CX,1
    MOV BX,0505H          ;object size

    DRW:
    CMP COUNT,500
    JNE CON               ;loops for 500 moves
    CALL GAME_OVER
    JMP F

    CON:
    MOV AX,0C0FH
    CALL DISPLAY
    call KBHIT

    cmp x,1               ;exit signal from any level
    je f

    CMP AH,1              ;escape intruption for quting
    JE  PMT

    JMP DRW

    PMT:
    CALL WARN
    MOV AH,0               ; user confermation for exiting level
    INT 16H

    CMP AH,1CH
    JE  F
    PUSH CX
    PUSH DX                ; storing object location
    PUSH BX
    CMP L,1                ; draws levels agains according to level value 'L'
    JNE S2ND
    CALL LEVEL1
    JMP OI

    S2ND:
    CALL LEVEL2
    OI:
    POP BX
    POP DX
    POP CX
    CALL DRW

    F:
    call restore
    MOV DL,8
    MOV DH,10

    ret
GAME1 ENDP

;-----------------------------------------------------------------------------------------------
congrets PROC
    PUSH CX

    call reset
    call head

    cmp count,390
    jb FIRST                ; checks moves for scores
    cmp count,420
    jb SCOND
    cmp count,450
    jb THIRD

    mov point,'3'
    jmp continue

    FIRST:
    mov point,'9'
    jmp continue
    SCOND:
    mov point,'7'
    jmp continue
    THIRD:
    mov point,'5'


    push cx
    push dx
    mov cx,point
    mov dx,total             ; swaping point and total as point hold total marks of both levels
    mov point, dx            ; and total hold scores for single level
    mov total, cx
    pop dx
    pop cx


    continue:
    MOV AX,0B82aH
    LEA SI,GREeT
    MOV CX,18
    CALL DISP

    MOV AX,0B832H
    LEA SI,score
    MOV CX,14
    CALL DISP

    MOV AX,0B849H
    LEA SI,cong
    MOV CX,18
    CALL DISP

    MOV AX,0B85bH
    LEA SI,cong + 20
    MOV CX,13
    CALL DISP

    sub total,48
    mov cx,total
    sub point ,48
    add point ,cx

    push dx
    push bx
    mov ax,point ; decimal output method for displaying two digits total scores
    mov cx,10
    cwd
    div cx
    add dx,48
    push dx
    cwd
    div cx
    add dx,48
    push dx
    mov bh, 0    ; current page.
    mov dl, 23   ; col.
    mov dh, 21   ; row.
    mov ah, 02
    int 10h
    mov ah,2
    pop dx
    int 21h
    mov bh, 0    ; current page.
    mov dl, 24   ; col.
    mov dh, 21   ; row.
    mov ah, 02
    int 10h
    mov ah,2
    pop dx
    int 21h
    pop bx
    pop dx



    pop cx

    RET
congrets ENDP
;-----------------------------------------------------------------------------------------------

NEXT_LEVEL PROC
    PUSH CX

    call reset
    call head

    cmp count,304
    jb FIRST
    cmp count,330
    jb SCOND
    cmp count,460
    jb THIRD

    mov total,'3'
    jmp continue

    FIRST:
    mov total,'9'
    jmp continue
    SCOND:
    mov total,'7'
    jmp continue
    THIRD:
    mov total,'5'

    continue:
    MOV AX,0B82aH
    LEA SI,GREeT
    MOV CX,18
    CALL DISP

    MOV AX,0B832H
    LEA SI,score
    MOV CX,14
    CALL DISP

    MOV AX,0B861H
    LEA SI,level
    MOV CX,36
    CALL DISP

    pop cx

    RET
NEXT_LEVEL ENDP
;----------------------------------------------------------------------------------------------

;level 1 drawing

;----------------------------------------------------------------------------------------------
LEVEL1 PROC
    mov ah, 0
    mov al, 13h
    INT 10H

    MOV AH,0CH
    MOV AL,10
;draws borders
    MOV CX,0
    MOV DX,0
    MOV BX,0

    HORIZONTAL:           ;upper and lower horizontal line

    MOV DX,10
    INT 10H

    MOV DX,199
    INT 10H

    INC CX
    CMP CX,320

    JNE HORIZONTAL

    MOV DX,0

    VERTICLE:             ; left and right verticle line

    MOV CX,0
    INT 10H

    MOV CX,319
    INT 10H

    INC DX
    CMP DX,199
    JNE VERTICLE

;all of the central horizontal lines

    MOV CX,0
;;l1

    h1:
    MOV DX,21
    INT 10H
    INC CX
    CMP CX,300
    JNE h1

;;l2
    mov cx,0
    h2:
    MOV DX,32
    INT 10H
    INC CX
    CMP CX,70
    JNE h2

    add cx,16
    h3:
    MOV DX,32
    INT 10H
    INC CX
    CMP CX,300
    JNE h3

;;l3
    mov cx,16
    h4:
    MOV DX,43
    INT 10H
    INC CX
    CMP CX,35
    JNE h4


    add cx,16
    h5:
    MOV DX,43
    INT 10H
    INC CX
    CMP CX,120
    JNE h5

    add cx,16
    h6:
    MOV DX,43
    INT 10H
    INC CX
    CMP CX,300
    JNE h6

;;l4
    mov cx,16
    h7:
    MOV DX,54
    INT 10H
    INC CX
    CMP CX,100
    JNE h7

    add cx,16
    h8:
    MOV DX,54
    INT 10H
    INC CX
    CMP CX,300
    JNE h8

;;l5
    mov cx,0
    h9:
    MOV DX,65
    INT 10H
    INC CX
    CMP CX,50
    JNE h9

    add cx,16
    ha:
    MOV DX,65
    INT 10H
    INC CX
    CMP CX,300
    JNE ha

;;l6
    mov cx,16
    hb:
    MOV DX,76
    INT 10H
    INC CX
    CMP CX,319
    JNE hb


;;l7
    mov cx,16
    hc:
    MOV DX,87
    INT 10H
    INC CX
    CMP CX,70
    JNE hc

    add cx,16
    hd:
    MOV DX,87
    INT 10H
    INC CX
    CMP CX,300
    JNE hd

;;l8
    mov cx,0
    he:
    MOV DX,98
    INT 10H
    INC CX
    CMP CX,270
    JNE he

    add cx,16
    hf:
    MOV DX,98
    INT 10H
    INC CX
    CMP CX,300
    JNE hf

;;l9
    mov cx,0
    hg:
    MOV DX,109
    INT 10H
    INC CX
    CMP CX,20
    JNE hg

    add cx,16
    hh:
    MOV DX,109
    INT 10H
    INC CX
    CMP CX,285
    JNE hh

;l10
    mov cx,0
    hi:
    MOV DX,120
    INT 10H
    INC CX
    CMP CX,70
    JNE hI

    ADD cx,16
    hJ:
    MOV DX,120
    INT 10H
    INC CX
    CMP CX,300
    JNE hJ

;;L11
    mov cx,0
    hK:
    MOV DX,131
    INT 10H
    INC CX
    CMP CX,55
    JNE hK

    ADD cx,16
    hL:
    MOV DX,131
    INT 10H
    INC CX
    CMP CX,100
    JNE hL

    ADD cx,16
    hM:
    MOV DX,131
    INT 10H
    INC CX
    CMP CX,319
    JNE hM

;;L12
    mov cx,16
    hN:
    MOV DX,142
    INT 10H
    INC CX
    CMP CX,80
    JNE hN

    ADD cx,16
    hO:
    MOV DX,142
    INT 10H
    INC CX
    CMP CX,260
    JNE hO

    ADD cx,16
    hP:
    MOV DX,142
    INT 10H
    INC CX
    CMP CX,319
    JNE hP

;;L13
    mov cx,16
    hQ:
    MOV DX,153
    INT 10H
    INC CX
    CMP CX,70
    JNE hQ

    ADD cx,16
    hR:
    MOV DX,153
    INT 10H
    INC CX
    CMP CX,300
    JNE hR

;;l14
    mov cx,16
    hs:
    MOV DX,164
    INT 10H
    INC CX
    CMP CX,70
    JNE hs

    add cx,16
    ht:
    MOV DX,164
    INT 10H
    INC CX
    CMP CX,170
    JNE ht

    add cx,16
    hu:
    MOV DX,164
    INT 10H
    INC CX
    CMP CX,300
    JNE hu

;;l15
    mov cx,16
    hv:
    MOV DX,175
    INT 10H
    INC CX
    CMP CX,70
    JNE hv

    add cx,16
    hw:
    MOV DX,175
    INT 10H
    INC CX
    CMP CX,255
    JNE hw

    add cx,16
    hx:
    MOV DX,175
    INT 10H
    INC CX
    CMP CX,319
    JNE hx

;;L16
    MOV CX,16
    hy:
    mov dx,186
    int 10h
    inc cx
    cmp cx ,270
    jne hy

;;l17
    mov cx,0
    hz:
    mov dx,197
    int 10h
    inc cx
    cmp cx,319
    jne hz

; draws all of the verticle

    mov cx,300
    mov dx,21
    v12:
    int 10h
    inc dx
    cmp dx,32
    jne v12

    mov dx,43
    v34:
    int 10h
    inc dx
    cmp dx,55
    jne v34

    mov dx,87
    v710:
    int 10h
    inc dx
    cmp dx,120
    jne v710

    mov dx,32
    mov cx,90
    v23:
    int 10h
    inc dx
    cmp dx,43
    jne v23

    mov dx,43
    v34_2:
    mov cx,35
    int 10h
    mov cx,120
    int 10h
    inc dx
    cmp dx,54
    jne v34_2

    V45 :
    MOV CX,200
    INT 10H
    INC DX
    CMP DX,65
    JNE V45

    mov dx,76
    v67:
    mov cx,35
    int 10h
    mov cx,90
    int 10h
    inc dx
    cmp dx,87
    jne v67

    mov dx,109
    v910:
    mov cx,70
    int 10h
    inc dx
    cmp dx,120
    jne v910

    mov dx,131
    v1112:
    mov cx,80
    int 10h
    mov cx,100
    int 10h
    inc dx
    cmp dx,142
    jne v1112

    mov dx,153
    v1314:
    mov cx,70
    int 10h
    mov cx,90
    int 10h
    mov cx,255
    int 10h
    inc dx
    cmp dx,164
    jne v1314

    v1516:
    mov cx,18
    int 10h
    mov cx,255
    int 10h
    inc dx
    cmp dx,175
    jne v1516

	mov dx,142
    v:
	mov cx,20
	int 10h
	inc dx
	cmp dx,153
	jne v

	MOV DX,175
	V1617:
	MOV CX,160
	INT 10H
	INC DX
	CMP DX,186
	JNE V1617

    V617:
	MOV CX,180
	INT 10H
	INC DX
	CMP DX,197
	JNE V617

;END line:

    mov cx, 305
    mov dx, 197
    mov al, 14

    u3:
    mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 175
    ja u3

;WRIRING
    mov bh, 0
    mov dl, 0
    mov dh, 0
    mov ah, 02
    int 10h

    mov ah,2
    mov dl,"M"
    int 21h
    mov dl,"O"
    int 21h
    mov dl,"V"
    int 21h
    mov dl,"E"
    int 21h
    mov dl,"S"
    int 21h
    mov dl,":"
    int 21h

    mov bh, 0
    mov dl, 9
    mov dh, 0
    mov ah, 02
    int 10h

    mov ah,2
    mov dl,"/"
    int 21h
    mov dl,"5"
    int 21h
    mov dl,"0"
    int 21h
    mov dl,"0"
    int 21h

    mov bh, 0
    mov dl, 32
    mov dh, 0
    mov ah, 02
    int 10h

    mov ah,2
    mov dl,"L"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"v"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"l"
    int 21h
    mov dl,":"
    int 21h
    mov dl,"1"
    int 21h

    mov bh, 0
    mov dl, 6
    mov dh, 0
    mov ah, 02
    int 10h

    RET
LEVEL1 ENDP

;-----------------------------------------

;level 2 drawing

;-----------------------------------------

LEVEL2 proc
    push ax
    push bx
    push cx
    push dx

    mov ah,0
    mov al,13h
    int 10h

    mov ah,0ch
    mov al,10

    mov dx,0
    mov bx,0
;all of the verticle lines
    mov cx,0
    verti:
    int 10h
    inc dx
    cmp dx,197
    jne verti

    mov dx,11
    mov cx,20
    verti1:
    int 10h
    inc dx
    cmp dx,175
    jne verti1

    mov dx,22
    mov cx,30
    verti2:
    int 10h
    inc dx
    cmp dx,164
    jne verti2

    mov dx,33
    mov cx,40
    vertI3:
    int 10h
    inc dx
    cmp dx,153
    jne verti3

    mov dx,44
    mov cx,50
    verti4:
    int 10h
    inc dx
    cmp dx,142
    jne verti4

    mov dx,55
    mov cx,60
    verti5:
    int 10h
    inc dx
    cmp dx,131
    jne verti5

    mov dx,66
    mov cx,70
    verti6:
    int 10h
    inc dx
    cmp dx,120
    jne verti6

    mov dx,11
    mov bx,0

    mov cx,319
    vertii:
    int 10h
    inc dx
    cmp dx,197
    jne vertii

    mov dx,22
    mov cx,300
    verti11:
    int 10h
    inc dx
    cmp dx,186
    jne verti11

    mov dx,33
    mov cx,285
    verti22:
    int 10h
    inc dx
    cmp dx,175
    jne verti22

    mov dx,44
    mov cx,275
    verti33:
    int 10h
    inc dx
    cmp dx,164
    jne verti33

    mov dx,55
    mov cx,265
    verti44:
    int 10h
    inc dx
    cmp dx,153
    jne verti44

    mov dx,66
    mov cx,250
    verti55:
    int 10h
    inc dx
    cmp dx,142
    jne verti55

    mov dx,77
    mov cx,240
    verti66:
    int 10h
    inc dx
    cmp dx,131
    jne verti66

    mov dx,88
    mov cx,230
    verti77:
    int 10h
    inc dx
    cmp dx,120
    jne verti77

    mov dx,88
    mov cx,95
    verti88:
    int 10h
    inc dx
    cmp dx,131
    jne verti88

    mov dx,98
    mov cx,170
    verti99:
    int 10h
    inc dx
    cmp dx,197
    jne verti99

    mov dx,76
    mov cx,85
    verti10:
    int 10h
    inc dx
    cmp dx,131
    jne verti10

    mov dx,165
    vertii11:
    mov cx,160
    int 10h
    mov cx,180
    int 10h
    inc dx
    cmp dx,186
    jne vertii11



; all of the horizontal lines

    mov dx,186
    mov cx,0
    horii:
    int 10h
    inc cx
    cmp cx,161
    jne horii

    mov dx,175
    mov cx,16
    horii1:
    int 10h
    inc cx
    cmp cx,148
    jne horii1

    mov dx,164
    mov cx,26
    horii2:
    int 10h
    inc cx
    cmp cx,161
    jne horii2

    mov dx,153
    mov cx,36
    horii3:
    int 10h
    inc cx
    cmp cx,168
    jne horii3


    mov dx,10
    mov cx,0
    hori:
    int 10h            ;uper
    inc cx
    cmp cx,319
    jne hori


    mov dx,197
    hri:
    int 10h
    dec cx                  ;lower
    cmp cx,0
    jne hri

    mov dx,21
    mov cx,26
    hori1:
    int 10h
    inc cx
    cmp cx,301
    jne hori1

    mov dx,32
    mov cx,36
    hori2:
    int 10h
    inc cx
    cmp cx,286
    jne hori2

    mov dx,43
    mov cx,46
    hori3:
    int 10h
    inc cx
    cmp cx,276
    jne hori3

    mov dx,54
    mov cx,56
    hori4:
    int 10h
    inc cx
    cmp cx,266
    jne hori4

    mov dx,65
    mov cx,66
    hori5:
    int 10h
    inc cx
    cmp cx,251
    jne hori5

    mov dx,76
    mov cx,77
    hori6:
    int 10h
    inc cx
    cmp cx,241
    jne hori6

    mov dx,87
    mov cx,91
    hori7:
    int 10h
    inc cx
    cmp cx,231
    jne hori7


    mov dx,98
    mov cx,106
    hori8:
    int 10h
    inc cx
    cmp cx,220
    jne hori8

    mov dx,142
    mov cx,46
    horii4:
    int 10h
    inc cx
    cmp cx,155
    jne horii4

    mov dx,186
    mov cx,176
    horiii:
    int 10h
    inc cx
    cmp cx,301
    jne horiii

    mov dx,175
    mov cx,190
    horiii1:
    int 10h
    inc cx
    cmp cx,286
    jne horiii1

    mov dx,164
    mov cx,176
    horiii2:
    int 10h
    inc cx
    cmp cx,276
    jne horiii2

    mov dx,153
    mov cx,168
    horiii3:
    int 10h
    inc cx
    cmp cx,266
    jne horiii3

    mov dx,142
    mov cx,179
    horiii4:
    int 10h
    inc cx
    cmp cx,251
    jne horiii4

    mov dx,131
    mov cx,91
    horiii5:
    int 10h
    inc cx
    cmp cx,241
    jne horiii5

    mov dx,120
    mov cx,181
    horiii6:
    int 10h
    inc cx
    cmp cx,231
    jne horiii6

    mov dx,109
    mov cx,170
    horiii7:
    int 10h
    inc cx
    cmp cx,220
    jne horiii7

    mov dx,109
    mov cx,101
    horiii8:
    int 10h
    inc cx
    cmp cx,170
    jne horiii8

    mov dx,131
    mov cx,56
    horiii11:
    int 10h
    inc cx
    cmp cx,86
    jne horiii11

;end line
mov dx,109
    mov al,14
    vertii12:
    mov cx,150
    int 10h
    inc dx
    cmp dx,131
    jne vertii12

; writing

    mov bh, 0
    mov dl, 0
    mov dh, 0
    mov ah, 02
    int 10h

    mov ah,2
    mov dl,"M"
    int 21h
    mov dl,"O"
    int 21h
    mov dl,"V"
    int 21h
    mov dl,"E"
    int 21h
    mov dl,"S"
    int 21h
    mov dl,":"
    int 21h

    mov bh, 0
    mov dl, 9
    mov dh, 0
    mov ah, 02
    int 10h

    mov ah,2
    mov dl,"/"
    int 21h
    mov dl,"5"
    int 21h
    mov dl,"0"
    int 21h
    mov dl,"0"
    int 21h

    mov bh, 0
    mov dl, 33
    mov dh, 0
    mov ah, 02
    int 10h

    mov ah,2
    mov dl,"L"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"v"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"l"
    int 21h
    mov dl,":"
    int 21h
    mov dl,"2"
    int 21h

    mov bh, 0
    mov dl, 6
    mov dh, 0
    mov ah, 02
    int 10h


    pop dx
    pop cx
    pop bx
    pop ax
    ret
LEVEL2 endp
;---------------------------------------------------------------------

END MAIN




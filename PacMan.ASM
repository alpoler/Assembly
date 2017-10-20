.MODEL SMALL
.STACK 500H
.DATA

       START1 DB " **********************                                                         "
              DB " *    GAME START      *                                                         "
              DB " **********************        $"
         END1 DB " **********************                                                         "
              DB " *     GAME OVER      *                                                         "
              DB " **********************        $"
       THANKU DB " **********************                                                         "
              DB " * !!!!THANK  YOU!!!! *                                                         "
              DB " **********************                                                         "
              DB " PRESS  ESCAPE  TO QUIT GAME         $"


      MEMBER1 DB " ******************GROUP MEMBERS**************************                      "
              DB " *********************************************************                      "
              DB " * HAFIZ SYED KHALID AHMED           BCSF11A005          *                      "
              DB " * SYED MUHAMMAD TAHA ZUBAIR         BCSF11A046          *                      "
              DB " * SNEYA BAKHT                       BCSF11A012          *                      "
              DB " * TAYYABA SHAHZAD                   BCSF11A043          *                      "
              DB " * AMEERA NAEEM                      BCSF11A053          *                      "
              DB " *********************************************************                      "
              DB " *********************************************************                      "            
              DB "           PRESS ENTER TO CONTINUE.......                    $"            

      COUNTER DW ?

      SCORE1  DW 0
      UNIT    DB ?
      TEN     DB ?          ;... FOR SCORE...........
      HUNDRED DB ?
     THOUSAND DB ?

     LIVES    DW 3

    PACMANROW DW ?
    PACMANCOL DW ?
    ENEMY1ROW DW ?
    ENEMY1COL DW ?    ;.....FOR ENEMY POSITIONS.......
    ENEMY2ROW DW ?
    ENEMY2COL DW ?
    ENEMY3ROW DW ?
    ENEMY3COL DW ?
        STATE DB ?    ;........FOR KBHIT INPUT........


         ROW1P DW 0
         COL1P DW 0           ;P MEANS PREVIOUS...
                              ;C MEANZ CURRENT......
         ROW1C DW 0
         COL1C DW 0


         ROW2P DW 0
         COL2P DW 0


         ROW2C DW 0
         COL2C DW 0

         ROW3P DW 0
         COL3P DW 0

         ROW3C DW 0
         COL3C DW 0


           ROW DW 0
           COL DW 0



         SEED DW 3749H
       RNDNUM DW 65535
        





.CODE
        MAIN PROC

        MOV AX,@DATA
        MOV DS,AX

        MOV AX,0B800H
        MOV ES,AX


        CALL CLEAR
        CALL MEMBERS
        CALL COLORS

        CALL START





        CALL GAME



        CALL ENDGAME
        CALL THANKS
        CALL CLEAR


        MOV AH,4CH
        INT 21H

        MAIN ENDP
 ;..........................CLEAR SCREEN....................................;
 
        CLEAR PROC

        
        
        PUSH DI
        PUSH CX
        PUSH AX

        MOV AX,0B800H
        MOV ES,AX

        MOV CX,2000
        XOR DI,DI
        MOV AX,0720H
        REP STOSW
        POP AX
        POP CX
        POP DI
        RET


        CLEAR ENDP
;..............................RED SCREEN...........................;

        RED PROC
        
        PUSH DI
        PUSH CX
        PUSH AX


        MOV AX,0B800H
        MOV ES,AX


        MOV CX,2000
        XOR DI,DI
        MOV AX,4020H
        REP STOSW
        POP AX
        POP CX
        POP DI





        RET
        RED ENDP
;.........................GAME START..............................;


         START PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        CALL RED
        MOV COUNTER,20000

        MOV AX,0B871H
        MOV ES,AX

        LEA SI,START1
        XOR DI,DI

        MOV CX,185
        MOV AH,0CAH
 WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
        PUSH SI
        PUSH DI
        PUSH CX
 FOR1:
        LODSB
        STOSW
        LOOP FOR1

        POP CX
        POP DI
        POP SI

        DEC COUNTER
        JMP WHILE1
 END_WHILE1:

        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX


         RET
         START ENDP
;..........................END GAME..................................;

        ENDGAME PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI



        CALL BLUE
        MOV COUNTER,20000


        MOV AX,0B871H
        MOV ES,AX

        LEA SI,END1
        XOR DI,DI

        MOV CX,185
        MOV AH,9FH
 WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
        PUSH SI
        PUSH DI
        PUSH CX
 FOR1:
        LODSB
        STOSW
        LOOP FOR1

        POP CX
        POP DI
        POP SI

        DEC COUNTER
        JMP WHILE1
 END_WHILE1:

        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX



         RET

        ENDGAME ENDP
;..............................BLUE SCREEN...........................;

        BLUE PROC
        
        PUSH DI
        PUSH CX
        PUSH AX


        MOV AX,0B800H
        MOV ES,AX


        MOV CX,2000
        XOR DI,DI
        MOV AX,1020H
        REP STOSW
        POP AX
        POP CX
        POP DI





        RET
        BLUE ENDP

;..............................GREEN SCREEN...........................;

        GREEN PROC
        
        PUSH DI
        PUSH CX
        PUSH AX


        MOV AX,0B800H
        MOV ES,AX


        MOV CX,2000
        XOR DI,DI
        MOV AX,2020H
        REP STOSW



        POP AX
        POP CX
        POP DI





        RET
        GREEN ENDP

;..............................WHITE SCREEN...........................;

        WHITE PROC
        
        PUSH DI
        PUSH CX
        PUSH AX


        MOV AX,0B800H
        MOV ES,AX


        MOV CX,2000
        XOR DI,DI
        MOV AX,7020H
        REP STOSW



        POP AX
        POP CX
        POP DI





        RET
        WHITE ENDP

;..............................BROWN SCREEN...........................;

        BROWN PROC
        
        PUSH DI
        PUSH CX
        PUSH AX


        MOV AX,0B800H
        MOV ES,AX


        MOV CX,2000
        XOR DI,DI
        MOV AX,6020H
        REP STOSW



        POP AX
        POP CX
        POP DI





        RET
        BROWN ENDP

;..............................PINK SCREEN...........................;

        PINK PROC
        
        PUSH DI
        PUSH CX
        PUSH AX


        MOV AX,0B800H
        MOV ES,AX


        MOV CX,2000
        XOR DI,DI
        MOV AX,5020H
        REP STOSW



        POP AX
        POP CX
        POP DI





        RET
        PINK ENDP

;.........................THANK YOU..............................;


         THANKS PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        CALL PINK


        MOV AX,0B871H
        MOV ES,AX

        LEA SI,THANKU
        XOR DI,DI

        MOV CX,270
        MOV AH,50H
 WHILE1:
        CMP AL,27
        JZ END_WHILE1
        MOV AH,50H
        PUSH SI
        PUSH DI
        PUSH CX
 FOR1:
        LODSB
        STOSW
        LOOP FOR1

        POP CX
        POP DI
        POP SI

       MOV AH,0
       INT 16H
       JMP WHILE1
 END_WHILE1:

        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX


         RET
         THANKS ENDP
;............................MULTI COLOUR SCREENS............................;

          COLORS PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


       MOV CX,5
   FOR1:
        PUSH CX
        MOV CX,250
   FOR2:
        CALL RED
        LOOP FOR2
        


        
        MOV CX,250
   FOR3:
        CALL GREEN
        LOOP FOR3
        


        
        MOV CX,250
   FOR4:
        CALL BLUE
        LOOP FOR4
        


        
        MOV CX,250
   FOR5:
        CALL WHITE
        LOOP FOR5
        


        
        MOV CX,250
   FOR6:
        CALL BROWN
        LOOP FOR6

        
        MOV CX,250
   FOR7:
        CALL PINK
        LOOP FOR7
       


        POP CX

       LOOP FOR1


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
        COLORS ENDP
;.............................MEMBERS NAME..............................;


         MEMBERS PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        CALL WHITE

        MOV AX,0B851H
        MOV ES,AX

        LEA SI,MEMBER1
        XOR DI,DI

        MOV CX,780
        MOV AH,70H
    
 WHILE1:
        CMP AL,13
        JZ END_WHILE1

        MOV AH,70H
        PUSH SI
        PUSH DI
        PUSH CX
 FOR1:
        LODSB
        STOSW
        LOOP FOR1

        POP CX
        POP DI
        POP SI

        MOV AH,0
        INT 16H
        JMP WHILE1
 END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX


         RET
         MEMBERS ENDP
;...................................GAME....................................;

        GAME PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI





        MOV AH,0
        MOV AL,0DH
        INT 10H

        MOV AX,0A000H
        MOV ES,AX
        ;..................WRITE PACMAN...........................;

        MOV AH,0BH
        XOR BH,BH
        MOV BL,0
        INT 10H

        MOV AH,2
        XOR BH,BH
        MOV DH,3
        MOV DL,15
        INT 10H

        MOV AH,9
        MOV AL,'P'
        MOV BL,14
        MOV CX,1
        INT 10H

        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'A'
        MOV BL,14
        MOV CX,1
        INT 10H




        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'C'
        MOV BL,14
        MOV CX,1
        INT 10H


        ADD DL,2





        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'M'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'A'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'N'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        MOV DH,0
        MOV DL,34
       INT 10H


        MOV AH,9
        MOV AL,'S'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'C'
        MOV BL,14
        MOV CX,1
        INT 10H




        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'O'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'R'
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'E'
        MOV BL,14
        MOV CX,1
        INT 10H





        MOV AH,2
        MOV DH,1
        MOV DL,34
       INT 10H


        MOV AH,9
        MOV AL,'0'
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'0'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'0'
        MOV BL,14
        MOV CX,1
        INT 10H


        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'0'
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        MOV DH,0
        MOV DL,1
       INT 10H


        MOV AH,9
        MOV AL,'L'
        MOV BL,14
        MOV CX,1
        INT 10H





        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'I'
        MOV BL,14
        MOV CX,1
        INT 10H




        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'V'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'E'
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'S'
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        MOV DH,2
        MOV DL,1
       INT 10H


        MOV AH,9
        MOV AL,'0'
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'3'
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,'x'
        MOV BL,14
        MOV CX,1
        INT 10H









        MOV AX,15
        MOV BX,40
        PUSH AX
        PUSH BX
        CALL PRBALL













        MOV AX,10
        MOV BX,150
        PUSH AX
        PUSH BX
        CALL PRBALL







        ;..............................................................;
        CALL HURDLE
        CALL DOT      ;..PRINTS DOTS............;



        MOV ENEMY1ROW,45
        MOV ENEMY1COL,309
        
        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL ENEMY   ;.. PRINT ANTII OBJECT ..........;

        MOV ENEMY2ROW,185
        MOV ENEMY2COL,309
        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL ENEMY


        MOV ENEMY3ROW,185
        MOV ENEMY3COL,13
        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL ENEMY

   ;.............................................;

        MOV AX,45
        MOV BX,5
        MOV PACMANROW,AX
        MOV PACMANCOL,BX
        PUSH AX
        PUSH BX
        PUSH AX
        PUSH BX
        CALL PRBALL   ;.. PRINT PACMAN..........;



        MOV AH,0
        INT 16H



 WHILE1:


         PUSH CX
         MOV CX,65535
FOR_EMPTY:
        LOOP FOR_EMPTY
        POP CX


         PUSH CX
         MOV CX,65535
FOR_EMPTY1:
        LOOP FOR_EMPTY1
        POP CX


         PUSH CX
         MOV CX,65535
FOR_EMPTY2:
        LOOP FOR_EMPTY2
        POP CX



         PUSH CX
         MOV CX,65535
FOR_EMPTY3:
        LOOP FOR_EMPTY3
        POP CX




         PUSH CX
         MOV CX,65535
FOR_EMPTY4:
        LOOP FOR_EMPTY4
        POP CX



         PUSH CX
         MOV CX,65535
FOR_EMPTY5:
        LOOP FOR_EMPTY5
        POP CX




        ;............ CHECKING DOTS ARE AVAILABLE OR NOT..........;
         PUSH AX
         PUSH BX
         PUSH CX
         PUSH DX
         MOV SI,1
         MOV AH,0DH
         XOR BX,BX
         XOR CX,CX
         MOV DX,50

        MOV COUNTER,320
WHILE14:
        CMP COUNTER,0
        JZ END_WHILE14

        INT 10H
        CMP AL,0FH
        JNZ SI_1
        MOV SI,0
  SI_1:
        INC CX
        DEC COUNTER
        JMP WHILE14
END_WHILE14:




         XOR CX,CX
         MOV DX,61

        MOV COUNTER,320
WHILE15:
        CMP COUNTER,0
        JZ END_WHILE15

        INT 10H
        CMP AL,0FH
        JNZ SI_2
        MOV SI,0
  SI_2:
        INC CX
        DEC COUNTER
        JMP WHILE15
END_WHILE15:







         XOR CX,CX
         MOV DX,70

        MOV COUNTER,320
WHILE16:
        CMP COUNTER,0
        JZ END_WHILE16

        INT 10H
        CMP AL,0FH
        JNZ SI_3
        MOV SI,0
  SI_3:
        INC CX
        DEC COUNTER
        JMP WHILE16
END_WHILE16:






         XOR CX,CX
         MOV DX,80

        MOV COUNTER,320
WHILE17:
        CMP COUNTER,0
        JZ END_WHILE17

        INT 10H
        CMP AL,0FH
        JNZ SI_4
        MOV SI,0
  SI_4:
        INC CX
        DEC COUNTER
        JMP WHILE17
END_WHILE17:





         XOR CX,CX
         MOV DX,90

        MOV COUNTER,320
WHILE18:
        CMP COUNTER,0
        JZ END_WHILE18

        INT 10H
        CMP AL,0FH
        JNZ SI_5
        MOV SI,0
  SI_5:
        INC CX
        DEC COUNTER
        JMP WHILE18
END_WHILE18:






         XOR CX,CX
         MOV DX,120

        MOV COUNTER,320
WHILE19:
        CMP COUNTER,0
        JZ END_WHILE19

        INT 10H
        CMP AL,0FH
        JNZ SI_6
        MOV SI,0
  SI_6:
        INC CX
        DEC COUNTER
        JMP WHILE19
END_WHILE19:




         XOR CX,CX
         MOV DX,140

        MOV COUNTER,320
WHILE20:
        CMP COUNTER,0
        JZ END_WHILE20

        INT 10H
        CMP AL,0FH
        JNZ SI_7
        MOV SI,0
  SI_7:
        INC CX
        DEC COUNTER
        JMP WHILE20
END_WHILE20:





         XOR CX,CX
         MOV DX,160

        MOV COUNTER,320
WHILE21:
        CMP COUNTER,0
        JZ END_WHILE21

        INT 10H
        CMP AL,0FH
        JNZ SI_8
        MOV SI,0
  SI_8:
        INC CX
        DEC COUNTER
        JMP WHILE21
END_WHILE21:





         XOR CX,CX
         MOV DX,188

        MOV COUNTER,320
WHILE22:
        CMP COUNTER,0
        JZ END_WHILE22

        INT 10H
        CMP AL,0FH
        JNZ SI_9
        MOV SI,0
  SI_9:
        INC CX
        DEC COUNTER
        JMP WHILE22
END_WHILE22:



           ;............COLUMN CHCKING................;



         XOR DX,DX
         MOV CX,6

        MOV COUNTER,200
WHILE23:
        CMP COUNTER,0
        JZ END_WHILE23

        INT 10H
        CMP AL,0FH
        JNZ SI_10
        MOV SI,0
  SI_10:
        INC DX
        DEC COUNTER
        JMP WHILE23
END_WHILE23:




         XOR DX,DX
         MOV CX,14

        MOV COUNTER,200
WHILE24:
        CMP COUNTER,0
        JZ END_WHILE24

        INT 10H
        CMP AL,0FH
        JNZ SI_11
        MOV SI,0
  SI_11:
        INC DX
        DEC COUNTER
        JMP WHILE24
END_WHILE24:









         XOR DX,DX
         MOV CX,70

        MOV COUNTER,200
WHILE25:
        CMP COUNTER,0
        JZ END_WHILE25

        INT 10H
        CMP AL,0FH
        JNZ SI_12
        MOV SI,0
  SI_12:
        INC DX
        DEC COUNTER
        JMP WHILE25
END_WHILE25:







         XOR DX,DX
         MOV CX,94

        MOV COUNTER,200
WHILE26:
        CMP COUNTER,0
        JZ END_WHILE26

        INT 10H
        CMP AL,0FH
        JNZ SI_13
        MOV SI,0
  SI_13:
        INC DX
        DEC COUNTER
        JMP WHILE26
END_WHILE26:








         XOR DX,DX
         MOV CX,222

        MOV COUNTER,200
WHILE27:
        CMP COUNTER,0
        JZ END_WHILE27

        INT 10H
        CMP AL,0FH
        JNZ SI_14
        MOV SI,0
  SI_14:
        INC DX
        DEC COUNTER
        JMP WHILE27
END_WHILE27:





         XOR DX,DX
         MOV CX,246

        MOV COUNTER,200
WHILE28:
        CMP COUNTER,0
        JZ END_WHILE28

        INT 10H
        CMP AL,0FH
        JNZ SI_15
        MOV SI,0
  SI_15:
        INC DX
        DEC COUNTER
        JMP WHILE28
END_WHILE28:





         XOR DX,DX
         MOV CX,254

        MOV COUNTER,200
WHILE29:
        CMP COUNTER,0
        JZ END_WHILE29

        INT 10H
        CMP AL,0FH
        JNZ SI_16
        MOV SI,0
  SI_16:
        INC DX
        DEC COUNTER
        JMP WHILE29
END_WHILE29:




         XOR DX,DX
         MOV CX,310

        MOV COUNTER,200
WHILE30:
        CMP COUNTER,0
        JZ END_WHILE30

        INT 10H
        CMP AL,0FH
        JNZ SI_17
        MOV SI,0
  SI_17:
        INC DX
        DEC COUNTER
        JMP WHILE30
END_WHILE30:







        POP DX
        POP CX
        POP BX
        POP AX
        CMP SI,0
        JZ GAME1
        JMP END_WHILE1






       ;.............................................................;
 GAME1:


        CMP Al,27   ;.....   ESCAPE...........
        JZ END_WHILE1
        CMP AH,4DH  ;.....RIGHT ARROW KEY.....
        JZ RIGHT
        CMP AH,4BH  ;.....LEFT ARROW KEY......
        JZ LEFT
        CMP AH,48H  ;.....UP ARROW KEY........
        JZ UP
        CMP AH,50H  ;.....DOWN ARROW KEY......
        JZ DOWN
        JMP INPUT1


   ;..................RIGHT ARROW KEY...............;
   RIGHT:

        POP BX
        POP AX


        CMP ENEMY1ROW,AX
        JNZ NEXT1
        CMP ENEMY1COL,BX
        JZ DEAD
NEXT1:
        CMP ENEMY2ROW,AX
        JNZ NEXT2
        CMP ENEMY2COL,BX
        JZ DEAD
NEXT2:

        CMP ENEMY3ROW,AX
        JNZ NEXT3
        CMP ENEMY3COL,BX
        JZ DEAD
      
NEXT3:


        ;............. CHCK NXT DOT FOR SCORE..................
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX





        MOV DI,0

        MOV DX,AX
        MOV CX,BX
        ADD CX,5
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE31:
        CMP COUNTER,0
        JZ END_WHILE31
        PUSH COUNTER
        MOV COUNTER,8
WHILE32:
         CMP COUNTER,0
         JZ END_WHILE32
         INT 10H
         CMP AL,0FH
         JNZ DI_0
         MOV DI,1
DI_0:
         INC CX
         DEC COUNTER
         JMP WHILE32
END_WHILE32:

         INC DX
         SUB CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE31
END_WHILE31:


        CMP DI,1
        JNZ OUT1
        CALL SCORE
  OUT1:






        POP DX
        POP CX
        POP BX
        POP AX

        ;......................................................
        PUSH AX
        PUSH BX

        CMP AX,115
        JNZ CONTINUE
        CMP BX,309
        JNZ CONTINUE
        PUSH AX
        PUSH BX
        CALL RBALL

        MOV AX,115
        MOV BX,5
        PUSH AX
        PUSH BX
        CALL PRBALL
        POP BX
        POP AX



        MOV AX,115
        MOV BX,5
        PUSH AX
        PUSH BX
        JMP INPUT1
       


 CONTINUE:
         POP BX
         POP AX
      
        ;..............................

        PUSH AX
        PUSH BX
        ;.........CHCK NEXT POSITION.................;
        PUSH AX
        PUSH BX

        


        MOV CX,BX
        ADD CX,5
        MOV DX,AX


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,8
 WHILE2:
        CMP COUNTER,0
        JZ END_WHILE2
        INT 10H
        CMP AL,09H
        JZ REMAIN
        INC CX
        DEC COUNTER
        JMP WHILE2
END_WHILE2:
         ;...................;

        SUB CX,8
        ADD DX,9

        MOV COUNTER,8
WHILE6:
        CMP COUNTER,0
        JZ END_WHILE6
        INT 10H
        CMP AL,09H
        JZ REMAIN
        INC CX
        DEC COUNTER
        JMP WHILE6
END_WHILE6:

    ;......................;


         ;...................;

        SUB CX,8
        SUB DX,4

        MOV COUNTER,8
WHILE11:
        CMP COUNTER,0
        JZ END_WHILE11
        INT 10H
        CMP AL,09H
        JZ REMAIN
        INC CX
        DEC COUNTER
        JMP WHILE11
END_WHILE11:

    ;......................;




        POP BX
        POP AX
        ;....................



        PUSH AX
        PUSH BX
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...

        POP BX
        POP AX

        ADD BX,8       ;.. INCREMENT IN COLUMN.....

        PUSH AX
        PUSH BX

        MOV PACMANROW,AX
        MOV PACMANCOL,BX
        PUSH AX
        PUSH BX
        CALL PRBALL    ;..PRINT RIGHT  PACMAN ON NXT POSITION...
        JMP INPUT1
REMAIN:
        POP BX
        POP AX
        JMP INPUT1


     ;..............  LEFT ARROW KEY.........................;
 LEFT:
        POP BX
        POP AX



        CMP ENEMY1ROW,AX
        JNZ NEXT4
        CMP ENEMY1COL,BX
        JZ DEAD
NEXT4:
        CMP ENEMY2ROW,AX
        JNZ NEXT5
        CMP ENEMY2COL,BX
        JZ DEAD
NEXT5:

        CMP ENEMY3ROW,AX
        JNZ NEXT6
        CMP ENEMY3COL,BX
        JZ DEAD
      
NEXT6:
        

       
     





        ;............. CHCK NXT DOT FOR SCORE..................
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX





        MOV DI,0

        MOV DX,AX
        MOV CX,BX
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE33:
        CMP COUNTER,0
        JZ END_WHILE33
        PUSH COUNTER
        MOV COUNTER,8
WHILE34:
         CMP COUNTER,0
         JZ END_WHILE34
         INT 10H
         CMP AL,0FH
         JNZ DI_1
         MOV DI,1
DI_1:
         DEC CX
         DEC COUNTER
         JMP WHILE34
END_WHILE34:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE33
END_WHILE33:


        CMP DI,1
        JNZ OUT2
        CALL SCORE
  OUT2:






        POP DX
        POP CX
        POP BX
        POP AX

        ;......................................................









        ;............................
        PUSH AX
        PUSH BX

        CMP AX,115
        JNZ CONTINUE1
        CMP BX,5
        JNZ CONTINUE1
        PUSH AX
        PUSH BX
        CALL RBALL

        MOV AX,115
        MOV BX,309
        PUSH AX
        PUSH BX
        CALL PLBALL
        POP BX
        POP AX



        MOV AX,115
        MOV BX,309
        PUSH AX
        PUSH BX
        JMP INPUT1
       


 CONTINUE1:
         POP BX
         POP AX
      
        ;..............................





        PUSH AX
        PUSH BX
        ;.........CHCK NEXT POSITION.................;

        PUSH AX
        PUSH BX
        MOV CX,BX
        SUB CX,3
        MOV DX,AX


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE3:
        CMP COUNTER,0
        JZ END_WHILE3
        INT 10H
        CMP AL,09H
        JZ REMAIN1
        DEC CX
        DEC COUNTER
        JMP WHILE3
END_WHILE3:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE7:
        CMP COUNTER,0
        JZ END_WHILE7
        INT 10H
        CMP AL,09H
        JZ REMAIN1
        DEC CX
        DEC COUNTER
        JMP WHILE7
END_WHILE7:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE10:
        CMP COUNTER,0
        JZ END_WHILE10
        INT 10H
        CMP AL,09H
        JZ REMAIN1
        DEC CX
        DEC COUNTER
        JMP WHILE10
END_WHILE10:

    ;......................;





        POP BX
        POP AX
        ;....................




        PUSH AX
        PUSH BX
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...

        POP BX
        POP AX

        SUB BX,8       ;.. DECREMENT IN COLUMN.....

        PUSH AX
        PUSH BX

        MOV PACMANROW,AX
        MOV PACMANCOL,BX

        PUSH AX
        PUSH BX
        CALL PLBALL    ;..PRINT LEFT  PACMAN ON NXT POSITION...
        JMP INPUT1

REMAIN1:
        POP BX
        POP AX
        JMP INPUT1

     ;..............  DOWN ARROW KEY.........................;
 DOWN:
        POP BX
        POP AX




        CMP ENEMY1ROW,AX
        JNZ NEXT7
        CMP ENEMY1COL,BX
        JZ DEAD
NEXT7:
        CMP ENEMY2ROW,AX
        JNZ NEXT8
        CMP ENEMY2COL,BX
        JZ DEAD
NEXT8:

        CMP ENEMY3ROW,AX
        JNZ NEXT9
        CMP ENEMY3COL,BX
        JZ DEAD
      
NEXT9:


    
      



        ;............. CHCK NXT DOT FOR SCORE..................
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX





        MOV DI,0

        MOV DX,AX
        ADD DX,10
        MOV CX,BX
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE35:
        CMP COUNTER,0
        JZ END_WHILE35
        PUSH COUNTER
        MOV COUNTER,10
WHILE36:
         CMP COUNTER,0
         JZ END_WHILE36
         INT 10H
         CMP AL,0FH
         JNZ DI_2
         MOV DI,1
DI_2:
         INC DX
         DEC COUNTER
         JMP WHILE36
END_WHILE36:

         INC CX
         SUB DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE35
END_WHILE35:


        CMP DI,1
        JNZ OUT3
        CALL SCORE
  OUT3:






        POP DX
        POP CX
        POP BX
        POP AX

        ;......................................................











        PUSH AX
        PUSH BX

        ;.........CHCK NEXT POSITION.................;

        PUSH AX
        PUSH BX
        MOV CX,BX
        SUB CX,3
        MOV DX,AX
        ADD DX,10
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE4:
        CMP COUNTER,0
        JZ END_WHILE4
        INT 10H
        CMP AL,09H
        JZ REMAIN2
        INC DX
        DEC COUNTER
        JMP WHILE4
END_WHILE4:


         ;...................;

        ADD CX,7
        SUB DX,10

        MOV COUNTER,10
WHILE8:
        CMP COUNTER,0
        JZ END_WHILE8
        INT 10H
        CMP AL,09H
        JZ REMAIN2
        INC DX
        DEC COUNTER
        JMP WHILE8
END_WHILE8:

    ;......................;


         ;...................;

        SUB CX,3
        SUB DX,10

        MOV COUNTER,10
WHILE39:
        CMP COUNTER,0
        JZ END_WHILE39
        INT 10H
        CMP AL,09H
        JZ REMAIN2
        INC DX
        DEC COUNTER
        JMP WHILE39
END_WHILE39:

    ;......................;


        POP BX
        POP AX
        ;....................



        PUSH AX
        PUSH BX
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...

        POP BX
        POP AX

        ADD AX,10       ;.. INCREMENT IN ROW.....

        PUSH AX
        PUSH BX
        MOV PACMANROW,AX
        MOV PACMANCOL,BX


        PUSH AX
        PUSH BX
        CALL PDBALL    ;..PRINT DOWN  PACMAN ON NXT POSITION...
        JMP INPUT1
REMAIN2:
        POP BX
        POP AX
        JMP INPUT1

     ;..............  UP ARROW KEY.........................;
 UP:
        POP BX
        POP AX




        CMP ENEMY1ROW,AX
        JNZ NEXT10
        CMP ENEMY1COL,BX
        JZ DEAD
NEXT10:
        CMP ENEMY2ROW,AX
        JNZ NEXT11
        CMP ENEMY2COL,BX
        JZ DEAD
NEXT11:

        CMP ENEMY3ROW,AX
        JNZ NEXT12
        CMP ENEMY3COL,BX
        JZ DEAD
      
NEXT12:
        




        ;............. CHCK NXT DOT FOR SCORE..................
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX





        MOV DI,0

        MOV DX,AX
        DEC DX
        MOV CX,BX
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE37:
        CMP COUNTER,0
        JZ END_WHILE37
        PUSH COUNTER
        MOV COUNTER,10
WHILE38:
         CMP COUNTER,0
         JZ END_WHILE38
         INT 10H
         CMP AL,0FH
         JNZ DI_3
         MOV DI,1
DI_3:
         DEC DX
         DEC COUNTER
         JMP WHILE38
END_WHILE38:

         INC CX
         ADD DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE37
END_WHILE37:


        CMP DI,1
        JNZ OUT4
        CALL SCORE
  OUT4:






        POP DX
        POP CX
        POP BX
        POP AX

        ;......................................................










        PUSH AX
        PUSH BX


        ;.........CHCK NEXT POSITION.................;

        PUSH AX
        PUSH BX
        MOV CX,BX
        SUB CX,3
        MOV DX,AX
        ADD DX,1
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE5:
        CMP COUNTER,0
        JZ END_WHILE5
        INT 10H
        CMP AL,09H
        JZ REMAIN3
        DEC DX
        DEC COUNTER
        JMP WHILE5
END_WHILE5:


         ;...................;

        ADD CX,7
        ADD DX,10

        MOV COUNTER,10
WHILE9:
        CMP COUNTER,0
        JZ END_WHILE9
        INT 10H
        CMP AL,09H
        JZ REMAIN3
        DEC DX
        DEC COUNTER
        JMP WHILE9
END_WHILE9:

    ;......................;


         ;...................;

        SUB CX,3
        ADD DX,10

        MOV COUNTER,10
WHILE12:
        CMP COUNTER,0
        JZ END_WHILE12
        INT 10H
        CMP AL,09H
        JZ REMAIN3
        DEC DX
        DEC COUNTER
        JMP WHILE12
END_WHILE12:

    ;......................;




        POP BX
        POP AX
        ;....................



        PUSH AX
        PUSH BX
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...

        POP BX
        POP AX

        SUB AX,10       ;.. DECREMENT IN ROW.....

        PUSH AX
        PUSH BX
        MOV PACMANROW,AX
        MOV PACMANCOL,BX


        PUSH AX
        PUSH BX
        CALL PUBALL    ;..PRINT UP  PACMAN ON NXT POSITION...
        JMP INPUT1
REMAIN3:
        POP BX
        POP AX
        JMP INPUT1

    ;........................INPUT..........................


 INPUT1:
     ;   CALL ENEMYMOVEMENT ;..enemy movment PROC
         CALL TOWARDSENEMY

       ;............KBHIT..............;
        MOV AH,0BH
        INT 21H
        CMP AL,0
        MOV AH,STATE

        JZ WHILE1


        ;...............................;
        MOV AH,0
      ;  MOV AL,0BH
        INT 16H
        MOV STATE ,AH
        JMP WHILE1



 END_WHILE1:
        POP BX
        POP AX

        JMP GAME_END




 DEAD:
      DEC LIVES

     PUSH AX
     PUSH BX
     CALL RBALL

     MOV AX,45
     MOV BX,5
     MOV PACMANROW,AX
     MOV PACMANCOL,BX

     PUSH AX
     PUSH BX

     CALL PRBALL

     PUSH ENEMY1ROW
     PUSH ENEMY1COL
     CALL RBALL

     MOV ENEMY1ROW,45
     MOV ENEMY1COL,309
     PUSH ENEMY1ROW
     PUSH ENEMY1COL

     CALL ENEMY

     PUSH ENEMY2ROW
     PUSH ENEMY2COL
     CALL RBALL

     MOV ENEMY2ROW,185
     MOV ENEMY2COL,309
     PUSH ENEMY2ROW
     PUSH ENEMY2COL

     CALL ENEMY

     PUSH ENEMY3ROW
     PUSH ENEMY3COL
     CALL RBALL

     MOV ENEMY3ROW,185
     MOV ENEMY3COL,13
     PUSH ENEMY3ROW
     PUSH ENEMY3COL

     CALL ENEMY


     MOV AX,45
     MOV BX,5

     PUSH AX
     PUSH BX



   ;............ LIVES DISPLAY........................;

        XOR DX,DX
        MOV AX,LIVES
        MOV BX,10
        DIV BX
        MOV UNIT,DL
        ADD UNIT, 48

        MOV AH,0BH
        XOR BX,BX
        INT 10H



        
        MOV AH,2
        MOV BH,0
        MOV DH,2
        MOV DL,2
       INT 10H



        MOV AH,9
        MOV AL,UNIT
        MOV BL,14
        MOV CX,1
         INT 10H

    ;..................................................:





     CMP LIVES,0
     JA WHILE1
     JMP END_WHILE1


GAME_END:
        MOV AH,0
        MOV AL,03H
        INT 10H


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX


         RET
         GAME ENDP
       
;................................VERTICAL TOP TO BOTTOM LINE...........................;
        VERTICALD PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,09H
        XOR BH,BH   ;  CURRENT PAGE #
 WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER
        INC DX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        VERTICALD  ENDP

;................................VERTICAL BOTTOM TO TOP LINE...........................;
        VERTICALU PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,09H
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER


        DEC DX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        VERTICALU  ENDP






;................................HORIZONTAL LEFT TO  RIGHT LINE...........................;
        HORIZONTALR PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,09H
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER
        
        INC CX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        HORIZONTALR ENDP


;................................HORIZONTAL  RIGHT TO LEFT...........................;
        HORIZONTALL PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,09H
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1

;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER


        DEC CX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        HORIZONTALL ENDP







;........................... HURDLEZZZZ...................................;
        HURDLE PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV AX,60
        MOV BX,110
        MOV CX,0
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALR


        MOV AX,20
        MOV BX,110
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU



        MOV AX,60
        MOV BX,90
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL




        MOV AX,50
        MOV BX,90
        MOV CX,0
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU



        MOV AX,319
        MOV BX,40
        MOV CX,0
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALR


        MOV AX,50
        MOV BX,40
        MOV CX,319
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD


        MOV AX,60
        MOV BX,90
        MOV CX,319
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL


        MOV AX,20
        MOV BX,90
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,60
        MOV BX,110
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR


        MOV AX,60
        MOV BX,130
        MOV CX,319
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,20
        MOV BX,130
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,60
        MOV BX,149
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR



        MOV AX,50
        MOV BX,149
        MOV CX,319
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD


        MOV AX,320
        MOV BX,198
        MOV CX,319
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,50
        MOV BX,198
        MOV CX,0
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU


        MOV AX,60
        MOV BX,149
        MOV CX,0
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR


        MOV AX,20
        MOV BX,149
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU


        MOV AX,60
        MOV BX,130
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL

                ;............MID BOX..................;



        MOV AX,100
        MOV BX,100
        MOV CX,110
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR



        MOV AX,30
        MOV BX,100
        MOV CX,210
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD


        MOV AX,100
        MOV BX,130
        MOV CX,210
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,30
        MOV BX,130
        MOV CX,110
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU



             ;...............UPPER LEFT BOX.........;



        MOV AX,40
        MOV BX,60
        MOV CX,20
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR




        MOV AX,10
        MOV BX,60
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,40
        MOV BX,70
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,10
        MOV BX,70
        MOV CX,20
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU


         ;................. LOWER LEFT BOX........;



        MOV AX,40
        MOV BX,169
        MOV CX,20
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR




        MOV AX,11
        MOV BX,169
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,40
        MOV BX,180
        MOV CX,60
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,11
        MOV BX,180
        MOV CX,20
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU


   





        ;...............UPPER RIGHT BOX...........;




        MOV AX,40
        MOV BX,60
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR




        MOV AX,10
        MOV BX,60
        MOV CX,299
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,40
        MOV BX,70
        MOV CX,299
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,10
        MOV BX,70
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU


           ;.... LOWER RIGHT BOX.........;



        MOV AX,40
        MOV BX,169
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR




        MOV AX,11
        MOV BX,169
        MOV CX,299
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,40
        MOV BX,180
        MOV CX,299
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,11
        MOV BX,180
        MOV CX,259
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU

                    ;...UPPER MID BOX.....;



        MOV AX,100
        MOV BX,55
        MOV CX,110
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR




        MOV AX,9
        MOV BX,55
        MOV CX,210
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,100
        MOV BX,64
        MOV CX,210
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,9
        MOV BX,64
        MOV CX,110
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU




                    ;...LOWER MID BOX.....;



        MOV AX,100
        MOV BX,169
        MOV CX,110
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR




        MOV AX,11
        MOV BX,169
        MOV CX,210
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,100
        MOV BX,180
        MOV CX,210
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,11
        MOV BX,180
        MOV CX,110
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU




   ;............... UPPER LEFT " T "  ..............;


        



        MOV AX,45
        MOV BX,104
        MOV CX,78
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU





        MOV AX,4
        MOV BX,59
        MOV CX,78
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR


      



        MOV AX,20
        MOV BX,59
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,18
        MOV BX,79
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR





        MOV AX,4
        MOV BX,79
        MOV CX,100
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,18
        MOV BX,83
        MOV CX,100
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,21
        MOV BX,83
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,4
        MOV BX,104
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL




   ;............... LOWER LEFT " T "  ..............;


        



        MOV AX,44
        MOV BX,174
        MOV CX,78
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU





        MOV AX,4
        MOV BX,130
        MOV CX,78
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR


      



        MOV AX,20
        MOV BX,130
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD




        MOV AX,18
        MOV BX,150
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR





        MOV AX,4
        MOV BX,150
        MOV CX,100
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,18
        MOV BX,154
        MOV CX,100
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,20
        MOV BX,154
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,4
        MOV BX,174
        MOV CX,82
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL





   ;............... UPPER RIGHT " T "  ..............;


        



        MOV AX,4
        MOV BX,83
        MOV CX,219
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU





        MOV AX,18
        MOV BX,79
        MOV CX,219
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR


      



        MOV AX,20
        MOV BX,79
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU




        MOV AX,4
        MOV BX,59
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR





        MOV AX,45
        MOV BX,59
        MOV CX,241
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,4
        MOV BX,104
        MOV CX,241
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,21
        MOV BX,104
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU



        MOV AX,18
        MOV BX,83
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL






   ;............... LOWER RIGHT " T "  ..............;


        



        MOV AX,4
        MOV BX,154
        MOV CX,219
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU





        MOV AX,18
        MOV BX,150
        MOV CX,219
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR


      



        MOV AX,20
        MOV BX,150
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU




        MOV AX,4
        MOV BX,130
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALR





        MOV AX,44
        MOV BX,130
        MOV CX,241
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALD



        MOV AX,4
        MOV BX,174
        MOV CX,241
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        MOV AX,20
        MOV BX,174
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALU



        MOV AX,18
        MOV BX,154
        MOV CX,237
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALL



        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET

        HURDLE ENDP





;.......................FOR YELLOW BALL HORIZONTAL LEFT TO  RIGHT LINE...........................;
        HORIZONTALRB PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,0EH
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER
        
        INC CX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        HORIZONTALRB ENDP


;....................YELLOW VERTICAL BOTTOM TO TOP LINE...........................;
        VERTICALUB PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,0EH
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER


        DEC DX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        VERTICALUB  ENDP






;............FOR EMPTY   BALL ON PREVIOUS LOCATION...........................;
        HORIZONTALRBR PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,00H
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER
        
        INC CX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        HORIZONTALRBR ENDP



 ;.......................PRINT RIGHT  PACMAN.......................;
        PRBALL PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,2
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB

      POP CX
      POP BX
      DEC CX
      INC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,4


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB




      POP CX
      POP BX
      DEC CX
      INC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,6
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB



      POP CX
      POP BX
      DEC CX
      INC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,6
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB




      POP CX
      POP BX
   
      INC BX

      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB


      POP CX
      POP BX

      INC BX




      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,4

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB


      POP CX
      POP BX



      INC BX



      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
                           
        CALL HORIZONTALRB


      POP CX
      POP BX



   
      INC BX
      INC CX

      PUSH BX
      PUSH CX

                   ; ......................                    (8)

        
        MOV AX,6
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB


      POP CX
      POP BX
   
      INC BX
      INC CX

      PUSH BX
      PUSH CX

            ; ............................  (9)


        MOV AX,4
      
        
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB



      POP CX
      POP BX
   
      INC BX
      INC CX

                    ; .........................(10)

        MOV AX,2
      
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB







        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         PRBALL ENDP


 ;.......................PRINT  LEFT   PACMAN.......................;
        PLBALL PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,2
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB

      POP CX
      POP BX
      DEC CX
      INC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,4


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB




      POP CX
      POP BX
      DEC CX
      INC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,6
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB



      POP CX
      POP BX
      INC CX
      INC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,6
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB




      POP CX
      POP BX
   
      INC BX
      INC CX

      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB


      POP CX
      POP BX

      INC BX
      INC CX



      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,4

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB


      POP CX
      POP BX


      DEC CX
      INC BX



      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
                           
        CALL HORIZONTALRB


      POP CX
      POP BX



   
      INC BX
      DEC CX
      DEC CX

      PUSH BX
      PUSH CX

                   ; ......................                    (8)

        
        MOV AX,6
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB


      POP CX
      POP BX
   
      INC BX
      INC CX

      PUSH BX
      PUSH CX

            ; ............................  (9)


        MOV AX,4
      
        
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB



      POP CX
      POP BX
   
      INC BX
      INC CX

                    ; .........................(10)

        MOV AX,2
      
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRB







        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         PLBALL ENDP




 ;.......................PRINT UP  PACMAN.......................;
        PUBALL PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        ADD BX,6
        SUB CX,3
        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,4
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB

      POP CX
      POP BX
      INC CX
      INC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,6


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        




      POP CX
      POP BX
      INC CX
      INC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,6
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        



      POP CX
      POP BX
      INC CX
      INC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,6
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        




      POP CX
      POP BX
   
      INC CX

      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
       


      POP CX
      POP BX

      INC CX
      DEC BX



      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        


      POP CX
      POP BX



      INC CX
      DEC BX
      

      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,6

        PUSH AX
        PUSH BX
        PUSH CX
                           
        CALL VERTICALUB
        


      POP CX
      POP BX



   
      DEC BX
      INC CX

 

                   ; ......................                    (8)

        
        MOV AX,4
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        

 







        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         PUBALL ENDP




 ;.......................PRINT DOWN  PACMAN.......................;
        PDBALL PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        ADD BX,6
        SUB CX,3
        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,4
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB

      POP CX
      POP BX
      INC CX
      INC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,6


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        




      POP CX
      POP BX
      INC CX
      DEC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,6
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        



      POP CX
      POP BX
      INC CX
      DEC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,6
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        




      POP CX
      POP BX
   
      INC CX
      DEC BX
      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
       


      POP CX
      POP BX

      INC CX
      INC BX



      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,5

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        


      POP CX
      POP BX



      INC CX
      INC BX
      INC BX
      

      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,6

        PUSH AX
        PUSH BX
        PUSH CX
                           
        CALL VERTICALUB
        


      POP CX
      POP BX



   
      DEC BX
      INC CX

 

                   ; ......................                    (8)

        
        MOV AX,4
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUB
        

 







        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         PDBALL ENDP






 ;.......................REMOVE   PACMAN.......................;
        RBALL PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        SUB CX,3

        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,8
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR

      POP CX
      POP BX
    ;  DEC CX
      INC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,8


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR




      POP CX
      POP BX
   ;   DEC CX
      INC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,8
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR



      POP CX
      POP BX
    ;  DEC CX
      INC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,8
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR




      POP CX
      POP BX
   
      INC BX

      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX

      INC BX




      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX



      INC BX



      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX



   
      INC BX
    ;  INC CX

      PUSH BX
      PUSH CX

                   ; ......................                    (8)

        
        MOV AX,8
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX
   
      INC BX
     ; INC CX

      PUSH BX
      PUSH CX

            ; ............................ (9)


        MOV AX,8
      
        
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR



      POP CX
      POP BX
   
      INC BX
    ;  INC CX

                    ; ......................... (10)

        MOV AX,8
      
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR







        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         RBALL ENDP

 ;.................REMOVE ENEMY WITH DOT.........................

 
        RBALLDOT PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        SUB CX,3

        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,8
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR

      POP CX
      POP BX
    ;  DEC CX
      INC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,8


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR




      POP CX
      POP BX
   ;   DEC CX
      INC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,8
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR



      POP CX
      POP BX
    ;  DEC CX
      INC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,8
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR




      POP CX
      POP BX
   
      INC BX

      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX

      INC BX




      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX



      INC BX



      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX



   
      INC BX
    ;  INC CX

      PUSH BX
      PUSH CX

                   ; ......................                    (8)

        
        MOV AX,8
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR


      POP CX
      POP BX
   
      INC BX
     ; INC CX

      PUSH BX
      PUSH CX

            ; ............................ (9)


        MOV AX,8
      
        
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR



      POP CX
      POP BX
   
      INC BX
    ;  INC CX

                    ; ......................... (10)

        MOV AX,8
      
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL HORIZONTALRBR

        ;..................FOR PRINT DOT.............

         MOV AX,1
         PUSH AX
         PUSH ROW
         PUSH COL
         CALL VERTICALDOT



        ;...........................................





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         RBALLDOT ENDP








 ;.......................PRINT ENEMY..........................;
        ENEMY PROC
        PUSH BP
        MOV BP,SP


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,[BP+4]
        MOV BX,[BP+6]
        ADD BX,9
        SUB CX,3
        PUSH BX
        PUSH CX

                   ;.........................    (1)

        MOV AX,7
     
 
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR

      POP CX
      POP BX
      INC CX
      DEC BX
      DEC BX

      PUSH BX
      PUSH CX
                 ; ......................       (2)

        MOV AX,6


        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR
        




      POP CX
      POP BX
      INC CX
      INC BX
      INC BX

      PUSH BX
      PUSH CX


               ; ..........................       (3)

        MOV AX,9
    
    
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR
        



      POP CX
      POP BX
      INC CX
      DEC BX
      DEC BX

      PUSH BX
      PUSH CX

               ; ...........................        (4)

        MOV AX,8
  
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR
        




      POP CX
      POP BX
   
      INC CX
      INC BX
      INC BX
      PUSH BX
      PUSH CX


                  ; ......................             (5)

        MOV AX,10

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR
       


      POP CX
      POP BX

      INC CX
      DEC BX
      DEC BX




      PUSH BX
      PUSH CX

                 ; .........................              (6)


        MOV AX,7

        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR
        


      POP CX
      POP BX



      INC CX
      INC BX
      INC BX
      

      PUSH BX
      PUSH CX

                   ; .......................                 (7)


        MOV AX,8

        PUSH AX
        PUSH BX
        PUSH CX
                           
        CALL VERTICALUBR
        


      POP CX
      POP BX



      DEC BX
      DEC BX
      INC CX

     

                   ; ......................                    (8)

        
        MOV AX,5
        
       
        PUSH AX
        PUSH BX
        PUSH CX
        
        CALL VERTICALUBR
        








        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
         RET 4
         ENEMY ENDP






;....................CYAN VERTICAL BOTTOM TO TOP LINE...........................;
        VERTICALUBR PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,03H
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER


        DEC DX
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        VERTICALUBR  ENDP










;................................VERTICAL TOP TO BOTTOM DOTS...........................;
        VERTICALDOT PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,0FH
        XOR BH,BH   ;  CURRENT PAGE #
 WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER
        ADD DX,8
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        VERTICALDOT  ENDP



;................................HORIZONTAL DOT  LEFT TO  RIGHT ...........................;
        HORIZONTALDOT PROC

        PUSH BP
        MOV BP,SP

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

        MOV CX,[BP+4]
        MOV DX,[BP+6]
        MOV AX,[BP+8]
        MOV COUNTER,AX
        MOV AH,0CH
        MOV AL,0FH
        XOR BH,BH   ;  CURRENT PAGE #
WHILE1:
        CMP COUNTER,0
        JZ END_WHILE1
;        PUSH COUNTER
;        MOV COUNTER,100
; WHILE2:
;        CMP COUNTER,0
;        JZ END_WHILE2

        INT 10H
;        DEC COUNTER
;        JMP WHILE2
; END_WHILE2:
;        POP COUNTER
        
        ADD CX,8
        DEC COUNTER
        JMP WHILE1
END_WHILE1:


        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP BP
        RET 6

        HORIZONTALDOT ENDP




;....................... WRITE DOTS ON SCREEN..........................;
        DOT PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI



        MOV AX,39
        MOV BX,50
        MOV CX,6
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT



        MOV AX,38
        MOV BX,188
        MOV CX,14
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT


        MOV AX,8
        MOV BX,120
        MOV CX,6
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT
                       



        MOV AX,7
        MOV BX,80
        MOV CX,14
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT



        MOV AX,7
        MOV BX,160
        MOV CX,14
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT





        MOV AX,8
        MOV BX,80
        MOV CX,254
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT



        MOV AX,8
        MOV BX,120
        MOV CX,254
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT



        MOV AX,8
        MOV BX,160
        MOV CX,254
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT




        MOV AX,17
        MOV BX,70
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT



        MOV AX,17
        MOV BX,90
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT





        MOV AX,17
        MOV BX,140
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT





        MOV AX,17
        MOV BX,160
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL HORIZONTALDOT






        MOV AX,4
        MOV BX,50
        MOV CX,14
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT



        MOV AX,4
        MOV BX,160
        MOV CX,14
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT




        MOV AX,17
        MOV BX,50
        MOV CX,70
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT






        MOV AX,17
        MOV BX,50
        MOV CX,246
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT




        MOV AX,4
        MOV BX,50
        MOV CX,310
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT



        MOV AX,4
        MOV BX,160
        MOV CX,310
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT







        MOV AX,6
        MOV BX,90
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT






        MOV AX,6
        MOV BX,90
        MOV CX,222
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT





        MOV AX,1
        MOV BX,61
        MOV CX,222
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT





        MOV AX,3
        MOV BX,160
        MOV CX,222
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT




        MOV AX,1
        MOV BX,61
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT





        MOV AX,3
        MOV BX,160
        MOV CX,94
        PUSH AX
        PUSH BX
        PUSH CX
        CALL VERTICALDOT






        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX


        RET
        DOT ENDP

   ;..........................PRINT SCORE......................;
        SCORE PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI





       ADD SCORE1,10

        MOV AX,SCORE1
        MOV BX,10
        XOR DX,DX
        DIV BX
        MOV UNIT,DL
        ADD UNIT,48


        XOR DX,DX
        DIV BX
        MOV TEN,DL
        ADD TEN,48

        XOR DX,DX
        DIV BX
        MOV HUNDRED,DL
        ADD HUNDRED,48


        MOV THOUSAND,AL
        ADD THOUSAND,48

        MOV AH,0BH
        XOR BX,BX
        INT 10H




        MOV AH,2
        MOV DH,1
        MOV DL,34
        INT 10H


        MOV AH,9
        MOV AL,THOUSAND
        MOV BL,14
        MOV CX,1
        INT 10H






        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,HUNDRED
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,TEN
        MOV BL,14
        MOV CX,1
        INT 10H



        MOV AH,2
        INC DL
       INT 10H


        MOV AH,9
        MOV AL,UNIT
        MOV BL,14
        MOV CX,1
        INT 10H

        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  


        RET
        SCORE ENDP


        
       ;................ ENEMY MOVEMENT.....................
        ENEMYMOVEMENT PROC

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

      ;.................RANDOM NUMBER................

;       PUSH DX
;       MOV AX,[SEED]
;       MOV DX,8405H
;       MUL DX
;
;       CMP AX,[SEED]
;       JNZ GOTSEED
;       MOV AH,DL
;       INC AX
;
;GOTSEED:
;        MOV WORD PTR[SEED],AX
;        MOV AX,DX
;        MOV WORD PTR[RNDNUM],AX
;        POP DX

         XOR DX,DX
         MOV AX,RNDNUM
         MOV BX,26
         DIV BX
         DEC RNDNUM
       

         CMP DX,0
         JZ ZERO

         CMP DX,1
         JZ ONE1

         CMP DX,2
         JZ TWO2

         CMP DX,3
         JZ THREE3

         CMP DX,4
         JZ FOUR4

         CMP DX,5
         JZ FIVE5

         CMP DX,6
         JZ SIX6

         CMP DX,7
         JZ SEVEN7

         CMP DX,8
         JZ EIGHT8

         CMP DX,9
         JZ NINE9

         CMP DX,10
         JZ TEN10

         CMP DX,11
         JZ ELEVEN11

         CMP DX,12
         JZ TWELVE12

         CMP DX,13
         JZ THIRTEEN13

         CMP DX,14
         JZ FOURTEEN14

         CMP DX,15
         JZ FIFTEEN15

         CMP DX,16
         JZ SIXTEEN16

         CMP DX,17
         JZ SEVENTEEN17

         CMP DX,18
         JZ EIGHTEEN18

         CMP DX,19
         JZ NINETEEN19

         CMP DX,20
         JZ TWENTY20

         CMP DX,21
         JZ TWENTYONE21

         CMP DX,22
         JZ TWENTYTWO22

         CMP DX,23
         JZ TWENTYTHREE23

         CMP DX,24
         JZ TWENTYFOUR24


         CMP DX,25
         JZ TWENTYFIVE25



      ;.............................................

ZERO:        
       ;........FOR ENEMY 1 RIGHT MOVE.....................

        MOV CX,ENEMY1COL
        ADD CX,5
        MOV DX,ENEMY1ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,8
 WHILE50:
        CMP COUNTER,0
        JZ END_WHILE50
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE50
END_WHILE50:
         ;...................;

        SUB CX,8
        ADD DX,9

        MOV COUNTER,8
WHILE51:
        CMP COUNTER,0
        JZ END_WHILE51
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE51
END_WHILE51:

    ;......................;


         ;...................;

        SUB CX,8
        SUB DX,4

        MOV COUNTER,8
WHILE52:
        CMP COUNTER,0
        JZ END_WHILE52
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE52
END_WHILE52:

    ;......................;



         ;.............FOR GETTING NEXT PIXEL.................




        MOV DI,0

        MOV DX,ENEMY1ROW
        MOV CX,ENEMY1COL
        ADD CX,5
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE53:
        CMP COUNTER,0
        JZ END_WHILE53
        PUSH COUNTER
        MOV COUNTER,8
WHILE54:
         CMP COUNTER,0
         JZ END_WHILE54
         INT 10H
         CMP AL,0FH
         JNZ DI_0
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX
DI_0:
         INC CX
         DEC COUNTER
         JMP WHILE54
END_WHILE54:

         INC DX
         SUB CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE53
END_WHILE53:


          CMP DI ,0
          JNZ NEXT50
         MOV ROW1C,0
         MOV COL1C,0


NEXT50:        


        ;..........................................................

        CMP ROW1P,0
        JNZ DOTENEMY1



        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT1
DOTENEMY1:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT
NOTDOT1:
        ADD ENEMY1COL,8       ;.. INCREMENT IN COLUMN.....

     

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX,ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
     
REMAIN50:
       ;...............................................
       ;.........FOR ENEMY 2 LEFT MOVE...........................

        ;.........CHCK NEXT POSITION.................;

        MOV CX,ENEMY2COL
        SUB CX,3
        MOV DX,ENEMY2ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE56:
        CMP COUNTER,0
        JZ END_WHILE56
        INT 10H
        CMP AL,09H
        JZ REMAIN51
        DEC CX
        DEC COUNTER
        JMP WHILE56
END_WHILE56:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE57:
        CMP COUNTER,0
        JZ END_WHILE57
        INT 10H
        CMP AL,09H
        JZ REMAIN51
        DEC CX
        DEC COUNTER
        JMP WHILE57
END_WHILE57:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE58:
        CMP COUNTER,0
        JZ END_WHILE58
        INT 10H
        CMP AL,09H
        JZ REMAIN51
        DEC CX
        DEC COUNTER
        JMP WHILE58
END_WHILE58:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY2ROW
        MOV CX,ENEMY2COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE59:
        CMP COUNTER,0
        JZ END_WHILE59
        PUSH COUNTER
        MOV COUNTER,8
WHILE60:
         CMP COUNTER,0
         JZ END_WHILE60
         INT 10H
         CMP AL,0FH
         JNZ DI_1
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX
DI_1:
         DEC CX
         DEC COUNTER
         JMP WHILE60
END_WHILE60:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE59
END_WHILE59:


        CMP DI,0
         JNZ NEXT51
         MOV ROW2C,0
         MOV COL2C,0
        
  NEXT51:





    ;......................................................

        CMP ROW2P,0
        JNZ DOTENEMY2




        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT2

DOTENEMY2:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT
NOTDOT2:




        SUB ENEMY2COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
        
      
      

REMAIN51:
        ;.............................................;
        ;........FOR ENEMY 3 UP MOVE...................



        
        MOV CX,ENEMY3COL
        SUB CX,3
        MOV DX,ENEMY3ROW
        ADD DX,1
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE61:
        CMP COUNTER,0
        JZ END_WHILE61
        INT 10H
        CMP AL,09H
        JZ REMAIN52
        DEC DX
        DEC COUNTER
        JMP WHILE61
END_WHILE61:


         ;...................;

        ADD CX,7
        ADD DX,10

        MOV COUNTER,10
WHILE62:
        CMP COUNTER,0
        JZ END_WHILE62
        INT 10H
        CMP AL,09H
        JZ REMAIN52
        DEC DX
        DEC COUNTER
        JMP WHILE62
END_WHILE62:

    ;......................;


         ;...................;

        SUB CX,3
        ADD DX,10

        MOV COUNTER,10
WHILE63:
        CMP COUNTER,0
        JZ END_WHILE63
        INT 10H
        CMP AL,09H
        JZ REMAIN52
        DEC DX
        DEC COUNTER
        JMP WHILE63
END_WHILE63:

    ;........FOR GEETING NEXT PIXEL..............;



        MOV DI,0

        MOV DX,ENEMY3ROW
        DEC DX
        MOV CX,ENEMY3COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE64:
        CMP COUNTER,0
        JZ END_WHILE64
        PUSH COUNTER
        MOV COUNTER,10
WHILE65:
         CMP COUNTER,0
         JZ END_WHILE65
         INT 10H
         CMP AL,0FH
         JNZ DI_3
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX

DI_3:
         DEC DX
         DEC COUNTER
         JMP WHILE65
END_WHILE65:

         INC CX
         ADD DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE64
END_WHILE64:


         CMP DI,0
         JNZ NEXT52
         MOV ROW3C,0
         MOV COL3C,0
        
  NEXT52:
     


   
        ;....................




        CMP ROW3P,0
        JNZ DOTENEMY3




        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT3
DOTENEMY3:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT

       
NOTDOT3:
        SUB ENEMY3ROW,10       ;.. DECREMENT IN ROW.....

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
      

REMAIN52:
      



        ;..............................................
       ;...............................................
       JMP RETURN
     ;.....................  ONE 1...........................



ONE1:



       ;........FOR ENEMY 3 RIGHT MOVE.....................

        MOV CX,ENEMY3COL
        ADD CX,5
        MOV DX,ENEMY3ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,8
 WHILE66:
        CMP COUNTER,0
        JZ END_WHILE66
        INT 10H
        CMP AL,09H
        JZ REMAIN66
        INC CX
        DEC COUNTER
        JMP WHILE66
END_WHILE66:
         ;...................;

        SUB CX,8
        ADD DX,9

        MOV COUNTER,8
WHILE67:
        CMP COUNTER,0
        JZ END_WHILE67
        INT 10H
        CMP AL,09H
        JZ REMAIN66
        INC CX
        DEC COUNTER
        JMP WHILE67
END_WHILE67:

    ;......................;


         ;...................;

        SUB CX,8
        SUB DX,4

        MOV COUNTER,8
WHILE68:
        CMP COUNTER,0
        JZ END_WHILE68
        INT 10H
        CMP AL,09H
        JZ REMAIN66
        INC CX
        DEC COUNTER
        JMP WHILE68
END_WHILE68:

    ;......................;



         ;.............FOR GETTING NEXT PIXEL.................




        MOV DI,0

        MOV DX,ENEMY3ROW
        MOV CX,ENEMY3COL
        ADD CX,5
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE69:
        CMP COUNTER,0
        JZ END_WHILE69
        PUSH COUNTER
        MOV COUNTER,8
WHILE70:
         CMP COUNTER,0
         JZ END_WHILE70
         INT 10H
         CMP AL,0FH
         JNZ DI_66
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX
DI_66:
         INC CX
         DEC COUNTER
         JMP WHILE70
END_WHILE70:

         INC DX
         SUB CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE69
END_WHILE69:


          CMP DI ,0
          JNZ NEXT66
         MOV ROW3C,0
         MOV COL3C,0


NEXT66:        


        ;..........................................................

        CMP ROW3P,0
        JNZ DOTENEMY66



        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT66
DOTENEMY66:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT
NOTDOT66:
        ADD ENEMY3COL,8       ;.. INCREMENT IN COLUMN.....

     

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX,ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
     
REMAIN66:
       ;...............................................
       ;.........FOR ENEMY 1 LEFT MOVE...........................

        ;.........CHCK NEXT POSITION.................;

        MOV CX,ENEMY1COL
        SUB CX,3
        MOV DX,ENEMY1ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE71:
        CMP COUNTER,0
        JZ END_WHILE71
        INT 10H
        CMP AL,09H
        JZ REMAIN71
        DEC CX
        DEC COUNTER
        JMP WHILE71
END_WHILE71:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE72:
        CMP COUNTER,0
        JZ END_WHILE72
        INT 10H
        CMP AL,09H
        JZ REMAIN71
        DEC CX
        DEC COUNTER
        JMP WHILE72
END_WHILE72:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE73:
        CMP COUNTER,0
        JZ END_WHILE73
        INT 10H
        CMP AL,09H
        JZ REMAIN71
        DEC CX
        DEC COUNTER
        JMP WHILE73
END_WHILE73:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY1ROW
        MOV CX,ENEMY1COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE74:
        CMP COUNTER,0
        JZ END_WHILE74
        PUSH COUNTER
        MOV COUNTER,8
WHILE75:
         CMP COUNTER,0
         JZ END_WHILE75
         INT 10H
         CMP AL,0FH
         JNZ DI_71
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX
DI_71:
         DEC CX
         DEC COUNTER
         JMP WHILE75
END_WHILE75:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE74
END_WHILE74:


        CMP DI,0
         JNZ NEXT71
         MOV ROW1C,0
         MOV COL1C,0
        
  NEXT71:





    ;......................................................

        CMP ROW1P,0
        JNZ DOTENEMY71




        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT71

DOTENEMY71:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT
NOTDOT71:




        SUB ENEMY1COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
        
      
      

REMAIN71:
        ;.............................................;
        ;........FOR ENEMY 2 UP MOVE...................



        
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV DX,ENEMY2ROW
        ADD DX,1
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE76:
        CMP COUNTER,0
        JZ END_WHILE76
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE76
END_WHILE76:


         ;...................;

        ADD CX,7
        ADD DX,10

        MOV COUNTER,10
WHILE77:
        CMP COUNTER,0
        JZ END_WHILE77
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE77
END_WHILE77:

    ;......................;


         ;...................;

        SUB CX,3
        ADD DX,10

        MOV COUNTER,10
WHILE78:
        CMP COUNTER,0
        JZ END_WHILE78
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE78
END_WHILE78:

    ;........FOR GEETING NEXT PIXEL..............;



        MOV DI,0

        MOV DX,ENEMY2ROW
        DEC DX
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE79:
        CMP COUNTER,0
        JZ END_WHILE79
        PUSH COUNTER
        MOV COUNTER,10
WHILE80:
         CMP COUNTER,0
         JZ END_WHILE80
         INT 10H
         CMP AL,0FH
         JNZ DI_76
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX

DI_76:
         DEC DX
         DEC COUNTER
         JMP WHILE80
END_WHILE80:

         INC CX
         ADD DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE79
END_WHILE79:


         CMP DI,0
         JNZ NEXT76
         MOV ROW2C,0
         MOV COL2C,0
        
  NEXT76:
     


   
        ;....................




        CMP ROW2P,0
        JNZ DOTENEMY76




        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT76
DOTENEMY76:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT

       
NOTDOT76:
        SUB ENEMY2ROW,10       ;.. DECREMENT IN ROW.....

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
      

REMAIN76:
      



        ;..............................................
       ;...............................................
       JMP RETURN



TWO2:
        ;...FOR 2ND ENEMY DOWN MOVEMENT.................


      
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV DX,ENEMY2ROW
        ADD DX,10
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE81:
        CMP COUNTER,0
        JZ END_WHILE81
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE81
END_WHILE81:


         ;...................;

        ADD CX,7
        SUB DX,10

        MOV COUNTER,10
WHILE82:
        CMP COUNTER,0
        JZ END_WHILE82
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE82
END_WHILE82:

    ;......................;


         ;...................;

        SUB CX,3
        SUB DX,10

        MOV COUNTER,10
WHILE83:
        CMP COUNTER,0
        JZ END_WHILE83
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE83
END_WHILE83:

    ;........FOR GEETING NEXT PIXEL..............;


        MOV DI,0

        MOV DX,ENEMY2ROW
        ADD DX,10
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE84:
        CMP COUNTER,0
        JZ END_WHILE84
        PUSH COUNTER
        MOV COUNTER,10
WHILE85:
         CMP COUNTER,0
         JZ END_WHILE85
         INT 10H
         CMP AL,0FH
         JNZ DI_81
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX

DI_81:
         INC DX
         DEC COUNTER
         JMP WHILE85
END_WHILE85:

         INC CX
         SUB DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE84
END_WHILE84:


         CMP DI,0
         JNZ NEXT81
         MOV ROW2C,0
         MOV COL2C,0
        
  NEXT81:
      



        ;....................




        CMP ROW2P,0
        JNZ DOTENEMY81




        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT81
DOTENEMY81:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT

       
NOTDOT81:
     

        ADD ENEMY2ROW,10       ;.. INCREMENT IN ROW.....

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
        
REMAIN81:
    ;........................................

    ;... FOR ENEMY1 LEFT MOVE.................

        MOV CX,ENEMY1COL
        SUB CX,3
        MOV DX,ENEMY1ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE86:
        CMP COUNTER,0
        JZ END_WHILE86
        INT 10H
        CMP AL,09H
        JZ REMAIN86
        DEC CX
        DEC COUNTER
        JMP WHILE86
END_WHILE86:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE87:
        CMP COUNTER,0
        JZ END_WHILE87
        INT 10H
        CMP AL,09H
        JZ REMAIN86
        DEC CX
        DEC COUNTER
        JMP WHILE87
END_WHILE87:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE88:
        CMP COUNTER,0
        JZ END_WHILE88
        INT 10H
        CMP AL,09H
        JZ REMAIN86
        DEC CX
        DEC COUNTER
        JMP WHILE88
END_WHILE88:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY1ROW
        MOV CX,ENEMY1COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE89:
        CMP COUNTER,0
        JZ END_WHILE89
        PUSH COUNTER
        MOV COUNTER,8
WHILE90:
         CMP COUNTER,0
         JZ END_WHILE90
         INT 10H
         CMP AL,0FH
         JNZ DI_86
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX
DI_86:
         DEC CX
         DEC COUNTER
         JMP WHILE90
END_WHILE90:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE89
END_WHILE89:


        CMP DI,0
         JNZ NEXT86
         MOV ROW1C,0
         MOV COL1C,0
        
  NEXT86:





    ;......................................................

        CMP ROW1P,0
        JNZ DOTENEMY86




        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT86

DOTENEMY86:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT
NOTDOT86:




        SUB ENEMY1COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
        
      
      

REMAIN86:


    ;..........................................
     ;.......FOR ENEMY 3 LEFT MOVE............



        MOV CX,ENEMY3COL
        SUB CX,3
        MOV DX,ENEMY3ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE91:
        CMP COUNTER,0
        JZ END_WHILE91
        INT 10H
        CMP AL,09H
        JZ REMAIN91
        DEC CX
        DEC COUNTER
        JMP WHILE91
END_WHILE91:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE92:
        CMP COUNTER,0
        JZ END_WHILE92
        INT 10H
        CMP AL,09H
        JZ REMAIN91
        DEC CX
        DEC COUNTER
        JMP WHILE92
END_WHILE92:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE93:
        CMP COUNTER,0
        JZ END_WHILE93
        INT 10H
        CMP AL,09H
        JZ REMAIN91
        DEC CX
        DEC COUNTER
        JMP WHILE93
END_WHILE93:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY3ROW
        MOV CX,ENEMY3COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE94:
        CMP COUNTER,0
        JZ END_WHILE94
        PUSH COUNTER
        MOV COUNTER,8
WHILE95:
         CMP COUNTER,0
         JZ END_WHILE95
         INT 10H
         CMP AL,0FH
         JNZ DI_91
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX
DI_91:
         DEC CX
         DEC COUNTER
         JMP WHILE95
END_WHILE95:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE94
END_WHILE94:


        CMP DI,0
         JNZ NEXT91
         MOV ROW3C,0
         MOV COL3C,0
        
  NEXT91:





    ;......................................................

        CMP ROW3P,0
        JNZ DOTENEMY91




        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT91

DOTENEMY91:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT
NOTDOT91:




        SUB ENEMY3COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
        
      
      

REMAIN91:





    ;............................................

       JMP RETURN









THREE3:

        CALL ENEMY1LEFT
        CALL ENEMY2LEFT
        CALL ENEMY3RIGHT

         JMP RETURN
           


FOUR4:

        CALL ENEMY1LEFT
        CALL ENEMY2LEFT
        CALL ENEMY3RIGHT

         JMP RETURN




 FIVE5:
        CALL ENEMY1DOWN
        CALL ENEMY2UP
        CALL ENEMY3UP

         JMP RETURN
        

SIX6:
        CALL ENEMY1DOWN
        CALL ENEMY2UP
        CALL ENEMY3UP

         JMP RETURN
        


SEVEN7:
        CALL ENEMY1LEFT
        CALL ENEMY2LEFT
        CALL ENEMY3UP

         JMP RETURN
        

EIGHT8:
        CALL ENEMY1LEFT
        CALL ENEMY2LEFT
        CALL ENEMY3UP

         JMP RETURN
        

NINE9:
        CALL ENEMY1DOWN
        CALL ENEMY2UP
        CALL ENEMY3RIGHT

         JMP RETURN
        

TEN10:
        CALL ENEMY1DOWN
        CALL ENEMY2UP
        CALL ENEMY3RIGHT

         JMP RETURN
        


ELEVEN11:
        CALL ENEMY1LEFT
        CALL ENEMY2LEFT
        CALL ENEMY3RIGHT

         JMP RETURN
        

TWELVE12:
        CALL ENEMY1LEFT
        CALL ENEMY2LEFT
        CALL ENEMY3UP

         JMP RETURN
        

THIRTEEN13:
        CALL ENEMY1DOWN
        CALL ENEMY2UP
        CALL ENEMY3UP

         JMP RETURN
        
FOURTEEN14:

        CALL ENEMY1DOWN
        CALL ENEMY2UP
        CALL ENEMY3UP

         JMP RETURN
FIFTEEN15:
        CALL ENEMY1RIGHT
        CALL ENEMY2RIGHT
        CALL ENEMY3UP

         JMP RETURN
        
SIXTEEN16:
        CALL ENEMY1RIGHT
        CALL ENEMY2RIGHT
        CALL ENEMY3UP

         JMP RETURN
        
SEVENTEEN17:
        CALL ENEMY1UP
        CALL ENEMY2RIGHT
        CALL ENEMY3LEFT

         JMP RETURN
        

EIGHTEEN18:
        CALL ENEMY1UP
        CALL ENEMY2RIGHT
        CALL ENEMY3LEFT

         JMP RETURN
        


NINETEEN19:
        
        CALL ENEMY1RIGHT
        CALL ENEMY2RIGHT
        CALL ENEMY3LEFT

         JMP RETURN

TWENTY20:
        CALL ENEMY1RIGHT
        CALL ENEMY2RIGHT
        CALL ENEMY3LEFT

         JMP RETURN
        
TWENTYONE21:
        CALL ENEMY1UP
        CALL ENEMY2DOWN
        CALL ENEMY3LEFT

         JMP RETURN
        
TWENTYTWO22:
        CALL ENEMY1UP
        CALL ENEMY2DOWN
        CALL ENEMY3DOWN

         JMP RETURN


TWENTYTHREE23:
        CALL ENEMY1RIGHT
        CALL ENEMY2DOWN
        CALL ENEMY3DOWN

         JMP RETURN
        
TWENTYFOUR24:
        CALL ENEMY1RIGHT
        CALL ENEMY2DOWN
        CALL ENEMY3DOWN

         JMP RETURN
        
TWENTYFIVE25:
        CALL ENEMY1UP
        CALL ENEMY2DOWN
        CALL ENEMY3DOWN

         JMP RETURN
        



  ;....................................................

RETURN:

        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  




        
        RET
        ENEMYMOVEMENT ENDP


 


;........................ENEMY 1 RIGHT MOVE..........................

        ENEMY1RIGHT PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,ENEMY1COL
        ADD CX,5
        MOV DX,ENEMY1ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,8
 WHILE50:
        CMP COUNTER,0
        JZ END_WHILE50
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE50
END_WHILE50:
         ;...................;

        SUB CX,8
        ADD DX,9

        MOV COUNTER,8
WHILE51:
        CMP COUNTER,0
        JZ END_WHILE51
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE51
END_WHILE51:

    ;......................;


         ;...................;

        SUB CX,8
        SUB DX,4

        MOV COUNTER,8
WHILE52:
        CMP COUNTER,0
        JZ END_WHILE52
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE52
END_WHILE52:

    ;......................;



         ;.............FOR GETTING NEXT PIXEL.................




        MOV DI,0

        MOV DX,ENEMY1ROW
        MOV CX,ENEMY1COL
        ADD CX,5
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE53:
        CMP COUNTER,0
        JZ END_WHILE53
        PUSH COUNTER
        MOV COUNTER,8
WHILE54:
         CMP COUNTER,0
         JZ END_WHILE54
         INT 10H
         CMP AL,0FH
         JNZ DI_0
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX
DI_0:
         INC CX
         DEC COUNTER
         JMP WHILE54
END_WHILE54:

         INC DX
         SUB CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE53
END_WHILE53:


          CMP DI ,0
          JNZ NEXT50
         MOV ROW1C,0
         MOV COL1C,0


NEXT50:        


        ;..........................................................

        CMP ROW1P,0
        JNZ DOTENEMY1



        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT1
DOTENEMY1:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT
NOTDOT1:
        ADD ENEMY1COL,8       ;.. INCREMENT IN COLUMN.....

     

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX,ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
     
REMAIN50:





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET

         ENEMY1RIGHT ENDP


;........................ENEMY 2 RIGHT MOVE..........................

        ENEMY2RIGHT PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,ENEMY2COL
        ADD CX,5
        MOV DX,ENEMY2ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,8
 WHILE50:
        CMP COUNTER,0
        JZ END_WHILE50
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE50
END_WHILE50:
         ;...................;

        SUB CX,8
        ADD DX,9

        MOV COUNTER,8
WHILE51:
        CMP COUNTER,0
        JZ END_WHILE51
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE51
END_WHILE51:

    ;......................;


         ;...................;

        SUB CX,8
        SUB DX,4

        MOV COUNTER,8
WHILE52:
        CMP COUNTER,0
        JZ END_WHILE52
        INT 10H
        CMP AL,09H
        JZ REMAIN50
        INC CX
        DEC COUNTER
        JMP WHILE52
END_WHILE52:

    ;......................;



         ;.............FOR GETTING NEXT PIXEL.................




        MOV DI,0

        MOV DX,ENEMY2ROW
        MOV CX,ENEMY2COL
        ADD CX,5
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE53:
        CMP COUNTER,0
        JZ END_WHILE53
        PUSH COUNTER
        MOV COUNTER,8
WHILE54:
         CMP COUNTER,0
         JZ END_WHILE54
         INT 10H
         CMP AL,0FH
         JNZ DI_0
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX
DI_0:
         INC CX
         DEC COUNTER
         JMP WHILE54
END_WHILE54:

         INC DX
         SUB CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE53
END_WHILE53:


          CMP DI ,0
          JNZ NEXT50
         MOV ROW2C,0
         MOV COL2C,0


NEXT50:        


        ;..........................................................

        CMP ROW2P,0
        JNZ DOTENEMY1



        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT1
DOTENEMY1:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT
NOTDOT1:
        ADD ENEMY2COL,8       ;.. INCREMENT IN COLUMN.....

     

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX,ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
     
REMAIN50:





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET

         ENEMY2RIGHT ENDP

   ;...........FOR ENEMY 3 RIGHT MOVE......................

         ENEMY3RIGHT PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI




        MOV CX,ENEMY3COL
        ADD CX,5
        MOV DX,ENEMY3ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,8
 WHILE66:
        CMP COUNTER,0
        JZ END_WHILE66
        INT 10H
        CMP AL,09H
        JZ REMAIN66
        INC CX
        DEC COUNTER
        JMP WHILE66
END_WHILE66:
         ;...................;

        SUB CX,8
        ADD DX,9

        MOV COUNTER,8
WHILE67:
        CMP COUNTER,0
        JZ END_WHILE67
        INT 10H
        CMP AL,09H
        JZ REMAIN66
        INC CX
        DEC COUNTER
        JMP WHILE67
END_WHILE67:

    ;......................;


         ;...................;

        SUB CX,8
        SUB DX,4

        MOV COUNTER,8
WHILE68:
        CMP COUNTER,0
        JZ END_WHILE68
        INT 10H
        CMP AL,09H
        JZ REMAIN66
        INC CX
        DEC COUNTER
        JMP WHILE68
END_WHILE68:

    ;......................;



         ;.............FOR GETTING NEXT PIXEL.................




        MOV DI,0

        MOV DX,ENEMY3ROW
        MOV CX,ENEMY3COL
        ADD CX,5
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE69:
        CMP COUNTER,0
        JZ END_WHILE69
        PUSH COUNTER
        MOV COUNTER,8
WHILE70:
         CMP COUNTER,0
         JZ END_WHILE70
         INT 10H
         CMP AL,0FH
         JNZ DI_66
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX
DI_66:
         INC CX
         DEC COUNTER
         JMP WHILE70
END_WHILE70:

         INC DX
         SUB CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE69
END_WHILE69:


          CMP DI ,0
          JNZ NEXT66
         MOV ROW3C,0
         MOV COL3C,0


NEXT66:        


        ;..........................................................

        CMP ROW3P,0
        JNZ DOTENEMY66



        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT66
DOTENEMY66:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT
NOTDOT66:
        ADD ENEMY3COL,8       ;.. INCREMENT IN COLUMN.....

     

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX,ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
     
REMAIN66:



        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET




         ENEMY3RIGHT ENDP
 ;.....................FOR ENEMY1 LEFT MOVE..................
        ENEMY1LEFT PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI



        MOV CX,ENEMY1COL
        SUB CX,3
        MOV DX,ENEMY1ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE86:
        CMP COUNTER,0
        JZ END_WHILE86
        INT 10H
        CMP AL,09H
        JZ REMAIN86
        DEC CX
        DEC COUNTER
        JMP WHILE86
END_WHILE86:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE87:
        CMP COUNTER,0
        JZ END_WHILE87
        INT 10H
        CMP AL,09H
        JZ REMAIN86
        DEC CX
        DEC COUNTER
        JMP WHILE87
END_WHILE87:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE88:
        CMP COUNTER,0
        JZ END_WHILE88
        INT 10H
        CMP AL,09H
        JZ REMAIN86
        DEC CX
        DEC COUNTER
        JMP WHILE88
END_WHILE88:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY1ROW
        MOV CX,ENEMY1COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE89:
        CMP COUNTER,0
        JZ END_WHILE89
        PUSH COUNTER
        MOV COUNTER,8
WHILE90:
         CMP COUNTER,0
         JZ END_WHILE90
         INT 10H
         CMP AL,0FH
         JNZ DI_86
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX
DI_86:
         DEC CX
         DEC COUNTER
         JMP WHILE90
END_WHILE90:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE89
END_WHILE89:


        CMP DI,0
         JNZ NEXT86
         MOV ROW1C,0
         MOV COL1C,0
        
  NEXT86:





    ;......................................................

        CMP ROW1P,0
        JNZ DOTENEMY86




        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT86

DOTENEMY86:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT
NOTDOT86:




        SUB ENEMY1COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
        
      
      

REMAIN86:




        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


        ENEMY1LEFT ENDP
 ;.....................FOR ENEMY2 LEFT MOVE..................
        ENEMY2LEFT PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        MOV CX,ENEMY2COL
        SUB CX,3
        MOV DX,ENEMY2ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE56:
        CMP COUNTER,0
        JZ END_WHILE56
        INT 10H
        CMP AL,09H
        JZ REMAIN51
        DEC CX
        DEC COUNTER
        JMP WHILE56
END_WHILE56:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE57:
        CMP COUNTER,0
        JZ END_WHILE57
        INT 10H
        CMP AL,09H
        JZ REMAIN51
        DEC CX
        DEC COUNTER
        JMP WHILE57
END_WHILE57:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE58:
        CMP COUNTER,0
        JZ END_WHILE58
        INT 10H
        CMP AL,09H
        JZ REMAIN51
        DEC CX
        DEC COUNTER
        JMP WHILE58
END_WHILE58:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY2ROW
        MOV CX,ENEMY2COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE59:
        CMP COUNTER,0
        JZ END_WHILE59
        PUSH COUNTER
        MOV COUNTER,8
WHILE60:
         CMP COUNTER,0
         JZ END_WHILE60
         INT 10H
         CMP AL,0FH
         JNZ DI_1
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX
DI_1:
         DEC CX
         DEC COUNTER
         JMP WHILE60
END_WHILE60:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE59
END_WHILE59:


        CMP DI,0
         JNZ NEXT51
         MOV ROW2C,0
         MOV COL2C,0
        
  NEXT51:





    ;......................................................

        CMP ROW2P,0
        JNZ DOTENEMY2




        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT2

DOTENEMY2:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT
NOTDOT2:




        SUB ENEMY2COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
        
      
      

REMAIN51:





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


        ENEMY2LEFT ENDP
 ;.....................FOR ENEMY3 LEFT MOVE..................
        ENEMY3LEFT PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI



        MOV CX,ENEMY3COL
        SUB CX,3
        MOV DX,ENEMY3ROW


        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,9
 WHILE91:
        CMP COUNTER,0
        JZ END_WHILE91
        INT 10H
        CMP AL,09H
        JZ REMAIN91
        DEC CX
        DEC COUNTER
        JMP WHILE91
END_WHILE91:

         ;...................;

        ADD CX,8
        ADD DX,9

        MOV COUNTER,9
WHILE92:
        CMP COUNTER,0
        JZ END_WHILE92
        INT 10H
        CMP AL,09H
        JZ REMAIN91
        DEC CX
        DEC COUNTER
        JMP WHILE92
END_WHILE92:

    ;......................;


         ;...................;

        ADD CX,8
        SUB DX,4

        MOV COUNTER,9
WHILE93:
        CMP COUNTER,0
        JZ END_WHILE93
        INT 10H
        CMP AL,09H
        JZ REMAIN91
        DEC CX
        DEC COUNTER
        JMP WHILE93
END_WHILE93:

    ;...........FOR GEETING NEXT PIXEL......................

        MOV DI,0

        MOV DX,ENEMY3ROW
        MOV CX,ENEMY3COL
        SUB CX,4
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,10

WHILE94:
        CMP COUNTER,0
        JZ END_WHILE94
        PUSH COUNTER
        MOV COUNTER,8
WHILE95:
         CMP COUNTER,0
         JZ END_WHILE95
         INT 10H
         CMP AL,0FH
         JNZ DI_91
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX
DI_91:
         DEC CX
         DEC COUNTER
         JMP WHILE95
END_WHILE95:

         INC DX
         ADD CX,8
         POP COUNTER
         DEC COUNTER
         JMP WHILE94
END_WHILE94:


        CMP DI,0
         JNZ NEXT91
         MOV ROW3C,0
         MOV COL3C,0
        
  NEXT91:





    ;......................................................

        CMP ROW3P,0
        JNZ DOTENEMY91




        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT91

DOTENEMY91:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT
NOTDOT91:




        SUB ENEMY3COL,8       ;.. DECREMENT IN COLUMN.....

     

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...
        MOV BX,ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
        
      
      

REMAIN91:




        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


        ENEMY3LEFT ENDP

    ;......FOR ENEMY 1 UP MOVE................
    ENEMY1UP PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        
        MOV CX,ENEMY1COL
        SUB CX,3
        MOV DX,ENEMY1ROW
        ADD DX,1
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE76:
        CMP COUNTER,0
        JZ END_WHILE76
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE76
END_WHILE76:


         ;...................;

        ADD CX,7
        ADD DX,10

        MOV COUNTER,10
WHILE77:
        CMP COUNTER,0
        JZ END_WHILE77
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE77
END_WHILE77:

    ;......................;


         ;...................;

        SUB CX,3
        ADD DX,10

        MOV COUNTER,10
WHILE78:
        CMP COUNTER,0
        JZ END_WHILE78
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE78
END_WHILE78:

    ;........FOR GEETING NEXT PIXEL..............;



        MOV DI,0

        MOV DX,ENEMY1ROW
        DEC DX
        MOV CX,ENEMY1COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE79:
        CMP COUNTER,0
        JZ END_WHILE79
        PUSH COUNTER
        MOV COUNTER,10
WHILE80:
         CMP COUNTER,0
         JZ END_WHILE80
         INT 10H
         CMP AL,0FH
         JNZ DI_76
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX

DI_76:
         DEC DX
         DEC COUNTER
         JMP WHILE80
END_WHILE80:

         INC CX
         ADD DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE79
END_WHILE79:


         CMP DI,0
         JNZ NEXT76
         MOV ROW1C,0
         MOV COL1C,0
        
  NEXT76:
     


   
        ;....................




        CMP ROW1P,0
        JNZ DOTENEMY76




        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT76
DOTENEMY76:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT

       
NOTDOT76:
        SUB ENEMY1ROW,10       ;.. DECREMENT IN ROW.....

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
      

REMAIN76:
      





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


    ENEMY1UP ENDP


    ;......FOR ENEMY 2 UP MOVE................
    ENEMY2UP PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV DX,ENEMY2ROW
        ADD DX,1
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE76:
        CMP COUNTER,0
        JZ END_WHILE76
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE76
END_WHILE76:


         ;...................;

        ADD CX,7
        ADD DX,10

        MOV COUNTER,10
WHILE77:
        CMP COUNTER,0
        JZ END_WHILE77
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE77
END_WHILE77:

    ;......................;


         ;...................;

        SUB CX,3
        ADD DX,10

        MOV COUNTER,10
WHILE78:
        CMP COUNTER,0
        JZ END_WHILE78
        INT 10H
        CMP AL,09H
        JZ REMAIN76
        DEC DX
        DEC COUNTER
        JMP WHILE78
END_WHILE78:

    ;........FOR GEETING NEXT PIXEL..............;



        MOV DI,0

        MOV DX,ENEMY2ROW
        DEC DX
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE79:
        CMP COUNTER,0
        JZ END_WHILE79
        PUSH COUNTER
        MOV COUNTER,10
WHILE80:
         CMP COUNTER,0
         JZ END_WHILE80
         INT 10H
         CMP AL,0FH
         JNZ DI_76
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX

DI_76:
         DEC DX
         DEC COUNTER
         JMP WHILE80
END_WHILE80:

         INC CX
         ADD DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE79
END_WHILE79:


         CMP DI,0
         JNZ NEXT76
         MOV ROW2C,0
         MOV COL2C,0
        
  NEXT76:
     


   
        ;....................




        CMP ROW2P,0
        JNZ DOTENEMY76




        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT76
DOTENEMY76:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT

       
NOTDOT76:
        SUB ENEMY2ROW,10       ;.. DECREMENT IN ROW.....

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
      

REMAIN76:
      





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


    ENEMY2UP ENDP

    ;......FOR ENEMY 3 UP MOVE................
    ENEMY3UP PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


        
        MOV CX,ENEMY3COL
        SUB CX,3
        MOV DX,ENEMY3ROW
        ADD DX,1
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE61:
        CMP COUNTER,0
        JZ END_WHILE61
        INT 10H
        CMP AL,09H
        JZ REMAIN52
        DEC DX
        DEC COUNTER
        JMP WHILE61
END_WHILE61:


         ;...................;

        ADD CX,7
        ADD DX,10

        MOV COUNTER,10
WHILE62:
        CMP COUNTER,0
        JZ END_WHILE62
        INT 10H
        CMP AL,09H
        JZ REMAIN52
        DEC DX
        DEC COUNTER
        JMP WHILE62
END_WHILE62:

    ;......................;


         ;...................;

        SUB CX,3
        ADD DX,10

        MOV COUNTER,10
WHILE63:
        CMP COUNTER,0
        JZ END_WHILE63
        INT 10H
        CMP AL,09H
        JZ REMAIN52
        DEC DX
        DEC COUNTER
        JMP WHILE63
END_WHILE63:

    ;........FOR GEETING NEXT PIXEL..............;



        MOV DI,0

        MOV DX,ENEMY3ROW
        DEC DX
        MOV CX,ENEMY3COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE64:
        CMP COUNTER,0
        JZ END_WHILE64
        PUSH COUNTER
        MOV COUNTER,10
WHILE65:
         CMP COUNTER,0
         JZ END_WHILE65
         INT 10H
         CMP AL,0FH
         JNZ DI_3
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX

DI_3:
         DEC DX
         DEC COUNTER
         JMP WHILE65
END_WHILE65:

         INC CX
         ADD DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE64
END_WHILE64:


         CMP DI,0
         JNZ NEXT52
         MOV ROW3C,0
         MOV COL3C,0
        
  NEXT52:
     


   
        ;....................




        CMP ROW3P,0
        JNZ DOTENEMY3




        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE PACMAN CURRENT LOCATION...
        JMP NOTDOT3
DOTENEMY3:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT

       
NOTDOT3:
        SUB ENEMY3ROW,10       ;.. DECREMENT IN ROW.....

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
      

REMAIN52:
      



        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


    ENEMY3UP ENDP

          ;....... FOR ENEMY 1 DOWN PROC..........

        ENEMY1DOWN PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


      
        MOV CX,ENEMY1COL
        SUB CX,3
        MOV DX,ENEMY1ROW
        ADD DX,10
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE81:
        CMP COUNTER,0
        JZ END_WHILE81
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE81
END_WHILE81:


         ;...................;

        ADD CX,7
        SUB DX,10

        MOV COUNTER,10
WHILE82:
        CMP COUNTER,0
        JZ END_WHILE82
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE82
END_WHILE82:

    ;......................;


         ;...................;

        SUB CX,3
        SUB DX,10

        MOV COUNTER,10
WHILE83:
        CMP COUNTER,0
        JZ END_WHILE83
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE83
END_WHILE83:

    ;........FOR GEETING NEXT PIXEL..............;


        MOV DI,0

        MOV DX,ENEMY1ROW
        ADD DX,10
        MOV CX,ENEMY1COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE84:
        CMP COUNTER,0
        JZ END_WHILE84
        PUSH COUNTER
        MOV COUNTER,10
WHILE85:
         CMP COUNTER,0
         JZ END_WHILE85
         INT 10H
         CMP AL,0FH
         JNZ DI_81
         MOV DI,1
         MOV ROW1C,DX
         MOV COL1C,CX

DI_81:
         INC DX
         DEC COUNTER
         JMP WHILE85
END_WHILE85:

         INC CX
         SUB DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE84
END_WHILE84:


         CMP DI,0
         JNZ NEXT81
         MOV ROW1C,0
         MOV COL1C,0
        
  NEXT81:
      



        ;....................




        CMP ROW1P,0
        JNZ DOTENEMY81




        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT81
DOTENEMY81:
        MOV BX,ROW1P
        MOV ROW,BX
        MOV BX,COL1P
        MOV COL,BX

        PUSH ENEMY1ROW
        PUSH ENEMY1COL
        CALL RBALLDOT

       
NOTDOT81:
     

        ADD ENEMY1ROW,10       ;.. INCREMENT IN ROW.....

        PUSH ENEMY1ROW
        PUSH ENEMY1COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW1C
        MOV ROW1P,BX
        MOV BX,COL1C
        MOV COL1P,BX
        
REMAIN81:




        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET



         ENEMY1DOWN ENDP

          ;....... FOR ENEMY 2 DOWN PROC..........

        ENEMY2DOWN PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

      
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV DX,ENEMY2ROW
        ADD DX,10
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE81:
        CMP COUNTER,0
        JZ END_WHILE81
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE81
END_WHILE81:


         ;...................;

        ADD CX,7
        SUB DX,10

        MOV COUNTER,10
WHILE82:
        CMP COUNTER,0
        JZ END_WHILE82
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE82
END_WHILE82:

    ;......................;


         ;...................;

        SUB CX,3
        SUB DX,10

        MOV COUNTER,10
WHILE83:
        CMP COUNTER,0
        JZ END_WHILE83
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE83
END_WHILE83:

    ;........FOR GEETING NEXT PIXEL..............;


        MOV DI,0

        MOV DX,ENEMY2ROW
        ADD DX,10
        MOV CX,ENEMY2COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE84:
        CMP COUNTER,0
        JZ END_WHILE84
        PUSH COUNTER
        MOV COUNTER,10
WHILE85:
         CMP COUNTER,0
         JZ END_WHILE85
         INT 10H
         CMP AL,0FH
         JNZ DI_81
         MOV DI,1
         MOV ROW2C,DX
         MOV COL2C,CX

DI_81:
         INC DX
         DEC COUNTER
         JMP WHILE85
END_WHILE85:

         INC CX
         SUB DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE84
END_WHILE84:


         CMP DI,0
         JNZ NEXT81
         MOV ROW2C,0
         MOV COL2C,0
        
  NEXT81:
      



        ;....................




        CMP ROW2P,0
        JNZ DOTENEMY81




        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT81
DOTENEMY81:
        MOV BX,ROW2P
        MOV ROW,BX
        MOV BX,COL2P
        MOV COL,BX

        PUSH ENEMY2ROW
        PUSH ENEMY2COL
        CALL RBALLDOT

       
NOTDOT81:
     

        ADD ENEMY2ROW,10       ;.. INCREMENT IN ROW.....

        PUSH ENEMY2ROW
        PUSH ENEMY2COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW2C
        MOV ROW2P,BX
        MOV BX,COL2C
        MOV COL2P,BX
        
REMAIN81:





        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET



         ENEMY2DOWN ENDP


          ;....... FOR ENEMY 3 DOWN PROC..........

        ENEMY3DOWN PROC


        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI


      
        MOV CX,ENEMY3COL
        SUB CX,3
        MOV DX,ENEMY3ROW
        ADD DX,10
        MOV AH,0DH
        XOR BX,BX
        MOV COUNTER,10
 WHILE81:
        CMP COUNTER,0
        JZ END_WHILE81
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE81
END_WHILE81:


         ;...................;

        ADD CX,7
        SUB DX,10

        MOV COUNTER,10
WHILE82:
        CMP COUNTER,0
        JZ END_WHILE82
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE82
END_WHILE82:

    ;......................;


         ;...................;

        SUB CX,3
        SUB DX,10

        MOV COUNTER,10
WHILE83:
        CMP COUNTER,0
        JZ END_WHILE83
        INT 10H
        CMP AL,09H
        JZ REMAIN81
        INC DX
        DEC COUNTER
        JMP WHILE83
END_WHILE83:

    ;........FOR GEETING NEXT PIXEL..............;


        MOV DI,0

        MOV DX,ENEMY3ROW
        ADD DX,10
        MOV CX,ENEMY3COL
        SUB CX,3
        MOV AH,0DH
        XOR BH,BH
        MOV COUNTER,8

WHILE84:
        CMP COUNTER,0
        JZ END_WHILE84
        PUSH COUNTER
        MOV COUNTER,10
WHILE85:
         CMP COUNTER,0
         JZ END_WHILE85
         INT 10H
         CMP AL,0FH
         JNZ DI_81
         MOV DI,1
         MOV ROW3C,DX
         MOV COL3C,CX

DI_81:
         INC DX
         DEC COUNTER
         JMP WHILE85
END_WHILE85:

         INC CX
         SUB DX,10
         POP COUNTER
         DEC COUNTER
         JMP WHILE84
END_WHILE84:


         CMP DI,0
         JNZ NEXT81
         MOV ROW3C,0
         MOV COL3C,0
        
  NEXT81:
      



        ;....................




        CMP ROW3P,0
        JNZ DOTENEMY81




        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALL     ;..REMOVE ENEMY CURRENT LOCATION...
        JMP NOTDOT81
DOTENEMY81:
        MOV BX,ROW3P
        MOV ROW,BX
        MOV BX,COL3P
        MOV COL,BX

        PUSH ENEMY3ROW
        PUSH ENEMY3COL
        CALL RBALLDOT

       
NOTDOT81:
     

        ADD ENEMY3ROW,10       ;.. INCREMENT IN ROW.....

        PUSH ENEMY3ROW
        PUSH ENEMY3COL 
        CALL ENEMY    ;..PRINT ENEMY ON NXT POSITION...

        MOV BX, ROW3C
        MOV ROW3P,BX
        MOV BX,COL3C
        MOV COL3P,BX
        
REMAIN81:












        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET



         ENEMY3DOWN ENDP

  ;..................................TOWARDS ENEMY..............
       TOWARDSENEMY PROC



        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI

       MOV AX,ENEMY1ROW
       MOV BX,ENEMY1COL
       MOV CX,ENEMY2ROW
       MOV DX,ENEMY2COL
       MOV SI,ENEMY3ROW
       MOV DI,ENEMY3COL
  ;........................ FOR ENEMY 1......................

        CMP AX,PACMANROW
        JNZ ELSE1
        CMP BX,PACMANCOL
        JBE CONDITION1
        CALL ENEMY1LEFT
        JMP ENEMY2
CONDITION1:
         CALL ENEMY1RIGHT
         JMP ENEMY2
ELSE1:


        CMP AX,PACMANROW
        JBE ELSE2
        CALL ENEMY1UP
        CMP BX,PACMANCOL
        JBE CONDITION2
        CALL ENEMY1LEFT
        JMP ENEMY2
CONDITION2:
         CALL ENEMY1RIGHT
         JMP ENEMY2
ELSE2:




        CMP AX,PACMANROW
        JAE ENEMY2
        CALL ENEMY1DOWN
        CMP BX,PACMANCOL
        JBE CONDITION3
        CALL ENEMY1LEFT
        JMP ENEMY2
CONDITION3:
         CALL ENEMY1RIGHT
          JMP ENEMY2


ENEMY2:

   ;............FOR ENEMY 2...............
        



        CMP CX,PACMANROW
        JNZ ELSE3
        CMP DX,PACMANCOL
        JBE CONDITION4
        CALL ENEMY2LEFT
        JMP ENEMY3
CONDITION4:
         CALL ENEMY2RIGHT
         JMP ENEMY3
ELSE3:


        CMP CX,PACMANROW
        JBE ELSE4
        CALL ENEMY2UP
        CMP DX,PACMANCOL
        JBE CONDITION5
        CALL ENEMY2LEFT
        JMP ENEMY3
CONDITION5:
         CALL ENEMY2RIGHT
         JMP ENEMY3
ELSE4:




        CMP CX,PACMANROW
        JAE ENEMY3
        CALL ENEMY2DOWN
        CMP DX,PACMANCOL
        JBE CONDITION6
        CALL ENEMY2LEFT
        JMP ENEMY3
CONDITION6:
         CALL ENEMY2RIGHT
          JMP ENEMY3


ENEMY3:

    ;.......FOR ENEMY3.................






        CMP SI,PACMANROW
        JNZ ELSE5
        CMP DI,PACMANCOL
        JBE CONDITION7
        CALL ENEMY3LEFT
        JMP ENEMY4
CONDITION7:
         CALL ENEMY3RIGHT
         JMP ENEMY4
ELSE5:


        CMP SI,PACMANROW
        JBE ELSE6
        CALL ENEMY3UP
        CMP DI,PACMANCOL
        JBE CONDITION8
        CALL ENEMY3LEFT
        JMP ENEMY4
CONDITION8:
         CALL ENEMY3RIGHT
         JMP ENEMY4
ELSE6:




        CMP SI,PACMANROW
        JAE ENEMY4
        CALL ENEMY3DOWN
        CMP DI,PACMANCOL
        JBE CONDITION9
        CALL ENEMY3LEFT
        JMP ENEMY4
CONDITION9:
         CALL ENEMY3RIGHT
          JMP ENEMY4


ENEMY4:











        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX                  
         RET


       TOWARDSENEMY ENDP


        END MAIN


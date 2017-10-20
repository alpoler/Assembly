.MODEL SMALL
.STACK 100H
.386
.DATA
        COLOR DB ?  ; storing color value
	TCOLOR DB ?  ; for text color
        ECOLOR DB ?
        VAR    DW   ?
        FCOLOR DB  ?
	DCOLOR DB   ?
	tCOLOUR  dB ?
	MSG0 DB '         PROJECT:$'
	MSG1 DB '  			 Simulation of Hypothetical Processor$'
	MSG2 DB '         Group Members:$'
	MSG3 DB '                  MUTAFAF WAhHAJ                  BCSF11A011$'
	MSG4 DB '                  MUHAMMAD AHSAN                  BCSF11A013$'
	MSG5 DB '                  FAISAL KHADIM                   BCSF11A039$'
	MSG6 DB '                  ABDUL MALIK                     BCSF11A042$'
	MSG7 DB '         To be submitted to: 				     $'
	MSG8 DB '                             SIR MUHAMMAD FAROOQ    	     $'
	MSG_SEM DB '                              BSCS 3rd Semester	     $'

	CPASS DB ?  ;count_pass
	CORRCT_PAS DB 'PASSWORD MATCHED  $'
	ASK_PASS DB 'ENTER PASSWORD :  $'
	ASK_AGAIN DB 'Enter Again  $'
	ERR_MSG DB 'PASWORD ERROR $'


.CODE

        MAIN PROC

		MOV AX,@DATA
		MOV DS,AX


         MOV VAR,7FFFH

         MOV ECOLOR , 06h
         CALL DELAY
        CALL STARTPAG
        MOV TCOLOUR, 02H
        MOV VAR,7FfH

	CALL PASSWORD


        MOV AH,4CH
        INT 21H

        MAIN ENDP


	PASSWORD PROC



MOV DX,OFFSET ASK_PASS
MOV AH,9
INT 21H
Again:

MOV CPASS,0

MOV AH,0

INT 16H
CMP AL,'m'
JE PIN2
INC CPASS

PIN2:
MOV DL,'*'
MOV AH,2
INT 21H

MOV AH,0
INT 16H

CMP AL,'w'
JE PIN3
INC CPASS

PIN3:
MOV DL,'*'
MOV AH,2
INT 21H

MOV AH,0
INT 16H

CMP AL,'h'
JE PIN4
INC CPASS

PIN4:
MOV DL,'*'
MOV AH,2
INT 21H

MOV AH,0
INT 16H

CMP AL,'j'
JE PIN5
INC CPASS

PIN5:

MOV DL,'*'
MOV AH,2
INT 21H

MOV AH,0
INT 16H

CMP AL,'n'
JE PIN6
INC CPASS

PIN6:
MOV DL,'*'
MOV AH,2
INT 21H

MOV AH,0
INT 16H

CMP AL,'s'
JE PIN7
INC CPASS

PIN7:
MOV DL,'*'
MOV AH,2
INT 21H

MOV AH,0
INT 16H

CMP AL,'r'
JE END_PASS
INC CPASS

END_PASS:

CMP CPASS, 0
JE FORWD


MOV AH,2
MOV DL,0AH
INT 21H

MOV DL,0DH
INT 21H



MOV AH,9
MOV DX,OFFSET ERR_MSG
INT 21H


MOV AH,2
MOV DL,0AH
INT 21H

MOV DL,0DH
INT 21H




MOV AH,9
MOV DX,OFFSET ASK_AGAIN
INT 21H

MOV AH,2
MOV DL,0AH
INT 21H

MOV DL,0DH
INT 21H

JMP again


FORWD:

MOV AH,2
MOV DL,0AH
INT 21H

MOV DL,0DH
INT 21H




MOV AH,9
MOV DX,OFFSET CORRCT_PAS
INT 21H

MOV AX,12H
INT 10H

	MOV VAR,7FFFH
	MOV AL,3
          INT 10H
;          CALL DELAY
          CALL LOD

	MOV FCOLOR,04H
         MOV VAR,7FFFH
;         call delay
       CALL PROJECT


         MOV VAR,7FFFH

       CALL FETCHING

        MOV VAR,01H
;          call delay



        CALL PROJECT

         MOV VAR,7FFH
         MOV FCOLOR,01H
         CALL TIMING_SIGNAL_ZER0

        MOV VAR,1H
;         CALL DELAY
          CALL PROJECT


           MOV VAR,7FFH
           ;call delay
          CALL TIMING_SIGNAL_ONE




         MOV VAR,7FFFH
           MOV  DCOLOR,03H
          CALL DECODING

        MOV VAR,01H
          CALL PROJECT


         MOV VAR,7FFH
 ;        call delay
        CALL TIMING_SIGNAL_TWO

       MOV VAR,7FFFH
;      CALL DELAY
         CALL EXECUTING
        MOV VAR,1H

        CALL PROJECT
         mov var,7FFh

        CALL TIMING_SIGNAL_THREE
         MOV AX,03H
                 INT 10H
;   dont display currently


        MOV DX,4
            MOV AH,32
            INT 21H


END_PASS_PROG:

MOV AH,4CH
INT 21H

	PASSWORD ENDP

	PROJECT PROC
        MOV AX,12H ;set graphic mode
        INT 10H

        ;page
        MOV AH, 0CH   ;writing pixel
        MOV COLOR , 07H
        MOV TCOLOR , 02H
        MOV AL, COLOR   ;pixel attribute

        ;displaying line1
        MOV CX,8   ;col no
        MOV DX,24  ;row no
    LINE1:
        CMP DX,468
        JE END_LINE1
        INT 10H
        INC DX
        JMP LINE1
  END_LINE1:

	  CALL DELAY
          ;displaying line2

        MOV CX,20   ;col no
        MOV DX,24  ;row no
    LINE2:
        CMP DX,448
        JE END_LINE2
        INT 10H
        INC DX
        JMP LINE2
  END_LINE2:
		  CALL DELAY
          ;displaying line3

        MOV CX,8   ;col no
        MOV DX,24  ;row no
    LINE3:
        CMP CX,20
        JE END_LINE3
        INT 10H
        INC CX
        JMP LINE3
  END_LINE3:
			  CALL DELAY
          ;displaying line4

        MOV CX,8   ;col no
        MOV DX,468  ;row no
    LINE4:
        CMP CX,350
        JE END_LINE4
        INT 10H
        INC CX
        JMP LINE4
  END_LINE4:
		CALL DELAY

          ;displaying line5

        MOV CX,20   ;col no
        MOV DX,448  ;row no
    LINE5:
        CMP CX,336
        JE END_LINE5
        INT 10H
        INC CX
        JMP LINE5
  END_LINE5:

	 CALL DELAY
        ;displaying line6
        MOV CX,336   ;col no
        MOV DX,56  ;row no
    LINE6:
        CMP DX,448
        JE END_LINE6
        INT 10H
        INC DX
        JMP LINE6
  END_LINE6:
	  CALL DELAY

        ;displaying line7
        MOV CX,350   ;col no
        MOV DX,56  ;row no
    LINE7:
        CMP DX,468
        JE END_LINE7
        INT 10H
        INC DX
        JMP LINE7
  END_LINE7:
	  CALL DELAY
          ;displaying line8

        MOV CX,350   ;col no
        MOV DX,56  ;row no
    LINE8:
        CMP CX,368
        JE END_LINE8
        INT 10H
        INC CX
        JMP LINE8
  END_LINE8:
	  CALL DELAY
          ;displaying line9

        MOV CX,320   ;col no
        MOV DX,56  ;row no
    LINE9:
        CMP CX,338
        JE END_LINE9
        INT 10H
        INC CX
        JMP LINE9
  END_LINE9:
	  CALL DELAY

          ;displaying line10

        MOV CX,320   ;col no
        MOV DX,22  ;row no
    LINE10:
        CMP CX,368
        JE END_LINE10
        INT 10H
        INC CX
        JMP LINE10
  END_LINE10:
	  CALL DELAY
        ;displaying line11
        MOV CX,320   ;col no
        MOV DX,22  ;row no
    LINE11:
        CMP DX,56
        JE END_LINE11
        INT 10H
        INC DX
        JMP LINE11
  END_LINE11:

	  CALL DELAY
        ;displaying line12
        MOV CX,368   ;col no
        MOV DX,22  ;row no
    LINE12:
        CMP DX,56
        JE END_LINE12
        INT 10H
        INC DX
        JMP LINE12
  END_LINE12:
	  CALL DELAY
        ;box 1 memory unit

        ;displaying box1_line1
        MOV CX,152   ;col no
        MOV DX,24  ;row no
    B1LINE1:
        CMP CX,250
        JE END_B1LINE1
        INT 10H
        INC CX
        JMP B1LINE1
  END_B1LINE1:
	  CALL DELAY

        ;displaying box1_line2
        MOV CX,152   ;col no
        MOV DX,56  ;row no
    B1LINE2:
        CMP CX,250
        JE END_B1LINE2
        INT 10H
        INC CX
        JMP B1LINE2
  END_B1LINE2:
	  CALL DELAY

        ;displaying box1_line3
        MOV CX,152   ;col no
        MOV DX,24  ;row no
    B1LINE3:
        CMP DX,56
        JE END_B1LINE3
        INT 10H
        INC DX
        JMP B1LINE3
  END_B1LINE3:
	  CALL DELAY
        ;displaying box1_line4
        MOV CX,250   ;col no
        MOV DX,24  ;row no
    B1LINE4:
        CMP DX,56
        JE END_B1LINE4
        INT 10H
        INC DX
        JMP B1LINE4
  END_B1LINE4:

		 ;MEM UNIT

           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,20       ;col
           INT 10H
            ;character M

        MOV AL,'M'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,21       ;col
           INT 10H
            ;character E

        MOV AL,'E'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,22       ;col
           INT 10H
            ;character M

        MOV AL,'M'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,23       ;col
           INT 10H
            ;character  ' '

        MOV AL,' '   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,24       ;col
           INT 10H
            ;character U

        MOV AL,'U'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,25       ;col
           INT 10H
            ;character N

        MOV AL,'N'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,26       ;col
           INT 10H
            ;character I

        MOV AL,'I'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,27       ;col
           INT 10H
            ;character T

        MOV AL,'T'   ; CHAR's ascii
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV AH,0CH
	MOV AL,COLOR


	  CALL DELAY
       ; dispalying box 2  AR

        ;displaying box2_line1
        MOV CX,152   ;col no
        MOV DX,90  ;row no
    B2LINE1:
        CMP CX,250
        JE END_B2LINE1
        INT 10H
        INC CX
        JMP B2LINE1
  END_B2LINE1:
	  CALL DELAY




        MOV AH,0CH   ; pixel writing
        MOV AL,COLOR ; attribute of pixel

        ;displaying box2_line3
        MOV CX,152   ;col no
        MOV DX,90  ;row no
    B2LINE3:
        CMP DX,110
        JE END_B2LINE3
        INT 10H
        INC DX
        JMP B2LINE3
  END_B2LINE3:
	  CALL DELAY
        ;displaying box2_line4
        MOV CX,250   ;col no
        MOV DX,90 ;row no
    B2LINE4:
        CMP DX,110
        JE END_B2LINE4
        INT 10H
        INC DX
        JMP B2LINE4
  END_B2LINE4:
	  CALL DELAY


           ;box2 JUNK1
           MOV DH,6      ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box2 JUNK2
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'6'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box2 JUNK3
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'A'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H





          MOV AH,0CH
          MOV AL,COLOR
        ;displaying box2_line2
        MOV CX,152   ;col no
        MOV DX,110  ;row no
    B2LINE2:
        CMP CX,250
        JE END_B2LINE2
        INT 10H
        INC CX
        JMP B2LINE2
  END_B2LINE2:

           ;box2 LD
           ;cursor handling
           MOV  AH,2
           MOV DH,7      ;row
           MOV DL,21       ;col
           INT 10H
            ;character    L of LD of Box2

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box2 INR
           ;cursor handling
           MOV  AH,2
           MOV DH,7      ;row
           MOV DL,24       ;col
           INT 10H
            ;character    L of LD of Box2

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box2 CLR
           ;cursor handling
           MOV  AH,2
           MOV DH,7      ;row
           MOV DL,27       ;col
           INT 10H
            ;character    L of LD of Box2

        MOV AL,'C'   ;  C's ascii
        MOV BL,COLOR   ; attrib of C
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box2 AR
           ;cursor handling
           MOV  AH,2
           MOV DH,5     ;row
           MOV DL,16     ;col
           INT 10H
            ;character    A of AR

        MOV AL,'A'   ;  A's ascii
        MOV BL, COLOR   ; attrib of A
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,5     ;row
           MOV DL,17     ;col
           INT 10H
            ;character    R of AR

        MOV AL,'R'   ;  R's ascii
        MOV BL, COLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H





        MOV AH,0CH
        MOV AL,COLOR

	  CALL DELAY

        ;displaying box3 PC

        ;displaying box3_line1
        MOV CX,152   ;col no
        MOV DX,136  ;row no
    B3LINE1:
        CMP CX,250
        JE END_B3LINE1
        INT 10H
        INC CX
        JMP B3LINE1
  END_B3LINE1:
	  CALL DELAY

        ;displaying box3_line3
        MOV CX,152   ;col no
        MOV DX,136  ;row no
    B3LINE3:
        CMP DX,156
        JE END_B3LINE3
        INT 10H
        INC DX
        JMP B3LINE3
  END_B3LINE3:
	  CALL DELAY
        ;displaying box3_line4
        MOV CX,250   ;col no
        MOV DX,136 ;row no
    B3LINE4:
        CMP DX,156
        JE END_B3LINE4
        INT 10H
        INC DX
        JMP B3LINE4
  END_B3LINE4:



           ;box3 JUNK1
           MOV DH,9  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box3 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box3 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


            ;box3 PC
           ;cursor handling
           MOV  AH,2
           MOV DH,8     ;row
           MOV DL,16     ;col
           INT 10H
            ;character    A of AR

        MOV AL,'P'   ;  P's ascii
        MOV BL, COLOR   ; attrib of P
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,8     ;row
           MOV DL,17     ;col
           INT 10H
            ;character    C of PC

        MOV AL,'C'   ;  C's ascii
        MOV BL, COLOR   ; attrib of C
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H





         MOV AH,0CH
        MOV AL,COLOR

        ;displaying box3_line2
        MOV CX,152   ;col no
        MOV DX,156  ;row no
    B3LINE2:
        CMP CX,250
        JE END_B3LINE2
        INT 10H
        INC CX
        JMP B3LINE2
  END_B3LINE2:
	  CALL DELAY



           ;box3 LD
           ;cursor handling
           MOV  AH,2
           MOV DH,10     ;row
           MOV DL,21       ;col
           INT 10H
            ;character    L of LD of Box3

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box3 INR
           ;cursor handling
           MOV  AH,2
           MOV DH,10     ;row
           MOV DL,24       ;col
           INT 10H
            ;character    I of INR of Box3

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box3 CLR
           ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,27       ;col
           INT 10H
            ;character    C of CLR of Box3

        MOV AL,'C'   ;  C's ascii
        MOV BL,COLOR   ; attrib of C
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	  CALL DELAY


        MOV AH,0CH   ; pixel writing
        MOV AL,COLOR ; attribute of pixel

        ;displaying box4 DR

        ;displaying box4_line1
        MOV CX,120   ;col no
        MOV DX,186  ;row no
    B4LINE1:
        CMP CX,250
        JE END_B4LINE1
        INT 10H
        INC CX
        JMP B4LINE1
  END_B4LINE1:
	  CALL DELAY


        ;displaying box4_line3
        MOV CX,120   ;col no
        MOV DX,186  ;row no
    B4LINE3:
        CMP DX,206
        JE END_B4LINE3
        INT 10H
        INC DX
        JMP B4LINE3
  END_B4LINE3:
	  CALL DELAY

        ;displaying box4_line4
        MOV CX,250   ;col no
        MOV DX,186 ;row no
    B4LINE4:
        CMP DX,206
        JE END_B4LINE4
        INT 10H
        INC DX
        JMP B4LINE4
  END_B4LINE4:
	  CALL DELAY


;box4 JUNK1
           MOV DH,12  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box4 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box4 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box4 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box4 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'9'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box4 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'D'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box4 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'A'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



        MOV AH,0CH
        MOV AL,COLOR



        ;displaying box4_line2
        MOV CX,120   ;col no
        MOV DX,206  ;row no
    B4LINE2:
        CMP CX,250
        JE END_B4LINE2
        INT 10H
        INC CX
        JMP B4LINE2
  END_B4LINE2:
	  CALL DELAY
           ;box4 LD
           ;cursor handling
           MOV  AH,2
           MOV DH,14      ;row
           MOV DL,17       ;col
           INT 10H
            ;character    L of LD of Box4

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box4 INR
           ;cursor handling
           MOV  AH,2
           MOV DH,14      ;row
           MOV DL,22       ;col
           INT 10H
            ;character    I of INR of Box4

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box4 CLR
           ;cursor handling
           MOV  AH,2
           MOV DH,14      ;row
           MOV DL,27       ;col
           INT 10H
            ;character    C of CLR of Box4

        MOV AL,'C'   ;  C's ascii
        MOV BL,COLOR   ; attrib of C
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box4 DR
           ;cursor handling
           MOV  AH,2
           MOV DH,11      ;row
           MOV DL,16       ;col
           INT 10H
            ;character    D of DR

        MOV AL,'D'   ;  D's ascii
        MOV BL,COLOR   ; attrib of D
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,11      ;row
           MOV DL,17       ;col
           INT 10H
            ;character   R of DR

        MOV AL,'R'   ;  R's ascii
        MOV BL,COLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	  CALL DELAY


        MOV AH,0CH
        MOV AL,COLOR




        ;displaying box5 AC


        ;displaying box5_line3
        MOV CX,120   ;col no
        MOV DX,240  ;row no
    B5LINE3:
        CMP DX,260
        JE END_B5LINE3
        INT 10H
        INC DX
        JMP B5LINE3
  END_B5LINE3:
	  CALL DELAY

        ;displaying box5_line4
        MOV CX,250   ;col no
        MOV DX,240 ;row no
    B5LINE4:
        CMP DX,260
        JE END_B5LINE4
        INT 10H
        INC DX
        JMP B5LINE4
  END_B5LINE4:
	  CALL DELAY


	;box5 JUNK1
           MOV DH,15  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box5 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box5 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'E'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'4'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'7'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 AC
           ;cursor handling
           MOV  AH,2
           MOV DH,16
           MOV DL,13       ;col
           INT 10H
            ;character

        MOV AL,'A'   ;
        MOV BL, COLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;cursor handling
           MOV  AH,2
           MOV DH,16
           MOV DL,14       ;col
           INT 10H
            ;character

        MOV AL,'C'   ;
        MOV BL, COLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



        MOV AH,0CH
        MOV AL,COLOR

  ;displaying box5_line1
        MOV CX,120   ;col no
        MOV DX,240  ;row no
    B5LINE1:
        CMP CX,250
        JE END_B5LINE1
        INT 10H
        INC CX
        JMP B5LINE1
  END_B5LINE1:
	  CALL DELAY



        ;displaying box5_line2
        MOV CX,120   ;col no
        MOV DX,260  ;row no
    B5LINE2:
        CMP CX,250
        JE END_B5LINE2
        INT 10H
        INC CX
        JMP B5LINE2
  END_B5LINE2:
	  CALL DELAY


           ;box5 LD
           ;cursor handling
           MOV  AH,2
           MOV DH,17      ;row
           MOV DL,17       ;col
           INT 10H
            ;character    L of LD of Box5

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box5 INR
           ;cursor handling
           MOV  AH,2
           MOV DH,17      ;row
           MOV DL,22       ;col
           INT 10H
            ;character    I of INR of Box5

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box5 CLR
           ;cursor handling
           MOV  AH,2
           MOV DH,17      ;row
           MOV DL,27       ;col
           INT 10H
            ;character    C of CLR of Box5

        MOV AL,'C'   ;  C's ascii
        MOV BL,COLOR   ; attrib of C
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	  CALL DELAY


        MOV AH,0CH
        MOV AL,COLOR



        ;displaying box6 INPR

        ;displaying box6_line1
        MOV CX,120   ;col no
        MOV DX,298  ;row no
    B6LINE1:
        CMP CX,185
        JE END_B6LINE1
        INT 10H
        INC CX
        JMP B6LINE1
  END_B6LINE1:
	  CALL DELAY

        ;displaying box6_line2
        MOV CX,120   ;col no
        MOV DX,318  ;row no
    B6LINE2:
        CMP CX,185
        JE END_B6LINE2
        INT 10H
        INC CX
        JMP B6LINE2
  END_B6LINE2:
	  CALL DELAY

        ;displaying box6_line3
        MOV CX,120   ;col no
        MOV DX,298  ;row no
    B6LINE3:
        CMP DX,318
        JE END_B6LINE3
        INT 10H
        INC DX
        JMP B6LINE3
  END_B6LINE3:
	  CALL DELAY

        ;displaying box6_line4
        MOV CX,185   ;col no
        MOV DX,298 ;row no
    B6LINE4:
        CMP DX,318
        JE END_B6LINE4
        INT 10H
        INC DX
        JMP B6LINE4
  END_B6LINE4:
	  CALL DELAY


           ;cursor handling
           MOV  AH,2
           MOV DH,19      ;row
           MOV DL,24       ;col
           INT 10H
            ;character    I of INPR

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

 ;cursor handling
           MOV  AH,2
           MOV DH,19      ;row
           MOV DL,25       ;col
           INT 10H
            ;character    N of INPR

        MOV AL,'N'   ;  N's ascii
        MOV BL,COLOR   ; attrib of N
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

 ;cursor handling
           MOV  AH,2
           MOV DH,19      ;row
           MOV DL,26       ;col
           INT 10H
            ;character    P of INPR

        MOV AL,'P'   ;  P's ascii
        MOV BL,COLOR   ; attrib of P
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

   ;cursor handling
           MOV  AH,2
           MOV DH,19      ;row
           MOV DL,27       ;col
           INT 10H
            ;character    I of INPR

        MOV AL,'R'   ;  R's ascii
        MOV BL,COLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV AH,0CH
        MOV AL,COLOR



        ;displaying box7 IR

        ;displaying box7_line1

        MOV CX,120   ;col no
        MOV DX,334  ;row no
    B7LINE1:
        CMP CX,250
        JE END_B7LINE1
        INT 10H
        INC CX
        JMP B7LINE1
  END_B7LINE1:
	  CALL DELAY

        ;displaying box7_line2
        MOV CX,120   ;col no
        MOV DX,354  ;row no
    B7LINE2:
        CMP CX,250
        JE END_B7LINE2
        INT 10H
        INC CX
        JMP B7LINE2
  END_B7LINE2:
	  CALL DELAY

        ;displaying box7_line3
        MOV CX,120   ;col no
        MOV DX,334  ;row no
    B7LINE3:
        CMP DX,354
        JE END_B7LINE3
        INT 10H
        INC DX
        JMP B7LINE3
  END_B7LINE3:
	  CALL DELAY

        ;displaying box7_line4
        MOV CX,250   ;col no
        MOV DX,334 ;row no
    B7LINE4:
        CMP DX,354
        JE END_B7LINE4
        INT 10H
        INC DX
        JMP B7LINE4
  END_B7LINE4:
	  CALL DELAY


	;box7 JUNK1
           MOV DH,21  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'B'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'3'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'5'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



        MOV AH,0CH
        MOV AL,COLOR



           ;box7 IR's LD
           ;cursor handling
           MOV  AH,2
           MOV DH,23      ;row
           MOV DL,17       ;col
           INT 10H
            ;character    L of LD of Box7

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

       ;cursor handling
           MOV  AH,2
           MOV DH,20      ;row
           MOV DL,13       ;col
           INT 10H
            ;character    I of IR

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


       ;cursor handling
           MOV  AH,2
           MOV DH,20      ;row
           MOV DL,14       ;col
           INT 10H
            ;character    I of IR

        MOV AL,'R'   ;  R's ascii
        MOV BL,COLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

         MOV AH,0CH  ; pixel writing
         MOV AL,COLOR





        ;displaying box8 TR

        ;displaying box8_line1

        MOV CX,120   ;col no
        MOV DX,380  ;row no
    B8LINE1:
        CMP CX,250
        JE END_B8LINE1
        INT 10H
        INC CX
        JMP B8LINE1
  END_B8LINE1:
	  CALL DELAY


        ;displaying box8_line3
        MOV CX,120   ;col no
        MOV DX,380  ;row no
    B8LINE3:
        CMP DX,398
        JE END_B8LINE3
        INT 10H
        INC DX
        JMP B8LINE3
  END_B8LINE3:
	  CALL DELAY

        ;displaying box8_line4
        MOV CX,250   ;col no
        MOV DX,380 ;row no
    B8LINE4:
        CMP DX,398
        JE END_B8LINE4
        INT 10H
        INC DX
        JMP B8LINE4
  END_B8LINE4:
	  CALL DELAY




	;box8 JUNK1
           MOV DH,24  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box8 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box8 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box8 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box8 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'B'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box8 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'3'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box8 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'5'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



        MOV AH,0CH
        MOV AL,COLOR



        ;displaying box8_line2
        MOV CX,120   ;col no
        MOV DX,398  ;row no
    B8LINE2:
        CMP CX,250
        JE END_B8LINE2
        INT 10H
        INC CX
        JMP B8LINE2
  END_B8LINE2:
	  CALL DELAY


           ;box8 LD
           ;cursor handling
           MOV  AH,2
           MOV DH,25      ;row
           MOV DL,17       ;col
           INT 10H
            ;character    L of LD of Box8

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box8 INR
           ;cursor handling
           MOV  AH,2
           MOV DH,25      ;row
           MOV DL,22       ;col
           INT 10H
            ;character    I of INR of Box8

        MOV AL,'I'   ;  I's ascii
        MOV BL,COLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


           ;box8 CLR
           ;cursor handling
           MOV  AH,2
           MOV DH,25      ;row
           MOV DL,27       ;col
           INT 10H
            ;character    C of CLR of Box8

        MOV AL,'C'   ;  C's ascii
        MOV BL,COLOR   ; attrib of C
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


       ;cursor handling
           MOV  AH,2
           MOV DH,23      ;row
           MOV DL,13       ;col
           INT 10H
            ;character    T of TR

        MOV AL,'T'   ;  T's ascii
        MOV BL,COLOR   ; attrib of T
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


       ;cursor handling
           MOV  AH,2
           MOV DH,23      ;row
           MOV DL,14       ;col
           INT 10H
            ;character    R of TR

        MOV AL,'R'   ;  R's ascii
        MOV BL,COLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	  CALL DELAY


        MOV AH,0CH
        MOV AL,COLOR




        ;displaying box9 OUTR

        ;displaying box9_line1

        MOV CX,120   ;col no
        MOV DX,424  ;row no
    B9LINE1:
        CMP CX,185
        JE END_B9LINE1
        INT 10H
        INC CX
        JMP B9LINE1
  END_B9LINE1:
	  CALL DELAY

        ;displaying box9_line2
        MOV CX,120   ;col no
        MOV DX,442  ;row no
    B9LINE2:
        CMP CX,185
        JE END_B9LINE2
        INT 10H
        INC CX
        JMP B9LINE2
  END_B9LINE2:
	  CALL DELAY

        ;displaying box9_line3
        MOV CX,120   ;col no
        MOV DX,424  ;row no
    B9LINE3:
        CMP DX,442
        JE END_B9LINE3
        INT 10H
        INC DX
        JMP B9LINE3
  END_B9LINE3:
	  CALL DELAY

        ;displaying box9_line4
        MOV CX,185   ;col no
        MOV DX,424   ;row no
    B9LINE4:
        CMP DX,442
        JE END_B9LINE4
        INT 10H
        INC DX
        JMP B9LINE4
  END_B9LINE4:
	  CALL DELAY



           ;box9 LD  OUTER
           ;cursor handling
           MOV  AH,2
           MOV DH,25      ;row
           MOV DL,11       ;col
           INT 10H
            ;character    L of LD of Box9

        MOV AL,'L'   ;  L's ascii
        MOV BL,COLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


       ;cursor handling
           MOV  AH,2
           MOV DH,26 ;row
           MOV DL,24       ;col
           INT 10H
            ;character    O of OUTR

        MOV AL,'O'   ;
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
	INT 10H


       ;cursor handling
           MOV  AH,2
           MOV DH,26 ;row
           MOV DL,25       ;col
           INT 10H
            ;character    U of OUTR

        MOV AL,'U'   ;
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
	INT 10H

       ;cursor handling
           MOV  AH,2
           MOV DH,26 ;row
           MOV DL,26       ;col
           INT 10H
            ;character    T of OUTR

        MOV AL,'T'   ;
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
	INT 10H

       ;cursor handling
           MOV  AH,2
           MOV DH,26 ;row
           MOV DL,27       ;col
           INT 10H
            ;character    R of OUTR

        MOV AL,'R'   ;
        MOV BL,COLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
	INT 10H

       MOV AH,0CH
       MOV AL,COLOR

        ;LD line to OUTER


        MOV DX,410
        MOV CX,96
    LD_OUTER:
        CMP DX,426
        JE END_LD_OUTER
        INT 10H
        INC DX
        ADD CX,2
        JMP LD_OUTER
   END_LD_OUTER:

        ;displaying box10 Adder and Logic

        ;displaying box10_line1

        MOV CX,50   ;col no
        MOV DX,232  ;row no
    B10LINE1:
        CMP CX,84
        JE END_B10LINE1
        INT 10H
        INC CX
        JMP B10LINE1
  END_B10LINE1:
	  CALL DELAY

        ;displaying box10_line2
        MOV CX,50   ;col no
        MOV DX,266  ;row no
    B10LINE2:
        CMP CX,84
        JE END_B10LINE2
        INT 10H
        INC CX
        JMP B10LINE2
  END_B10LINE2:
	  CALL DELAY

        ;displaying box10_line3
        MOV CX,50   ;col no
        MOV DX,232  ;row no
    B10LINE3:
        CMP DX,266
        JE END_B10LINE3
        INT 10H
        INC DX
        JMP B10LINE3
  END_B10LINE3:
	  CALL DELAY

        ;displaying box10_line4
        MOV CX,84  ;col no
        MOV DX,232   ;row no
    B10LINE4:
        CMP DX,266
        JE END_B10LINE4
        INT 10H
        INC DX
        JMP B10LINE4
  END_B10LINE4:
	  CALL DELAY



        ;displaying box11 E

        ;displaying box11_line1

        MOV CX,104   ;col no
        MOV DX,218  ;row no
    B11LINE1:
        CMP CX,120
        JE END_B11LINE1
        INT 10H
        INC CX
        JMP B11LINE1
  END_B11LINE1:
	  CALL DELAY

	;value of auxeliry flag
	MOV AH,2
	MOV DH,14
	MOV DL,14
	INT 10H

	MOV AL,'1'
	MOV AH,9
	MOV BL,TCOLOR
	MOV CX,1
	INT 10H

	MOV AH,0CH
	MOV AL ,COLOR

        ;displaying box11_line2
        MOV CX,104 ;col no
        MOV DX,238  ;row no
    B11LINE2:
        CMP CX,120
        JE END_B11LINE2
        INT 10H
        INC CX
        JMP B11LINE2
  END_B11LINE2:
	  CALL DELAY

        ;displaying box11_line3
        MOV CX,104  ;col no
        MOV DX,218  ;row no
    B11LINE3:
        CMP DX,238
        JE END_B11LINE3
        INT 10H
        INC DX
        JMP B11LINE3
  END_B11LINE3:
	  CALL DELAY

        ;displaying box11_line4
        MOV CX,120 ;col no
        MOV DX,218   ;row no
    B11LINE4:
        CMP DX,238
        JE END_B11LINE4
        INT 10H
        INC DX
        JMP B11LINE4
  END_B11LINE4:
	  CALL DELAY
	  CALL DELAY

        MOV CX,390
        MOV DX, 30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;control unit;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 CLH1:   CMP CX,600    ;  INTRUCTION REGISTER UPPER LINE
        JE END_CLH1       ;CLH1
        INC CX
        INT 10H
        JMP CLH1
 END_CLH1:
	CALL DELAY
        MOV  CX,390
        MOV DX,30
        INT 10H


CLV1:   CMP DX,52
        JE END_CLV1
        INC DX
        INT 10H
        JMP CLV1
  END_CLV1:
	CALL DELAY
	;box7 JUNK1
           MOV DH,2  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,49       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2
	   mov DH,2
           MOV DL,51       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,53       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,55       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'B'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character

        MOV AL,'3'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

       	    MOV DL,71       ;col
           INT 10H
            ;character

        MOV AL,'5'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



        MOV AH,0CH
        MOV AL,COLOR
        MOV CX,391     ; IR LINE2 HORIZONTAL
        MOV DX,52
        INT 10H

CLH2:   CMP CX,600
        JE  END_CLH2
        INC CX
        INT 10H
        JMP CLH2
END_CLH2:
	CALL DELAY
        MOV  CX,600
        MOV DX,30
        INT 10H


CLV2:   CMP DX,52       ; ir register vertical line 2
        JE END_CLV2
        INC DX
        INT 10H
        JMP CLV2
  END_CLV2:
         CALL DELAY

         MOV CX,402   ;DECODER HORIZONTAL LINE 1
         MOV DX,80
         INT 10H
 DLH1:
         CMP  CX,470
         JE  END_DLH1
         INC CX
         INT 10H
         JMP DLH1
 END_DLH1:
        CALL DELAY

        MOV  CX,402       ;decoder veritcal line 1
        MOV  DX,80
        INT 10H

DLV1:   CMP DX,120
        JE  END_DLV1
        INC DX
        INT 10H
        JMP DLV1
END_DLV1:
        CALL DELAY
         MOV CX,402   ;DECODER HORIZONTAL LINE 2
         MOV DX,120
         INT 10H
 DLH2:
         CMP  CX,470
         JE  END_DLH2
         INC CX
         INT 10H
         JMP DLH2
 END_DLH2:
        CALL DELAY
        MOV  CX,470       ;decoder veritcal line 2
        MOV  DX,80
        INT 10H

DLV2:   CMP DX,120
        JE  END_DLV2
        INC DX
        INT 10H
        JMP DLV2
END_DLV2:
        CALL DELAY

        MOV CX,515  ;control unit horizontal line 1
        MOV DX,94
        INT 10H
 CULH1:
        CMP CX,580
        JE END_CULH1
        INC CX
        INT 10H
        JMP CULH1
END_CULH1:
        CALL DELAY

        MOV CX,515 ;Control unit vertical line 1
        MOV DX,94
        INT 10H
CULV1:
        CMP DX,294
        JE   END_CULV1
        INC DX
        INT 10H
        JMP CULV1
END_CULV1:
        CALL DELAY

        MOV CX,515  ;control unit horizontal line 2
        MOV DX,294
        INT 10H
 CULH2:
        CMP CX,580
        JE END_CULH2
        INC CX
        INT 10H
        JMP CULH2
END_CULH2:
        CALL DELAY
        MOV CX,580 ;Control unit vertical line 2
        MOV DX,94
        INT 10H
CULV2:
        CMP DX,294
        JE   END_CULV2
        INC DX
        INT 10H
        JMP CULV2
END_CULV2:
        CALL DELAY

        MOV CX,384 ; Indirect or direct address bit horizontal line 1
        MOV DX,136
        INT 10H
I1:
        CMP CX,404
        JE  END_I1
        INC CX
        INT 10H
        JMP I1
  END_I1:
        CALL DELAY

        MOV CX,384             ;line 2
        MOV DX,136
        INT 10H
I2:     CMP DX,160
        JE  END_I2
        INC DX
        INT 10H
        JMP I2
 END_I2:
        CALL DELAY

        MOV CX,384
        MOV DX,160
        INT 10H
 I3:
        CMP CX,404
        JE  END_I3
        INC CX
        INT 10H
        JMP I3
END_I3:
        CALL DELAY
        MOV CX,404
        MOV DX,136
        INT 10H
 I4:
        CMP DX,160
        JE  END_I4
        INC DX
        INT 10H
        JMP I4
 END_I4:
        CALL DELAY

	MOV AH,2
	MOV DH,9
	MOV DL,49
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV AL,'0'
	MOV BL,TCOLOR
	INT 10H

  ;;;;;;;;;;;;;;;;;;;;;;;    decorder 4*16          ;;;;;;;
	MOV AH,0CH
	MOV AL,COLOR


   MOV CX,400
        MOV DX,290
        INT 10H

DECO1:
        CMP CX,480
        JE  END_DECO1
        INC CX
        INT 10H
        JMP DECO1
END_DECO1:
        CALL DELAY

        MOV CX,400
        MOV DX,290
        INT 10H          ; DECODER LINE 2
DECO2:
        CMP DX,334
        JE END_DECO2
        INC DX
        INT 10H
        JMP DECO2
END_DECO2:
        CALL DELAY

        MOV CX,400
        MOV DX,334  ;DECODER LINE 3
        INT 10H
DECO3:
        CMP CX,480
        JE  END_DECO3
        INC CX
        INT 10H
        JMP DECO3
 END_DECO3:
        CALL DELAY

        MOV CX,480
        MOV DX,290
        INT 10H
DECO4:
        CMP DX,334
        JE END_DECO4
        INC DX             ;DECODER LINE 4
        INT 10H
        JMP DECO4
END_DECO4:
        CALL DELAY

        MOV  CX,412   ;4 BIT SEQUENCE COUNTER
        MOV  DX,370  ;LINE 1
        INT 10H
SQL1:
        CMP CX,460
        JE  END_SQL1
        INC cx
        INT 10H
        JMP SQL1
END_SQL1:
        CALL DELAY

        MOV CX,412  ; LINE 2 VERTICAL
        MOV DX,370
        INT 10H
 SQL2:
        CMP DX,410
        JE END_SQL2
        INC DX
        INT 10H
        JMP SQL2
  END_SQL2:
        CALL DELAY

        MOV  CX,412   ;4 BIT SEQUENCE COUNTER
        MOV  DX,410  ;LINE 3
        INT 10H
SQL3:
        CMP CX,460
        JE  END_SQL3
        INC cx
        INT 10H
        JMP SQL3
END_SQL3:
        CALL DELAY


        MOV CX,460  ; LINE 4 VERTICAL
        MOV DX,370
        INT 10H
 SQL4:
        CMP DX,410
        JE END_SQL4
        INC DX
        INT 10H
        JMP SQL4
  END_SQL4:
        CALL DELAY

        MOV CX,411
        MOV DX,52
        INT 10H

IR14:   CMP DX,74
        JE END_IR14
        INC DX
        INT 10H
        JMP  IR14
END_IR14:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,51 ; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1fh; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        MOV CX,427
        MOV DX,52
        INT 10H


IR13:   CMP DX,74
        JE END_IR13
        INC DX
        INT 10H
        JMP  IR13
END_IR13:
        ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,53 ; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1fh; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY
        MOV CX,443
        MOV DX,52
        INT 10H

IR12:   CMP DX,74
        JE END_IR12
        INC DX
        INT 10H
        JMP  IR12
END_IR12:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,55; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1fh; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR


        MOV CX,502
        MOV DX,52
        INT 10H

IR110:   CMP DX,106
        JE END_IR110
        INC DX
        INT 10H
        JMP  IR110
END_IR110:
        CALL DELAY
        MOV CX,502
        MOV DX,106
        INT 10H
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,6 ; ROW
        MOV DL,63; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,10H; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR


IR1101:   CMP CX,515
        JE END_IR1101
        INC CX
        INT 10H
        JMP  IR1101
END_IR1101:
        CALL DELAY

        MOV CX,393
        MOV DX,52
        INT 10H
LFLP:                            ;ADDRESS FLIP FLOP (BIT)
        CMP DX,136
        JE  END_LFLP
        INC DX
        INT 10H
        JMP LFLP
 END_LFLP:
        CALL DELAY
        MOV CX,393
        MOV DX,160
        INT 10H
LFLP1:
        CMP DX,232               ; line flipflop to control unit
        JE  END_LFLP1
        INC DX
        INT 10H
        JMP  LFLP1
END_LFLP1:
        CALL DELAY
        MOV CX,393
        MOV DX,232
        INT 10H
LFLP2:
        CMP CX,510               ; line flipflop to control unit
        JE  END_LFLP2
        INC CX
        INT 10H
        JMP  LFLP2
END_LFLP2:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,14 ; ROW
        MOV DL,63; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,10H; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY

        MOV  CX,412       ;D7        DECORDER
        MOV  DX,120
        INT 10H

D7:   CMP DX,128
        JE  END_D7
        INC DX
        INT 10H
        JMP D7
END_D7:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,51; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY

        MOV  CX,420       ;D6        DECORDER
        MOV  DX,120
        INT 10H

D6:   CMP DX,128
        JE  END_D6
        INC DX
        INT 10H
        JMP D6
END_D6:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,52; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY

        MOV  CX,428       ;D5        DECORDER
        MOV  DX,120
        INT 10H

D5:   CMP DX,128
        JE  END_D5
        INC DX
        INT 10H
        JMP D5
END_D5:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,53; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY

        MOV  CX,436       ;D4        DECORDER
        MOV  DX,120
        INT 10H

D4:   CMP DX,128
        JE  END_D4
        INC DX
        INT 10H
        JMP D4
END_D4:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,54; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY

        MOV  CX,444       ;D3        DECORDER
        MOV  DX,120
        INT 10H
        CALL DELAY

D13:   CMP DX,128
        JE  END_D13
        INC DX
        INT 10H
        JMP D13
END_D13:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,55; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        MOV  CX,452       ;D2        DECORDER
        MOV  DX,120
        INT 10H
        CALL DELAY

D2:   CMP DX,128
        JE  END_D2
        INC DX
        INT 10H
        JMP D2
END_D2:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,56; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        MOV  CX,460       ;D1        DECORDER
        MOV  DX,120
        INT 10H
        CALL DELAY

D1:   CMP DX,128
        JE  END_D1
        INC DX
        INT 10H
        JMP D1
END_D1:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,57; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR


        MOV  CX,468       ;D0        DECORDER
        MOV  DX,120
        INT 10H
        CALL DELAY

D0:   CMP DX,128
        JE  END_D0
        INC DX
        INT 10H
        JMP D0
END_D0:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,8 ; ROW
        MOV DL,58; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1FH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        ;SEQUENCE COUNTER LINES CONNECTED WITH DECORDER 4*16

        MOV  CX,427       ;S1
        MOV  DX,334
        INT 10H
        CALL DELAY

S1:   CMP DX,370
        JE  END_S1
        INC DX
        INT 10H
        JMP S1
END_S1:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,21 ; ROW
        MOV DL,53; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY


        MOV  CX,435       ;S2
        MOV  DX,334
        INT 10H
        CALL DELAY

S2:     CMP DX,370
        JE  END_S2
        INC DX
        INT 10H
        JMP S2
END_S2:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,21 ; ROW
        MOV DL,54 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY


        MOV  CX,443       ;S3
        MOV  DX,334
        INT 10H
        CALL DELAY

S3:   CMP DX,370
        JE  END_S3
        INC DX
        INT 10H
        JMP S3
END_S3:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,21 ; ROW
        MOV DL,55 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY

        MOV  CX,451       ;S4
        MOV  DX,334
        INT 10H
        CALL DELAY

S4:     CMP DX,370
        JE  END_S4
        INC DX
        INT 10H
        JMP S4
END_S4:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,21 ; ROW
        MOV DL,56 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        ; characters in decorder 4*16



;arrow for 4*16 (decorder timing signals)

        CALL DELAY                      ;t8
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,50 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR


        CALL DELAY                      ;t7
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,51 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR




        CALL DELAY                      ;t6
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,52 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR



        CALL DELAY                      ;t5
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,53 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR


        CALL DELAY                      ;t4
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,54 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR


        CALL DELAY                      ;t3
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,55 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY                      ;t2
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,56 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY                      ;t1
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,57 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

        CALL DELAY                      ;t0
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,58 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY                      ;t0
       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,17 ; ROW
        MOV DL,59 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,1EH; CHAR
        MOV BL,color;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;bus selection lines;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,55; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        call delay

       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,6 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,49; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY

       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,9 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,50; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY

       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,12 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,51; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY

       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,15 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,52; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY


       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,21 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,53; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY

       ;CURSOR HANDLING
        MOV AH,2
        MOV DH,24 ; ROW
        MOV DL,43 ;COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,54; CHAR
        MOV BL,tcolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H
        MOV AH,0CH
        MOV AL,COLOR
        CALL DELAY




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AHSAN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


           ;displaying signal lines

        ;displaying signal1
        MOV CX,20   ;col no
        MOV DX,38  ;row no
    SIGNAL1:
        CMP CX,152
        JE END_SIGNAL1
        INT 10H
        INC CX
        JMP SIGNAL1
  END_SIGNAL1:
           CALL DELAY



        ;displaying signal2
        MOV CX,20   ;col no
        MOV DX,100  ;row no
    SIGNAL2:
        CMP CX,152
        JE END_SIGNAL2
        INT 10H
        INC CX
        JMP SIGNAL2
  END_SIGNAL2:
           CALL DELAY

        ;displaying signal3
        MOV CX,20   ;col no
        MOV DX,149  ;row no
    SIGNAL3:
        CMP CX,152
        JE END_SIGNAL3
        INT 10H
        INC CX
        JMP SIGNAL3
  END_SIGNAL3:
             CALL DELAY

        ;displaying signal4
        MOV CX,20   ;col no
        MOV DX,198  ;row no
    SIGNAL4:
        CMP CX,120
        JE END_SIGNAL4
        INT 10H
        INC CX
        JMP SIGNAL4
  END_SIGNAL4:
              CALL DELAY

        ;displaying signal5
        MOV CX,84   ;col no
        MOV DX,232  ;row no
    SIGNAL5:
        CMP CX,100
        JE END_SIGNAL5
        INT 10H
        INC CX
        JMP SIGNAL5
  END_SIGNAL5:
              CALL DELAY

        ;displaying signal6
        MOV CX,84   ;col no
        MOV DX,248  ;row no
    SIGNAL6:
        CMP CX,120
        JE END_SIGNAL6
        INT 10H
        INC CX
        JMP SIGNAL6
  END_SIGNAL6:
              CALL DELAY



        ;displaying signal7
        MOV CX,28    ;col no
        MOV DX,308  ;row no
    SIGNAL7:
        CMP CX,120
        JE END_SIGNAL7
        INT 10H
        INC CX
        JMP SIGNAL7
  END_SIGNAL7:
              CALL DELAY


        ;displaying signal7A
        MOV CX,28    ;col no
        MOV DX,252  ;row no
    SIGNAL7A:
        CMP DX,308
        JE END_SIGNAL7A
        INT 10H
        INC DX
        JMP SIGNAL7A
  END_SIGNAL7A:
              CALL DELAY

        ;displaying signal7B
        MOV CX,28    ;col no
        MOV DX,252  ;row no
    SIGNAL7B:
        CMP CX,50
        JE END_SIGNAL7B
        INT 10H
        INC CX
        JMP SIGNAL7B
  END_SIGNAL7B:
              CALL DELAY


        ;displaying signal8
        MOV CX,20   ;col no
        MOV DX,344  ;row no
    SIGNAL8:
        CMP CX,120
        JE END_SIGNAL8
        INT 10H
        INC CX
        JMP SIGNAL8
  END_SIGNAL8:
              CALL DELAY

        ;displaying signal9
        MOV CX,20   ;col no
        MOV DX,390  ;row no
    SIGNAL9:
        CMP CX,120
        JE END_SIGNAL9
        INT 10H
        INC CX
        JMP SIGNAL9
  END_SIGNAL9:
              CALL DELAY

        ;displaying signal10
        MOV CX,20   ;col no
        MOV DX,437  ;row no
    SIGNAL10:
        CMP CX,120
        JE END_SIGNAL10
        INT 10H
        INC CX
        JMP SIGNAL10
  END_SIGNAL10:
              CALL DELAY

        ;displaying switch2
        MOV CX,300   ;col no
        MOV DX,31  ;row no
    SWITCH2:
        CMP CX,320
        JE END_SWITCH2
        INT 10H
        INC CX
        JMP SWITCH2
  END_SWITCH2:
             CALL DELAY

        ;displaying switch1
        MOV CX,300   ;col no
        MOV DX,40  ;row no
    SWITCH1:
        CMP CX,320
        JE END_SWITCH1
        INT 10H
        INC CX
        JMP SWITCH1
  END_SWITCH1:
             CALL DELAY

        ;displaying switch0
        MOV CX,300   ;col no
        MOV DX,50  ;row no
    SWITCH0:
        CMP CX,320
        JE END_SWITCH0
        INT 10H
        INC CX
        JMP SWITCH0
  END_SWITCH0:
             CALL DELAY

        ;displaying signal11
        MOV CX,250   ;col no
        MOV DX,102  ;row no
    SIGNAL11:
        CMP CX,336
        JE END_SIGNAL11
        INT 10H
        INC CX
        JMP SIGNAL11
  END_SIGNAL11:
             CALL DELAY

        ;displaying signal12
        MOV CX,250   ;col no
        MOV DX,150  ;row no
    SIGNAL12:
        CMP CX,336
        JE END_SIGNAL12
        INT 10H
        INC CX
        JMP SIGNAL12
  END_SIGNAL12:
             CALL DELAY

        ;displaying signal13real
        MOV CX,250   ;col no
        MOV DX,196  ;row no
    SIGNAL13REAL:
        CMP CX,336
        JE END_SIGNAL13REAL
        INT 10H
        INC CX
        JMP SIGNAL13REAL
  END_SIGNAL13REAL:
             CALL DELAY

        ;displaying signal13a
        MOV CX,300   ;col no
        MOV DX,196  ;row no
    SIGNAL13A:
        CMP DX,212
        JE END_SIGNAL13A
        INT 10H
        INC DX
        JMP SIGNAL13A
  END_SIGNAL13A:
             CALL DELAY


        ;displaying signal13b
        MOV CX,30  ;col no
        MOV DX,212  ;row no
    SIGNAL13B:
        CMP CX,300
        JE END_SIGNAL13B
        INT 10H
        INC CX
        JMP SIGNAL13B
  END_SIGNAL13B:
             CALL DELAY

        ;displaying signal13c
        MOV CX,30  ;col no
        MOV DX,212  ;row no
    SIGNAL13C:
        CMP DX,244
        JE END_SIGNAL13C
        INT 10H
        INC DX
        JMP SIGNAL13C
  END_SIGNAL13C:
             CALL DELAY


        ;displaying signal13d
        MOV CX,30  ;col no
        MOV DX,244  ;row no
    SIGNAL13D:
        CMP CX,50
        JE END_SIGNAL13D
        INT 10H
        INC CX
        JMP SIGNAL13D
  END_SIGNAL13D:
             CALL DELAY



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;mistakenly signal 13 name missed so replaced with a name signaL13real;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ;displaying signal13
        MOV CX,250   ;col no
        MOV DX,248  ;row no
    SIGNAL13:
        CMP CX,336
        JE END_SIGNAL13
        INT 10H
        INC CX
        JMP SIGNAL13
  END_SIGNAL13:
             CALL DELAY


        ;displaying signal14
        MOV CX,250   ;col no
        MOV DX,344  ;row no
    SIGNAL14:
        CMP CX,336
        JE END_SIGNAL14
        INT 10H
        INC CX
        JMP SIGNAL14
  END_SIGNAL14:
             CALL DELAY

        ;displaying signal14a
        MOV CX,300   ;col no
        MOV DX,248  ;row no
    SIGNAL14A:
        CMP DX,292
        JE END_SIGNAL14A
        INT 10H
        INC DX
        JMP SIGNAL14A
  END_SIGNAL14A:
             CALL DELAY



        ;displaying signal14b
        MOV CX,36   ;col no
        MOV DX,292  ;row no
    SIGNAL14B:
        CMP CX,300
        JE END_SIGNAL14B
        INT 10H
        INC CX
        JMP SIGNAL14B
  END_SIGNAL14B:
             CALL DELAY



        ;displaying signal14c
        MOV CX,36   ;col no
        MOV DX,260  ;row no
    SIGNAL14C:
        CMP DX,292
        JE END_SIGNAL14C
        INT 10H
        INC DX
        JMP SIGNAL14C
  END_SIGNAL14C:
             CALL DELAY


        ;displaying signal14d
        MOV CX,36   ;col no
        MOV DX,260  ;row no
    SIGNAL14D:
        CMP CX,50
        JE END_SIGNAL14D
        INT 10H
        INC CX
        JMP SIGNAL14D
  END_SIGNAL14D:
             CALL DELAY



        ;displaying signal15
        MOV CX,250   ;col no
        MOV DX,390  ;row no
    SIGNAL15:
        CMP CX,334
        JE END_SIGNAL15
        INT 10H
        INC CX
        JMP SIGNAL15
  END_SIGNAL15:
             CALL DELAY


        ;displaying clockPulseMain
        MOV CX,275   ;col no
        MOV DX,120  ;row no
    CLOCK:
        CMP DX,435
        JE END_CLOCK
        INT 10H
        INC DX
        JMP CLOCK
  END_CLOCK:
             CALL DELAY

        ;displaying clock1
        MOV CX,230   ;col no
        MOV DX,130  ;row no
    CLOCK1:
        CMP CX,275
        JE END_CLOCK1
        INT 10H
        INC CX
        JMP CLOCK1
  END_CLOCK1:
             CALL DELAY

        ;displaying clock1V
        MOV CX,230   ;col no
        MOV DX,110  ;row no
    CLOCK1V:
        CMP DX,130
        JE END_CLOCK1V
        INT 10H
        INC DX
        JMP CLOCK1V
  END_CLOCK1V:
             CALL DELAY



        ;displaying clock2
        MOV CX,230   ;col no
        MOV DX,176  ;row no
    CLOCK2:
        CMP CX,275
        JE END_CLOCK2
        INT 10H
        INC CX
        JMP CLOCK2
  END_CLOCK2:
             CALL DELAY


        ;displaying clock2V
        MOV CX,230   ;col no
        MOV DX,156  ;row no
    CLOCK2V:
        CMP DX,176
        JE END_CLOCK2V
        INT 10H
        INC DX
        JMP CLOCK2V
  END_CLOCK2V:
             CALL DELAY

        ;displaying clock3
        MOV CX,230   ;col no
        MOV DX,224  ;row no
    CLOCK3:
        CMP CX,275
        JE END_CLOCK3
        INT 10H
        INC CX
        JMP CLOCK3
  END_CLOCK3:
             CALL DELAY


        ;displaying clock3V
        MOV CX,230   ;col no
        MOV DX,206  ;row no
    CLOCK3V:
        CMP DX,224
        JE END_CLOCK3V
        INT 10H
        INC DX
        JMP CLOCK3V
  END_CLOCK3V:
             CALL DELAY

        ;displaying clock4
        MOV CX,230   ;col no
        MOV DX, 280  ;row no
    CLOCK4:
        CMP CX,275
        JE END_CLOCK4
        INT 10H
        INC CX
        JMP CLOCK4
  END_CLOCK4:
             CALL DELAY


        ;displaying clock4V
        MOV CX,230   ;col no
        MOV DX,262  ;row no
    CLOCK4V:
        CMP DX,280
        JE END_CLOCK4V
        INT 10H
        INC DX
        JMP CLOCK4V
  END_CLOCK4V:
             CALL DELAY

        ;displaying clock5
        MOV CX,230   ;col no
        MOV DX,368    ;row no
    CLOCK5:
        CMP CX,275
        JE END_CLOCK5
        INT 10H
        INC CX
        JMP CLOCK5
  END_CLOCK5:
             CALL DELAY


        ;displaying clock5V
        MOV CX,230   ;col no
        MOV DX,354  ;row no
    CLOCK5V:
        CMP DX,368
        JE END_CLOCK5V
        INT 10H
        INC DX
        JMP CLOCK5V
  END_CLOCK5V:
             CALL DELAY


        ;displaying clock6
        MOV CX,230   ;col no
        MOV DX, 420  ;row no
    CLOCK6:
        CMP CX,275
        JE END_CLOCK6
        INT 10H
        INC CX
        JMP CLOCK6
  END_CLOCK6:
             CALL DELAY

        ;displaying clock6V
        MOV CX,230   ;col no
        MOV DX,400  ;row no
    CLOCK6V:
        CMP DX,420
        JE END_CLOCK6V
        INT 10H
        INC DX
        JMP CLOCK6V
  END_CLOCK6V:
             CALL DELAY

        ;displaying clock7
        MOV CX,200   ;col no
        MOV DX, 435  ;row no
    CLOCK7:
        CMP CX,284
        JE END_CLOCK7
        INT 10H
        INC CX
        JMP CLOCK7
  END_CLOCK7:
             CALL DELAY

        ;displaying signal fo memory unit to coomon bus

        ;line1memory

        MOV CX,250   ;col no
        MOV DX, 32  ;row no
    LINE1MEM:
        CMP CX,274
        JE END_LINE1MEM
        INT 10H
        INC CX
        JMP LINE1MEM
  END_LINE1MEM:
             CALL DELAY



        ;line2memory

        MOV CX,274   ;col no
        MOV DX, 32  ;row no
    LINE2MEM:
        CMP DX, 70
        JE END_LINE2MEM
        INT 10H
        INC DX
        JMP LINE2MEM
  END_LINE2MEM:
             CALL DELAY


        ;line3memory

        MOV CX,274   ;col no
        MOV DX, 70  ;row no
    LINE3MEM:
        CMP CX,336
        JE END_LINE3MEM
        INT 10H
        INC CX
        JMP LINE3MEM
  END_LINE3MEM:
             CALL DELAY


                ;address signal
        ;line1Address

        MOV CX,250   ;col no
        MOV DX, 48  ;row no
    LINE1ADD:
        CMP CX,268
        JE END_LINE1ADD
        INT 10H
        INC CX
        JMP LINE1ADD
  END_LINE1ADD:
             CALL DELAY



        ;line2address

        MOV CX,268   ;col no
        MOV DX, 48  ;row no
    LINE2ADD:
        CMP DX, 102
        JE END_LINE2ADD
        INT 10H
        INC DX
        JMP LINE2ADD
  END_LINE2ADD:
             CALL DELAY


        ;write wali line

        MOV CX,170   ;col no
        MOV DX, 56  ;row no
    WRITE1:
        CMP DX, 64
        JE END_WRITE1
        INT 10H
        INC DX
        JMP WRITE1
  END_WRITE1:
             CALL DELAY

        ;read  wali line

        MOV CX,220   ;col no
        MOV DX, 56  ;row no
    READ1:
        CMP DX, 64
        JE END_READ1
        INT 10H
        INC DX
        JMP READ1
  END_READ1:
             CALL DELAY

	  CALL DELAY


          ;mode changing
           ;don't use MOV AH,0 it causes the display
           ;on new screen or deletes previous

;           MOV AL,3
;           INT 10H


        ;arrow signal 1

           ;cursor handling
           MOV  AH,2
           MOV DH,2        ;row
           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

        ;arrow signal 2

           ;cursor handling
           MOV  AH,2
           MOV DH,6        ;row
           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

        ;arrow signal 3

           ;cursor handling
           MOV  AH,2
           MOV DH,9       ;row
           MOV DL,18       ;col
           INT 10H
            ;character


        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        ;arrow signal 4

           ;cursor handling
           MOV  AH,2
           MOV DH,12      ;row
           MOV DL,14       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        ;arrow signal 5

           ;cursor handling
           MOV  AH,2
           MOV DH,15      ;row
           MOV DL,14       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        ;arrow signal 11

           ;cursor handling
           MOV  AH,2
           MOV DH,14      ;row
           MOV DL,12       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


 ;arrow signal 7

           ;cursor handling
           MOV  AH,2
           MOV DH,21      ;row
           MOV DL,14       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



 ;arrow signal 8

           ;cursor handling
           MOV  AH,2
           MOV DH,24      ;row
           MOV DL,14       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


 ;arrow signal 9

           ;cursor handling
           MOV  AH,2
           MOV DH,27      ;row
           MOV DL,14       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



 ;arrow signal INPR to ADDER

           ;cursor handling
           MOV  AH,2
           MOV DH,19      ;row
           MOV DL,10       ;col
           INT 10H
            ;character

        MOV AL,11H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




 ;arrow signal DR to ADDER

           ;cursor handling
           MOV  AH,2
           MOV DH,13      ;row
           MOV DL,10       ;col
           INT 10H
            ;character

        MOV AL,11H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

;arrow signal AC to ADDER

           ;cursor handling
           MOV  AH,2
           MOV DH,18    ;row
           MOV DL,12       ;col
           INT 10H
            ;character

        MOV AL,11H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


;arrow signal MEM to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,4    ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


    ;arrow signal AR to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,6        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	   ;arrow signal PC to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,9        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	 ;arrow signal DR to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,12        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	 ;arrow signal AC to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,15        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	 ;arrow signal IR to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,21        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	 ;arrow signal TR to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,24        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,COLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

        ;read's R

           ;cursor handling
           MOV  AH,2
           MOV DH,4      ;row
           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'R'   ;  R's ascii
        MOV BL,COLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




        ;write's W

           ;cursor handling
           MOV  AH,2
           MOV DH,4      ;row
           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'W'   ;  W's ascii
        MOV BL,COLOR   ; attrib of W
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	XOR AL,AL
	XOR AH,AH

	MOV AH,0
	INT 16H
 	ret
	project endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


DELAY PROC
        PUSH CX
        MOV CX,  VAR
 TOP:



        CALL DELAY1
        loop tOP

end_top:
        POP CX
        RET

        DELAY ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        DELAY1 PROC
        PUSH BP
        push si
        push di
        pop di
        pop si
        PUSH AX
        MOV AX,01h
        DEC AX
 TOP1:  CMP AX,0
        JE END_TOP1
        DEC AX
        JMP TOP1

 end_top1:
        POP AX
        POP BP
        RET
        DELAY1 ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FETCHING;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	FETCHING PROC
	          ;cursor handling
	MOV AH,0
	MOV AL,3H
	INT 10H

	MOV AH,0
	MOV AL,12H
	INT 10H
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,30       ;col
           INT 10H

        MOV AL,'F'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H
          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,31       ;col
           INT 10H


        MOV AL,'E'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,32       ;col
           INT 10H


        MOV AL,'T'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,33       ;col
           INT 10H


        MOV AL,'C'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,34       ;col
           INT 10H


        MOV AL,'H'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,35       ;col
           INT 10H


        MOV AL,'I'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,36       ;col
           INT 10H


        MOV AL,'N'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,37       ;col
           INT 10H


        MOV AL,'G'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,38       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39    ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,40       ;col
           INT 10H


        MOV AL,'!'   ;
        MOV BL,01H   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

 ;page
        MOV AH, 0CH   ;writing pixel


        MOV AL, 01h   ;pixel attribute

        ;displaying line1
        MOV CX,28   ;col no
        MOV DX,308  ;row no
    FCHLINE1:
        CMP DX,345
        JE END_FCHLINE1
        INT 10H
        INC DX
        JMP FCHLINE1
  END_FCHLINE1:



        ;displaying line2
        MOV CX,610  ;col no
        MOV DX,308  ;row no
    FCHLINE2:
        CMP DX,345
        JE END_FCHLINE2
        INT 10H
        INC DX
        JMP FCHLINE2
  END_FCHLINE2:





        ;displaying line3
        MOV CX,28   ;col no
        MOV DX,308  ;row no
    FCHLINE3:
        CMP cX,610
        JE END_FCHLINE3
        INT 10H
        INC cX
        JMP FCHLINE3
  END_FCHLINE3:



        ;displaying line4
        MOV CX, 28   ;col no
        MOV DX,345  ;row no
    FCHLINE4:
        CMP CX,610
        JE END_FCHLINE4
        INT 10H
        INC CX
        JMP FCHLINE4
  END_FCHLINE4:


        MOV SI,35


           ;cursor handling
           MOV  AH,2
           MOV DH,20     ;row
           MOV DL, 4       ;col

           INT 10H
	        MOV AL,0DBH   ;
        MOV BL,01H   ; attrib of char

 FCHLOOP1:
	CMP SI,0
	JE EN_FCHLooP1


           ;cursor handling
           MOV  AH,2

           add DL,2        ;col
           INT 10H
        call delay

           ;character
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	DEC SI
 	JMP FCHLOOP1

EN_FCHLooP1:
	        MOV AH,0CH
        MOV AL,COLOR

	RET
	FETCHING ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        TIMING_SIGNAL_ZER0 PROC





	MOV AH,2
        MOV DH,29        ;row
           MOV DL,55       ;col
           INT 10H
            ;character

        MOV AL,'T'   ;   ascii
        MOV BL,TCOLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,56       ;col
           INT 10H
            ;character


        MOV AL,'0'   ;  ascii
        MOV BL,TCOLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,57       ;col
           INT 10H
            ;character


        MOV AL,':'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV AH,2
        MOV DH,29        ;row
           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'A'   ;   ascii
        MOV BL,TCOLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,61       ;col
           INT 10H
            ;character


        MOV AL,'R'   ;  ascii
        MOV BL,TCOLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,62       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,63       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,64       ;col
           INT 10H
            ;character


        MOV AL,'P'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,65       ;col
           INT 10H
            ;character


        MOV AL,'C'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        MOV AH,0CH
        MOV AL,FCOLOR

        MOV CX,475
        MOV DX,256
        INT 10H
T0_SIGNAL:
        CMP DX,272
        JE  END_T0_SIGNAL
        INC DX
        CALL DELAY
        INT 10H
        JMP T0_SIGNAL
END_T0_SIGNAL:
        MOV  CX,475
        MOV DX,256
        INT 10H

T01_SIGNAL:
        CMP  CX,595
        JE   END_T01_SIGNAL
        INC  CX
        CALL DELAY
        INT 10H

        JMP  T01_SIGNAL
END_T01_SIGNAL:
        MOV  CX,595
        MOV  DX,256
        INT 10H
T02_SIGNAL:
        CMP DX,430
        JE  END_T02_SIGNAL
        INC DX
        CALL DELAY
        INT 10H
        JMP T02_SIGNAL
END_T02_SIGNAL:

        MOV  CX,595
        MOV  DX,430
        INT 10H
T03_SIGNAL:
        CMP cX,378
        JE  END_T03_SIGNAL
        dec cX
        CALL DELAY
        INT 10H
        JMP T03_SIGNAL
END_T03_SIGNAL:

        MOV  CX,378
        MOV  DX,430
        INT 10H
T04_SIGNAL:
        CMP DX,17
        JE  END_T04_SIGNAL
        dec DX
        CALL DELAY
        INT 10H
        JMP T04_SIGNAL
END_T04_SIGNAL:

        MOV  CX,378
        MOV  DX,17
        INT 10H
T05_SIGNAL:
        CMP CX,295
        JE  END_T05_SIGNAL
        dec CX
        CALL DELAY
        INT 10H
        JMP T05_SIGNAL
END_T05_SIGNAL:

	MOV  CX,295
        MOV  DX,17
        INT 10H
T06_SIGNAL:
        CMP DX,38
        JE  END_T06_SIGNAL
        INC DX
        CALL DELAY
        INT 10H
        JMP T06_SIGNAL
END_T06_SIGNAL:

	MOV  CX,295
        MOV  DX,40
        INT 10H
T07_SIGNAL:
        CMP CX,322
        JE  END_T07_SIGNAL
        INC CX
        CALL DELAY
        INT 10H
        JMP T07_SIGNAL
END_T07_SIGNAL:
	CALL DELAY





	           ;cursor handling
           MOV  AH,2
           MOV DH,6        ;row
           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,FCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;cursor handling
           MOV  AH,2
           MOV DH,9        ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,FCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H
	           ;cursor handling
           MOV  AH,2
           MOV DH,6        ;row
           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,FCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        MOV AH,0CH
        MOV AL,FCOLOR
	MOV CX,	376
	MOV DX, 116
LINE_SIG_LD:
	CMP CX,176
	JE END_LINE_SIG_LD
	INT 10H
	CALL DELAY
	DEC CX
	JMP LINE_SIG_LD
END_LINE_SIG_LD:


           ;box2 LD
           ;cursor handling
           MOV  AH,2
           MOV DH,7      ;row
           MOV DL,21       ;col
           INT 10H
            ;character    L of LD of Box2

        MOV AL,'L'   ;  L's ascii
        MOV BL,FCOLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



;box3 JUNK1
           MOV DH,6      ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21      ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box2 JUNK2
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box2 JUNK3
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	CALL DELAY

          MOV AH,0CH
          MOV AL,COLOR
        ;displaying box2_line2
        MOV CX,152   ;col no
        MOV DX,110  ;row no
    FB2LINE2:
        CMP CX,250
        JE END_FB2LINE2
        INT 10H
        INC CX
        JMP FB2LINE2
  END_FB2LINE2:



	XOR AL,AL
	MOV AH,0
	INT 16H

	MOV AH,0
	INT 16H

	MOV AH,0CH
	MOV AL,COLOR

	ret
	TIMING_SIGNAL_ZER0 ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  TIMING_SIGNAL_ONE PROC
        MOV AH,0CH
        MOV AL, FCOLOR



           ;box2 JUNK1
           MOV DH,6      ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box2 JUNK2
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box2 JUNK3
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV AH,0CH
	MOV AL,COLOR


	MOV CX,150
	MOV DX,110
LNEBX2:
	CMP CX,250
	JE END_LNEBX2
	INC CX
	INT 10H
	JMP LNEBX2
END_LNEBX2:

	 	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'I'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,55       ;col
           INT 10H
            ;character


        MOV AL,'T'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2

           MOV DL,56        ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2

           MOV DL,57       ;col
           INT 10H
            ;character


        MOV AL,':'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H





	MOV  AH,2

           MOV DL,61       ;col
           INT 10H
            ;character


        MOV AL,'R'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,62       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,63       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,64       ;col
           INT 10H
            ;character


        MOV AL,'M'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,65       ;col
           INT 10H
            ;character


        MOV AL,'['   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,66       ;col
           INT 10H
            ;character


        MOV AL,'A'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,67       ;col
           INT 10H
            ;character


        MOV AL,'R'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,68       ;col
           INT 10H
            ;character


        MOV AL,']'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,69       ;col
           INT 10H
            ;character


        MOV AL,' '   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,70       ;col
           INT 10H
            ;character


        MOV AL,','   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,71       ;col
           INT 10H
            ;character


        MOV AL,'P'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,72       ;col
           INT 10H
            ;character


        MOV AL,'C'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,73       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,74       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,75       ;col
           INT 10H
            ;character


        MOV AL,'P'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,76       ;col
           INT 10H
            ;character


        MOV AL,'C'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,77       ;col
           INT 10H
            ;character


        MOV AL,'+'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,78       ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H








	CALL DELAY

          MOV AH,0CH
          MOV AL,FCOLOR




        MOV CX,468
        MOV DX,256
        INT 10H
T1_SIGNAL1:
        CMP DX,272
        JE  END_T1_SIGNAL1
        INC DX
        INT 10H
        CALL DELAY
        JMP T1_SIGNAL1
END_T1_SIGNAL1:


        MOV CX,468
        MOV DX,256
        INT 10H
T1_SIGNAL2:
        CMP CX,595
        JE  END_T1_SIGNAL2
        INC CX
        INT 10H
        CALL DELAY
        JMP T1_SIGNAL2
END_T1_SIGNAL2:




	MOV CX,475
	MOV DX,256

T1_SIGNAL3:
        CMP  CX,595
        JE   END_T1_SIGNAL3
        INC  CX
        CALL DELAY
        INT 10H

        JMP  T1_SIGNAL3
END_T1_SIGNAL3:

        MOV  CX,595
        MOV  DX,256
        INT 10H
T1_SIGNAL4:
        CMP DX,430
        JE  END_T1_SIGNAL4
        INC DX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL4
END_T1_SIGNAL4:

        MOV  CX,595
        MOV  DX,430
        INT 10H
T1_SIGNAL5:
        CMP cX,378
        JE  END_T1_SIGNAL5
        dec cX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL5
END_T1_SIGNAL5:

        MOV  CX,378
        MOV  DX,430
        INT 10H
T1_SIGNAL6:
        CMP DX,17
        JE  END_T1_SIGNAL6
        dec DX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL6
END_T1_SIGNAL6:

        MOV  CX,378
        MOV  DX,17
        INT 10H
T1_SIGNAL7:
        CMP CX,288
        JE  END_T1_SIGNAL7
        dec CX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL7
END_T1_SIGNAL7:


        MOV  CX,288
        MOV  DX,17
        INT 10H
T1_SIGNAL8:
        CMP DX,50
        JE  END_T1_SIGNAL8
        INC DX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL8
END_T1_SIGNAL8:


;to S2
        MOV  CX,288
        MOV  DX,31
        INT 10H
T1_SIGNAL9:
        CMP CX,320
        JE  END_T1_SIGNAL9
        INC CX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL9
END_T1_SIGNAL9:


;to S1
        MOV  CX,288
        MOV  DX,40
        INT 10H
T1_SIGNAL10:
        CMP CX,320
        JE  END_T1_SIGNAL10
        INC CX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL10
END_T1_SIGNAL10:

;to S0
        MOV  CX,288
        MOV  DX,50
        INT 10H
T1_SIGNAL11:
        CMP CX,320
        JE  END_T1_SIGNAL11
        INC CX
        CALL DELAY
        INT 10H
        JMP T1_SIGNAL11
END_T1_SIGNAL11:


	MOV CX,288
	MOV DX,17
   SIG_DOWN:
	CMP DX,375
	JE END_SIG_DOWN
	INT 10H
	CALL DELAY
	INC DX
	JMP SIG_DOWN
END_SIG_DOWN:

	MOV CX,288
	MOV DX, 66
SIG_R:
	CMP CX,176
	JE END_SIG_R
	INT 10H
	DEC CX
	CALL DELAY
	JMP SIG_R
END_SIG_R:


        ;read's R

           ;cursor handling
           MOV  AH,2
           MOV DH,4      ;row
           MOV DL,21       ;col
           INT 10H
            ;character
        MOV CX,1     ; no of times to be printed arrow(any character)
        MOV AL,'R'   ;  R's ascii
        MOV BL,FCOLOR   ; attrib of R
        MOV AH,9     ; calling function 9 to write text in graphic mode

        INT 10H

	MOV AH,0CH
	MOV AL,FCOLOR


	MOV CX,288
	MOV DX,165
SIG_I_AR:
	CMP CX,196
	JE END_SIG_I_AR
	INT 10H
	DEC CX
	CALL DELAY
	JMP  SIG_I_AR
END_SIG_I_AR:




         ;incrementing PC

           ;box3's INR
           ;cursor handling
           MOV  AH,2
           MOV DH,10     ;row
           MOV DL,24       ;col
           INT 10H
            ;character    I of INR of Box3

        MOV AL,'I'   ;  I's ascii
        MOV BL,FCOLOR   ; attrib of I
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV AH,0CH
	MOV AL,FCOLOR

	MOV CX,288
	MOV DX, 375
SIG_L_IR:
	CMP CX,140
	JE END_SIG_L_IR
	INT 10H
	DEC CX
	CALL DELAY
	JMP SIG_L_IR
END_SIG_L_IR:

           ;box7 IR's LD
           ;cursor handling
           MOV  AH,2
           MOV DH,23      ;row
           MOV DL,17       ;col
           INT 10H
            ;character    L of LD of Box7

        MOV AL,'L'   ;  L's ascii
        MOV BL,FCOLOR   ; attrib of L
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



;arrow signal MEM to BUS

           ;cursor handling
           MOV  AH,2
           MOV DH,4    ;row
           MOV DL,41       ;col
           INT 10H
            ;character

        MOV AL,10H   ; right arrow's ascii
        MOV BL,FCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	;box7 JUNK1
           MOV DH,21  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        MOV AH,0CH
        MOV AL,COLOR



           ;box3 val1
           MOV DH,9  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box3 val2
           ;cursor handling
           MOV  AH,2

           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        ;box3 val3
           ;cursor handling
           MOV  AH,2

           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



         MOV AH,0CH
        MOV AL,COLOR

        ;displaying box3_line2
        MOV CX,152   ;col no
        MOV DX,156  ;row no
    B3LINE2:
        CMP CX,250
        JE END_B3LINE2
        INT 10H
        INC CX
        JMP B3LINE2
  END_B3LINE2:
	  CALL DELAY



	;box7 JUNK1
           MOV DH,2  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,49       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2
	   mov DH,2
           MOV DL,51       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,53       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,55       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

       	    MOV DL,71       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,FCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


 	MOV AH,0CH
	MOV AL,COLOR

	MOV AH,0
	INT 16H



	RET
	TIMING_SIGNAL_ONE ENDP







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		TIMING_SIGNAL_TWO  PROC

	MOV AH,0CH
	MOV AL,COLOR


	MOV CX,530
	MOV DX,190
GATE_VL:
	CMP DX,280
	JE END_GATE_VL
	INT 10H
	INC DX
	JMP GATE_VL
END_GATE_VL:


	MOV CX,530
	MOV DX,190
GATE_U1:
	CMP CX,570
	JE END_GATE_U1
	INT 10H
	INC CX

	INT 10H
	INC DX
	INC CX


	JMP GATE_U1
END_GATE_U1:


	MOV CX,570
	MOV DX,210
GATE_VR:
	CMP DX,260
	JE END_GATE_VR
	INT 10H
	INC DX
	JMP GATE_VR
END_GATE_VR:


	MOV CX,530
	MOV DX,280
GATE_D1:
	CMP CX,570
	JE END_GATE_D1
	INT 10H
	INC CX

	INT 10H
	DEC DX
	INC CX


	JMP GATE_D1
END_GATE_D1:



	MOV AH,2
	MOV DL,67
	MOV DH,14
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'A'
	INT 10H


	MOV AH,2
	MOV DL,68
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'N'
	INT 10H



	MOV AH,2
	MOV DL,69
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'D'
	INT 10H





	MOV AH,2
	MOV DL,67
	MOV DH,15
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'G'
	INT 10H


	MOV AH,2
	MOV DL,68
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'A'
	INT 10H



	MOV AH,2
	MOV DL,69
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'T'
	INT 10H




	MOV AH,2
	MOV DL,70
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'E'
	INT 10H




           ;box2 JUNK1
           MOV DH,6      ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box2 JUNK2
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box2 JUNK3
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box3 val1
           MOV DH,9  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box3 val2
           ;cursor handling
           MOV  AH,2

           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        ;box3 val3
           ;cursor handling
           MOV  AH,2

           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	; PC line horzntal
	MOV AH,0CH
	MOV AL,COLOR
	MOV CX, 152
	MOV DX, 156

pc3:
	CMP CX,250
	JE END_pc3
	INT 10H
	INC CX
	JMP PC3
END_PC3:
	MOV AH,0CH
	MOV AL,COLOR






	;box7 JUNK1
           MOV DH,21  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	;box7 JUNK1
           MOV DH,2  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,49       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2
	   mov DH,2
           MOV DL,51       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,53       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,55       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

       	    MOV DL,71       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


 	MOV AH,0CH
	MOV AL,COLOR


        MOV CX,152   ;col no
        MOV DX,110  ;row no
    FB2LINE2:
        CMP CX,250
        JE END_FB2LINE2
        INT 10H
        INC CX
        JMP FB2LINE2
  END_FB2LINE2:


        MOV AH,0CH
        MOV AL,dCOLOR

	        ;CHARACTER



	MOV AH,2
	MOV DH,6
	MOV DL,63
	MOV BH,0
	INT 10H

        MOV BH,0
	MOV BL,DCOLOR
	MOV AL,10H
	MOV AH,9
	MOV CX,1
	INT 10H


	MOV  AH,2
           MOV DH,27        ;row
           MOV DL,55       ;col
           INT 10H
            ;character


        MOV AL,'T'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2

           MOV DL,56        ;col
           INT 10H
            ;character


        MOV AL,'2'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2

           MOV DL,57       ;col
           INT 10H
            ;character


        MOV AL,':'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H





	MOV  AH,2

           MOV DL,61       ;col
           INT 10H
            ;character


        MOV AL,'I'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,62       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,63       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,64       ;col
           INT 10H
            ;character


        MOV AL,'I'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,65       ;col
           INT 10H
            ;character


        MOV AL,'R'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character


        MOV AL,'('   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,67        ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,68       ;col
           INT 10H
            ;character


        MOV AL,'5'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,69       ;col
           INT 10H
            ;character


        MOV AL,')'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2
           MOV DH,28        ;row
           MOV DL,61       ;col
           INT 10H
            ;character


        MOV AL,'D'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,62       ;col
           INT 10H
            ;character


        MOV AL,'0'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,63       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,64       ;col
           INT 10H
            ;character


        MOV AL,'D'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,65       ;col
           INT 10H
            ;character


        MOV AL,'7'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,67        ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,68       ;col
           INT 10H
            ;character


        MOV AL,'I'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,69       ;col
           INT 10H
            ;character


        MOV AL,'R'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2

           MOV DL,70       ;col
           INT 10H
            ;character


        MOV AL,'('   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,71       ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2

           MOV DL,72       ;col
           INT 10H
            ;character


        MOV AL,'2'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,73       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,74       ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2

           MOV DL,75       ;col
           INT 10H
            ;character


        MOV AL,'4'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2

           MOV DL,76       ;col
           INT 10H
            ;character


        MOV AL,')'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H





	MOV  AH,2
           MOV DH,29       ;row
           MOV DL,60      ;col
           INT 10H
            ;character


        MOV AL,'A'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2
           MOV DH,29       ;row
           MOV DL,61       ;col
           INT 10H
            ;character


        MOV AL,'R'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,62       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,63       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,64       ;col
           INT 10H
            ;character


        MOV AL,'I'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,65       ;col
           INT 10H
            ;character


        MOV AL,'R'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character


        MOV AL,'('   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,67        ;col
           INT 10H
            ;character


        MOV AL,'0'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,68       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2

           MOV DL,69       ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2

           MOV DL,70       ;col
           INT 10H
            ;character


        MOV AL,'1'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	MOV  AH,2

           MOV DL,71       ;col
           INT 10H
            ;character


        MOV AL,')'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




   MOV AH,0CH
	MOV AL,DCOLOR

        MOV CX,393
        MOV DX,52
        INT 10H




   MOV AH,0CH
	MOV AL,DCOLOR

        MOV CX,393
        MOV DX,52
        INT 10H








   MOV AH,0CH
	MOV AL,DCOLOR

        MOV CX,393
        MOV DX,52
        INT 10H
LFLP:                            ;ADDRESS FLIP FLOP (BIT)
        CMP DX,136
        JE  END_LFLP
        INC DX
        INT 10H
        JMP LFLP
 END_LFLP:
        CALL DELAY
MOV AL,0
        MOV CX,393
        MOV DX,160


LFLP1:
        CMP DX,232               ; line flipflop to control unit
        JE  END_LFLP1
        INC DX
        INT 10H
        JMP  LFLP1
END_LFLP1:

        MOV CX,393
        MOV DX,232
        INT 10H

LFLP2:
        CMP CX,510               ; line flipflop to control unit
        JE  END_LFLP2
        INC CX
        INT 10H
        JMP  LFLP2
END_LFLP2:

        MOV CX,510
        MOV DX,232
        INT 10H


        MOV AH,2
        MOV DH,9 ; ROW
        MOV DL,49; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,'0'; CHAR
        MOV BL,DCOLOR;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H







	MOV AL,COLOR
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,14 ; ROW
        MOV DL,63; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,10H; CHAR
        MOV BL,0;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H

        CALL DELAY



 	MOV AH,0CH
	MOV AL,DCOLOR
	MOV CX,502
	MOV DX,50
IR1101:   CMP DX,106
        JE END_IR1101
        INC DX
        INT 10H
        JMP  IR1101
END_IR1101:
        CALL DELAY

	mov dx,50
	mov cx,411

IR14:   CMP DX,74
        JE END_IR14
        INC DX
        INT 10H
        JMP  IR14
END_IR14:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,51 ; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV CX,1
        MOV AL,1fh; CHAR
        MOV BL,dcolor;  ARRT
        MOV AH,9

         INT 10H
        MOV AH,0CH
        MOV AL,dCOLOR

        MOV CX,427
        MOV DX,52
        INT 10H


IR13:   CMP DX,74
        JE END_IR13
        INC DX
        INT 10H
        JMP  IR13
END_IR13:
        ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,53 ; COL
        INT 10H
        ;CHARACTER
        MOV CX,1
	 MOV BH,0
        MOV AL,1fh; CHAR
        MOV BL,dcolor;  ARRT
        MOV AH,9

         INT 	10H

	  MOV AH,0CH
        MOV AL,dCOLOR

        CALL DELAY
        MOV CX,443
        MOV DX,52
        INT 10H

IR12:   CMP DX,74
        JE END_IR12
        INC DX
        INT 10H
        JMP  IR12
END_IR12:
        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,4 ; ROW
        MOV DL,55; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV CX,1
	 MOV AL,1fh; CHAR
        MOV BL,dcolor;  ARRT
        MOV AH,9
         INT 10H







	MOV AH,0CH
	MOV AL,DCOLOR

        MOV CX,458
        MOV DX,272
        INT 10H
T20_SIGNAL:
        CMP DX,256
        JE  END_T20_SIGNAL
        DEC DX
        CALL DELAY
        INT 10H
        JMP T20_SIGNAL
END_T20_SIGNAL:
        MOV  CX,458
        MOV DX,256
        INT 10H

T21_SIGNAL:
        CMP  CX,595
        JE   END_T21_SIGNAL
        INC  CX
        CALL DELAY
        INT 10H

        JMP  T21_SIGNAL
END_T21_SIGNAL:

  	CALL DELAY
	XOR AL,AL
	MOV AH,0
	INT 16H
	MOV AH,0
	INT 16H
	RET
	TIMING_SIGNAL_TWO  ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	TIMING_SIGNAL_THREE  PROC

            ;box2 JUNK1
           MOV DH,6      ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box2 JUNK2
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box2 JUNK3
           ;cursor handling
           MOV  AH,2
           MOV DH,6      ;row
           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box3 val1
           MOV DH,9  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,21       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box3 val2
           ;cursor handling
           MOV  AH,2

           MOV DL,24       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


        ;box3 val3
           ;cursor handling
           MOV  AH,2

           MOV DL,27       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


MOV AH,2
        MOV DH,29        ;row
           MOV DL,55       ;col
           INT 10H
            ;character

        MOV AL,'T'   ;   ascii
        MOV BL,TCOLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,56       ;col
           INT 10H
            ;character


        MOV AL,'3'   ;  ascii
        MOV BL,TCOLOR   ; attrib
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2

           MOV DL,57       ;col
           INT 10H
            ;character


        MOV AL,':'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H






	 	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'A'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,61       ;col
           INT 10H
            ;character


        MOV AL,'C'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,62       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,63       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,64       ;col
           INT 10H
            ;character


        MOV AL,'0'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,66       ;col
           INT 10H
            ;character


        MOV AL,','   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	 	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,68       ;col
           INT 10H
            ;character

        MOV AL,'S'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,69       ;col
           INT 10H
            ;character


        MOV AL,'C'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,70       ;col
           INT 10H
            ;character


        MOV AL,'<'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,71       ;col
           INT 10H
            ;character


        MOV AL,'-'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	MOV  AH,2
           MOV DH,29        ;row
           MOV DL,72       ;col
           INT 10H
            ;character


        MOV AL,'0'   ; right arrow's ascii
        MOV BL,TCOLOR   ; attrib of arrow
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


MOV AH,0CH
MOV AL,ECOLOR


MOV CX,530
	MOV DX,190
GATE_VL:
	CMP DX,280
	JE END_GATE_VL
	INT 10H
	INC DX
	JMP GATE_VL
END_GATE_VL:


	MOV CX,530
	MOV DX,190
GATE_U1:
	CMP CX,570
	JE END_GATE_U1
	INT 10H
	INC CX

	INT 10H
	INC DX
	INC CX


	JMP GATE_U1
END_GATE_U1:


	MOV CX,570
	MOV DX,210
GATE_VR:
	CMP DX,260
	JE END_GATE_VR
	INT 10H
	INC DX
	JMP GATE_VR
END_GATE_VR:


	MOV CX,530
	MOV DX,280
GATE_D1:
	CMP CX,570
	JE END_GATE_D1
	INT 10H
	INC CX

	INT 10H
	DEC DX
	INC CX


	JMP GATE_D1
END_GATE_D1:



	MOV AH,2
	MOV DL,67
	MOV DH,14
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'A'
	INT 10H


	MOV AH,2
	MOV DL,68
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'N'
	INT 10H



	MOV AH,2
	MOV DL,69
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'D'
	INT 10H





	MOV AH,2
	MOV DL,67
	MOV DH,15
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'G'
	INT 10H


	MOV AH,2
	MOV DL,68
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'A'
	INT 10H



	MOV AH,2
	MOV DL,69
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'T'
	INT 10H




	MOV AH,2
	MOV DL,70
	INT 10H

	MOV AH,9
	MOV CX,1
	MOV BL,TCOLOR
	MOV AL,'E'
	INT 10H











	; PC line horzntal
	MOV AH,0CH
	MOV AL,COLOR
		MOV CX, 152
	MOV DX, 156

pc3:
	CMP CX,250
	JE END_pc3
	INT 10H
	INC CX
	JMP PC3
END_PC3:
	MOV AH,0CH
	MOV AL,COLOR






	;box7 JUNK1
           MOV DH,21  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H




           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



	;box7 JUNK1
           MOV DH,2  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,49       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK2
           ;cursor handling
           MOV  AH,2
	   mov DH,2
           MOV DL,51       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,53       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box7 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,55       ;col
           INT 10H
            ;character

        MOV AL,'1'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,60       ;col
           INT 10H
            ;character

        MOV AL,'8'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,66       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box7 JUNK7
           ;cursor handling
           MOV  AH,2

       	    MOV DL,71       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,TCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


 	MOV AH,0CH
	MOV AL,COLOR


        MOV CX,152   ;col no
        MOV DX,110  ;row no
    FB2LINE2:
        CMP CX,250
        JE END_FB2LINE2
        INT 10H
        INC CX
        JMP FB2LINE2
  END_FB2LINE2:


        MOV AH,0CH
        MOV AL,ECOLOR

	        ;CHARACTER






	MOV AH,0CH
	MOV AL,ECOLOR


        CALL DELAY
        MOV CX,393
        MOV DX,160
        INT 10H
LFLP1:
        CMP DX,232               ; line flipflop to control unit
        JE  END_LFLP1
        INC DX
        INT 10H
        JMP  LFLP1
END_LFLP1:
        CALL DELAY
        MOV CX,393
        MOV DX,232
        INT 10H
LFLP2:
        CMP CX,510               ; line flipflop to control unit
        JE  END_LFLP2
        INC CX
        INT 10H
        JMP  LFLP2
END_LFLP2:

        MOV CX,510
        MOV DX,232
        INT 10H
LFLP3:
        CMP CX,530               ; line flipflop to control unit
        JE  END_LFLP3
        INC CX
        INT 10H
        JMP  LFLP3
END_LFLP3 :



        CALL DELAY
         ;CURSOR HANDLING
        MOV AH,2
        MOV DH,14 ; ROW
        MOV DL,63; COL
        INT 10H
        ;CHARACTER
        MOV BH,0
        MOV AL,10H; CHAR
        MOV BL,ecolor;  ARRT
        MOV AH,9
        MOV CX,1
        INT 10H

        CALL DELAY



 	MOV AH,0CH
	MOV AL,ECOLOR


         CALL DELAY


	mov dx,146
	mov cx, 411
D7A:
	CMP DX,214
	JE END_D7A
	INT 10H
	INC DX
	JMP D7A
END_D7A:

	MOV CX,411
	MOV DX,214
D7B:
	CMP CX,510
	JE END_D7B
	INT 10H
	INC CX
	JMP D7B
END_D7B:

	MOV CX,510
	MOV DX,214
D7C:
	CMP CX,530
	JE END_D7C
	INT 10H
	INC CX
	JMP D7C
END_D7C:


	MOV AH,2
	MOV DH,13
	MOV DL,63
	INT 10H

	MOV CX,1
	MOV AH,9
	MOV BL,ECOLOR
	MOV AL,10H
	INT 10H


 	MOV AH,0CH
	MOV AL,ECOLOR

        MOV CX,450
        MOV DX,256
        INT 10H
T30_SIGNAL:
        CMP DX,272
        JE  END_T30_SIGNAL
        INC DX
        CALL DELAY
        INT 10H
        JMP T30_SIGNAL
END_T30_SIGNAL:

        MOV  CX,450
        MOV DX,256
        INT 10H

T31_SIGNAL:
        CMP  CX,530
        JE   END_T31_SIGNAL
        INC  CX
        CALL DELAY
        INT 10H

        JMP  T31_SIGNAL
END_T31_SIGNAL:


        MOV  CX,570
        MOV DX,234
        INT 10H

OUT_SIGNAL:
        CMP  CX,595
        JE   END_OUT_SIGNAL
        INC  CX
        CALL DELAY
        INT 10H

        JMP  OUT_SIGNAL
END_OUT_SIGNAL:




        MOV  CX,595
        MOV  DX,234
        INT 10H
T32_SIGNAL:
        CMP DX,430
        JE  END_T32_SIGNAL
        INC DX
        CALL DELAY
        INT 10H
        JMP T32_SIGNAL
END_T32_SIGNAL:

        MOV  CX,595
        MOV  DX,430
        INT 10H
T33_SIGNAL:
        CMP cX,378
        JE  END_T33_SIGNAL
        dec cX
        CALL DELAY
        INT 10H
        JMP T33_SIGNAL
END_T33_SIGNAL:

        MOV  CX,378
        MOV  DX,430
        INT 10H
T34_SIGNAL:
        CMP DX,285
        JE  END_T34_SIGNAL
        dec DX
        CALL DELAY
        INT 10H
        JMP T34_SIGNAL
END_T34_SIGNAL:


        MOV  CX,378
        MOV  DX,285
        INT 10H
T35_SIGNAL:
        CMP CX,224
        JE  END_T35_SIGNAL
        dec CX
        CALL DELAY
        INT 10H
        JMP T35_SIGNAL
END_T35_SIGNAL:

 	MOV AH,2
	MOV DH, 17
	MOV DL, 27
	INT 10H

	MOV AH,9
	MOV BL, ECOLOR
	MOV CX,1
	MOV AL,'C'
	INT 10H



	;box5 JUNK1
           MOV DH,15  ;row
           ;cursor handling
           MOV  AH,2

           MOV DL,17       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK2
           ;cursor handling
           MOV  AH,2

           MOV DL,18       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box5 JUNK3
           ;cursor handling
           MOV  AH,2

           MOV DL,19       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


	;box5 JUNK4
           ;cursor handling
           MOV  AH,2

           MOV DL,20       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK5


           ;cursor handling
           MOV  AH,2

           MOV DL,23       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK6
           ;cursor handling
           MOV  AH,2

           MOV DL,26       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H



           ;box5 JUNK7
           ;cursor handling
           MOV  AH,2

           MOV DL,29       ;col
           INT 10H
            ;character

        MOV AL,'0'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	MOV AH,0CH
	MOV AL,COLOR
	MOV CX,120
	MOV DX,240
LINE_AC:
	CMP CX,250
	JE eND_LINE_AC
	INT 10H
	INC CX
	JMP LINE_AC
END_LINE_AC:

	CALL DELAY
	XOR AL,AL
	MOV AH,0
	INT 16H
	MOV AH,0
	INT 16H



	RET
	TIMING_SIGNAL_THREE  ENDP

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DECODING;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DECODING PROC

	 MOV AX,12H
	 INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,30       ;col
           INT 10H

        MOV AL,'D'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H
          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,31       ;col
           INT 10H


        MOV AL,'E'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,32       ;col
           INT 10H


        MOV AL,'C'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,33       ;col
           INT 10H


        MOV AL,'O'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,34       ;col
           INT 10H


        MOV AL,'D'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,35       ;col
           INT 10H


        MOV AL,'I'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,36       ;col
           INT 10H


        MOV AL,'N'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,37       ;col
           INT 10H


        MOV AL,'G'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,38       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39    ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,40       ;col
           INT 10H


        MOV AL,'!'   ;
        MOV BL,DCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

 ;page
        MOV AH, 0CH   ;writing pixel


        MOV AL, 03h   ;pixel attribute

        ;displaying line1
        MOV CX,28   ;col no
        MOV DX,308  ;row no
    DECODING1:
        CMP DX,345
        JE DECODING_LINE1
        INT 10H
        INC DX
        JMP DECODING1
  DECODING_LINE1:



        ;displaying line2
        MOV CX,610  ;col no
        MOV DX,308  ;row no
   DECODING2:
        CMP DX,345
        JE DECODING_LINE2
        INT 10H
        INC DX
        JMP DECODING2
 DECODING_LINE2:





        ;displaying line3
        MOV CX,28   ;col no
        MOV DX,308  ;row no
    DECODING3:
        CMP cX,610
        JE DECODING_LINE3
        INT 10H
        INC cX
        JMP DECODING3
  DECODING_LINE3:



        ;displaying line4
        MOV CX, 28   ;col no
        MOV DX,345  ;row no
    DECODING4:
        CMP CX,610
        JE DECODING_LINE4
        INT 10H
        INC CX
        JMP DECODING4
  DECODING_LINE4:


        MOV SI,35


           ;cursor handling
           MOV  AH,2
           MOV DH,20     ;row
           MOV DL, 4       ;col

           INT 10H
	        MOV AL,0DBH   ;
        MOV BL,DCOLOR   ; attrib of char

 DECODINGP1:
	CMP SI,0
	JE DECODING_LooP1


           ;cursor handling
           MOV  AH,2

           add DL,2        ;col
           INT 10H
        call delay

           ;character
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	DEC SI
 	JMP DECODINGP1

DECODING_LooP1:

	XOR AL,AL
	MOV AH,0
	INT 16H
	MOV AH,0
	INT 16H
	RET
	DECODING ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;START PAGE ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	STARTPAG PROC

  MOV CX,4
FOR1:
  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H
   LOOP FOR1


  MOV DX,OFFSET MSG_SEM
  MOV AH,9
  INT 21H

  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H




  MOV DX,OFFSET MSG0
  MOV AH,9
  INT 21H

  MOV CX,2
FOR3:
  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H
   LOOP FOR3



  MOV DX,OFFSET MSG1
  MOV AH,9
  INT 21H



  MOV CX,3
FOR4:
  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H
  LOOP FOR4

  MOV DX,OFFSET MSG2
  MOV AH,9
  INT 21H

  MOV CX,2
FOR5:
  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H
  LOOP FOR5


  MOV DX,OFFSET MSG3
  MOV AH,9
  INT 21H


  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H




  MOV DX,OFFSET MSG4
  MOV AH,9
  INT 21H

  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H


MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

  MOV DX,OFFSET MSG5
  MOV AH,9
  INT 21H

  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

  MOV DX,OFFSET MSG6
  MOV AH,9
  INT 21H


  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

  MOV DX,OFFSET MSG7
  MOV AH,9
  INT 21H


  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H

  MOV DX,OFFSET MSG8
  MOV AH,9
  INT 21H


  MOV CX,2
FOR2:
  MOV DL,0AH
  MOV AH,2
  INT 21H
  MOV DL,0DH
  MOV AH,2
  INT 21H
  LOOP FOR2

  mov ah,0
  int 16h


  mov ah,0
  int 16h

  XOR AX,AX
  XOR BX,BX
  XOR CX,CX
  XOR DX,DX


	RET
	STARTPAG ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;







lod proc
       ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,30       ;col
           INT 10H

        MOV AL,'L'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H
          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,31       ;col
           INT 10H


        MOV AL,'O'
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,32       ;col
           INT 10H


        MOV AL,'A'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,33       ;col
           INT 10H


        MOV AL,'D'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,34       ;col
           INT 10H


        MOV AL,'I'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,35       ;col
           INT 10H


        MOV AL,'N'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,36       ;col
           INT 10H


        MOV AL,'G'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,38       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,tcolour  ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39    ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,tcolour  ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,40       ;col
           INT 10H


        MOV AL,'!'   ;
        MOV BL,tcolour   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

 ;page
        MOV AH, 0CH   ;writing pixel


        MOV AL, tcolour   ;pixel attribute

        ;displaying line1
        MOV CX,28   ;col no
        MOV DX,308  ;row no
    LOADING1:
        CMP DX,345
        JE  LOADING_LINE1
        INT 10H
        INC DX
        JMP  LOADING1
   LOADING_LINE1:



        ;displaying line2
        MOV CX,610  ;col no
        MOV DX,308  ;row no
    LOADING2:
        CMP DX,345
        JE LOADING_LINE2
        INT 10H
        INC DX
        JMP  LOADING2
  LOADING_LINE2:





        ;displaying line3
        MOV CX,28   ;col no
        MOV DX,308  ;row no
     LOADING3:
        CMP cX,610
        JE LOADING_LINE3
        INT 10H
        INC cX
        JMP  LOADING3
   LOADING_LINE3:



        ;displaying line4
        MOV CX, 28   ;col no
        MOV DX,345  ;row no
     LOADING4:
        CMP CX,610
        JE  LOADING_LINE4
        INT 10H
        INC CX
        JMP  LOADING4
   LOADING_LINE4:


        MOV SI,35


           ;cursor handling
           MOV  AH,2
           MOV DH,20     ;row
           MOV DL, 4       ;col

           INT 10H
	        MOV AL,0DBH   ;
        MOV BL,tcolour   ; attrib of char

  LOADINGP1:
	CMP SI,0
	JE  LOADING_LooP1


           ;cursor handling
           MOV  AH,2

           add DL,2        ;col
           INT 10H
        call delay

           ;character
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	DEC SI
 	JMP  LOADINGP1

 LOADING_LooP1:

mov al,0DBH
int 10h
	MOV AH,0
	INT 16H


 RET

lod endp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;EXECUTING PROC;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EXECUTING PROC

	 MOV AX,12H
	 INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,30       ;col
           INT 10H

        MOV AL,'E'   ;
        MOV BL,eCOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H
          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,31       ;col
           INT 10H


        MOV AL,'X'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,32       ;col
           INT 10H


        MOV AL,'E'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H


          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,33       ;col
           INT 10H


        MOV AL,'C'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,34       ;col
           INT 10H


        MOV AL,'U'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,35       ;col
           INT 10H


        MOV AL,'T'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,36       ;col
           INT 10H


        MOV AL,'I'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,37       ;col
           INT 10H


        MOV AL,'N'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,38       ;col
           INT 10H


        MOV AL,'G'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39    ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,39       ;col
           INT 10H


        MOV AL,'.'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

          ;cursor handling
           MOV  AH,2
           MOV DH,10      ;row
           MOV DL,40       ;col
           INT 10H


        MOV AL,'!'   ;
        MOV BL,ECOLOR   ; attrib of char
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

 ;page
        MOV AH, 0CH   ;writing pixel


        MOV AL, ECOLOR   ;pixel attribute

        ;displaying line1
        MOV CX,28   ;col no
        MOV DX,308  ;row no


    DECODING1:
        CMP DX,345
        JE DECODING_LINE1
        INT 10H
        INC DX
        JMP DECODING1
  DECODING_LINE1:



        ;displaying line2
        MOV CX,610  ;col no
        MOV DX,308  ;row no
   DECODING2:
        CMP DX,345
        JE DECODING_LINE2
        INT 10H
        INC DX
        JMP DECODING2
 DECODING_LINE2:





        ;displaying line3
        MOV CX,28   ;col no
        MOV DX,308  ;row no
    DECODING3:
        CMP cX,610
        JE DECODING_LINE3
        INT 10H
        INC cX
        JMP DECODING3
  DECODING_LINE3:



        ;displaying line4
        MOV CX, 28   ;col no
        MOV DX,345  ;row no
    DECODING4:
        CMP CX,610
        JE DECODING_LINE4
        INT 10H
        INC CX
        JMP DECODING4
  DECODING_LINE4:


        MOV SI,35


           ;cursor handling
           MOV  AH,2
           MOV DH,20     ;row
           MOV DL, 4       ;col

           INT 10H
	        MOV AL,0DBH   ;
        MOV BL,ECOLOR   ; attrib of char

 DECODINGP1:
	CMP SI,0
	JE DECODING_LooP1


           ;cursor handling
           MOV  AH,2

           add DL,2        ;col
           INT 10H
        call delay

           ;character
        MOV AH,9     ; calling function 9 to write text in graphic mode
        MOV CX,1     ; no of times to be printed arrow(any character)
        INT 10H

	DEC SI
 	JMP DECODINGP1

DECODING_LooP1:

	XOR AL,AL
	MOV AH,0
	INT 16H
	MOV AH,0
	INT 16H

	RET
	EXECUTING ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;EXECUTING PROC END;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        EXITPROC PROC
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX



        MOV AH,4CH
        INT 21H
        RET
        EXITPROC ENDP



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        END MAIN


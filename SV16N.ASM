.286C
code   segment
	 assume   cs:code,ds:code,ss:nothing,es:nothing
	 org 100h
   START:
	 JMP	init
org 110h
D1  DW	 16 DUP(0)
D2  DW	 16 DUP(0)
DN  DW	 16 DUP(0)
DLA DW	 16 DUP(0)
WANO DB   16 DUP(0)  ;計量桶之秤No.
OK1 DB	 16 DUP(0)   ;小於落差 STEP1計量OK
OK2 DB	 16 DUP(0)   ;計量完成=0
OUTIME	 DW   16 DUP(0)
DON	 DW 1 dup(0)  ;dout 1/3 現值
RDTIME	  DW  16 DUP(200)
RDOK DB   16 DUP(0)
outIMEN  DW  16 DUP(0)
RDTIMEN DW 16 DUP(0)
totchanel     DW  1 DUP(8)
DLAN	 DW   16 DUP(0)  ;磅稱數值
OUTOK  DB    16 DUP(0)
OPTM1  DW 1 DUP(0)
CLTM   DW 1 DUP(0)
OPTM2  DW 1 DUP(0)
MIXTM DW 1 DUP(0)
MIXA  DW 1 DUP(0)
MIXOP DW 1 DUP(0)
ACTOPTM1  DW 1 DUP(0)
ACTCLTM   DW 1 DUP(0)
ACTOPTM2  DW 1 DUP(0)
ACTMIXTM DW 1 DUP(0)
ACTMIXA  DW 1 DUP(0)
ACTMIXOP DW 1 DUP(0)
ZEROK	 DB  16 DUP(0)	;進料中=1
ZER	DW  16 DUP(0)	;進料零點 F6 setting
ZERTM DW  16 DUP(200) ;小於進料零點延時
ACTZERTM  DW  16 DUP(0)
DON2	  DW  16 DUP(0)  ;dout 2/3 現值
DON3	  DW  16 DUP(0)  ;dout 3/3 現值
LZA	  DW  16 DUP(0) ;磅秤zero  a/d
B1	  DW  32 DUP(2048)
B2	  DW  32 DUP(2048)
B3	  DW  32 DUP(2048)
B4	  DW  32 DUP(2048)
B5	  DW  32 DUP(2048)
B6	  DW  32 DUP(2048)
B7	  DW  32 DUP(2048)
B8	  DW  32 DUP(2048)
B9	  DW  32 DUP(2048)
B10	  DW  32 DUP(2048)
B11	  DW  32 DUP(2048)
B12	  DW  32 DUP(2048)
B13	  DW  32 DUP(2048)
B14	  DW  32 DUP(2048)
B15	  DW  32 DUP(2048)
B16	  DW  32 DUP(2048)

ANO	  DW  1 DUP(32) ;averege num a/d save position
ast	  dw 1	DUP(0) ;mix  start=0
repno	  DW  1 DUP(50) ;A/D ERR.num
PAR	  DB  16 DUP(1) ; C2 AND C3 累計共用SAME AD CHANEL
OK3 DB	 16 DUP(0)
OK4 DB	 16 DUP(0)
;  msg adress=cs:6A2H
MSG	  DB	'BJ-SV931967023'
;  KEYBUFF adress=cs:6B2H
keybuff   db  16 dup(0)
KEYINP	 DB   1 DUP(0)
KEYOUTP  DB   1 DUP(0)

timer_count   db  0
new_intr8  dd ?
;_60  07D9H
old_intr60  dd ?
  ;timer int
;_8  07DDH
old_intr8  dd ?
  ;keyboard int
old_intr9  label dword
off09 dw ?
seg09 dw ?
; adress tsr_long  cs:06D3h
tsr_long dw ?
; adress old_psp  07E7h
old_psp   dw '12'
DATA	     db '--already  installed--$'
data_nf      db '--NOT FIND--$'
data_rmok    db '--SV  REMOVED OK!-- $'
data_rmF     db '--SV REMOVED Failed!--  $'
     db 	' '
     db 	'V6'
     db 	' $'
mzx  db 	' '
OUTDouble  DB	 16 DUP(0)     ;82FH
tmpdw	 DW  1 DUP(0)
tmpsi	 DW  1 DUP(0)



mycode	 proc
sti
	  PUSH	AX
	  PUSH	bX
	  PUSH CX
	  PUSH	dX
	  push si
	  push di
	  PUSH DS
	  PUSH cs
	  POP DS
	  MOV AX,DON
	  CALL DOU
	  MOV AX,DON2
	  CALL DOU2
	 MOV  SI,TOTCHANEL  ;must  weight scaler  number +1
	 INC SI
	 MOV  BX,SI	  ;READ A/D CHANEL 1 to 16    TO BL
	 CALL AD	       ;READ A/D DATA
	 MOV  DLAN[+30],AX     ;water adjuester
	 SUB SI,1
	 MOV  BX,SI	  ;READ A/D CHANEL     TO BL
	 CALL AD	       ;READ A/D DATA
	 MOV  ACTMIXA,AX  ;mixer current
	 SUB SI,1
	 TEST AST,0FFH
	 JZ step0
RDDATA1:MOV  BX,SI	 ;READ A/D CHANEL     TO BL
	CALL AD 	      ;READ A/D DATA
	SUB AX,LZA[BX +SI-2]
	MOV  DLAN[BX+SI-2],AX
	SUB SI,1
	JNZ step0
	JMP SKK1
step0:
	 ;pMOV SI,1
	 MOV tmpdw,0
RDDATA:
	 MOV  BX,SI	       ;READ A/D CHANEL     TO BL
	 CALL AD	       ;READ A/D DATA	1 to 16
	 SUB AX,LZA[BX+SI-2]
	 PUSH SI
	 MOV SI,ANO
STP02:
	 MOV BX,SI
	 MOV DX,32
	 CMP DX,SI
	 JE  YDX1
	 ;MOV  DX,B1[BX+SI]
	 ADD BX,tmpdw
	 MOV  DX,B1[BX+SI] ;[tmpdw ]
	 JMP YDX0
  ;YDX1:  MOV  DX,B1[+0]
  YDX1:
	 MOV   BX,[tmpdw]
	 MOV  DX,B1[BX]
  YDX0:

	 CALL NOISE
	 ;MOV B1[BX+SI-2],AX
	 MOV  BX,[tmpdw]
	 ADD BX,SI;
	 MOV  B1[BX+SI-2],AX

	 POP SI
	 MOV CX,32
	 ;LEA  BX,B1
	 MOV  BX,[tmpdw]
	 LEA  BX,B1[BX]
	 CALL AVG
	 MOV BX,SI
	 MOV  DLAN[BX+SI-2],AX ;
	 ADD tmpdw,64
	 ;INC SI
	 DEC SI
	 ;[MOV AX,TOTCHANEL
	 ;CMP AX,SI
	 JNZ RDDATA

SKK:	 SUB ANO,1
	 JNZ SKK1
	 MOV ANO,32
	 ;----CHECK 進料完成?  進料中=1 磅稱零點
SKK1:	 MOV  SI,TOTCHANEL  ;磅稱CH0-N
	 SUB  AX,2

ZEROP1:  TEST  ZEROK[SI],0FFH
	 JZ   ZEROP2

ZEROP3:   MOV BX,SI
	  MOV AX,DLAN[BX+SI]
	  CMP ZER[BX+SI],AX
	  JL  ZEROP2
	  ;磅稱小於零點,進料延時計時
	  SUB ACTZERTM[BX+SI],01H
	  TEST	ACTZERTM[BX+SI],0FFFFH
	  JNZ ZEROP2
	  MOV AX,ZERTM[BX+SI]
	  MOV  ACTZERTM[BX+SI],AX
	  MOV ZEROK[SI],0H
	  MOV BX,0FFFEH
	  TEST SI,0FFFFH
	  JZ   ZEROP7
	  MOV AX,SI
	  MOV CX,SI
ZEROP6:   ROL BX,CL
ZEROP7:   MOV AX,DON2
HN_1:	  AND AX,BX
	  CALL DOU2
ZEROP2:  SUB  SI,01H
	 JL   cona10
	 JMP   ZEROP1

	 ;----CHECK 計量?  進料中=1 磅稱零點
CONA10:  MOV  SI,0FH
STEP1:	 MOV  CL,OK2[SI]
	 TEST CL,0FFH
	 JNZ  step11		  ;?  OK2=0 IF=0 JMP
	 JMP  CONTEND
step11:  MOV  BL,WANO[SI]
	 MOV BH,0H
	 MOV DI,BX
	 MOV AX,DLAN[BX+DI]
	 SUB AX,DLA[BX+DI]
	 PUSH BX
	 MOV  BX,SI
	 MOV  DN[BX+SI],AX
	 POP BX
	 MOV  CL,OK1[SI]
	 TEST CL,0FFH
	 JZ  CONT1    ;  AX - D1 <落差
	 PUSH BX
	 MOV BX,SI
	 CMP D1[BX+SI],AX  ;d1[]=設定-落差
	 POP BX
	 JZ   DO1
	 JL  DO1     ; AX > D1
	 JMP CONTEND
DO1:
	  PUSH AX
	  PUSH BX
	  MOV BX,0FFFEH
	  TEST SI,0FFFFH
	  JZ   DOLP11
	  MOV CX,SI
	  ;DOLP1:    ROL BX,1
	  ;LOOP DOLP1
	  ROL BX,CL
DOLP11:   MOV AX,DON
	  AND AX,BX
	  MOV OK1[SI],0H
	  CALL DOU

	  MOV CL,OUTDouble[SI]
	  .IF  ( CL >5 )
	     MOV BX,0FFFEH
	     .IF  ( CL <16 )
		ROL BX,CL
		MOV AX,DON
		AND AX,BX
		CALL DOU
	     .ELSEIF (CL <32 )
	       SUB CX,16
	       ROL BX,CL
	       MOV AX,DON2
	       AND AX,BX
	       CALL DOU2
	     .ENDIF
	  .ENDIF
	  ; CALL C  D/O  Double  out
	  ;CALL OUTDouble
	  MOV BX,SI
	  MOV  AX,RDTIME[BX+SI]
	  MOV  RDTIMEN[BX+SI],AX
	  MOV RDOK[SI],01H
	  POP bX
	  POP aX
	  JMP CONTEND

CONT1:
	  MOV  CL,rdok[SI]
	 .IF (CL==0)
	   ;TEST CL,0FFH
	   ;JZ CONT2		    ;  IF RDOK=0 JMP CONT2 TO TEST OUTOK=0?
	   JMP CONT2
	 .ENDIF
	 PUSH BX
	 MOV BX,SI
	 MOV CX,RDTIMEN[SI+BX]
	 TEST CX,0FFFFH
	 POP BX
	 JZ CONT3	       ;IF RDTIMN=0 JMP TO CONT3
	 SUB CX,01H
	 PUSH BX
	 MOV BX,SI
	 MOV RDTIMEN[SI+BX],CX
	 pop bx
	 JMP  CONTEND
CONT2:
	PUSH BX
	MOV BX,SI
	MOV CX,OUTIMEN[BX+SI]
	POP BX
	TEST  CX,0FFFFH
	JZ   CONT4
;82.12.23 new	  BX 稱NO,SI 原料NO
	PUSH BX 		   ;new
	MOV BX,SI
	CMP D2[BX+SI],AX
	JNL CONT4_0	       ;IF <D2	JMP CONT5
	MOV BX,SI
	MOV OUTIMEN[BX+SI],0H
CONT4_0:			;new
       POP BX			;new
       jmp contend
CONT4:
       MOV OUTOK[SI],0H
       MOV RDOK[SI],01H
       PUSH AX
       PUSH BX
       MOV BX,SI
       MOV AX,RDTIME[BX+SI]
       MOV RDTIMEN[BX+SI],AX
       MOV AX,DON
	  MOV BX,0FFFEH
	  TEST SI,0FFFFH
	  JZ   DOLP33
	  MOV CX,SI
DOLP3:	  ROL BX,1
	  LOOP DOLP3
DOLP33:   MOV AX,DON
 HHH1:	  AND AX,BX
	  CALL DOU
       POP BX
       POP AX
       JMP CONTEND
CONT3:
	MOV RDOK[SI],0H
	PUSH BX
	MOV BX,SI
	CMP D2[BX+SI],AX
	POP BX
	JNL CONT5	       ;IF <D2	JMP CONT5
	MOV OK2[SI],0H
	PUSH BX
	MOV BX,SI
       ; MOV D2[BX+SI],AX    5/11/2003
	  PUSH AX
	  MOV BX,0FFFEH
	  TEST SI,0FFFFH
	  JZ   kDOLP11
	  MOV CX,SI
kDOLP1:    ROL BX,1
	  LOOP kDOLP1
kDOLP11:   MOV AX,DON
	  AND AX,BX
	  MOV BX,SI
	  CALL DOU

	pop ax
;up
	POP BX
	MOV DI,BX
	JMP CONTEND
CONT5:
	  MOV BX,01H
	  TEST SI,0FFFFH
	  JZ   DOLP55
	  MOV CX,SI
DOLP5:	  ROL BX,1
	  LOOP DOLP5
DOLP55:   MOV AX,DON
	  OR AX,BX
	  CALL DOU
	  MOV OUTOK[SI],01H
	  MOV BX,SI
	  MOV AX,OUTIME[BX+SI]
	  MOV OUTIMEN[BX+SI],AX

CONTEND:
	SUB  SI,1
	JL  RETU1
RETU:	JMP STEP1

RETU1:

	  INC TIMER_COUNT
	  CMP TIMER_COUNT,08
	  JNZ  SKIP
RETU2:	  MOV  TIMER_COUNT,0
	  POP DS
	  pop di
	  pop si
	  pop dx
	  pop Cx
	  pop bx
	  POP AX
	  pushf
	 call  cs:old_intr8
	 jmp   skip2
skip:
	  mov al,20h
	  out 20h,al
	  POP DS
	  pop di
	  pop si
	  pop dx
	  pop Cx
	  pop bx
	  pop ax
  skip2:
	    iret
mycode	  endp


   AD	PROC		     ;A/D  READ  BL=CHANEL  AX=A/D  DATA
	     MOV DX,022AH
	     MOV AL,BL
	     SUB AL,01H
	     OUT  DX,AL
	     MOV DX,229H
	     MOV AL,00H
	     OUT  DX,AL
	     MOV DX,22CH
	     MOV AL,00H
	     OUT DX,AL
	     MOV DX,225H
	     mov cx,repno
  RD:
	     IN AL,DX
	     MOV AH,AL
	     TEST AH,10000B
	     jZ  RD_ok
	     loop  rd
	     mov ax,0FFFH
	     JmP RD_OK1
  rd_ok:     MOV DX,224H
	     IN AL,DX
	     AND AH,0FH
  rd_ok1:    RET
  AD  ENDP

  din	  proc		   ;DIGITAL DATA INPUT	TO AX
	  MOV DX,226H
	  IN AX,DX
	  ret
  din	 ENDP

  dou	  proc		    ;DIGITAL DATA OUTPUT   FROM   AX
	  mov  DX,022DH
	  MOV	DON,AX
	  TEST	KEYOUTP,0FFH
	  JZ   END10
	  mov	AX,0
   END10: OUT  DX,AX
	  ret
  dou	 endp
  dou2	  proc		    ;DIGITAL DATA OUTPUT   FROM   AX
	  mov  DX,02A0H
	  MOV	DON2,AX
	  TEST	KEYOUTP,0FFH
	  JZ   END11
	  mov	AX,0
  END11:  OUT  DX,AX
	  ret
  dou2	 endp
  AVG	  proc
	  SUB  AX,AX
	  SUB  DX,DX
	  PUSH	CX
  ADD_W:  ADD  AX,[BX]
	  ADC  DX,0
	  ADD BX,2
	  LOOP	ADD_W
	  POP CX
	  DIV  CX
	  ret
  AVG	 endp
  noise   proc		    ;noise puse  is not read
	   ADD DX,020H	; 0.8HZ  11B
	   CMP	AX,DX
	   JLE	ME
	   MOV CX,DX
	   ADD DX,050H	; 0.8HZ  11B
	   CMP	AX,DX
	   JNL	 MG3
	   ADD DX,040H	; 0.8HZ  11B
	   CMP	AX,DX
	   JNL	 MG2
	   ADD DX,030H	; 0.8HZ  11B
	   CMP	AX,DX
	   JNL	 MG1
	   JMP ME

MG1:
	   ADD AX,15
	   JMP ME
MG2:
	   ADD AX,10
	   JMP ME
MG3:
	   ADD AX,3
    ME:
	  ret
  noisE  endp
  intr9:  pushf
	; sti
	; PUSH	AX
	; PUSH	bX
	; PUSH CX
	; PUSH	dX
	; push si
	; push di
	; PUSH DS

	; MOV  Ah,00H
	  ; int 21 cs:0cc5h
	; int 16h
	; mov  data[+0],al
	; LEA ax,DATA

	; mov dx,ax
	; mov ah,9
	; int 21h
	; mov al,20h
	 ;out 20h,al
	 ;POP DS
	; pop di
	; pop si
	; pop dx
	; pop Cx
	; pop bx
	; pop ax





	 ;RETf 2

       ;CMP  AL,0H
       ;JZ   RETU2
       ;MOV BX,0
       ;MOV BL,KEYINP
       ;MOV KEYBUFF[BX],AL
       ;MOV  AL,KEYINP
       ;ADD  AL,1
 gext: ;MOV KEYINP,AL
stopP:
INIT:
chktsr:
	mov  al,es:[+05Dh]
	cmp byte ptr es:[+05dh],'R'
	JNE  chk1
	mov ax,0h
	mov es,ax
	mov ax,es:[+182h]
	mov es,ax
	cmp  word ptr es:[7A2h],4A42H
	jne  uninst
	cli
	mov ax,0h
	mov es,ax
	mov ax,es:[+182h]
	mov es,ax
	mov  ax,es:[+07D5h]
	MOV  cs:old_psp,ax

	MOV  AL,00110110B
	OUT 43H,AL
	MOV AL,0H
	OUT 40H,AL
	OUT 40H,AL

	mov ax,0h
	mov es,ax
	mov ax,es:[+182h]
	mov es,ax
	mov  ax,es:[+07CBh]
	mov dx,ax
	mov  ax,es:[+07CDh]
	mov ds,ax
	mov ax,2508h
	int 21h
	mov ax,0h
	mov es,ax
	mov ax,es:[+182h]
	mov es,ax
	mov  ax,es:[+07C7h]
	mov dx,ax
	mov  ax,es:[+07C9h]
	mov ds,ax
	mov ax,2560h
	int 21h
	mov ax,0h
	mov es,ax
	mov ax,cs:old_psp
	mov es,ax
	sti
	mov ax,cs
	mov ds,ax
	mov ah,049h
	int  21h
	cmp ax,0ah
	jl   unist_f
	LEA ax,data_rmok
	mov dx,ax
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
unist_f:
	mov   data_rmf[+0],al
	LEA ax,data_rmf
	mov dx,ax
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
uninst:
       LEA ax,data_nf
       mov dx,ax
       mov ah,9
       int 21h
	mov ah,4ch
	int 21h
chk1:	mov  data[+0],al
	mov ax,0h
	mov es,ax
	mov ax,es:[+182h]
	mov es,ax
	cmp  word ptr es:[7A2h],4A42H
	je   terminate
	jmp MKTSR
terminate :  LEA ax,DATA

	     mov dx,ax
	     mov ah,9
	     int 21h
	     mov ah,4ch
	     int 21h

MKTSR:
       ;push es
       ;mov ax,3509h
       ;int 21h
       ;mov cs:off09,bx
       ;mov cs:seg09,es
       ;cli
       ;lea dx,intr9
       ;mov ax,2509h
       ;int 21h
       ;sti
       ;pop  ax
	MOV  AL,01H
	MOV DX,22BH
	OUT  DX,AL
	MOV DX,224H
	IN AL,DX
	MOV AX,0H
	CALL DOU
	CALL DOU2
	MOV AX,60h
	MOV ah,35h
	int 21h
	MOV WORD PTR old_intr60,BX
	MOV WORD PTR old_intr60+2,ES
	MOV   DX,OFFSET  MYCODE
	MOV  AL,60H
	MOV  AH,25H
	int 21h
	MOV AX,08h
	MOV ah,35h
	int 21h
	MOV WORD PTR old_intr8,BX
	MOV WORD PTR old_intr8+2,ES
	CLI
	MOV   DX,OFFSET  MYCODE
	MOV  AL,08H
	MOV  AH,25H
	int 21h
	MOV  AL,00110110B
	OUT 43H,AL
	MOV AL,0H
	OUT 40H,AL
	MOV AL,20H
	OUT 40H,AL
	STI
	MOV  ax,offset STOPP +15
	mov tsr_long,ax
	mov cs:old_psp,cs
	shr  ax,4
	MOV  dx,ax
	mov  ah,31h
	INT 21H
code   ends




 end  START





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
WANO DB   16 DUP(0)
OK1 DB	 16 DUP(0)
OK2 DB	 16 DUP(0)
OUTIME	 DW   16 DUP(0)
DON	 DW 1 dup(0)
RDTIME	  DW  16 DUP(200)
RDOK DB   16 DUP(0)
outIMEN  DW  16 DUP(0)
RDTIMEN DW 16 DUP(0)
totchanel     DW  1 DUP(8)
DLAN	 DW   16 DUP(0)
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
ZEROK	 DB  16 DUP(0)
ZER	DW  16 DUP(0)
ZERTM DW  16 DUP(200)
ACTZERTM  DW  16 DUP(0)
DON2	  DW  16 DUP(0)
DON3	  DW  16 DUP(0)
LZA	  DW  16 DUP(0)
B1	  DW  32 DUP(2048)
B2	  DW  32 DUP(2048)
B3	  DW  32 DUP(2048)
B4	  DW  32 DUP(2048)
B5	  DW  32 DUP(2048)
B6	  DW  32 DUP(2048)
B7	  DW  32 DUP(2048)
B8	  DW  32 DUP(2048)
B9	  DW  32 DUP(2048)
ANO	  DW  1 DUP(32) ;averege num
ast	  dw 1	DUP(0)
repno	  DW  1 DUP(150) ;A/D ERR.num
W1_ERR	  DW   16 DUP(0)
timer_count   db  0
timer_vector  dd ?

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
	  POP DS
	  pop di
	  pop si
	  pop dx
	  pop Cx
	  pop bx
	  POP AX
	  MOV  AX,16
	  PUSH AX
	  SUB  AX,D2[BX+SI]
	  MOV  W1_ERR[BX+SI],AX



	  pushf
	 call  cs:timer_vector
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
  rd_ok:     MOV DX,224H
	     IN AL,DX
	   MOV DX,22CH
	   MOV AL,00H
	   OUT DX,AL
	   MOV DX,225H
	   mov cx,repno
RD_A:
	   IN AL,DX
	   MOV AH,AL
	   TEST AH,10000B
	   jZ  RD_ok_A
	   loop  rd_A
	   mov ax,0FFFH
	   JmP RD_OK1
rd_ok_A:     MOV DX,224H
	   IN AL,DX
  rd_ok1:    RET
  AD  ENDP

  din	  proc		   ;DIGITAL DATA INPUT	TO AX
	  MOV DX,226H
	  IN AX,DX
	  ret
  din	 ENDP

  dou	  proc		    ;DIGITAL DATA OUTPUT   FROM   AX
	  mov  DX,022DH
	  OUT  DX,AX
	  MOV	DON,AX
	  ret
  dou	 endp
  dou2	  proc		    ;DIGITAL DATA OUTPUT   FROM   AX
	  mov  DX,02A0H
	  OUT  DX,AX
	  MOV	DON2,AX
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
	   CMP	AX,DX
	   MOV CX,DX
	   JE  ME
	   JL  ML
    MG:    ADD DX,0080H  ; 0.8HZ  11B
	   CMP	AX,DX
	   JLE	 ME
	   ADD DX,03AH	;2.5HZ 21B
	   CMP	AX,DX
	   JLE	 MG2
	   ADD DX,03EH	;3.5H  35B
	   CMP	AX,DX
	   JLE	 MG3
	   ADD CX,01H
	   MOV AX,CX
	   JMP ME
   MG3:    ADD CX,02H
	  MOV  AX,CX
	  JMP ME
    MG2:   ADD CX,04H	 ;OUT .283HN
	   MOV	AX,CX
	   JMP ME
    MG1:   MOV AX,CX
	   JMP ME
    ML:    SUB	DX,026H
	   CMP	AX,DX
	   JGE	ME
	   add dx,04h
	   MOV	AX,DX
    ME:
	  ret
  noisE  endp

stopP:
INIT:
    MOV  AL,01H
    MOV DX,22BH
    OUT  DX,AL
    MOV DX,224H
    IN AL,DX
   MOV AX,0H
   CALL  DOU
   CALL  DOU2
    MOV   DX,OFFSET  MYCODE
    MOV  AL,60H
    MOV  AH,25H
    int 21h
    MOV AX,08h
    MOV ah,35h
    int 21h
    MOV WORD PTR TIMER_VECTOR,BX
    MOV WORD PTR TIMER_VECTOR+2,ES
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
    MOV  DX,OFFSET STOPP
    INT 27H
code   ends
 end  START




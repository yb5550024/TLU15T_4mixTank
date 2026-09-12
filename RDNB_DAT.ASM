
.286c
PUBLIC	 RDNB_DATA
EXTRN  __RETNI:FAR
EXTRN  __PARNI:FAR

DGROUP	GROUP	DATASG
DATASG	SEGMENT  PUBLIC '_DATA'
M2    dw     ?
DATASG ENDS
PROG  SEGMENT  'CODE'
      ASSUME  CS:PROG,DS:DGROUP
RDNB_DATA PROC	FAR
     PUSH  BP
     MOV  BP,SP
     push DS
     push ES
     push SI
     push DI
	  MOV AX,1
	  PUSH AX
	  CALL __PARNI
	  ADD SP,2
	  MOV SI,AX
	  mov ax,0h
	  mov es,ax
	  mov ax,es:[+182h]
	  mov es,ax
	  MOV AX,0
	  MOV AL,es:[SI +0H]
  PUSH AX
   CALL  __RETNI
  ADD SP,2
   POP DI
   POP SI
   POP ES
   POP DS
   POP BP

   RET
RDNB_DATA  ENDP
PROG  ENDS
END



.286c
PUBLIC	 RD_DO2
EXTRN  __RETNI:FAR
EXTRN  __PARNI:FAR

DGROUP	GROUP	DATASG
DATASG	SEGMENT  PUBLIC '_DATA'
M2    dw     ?
DATASG ENDS
PROG  SEGMENT  'CODE'
      ASSUME  CS:PROG,DS:DGROUP
RDOK1 PROC  FAR
     PUSH  BP
     MOV  BP,SP
     push DS
     push ES
     push SI
     push DI
     push ax
	  MOV AX,1
	  PUSH AX
	  CALL __PARNI
	  ADD SP,2
	  MOV SI,AX
	  mov ax,0h
	  mov es,ax
	  mov ax,es:[+182h]
	  mov es,ax
	  MOV AL,es:[SI+1A0H]
	  MOV AH,0H
  PUSH AX
   CALL  __RETNI
  ADD SP,2
   pop ax
   POP DI
   POP SI
   POP ES
   POP DS
   POP BP

   RET
RDOK1  ENDP
PROG  ENDS
END


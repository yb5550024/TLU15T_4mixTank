
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
RD_DO2 PROC  FAR
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
	  MOV AX,es:[30CH]
	  MOV CX,SI
	  MOV BX,01
	  TEST CX,0FFFFH
	  JZ  MK2
    MK0:  ROL BX,01
	  LOOP MK0
    MK2:  AND AX,BX
	  TEST AX,0FFFFH
	  JZ  MK1
	  MOV AX,01
	  MK1:
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
RD_DO2	ENDP
PROG  ENDS
END


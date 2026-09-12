
.286c
PUBLIC	 SETZOKN
EXTRN  __RET:FAR
EXTRN  __PARNI:FAR

DGROUP	GROUP	DATASG
DATASG	SEGMENT  PUBLIC '_DATA'
M2    db     ?
DATASG ENDS
PROG  SEGMENT  'CODE'
      ASSUME  CS:PROG,DS:DGROUP
SETZOKN  PROC  FAR
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
	  MOV AX,2
	  PUSH AX
	  CALL __PARNI
	  ADD SP,2
	  push ax
	  mov ax,0h
	  mov es,ax
	  mov ax,es:[+182h]
	  mov es,ax
	  POP AX
	  MOV BYTE PTR ES:[SI+29CH],01H
   CALL  __RET
   POP DI
   POP SI
   POP ES
   POP DS
   POP BP

   RET
SETZOKN     ENDP
PROG  ENDS
END


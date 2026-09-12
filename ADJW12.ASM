
.286c
PUBLIC	ADJW12
EXTRN  __RET:FAR
EXTRN  __PARNI:FAR

DGROUP	GROUP	DATASG
DATASG	SEGMENT  PUBLIC '_DATA'
M2    db     ?
DATASG ENDS
PROG  SEGMENT  'CODE'
      ASSUME  CS:PROG,DS:DGROUP
ADJW12	PROC  FAR
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
	  ADD AX,AX
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
	  pop ax
	  ADD es:[SI+110H],AX
	  ADD es:[SI+130H],AX
   CALL  __RET
   POP DI
   POP SI
   POP ES
   POP DS
   POP BP

   RET
ADJW12	 ENDP
PROG  ENDS
END


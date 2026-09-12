
.286c
PUBLIC	 siowrite
EXTRN  __RET:FAR
EXTRN  __PARNI:FAR

DGROUP	GROUP	DATASG
DATASG	SEGMENT  PUBLIC '_DATA'
M2    db     ?
DATASG ENDS
PROG  SEGMENT  'CODE'
      ASSUME  CS:PROG,DS:DGROUP
siowrite    PROC  FAR
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
	  mov dx,ax

	  MOV AX,2
	  PUSH AX
	  CALL __PARNI
	  ADD SP,2
	  __sio_write

   CALL  __RET
   POP DI
   POP SI
   POP ES
   POP DS
   POP BP

   RET
siowrite     ENDP
PROG  ENDS
END


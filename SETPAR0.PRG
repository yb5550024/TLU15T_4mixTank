SET CURS OFF
SELE 5
GOTO 10
SETP1=PA2
GOTO 8
SETP2=PA1
SETP3=PA2
SETP4=PA3
SETP5=PA4
SETP6=PA5
SETP7=PA6
SET COLOR TO &C6 / &C1
@ 24,0 SAY "↑ <<把计э>>   Ctl-End.△挡◆□掸  Enter 块                      ↑"
SET COLOR TO  gr +/ &C1
@ 24,5	SAY "把计э"
@ 24,18 SAY "Ctl-End.△"
@ 24,32 SAY "◆□"
@ 24,46 SAY "Enter"
SET COLOR TO &C1 / &C7 +
@ 4,UPTANK[5,1]  SAY  SETP1   PICT "99"
@ 7,UPTANK[5,1]  SAY  SETP2   PICT "99"
@ 9,UPTANK[5,1]  SAY  SETP3   PICT "99"
@ 11,UPTANK[5,1]  SAY  SETP4   PICT "99"
CHRN=STR(SETP1,2)
X1=UPTANK[5,1]
XP=0
FGETNO=1
Y1=4
YY1=Y1
GETNO=1
DO WHILE   GETNO<=4
  t=0
  *CURSER2(X1,Y1,XP)
  @ y1,x1 say  chrn
  set colo to gr + * /bl
  @ y1,x1 say  substr(chrn,XP+1,1)
  set colo to &c7 + /&c1
  XX1=X1+XP
  YY1=Y1
  T1=0
  TN1=0
  DO WHILE T1<>233
    T=0
    DO WHILE T=0
      T=INKEY( )
      DO DSP2
      DO LUSTP
    ENDDO
    SET COLOR TO &C1 / &C7 +
    DO CASE
    case  T=19
      IF XP>=1
	XP=XP-1
	*CURSER0(XX1,YY1)
	*CURSER2(X1,Y1,XP)
	set colo to &c1  /&c7 +
	@ y1,x1 say  chrn
	set colo to gr + * /bl
	@ y1,x1+xp say	substr(chrn,xp+1,1)
	set colo to &c7 + /&c1
	XX1=X1+XP
	YY1=Y1
      ENDIF
    CASE  T=4
      IF GETNO=6
	LANPA=1
      ELSE
	LANPA=0
      ENDIF
      IF XP<=LANPA
	XP=XP+1
	*CURSER0(XX1,YY1)
	*CURSER2(X1,Y1,XP)
	set colo to &c1  /&c7 +
	@ y1,x1 say  chrn
	set colo to gr + * /bl
	@ y1,x1+xp say	substr(chrn,xp+1,1)
	set colo to &c7 + /&c1
	XX1=X1+XP
	YY1=Y1
      ENDIF
    CASE     (T>=48  .AND. T<=57) .OR. (T=32 .AND. XP=0)
      XP=XP+1
      IF GETNO=-1
      ELSE
	IF TN1=0 .AND. XP=1
	  TN1=1
	  CHRN="   "
	ENDIF
	IF XP<2
	  CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,2-XP)
	  @ Y1,X1  SAY CHRN
	  *CURSER0(XX1,YY1)
	  *CURSER2(X1,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,x1 say  chrn
	  set colo to gr + * /bl
	  @ y1,x1+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  XX1=X1+XP
	  YY1=Y1
	ELSE
	  CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
	  @ Y1,X1  SAY CHRN
	  XP=XP-1
	  *CURSER2(X1,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,x1 say  chrn
	  set colo to gr + * /bl
	  @ y1,x1+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  XP=1
	  XX1=X1+XP
	  YY1=Y1
	ENDIF
      ENDIF

    CASE T=13
      FGETNO=GETNO+1
      T1=233
    CASE T=5
      IF GETNO>1
	FGETNO=GETNO-1
	T1=233
      ELSE
	FGETNO=1
	T1=233
      ENDIF
    CASE T=27
      T1=233
      GETNO=8
    CASE T=23  .OR. T=2
      T1=233
      T2=0
      FGETNO=8
    CASE T=27
      T1=233
      FGETNO=8
    CASE T=24
      IF GETNO<3
	FGETNO=GETNO+1
	T1=233
      ELSE
	FGETNO=8
	T1=233
      ENDIF
    ENDCASE
  ENDDO
  DO CASE
  CASE GETNO=1
    SETP1=INT(VAL(CHRN))
    @ 4,UPTANK[5,1]   SAY SETP1     PICT "99"
  CASE GETNO=2
    SETP2=INT(VAL(CHRN))
    @ 7,UPTANK[5,1]   SAY SETP2     PICT "99"
  CASE GETNO=3
    SETP3=INT(VAL(CHRN))
    @ 9,UPTANK[5,1]   SAY SETP3     PICT "99"
  CASE GETNO=4
    SETP4=INT(VAL(CHRN))
    @ 11,UPTANK[5,1]   SAY SETP4     PICT "99"
  ENDCASE

  DO CASE
  CASE FGETNO=1
    GETNO=1
    CHRN=STR(SETP1,2)
    X1=UPTANK[5,1]
    Y1=4
    XP=0
    FGETNO=0
  CASE FGETNO=2
    GETNO=2
    CHRN=STR(SETP2,2)
    X1=UPTANK[5,1]
    Y1=7
    XP=0
    FGETNO=0
  CASE FGETNO=3
    GETNO=3
    CHRN=STR(SETP3,2)
    X1=UPTANK[5,1]
    Y1=9
    XP=0
    FGETNO=0
  CASE FGETNO=4
    GETNO=4
    CHRN=STR(SETP4,2)
    X1=UPTANK[5,1]
    Y1=11
    XP=0
    FGETNO=0
  CASE FGETNO=5
    FGETNO=0
    GETNO=5

    IF T=13
      T=23
      T2=0
    ENDIF
  ENDCASE

ENDDO
T=0
SET COLOR TO &C7 +/ &C1
@ 4,UPTANK[5,1]  SAY  SETP1   PICT "99"
@ 7,UPTANK[5,1]  SAY  SETP2   PICT "99"
@ 9,UPTANK[5,1]  SAY  SETP3   PICT "99"
@ 11,UPTANK[5,1]  SAY  SETP4   PICT "99"
SELE 5
GOTO 8
REPL PA1 WITH SETP2,PA2 WITH SETP3,PA3 WITH SETP4
GOTO 10
REPL PA2 WITH SETP1
UPTANK[1,1]=SETP2
UPTANK[2,1]=SETP3
UPTANK[3,1]=SETP4
UPTANK[4,1]=SETP1

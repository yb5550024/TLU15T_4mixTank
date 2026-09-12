Sele  5
LUDBF="2"
SET CURS OFF
GOTO TOP
XX1=6
SCRCC=1
YY1=21
@ 20,2 CLEA TO	22,77
@ 24,2 CLEA TO	24,77
SCRNO=21
Y1=SCRNO
STAR_X=2
STAR_Y=21
END_X=77
END_Y=22
     SET COLOR TO &C5 +/ &C1
 @ 20,0 SAY "∥ＮＯ. Ｐ１　 Ｐ２     Ｐ３    Ｐ４　　           Ｐ５  　Ｐ６  Ｐ７　　Ｐ８ ∥"
     SET COLOR TO &C6 / &C1
       @ 24,0 SAY "∥F1-全畫面編輯,  Esc- 恢復原值,  Ctl-End  結束   ↑上一筆   ↓ 下一筆        ∥"
     SET COLOR TO  gr +/ &C1
       @ 24,2  SAY "F1"
       @ 24,18 SAY "Esc"
       @ 24,34 SAY "Ctl-End"
       @ 24,50 SAY "↑"
       @ 24,61 SAY "↓"
 SET COLOR TO &C7 +/ &C1
 GOTO BOTT
SKIP (-1)
_DSP_PD(SCRNO,PARNO,PA1,PA2,PA3,PA4,PA5,PA6,PA7,PA8)
SKIP
T2=1
IF EOF()
GOTO BOTT
ENDIF
SCRNO=SCRNO+1
Y1=SCRNO
IF SCRNO >END_Y
SCRNO = END_Y
SCROLL(STAR_Y,STAR_X,END_Y,END_X,1)
ENDIF
DO WHILE  T2<>0
XPARNO=PARNO
XPA1 =PA1
XPA2 =PA2
XPA3 =PA3
XPA4 =PA4
XPA5 =PA5
XPA6 =PA6
XPA7 =PA7
XPA8 =PA8
 SET COLOR TO &C1 / &C7 +
_DSP_PD(SCRNO,XPARNO,XPA1,XPA2,XPA3,XPA4,XPA5,XPA6,XPA7,XPA8)
 SET COLOR TO &C7 +/ &C1
     _XTXX=_DSP_PD2(XPA1)
     CHRN=STR(XPA1,6,_XTXX)
     X1=8
     XP=0
     FGETNO=2
       Y1=SCRNO
       YY1=Y1
       GETNO=2
   DO WHILE   GETNO<=9
       t=0
       *CURSER2(X1,Y1,XP)
       set colo to &c1	/&c7 +
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
       LURECNO=RECNO()
       DO WHILE  T=0
       T=INKEY( )
       IF SCRCC=1
       DO DSP2
       ENDIF
       eNDDO

       DO CASE
	  case	T=19
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
	  CASE	T=4
		IF XP<=2
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
	  CASE	 T=45 .OR.T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
	     XP=XP+1
	     IF TN1=0 .AND. XP=1
	     TN1=1
	     CHRN="      "
	     ENDIF
	     IF XP<6
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,6-XP)
 SET COLOR TO &C1 / &C7 +
	     IF  VAL(CHRN)>=99999
	     CHRN="      "
	     ENDIF
	     @ SCRNO,X1  SAY CHRN
 SET COLOR TO &C7 +/ &C1
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
 SET COLOR TO &C1 / &C7 +
	     IF  VAL(CHRN)>=99999
	     CHRN="      "
	     ENDIF
	     @ SCRNO,X1  SAY CHRN
 SET COLOR TO &C7 +/ &C1
	     XP=XP-1
	     *CURSER2(X1,Y1,XP)
	     set colo to &c1  /&c7 +
	     @ y1,x1 say  chrn
	     set colo to gr + * /bl
	     @ y1,x1+xp say  substr(chrn,xp+1,1)
	     set colo to &c7 + /&c1
	     XP=5
	     XX1=X1+XP
	     YY1=Y1
	     ENDIF
	  CASE T=13
	     FGETNO=GETNO+1
	       T1=233
	  CASE T=5
		IF GETNO>2
		FGETNO=GETNO-1
		T1=233
		ELSE
		FGETNO=10
		T1=233
		ENDIF
	  CASE T=27
	     T1=233
	     GETNO=10
	  CASE T=23
	     T1=233
	     T2=0
	    FGETNO=10
	  CASE T=27
	  T1=233
	  CASE T=24
	    T1=233
	    FGETNO=10
	  case T=3 .AND. SCRCC=0
	       T1=233
	    FGETNO=10
	  case T=18 .AND. SCRCC=0
	       T1=233
	    FGETNO=10
	  CASE T=28
	    IF SCRCC=1
	      SAVE SCREE TO SCRRA1
	      @ 1,0 CLEA TO 22,79
	      SET COLOR TO &C5 +/ &C1
	      @  0,0 SAY "　ＮＯ. Ｐ１　 Ｐ２     Ｐ３    Ｐ４　　           Ｐ５  　Ｐ６  Ｐ７　　Ｐ８ 　"
	      SET COLOR TO &C7 +/ &C1
	      SCRNOA=RECNO()
	      SCRNOb=1
	      SCRNO=1
	      skip -20
	      DO WHILE	.NOT. EOF()  .AND. SCRNO <=22
		_DSP_PD(SCRNO,PARNO,PA1,PA2,PA3,PA4,PA5,PA6,PA7,PA8)
		if RECNO()=SCRNOA
		  SCRNOB=SCRNO
		endif
		SKIP
		SCRNO=SCRNO+1
	      ENDDO
	      SCRNO=SCRNOA
	      GOTO SCRNO
	      SCRNO=SCRNOB
	      Y1=SCRNOB
	      SET COLOR TO &C1 / &C7 +
	      _DSP_PD(SCRNO,XPARNO,XPA1,XPA2,XPA3,XPA4,XPA5,XPA6,XPA7,XPA8)
	      SET COLOR TO &C6 / &C1
	      @ 24,0 SAY "∥<<參數>> F1-全畫面編輯 Esc-恢復原值 Ctl-End 結束  ↑↓ 上下一筆 Page-Up Down∥"
	      SET COLOR TO  gr +/ &C1
	      @ 24,4  SAY "參數"
	      @ 24,11 SAY "F1"
	      @ 24,25 SAY "Esc"
	      @ 24,38 SAY "Ctl-End"
	      @ 24,52 SAY "↑↓"
	      @ 24,66 SAY "Page-Up Down"
	      SET COLOR TO &C7 +/ &C1
	      SCRCC=0
	      STAR_X=2
	      STAR_Y=1
	      END_X=77
	      END_Y=22	&&
	      T1=233
	      GETNO=10
	    ELSE
	      SCRCC=1
	      SCRNO=21
	      Y1=SCRNO
	      STAR_X=2
	      STAR_Y=21
	      END_X=77
	      END_Y=22
	      REST SCRE FROM SCRRA1
	      SET COLOR TO &C6 / &C1
	      @ 22,0 SAY "∥                                                                            ∥"
	      @ 24,0 SAY "∥<<參數>> F1-全畫面編輯 Esc-恢復原值 Ctl-End 結束  ↑↓ 上下一筆 Page-Up Down∥"
	      SET COLOR TO  gr +/ &C1
	      @ 24,4  SAY "參數"
	      @ 24,11 SAY "F1"
	      @ 24,25 SAY "Esc"
	      @ 24,38 SAY "Ctl-End"
	      @ 24,52 SAY "↑↓"
	      @ 24,66 SAY "Page-Up Down"
	      SET COLOR TO &C7 +/ &C1
	      SCRNO=21
	      Y1=SCRNO
	      SET COLOR TO &C1 / &C7 +
	      _DSP_PD(SCRNO,XPARNO,XPA1,XPA2,XPA3,XPA4,XPA5,XPA6,XPA7,XPA8)
	      SET COLOR TO &C7 +/ &C1
	      T1=233
	      GETNO=10
	    ENDIF
	  ENDCASE
	ENDDO
	SET COLOR TO &C1 / &C7 +
	DO CASE
	CASE GETNO=1
	  XPARNO=INT(VAL(CHRN))
	  @ SCRNO,2   SAY XPARNO    PICT "99"
	CASE GETNO=2
	  SET DECI TO 1
	  XPA1= VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA1)
	  @ SCRNO,8   SAY XPA1	    PICT "&_XTPE"
	CASE GETNO=3
	  SET DECI TO 1
	  XPA2= VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA2)
	  @ SCRNO,16  SAY XPA2	    PICT "&_XTPE"
	CASE GETNO=4
	  SET DECI TO 1
	  XPA3 = VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA3)
	  @ SCRNO,24  SAY XPA3	    PICT "&_XTPE"
	CASE GETNO=5
	  SET DECI TO 1
	  XPA4 = VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA4)
	  @ SCRNO,32  SAY XPA4	    PICT "&_XTPE"
	CASE GETNO=6
	  SET DECI TO 1
	  XPA5= VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA5)
	  @ SCRNO,50  SAY XPA5	    PICT "&_XTPE"
	CASE GETNO=7
	  SET DECI TO 1
	  XPA6 = VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA6)
	  @ SCRNO,58  SAY XPA6	    PICT "&_XTPE"
	CASE GETNO=8
	  SET DECI TO 1
	  XPA7 = VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA7)
	  @ SCRNO,66  SAY XPA7	    PICT "&_XTPE"
	CASE GETNO=9
	  SET DECI TO 1
	  XPA8= VAL(CHRN)
	  _XTPE=_DSP_PD1(XPA8)
	  @ SCRNO,74  SAY XPA8	    PICT "&_XTPE"
	ENDCASE
	SET COLOR TO &C7 +/ &C1
	DO CASE
	CASE FGETNO=1
	  CHRN=STR(XPARNO,2)
	    X1=2
	    XP=0
	    FGETNO=0
	    GETNO=1
	  CASE FGETNO=2
	    GETNO=2
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA1)
	    CHRN=STR(XPA1,6,_XTXX)
	    X1=8
	    XP=0
	    FGETNO=0
	  CASE FGETNO=3
	    GETNO=3
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA2)
	    CHRN=STR(XPA2,6,_XTXX)
	    X1=16
	    XP=0
	    FGETNO=0
	  CASE FGETNO=4
	    GETNO=4
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA3)
	    CHRN=STR(XPA3,6,_XTXX)
	    X1=24
	    XP=0
	    FGETNO=0
	  CASE FGETNO=5
	    GETNO=5
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA4)
	    CHRN=STR(XPA4,6,_XTXX)
	    X1=32
	    XP=0
	    FGETNO=0
	  CASE FGETNO=6
	    GETNO=6
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA5)
	    CHRN=STR(XPA5,6,_XTXX)
	    X1=50
	    XP=0
	    FGETNO=0
	  CASE FGETNO=7
	    GETNO=7
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA6)
	    CHRN=STR(XPA6,6,_XTXX)
	    X1=58
	    XP=0
	    FGETNO=0
	  CASE FGETNO=8
	    GETNO=8
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA7)
	    CHRN=STR(XPA7,6,_XTXX)
	    X1=66
	    XP=0
	    FGETNO=0
	  CASE FGETNO=9
	    GETNO=9
	    SET DECI TO 1
	    _XTXX=_DSP_PD2(XPA8)
	    CHRN=STR(XPA8,6,_XTXX)
	    X1=74
	    XP=0
	    FGETNO=0
	  CASE FGETNO=10
	    REPL  PA1 WITH XPA1 ,PA2  WITH XPA2 ,PA3 WITH XPA3,PA4 WITH XPA4,PA5 WITH XPA5,PA6	WITH XPA6,PA7 WITH XPA7,PA8 WITH XPA8
	    FGETNO=0
	    GETNO=10
	    _DSP_PD(SCRNO,PARNO,PA1,PA2,PA3,PA4,PA5,PA6,PA7,PA8)
	  ENDCASE
	ENDDO
	DO CASE
	CASE  T=13 .OR. T=24
	  XP=0
	  SKIP
	  IF EOF()
	    GOTO BOTT
	  ELSE
	    SCRNO=SCRNO+1
	    Y1=SCRNO
	    IF SCRNO >END_Y
	      SCRNO = END_Y
	      SCROLL(STAR_Y,STAR_X,END_Y,END_X,1)
	    ENDIF
	  ENDIF
	CASE T=3 .AND. SCRCC=0
	  SKPN=15
	  DO WHILE  .NOT. EOF() .AND. SKPN>0
	    SKIP
	    SKPN=SKPN-1
	    XP=0
	    IF	.NOT. EOF()
	      SCRNO=SCRNO+1
	      Y1=SCRNO
	      IF SCRNO>END_Y
		SCROLL(STAR_Y,STAR_X,END_Y,END_X,1)
		SCRNO=END_Y
		Y1=SCRNO
	      ENDIF
	    ELSE
	      GOTO BOTT
	    ENDIF
	    _DSP_PD(SCRNO,PARNO,PA1,PA2,PA3,PA4,PA5,PA6,PA7,PA8)
	  ENDDO
	CASE T=5
	  SKIP (-1)
	  XP=0
	  IF  .NOT. BOF()
	    SCRNO=SCRNO-1
	    Y1=SCRNO
	    IF SCRNO<STAR_Y
	      SCROLL(STAR_Y,STAR_X,END_Y,END_X,-1)
	      SCRNO=STAR_Y
	      Y1=SCRNO
	    ENDIF
	  ENDIF
	CASE T=18 .AND. SCRCC=0
	  SKPN=20
	  DO WHILE  .NOT. BOF() .AND. SKPN>0
	    SKIP (-1)
	    SKPN=SKPN-1
	    XP=0
	    IF	.NOT. BOF()
	      SCRNO=SCRNO-1
	      Y1=SCRNO
	      IF SCRNO<STAR_Y
		SCROLL(STAR_Y,STAR_X,END_Y,END_X,-1)
		SCRNO=STAR_Y
		Y1=SCRNO
	      ENDIF
	    ENDIF
	    _DSP_PD(SCRNO,PARNO,PA1,PA2,PA3,PA4,PA5,PA6,PA7,PA8)
	  ENDDO
	CASE T=23
	  T=0
	  RETU
	ENDCASE
	_DSP_PD(SCRNO,PARNO,PA1,PA2,PA3,PA4,PA5,PA6,PA7,PA8)
      ENDDO
      T=0
&&-----------------------------------------------------------------------------
FUNCTION _DSP_PD
PARAMETERS  _XSCNO,_DATAX0,_DATAX1,_DATAX2,_DATAX3,_DATAX4,_DATAX5,_DATAX6,_DATAX7,_DATAX8
_XTPE="9999.9"
@ _XSCNO,2   SAY _DATAX0    PICT "99"
_XTPE=_DSP_PD1(_DATAX1)
@ _XSCNO,8   SAY _DATAX1      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX2)
@ _XSCNO,16  SAY _DATAX2      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX3)
@ _XSCNO,24  SAY _DATAX3      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX4)
@ _XSCNO,32  SAY _DATAX4      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX5)
@ _XSCNO,50  SAY _DATAX5      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX6)
@ _XSCNO,58  SAY _DATAX6      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX7)
@ _XSCNO,66  SAY _DATAX7      PICT "&_XTPE"
_XTPE=_DSP_PD1(_DATAX8)
@ _XSCNO,74  SAY _DATAX8      PICT "&_XTPE"
RETU
&&-----------------------------------------------------------------------------
FUNCTION   _DSP_PD1
PARAMETERS  _XTN
_XTPEX="9999.9"
IF  _XTN >9999.9
  _XTPEX="999999"
ENDIF
RETU  _XTPEX
&&-----------------------------------------------------------------------------
FUNCTION   _DSP_PD2
PARAMETERS  _XTN
_XTN1=1
IF  _XTN >9999.9
  _XTN1=0
ENDIF
RETU  _XTN1

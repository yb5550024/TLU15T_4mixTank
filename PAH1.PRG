
#INCLUDE "T15_COM.H"
SELE 3
public	XSCANO, XCARNO ,XRATNO,XVUSE,XCALW_REP,CHRN,XTANDO,XPOSITION
set cons on
SET DELE OFF
RECALL	 ALL
DO WHILE .NOT. EOF()
  IF SCANO=0 .OR. VUSE=0
    DELE
  ENDIF
  SKIP
ENDDO
D_LONG=4
PACK
GOTO TOP
DELE
LUDBF="3"
pn_XX1=9
SCRCC=1
YY1=23
SCRNO=23
Y1=SCRNO
STAR_X=2
STAR_Y=21
END_X=77
END_Y=22
SET COLOR TO &C6 / &C1
@ 24,0 SAY "∥ <<出車>>           Esc-取消訂單   Ctl-End 結束 ↑上一筆  ↑↑插單  ↓下一筆∥"
SET COLOR TO  gr +/ &C1
@ 24,5	SAY "出車"
@ 24,22 SAY "Esc"
@ 24,37 SAY "Ctl-End"
@ 24,50 SAY "↑"
@ 24,60 SAY "↑↑"
@ 24,70 SAY "↓"
SET COLOR TO &C7 +/ &C1
@ SCRNO,PX_SCANO SAY ASCANO
@ SCRNO,PX_CARNO SAY ACARNO    PICT "XXXXXXXX"
@ SCRNO,PX_RATNO SAY ARATNO    PICT RATNO_PAT
@ SCRNO,PX_VUSE  SAY AVUSE     PICT "999.9"
@ SCRNO,PX_TANDO SAY ATANDO    PICT "9999"
IF WASTE=1
  @ SCRNO,72  SAY APOSITION
ELSE
  @ SCRNO,PX_REP  SAY ACALW_REP PICT "99"
ENDIF
*datatype :={"9","X","X","9","9","X"}   ini in dsp.prg
T2=1
T=0
DO WHILE  T2<>0
  *IF T=5 .OR.	T=24  .OR. T=27
  IF T=5 .OR.  T=24
    IF BOF()
      IF EMPTY(XSCANO)
	XSCANO=LAG_REPNO
      ENDIF
      IF EMPTY(XCARNO)
	XCARNO="        "
      ENDIF
      IF EMPTY(XRATNO)
	XRATNO=space(RATNO_WID)
      ENDIF
      IF EMPTY(XVUSE)
	XVUSE=0
      ENDIF
      IF EMPTY(XTANDO)
	XTANDO=0
      ENDIF
      IF EMPTY(XCALW_REP)
	XCALW_REP=1
      ENDIF
      IF XCALW_REP=0
	XCALW_REP=1
      ENDIF
    ELSE
      XSCANO= SCANO
      XCARNO= CARNO
      XRATNO= RATNO
      XVUSE= VUSE
      XTANDO=TANDO
      XCALW_REP=1
    ENDIF
  ELSE
    XSCANO=ASCANO
    XCARNO=ACARNO
    XRATNO=ARATNO
    XVUSE=AVUSE
    XTANDO=ATANDO
    XCALW_REP=ACALW_REP
  ENDIF
  XPOSITION=APOSITION
  &&SET COLOR TO &C1 / &C7 +
  SET COLOR TO &C7 +/ &C1
  @ SCRNO,PX_SCANO   SAY xSCANO
  @ SCRNO,PX_CARNO   SAY XCARNO    PICT "XXXXXXXX"
  @ SCRNO,PX_RATNO   SAY XRATNO    PICT RATNO_PAT
  @ SCRNO,PX_VUSE    SAY XVUSE	   PICT "999.9"
  @ SCRNO,PX_TANDO   SAY XTANDO    PICT "9999"
  IF WASTE=1
    @ SCRNO,72	SAY XPOSITION
  ELSE
    @ SCRNO,PX_REP  SAY XCALW_REP PICT "99"
  ENDIF
  GETNO=2
  do case
  case GETNO=1
    CHRN=SUBSTR(XSCANO,-SCANO_LEN,SCANO_LEN)
    ph_xn=PX_SCANO
  case GETNO=2
    CHRN=XCARNO
    ph_xn=PX_CARNO
  endcase
  SET COLOR TO &C7 +/ &C1
  XP=0
  FGETNO=1
  Y1=SCRNO
  YY1=Y1
  DO WHILE   GETNO<=6
    t=0
    *CURSER2(ph_xn,Y1,XP)
    set colo to &c1  /&c7 +
    @ y1,ph_xn say  chrn
    set colo to gr + * /bl
    @ y1,ph_xn say  substr(chrn,XP+1,1)
    set colo to &c7 + /&c1
    ph_XX1=ph_xn+XP
    YY1=Y1
    T1=0
    TN1=0
    DO WHILE T1<>233
      T=0
      LURECNO=RECNO()
      DO WHILE T=0
	T=INKEY( )
	DO DSP2
	DO LUSTP
      ENDDO
      do  NPAH1_DSP1
    ENDDO
    do	NPAH1_DSP2
  ENDDO
  DO CASE
  CASE	T=13
	CASE  T=24
	  XP=0
	  RECA
	  SKIP
	  IF EOF()
	    GOTO BOTT
	  ENDIF
	  DELE
	CASE T=5
	  RECA
	  SKIP (-1)
	  XP=0
	  IF  .NOT. BOF()
	    GOTO TOP
	      DELE
	    ELSE
	  ENDIF
	  *  CASE T=27
	  *    SET DELE OFF
	  *	 PACK
	  *	 XP=0
	  *	 GOTO TOP
	  *	 IF .NOT. BOF()
	  *	 DELE
	  *	 ENDIF
	  *	 T=5
	ENDCASE
	@ SCRNO,PX_SCANO   SAY ASCANO
	@ SCRNO,PX_CARNO   SAY ACARNO	 PICT "XXXXXXXX"
	@ SCRNO,PX_RATNO   SAY ARATNO	 PICT RATNO_PAT
	@ SCRNO,PX_VUSE    SAY AVUSE	 PICT "999.9"
	@ SCRNO,PX_TANDO   SAY ATANDO	 PICT "9999"
	IF  WASTE=1
	  @ SCRNO,72  SAY APOSITION
	  ACALW_REP =1
	ELSE
	  @ SCRNO,PX_REP  SAY ACALW_REP PICT "99"
	ENDIF


ENDDO
T=0
&&-----------------------------------------------------------------------------
PROCEDURE  NPAH1_DSP2
PARAMETERS  P1,P2,P3
SET COLOR TO &C7 +/ &C1
&&SET COLOR TO &C1 / &C7 +
  &&  SET COLOR TO &C1 / &C7 +
    DO CASE
    CASE GETNO=1
      XSCANO=CHRN
      @ SCRNO,PX_SCANO	SAY XSCANO
    CASE GETNO=2
      XCARNO=UPPER(CHRN)
      @ SCRNO,PX_CARNO	SAY XCARNO	PICT "XXXXXXXX"
    CASE GETNO=3
      XRATNO=ALLTRIM(UPPER(CHRN))
      XN2=LEN(XRATNO)
      IF (XN2<RATNO_WID)
	 XRATNO =XRATNO +SPACE(RATNO_WID-XN2)
      ENDIF
      @ SCRNO,PX_RATNO	SAY XRATNO    PICT   RATNO_PAT
    CASE GETNO=4
      SET DECIM TO 1
      XVUSE=VAL(CHRN)
      IF XVUSE>pcs_max
	XVUSE=0
	FGETNO=5
      ENDIF
      @ SCRNO,PX_VUSE  SAY XVUSE     PICT "999.9"
      SET DECIM TO 3
    CASE GETNO=5
      XTANDO=INT(VAL(CHRN))
      @ SCRNO,PX_TANDO	SAY XTANDO    PICT "9999"
    CASE GETNO=6
      SET DECIM TO 0
      IF WASTE=1
	XPOSITION =upper(CHRN)
	@ SCRNO,71  SAY XPOSITION
      ELSE
	XCALW_REP=VAL(CHRN)
	@ SCRNO,PX_REP	SAY XCALW_REP	  PICT "99"
      ENDIF
      SET DECIM TO 3
    ENDCASE

    SET COLOR TO &C7 +/ &C1
    DO CASE
    CASE FGETNO=1
      CHRN=SUBSTR(XSCANO,-SCANO_LEN,SCANO_LEN)
      ph_xn=PX_SCANO
      XP=0
      FGETNO=0
      GETNO=1
    CASE FGETNO=2

      GETNO=2
      CHRN=XCARNO
      ph_xn=PX_CARNO
      XP=0
      FGETNO=0
    CASE FGETNO=3
      GETNO=3
      CHRN=SUBSTR(XRATNO,1,RATNO_WID)
      ph_xn=PX_RATNO
      XP=0
      FGETNO=0
    CASE FGETNO=4
      GETNO=4
      CHRN=STR(XVUSE,5,1)
      ph_xn=PX_VUSE
      XP=0
      FGETNO=0
    CASE FGETNO=5
      GETNO=5
      CHRN=STR(XTANDO,4)
      ph_xn=PX_TANDO
      XP=0
      FGETNO=0
    CASE FGETNO=6
      GETNO=6
      IF  WASTE=1
	CHRN=XPOSITION
	ph_xn=72
      ELSE
	CHRN=STR(XCALW_REP,2,0)
	ph_xn=PX_REP
      ENDIF
      XP=0
      FGETNO=0
    CASE FGETNO=7
      ASCANO =	XSCANO
      ACARNO =	XCARNO
      ARATNO =	XRATNO
      AVUSE =	XVUSE
      ATANDO=XTANDO
      IF  WASTE=1
	 APOSITION=XPOSITION
      ELSE
	ACALW_REP=XCALW_REP
      ENDIF
      FGETNO=0
      GETNO=7
      @ SCRNO,PX_SCANO	 SAY ASCANO
      @ SCRNO,PX_CARNO	 SAY ACARNO   PICT "XXXXXXXX"
      @ SCRNO,PX_RATNO	 SAY ARATNO    PICT RATNO_PAT
      @ SCRNO,PX_VUSE	 SAY AVUSE     PICT "999.9"
      @ SCRNO,PX_TANDO	 SAY ATANDO    PICT "9999"
      F3_N=0
      F3_RUN=0
      IF  WASTE=1
	@ SCRNO,72  SAY APOSITION
      ELSE
	@ SCRNO,PX_REP	SAY ACALW_REP PICT "99"
      ENDIF
      IF T=13
	T=23
	T2=0
      ENDIF
      &&+++++++++++++++++++++++++++
      S_GET_MIX_DATA()





    ENDCASE
IF   GETNO<=6
  t=0
  set colo to &c1  /&c7 +
  @ y1,ph_xn say  chrn
  set colo to gr + * /bl
  @ y1,ph_xn say  substr(chrn,XP+1,1)
  set colo to &c7 + /&c1
  ph_XX1=ph_xn+XP
  YY1=Y1
  T1=0
  TN1=0
  T=0
ENDIF
T1=0
retu
&&-----------------------------------------------------------------------------
PROCEDURE  NPAH1_DSP1
PARAMETERS  P1,P2,P3
if t<>0
      SELE &LUDBF
      GOTO LURECNO
      DO CASE
      case  T=19
	IF XP>=1
	  XP=XP-1
	  *CURSER0(XX1,YY1)
	  *CURSER2(ph_xn,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,ph_xn say  chrn
	  set colo to gr + * /bl
	  @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  ph_XX1=ph_xn+XP
	  YY1=Y1
	ENDIF
      CASE  T=4
	d_long=len(chrn)
	*IF GETNO=2
	*  LANPA=5
	*ELSE
	*  IF GETNO=1
	*    LANPA=3
	*  ELSE
	*    LANPA=2
	*  ENDIF
	*ENDIF
	IF XP<=D_LONG-2
	  XP=XP+1
	  *CURSER0(XX1,YY1)
	  *CURSER2(ph_xn,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,ph_xn say  chrn
	  set colo to gr + * /bl
	  @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  ph_XX1=ph_xn+XP
	  YY1=Y1
	ENDIF
      CASE   (t>=45  .and. T<=90 )  .OR. (T=32 )  .OR. (T>=97  .AND. T<=122 .AND. datatype[GETNO]="X")
	XP=XP+1
	d_long=len(chrn)
	IF TN1=0 .AND. XP=1
	  TN1=1
	  *CHRN="       "
	  CHRN=space(d_long)
	ENDIF
	IF XP<D_LONG
	  CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,D_LONG-XP)
	  SET COLOR TO &C1 / &C7 +
	  @ SCRNO,ph_xn  SAY CHRN
	  SET COLOR TO &C7 +/ &C1
	  *CURSER0(XX1,YY1)
	  *CURSER2(ph_xn,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,ph_xn say  chrn
	  set colo to gr + * /bl
	  @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  ph_XX1=ph_xn+XP
	  YY1=Y1
	ELSE
	  CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
	  SET COLOR TO 0/7
	  SET COLOR TO &C1 / &C7 +
	  @ SCRNO,ph_xn  SAY CHRN
	  SET COLOR TO &C7 +/ &C1
	  *CURSER2(ph_xn,Y1,XP)
	  XP=d_long -1
	  ph_XX1=ph_xn+XP
	  set colo to &c1  /&c7 +
	  @ y1,ph_xn say  chrn
	  set colo to gr + * /bl
	  @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  YY1=Y1
	ENDIF
      CASE   T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
	XP=XP+1
	d_long=len(chrn)
	IF TN1=0 .AND. XP=1
	  TN1=1
	  CHRN=space(d_long)
	  IF GETNO=6
	    IF WASTE <>1
	      CHRN="1 "
	    ENDIF
	  ENDIF
	ENDIF
	*IF GETNO=6
	*  IF WASTE <>1
	*    D_LONG=2
	*   ENDIF
	*ELSE
	*  D_LONG=4
	*ENDIF
	*d_long=len(chrn)
	IF XP<D_LONG
	  CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,D_LONG-XP)
	  SET COLOR TO &C1 / &C7 +
	  @ SCRNO,ph_xn  SAY CHRN
	  SET COLOR TO &C7 +/ &C1
	  *CURSER0(XX1,YY1)
	  *CURSER2(ph_xn,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,ph_xn say  chrn
	  set colo to gr + * /bl
	  @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  ph_XX1=ph_xn+XP
	  YY1=Y1
	ELSE
	  CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
	  SET COLOR TO &C1 / &C7 +
	  @ SCRNO,ph_xn  SAY CHRN
	  SET COLOR TO &C7 +/ &C1
	  XP=XP-1
	  *CURSER2(ph_xn,Y1,XP)
	  set colo to &c1  /&c7 +
	  @ y1,ph_xn say  chrn
	  set colo to gr + * /bl
	  @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	  set colo to &c7 + /&c1
	  XP=3
	  ph_XX1=ph_xn+XP
	  YY1=Y1
	  if getno=6
	    IF WASTE <>1
	      XP=1
	    ENDIF
	  endif
	ENDIF
      CASE T=13
	FGETNO=GETNO+1
	T1=233
      CASE T=5
	IF GETNO>1
	  FGETNO=GETNO-1
	  T1=233
	ELSE
	  FGETNO=7
	  T1=233
	ENDIF
      CASE T=27
	t=0
	SCRMA=savescreen(15,0,22,39)
	@ 15,11 clea to  22,39
	@ 15,13  say "   << 按任一鍵繼續 >>"
	@ 16,13  say "1. " +  LAGcno1
	@ 17,13  say "2. " +  LAGcno2
	@ 18,13  say "3. " +  LAGcno3
	@ 19,13  say "4. " +  LAGcno4
	@ 20,13  say "5. " +  LAGcno5
	DO WHILE T=0
	  T=INKEY( )
	  DO DSP2
	  DO LUSTP
	ENDDO
	t=0
	restscreen(15,0,22,39,scrma)
	*    T1=233
	*    GETNO=6
      CASE T=23
	T1=233
	T2=0
	FGETNO=7
      CASE T=24
	T1=233
	FGETNO=7
      ENDCASE
endif
retu
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
PROCEDURE  h_NPAH1_DSP1
PARAMETERS  P1,P2,P3
retu

#INCLUDE "alu16.h"
#INCLUDE "T15_COM.H"

if  F3_N=1
  IF  T=0
    T=INKEY()
  ENDIF
  IF T <>0
    SELE &LUDBF
    GOTO LURECNO
    IF (GETNO <=1)  .AND. ((T=5) .OR. (T=24) )
      DO CASE
      CASE   T=24
	XP=0
	RECA
	SKIP
	IF EOF()
	  GOTO BOTT
	ENDIF
	DELE
      CASE   T=5
	RECA
	SKIP (-1)
	XP=0
	IF  .NOT. BOF()
	  GOTO TOP
	  DELE
	ENDIF
      ENDCASE
      IF BOF()
	XSCANO=space(SCANO_LEN)
	XCARNO="        "
	XRATNO=space(RATNO_WID)
	XVUSE=0
	XTANDO=0
	XCALW_REP=1
      ELSE
	XSCANO= SCANO
	XCARNO= CARNO
	XRATNO= RATNO
	XVUSE= VUSE
	XTANDO=TANDO
	XCALW_REP=ACALW_REP
      ENDIF
      SET COLOR TO &C1 / &C7 +
      NPAH1_DSP0(SCRNO,XSCANO,XCARNO,XRATNO,XVUSE,XTANDO,XCALW_REP)
      SET COLOR TO &C7 +/ &C1
      CHRN=subSTR(XSCANO,-SCANO_LEN,SCANO_LEN)
      ph_xn=9
      XP=0
      FGETNO=1
      Y1=SCRNO
      YY1=Y1
      GETNO=1
    ELSE
      DO NPAH1_DSP1
      IF T1=233
      DO NPAH1_DSP2
      ENDIF
    ENDIF
      *SCRMA=savescreen(15,0,22,39)
      *@ 15,11 clea to	22,39
      *@ 15,13	say "   << «ö¥ô¤@ÁäÄ~Äò >>"
      *@ 16,13	say "1. " +  LAGcno1
      *@ 17,13	say "2. " +  LAGcno2
      *@ 18,13	say "3. " +  LAGcno3
      *@ 19,13	say "4. " +  LAGcno4
      *@ 20,13	say "5. " +  LAGcno5
    LURECNO=RECNO()
    T=0
  ENDIF
ENDIF
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
PROCEDURE  NPAH1_DSP3
PARAMETERS  P1,P2,P3
  DO CASE
  CASE	T=13
    XP=0
  CASE	T=24
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
    IF	.NOT. BOF()
      GOTO TOP
      DELE
    ENDIF
  ENDCASE
  @ SCRNO,PX_SCANO  SAY ASCANO
  @ SCRNO,PX_CARNO  SAY ACARNO	  PICT "XXXXXXXX"
  @ SCRNO,PX_RATNO  SAY ARATNO
  @ SCRNO,PX_VUSE   SAY AVUSE	  PICT "999.9"
  @ SCRNO,PX_TANDO  SAY ATANDO	  PICT "9999"
  IF  WASTE=1
    @ SCRNO,72	SAY  APOSITION
  ELSE
    @ SCRNO,PX_REP  SAY ACALW_REP    PICT "9999"
  ENDIF
T=0
retu
&&-----------------------------------------------------------------------------
FUNCTION  NPAH1_DSP0
PARAMETERS  Y,D1,D2,D3,D4,D5,D6
XCOR=SETCOLOR()
SET COLOR TO &C7 +/ &C1
@ Y,PX_SCANO   SAY D1
@ Y,PX_CARNO   SAY D2  PICT "XXXXXXXX"
@ Y,PX_RATNO   SAY D3
@ Y,PX_VUSE    SAY D4  PICT "999.9"
@ Y,PX_TANDO  SAY D5  PICT "9999"
IF WASTE=1
  @ Y,72  SAY XPOSITION
ELSE
@ Y,PX_REP  SAY D6  PICT "99"
ENDIF
SET COLO TO &XCOR
RETU

&&-----------------------------------------------------------------------------

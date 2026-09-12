
DSP_SCALL=1
C11="B"
C12="W+"
C13="R+"
C14="W+"
C15="R"
C15="GR+"
C17="W+"
IF T=-2
  PAHPRO=0
ELSE
  PAHPRO=1
ENDIF
SELE 3
PACK
SET RELA TO US2 INTO DBF15
US2_1="        "
SET COLO TO &C7 +/ &C1
LUDBF="3"
SET CURS OFF
TNSTP=0
GOTO TOP
XX1=2
SCRCC=1
YY1=21
@ 20,2 CLEA TO	22,77
@ 24,2 CLEA TO	24,77
SCRNO=21
_A_DSPX :={7,7,7,30,30,30,48,48,48,48,73,72,53,0}
_A_DSPY :={20,21,22,20,21,22,20,22,22,21,20,21,20}
SET COLOR TO &C6 / &C1
@ 19,0 SAY   "╔══════════════════════════════════════╗"
*@ 20,0 SAY   "║NO. 車  號   駕駛   配比 米數 坍度 客戶代號 客戶名稱 地點代號  車次 累計米數║"
@ 20,37  SAY _F3TXT_A[1]
@ 20,46  SAY _F3TXT_A[2]
@ 20,55  SAY _F3TXT_A[3]
*@ 21,0 SAY   "║                                                                            ║"
*@ 22,0 SAY   "║                 送貨地點:                                                  ║"

*@ 20,0 SAY   "║NO. 車  號   駕駛   配比 米數 坍度 客戶代號 客戶名稱 地點代號  車次 累計米數║"
@ 20,0 SAY   "║ NO.:                  米數:         工    地:                   車次:      ║"
@ 21,0 SAY   "║車號:               坍   度:         強    度:               累計米數:      ║"
@ 22,0 SAY   "║配比:              客戶代號:         客戶名稱:                              ║"

*@ 22,19  SAY ALLTRIM(_F3TXT_A[4])
IF LU_COUNT=1
  @ 22,4   SAY	"單價:"
ENDIF
@ 23,0 SAY   "╚══════════════════════════════════════╝"
IF  STAR=1
  @ 24,0 SAY   "∥<<排程輸入>> F1-資料查詢    Esc-結束     ,  Ctl-End 結束 ↑上一筆 ↓ 下一筆 ∥"
ELSE
  @ 24,0 SAY   "∥<<排程輸入>> F1-資料查詢    F7-報表列印  ,  Ctl-End 結束 ↑上一筆 ↓ 下一筆 ∥"
ENDIF
SET COLOR TO  gr +/ &C1
@ 24,4	SAY "排程輸入"
@ 24,15 SAY "F1"
IF  STAR=1
  @ 24,30 SAY "Esc"
ELSE
  @ 24,30 SAY "F7"
ENDIF
@ 24,46 SAY "Ctl-End"
@ 24,59 SAY "↑"
@ 24,68 SAY "↓"
SET COLOR TO &C7 +/ &C1
SELE 3
IF  PAHPRO=1
  GOTO BOTT
  IF  .NOT.  EOF()  .AND. VUSE <>0
    @ _A_DSPY[1],_A_DSPX[1]    SAY SCANO   &&C14
    @ _A_DSPY[2],_A_DSPX[2]    SAY CARNO   &&C7
    @ _A_DSPY[3],_A_DSPX[3]    SAY RATNO   &&C9
    @ _A_DSPY[4],_A_DSPX[4]    SAY VUSE     PICT "999.9"
    @ _A_DSPY[5],_A_DSPX[5]    SAY TANDO    PICT "9999"
    @ _A_DSPY[6],_A_DSPX[6]    SAY US2	    &&C8
    @ _A_DSPY[7],_A_DSPX[7]  SAY  P1701
    @ _A_DSPY[9],_A_DSPX[9]    SAY SUBSTR(US2_2,1,24)
    @ _A_DSPY[10],_A_DSPX[10]	 SAY S_STRO
    * @ _A_DSPY[3],_A_DSPX[3]	 SAY CARDRV
     @ _A_DSPY[11],_A_DSPX[11]	  SAY TOT_CAR	   PICT "99999"
    @ _A_DSPY[12],_A_DSPX[12]	 SAY US3      PICT "9999.9"
    @ _A_DSPY[9],_A_DSPX[9]    SAY alltrim(US2_2)
    IF	LU_COUNT=1
      @    22,_A_DSPX[13]    SAY U_PRICE PICT "99999"
    ENDIF
    SKIP
    SCRNO=SCRNO
  ENDIF
  XSCANO=SPACE(17)
  XCARNO=SPACE(8)
  XCARDRV =SPACE(8)
  XCARW =0
  XRATNO =space(RATNO_WID)
  XVUSE  =0
  XTANDO =0
  XUS2=SPACE(8)
  XUS3=0
  XTOT_CAR=0
  XUS2_1=SPACE(24)
  xus2_2=space(24)
  XADDR_NO=SPACE(4)
  XU_PRICE=0
  XSTRO =space(10)
  IF  EOF()
    APPE BLAN
  ENDIF
ELSE
  XSCANO  =ASCANO
  XCARNO  =ACARNO
  XCARDRV =ACARDRV

  XCARW =ACARW
  XRATNO  =ARATNO
  XVUSE   =AVUSE
  XTANDO  =ATANDO
  XUS2	  =  AUS2
  XUS2_1  =  FSUBSTR(AUS2_1,12," ",0)
  && XADDR_NO=FSUBSTR(APOSITION,4," ",0)
  *XADDR_NO=FSUBSTR(P1701,4," ",0)
  XADDR_NO=A_ADDR_NO
  *XUS2_2  =  FSUBSTR(AUS2_2,50," ",0)
  XUS2_2  =  AUS2_2
  XUS3	  =  AUS3
  XU_PRICE=AU_PRICE
  XTOT_CAR=ATOT_CAR
  XSTRO=ASTRO
  SCRNO=21

ENDIF
TLP=1
DO WHILE  TLP=1
  TLP_1=2
  DO  WHILE  TLP_1 >= 1
    SET COLOR TO &C7 +/ &C1
    @ _A_DSPY[1],_A_DSPX[1]    SAY XSCANO
    @ _A_DSPY[2],_A_DSPX[2]    SAY XCARNO
    @ _A_DSPY[3],_A_DSPX[3]    SAY XRATNO
    @ _A_DSPY[4],_A_DSPX[4]    SAY XVUSE     PICT "999.9"
    @ _A_DSPY[5],_A_DSPX[5]    SAY XTANDO    PICT "9999"
    @ _A_DSPY[6],_A_DSPX[6]    SAY XUS2
    @ _A_DSPY[7],_A_DSPX[7]  SAY  XADDR_NO
    @ _A_DSPY[13],_A_DSPX[13]  SAY  SUBSTR(XUS2_2,1,12)
    @ _A_DSPY[9],_A_DSPX[9]    SAY SUBSTR(XUS2_1,1,24)
    @ _A_DSPY[10],_A_DSPX[10]	 SAY XSTRO
    @ _A_DSPY[11],_A_DSPX[11]	 SAY XTOT_CAR	PICT "99999"
    @ _A_DSPY[12],_A_DSPX[12]	 SAY XUS3  PICT "9999.9"
    IF	LU_COUNT=1
      @    22,_A_DSPX[13]    SAY XU_PRICE PICT "99999"
    ENDIF
    SELE 3
    DO CASE
    CASE TLP_1=1
      PGM=" "
      NREAD(_A_DSPY[1],_A_DSPX[TLP_1] ,SUBSTR(XSCANO,1,17),9,pgm)
      XSCANO  =FSUBSTR(XPX,9,"0",0)
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]	SAY XSCANO
    CASE TLP_1=2
      PGM="FIND_1201"
      NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,SUBSTR(XCARNO,1,7),7,PGM)
      XCARNO  =SUBSTR(ALLTRIM(UPPER(XPX))+SPACE(7),1,7)
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  SAY  XCARNO
      xcarno=alltrim(xcarno)
      x_det=0

      x_recno=fseek_C(10,"P12100",XCARNO,"p12100",@X_DET)
      if x_recno >=0
	sele 10
	XCARNO =p12101
	XCARDRV=P12102
	XCARW=P12103
      endif
      XCARNO=FSUBSTR(XCARNO,8," ")
      SET COLOR TO &C7 +/ &C1
    CASE TLP_1=3
      xd_wno=fSelectNo()
      && PGM=" "
      PGM="FIND_RATNO"
      NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],substr(XRATNO,1,RATNO_WID),RATNO_WID,PGM)
      XRATNO   =substr(alltrim(upper(XPX))+SPACE(RATNO_WID),1,RATNO_WID)
      SELE 2
      XSTRO=space(10)
      LOCA  FOR alltrim(RATNO)==alltrim(XRATNO)
      IF EOF()=.F.
	XSTRO=S_STRO
      ENDIF
      sele &xd_wno
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  SAY XRATNO
      @ _A_DSPY[10],_A_DSPX[10]    SAY XSTRO
    CASE TLP_1=4
      PGM=" "
      NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],STR(XVUSE,5,1),4,PGM)
      XVUSE  =VAL(XPX)
      if  xvuse >= 999
	xvuse=0
      endif
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  SAY XVUSE     PICT "999.9"
    CASE TLP_1=5
      PGM=" "
      NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],STR(XTANDO,4,0),4,PGM)
      XTANDO  =VAL(XPX)
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  SAY XTANDO    PICT "9999"
    CASE TLP_1=6
      PGM="FIND_1103"
      NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],SUBSTR(XUS2,1,8),8,PGM)
      XUS2   =SUBSTR(ALLTRIM(UPPER(XPX))+SPACE(9),1,8)
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  SAY XUS2
      IF  XUS2="    "
	XUS2_1=SPACE(24)
	*XUS2_2=SPACE(20)
      ENDIF
      SELE 11
      LOCA FOR alltrim(P1501)==alltrim(XUS2)
      IF EOF()=.F.
      XUS2_1=P1502
      ENDIF
      @ _A_DSPY[TLP_1],_A_DSPX[7]  SAY XUS2
      @ _A_DSPY[8],_A_DSPX[8]  SAY SUBSTR(XUS2_1,1,24)
      @ _A_DSPY[11],_A_DSPX[11]  SAY XTOT_CAR	  PICT "99999"
      @ _A_DSPY[12],_A_DSPX[12]  SAY XUS3      PICT "9999.9"
      *@ SCRNO,_A_DSPX[11]  SAY SUBSTR(XUS2_2,1,8)
      SELE 3
    *CASE TLP_1=8
    *  PGM=" "
    *  NREAD(SCRNO,_A_DSPX[TLP_1],SUBSTR(XUS2_1,1,8),8,PGM)
    *  if substr(xus2_1,1,8)  <> chrn
    *	 xus2_1=chrn
    *  ENDIF
    *  SET COLOR TO &C7 +/ &C1
    *  @ SCRNO,_A_DSPX[TLP_1]  SAY SUBSTR(XUS2_1,1,8)
    CASE TLP_1=7
      PGM="FIND_ADD_"
      NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],SUBSTR(XADDR_NO,1,4),4,PGM)
      CHRN=FSUBSTR(UPPER(CHRN),4," ",0)
      if xADDR_NO   <> chrn
	xADDR_NO=chrn
	SELE 13
	LOCA FOR alltrim(P1701) ==alltrim(XADDR_NO)
	XUS2_2=P1702
	XU_PRICE=U_PRICE
      ENDIF
      XADDR_NO=FSUBSTR(XADDR_NO,4," ",0)
      @ _A_DSPY[7],_A_DSPX[7]  SAY  XADDR_NO
      if (empty(xus2)=.f.)  .AND. (XVUSE>0)
	_XUS3=0
	_LAG_LAG=0
	_LAG_CAR=0
	IS_SEEK=fseek_2C(14,"LAG_NA_NO",alltrim(xus2),"LAG_ADDR_NO",alltrim(XADDR_NO),"LAG_LAG","LAG_CAR",@_LAG_LAG,@_LAG_CAR)
	XUS3=xvuse
	XTOT_CAR=1
	IF IS_SEEK >0
	  XUS3=XUS3 +_LAG_LAG
	  XTOT_CAR=XTOT_CAR + _LAG_CAR
	ENDIF
	@ _A_DSPY[11],_A_DSPX[11]  SAY XTOT_CAR      PICT "99999"
	@ _A_DSPY[12],_A_DSPX[12]  SAY XUS3	 PICT "9999.9"
      endIf
      SET COLOR TO &C7 +/ &C1
    CASE TLP_1=8
      PGM=" "
      NREAD(_A_DSPY[11],_A_DSPX[11],STR(XTOT_CAR,5,0),6,PGM)
      IF   XTOT_CAR <> VAL(XPX)
	SELE 11
	LOCA FOR alltrim(P1501)==alltrim(XUS2)
	IF .NOT. EOF()
	  REPL TOT_CAR WITH  VAL(XPX)
	ENDIF
      ENDIF
      XTOT_CAR	=VAL(XPX)
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[11],_A_DSPX[11]  SAY XTOT_CAR	   PICT "99999"
    CASE TLP_1=9
      PGM=" "
      NREAD(_A_DSPY[12],_A_DSPX[12],STR(XUS3,6,1),6,PGM)
      XUS3  =VAL(XPX)
      *IF   XUS3 <> VAL(XPX)
	SELE 14
	if (empty(xus2)=.f.)  .AND. (XVUSE>0)
	  _XUS3=0
	  _LAG_LAG=0
	  _LAG_CAR=0
	  IS_SEEK=fseek_2C(14,"LAG_NA_NO",alltrim(xus2),"LAG_ADDR_NO",alltrim(XADDR_NO),"LAG_LAG","LAG_CAR",@_LAG_LAG,@_LAG_CAR)
	  LOCA FOR (alltrim(LAG_NA_NO)==alltrim(XUS2))	.AND. (alltrim(LAG_ADDR_NO)==alltrim(XADDR_NO))
	  *IF EOF() .AND. XUS2 <> "    "
	  IF IS_SEEK <0
	    APPE  BLANK
	    *REPL LAG_NA_NO WITH XUS2,LAG_NAME WITH XUS2_1,LAG_ADDR_NO WITH XADDR_NO,LAG_ADDR WITH XUS2_2
	    REPL LAG_DATE WITH DATE()
	    REPL LAG_NA_NO WITH XUS2,LAG_NAME WITH XUS2_1,LAG_ADDR_NO WITH XADDR_NO,LAG_ADDR WITH XUS2_2
	  ENDIF
	  *REPL LAG_DATE WITH DATE(),LAG_LAG WITH XUS3,LAG_CAR WITH XTOT_CAR
	ENDIF
      *ENDIF
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[12],_A_DSPX[12]  SAY XUS3      PICT "9999.9"
      COMMIT
    ENDCASE
    DO CASE
    CASE TNSTP=-6  .AND. STAR=0
      save scre to SCRMA
      usave="n"
      TLP_1=0


      IF  ( ALLTRIM(XRATNO) <> "0"  .AND. EMPTY(ALLTRIM(XRATNO)) <> .T.   )   .AND. ( EMPTY(ALLTRIM(XSCANO)) <> .T. )
	SELE 4
	ZAP
	APPE BLANK
	REPL CDATE WITH DATE() && 1
	REPL scano WITH XSCANO	&& 2
	REPL US2_1 WITH XUS2_1	&& 3
	REPL US2_2 WITH XUS2_2	&& 4
	REPL CCARW WITH XCARW  && 6
	REPL CHOUR WITH VAL(SUBSTR(TIME(),1,2))  && 8
	REPL CMIN WITH VAL(SUBSTR(TIME() ,4,2))
	REPL CSEC  WITH VAL(SUBSTR(TIME() ,7,2))
	REPL LAG_CAR  WITH XTOT_CAR  && 9
	REPL COUNT WITH  XVUSE	 && 10
	REPL LAG_LAG WITH XUS3	 && 11
	REPL CARNO WITH XCARNO && 13
	REPL TANDO  WITH XTANDO   && 14
	REPL CCARDRV WITH XCARDRV && 15
	REPL US2 WITH XUS2  && 16
	REPL RATNO WITH XRATNO	 && 18
	REPL P1701 WITH XADDR_NO   && 18
	REPL  S_STRO  WITH  XSTRO
	X=_TOT_D_A[20,4] +2
	sp_date=_TOT_D_A[1,X]
	do x_pno
	IF   ((USAVE="Y") .OR. (USAVE="y"))
	  STOR 1  TO  SAVE_FILE
	  lag_sno=str(val(lag_sno)+1,8,0)
	  _TOT_D_A[19,X] :=LAG_SNO
	  SAVE TO LAGDATA9 ALL LIKE LAG*
	ELSE
	  STOR 0  TO  SAVE_FILE
	ENDIF
	pnt_mode=3
	DO LUPRN1
	pnt_mode=0
	STOR 0	TO  SAVE_FILE
	IF   ((USAVE="YA") .OR. (USAVE="yA"))
	  X=_TOT_D_A[20,4] +2
	  SELE 7
	  &&APPE BLANK
	  rEPL LUDATE WITH _TOT_D_A[1,X]    && 1
	  &&rEPL LUDATE WITH sp_date	&& 1
	  REPL SCANO WITH _TOT_D_A[2,X]
	  repl	p1702  with  _TOT_D_A[4,X]
	  REPL TOTW WITH TOTTXP    && 7
	  REPL LUTIME WITH _TOT_D_A[8,X]    && 8
	  REPL CARLAG  WITH _TOT_D_A[9,X]   && 9
	  REPL TOTVUSE WITH XVUSE   &&	10
	  REPL LAGTTW WITH _TOT_D_A[11,X]
	  REPL CARNO WITH _TOT_D_A[13,X]
	  REPL TANDO WITH _TOT_D_A[14,X]
	  REPL CARDRV WITH _TOT_D_A[15,X]
	  REPL US2 WITH _TOT_D_A[16,X]
	  REPL	  SCANO2  WITH	_TOT_D_A[17,X]	   && S_MAX
	  REPL RATNO WITH  _TOT_D_A[18,X]
	  REPL LAGNO1 WITH  _TOT_D_A[2,X]  &&LAG_PNO && 累進SNO.
	  repl	U_PRICE WITH _TOT_D_A[21,X]
	  REPL S_STRO  WITH  _TOT_D_A[12,X]
	  COMMIT
	  usave="n"
	  SELE 4
	  COMMIT
	endif
      ENDIF
      COMMIT
      rest scre from scrma
      FAULT_PNT=1
      _TOT_D_A[20,3] :=0
      _TOT_D_A[20,4] :=0
    CASE TNSTP=5
      TLP_1=TLP_1 -1
      IF TLP_1 =0
	TLP_1=1
	IF  PAHPRO=1
	  SELE 3
	  SET DELE OFF
	  REPL SCANO  WITH XSCANO,CARNO WITH XCARNO,RATNO WITH XRATNO,VUSE WITH XVUSE,TANDO WITH XTANDO,us2  WITH XUS2,US3 WITH XUS3,CARDRV WITH XCARDRV,US2_1 WITH XUS2_1,us2_2  with	xus2_2 ,TOT_CAR WITH XTOT_CAR
	  RECALL
	  SKIP -1
	  IF .NOT. BOF()
	    DELE
	    LURECNO=RECNO()
	    XSCANO  =SCANO
	    XCARNO  =CARNO
	    XCARDRV =CARDRV
	    XCARW =CARW
	    XRATNO  =RATNO
	    XSTRO=S_STRO
	    XVUSE   =VUSE
	    XTANDO  =TANDO
	    XUS2    =US2
	    XUS2_1  =US2_1
	    XUS2_2  =US2_2
	    XUS3    =US3
	    XU_PRICE=U_PRICE
	    XADDR_NO=P1701
	    XTOT_CAR=TOT_CAR
	   *SCRNO=SCRNO-1
	    SCRNO=SCRNO
	    Y1=SCRNO
	    IF SCRNO <21
	      SCRNO = 21
	      SCROLL(21,2,22,77,-1)
	    ENDIF
	  ELSE
	    GOTO TOP
	  ENDIF
	ENDIF
      ENDIF
    CASE TNSTP=13  .OR.  TNSTP=24   .OR. TNSTP=23 .OR. TNSTP=27
      IF  TNSTP=23 .OR. TNSTP=27.OR. TNSTP=24
	TLP_1=100
	IF  TNSTP=23 .OR. TNSTP=27
	  TLP=0
	ENDIF
      ENDIF
      TLP_1=TLP_1 + 1
      IF TLP_1 >=10
	IF  PAHPRO=0
	  ascano=Xscano
	  ACARNO =XCARNO     &&車號	       ACARNO
	  ACARW  =XCARW      &&空重	       ACARW
	  ARATNO =XRATNO     &&配比NO	       ARATNO
	  ASTRO=XSTRO
	  AVUSE  =XVUSE      &&米數	       AVUSE
	  ATANDO =XTANDO     &&坍度	       ATANDO
	  AUS2	 =XUS2	     &&客戶NO	       AUS2
	  APOSITION=XUS2
	  ACARDRV=XCARDRV    &&DRIVER NAME     ACARDRV
	  AUS3=XUS3	     &&累計米數        AUS3=XU
	  ATOT_CAR=XTOT_CAR  &&累計車次        ATOT_CAR
	  AUS2_1=XUS2_1      &&客戶名稱        AUS2_1
	  AUS2_2=XUS2_2      &&送貨地址        AUS2_2
	  A_ADDR_NO=XADDR_NO	 &&送貨地址NO
	  APOSITION=XADDR_NO
	  AU_PRICE=XU_PRICE
	  TLP=0
	  TLP_1=0
	ELSE
	  TLP=1
	  TLP_1=1
	  IF  TNSTP=23 .OR. TNSTP=27
	    TLP=0
	    TLP_1=0
	  ENDIF
	  SELE 3
	  SET DELE OFF
	  IF  XVUSE <>0
	    REPL SCANO	WITH XSCANO
	    REPL CARW WITH XCARW
	    REPL CARNO WITH XCARNO
	    REPL RATNO WITH XRATNO
	    REPL S_STRO WITH XSTRO
	    REPL VUSE WITH XVUSE
	    REPL TANDO WITH XTANDO
	    REPL us2  WITH XUS2
	    REPL US3 WITH XUS3
	    REPL CARDRV WITH XCARDRV
	    REPL US2_1 WITH XUS2_1
	    REPL us2_2	with  xus2_2
	    REPL TOT_CAR WITH XTOT_CAR
	    REPL U_PRICE WITH  XU_PRICE
	    RECALL
	    SKIP
	    IF EOF()
	      APPE BLANK
	    ENDIF
	    DELE
	   *SCRNO=SCRNO+1
	    SCRNO=SCRNO
	  ENDIF
	  LURECNO=RECNO()
	  XSCANO  =SCANO
	  XCARNO  =CARNO
	  XTOT_CAR=TOT_CAR
	  XCARW  =CARW
	  XCARDRV =CARDRV
	  XRATNO  =RATNO
	  XSTRO  =S_STRO
	  XVUSE   =VUSE
	  XTANDO  =TANDO
	  XUS2	  =US2
	  XUS2_1  =US2_1
	  XUS2_2  =US2_2
	  XUS3	  =US3
	  XU_PRICE=U_PRICE
	  Y1=SCRNO
	  IF SCRNO >22
	    SCRNO = 22
	    SCROLL(21,2,22,77,1)
	  ENDIF
	ENDIF
      ENDIF
    ENDCASE
  ENDDO
ENDDO
**-----------------------------------------------------------------------------
PROCEDURE  FIND_1102
PARAMETERS  P1,P2,P3
SET COLOR TO &c12 / &c11
set key 5  to
set key 24 to
SET KEY 28 TO
XPRTSCR=SAVESCREEN(19,0,24,79)
@ 19,50 SAY  "║員工代號─  姓   名       ║"
@ 20,50 SAY  "║                          ║"
@ 21,50 SAY  "║                          ║"
@ 22,50 SAY  "║                          ║"
@ 23,50 SAY  "║                          ║"
@ 24,50 SAY  "║[↑↓]上下 [Enter]選擇    ║"
SET COLOR TO &C17 / &C15
@ 19,50 SAY  "║員工代號─  姓   名       ║"
@ 24,50 SAY  "║[↑↓]上下 [Enter]選擇    ║"
SET COLOR TO &C16 / &C15
@ 24,53 SAY "↑↓"
@ 24,64 SAY "Enter"
SET COLOR TO &C12 / &C11
SELE 12
GOTO TOP
TNO=1
TY=20
DO WHILE .NOT. EOF()
  @ TY,53 SAY	  "                         "
  @ TY,53 SAY  ALLTRIM(STR(TNO))
  @ TY,58   SAY  P1601
  @ TY,63    SAY  P1602
  SKIP
  TY=TY+1
  TNO=TNO+1
  IF  EOF() .OR. TY>=24
    TY=TY-1
    TNO=TNO-1
    SKIP -1
    XDADA=ALLTRIM(STR(TNO))
    XDATA6=P1601
    XDATA6_1=P1602
    SET COLO  TO  W+ /R+
    @ TY,53 SAY     "                         "
    @ TY,53 SAY  XDADA
    @ TY,58   SAY  XDATA6
    @ TY,63    SAY  XDATA6_1
    SET COLOR TO &c12 / &c11 , &c14 / &c13
    T=0
    DO WHILE T<>13 .AND. T<>27 .AND. (.NOT. EOF())  .AND. T<>18 .AND. T<>3
      T=0
      set curs off
      DO WHILE	T<>5 .AND. T<>24  .AND. T<>27  .AND. T<>13  .AND. T<>18  .AND. T<>3
	IF (T0A <>0)  .AND.  DSP_SCALL=1
	  T=T0A
	  T0A=0
	ELSE
	  T=INKEY()
	ENDIF
	IF  DSP_SCALL=1
	  DO DSP2
	  IF T0A=0
	    DO LUSTP
	  ENDIF
	ENDIF
      ENDDO
      SELE 12
      SET COLO TO &c12 / &c11
      set curs on
      DO CASE
      CASE T=5
	IF  TNO<>1
	  @ TY,53 SAY	  "                         "
	  @ TY,53 SAY  XDADA
	  @ TY,58   SAY  XDATA6
	  @ TY,63    SAY  XDATA6_1
	  SKIP	-1
	  TY=TY-1
	  IF TY<=19
	    TY=20
	    SCROLL(20,52,23,77,-1)
	  ENDIF
	  TNO=TNO-1
	  XDADA=ALLTRIM(STR(TNO))
	  XDATA6=P1601
	  XDATA6_1=P1602
	  SET COLO TO &c14 / &c13
	  @  TY,53 SAY	   "                         "
	  @ TY,53 SAY  XDADA
	  @ TY,58   SAY  XDATA6
	  @ TY,63    SAY  XDATA6_1
	  SET COLOR TO &c12 / &c11 , &c14 / &c13
	  T=0
	ENDIF
      CASE T=24
	SKIP
	IF  .NOT. EOF()
	  @ TY,53 SAY	  "                         "
	  @ TY,53 SAY  XDADA
	  @ TY,58   SAY  XDATA6
	  @ TY,63    SAY  XDATA6_1
	  TY=TY+1
	  TNO=TNO+1
	  IF TY>=24
	    TY=23
	    SCROLL(20,52,23,77,1)
	  ENDIF
	  XDADA=ALLTRIM(STR(TNO))
	  XDATA6=P1601
	  XDATA6_1=P1602
	  SET COLO TO &c14 / &c13
	  @ TY,53 SAY	  "                         "
	  @ TY,53 SAY  XDADA
	  @ TY,58   SAY  XDATA6
	  @ TY,63    SAY  XDATA6_1
	  SET COLOR TO &c12 / &c11 , &c14 / &c13
	  T=0
	ENDIF
      CASE T=18
	IF  TNO > TY-2
	  SKIP -(TY-2)
	  TNO=TNO-TY+2
	ELSE
	  SKIP -(TNO-1)
	  TNO=1
	ENDIF
	TY=20
	IF BOF()
	  GOTO TOP
	ENDIF
	SCROLL(20,52,23,77,0)
      CASE T=3
	SKIP
	TY=20
	TNO=TNO+1
	SCROLL(20,52,23,77,0)
      CASE T=13
	xcardrv=XDATA6_1
	CHRN   =XDATA6_1
	GOTO BOTT
	SKIP  1
      CASE T=27
	GOTO BOTT
	SKIP  5
      ENDCASE
    ENDDO
  ENDIF
ENDDO
SET FILT TO
RESTSCREEN(19,0,24,79,XPRTSCR)
*ET KEY 28 TO	FIND_1103
SET COLOR TO &c2 / &c1 , &c4 / &c3
SET CURS OFF
set key 5  to upread_01
set key 24 to dnread_01
sele 3
T=0
RETURN
**-----------------------------------------------------------------------------
PROCEDURE  FIND_1103
PARAMETERS  P1,P2,P3
SET COLOR TO &c12 / &c11
set key 5  to
set key 24 to
SET KEY 28 TO
XPRTSCR=SAVESCREEN(19,0,24,79)
@ 19,0 CLEA TO	24,79
@ 19,1	SAY   "║客戶代號─   客    戶    名    稱         送貨地點                         ║"
@ 19,3	 SAY _F3TXT_A[1]
@ 19,16  SAY SUBSTR(_F3TXT_A[2],1,2)
@ 19,22  SAY SUBSTR(_F3TXT_A[2],3,2)
@ 19,28  SAY SUBSTR(_F3TXT_A[2],5,2)
@ 19,34  SAY SUBSTR(_F3TXT_A[2],7,2)
@ 19,45  SAY _F3TXT_A[4]
@ 20,1	SAY   "║                                                                           ║"
@ 21,1	SAY   "║                                                                           ║"
@ 22,1	SAY   "║                                                                           ║"
@ 23,1	SAY   "║                                                                           ║"
@ 24,1	SAY   "║[↑↓]上下 [Enter]選擇                                                     ║"
SET COLOR TO &C17 / &C15
@ 19,1	SAY   "║客戶代號─   客    戶    名    稱         送貨地點                         ║"
@ 19,3	 SAY _F3TXT_A[1]
@ 19,16  SAY SUBSTR(_F3TXT_A[2],1,2)
@ 19,22  SAY SUBSTR(_F3TXT_A[2],3,2)
@ 19,28  SAY SUBSTR(_F3TXT_A[2],5,2)
@ 19,34  SAY SUBSTR(_F3TXT_A[2],7,2)
@ 19,45  SAY _F3TXT_A[4]
@ 24,1	SAY   "               [↑↓]上下 [Enter]選擇                                          "
SET COLOR TO &C16 / &C15
@ 24,17 SAY "↑↓"
@ 24,28 SAY "Enter"
SET COLOR TO &C12 / &C11
SELE 11
IF CDSK=0
  IF FILE("c:\DX1502.NTX")=.F.
    INDE ON P1502 TO C:\DX1502
  ENDIF
ELSE
  IF FILE("D:\DX1502.NTX")=.F.
    INDE ON P1502 TO D:\DX1502
  ENDIF
ENDIF
SET  INDE  TO  DX1502
GOTO TOP
TNO=1
TY=20
DO WHILE .NOT. EOF()
  @ TY, 3 SAY	  "                                                                          "
  @ TY, 3 SAY  ALLTRIM(STR(TNO))
  @ TY, 8   SAY  P1501
  @ TY,13    SAY  P1502
  @ TY,45    SAY  SUBSTR(P1506,1,30)
  SKIP
  TY=TY+1
  TNO=TNO+1
  IF  EOF() .OR. TY>=24
    TY=TY-1
    TNO=TNO-1
    SKIP -1
    XDADA=ALLTRIM(STR(TNO))
    XDATA6=P1501
    XDATA6_1=P1502
    XDATA6_2=SUBSTR(P1506,1,30)
    SET COLO TO &c14 / &c13
    @ TY, 3 SAY     "                                                                          "
    @ TY, 3 SAY  XDADA
    @ TY, 8   SAY  XDATA6
    @ TY,13    SAY  XDATA6_1
    @ TY,45    SAY  XDATA6_2
    SET COLOR TO &c12 / &c11 , &c14 / &c13
    T=0
    DO WHILE T<>13 .AND. T<>27 .AND. (.NOT. EOF())  .AND. T<>18 .AND. T<>3
      T=0
      set curs off
      LURECNO=RECNO()
      DO WHILE	T<>5 .AND. T<>24  .AND. T<>27  .AND. T<>13  .AND. T<>18  .AND. T<>3
	IF (T0A <>0)  .AND.  DSP_SCALL=1
	  T=T0A
	  T0A=0
	ELSE
	  T=INKEY()
	ENDIF
	IF  DSP_SCALL=1
	  DO DSP2
	  IF T0A=0
	    DO LUSTP
	  ENDIF
	ENDIF
      ENDDO
      set curs on
      SELE 11
      GOTO LURECNO
      SET COLO TO &c12 / &c11
      DO CASE
      CASE T=5
	IF  TNO<>1
	  @ TY, 3 SAY	  "                                                                          "
	  @ TY, 3 SAY  XDADA
	  @ TY, 8   SAY  XDATA6
	  @ TY,13    SAY  XDATA6_1
	  @ TY,45    SAY  XDATA6_2
	  SKIP	-1
	  TY=TY-1
	  IF TY<=19
	    TY=20
	    SCROLL(20, 3,23,77,-1)
	  ENDIF
	  TNO=TNO-1
	  XDADA=ALLTRIM(STR(TNO))
	  XDATA6=P1501
	  XDATA6_1=P1502
	  XDATA6_2=SUBSTR(P1506,1,30)
	  SET COLO TO &c14 / &c13
	  @ TY, 3 SAY	  "                                                                          "
	  @ TY, 3 SAY  XDADA
	  @ TY, 8   SAY  XDATA6
	  @ TY,13    SAY  XDATA6_1
	  @ TY,45    SAY  XDATA6_2
	  SET COLOR TO &c12 / &c11 , &c14 / &c13
	  T=0
	ENDIF
      CASE T=24
	SKIP
	IF  .NOT. EOF()
	  @ TY, 3 SAY	  "                                                                          "
	  @ TY, 3 SAY  XDADA
	  @ TY, 8   SAY  XDATA6
	  @ TY,13    SAY  XDATA6_1
	  @ TY,45    SAY  XDATA6_2
	  TY=TY+1
	  TNO=TNO+1
	  IF TY>=24
	    TY=23
	    SCROLL(20, 3,23,77,1)
	  ENDIF
	  XDADA=ALLTRIM(STR(TNO))
	  XDATA6=P1501
	  XDATA6_1=P1502
	  XDATA6_2=SUBSTR(P1506,1,30)
	  SET COLO TO &c14 / &c13
	  @ TY, 3 SAY	  "                                                                          "
	  @ TY, 3 SAY  XDADA
	  @ TY, 8   SAY  XDATA6
	  @ TY,13    SAY  XDATA6_1
	  @ TY,45    SAY  XDATA6_2
	  SET COLOR TO &c12 / &c11 , &c14 / &c13
	  T=0
	ENDIF
      CASE T=18
	IF  TNO > TY-2
	  SKIP -(TY-2)
	  TNO=TNO-TY+2
	ELSE
	  SKIP -(TNO-1)
	  TNO=1
	ENDIF
	TY=20
	IF BOF()
	  GOTO TOP
	ENDIF
	SCROLL(20, 3,23,77,0)
      CASE T=3
	SKIP
	TY=20
	TNO=TNO+1
	SCROLL(20, 3,23,77,0)
      CASE T=13
	XUS2=XDATA6
	Xus2_1=XDATA6_1
	GOTO BOTT
	CHRN=XDATA6
	SKIP  5
      CASE T=27
	GOTO BOTT
	SKIP  5
      ENDCASE
    ENDDO
  ENDIF
ENDDO
SET FILT TO
RESTSCREEN(19,0,24,79,XPRTSCR)
*ET KEY 28 TO	FIND_1401
SET COLOR TO &c2 / &c1 , &c4 / &c3
*set key 5  to upread_01
SET CURS OFF
*set key 24 to dnread_01
sele 3
T=0
RETURN
**-----------------------------------------------------------------------------
PROCEDURE  FIND_1201
PARAMETERS  P1,P2,P3
XCOR=SETCOLOR()
SET COLOR TO W+ / BL
set key 5  to
set key 24 to
SET KEY 28 TO
XPRTSCR=SAVESCREEN(19,0,24,79)
*@ 19,50 SAY  "║車輛號碼─駕駛姓名   空重 ║"
*@ 20,50 SAY  "║                          ║"
*@ 21,50 SAY  "║                          ║"
*@ 22,50 SAY  "║                          ║"
*@ 23,50 SAY  "║                          ║"
*@ 24,50 SAY  "║[↑↓]上下 [Enter]選擇    ║"
@ 19,35 SAY  "║車輛代號─車輛號碼 ─駕駛姓名   空重 ║"
@ 20,35 SAY  "║                                     ║"
@ 21,35 SAY  "║                                     ║"
@ 22,35 SAY  "║                                     ║"
@ 23,35 SAY  "║                                     ║"
@ 24,35 SAY  "║[↑↓]上下 [Enter]選擇               ║"



SET COLOR TO W+ / GR
@ 19,35 SAY  "║車輛代號─車輛號碼 ─駕駛姓名   空重 ║"
@ 24,35 SAY  "║[↑↓]上下 [Enter]選擇               ║"
SET COLOR TO &C16 / &C15
SET COLOR TO GR+ / GR
@ 24,46 SAY "↑↓"
@ 24,57 SAY "Enter"
@ 24,70 SAY "DEL"
SET COLOR TO W+ / BL
SELE 10
GOTO TOP
TNO=1
TY=20
DO WHILE .NOT. EOF()
  @ TY,37 SAY	  "                                     "
  @ TY,53 SAY  ALLTRIM(STR(TNO))
  @ TY,40   SAY  P12100
  @ TY,52   SAY  P12101
  @ TY,62    SAY  P12102
  @ TY,72    SAY  P12103
  SKIP
  TY=TY+1
  TNO=TNO+1
  IF  EOF() .OR. TY>=24
    TY=TY-1
    TNO=TNO-1
    SKIP -1
    XDADA=ALLTRIM(STR(TNO))
    XDATA6_0=P12101
    XDATA6=P12100
    XDATA6_1=P12102
    XDATA6_2=P12103
    SET COLO TO W+ / R+
    @ TY,37 SAY     "                                     "
    *@ TY,53 SAY  XDADA
    @ TY,40   SAY  XDATA6
    @ TY,52   SAY  XDATA6_0
    @ TY,62    SAY  XDATA6_1
    @ TY,72   SAY  XDATA6_2
    SET COLOR TO W+ / BL
    T=0
    DO WHILE T<>13 .AND. T<>27 .AND. (.NOT. EOF())  .AND. T<>18 .AND. T<>3 .AND. T<>7
      T=0
      set curs off
      DO WHILE	T<>5 .AND. T<>24  .AND. T<>27  .AND. T<>13  .AND. T<>18  .AND. T<>3 .AND. T<>7
	IF (T0A <>0)  .AND.  DSP_SCALL=1
	  T=T0A
	  T0A=0
	ELSE
	  T=INKEY()
	ENDIF
	IF  DSP_SCALL=1
	  DO DSP2
	  IF T0A=0
	    DO LUSTP
	  ENDIF
	ENDIF
      ENDDO

      SET COLOR TO W+ / BL
      SELE 10
      set curs on
      DO CASE
      CASE T=5
	IF  TNO<>1
	  *@ TY,53 SAY	XDADA
	  @ TY,37 SAY	  "                                     "
	  @ TY,40   SAY  XDATA6
	  @ TY,52   SAY  XDATA6_0
	  @ TY,62    SAY  XDATA6_1
	  @ TY,72    SAY  XDATA6_2
	  SKIP	-1
	  TY=TY-1
	  IF TY<=19
	    TY=20
	    SCROLL(20,52,23,77,-1)
	  ENDIF
	  TNO=TNO-1
	  XDADA=ALLTRIM(STR(TNO))
	  XDATA6_0=P12101
	  XDATA6=P12100
	  XDATA6_1=P12102
	  XDATA6_2=P12103
	  SET COLO TO W+ / R+
	  *@ TY,53 SAY	XDADA
	  @ TY,37 SAY	  "                                     "
	  @ TY,40   SAY  XDATA6
	  @ TY,52   SAY  XDATA6_0
	  @ TY,62    SAY  XDATA6_1
	  @ TY,72    SAY  XDATA6_2
	  SET COLOR TO W+ / BL
	  T=0
	ENDIF
      CASE T=24
	SKIP
	IF  .NOT. EOF()
	  *@ TY,53 SAY	XDADA
	  @ TY,37 SAY	  "                                     "
	  @ TY,40   SAY  XDATA6
	  @ TY,52   SAY  XDATA6_0
	  @ TY,62    SAY  XDATA6_1
	  @ TY,72    SAY  XDATA6_2
	  TY=TY+1
	  TNO=TNO+1
	  IF TY>=24
	    TY=23
	    SCROLL(20,52,23,77,1)
	  ENDIF
	  XDADA=ALLTRIM(STR(TNO))
	  XDATA6_0=P12101
	  XDATA6=P12100
	  XDATA6_1=P12102
	  XDATA6_2=P12103
	  SET COLO TO W+ / R+
	  *@ TY,53 SAY	XDADA
	  @ TY,37 SAY	  "                                     "
	  @ TY,40   SAY  XDATA6
	  @ TY,52   SAY  XDATA6_0
	  @ TY,62    SAY  XDATA6_1
	  @ TY,72    SAY  XDATA6_2
	  SET COLOR TO W+ / BL
	  T=0
	ENDIF
      CASE T=18
	IF  TNO > TY-2
	  SKIP -(TY-2)
	  TNO=TNO-TY+2
	ELSE
	  SKIP -(TNO-1)
	  TNO=1
	ENDIF
	TY=20
	IF BOF()
	  GOTO TOP
	ENDIF
	SCROLL(20,52,23,77,0)
      CASE T=7
	DELE
	PACK
	GOTO BOTT
	SKIP  5
      CASE T=3
	SKIP
	TY=20
	TNO=TNO+1
	SCROLL(20,52,23,77,0)
      CASE T=13
	XCARNO = substr(XDATA6,1,8)
	CHRN   =substr(XDATA6,1,7)
	xcardrv=XDATA6_1
	XCARW=XDATA6_2
	GOTO BOTT
	SKIP  1
      CASE T=27
	GOTO BOTT
	SKIP  5
      ENDCASE
    ENDDO
  ENDIF
ENDDO
SET FILT TO
RESTSCREEN(19,0,24,79,XPRTSCR)
SET COLO TO &C1 / &C7 +
@ _A_DSPY[2] ,_A_DSPX[2]    SAY XCARNO
*@ SCRNO,_A_DSPX[3]   SAY XCARDRV
*ET KEY 28 TO	FIND_1201
SET COLOR TO &c2 / &c1 , &c4 / &c3
SET CURS OFF
set key 5  to upread_01
set key 24 to dnread_01
sele 3
T=0
SET COLO TO &XCOR
RETURN
**-----------------------------------------------------------------------------
PROCEDURE  FIND_ADD_
PARAMETERS  P1,P2,P3
SET COLOR TO &c12 / &c11
RET_X1=SPACE(4)
RET_X2=SPACE(50)
DO  D_add_DATA WITH  "N"
IF RET_X1 <>  SPACE(10)
  XADDR_NO=FSUBSTR(RET_X1,4," ",0)
  *XADDR_NO=FSUBSTR(RET_X2,10," ")
  CHRN=XADDR_NO
  XUS2_2=RET_X2
  IF  EMPTY(RET_A[4])=.T.
    RET_A[4] := 0
  ENDIF
  XU_PRICE=RET_A[4]
    @ _A_DSPy[7],_A_DSPX[7]  SAY  XADDR_NO
    @ _A_DSPy[13],_A_DSPX[13]	 SAY  SUBSTR(XUS2_2,1,12)
    IF	LU_COUNT=1
      @    22,_A_DSPX[13]    SAY XU_PRICE PICT "99999"
    ENDIF
ENDIF
RETU
**-----------------------------------------------------------------------------
PROCEDURE  x_pno
PARAMETERS  P1,P2,P3
set key 5 to
set key 24 to
SET CURS On
set colo to &c7 + /&c1, b/w+
@ 22,4 clea to 22,30
@ 23,1 clea to 23,79
@ 22,3 say  "編號:"
@ 23,3	say "Date:"
@ 23,20  say  "Time:"
@ 23,35  say  "存檔列印:"
x_no=lag_pno
fx_date=date()
fx_time=time()
fx_h=substr(fx_time,1,2)
fx_m=substr(fx_time,4,2)
fx_s=substr(fx_time,7,2)
X_NO=XSCANO
@ 22,8	get   x_no pict "XXXXXXXXXXXXXX"
fx_date=date()
@ 23,8	get   fx_date
*@ 23,25 get   fx_time
@ 23,25 get   fx_h     pict  "99"
@ 23,27 say ":"
@ 23,28  get   fx_m	pict  "99"
@ 23,30 say ":"
@ 23,31   get	fx_s	 pict  "99"
@ 23,44 get   usave   pict "Y"
read
fx_time=fctoTime(fx_h,fx_m,fx_s)
@ 23,25 say   fx_time

IF (USAVE ="YA"  .or. USAVE ="yA" )
     pnt0_en=1
else
     pnt0_en=0
endif
_TOT_D_A[20,4] =1
X=_TOT_D_A[20,4] +2
_TOT_D_A[2,X]  :=x_no
_TOT_D_A[19,X]	:=x_no
&& _TOT_D_A[2,X]  :="00"+ltrim(str(x_no,6,0))
_TOT_D_A[1,X]  :=fx_date
_TOT_D_A[8,X]  :=fx_time
@ 22,9 clea to 22,30
repl  cdate   with  fx_date
REPL CHOUR WITH VAL(SUBSTR(fx_time,1,2)),CMIN WITH VAL(SUBSTR(fx_time,4,2)),CSEC  WITH VAL(SUBSTR(fx_time,7,2))
REPL scano WITH x_no
SET CURS OFF
RETU
**--------------------------------------------------------------------------
PROCEDURE  FIND_RATNO
PARAMETERS  P1,P2,P3
  RET_X1=" "
  RET_X3=-1
  D_STRO(20,12,4,"N")
  IF EMPTY(ALLTRIM(RET_X1))=.F.
     XRATNO=FSUBSTR(RET_X1,RATNO_WID," ",0)
     CHRN=XRATNO
     IF RET_X3 >0
       XTANDO=RET_X3
       @ _A_DSPY[5],_A_DSPX[5]	  SAY XTANDO	PICT "9999"
    ENDIF
  ENDIF
RETU
**--------------------------------------------------------------------------

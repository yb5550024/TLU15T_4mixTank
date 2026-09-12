#INCLUDE "\clip52e\INCLUDE\INKEY.CH"
**-----------------------------------------------------------------------------
FUNCTION   fget_dec
PARAMETERS  xsrc    && "99.99"   retu 2
xint=len(alltrim(str(int(val(xsrc)),10,0)))
x_dec=len(xsrc)-xint
if x_dec >0
  x_dec=x_dec-1
endif
RETU x_dec
&&-----------------------------------------------------------------------------
&& fseek_C(11,"P1501",pnt_d_a[16,X],"P1502",@X_DET)
&& fseek_C(2,"RATNO",X_RATNO,"DETAIL",@X_DET)
FUNCTION fSeek_C
PARAMETERS  f_dbfn,f_recname,f_seek,ret_rec,f_retu,ABSOL
ISSEEK=-1
actano=select(dbf())
sele &f_dbfn
IF EMPTY(DBF())=.F.
   loca  for  ALLTRIM(f_seek) ==ALLTRIM( &f_recname)
     if  eof()=.t.  .AND. (ABSOL<>1)
       loca  for  f_seek $ &f_recname
     endif
   if eof()=.f.
     ISSEEK=RECNO()
     f_retu=&ret_rec
   endif
ENDIF
sele &actano
retu  ISSEEK
&&-----------------------------------------------------------------------------
FUNCTION fSeek_2C
PARAMETERS  f_dbfn,f_recname1,f_seek1,f_recname2,f_seek2,ret_rec1,ret_rec2,f_ret1,f_ret2
ISSEEK=-1
actano=select(dbf())
sele &f_dbfn
if empty(f_recname2)=.f.
  loca	for  (	alltrim(&f_recname1)==alltrim(f_seek1))  .AND.	  (  alltrim(&f_recname2)==alltrim(f_seek2))
else
  loca	for  (	alltrim(&f_recname1)==alltrim(f_seek1))
endif
if eof()=.f.
  ISSEEK=RECNO()
   f_ret1=&ret_rec1
   IF EMPTY(ret_rec2)=.F.
     f_ret2=&ret_rec2
   ENDIF
endif
sele &actano
retu  ISSEEK
&&-----------------------------------------------------------------------------
FUNCTION   fgetserno
PARAMETERS  xlen,xindex
xserno =substr(str(year(date()),4,0),-2,2)
xn=int(month(date()))
xserno=xserno	+ fsubstr(xn,-2,"0",0)
xn=int(day(date()))
xserno=xserno	+ fsubstr(xn,-2,"0",0)
xserno=xserno  + fsubstr(xindex,-(xlen-6),"0",0)
RETU  xserno
**--------------------------------------------------------------------------
FUNCTION  fSelectNo
  workno=select(dbf())
RETU  workno
**-----------------------------------------------------------------------------
FUNCTION fTimeTON
PARAMETERS  P_TIME
TTON=(VAL(SUBSTR(P_TIME,1,2)) *3600 ) +(VAL(SUBSTR(P_TIME,4,2)) *60 )+VAL(SUBSTR(P_TIME,7,2))
RETU  TTON
**-----------------------------------------------------------------------------
FUNCTION fctoTime
PARAMETERS  xh,xm,xs
if valtype(xh)="C"
   xh=INT(val(xh))
endif
xh=INT(mod(xh,24))
xh=alltrim(str(xh,2,0))
xh=fsubstr(xh,-2,"0",0)

if valtype(xM)="C"
   xM=INT(val(xM))
endif
xm=INT(mod(xm,60))
xm=alltrim(str(xm,2,0))
xm=fsubstr(xm,-2,"0",0)
if valtype(xS)="C"
   xS=INT(val(xS))
endif
xs=INT(mod(xs,60))
xs=alltrim(str(xs,2,0))
xs=fsubstr(xs,-2,"0",0)

xret=xh+":"+xm +":" + xs
RETU   xret
**--------------------------------------------------------------------------
FUNCTION  FNTOTIME
PARAMETERS p_hn,p_mn,p_sn,p_tots
if p_tots >=0
   p_hn=INT(p_TOTS/3600)
   p_mn=INT(MOD(p_TOTS,3600)/60)
   p_sn=MOD(p_TOTS,60)
endif
xret=FSUBSTR(p_hn,-2,"0",-2) +":" + FSUBSTR(p_mn,-2,"0",-2) +":" + FSUBSTR(p_sn,-2,"0",-2)

RETU  XRET
**-----------------------------------------------------------------------------
FUNCTION    FSUBSTR
PARAMETERS  S_S,XLEN,FC,S_DECN
if empty(s_s)=.t.
   S_S=0
   XRET_S=SPACE(ABS(XLEN))
   IF EMPTY(S_DECN)=.T.
      S_DECN=0
   ENDIF
   if s_s=0  .and.  s_decn <0
     s_s=FC
     XRET_S=PADR(S_S,ABS(XLEN),FC)
   endif
ELSE
   if empty(s_s)=.t.
     RETU  SPACE(XLEN)
   endif

   IF EMPTY(S_DECN)=.T.
      S_DECN=0
   ENDIF
   IF S_DECN <0
     S_DECN=0
   ENDIF
   IF VALTYPE(S_S)="N"
     S_S=ALLTRIM(STR(S_S,10,S_DECN))
   ELSEIF VALTYPE(S_S)="D"
     S_S=DTOc(S_S)
   ENDIF
   S_S=ALLTRIM(S_S)
   if empty(s_s)=.t.
      XRET_S=SPACE(ABS(XLEN))
   ELSE
     IF XLEN >0
       XRET_S=PADR(S_S,XLEN,FC)
     ELSE
       XRET_S=PADL(S_S,ABS(XLEN),FC)
     ENDIF
   ENDIF
endif
RETU  XRET_S
**-----------------------------------------------------------------------------
FUNCTION    INSERT_SA
PARAMETERS  sa_date,sa_time
DSP_SCALL=0
LUSTP_EN=0
&&+++++++++++++++++++++++++++++++++++++++++++++++++++++++
DO RST_FUNC1
F7_FUNC="0"
F5_FUNC="0"
X_MAXSTEP=8
ACTW_EN=0

X3_stdm :=array(7,gs_tot+uwc_tot+1)   &&配比W,含水率,調水後總重,UPPER W,LOWER W ,ACT W
X3_stdERR :=array(2,gs_tot+uwc_tot+1) &&誤差,殘留
X3_TITL :=array(3,gs_tot+uwc_tot+1)





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
_A_DSPX :={7,7,7,30,30,30,48,7,30,33,36,0,0,0,0,0,0,0,0,0,48,48,48}
_A_DSPY :={19,20,21,19,20,21,19,22,22,22,22,0,0,0,0,0,0,0,0,0,21,20,21}
SET COLOR TO &C6 / &C1
@ 18,0 SAY   "╔══════════════════════════════════════╗"
*@ 19,0 SAY   "║NO. 車  號   駕駛   配比 米數 坍度 客戶代號 客戶名稱 地點代號  車次 累計米數║"
@ 19,37  SAY _F3TXT_A[1]
@ 19,46  SAY _F3TXT_A[2]
@ 19,55  SAY _F3TXT_A[3]
*@ 20,0 SAY   "║                                                                            ║"
*@ 21,0 SAY   "║                 送貨地點:                                                  ║"

*@ 19,0 SAY   "║NO. 車  號   駕駛   配比 米數 坍度 客戶代號 客戶名稱 地點代號  車次 累計米數║"
@ 19,0 SAY   "║ NO.:                  米數:         工    地:                              ║"
@ 20,0 SAY   "║車號:               坍   度:         強    度:                              ║"
@ 21,0 SAY   "║配比:              客戶代號:         客戶名稱:                              ║"
@ 22,0 SAY   "║日期:               時   間:  :  :                                            ║"

*@ 22,19  SAY ALLTRIM(_F3TXT_A[4])
IF LU_COUNT=1
  @ 22,4   SAY	"單價:"
ENDIF
@ 23,0 SAY   "╚══════════════════════════════════════╝"
IF  STAR=1
  @ 24,0 SAY   "∥<<排程輸入>> F1-資料查詢    Esc-結束     ,  Ctl-End 結束 ↑上一筆 ↓ 下一筆 ∥"
ELSE
  SET COLOR TO	gr +/ &C1
  @ 24,0 SAY   "∥  F1-資料查詢    F7-報表列印  ,  ESC- 結束 F5-重量                       ∥"
  SET COLOR TO &C7 +/ &C1
ENDIF
SET COLOR TO  gr +/ &C1
*@ 24,4  SAY "排程輸入"
*@ 24,30 SAY "Esc"
*@ 24,30 SAY "F7"
*@ 24,46 SAY "Ctl-End"
*@ 24,59 SAY "↑"
*@ 24,68 SAY "↓"
SET COLOR TO &C7 +/ &C1
XMIX_SEC=PMIXTM
SELE 3
IF  PAHPRO=1
  GOTO BOTT
  IF  .NOT.  EOF()  .AND. VUSE <>0
    @ _A_DSPY[1],_A_DSPX[1]    SAY SCANO   &&C14
    @ _A_DSPY[2],_A_DSPX[2]    SAY CARNO   &&C7
    @ _A_DSPY[3],_A_DSPX[3]    SAY RATNO   &&C9
    @ _A_DSPY[4],_A_DSPX[4]    SAY VUSE     PICT "99.9"
    @ _A_DSPY[5],_A_DSPX[5]    SAY TANDO    PICT "9999"
    @ _A_DSPY[6],_A_DSPX[6]    SAY US2	    &&C8
    @ _A_DSPY[7],_A_DSPX[7]  SAY  P1701
    @ _A_DSPY[21],_A_DSPX[21]	 SAY SUBSTR(US2_2,1,24)
    @ _A_DSPY[22],_A_DSPX[22]	 SAY S_STRO
    *@ _A_DSPY[3],_A_DSPX[3]	SAY CARDRV
    *@ _A_DSPY[1],_A_DSPX[9]	SAY TOT_CAR	 PICT "99999"
    *@ _A_DSPY[1],_A_DSPX[10]	 SAY US3      PICT "9999.9"
    *@ _A_DSPY[9],_A_DSPX[9]	SAY SUBSTR(US2_2,1,50)
    IF	LU_COUNT=1
      @    22,_A_DSPX[13]    SAY U_PRICE PICT "99999"
    ENDIF
    SKIP
    SCRNO=SCRNO
  ENDIF
  XSCANO=SPACE(17)
  XCARNO=SPACE(7)
  XCARDRV =SPACE(8)
  XCARW =0
  XRATNO =space(9)
  XVUSE  =0
  XTANDO =0
  XUS2=SPACE(8)
  XUS3=0
  XTOT_CAR=0
  XUS2_1=SPACE(24)
  xus2_2=space(24)
  XADDR_NO=SPACE(10)
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
  XUS2_1  =  AUS2_1
  XADDR_NO=APOSITION
  XUS2_2  =  AUS2_2
  XUS3	  =  AUS3
  XU_PRICE=AU_PRICE
  XTOT_CAR=ATOT_CAR
  XSTRO=ASTRO
  SCRNO=21

ENDIF
TLP=1
TLP_1=1
DO WHILE  TLP=1
  TLP_1=1
  DO  WHILE  (TLP_1 >= 1)  .AND.  (TLP_1 <=X_MAXSTEP)
    SET COLOR TO &C7 +/ &C1
    @ _A_DSPY[1],_A_DSPX[1]    SAY XSCANO
    @ _A_DSPY[2],_A_DSPX[2]    SAY XCARNO
    @ _A_DSPY[3],_A_DSPX[3]    SAY XRATNO
    @ _A_DSPY[4],_A_DSPX[4]    SAY XVUSE     PICT "99.9"
    @ _A_DSPY[5],_A_DSPX[5]    SAY XTANDO    PICT "9999"
    @ _A_DSPY[6],_A_DSPX[6]    SAY XUS2
    @ _A_DSPY[7],_A_DSPX[7]  SAY  XADDR_NO
    @ _A_DSPY[8],_A_DSPX[8]  SAY  sa_date
    @ _A_DSPY[9],_A_DSPX[9]  SAY  sa_time
    @ _A_DSPY[21],_A_DSPX[21]	 SAY SUBSTR(XUS2_1,1,24)
    @ _A_DSPY[22],_A_DSPX[22]	 SAY XSTRO
    IF	LU_COUNT=1
      @    22,_A_DSPX[13]    SAY XU_PRICE PICT "99999"
    ENDIF
    SELE 3
    DO CASE
    CASE TLP_1=1
      PGM=" "
      P_FUNC=" "
      R_C=XSCANO
      _D_TYPE=VALTYPE(R_C)
      C_PICT="XXXXXXXXXXXXXXXXX"
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XSCANO,"&_D_TYPE",C_L,0,TLP_1,"&P_FUNC")
      *NREAD(_A_DSPY[1],_A_DSPX[TLP_1] ,SUBSTR(XSCANO,1,14),14,pgm)
      XSCANO  =SUBSTR(SPACE(17)+ALLTRIM(UPPER(XPX)),-17,17)
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[XTLP_1],_A_DSPX[XTLP_1]   SAY XSCANO
    CASE TLP_1=2
      PGM="FIND_1201"
      P_FUNC="FIND_1201"
      R_C=XCARNO
      _D_TYPE=VALTYPE(R_C)
      C_PICT="XXXXXXX"
      X_DEC=0
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XCARNO,"&_D_TYPE",C_L,X_DEC,TLP_1,"&P_FUNC")

      *NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,SUBSTR(XCARNO,1,7),7,PGM)
      XCARNO  =SUBSTR(ALLTRIM(UPPER(XPX))+SPACE(7),1,7)
      @ _A_DSPY[XTLP_1],_A_DSPX[XTLP_1]  SAY  XCARNO
      xcarno=alltrim(xcarno)
      SELE 10
      LOCA FOR alltrim(XCARNO)== alltrim(P12100)
      IF  EOF()=.T.
	LOCA FOR XCARNO $ P12100
      endif
      IF  EOF()=.F.
	XCARNO =p12100
	XCARDRV=P12102
	XCARW=P12103
      ENDIF
      XCARNO=FSUBSTR(XCARNO,7," ")
      SET COLOR TO &C7 +/ &C1
    CASE TLP_1=3
      PGM=" "
      P_FUNC=" "
      R_C=XRATNO
      _D_TYPE=VALTYPE(R_C)
      C_PICT="XXXXXXXXX"
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      X2_RATNO=XRATNO
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XRATNO,"&_D_TYPE",C_L,0,TLP_1,"&P_FUNC")

      *NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],substr(XRATNO,1,9),9,PGM)
      XRATNO   =Fsubstr(XRATNO,9," ")
      IF X2_RATNO <> XRATNO
	xRATNO=alltrim(xRATNO)
	SELE 2
	LOCA  FOR alltrim(XRATNO)==alltrim(RATNO)
	IF EOF()=.T.
	  LOCA	FOR XRATNO $  RATNO
	endif
	IF EOF()=.F.
	  XSTRO=S_STRO
	  XRATNO=RATNO
	  XMIX_SEC=MIXSEC
	ELSE
	  XRATNO=SPACE(9)
	  XSTRO=SPACE(10)
	  XMIX_SEC=PMIXTM
	ENDIF
      ENDIF
      XRATNO   =Fsubstr(XRATNO,9," ")
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[XTLP_1],_A_DSPX[XTLP_1]  SAY XRATNO
      @ _A_DSPY[22],_A_DSPX[22]    SAY XSTRO
    CASE TLP_1=4
      PGM=" "
      P_FUNC=" "
      R_C=XVUSE
      _D_TYPE=VALTYPE(R_C)
      C_PICT="99.9"
      X_DEC=1
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XVUSE,"&_D_TYPE",C_L,X_DEC,TLP_1,"&P_FUNC")

      *NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],STR(XVUSE,4,1),4,PGM)
      *XVUSE  =VAL(XPX)
      if  xvuse >= 30
	xvuse=10
      endif
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[XTLP_1],_A_DSPX[XTLP_1]  SAY XVUSE     PICT "99.9"
    CASE TLP_1=5
      PGM=" "
      P_FUNC=" "
      R_C=XTANDO
      _D_TYPE=VALTYPE(R_C)
      C_PICT="9999"
      C_L=LEN(C_PICT)
      X_DEC=0
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XTANDO,"&_D_TYPE",C_L,X_DEC,TLP_1,"&P_FUNC")

      *NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],STR(XTANDO,4,0),4,PGM)
      *XTANDO  =VAL(XPX)
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[XTLP_1],_A_DSPX[XTLP_1]  SAY XTANDO    PICT "9999"
    CASE TLP_1=6
      PGM="FIND_1103"
      P_FUNC="FIND_1103"
      R_C=XUS2
      _D_TYPE=VALTYPE(R_C)
      C_L=LEN(R_C)
      C_PICT="XXXXXXXX"
      X_DEC=0
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XUS2,"&_D_TYPE",C_L,X_DEC,TLP_1,"&P_FUNC")

      *NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],SUBSTR(XUS2,1,8),8,PGM)
      XUS2   =FSUBSTR(UPPER(XUS2),8," ")
      SET COLOR TO &C7 +/ &C1
      @ _A_DSPY[XTLP_1],_A_DSPX[XTLP_1]  SAY XUS2
      IF  XUS2="    "
	XUS2_1=SPACE(24)
	*XUS2_2=SPACE(20)
      ENDIF
      SELE 11
      LOCA FOR P1501=XUS2
      IF EOF()=.F.
      XUS2_1=P1502
      ENDIF
      @ _A_DSPY[XTLP_1],_A_DSPX[7]  SAY XUS2
      @ _A_DSPY[23],_A_DSPX[23]  SAY SUBSTR(XUS2_1,1,24)
      *@ SCRNO,_A_DSPX[9]  SAY XTOT_CAR     PICT "99999"
      *@ SCRNO,_A_DSPX[10]  SAY XUS3	  PICT "9999.9"
      *@ SCRNO,_A_DSPX[11]  SAY SUBSTR(XUS2_2,1,8)
      SELE 3
    CASE TLP_1=7
      PGM="FIND_ADD_"
      P_FUNC="FIND_ADD_"
      R_C=XADDR_NO
      _D_TYPE=VALTYPE(R_C)
      C_L=LEN(R_C)
      C_PICT="XXXXXXXXXX"
      X_DEC=0
      C_L=LEN(C_PICT)
      XTLP_1=TLP_1
      CHRN=XADDR_NO
      TLP_1=READ_A(_A_DSPY[TLP_1],_A_DSPX[TLP_1] ,@XADDR_NO,"&_D_TYPE",C_L,X_DEC,TLP_1,"&P_FUNC")


      *NREAD(_A_DSPY[TLP_1],_A_DSPX[TLP_1],SUBSTR(XADDR_NO,1,10),10,PGM)
      XADDR_NO=FSUBSTR(XADDR_NO,10," ")
      if xADDR_NO   <> chrn
	SELE 13
	LOCA FOR P1701 =XADDR_NO
	XUS2_2=P1702
	XU_PRICE=U_PRICE
      ENDIF
      @ _A_DSPY[7],_A_DSPX[7]  SAY  XADDR_NO
      SET COLOR TO &C7 +/ &C1
    CASE TLP_1=8
      set key 5  to
      set key 24 to
      SET KEY 28 TO
      SET CURS On
      set colo to &c7 + /&c1,N/w+
      SET  ESCAP   ON
      sa_th=substr(sa_time,1,2)
      sa_tm=substr(sa_time,4,2)
      sa_ts=substr(sa_time,7,2)
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  get  sa_date
      @ _A_DSPY[TLP_1+1],_A_DSPX[TLP_1+1]  get	sa_th	 pict  "99"
      @ _A_DSPY[TLP_1+2],_A_DSPX[TLP_1+2]  get	sa_tm	 pict  "99"
      @ _A_DSPY[TLP_1+3],_A_DSPX[TLP_1+3]  get	sa_ts	 pict  "99"
      read
      SET  ESCAP   OFF
      SET CURS Off
      sa_time=fctotime(sa_th,sa_tm,sa_ts)
      @ _A_DSPY[TLP_1],_A_DSPX[TLP_1]  say  sa_date
      @ _A_DSPY[TLP_1+1],_A_DSPX[TLP_1+1]  say	sa_time
      if lastkey()=5
	tlp_1=tlp_1-1
      else
       if empty(alltrim(xratno))=.t.
	  tlp_1=3
       elseif xvuse=0
	  tlp_1=4
       else
	  tlp_1=1
       endif

      endif

    ENDCASE
    IF	 LAST_KEY <> K_ESC
      TNSTP=0
      IF TLP_1 >  X_MAXSTEP
	if empty(alltrim(xratno))=.t.
	   tlp_1=3
	elseif xvuse=0
	   tlp_1=4
	else
	   tlp_1=1
	   TNSTP=LAST_KEY
	endif
      ENDIF
    ELSE
      TNSTP=LAST_KEY
    ENDIF
    DO CASE
    CASE TNSTP=-6  .AND. STAR=0
      usave="n"
      TLP_1=0
      TLP=0
      TOTTXP=0
      ascano=Xscano
      ACARNO =XCARNO	 &&車號 	   ACARNO
      ACARW  =XCARW	 &&空重 	   ACARW
      ARATNO =XRATNO	 &&配比NO	   ARATNO
      ASTRO=XSTRO
      *AVUSE  =XVUSE	  &&米數	    AVUSE
      AVUSE  =0      &&米數	       AVUSE
      ATANDO =XTANDO	 &&坍度 	   ATANDO
      AUS2   =XUS2	 &&客戶NO	   AUS2
      APOSITION=XUS2
      ACARDRV=XCARDRV	 &&DRIVER NAME	   ACARDRV
      AUS3=XUS3 	 &&累計米數	   AUS3=XU
      ATOT_CAR=XTOT_CAR  &&累計車次	   ATOT_CAR
      AUS2_1=XUS2_1	 &&客戶名稱	   AUS2_1
      AUS2_2=XUS2_2	 &&送貨地址	   AUS2_2
      A_ADDR_NO=XADDR_NO     &&送貨地址NO
      APOSITION=XADDR_NO


      IF  ( ALLTRIM(XRATNO) <> "0"  .AND. EMPTY(ALLTRIM(XRATNO)) <> .T.   )   .AND. ( EMPTY(ALLTRIM(XSCANO)) <> .T. )
	SELE 4
	ZAP
	APPE BLANK
	REPL CDATE WITH SA_DATE  && 1
	REPL scano WITH XSCANO	&& 2
	REPL US2_1 WITH XUS2_1	&& 3
	REPL US2_2 WITH XUS2_2	&& 4
	REPL CCARW WITH XCARW  && 6
	REPL CHOUR WITH VAL(SUBSTR(SA_TIME,1,2))  && 8
	REPL CMIN WITH VAL(SUBSTR(SA_TIME ,4,2))
	REPL CSEC  WITH VAL(SUBSTR(SA_TIME ,7,2))
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
	_TOT_D_A[20,4]=1
	X=_TOT_D_A[20,4] +2
	sp_date=_TOT_D_A[1,X]
	IF  ENGL=0
	  D_C1="出車資料_存檔_(Y/N) ?"
	  D_C2="確定按 Y 鍵"
	  D_C3="取消按 N 或 Esc 鍵"
	ELSE
	  D_C1="Delete Delivery Sheet(Y/N) ?"
	  D_C2="Press Y to Exection"
	  D_C3="Press N OR Esc to Exit"
	ENDIF
	dl_ok=0
	USAVE="N"
	DL_OK=OK_ECHO(10,30,D_C1,D_C2,D_C3)
	if  dl_ok=1
	   USAVE="Y"
	endif

	IF   ((USAVE="Y") .OR. (USAVE="y"))
	  STOR 1  TO  SAVE_FILE
	  lag_sno=str(val(lag_sno)+1,8,0)
	  X=_TOT_D_A[20,4] +2
	  _TOT_D_A[19,X] :=LAG_SNO
	  SAVE TO LAGDATA9 ALL LIKE LAG*
	ELSE
	  STOR 0  TO  SAVE_FILE
	ENDIF
	IF ACTW_EN=0
	  &&+++++++++++++++++++++++++++++++++++++++
	  DO LUPRN1
	ELSE
	  &&+++++++++++++++++++++++++++++++++++++++
	  PNT_ACTW(@X3_STDM,@x3_stdERR,@X3_TITL,@_tot_d_a,XVUSE)
	ENDIF
	STOR 0	TO  SAVE_FILE
      ENDIF
      COMMIT
      *rest scre from scrma
      FAULT_PNT=1
      _TOT_D_A[20,3] :=0
      _TOT_D_A[20,4] :=0
    CASE    TNSTP=K_F5
       @ 3,1 CLEA  TO  17,78
       D_YS=1
       D_XS=0
       D_YE=18
       D_XE=79
       &&+++++++++++++++++++++++++++++++++++++++++++++++++
       SAVE SCREE  TO  XSCR_F5
       BOX_S(D_YS,D_XS,D_YE,D_XE)
       dsp_std(xratno,xvuse,d_ys+1,d_xs+1)
       ACTW_EN=1


    CASE    TNSTP=23 .OR. TNSTP=27
	TLP_1=100
	IF  TNSTP=23 .OR. TNSTP=27
	  TLP=0
	ENDIF
    ENDCASE
  ENDDO
ENDDO
DSP_SCALL=1
LUSTP_EN=1
&&+++++++++++++++++++++++++++++++++++++++++++++++++++++++
DO RST_FUNC

RETU
**-----------------------------------------------------------------------------
FUNCTION dsp_std
PARAMETERS  x3_ratno,x3_vuse,x3_ys,x3_xs
  *X3_stdm :=array(6,gs_tot+uwc_tot)   &&配比W,含水率,調水後總重,UPPER W,LOWER W ,ACT W
  *X3_stdERR :=array(2,gs_tot+uwc_tot)
  *X3_TITL :=array(3,gs_tot+uwc_tot+1)
  x3_wno=fselectno()
  x3_tottype =gs_tot+uwc_tot
  sele 2
  x3_ratno=alltrim(x3_ratno)
  loca	for  ALLTRIM(ratno) =x3_ratno
  for xlp=1  to    x3_tottype
     xc=alltrim(str(xlp,2,0))
     x3_stdM[1,xlp]=M&XC
     x3_stdM[3,xlp]=x3_stdM[1,xlp]  * X3_VUSE
     IF  EMPTY(x3_stdM[6,xlp])=.T.
	  x3_stdM[6,xlp]=0
     ENDIF
  next
  sele 5
  USE
  USE  PAR1
  GOTO	18   &&"99.99"
  x3_TITL[3,1]=X3_XS
  for xlp=1  to    x3_tottype
     xc=alltrim(str(xlp,2,0))
     x3_TITL[2,xlp]=ALLTRIM(PA&XC)  && 99.99
     x3_TITL[3,xlp+1]=X3_TITL[3,XLP]+ LEN(x3_TITL[2,xlp]) +1
  next
  GOTO	16   && "C1"
  for xlp=1  to    x3_tottype
     xc=alltrim(str(xlp,2,0))
     x3_TITL[1,xlp]=ALLTRIM(PA&XC)
     XNL=LEN(x3_TITL[2,xlp])+1
     x3_TITL[1,xlp]=FSUBSTR(x3_TITL[1,xlp],XNL," ")
  next

  USE
  USE  PAR
  GOTO	33   &&含水率
  X4_WATER_ADJ=0
  for xlp=1  to    x3_tottype
     xc=alltrim(str(xlp,2,0))
     x3_stdM[2,xlp]=PA&XC /100
     IF XLP > GS_TOT
       x3_stdM[2,xlp]=0
     ENDIF
     XW0=x3_stdM[3,xlp] * x3_stdM[2,xlp]
     x3_stdM[3,xlp]= x3_stdM[3,xlp] +XW0
     X4_WATER_ADJ= X4_WATER_ADJ +XW0
  next
  for xlp=GS_TOT+2  to	  GS_TOT +WATER_TOT
     x3_stdM[3,GS_TOT+1]= x3_stdM[3,GS_TOT+1] + x3_stdM[3,XLP]
     x3_stdM[3,XLP] =0
  NEXT
  x3_stdM[3,GS_TOT+1]=x3_stdM[3,GS_TOT+1]- X4_WATER_ADJ
  GOTO	66   &&誤差率
  for xlp=1  to    x3_tottype
     xc=alltrim(str(xlp,2,0))
     x3_stdERR[1,xlp]=PA&XC /1000
     XDIV=1
     IF XLP > (X3_TOTTYPE -AE_TOT)
       XDIV=100
     ENDIF

     x3_stdM[4,xlp]= INT(x3_stdM[3,xlp] *(1+x3_stdERR[1,xlp])  * XDIV)/XDIV
     x3_stdM[5,xlp]= INT(x3_stdM[3,xlp] *(1-x3_stdERR[1,xlp])  * XDIV)/XDIV

  next
  GOTO	70    &&殘留率
  for xlp=1  to    x3_tottype
     xc=alltrim(str(xlp,2,0))
     x3_stdERR[2,xlp]=PA&XC /1000
  next
  DSP_STDM(@X3_STDM,x3_ratno,@x3_stdERR,@X3_TITL,x3_ys,x3_xs)
  SET_ACTW(@X3_STDM,x3_ratno,@x3_stdERR,@X3_TITL,x3_ys,x3_xs,6,3)
  sele	&x3_wno
RETU
**-----------------------------------------------------------------------------
FUNCTION dsp_stdM
PARAMETERS  x4_stdM,x4_ratno,X4_STDERR,X4_TITL,x4_ys,x4_xs
set  colo  to	w+ /bl
x4_tP =gs_tot+uwc_tot
@ x4_ys+1,x4_xs   say "<配比重量>  配比NO.:               "
@ x4_ys+1,x4_xs+21   say    X4_RATNO

@ x4_ys+3,x4_xs   say "<含水率％> "
@ x4_ys+5,x4_xs   say "<誤差率％> "
@ x4_ys+7,x4_xs   say "<殘留％> "
@ x4_ys+9,x4_xs   say "<最大值 /最小值 (kG) > "
@ x4_ys+12,x4_xs  say "<實際值> "

  for xlp4=1  to  X4_TP
    @ x4_ys,X4_TITL[3,XLP4]  SAY  X4_TITL[1,XLP4]
  NEXT
  set  colo  to   w+ /N
  for xlp4=1  to  X4_TP
    XPICT=X4_TITL[2,XLP4]
    IF EMPTY(XPICT)=.T.
      XPICT="999"
    ENDIF
    @ x4_ys+2,X4_TITL[3,XLP4]  SAY  X4_STDM[1,XLP4]  PICT "&XPICT"
  NEXT
  for xlp4=1  to  GS_TOT
    XPICT="99"
    @ x4_ys+4,X4_TITL[3,XLP4]  SAY  X4_STDM[2,XLP4] *100  PICT "&XPICT"
  NEXT

  for xlp4=1  to  X4_TP
    XPICT="99.9"
    @ x4_ys+6,X4_TITL[3,XLP4]  SAY  X4_STDERR[1,XLP4] *100  PICT "&XPICT"
    @ x4_ys+8,X4_TITL[3,XLP4]  SAY  X4_STDERR[2,XLP4] *100  PICT "&XPICT"
  NEXT
  for xlp4=1  to  X4_TP
    XPICT=X4_TITL[2,XLP4]
    IF EMPTY(XPICT)=.T.
      XPICT="999"
    ENDIF
    IF X4_STDM[4,XLP4]>0
      @ x4_ys+10,X4_TITL[3,XLP4]  SAY  X4_STDM[4,XLP4]	PICT "&XPICT"
    ENDIF
    IF X4_STDM[5,XLP4]>0
      @ x4_ys+11,X4_TITL[3,XLP4]  SAY  X4_STDM[5,XLP4]	PICT "&XPICT"
    ENDIF

  NEXT

RETU
**----------------------------------------------------------
FUNCTION SET_ACTW
PARAMETERS  x6_stdM,x6_ratno,X6_STDERR,X6_TITL,x6_ys,x6_xs,X6_POS,X6_CHK
  SET CURS On
  SET CONF  ON
  SET  ESCA  OFF
  set colo to &c7 + /&c1,N/w+
  x6_tP =gs_tot+uwc_tot
  for xlp6=1  to  X6_TP
    XPICT=X6_TITL[2,XLP6]
    IF EMPTY(XPICT)=.T.
      XPICT="999"
    ENDIF
    IF X6_STDM[X6_CHK,XLP6]>0
      @ x6_ys+13,X6_TITL[3,XLP6]  GET  X6_STDM[X6_POS,XLP6]   PICT "&XPICT"
    ENDIF
  NEXT
  READ
  SET CURS OFF
  CHK_ACTW6(@X6_STDM,x6_ratno,@x6_stdERR,@X6_TITL,x6_ys,x6_xs,6,3)
RETU
**----------------------------------------------------------
FUNCTION CHK_ACTW6
PARAMETERS  x7_stdM,x7_ratno,X7_STDERR,X7_TITL,x7_ys,x7_xs,X7_POS,X7_CHK
  set colo to &c7 + /&c1,N/w+
  x7_tP =gs_tot+uwc_tot
  for xlp7=1  to  X7_TP
    XPICT=X7_TITL[2,XLP7]
    IF EMPTY(XPICT)=.T.
      XPICT="999"
    ENDIF
    IF X7_STDM[3,XLP7]>0
      IF (X7_STDM[6,XLP7]>X7_STDM[4,XLP7]) .OR.  (X7_STDM[6,XLP7]<X7_STDM[5,XLP7])
	set colo to R + /&c1,N/w+
      ELSE
	set colo to &c7 + /&c1,N/w+
      ENDIF
      @ x7_ys+13,X7_TITL[3,XLP7]  SAY  X7_STDM[X7_POS,XLP7]   PICT "&XPICT"
    ENDIF
  NEXT
  set colo to &c7 + /&c1,N/w+
RETU
**----------------------------------------------------------
FUNCTION PNT_ACTW
PARAMETERS  x8_stdM,X8_STDERR,X8_TITL,x8_tot,X8_VUSE
  L_PRESS=3
  XWATER_TOT=0
  FOR XLOOP=1  TO   GS_TOT+UWC_TOT
     X8_STDM[7,XLOOP]=0
  NEXT
  XWATER_TOT=0
  FOR XLOOP=GS_TOT+1  TO   GS_TOT+WATER_TOT
      XWATER_TOT=XWATER_TOT+x8_stdM[1,XLOOP]
  NEXT
  XWATER_STD=x8_stdM[3,GS_TOT+1 ]
  XWATER_ACT=x8_stdM[6,GS_TOT+1 ]
  FOR XLOOP=GS_TOT+1  TO   GS_TOT+WATER_TOT
      IF  XWATER_TOT>0
	x8_stdM[3,XLOOP]=XWATER_STD * x8_stdM[1,XLOOP]/XWATER_TOT
	x8_stdM[6,XLOOP]=XWATER_ACT * x8_stdM[1,XLOOP]/XWATER_TOT
      ENDIF
  NEXT
  get_tit_d2(@_tot_d_a)
  PNT_TITa_p(SA_date,@_tot_d_a)
  XA_STPN=1
  X_STORTIME=SA_TIME
  XA_TOTS=FTIMETON(SA_TIME )
  MP2_B(@X8_STDM,@x8_stdERR,@X8_TITL,@A_PRESS_N0,L_PRESS,X8_VUSE)
  X_NEXTADJ=0
  x8TOTWACT :=ARRAy(kind)
  for  x8_loop1=1  to  kind
       x8TOTWACT[x8_loop1]=0
  next
  DO WHILE (A_PRESS_N0[l_press,xa_stpn,1,5]>0)
     *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     IF  X_NEXTADJ=0
       X_NEXTADJ=CAL_W3(XA_STPN,@A_PRESS_N0,L_PRESS,@x8_stdERR,@X8_STDM,XWATER_TOT,@X8TOTWACT)
     ELSE
       X_NEXTADJ=0
     ENDIF
     pnt_produce(XA_STPN,X_STORTIME,XMIX_SEC,A_PRESS_N0,0)
     XSAVE=0
     IF   ((USAVE="Y") .OR. (USAVE="y"))
       SAVE_produce1(XA_STPN,X_STORTIME,XMIX_SEC,A_PRESS_N0,_TOT_D_A,SA_DATE)
       XSAVE=1
     ENDIF
     *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     pnt_remains(l_press,xa_stpn,A_PRESS_N0,0,XSAVE,X8TOTWACT )
     xA_SEC=get_rand(10,1,1,1,1)
     Xa_TOTS=Xa_TOTS+PMIXOP+XMIX_SEC
     X_STORTIME=Fntotime(0,0,0,xa_tots)
     XA_STPN=XA_STPN+1
     IF   ((USAVE="Y") .OR. (USAVE="y"))
       IF  (A_PRESS_N0[l_press,xa_stpn,1,5]=0)
	 *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 SAVE_SADBF(XA_STPN-1,X_STORTIME,XMIX_SEC,A_PRESS_N0,_TOT_D_A,SA_DATE,X8TOTWACT)
       ENDIF
     ENDIF
  ENDDO



  L_PRESS=2

RETU

**--------------------------------------------------------------------------
FUNCTION    get_tit_d2
PARAMETERS  p_tot_d
xpn=1
p_tot_d[20,4]=xpn
xpn=xpn+2
p_tot_d[2,xpn]=alltrim(Xscano)
p_tot_d[3,xpn]=alltrim(Xus2_1)
p_tot_d[12,xpn]=XSTRO
p_tot_d[13,xpn]=alltrim(Xcarno)
p_tot_d[14,xpn]=XTando
p_tot_d[16,xpn]=alltrim(Xus2)
p_tot_d[18,xpn]=alltrim(Xratno)
p_tot_d[22,xpn]=alltrim(XADDR_NO)
retu
*------------------------------------------------------------------------------------------
**-----------------------------------------------------------------------------
PROCEDURE  MP2_B
PARAMETERS  x9_stdM,X9_STDERR,X9_TITL,X9_PRESS,x9_LPRESS,X9_VUSE

FILL_A_D4(@x9_PRESS,3,1,dimb_len,kind,11,0)
SELE 8
MX=INT((X9_VUSE+0.4)*2)*.5
LOCA FOR (MLAV=RATVOL) .AND.(MLMV=MX)
Xfinish=0
xseekok=0
IF   .NOT. EOF()
  xseekok=1
endif
  MX="1"
  MLA_LAG=0
  DO WHILE Xfinish=0
     if  Xseekok=1
       if  MLA&MX >0
	 IF MLMV_1 > MLA_LAG
	   LVUSE=MLA&MX
	 ELSE
	   LVUSE=X9_VUSE -MLA_LAG
	   Xfinish=1
	 ENDIF
       else
	 LVUSE=0
	 Xfinish=1
       ENDIF
     else
       IF (X9_VUSE-MLA_LAG)>  RATVOL
	  LVUSE=RATVOL
       ELSE
	  LVUSE= X9_VUSE-MLA_LAG
	  Xfinish=1
       ENDIF
     endif
    XM_PLUS=0
    X9_WADJ=0
    MLA_LAG=MLA_LAG+LVUSE
    FOR XNP=1  TO  GS_TOT+UWC_TOT
      XNPC=LTRIM(STR(INT(XNP),2,0))
      x9_press[X9_LPRESS,VAL(MX),XNP,1] :=X9_STDM[1,XNP] * LVUSE
      X9ADJ=x9_press[X9_LPRESS,VAL(MX),XNP,1]	*  X9_STDM[2,XNP]
      IF (XNP >GS_TOT)
	X9ADJ=0
      ENDIF
      X9_WADJ=X9_WADJ +X9ADJ
      x9_press[X9_LPRESS,VAL(MX),XNP,2] := X9ADJ
      x9_press[X9_LPRESS,VAL(MX),XNP,3] := 0
      x9_press[X9_LPRESS,VAL(MX),XNP,4] := 0
      x9_press[X9_LPRESS,VAL(MX),XNP,5] := LVUSE
      x9_press[X9_LPRESS,VAL(MX),XNP,6] := MLA_LAG
    NEXT
    XWATERT0=0
    FOR XLP9=(GS_TOT+1) TO (GS_TOT+ WATER_TOT)
      XWATERT0=XWATERT0+x9_press[X9_LPRESS,VAL(MX),XLP9,1]
    NEXT
    XWATERT0=-XWATERT0
    IF XWATERT0 <>0
      FOR XLP9=GS_TOT+1  TO GS_TOT+ WATER_TOT
	x9_press[X9_LPRESS,VAL(MX),XLP9,2]=X9_WADJ * x9_press[X9_LPRESS,VAL(MX),XLP9,1]/XWATERT0
      NEXT
    ENDIF
    MX=LTRIM(STR(INT(VAL(MX)+1),2,0))
  ENDDO
  x9_press[X9_LPRESS,VAL(MX),1,5] := 0
  x9_press[X9_LPRESS,VAL(MX),1,6] := 0
RETU
**-------------------------------------------------------------------------------
FUNCTION  CAL_W3
PARAMETERS XB_STPN,XB_PRESS,XB_POS,XB_STDERR,XB_STDM,XB_WATER_TOT,XB_TOTWACT
  xB_LAST=gs_tot+uwc_tot-ae_tot
  XB_NEXT=0
  XWTOT=0
  FOR XB_LOOP1 =1 TO   GS_TOT+UWC_TOT
    XB_TOTWACT[xb_loop1]=0
    Xw0=(XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1]+XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2])
    XN3=XB_STDERR[2,XB_loop1]
    *SELE 5
    *GOTO 70
    XN12=0
     XN12=XB_STDERR[2,XB_LOOP1]
       if XB_loop1 > XB_last
	  XB_amp=100
	  XB_div=100
       else
	  XB_amp=1
	  XB_div=1
       endif
       XB_w=get_rand(xw0,xn12,XB_amp,XB_div,1)
       XB_PRESS[XB_POS,XB_STPN,XB_loop1,12]=XB_w
       Xw0=(XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,1]+XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,2])
       XB_w=get_rand(xw0,xn12,XB_amp,XB_div,1)
       XB_PRESS[XB_POS,XB_STPN+1,XB_loop1,12]=XB_w
       XVUSE_X=XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,5]
       XB_ERR=(XB_STDM[6,XB_LOOP1]-XB_STDM[3,XB_LOOP1])/XB_STDM[3,XB_LOOP1]
       IF  XVUSE_X>0
	   XB_NEXT=1
	   *XB_ERR=(XB_STDM[6,XB_LOOP1]-XB_STDM[3,XB_LOOP1])/XB_STDM[3,XB_LOOP1]
	   IF ABS(XB_ERR)>=XB_STDERR[1,XB_LOOP1]
	     XN3= 0.002
	     xw0=XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2]
	     XB_w0=get_rand(xw0,xn3,XB_amp,XB_div,2)
	     XB_W1=INT((xw0 * (XB_STDERR[1,XB_LOOP1]-0.0025 ) *XB_AMP))/XB_AMP
	     XB_W2=Xw0+((XB_W0 +XB_W1) *abs(XB_ERR)/XB_ERR)
	     XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +xb_w2
	     XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,4]=XB_W2	+ XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,12]
	     XN3= 0.002
	     xw0=XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,2]
	     XB_w0=get_rand(xw0,xn3,XB_amp,XB_div,2)
	     XB_W1=INT((xw0 * (XB_STDERR[1,XB_LOOP1]-0.0025 ) *XB_AMP))/XB_AMP
	     XB_W2=Xw0+((XB_W0 +XB_W1) *abs(XB_ERR)/XB_ERR)
	     XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +xb_w2
	     XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,4]=XB_W2  + XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,12]

	     if XB_PRESS[XB_POS,XB_STPN+2,XB_LOOP1,5]=0
	       XB_TOTWACT[XB_LOOP1]=XB_STDM[6,XB_LOOP1]
	      endif

	   ELSE
	     XN3= XB_STDERR[1,XB_LOOP1]-ABS(XB_ERR)
	     IF   XVUSE_X > XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,5]
	       XW0=XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1] + XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2]
	       XB_w0=get_rand(xw0,xn3,XB_amp,XB_div,2)
	       XB_W1=INT((XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1]+XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2] )* XB_ERR *XB_AMP)/XB_AMP
	       XB_W2=XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2]+XB_W0 +XB_W1
	       XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +xb_w2
	       XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,4]=XB_W2  + XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,12]

	       if XB_PRESS[XB_POS,XB_STPN+2,XB_LOOP1,5]>0
		 Xw0=XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,1]
		 xw0=xw0 +XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2] +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,2]
		 XB_W1= INT(XW0* XB_ERR *XB_AMP)/XB_AMP

		 XB_W2=xw0 +XB_W1 -XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,4]+XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,12]
	       else
		  XB_W2 =XB_STDM[6,XB_LOOP1]-XB_STDM[7,XB_LOOP1]+XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,12]
	       endif
	       XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,4]=XB_W2 +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,12]
	       XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +XB_w2
	     ELSE
	       XW0=XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,1] + XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,2]
	       XB_w0=get_rand(xw0,xn3,XB_amp,XB_div,2)
	       XB_W1=INT(XW0* XB_ERR *XB_AMP)/XB_AMP
	       XB_W2=XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,2] +XB_W0 +XB_W1
	       XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,4]=XB_W2  + XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,12]
	       XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +xb_w2

	       if XB_PRESS[XB_POS,XB_STPN+2,XB_LOOP1,5]>0
		 Xw0=XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,1]
		 xw0=xw0 +XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2] +XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,2]
		 XB_W1= INT(XW0* XB_ERR *XB_AMP)/XB_AMP
		 XB_W2=xw0 +XB_W1 -XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,4]+XB_PRESS[XB_POS,XB_STPN+1,XB_LOOP1,12]
	       else
		 XB_W2 =XB_STDM[6,XB_LOOP1]-XB_STDM[7,XB_LOOP1]
	       endif
	       XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,4]=XB_W2 +XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,12]
	       XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +xb_w2
	     ENDIF
	   ENDIF

       ELSE
	 * IF ((XLOOP1 >GS_TOT)  .AND. (XLOOP1	<=GS_TOT+WATER_TOT) )
	 *  XNB=0
	 *  IF XB_WATER_TOT>0
	 *     XNB=XB_STDM[6,XB_LOOP1]	*XB_STDM[1,XB_LOOP1]	/ XB_WATER_TOT
	 *  ENDIF
	 * ELSE
	 *    XNB=XB_STDM[6,XB_LOOP1]
	 * ENDIF
	 IF ABS(XB_ERR)>=XB_STDERR[1,XB_LOOP1]
	     xw0=XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,1] +XB_PRESS[XB_POS,XB_STPN,XB_LOOP1,2]

	     XB_W2=INT(xw0 * (1+ ((XB_STDERR[1,XB_LOOP1]-0.001) *abs(xb_err)/xb_err)) *XB_AMP)/XB_AMP
	     XB_PRESS[XB_POS,XB_STPN,XB_loop1,4]=xb_w2 +XB_PRESS[XB_POS,XB_STPN,XB_loop1,12]
	     XB_TOTWACT[XB_LOOP1]=XB_STDM[6,XB_LOOP1]
	 else
	   xb_w2=XB_STDM[6,XB_LOOP1]+ - XB_STDM[7,XB_LOOP1]
	   XB_PRESS[XB_POS,XB_STPN,XB_loop1,4]=xb_w2 + XB_PRESS[XB_POS,XB_STPN,XB_loop1,12]
	 endif
	 XB_STDM[7,XB_LOOP1] =XB_STDM[7,XB_LOOP1] +XB_PRESS[XB_POS,XB_STPN,XB_loop1,4]
       ENDIF

  NEXT
RETU  XB_NEXT
**-----------------------------------------------------------------------------
PROCEDURE  RST_FUNC1
PARAMETERS  P1,P2,P3
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13,P_FUNC14,P_FUNC15,P_FUNC16
*TOR " " TO ARRTIT0,ARRTIT1,DEL_FUNC
*STOR " "  TO C_TOP1,C_TOP2,F3_FUNC,F7_FUNC,F8_FUNC
*ARRWID :={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
retu
**-----------------------------------------------------------------------------
FUNCTION  get_RAND_ERR	&& 誤差率 + or -
PARAMETERS  xstd,xpercerr,xdecm,isPlus
  if empty(isPlus)
     isPlus=0
  endif
  d_retu=0
  if  xpercerr>0
    D_RETU=0
    IF XSTD >0
      INDEX=1
      IF  VAL(XDECM)-INT(VAL(XDECM))>0
	INDEX=100
      ENDIF
      xerrMAX=INT(xstd	* xpercerr * INDEX)
      RNDX=int(SECONDS()*100  * RAND())
      IF isPlus=1
	D_RETU= MOD(RNDX,xerrMAX +1)
      else
	D_RETU=- xerrMAX + MOD(RNDX,(xerrMAX * 2) +1)
      endif
      D_RETU=D_RETU /INDEX
    ENDIF
  endif
retu d_retu

**------------------------------------------------------------------------------------------------------------
PROCEDURE  TANKSTPAU  &&¥þ¤W
PARAMETERS  P1,P2,P3
DO CASE
CASE   TANKSTP=0
  STORTIME=TIME()
  IF (KOT=1).AND. (DIN(12)=1) .AND. (DIN(15)=1)
    TANKSTP=-1
    UPOV=0
    DNOV=0
    FOR XF=1 TO (GS_TOT+UWC_TOT)
      IF  TIME1[XF,1] =88
	 if STP_A[XF] <>7
	   TANKSTP=0
	   RETU
	 ENDIF
      ENDIF


      IF (stp_a[gs_tot]<>4)
	  TANKSTP=0
	  RETU
      endif
      IF (WTANK_F[XF,1]<>1)
	IF (TIME1[XF,1] <>88)
	  TANKSTP=0
	  RETU
	ELSE
	  IF WTANK_F[XF,1]=77
	    TANKSTP=0
	    RETU
	  ENDIF
	ENDIF
      ENDIF
    NEXT

    &&V15T
    FOR XF=1 TO (GS_TOT+UWC_TOT)
      cXF=alltrim(str(XF,2,0))
      xtmpwt5=A_PRESS_N0[L_PRESS,STPN&cXF,XF,5]
      xtmpwt6=A_PRESS_N0[L_PRESS,STPN&cXF,XF,6]
      A_PRESS_N0[L_PRESS,STPN&cXF,XF,6]:= xtmpwt6 +xtmpwt5
    next


  ENDIF
CASE   TANKSTP=-1
  IF DIN(9)=1
    SET COLOR TO  R   / &C1
    @ 18,40 SAY "úLúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúO "
    IF DIN(9)=1
      @ 18,52	SAY "ûÖ"
    ENDIF
    SET COLOR TO &C7 +/ &C1
    RETU
  ENDIF
  IF  (MIX_ERR=1)
      SET COLOR TO  R+	/ &C1
      @ 18,40 SAY "úLúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúO "
      IF DIN(9)=1
	@ 18,52   SAY "ûÖ"
      ENDIF
      SET COLOR TO &C7 +/ &C1
      RETU
  ENDIF
  UPOV=1
  DNOV=1
    FOR  I=1  TO  Uwc_tot +gs_tot
      if TIME1[i,1] <> 88
	WTANK_F[I,1] :=-99
	WTANK_F[I,2] :=-99
      ENDIF
    NEXT
   * IF LAGDATE=DATE()
   *   LAGW=LAGW+ A_PRESS_N0[U_PRESS,stpn1,1,5]
   * ELSE
   *   LAGW=VUSE
   *   LAGDATE=DATE()
   * ENDIF
    SAVE TO LAGDATA9 ALL LIKE LAG*
    @ 0,26 SAY	LAGW   PICT  "9999.9"
    ACT_V  = A_PRESS_N0[U_PRESS,stpn6,6,6]    &&4/6/2004
    @ 17,12 SAY  A_PRESS_N0[U_PRESS,stpn1,1,6]	PICT  "999.9"
      X=_Tot_d_a[20,4] +2
      @ 15,12 say _Tot_d_a[18,X]
      @ 16,12 say _Tot_d_a[10,X]  PICT	"999.9"
      IF STPN1=1 .AND.	F3_RUN=0
	&& @ 23,13 SAY ASCANO  PICT "99999"
	&& @ 23,25 SAY ACARNO
	&& @ 23,42 SAY ARATNO  PICT "9999"
	&& @ 23,52 SAY AVUSE   PICT "99.9"
	&& @ 23,61 SAY ATANDO  PICT "9999"
	&& @ 23,75 SAY ACALW_REP  PICT "99"

	do DSP_aRecipe
	&& @ 23,PX_SCANO  SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-SCANO_LEN,SCANO_LEN)
	&& @ 23,24 SAY ACARNO
	&& @ 23,37 SAY ARATNO
	&& @ 23,52 SAY AVUSE   PICT "99.9"
	&& @ 23,61 SAY ATANDO  PICT "9999"
	IF WASTE <>1
	  @ 23,75 SAY ACALW_REP  PICT "99"
	ENDIF




	E_STORE = 1
	X=_TOT_D_A[20,4] +2
	IF EMPTY(_TOT_D_A[2,X])=.T.
	  E_STORE = 0
	ENDIF
	IF  E_STORE =1

	   &&V15T
	   && DO  PNT_TIT
	ENDIF
      ENDIF
  TANKSTP=1
  UPTKSTP=61
  Xcn1=ALLTRIM(STR(GS_TOT+1,2,0))
  XWSTPN=    STPN&xcn1
  A_STOR_1(@A_PRESS_N0,XWSTPN,1,GS_TOT+UWC_TOT)
ENDCASE

**-----------------------------------------------------------------------------
PROCEDURE  STPSTARN
PARAMETERS  P1,P2,P3
IF   (AVUSE<>0) .AND. (LAST_PCS=1) .AND. (ALLTRIM(ARATNO) <>"0" ) .AND. (EMPTY(ALLTRIM(ARATNO))=.F. ) .AND.  (nextOK1=0 )  .and. (_tot_d_a[20,3]=0  .or.  _tot_d_a[20,4]=0 )
  xtmp_vu=AVUSE
  GET_DATA(1)
  IF DISCVOL >0
    IF xtmp_vu > 5
      FOR XPAN=1  TO 20
	IF  A_PRESS_N0[1,XPAN,1,5]=0
	  EXIT
	ELSE
	  FOR X=1  TO kind
	    DISAA=DISCVOL   /xtmp_vu
	    A_PRESS_N0[1,XPAN,X,1]=A_PRESS_N0[1,XPAN,X,1]  * (1-DISAA)
	  NEXT
	ENDIF
      NEXT
    ENDIF
  ENDIF
  L_PRESS=2
  U_PRESS=2
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION _SEND_D
PARAMETERS  _SLN,SD0,SD1,SD2,SD3,SD4,SD5,SD6,SD7,SD8,SD9,SD10
DO CASE
CASE _SLN=0
  X=CHR(2)+CHR(32)+SUBSTR(DTOC(SD0),7,2)+SUBSTR(DTOC(SD0),1,2)+SUBSTR(DTOC(SD0),4,2)
  X=X+CHR(32)+_NTO00C(SD1,4,0)
CASE _SLN=1
  X=CHR(32)+SD0
  X=X+CHR(32)+_NTO00C(SD1,5,0)+CHR(32)+_NTO00C(SD2,5,0)+CHR(32)+_NTO00C(SD3,5,0)+CHR(32)+_NTO00C(SD4,5,0)+CHR(32)+_NTO00C(SD5,5,0)+CHR(32)+_NTO00C(SD6,5,0)
  X=X+CHR(32)+_NTO00C(SD7,5,0)+CHR(32)+_NTO00C(SD8,6,2)+CHR(32)+_NTO00C(SD9,6,2)
CASE _SLN=2
  X=CHR(32)+_NTO00C(SD0,4,1)
  X=X+CHR(32)+_NTO00C(SD1,5,0)+CHR(32)+_NTO00C(SD2,5,0)+CHR(32)+_NTO00C(SD3,5,0)+CHR(32)+_NTO00C(SD4,5,0)+CHR(32)+_NTO00C(SD5,5,0)+CHR(32)+_NTO00C(SD6,5,0)
  X=X+CHR(32)+_NTO00C(SD7,5,0)+CHR(32)+_NTO00C(SD8,5,0)+CHR(32)+_NTO00C(SD9,6,2)+CHR(32)+_NTO00C(SD10,5,0)
CASE _SLN=3
  X=CHR(10)+CHR(32)
  X=X+_NTO00C(SD0,5,0)+CHR(32)+_NTO00C(SD1,5,0)+CHR(32)+_NTO00C(SD2,5,0)+CHR(32)+_NTO00C(SD3,5,0)+CHR(32)+_NTO00C(SD4,5,0)+CHR(32)+_NTO00C(SD5,5,0)+CHR(32)+_NTO00C(SD6,5,0)
  X=X+CHR(32)+_NTO00C(SD7,6,2)+CHR(32)+_NTO00C(SD8,5,0) +CHR(32)+_NTO00C(SD9,5,0)+CHR(13)
ENDCASE
XN_L=LEN(X)
FOR XN=1 TO XN_L
  XC=SUBSTR(X,XN,1)
  A=COM_WRITE(0,XC)
NEXT
RETU
**-----------------------------------------------------------------------------
PROCEDURE  REP_77  &&ANYWHERE
PARAMETERS  P1,P2,P3
REP_XN=_TOT_D_A[20,4] +2

s_date= _TOT_D_A[1,REP_XN]
IF  C_MINK<>0
  X_DA=_TOT_D_A[1,REP_XN]
  x_blk=space(c_mink)
  _TOT_D_A[1,REP_XN] := ALLTRIM(STR(YEAR(X_DA)-1911,4,0))  + x_blk + SUBSTR(DTOC(X_DA),1,2)+ x_blk  +SUBSTR(DTOC(X_DA),4,2)
ENDIF
  _TOT_D_A[24,REP_XN] :=0
IF   _TOT_D_A[10,REP_XN]>0
  _TOT_D_A[24,REP_XN] :=INT((_TOT_D_A[7,REP_XN]  /_TOT_D_A[10,REP_XN]) +0.5)
ENDIF
IF C_TIME >0
  X_DA=_TOT_D_A[8,REP_XN]
  x_blk=space(INT(c_TIME/10))
  _TOT_D_A[8,REP_XN] :=SUBSTR(X_DA,1,2) + x_blk + SUBSTR(X_DA,4,2)
  IF MOD(C_TIME,10) >0
    x_blk=space(MOD(c_TIME,10))
    _TOT_D_A[8,REP_XN] :=  _TOT_D_A[8,REP_XN]  + X_BLK	 +  SUBSTR(X_DA,7,2)
  ENDIF
ENDIF
TEMP_A :=ACLONE(_TOT_D_A)
ASORT(TEMP_A,1,24,{|X,Y| X[1] <= Y[1]})
    *@ PROW(),3 say "~y3" + chr(27) + chr(67) + chr(21) + ";"
    *@ PROW(),2  SAY  "~W5y3" + CHR(27)+"C"+CHR(P_LENGTH) + ";"  &&PRINT PAPER LENGTH  SET TO LINE  33 LINE
    *FSetToPNT(bport,"~IXW5~y3" + CHR(27)+"C"+CHR(P_LENGTH))
*FSetToPNT(bport,"~IX15;")
*FSetToPrinter(bport)
*@ PROW(),2  SAY  "~y3" + CHR(27)+"C"+CHR(P_LENGTH)   &&PRINT PAPER LENGTH  SET TO LINE  33 LINE
@ PROW(),2  SAY   "~y3"+CHR(27)+"C"+CHR(P_LENGTH)+";"  &&PRINT PAPER LENGTH  SET TO LINE  33 LINE
x_plus=0
*INI_PNTER(BPORT,@x_plus)
*if x_plus  >0
*  @ PROW()+x_plus,2  SAY   " "
*endif
SETPRC(0,PCOL())
@ PROW()+1,2  SAY   " "

      *@ PROW()+1,1  SAY  "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
XZ=_TOT_D_A[20,4] +2
REP_2N=_TOT_D_A[20,2]
REP_XN=_TOT_D_A[20,4] +2
X_REPN=1
DO WHILE  X_REPN <=24
  &&IF X_REPN =19
  &&   X_REPN =24
  &&ENDIF
  do while  TEMP_A[X_REPN,1] <=0
    X_REPN=X_REPN +1
  ENDdo
  IF   X_REPN <=24
    if VALTYPE(TEMP_A[X_REPN,REP_XN]) ="C"
      IF  TEMP_A[X_REPN,1] <>0
	@ TEMP_A[X_REPN,1]+x_plus,TEMP_A[X_REPN,2]  SAY    ALLTRIM(TEMP_A[X_REPN,REP_XN])
      ENDIF
    ELSE
      rep_2c=TEMP_A[X_REPN,5]
	IF  TEMP_A[X_REPN,1] <>0
	  @ TEMP_A[X_REPN,1]+x_plus,TEMP_A[X_REPN,2]  SAY    TEMP_A[X_REPN,REP_XN]   PICT   "&REP_2C"
	endif
    ENDIF
    X_REPN=X_REPN +1
  ENDIF
ENDDO
_TOT_D_A[1,REP_XN] :=s_date
      *@ prow()+1,1 say " "
EJECT
SET CONS On
fport=aport
do case
case fport="1"
  set print to lpt1
  ? chr(27) + "SP1;"
case fport="2"
  set print to lpt2
  ? chr(27) + "SP2;"
case fport="3"
  set print to lpt3
  ? chr(27) + "SP3;"
endcase
SET CONS On

RETU
**-----------------------------------------------------------------------------
FUNCTION   SET_LAST_PCS
PARAMETERS  INDEX_CH,last_p
if kot=0
  IF (NEXTOK1=0 ) .and.  (last_p =0)
    IF GS_TOT >= INDEX_CH
      LAST_PCS=1
    ENDIF
  ENDIF
else
  LAST_PCS=1
  for xloop=1  to  (GS_TOT +UWC_TOT)
    if stp_a[xloop]>0
      LAST_PCS=0
    endif

  next
endif
RETU
**------------------`----------------------------------------------------------

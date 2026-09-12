**-----------------------------------------------------------------------------

&& #define   _dfTansAct 1
&& FUNCTION   CAL_DEC	A_M_NAME[X,3] =99.99
&& FUNCTION   getData_DEC   A_M_NAME[X,3] =99.99
&& FUNCTION   getData_PW   A_M_NAME[X,3] =99.99
**-----------------------------------------------------------------------------



#INCLUDE "SIO_TXT.CH"
#INCLUDE "T15_COM.H"
**-----------------------------------------------------------------------------
FUNCTION GET_MIX_DATA
PARAMETERS  _ARATNO,_AVUSE,STOR_A
   xd_wno=fSelectNo()
   ISSEEK=0
   X_RET=""
   ISSEEK= fseek_C(2,"RATNO",_ARATNO,"RATNO",@X_RET)
   IF ISSEEK >0
       X_OK=0
      IF AUTOR =1
	  SELE 8
	  MX=INT((_AVUSE+0.4)*2)*.5
	  LOCA FOR (MLAV=RATVOL) .AND.(MLMV=MX)
	  IF   .NOT. EOF()
	    X_OK=1
	    IF _AVUSE >MLA1
	      STOR_A[GS_TOT +UWC_TOT +1]=MLA1
	ELSE
	      STOR_A[GS_TOT +UWC_TOT +1]=_AVUSE
	    ENDIF
	  ENDIF
      ENDIF
      IF (AUTOR =0) .OR.  (X_OK=0)
	 IF _AVUSE > RATVOL
	     STOR_A[GS_TOT +UWC_TOT +1]=RATVOL
	 ELSE
	     STOR_A[GS_TOT +UWC_TOT +1]=_AVUSE
	 ENDIF
      ENDIF
      sele 2
      goto isseek
      FOR XLOOP=1  TO	GS_TOT+ UWC_TOT
	 ICX=ALLTRIM(STR(XLOOP,2,0))
	 STOR_A[XLOOP]= M&ICX  *  STOR_A[GS_TOT +UWC_TOT +1]
      NEXT
   ENDIF
   sele &xd_wno
RETU   ISSEEK
**-----------------------------------------------------------------------------
FUNCTION GET_DATA
PARAMETERS  GD_PRESS
xd_wno=fSelectNo()
SELE 2
LOCA FOR ALLTRIM(RATNO)==ALLTRIM(ARATNO)
IF .NOT. EOF()
  *IF  (KOT=1 )  .AND.	 COM_E=1
  IF	COM_E=1
     if (empty(Aus2)=.f.)  .AND. (AVUSE>0)
       _XUS3=0
       _LAG_LAG=0
       _LAG_CAR=0
       IS_SEEK=fseek_2C(14,"LAG_NA_NO",alltrim(Aus2),"LAG_ADDR_NO",alltrim(A_ADDR_NO),"LAG_LAG","LAG_CAR",@_LAG_LAG,@_LAG_CAR)
       XUS3=xvuse
       XTOT_CAR=1
       SELE 14
       IF IS_SEEK <0
	 APPE  BLANK
	 REPL LAG_NA_NO WITH AUS2,LAG_NAME WITH AUS2_1,LAG_ADDR_NO WITH A_ADDR_NO,LAG_ADDR WITH AUS2_2
       ENDIF
       REPL LAG_DATE WITH DATE(),LAG_LAG WITH AUS3,LAG_CAR WITH ATOT_CAR
     endIf
    SELE 2
  ENDIF

  LAST_PCS=0
  IF WASTE <>1
    @ 23,75 SAY ACALW_REP  PICT "99"
  ENDIF
  ACALW_REP=ACALW_REP-1
  IF  ACALW_REP <0
    ACALW_REP=0
  ENDIF
  NEXTOK1=1
  LAST_PCS=0
  NSCANO1=ASCANO
  VUSE=AVUSE
  RATNO=ARATNO
  CARNO=ACARNO
  TANDO=ATANDO
  FILL_A_D4(A_PRESS_N0,1,1,21,kind,11,0)
  FILL_A_D2(A_PRESS_N1,GD_PRESS,GD_PRESS,18,0)
  FILL_A_D4(A_PRESS_B0,1,1,21,kind,11,0)
  A_PRESS_N1[GD_PRESS,13] :=RATVOL
  A_PRESS_N1[GD_PRESS,15] :=VUSE
  FOR IX=1 TO kind
    A_PRESS_N0[1,21,IX,1] :=77
    A_PRESS_N0[1,21,IX,2] :=RATNO
  NEXT

  &&v15t

  DO MP1T
  && IF AUTOR =0
  &&   DO MP1
  && ELSE
  &&   DO MP1_1
  && ENDIF
  actx=0
  FOR I=1  TO GS_TOT +UWC_TOT
    ic=ltrim(str(i,2,0))
    if (stp_a[i] > 0)
      actx=1
      exit
    endif
  NEXT
  MX=1
  WHILE  A_PRESS_N0[GD_PRESS,MX,1,5] >0
    FOR I=1  TO GS_TOT +UWC_TOT
      IC_X=ALLTRIM(STR(I,2,0))
      X0= A_PRESS_N0[GD_PRESS,MX,I,1]
      A_PRESS_N0[GD_PRESS,MX,I,8] := X0
      IF MX=1
	if( actx=0  .and.  lchtype=6)
	   SET COLOR TO gr+/ &C1
	   XMC_F=A_M_NAME[i,3]
	   @ A_M_NAME[I,23],A_M_NAME[I,13]  SAY  x0  PICT "&XMC_F"
	   SET COLOR TO &C7 +/ &C1
	endif
      endif
    NEXT
    MX=MX+1
  ENDDO
  IF W0DBF=1
    SELE 17
    LOCA FOR ALLTRIM(RATNO)==ALLTRIM(ARATNO)
    IF	(.NOT. EOF()   .AND.  ((W0_EN=1)    .or.  (DIN(6)=1)) )
      MX=1
      wwic=ALLTRIM(STR(gs_tot+uwc_tot+1,2,0))
      WHILE  A_PRESS_N0[GD_PRESS,MX,1,5] >0
	FOR I=1  TO GS_TOT +UWC_TOT
	  IC_X=ALLTRIM(STR(I,2,0))
	  X0= A_PRESS_N0[GD_PRESS,MX,I,1]
	  X1= A_PRESS_N0[GD_PRESS,MX,I,5] * M&IC_X
	  A_PRESS_N0[GD_PRESS,MX,I,1] := X1
	  *if (waste=1)
	  *  if (I=GS_TOT +WATER_TOT)
	  *    A_PRESS_N0[GD_PRESS,MX,GS_TOT+UWC_TOT+1,1] :=0
	  *	if (WEIGHT_TYPE[I]=2)
	  *	  *if (A_PRESS_N0[GD_PRESS,MX,I,1]=0 )	.and. (m&wwic  >0)
	  *	  *  X1=A_PRESS_N0[GD_PRESS,MX,I-1,1]
	  *	  *  A_PRESS_N0[GD_PRESS,MX,I,1] := X1 * m&wwic/100
	  *	  *  A_PRESS_N0[GD_PRESS,MX,I-1,1] := X1-A_PRESS_N0[GD_PRESS,MX,I,1]
	  *	  *  A_PRESS_N0[GD_PRESS,MX,GS_TOT+UWC_TOT+1,1] :=1
	  *	  *endif
	  *	endif
	  *   endif
	  *endif
	  *IF  LCHTYPE=16 .or. LCHTYPE=17 .or. LCHTYPE=26  .or. UCHTYPE=19   .or. UCHTYPE=30
	    A_PRESS_B0[GD_PRESS,MX,I,1] := X1
	  *ENDIF


	NEXT
	MX=MX+1
      ENDDO
    else
      if disc2>0
	do case
	case lchtype=13
	  MX=1
	  IF A_PRESS_N0[GD_PRESS,MX,6,8] >0
	    WHILE  A_PRESS_N0[GD_PRESS,MX,1,5] >0
		XDISC=DISC2  *	A_PRESS_N0[GD_PRESS,MX,1,5]
		X0= XDISC  * A_PRESS_N0[GD_PRESS,MX,3,8]/(A_PRESS_N0[GD_PRESS,MX,3,8] +A_PRESS_N0[GD_PRESS,MX,4,8] )
		A_PRESS_N0[GD_PRESS,MX,3,1]=A_PRESS_N0[GD_PRESS,MX,3,1]  + X0
		X0= XDISC  *  A_PRESS_N0[GD_PRESS,MX,4,8]/(A_PRESS_N0[GD_PRESS,MX,3,8] +A_PRESS_N0[GD_PRESS,MX,4,8] )
		A_PRESS_N0[GD_PRESS,MX,4,1]=A_PRESS_N0[GD_PRESS,MX,4,1]  + X0
		A_PRESS_N0[GD_PRESS,MX,6,1]=A_PRESS_N0[GD_PRESS,MX,6,1]  -XDISC
	      MX=MX+1
	    ENDDO
	  ENDIF
	endcase
      ENDIF
    ENDIF
    SELE 2
  ENDIF
  SET COLOR TO GR + * / &C1
  do DSP_aRecipe
  && @ 23,PX_SCANO  SAY ASCANO
  && @ 23,24 SAY ACARNO
  && @ 23,37 SAY ARATNO
  && @ 23,52 SAY AVUSE	 PICT "99.9"
  && @ 23,61 SAY ATANDO  PICT "9999"
  SET COLOR TO &C7 +/ &C1
  &&¨®¸¹	    ACARNO
  &&ªÅ­«	    ACARW
  &&°t¤ñNO	    ARATNO
  &&¦Ì¼Æ	    AVUSE
  &&§~«×	    ATANDO
  &&«È¤áNO	    AUS2
  &&DRIVER NAME     ACARDRV
  &&²Ö­p¦Ì¼Æ	    AUS3=XU
  &&²Ö­p¨®¦¸	    ATOT_CAR
  &&«È¤á¦WºÙ	    AUS2_1
  &&°e³f¦a§}	    AUS2_2
  &&³æ»ù	    AU_PRICE
  X=_TOT_D_A[20,4]
  IF  X =0
    IF _TOT_D_A[20,3]=0
      _TOT_D_A[20,4] :=1
      X=3
    ELSE
      _TOT_D_A[20,4] := _TOT_D_A[20,3]
      X=_TOT_D_A[20,3]
      X=MOD(X,2)+1
      _TOT_D_A[20,3] :=X
      _TOT_D_A[20,4] := _TOT_D_A[20,3]
      X=X+2
    ENDIF
  ELSE
      X=_TOT_D_A[20,4]
      X=MOD(X,2)+1
      _TOT_D_A[20,3] :=X
      *_TOT_D_A[20,4] := _TOT_D_A[20,3]
      X=X+2
  ENDIF
  _TOT_D_A[20,4]=2
  _TOT_D_A[20,3]=2
  X=4
   _TOT_D_A[2,X] :=ALLTRIM(ASCANO)
   _TOT_D_A[3,X]  :=AUS2_1
   _TOT_D_A[4,X]  :=AUS2_2
   _TOT_D_A[22,X]  :=Aposition
   _TOT_D_A[5,X]  :=0
   _TOT_D_A[6,X]  :=ACARW
   _TOT_D_A[7,X]  :=0
   _TOT_D_A[8,X]  :=TIME()
   _TOT_D_A[9,X]  :=ATOT_CAR
   _TOT_D_A[10,X] :=AVUSE
   _TOT_D_A[11,X] :=AUS3
   *IF FPS=77  &&  PAR.DBF 30 PA7=77  28TH C12	STRIGHT  =XX00	LB
   *  _TOT_D_A[12,X] :=(INT(ARATNO /100) *100)
   *ELSE
     _TOT_D_A[12,X] :=S_STRO
     _TOT_D_A[14,X] :=S_TANDO
     _TOT_D_A[17,X] :=S_MAX
   *ENDIF
   _TOT_D_A[13,X] :=ACARNO
   IF ATANDO <>0
     _TOT_D_A[14,X] :=ATANDO
   ENDIF
   _TOT_D_A[15,X] :=ACARDRV
   _TOT_D_A[16,X] :=AUS2
   _TOT_D_A[18,X] :=ARATNO
   _TOT_D_A[21,X] :=AU_PRICE
   IF (EMPTY(ASCANO) <> .T.  ) .and. val(ASCANO)>10000	.AND.  LEN(ALLTRIM(ASCANO)) <10
    IF	LAG_REPNO1 <> ASCANO
      LAG_REPNO1 = ASCANO
    ENDIF
    IF (LAGDATE=DATE() .or.  repno_cont=1   )
      LAG_REPNO1=str(val(LAG_REPNO1)+1 ,9,0)
      LAG_REPNO1=PADR(LAG_REPNO1,SCANO_LEN," ")

    ELSE
      LAG_REPNO1=fgetserno(9,1)
      LAG_REPNO1=PADR(LAG_REPNO1,SCANO_LEN," ")
      LAGDATE=DATE()
    ENDIF
   ENDIF
   LAG_REPNO=LAG_REPNO1
   lag_sno=ALLTRIM(str(val(lag_sno)+1,9,0))
   lag_sno=PADR(lag_sno,SCANO_LEN," ")
   *_TOT_D_A[19,X] :=LAG_REPNO
   _TOT_D_A[19,X] :=LAG_SNO
  SAVE TO LAGDATA9 ALL LIKE LAG*
  ASCANO=LAG_REPNO1
  LAG_PNO=LAG_REPNO1
  IF ACALW_REP <=0
    AVUSE=0
    ARATNO=space(ratno_wid)
    SELE 3
    SET DELE ON
    GOTO TOP
    IF .NOT. EOF()
      AVUSE=VUSE
      ARATNO=RATNO
      ASCANO=SCANO
      ACARNO=CARNO
      ATANDO=TANDO


      do DSP_aRecipe
      && @ 23,PX_SCANO	SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-SCANO_LEN,SCANO_LEN)
      && @ 23,24 SAY ACARNO
      && @ 23,37 SAY ARATNO
      && @ 23,52 SAY AVUSE   PICT "99.9"
      && @ 23,61 SAY ATANDO  PICT "9999"
      IF WASTE <>1
	@ 23,75 SAY ACALW_REP  PICT "99"
      ENDIF
      DELET
      PACK
      SET DELE OFF
    ENDIF
      IF WASTE <>1
	@ 23,75 SAY ACALW_REP  PICT "99"
      ENDIF
  ENDIF
ELSE
  *AVUSE=0
  *ARATNO=space(9)
  IF EMPTY(ARATNO)=.T.
    AVUSE=0
    ARATNO=space(ratno_wid)
  ENDIF
  ARATNO=space(ratno_wid)
  @ 23,37 SAY ARATNO
  SELE 3
  SET DELE ON
  GOTO TOP
  IF .NOT. EOF()
    AVUSE=VUSE
    ARATNO=RATNO
    ASCANO=SCANO
    ACARNO=CARNO
    ATANDO=TANDO
    * @ 23,16 SAY ASCANO  PICT "9999"
    * @ 23,28 SAY ACARNO
    * @ 23,48 SAY ARATNO  PICT "9999"
    * @ 23,64 SAY AVUSE   PICT "99.9"
    * @ 23,74 SAY ATANDO  PICT "9999"
    DELET
    PACK
    SET DELE OFF
  ENDIF
ENDIF
SELEC &xd_wno
GOTO LURECNO
 aus3=0
 ATOT_CAR=0
X=_TOT_D_A[20,3] +1
IF X >=3
  X=1
ENDIF
 *_TOT_D_A[20,3] := 1
RETU
**------3530-----------------------------------------------------------------------
FUNCTION RDDLY	 &&­p¶q±í­«¬O§_¤j©ó³]©w­È
PARAMETERS  RDN,WN,W_AN  &&­p¶q±íno,actdata ,³]©w­È
*x=INT(WDATA(WN)-2048)
*x1=INT((x)*A_M_NAME[wn+1,12]/PER/2048)
&& IF INT((WDATA(WN)-2048)*A_M_NAME[wn+1,12]/PER/2048)> W_AN
IF INT((WDATA(WN)-2048)*A_M_NAME[wn+1,6]/PER/2048)> W_AN
  IF  ABS(SECONDS()-RDDELAY[RDN,2]) >= RDDELAY[RDN,1]
    RDDELAY[RDN,3] :=1
  ELSE
    RDDELAY[RDN,3] :=77
  ENDIF
ELSE
  RDDELAY[RDN,3] :=0
ENDIF
RETU   && 0: <	,1:> ,77: <TIME












**-----------------------------------------------------------------------------
PROCEDURE  pnt_tit
PARAMETERS  P1,P2,P3
PRINTERTST=0
DO  PRINTERTST	  WITH	 APORT
IF PRINTERTST=1
  SET CONS On
  && do case
  && case aport="1"
  &&   set print to lpt1
  &&   ? chr(27) + "SP1;"
  && case aport="2"
  &&   set print to lpt2
  &&   ? chr(27) + "SP2;"
  && case aport="3"
  &&   set print to lpt3
  &&   ? chr(27) + "SP3;"
  && endcase
  && SET CONS On
  && SET DEVI TO PRINT
  && @ PROW(),0 say   "~I;"
  && @ PROW(),0 say   pntw     &&  ="~IX5;"   t15_com.h

  FSetToPrinter(aport,PNTW)

  @ PROW()+2,2 SAY   " ¤é´Á :    ¦~    ¤ë    ¤é                                               "
  X=_Tot_d_a[20,4] +2
  @  PROW(),9	SAY  YEAR(DATE())	PICT  "9999"
  @ PROW(),17 SAY  SUBSTR(DTOC(DATE()),1,2)
  @ PROW(),23 SAY  SUBSTR(DTOC(DATE()),4,2)
  @ PROW(),34 SAY  "¨®¸¹:"
  @ PROW(),41  SAY  _Tot_d_a[13,X]
  @ PROW(),51 SAY  "°t¤ñ:"
  @ PROW(),56 SAY  _Tot_d_a[18,X]
  IF  empty(_Tot_d_a[2,X]) <> .t.
    @ PROW(),66 SAY  "§Ç¸¹:"
    @ PROW(),72 SAY  _Tot_d_a[2,X]
  ENDIF
  IF  (COM_E=0)  .AND.	((empty(_Tot_d_a[2,X])	<> .t.)  .OR. (_Tot_d_a[14,X] <> 0))
      @ PROW()+1,1 SAY	" "
      if  waste=1
	 @ PROW(),51 SAY  "¤u¦a:"
	 @ PROW(),56 SAY  _Tot_d_a[22,X]
      endif
    IF	_Tot_d_a[14,X] <> 0
      @ PROW(),66 SAY  "§~«×:"
      @ PROW(),71 SAY  _Tot_d_a[14,X]  PICT "9999"
    ENDIF
  ENDIF
  @ PROW()+1,1 SAY   "--------------------------------------------------------------------------------------------------"
  @ PROW()+1,1 SAY   "      NO.  ®É¶¡  ¦Ì¼Æ  ²Ö­p(¦Ì)        ³]©w­«¶q/¹ê»Ú­«¶q (Kg)"
  @ PROW()+1,1 SAY   " "
  FOR X=1 TO (GS_TOT+UWC_TOT)
    xcd=SUBSTR("       "+alltrim(A_M_NAME[X,1] ),-6,6)
    @  PROW(),6 *(X-1)+1  SAY  XCD
  NEXT
  @ PROW(),6 *(X-1)+1  SAY   "Á`­«"
  @ PROW()+1,1 SAY   "------------------------------------------------------------------------------------------------------"
  @ PROW()+1,1 SAY  " "
  SET DEVI TO SCRE
endif
RETU

**-----------------------------------------------------------------------------
FUNCTION TST1_LS1
PARAMETERS  TST_M1
IF LS1[TST_M1,1]=1
  IF DIX(DI_ADS2,TST_M1-1)=0 .AND. RDOK2(TST_M1-1)=1
    IF LS1[TST_M1,2]=0
      *DOUT(TST_M1-1,0)
      SetDigitOut(1,TST_M1-1,0)
      LS1[TST_M1,2] :=1
      DO CASE
      CASE UCHTYPE=1
	SET COLOR TO R * / &C1
	MTANK_MARK(6,STP_FN,1)
	SET COLOR TO &C7  / &C1
      ENDCASE
    ENDIF
    RETU
  ELSE
    IF LS1[TST_M1,2]=1
      LS1[TST_M1,2] :=0
      *DOUT(TST_M1-1,1)
      SetDigitOut(1,TST_M1-1,1)
      SET COLOR TO &C2	/ &C1
      MTANK_MARK(6,STP_FN,1)
      SET COLOR TO &C7	/ &C1
    ENDIF
  ENDIF
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION TST0_LS1   &&	TEST  LS1=0  ­p¶qLS1
PARAMETERS  TST_M1,TST_M2
FOR XDI=TST_M1 TO TST_M2
  IF LS1[XDI,1]=1
    DIN_X=0
    IF DIX(DI_ADS2,XDI-1)=1
      DIN_X=1
    ENDIF
    IF DIN_X=1 .AND. RDZEROK(A_M_NAME[XDI,8])=1
      IF LS1[XDI,2]=0
	*dout2(A_M_NAME[XDI,8],0)
	SetDigitOut(2,A_M_NAME[XDI,8],0)
	LS1[XDI,2] :=1
	DO CASE
	CASE LCHTYPE=4
	  SET COLOR TO R * / &C1
	  MTANK_MARK(6,XDI,1)
	  SET COLOR TO &C7  / &C1
	ENDCASE
      ENDIF
    ELSE
      IF  RDZEROK(A_M_NAME[XDI,8])=1
	IF LS1[XDI,2]=1
	  LS1[XDI,2] :=0
	  *dout2(A_M_NAME[XDI,8],1)
	  SET COLOR TO &C2 / &C1
	  MTANK_MARK(6,XDI,0)
	  SET COLOR TO &C7  / &C1
	ENDIF
      ELSE
	*dout2(A_M_NAME[XDI,8],1)
	FOR XDI_1=TST_M1 TO TST_M2
	  LS1[XDI_1,2] :=0
	  SET COLOR TO &C2 / &C1
	  MTANK_MARK(6,XDI,0)
	  SET COLOR TO &C7  / &C1
	NEXT
      ENDIF
    ENDIF
  ENDIF
NEXT
XN1=0
FOR XDI_1=TST_M1 TO TST_M2
  IF  LS1[XDI_1,2] =1
    XN1=1
    EXIT
  ENDIF
NEXT
IF XN1=0
  IF MIXAMP < MIXMAX
    IF TST_M1 <= GS_TOT
      *dout2(A_M_NAME[TST_M1,8],1)
      SetDigitOut(2,A_M_NAME[TST_M1,8],1)
    ELSE
      IF MIXAMP > MIXMIN
	*dout2(A_M_NAME[TST_M1,8],1)
	SetDigitOut(2,A_M_NAME[TST_M1,8],1)
      else
	*dout2(A_M_NAME[TST_M1,8],0)
	SetDigitOut(2,A_M_NAME[TST_M1,8],0)
      endif
    ENDIF
  ELSE
    *dout2(A_M_NAME[TST_M1,8],0)
    SetDigitOut(2,A_M_NAME[TST_M1,8],0)
  ENDIF
ELSE
  *dout2(A_M_NAME[TST_M1,8],0)
  SetDigitOut(2,A_M_NAME[TST_M1,8],0)
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION TST1_LS2
PARAMETERS  TST_M1
IF LS2[A_M_NAME[TST_M1,8]+1,1]=1
  IF DIX(DI_ADS3,A_M_NAME[TST_M1,8])=0 .AND. RDZEROK(A_M_NAME[TST_M1,8])=1
    IF LS2[A_M_NAME[TST_M1,8]+1,2]=0
      *dout2(A_M_NAME[TST_M1,8],0)
      SetDigitOut(2,A_M_NAME[TST_M1,8],0)
      LS2[A_M_NAME[TST_M1,8]+1,2] :=1
      DO CASE
      CASE LCHTYPE=4 .OR. UCHTYPE=1

	SET COLOR TO R * / &C1
	DO CASE
	CASE TST_M1=3
	  @ 11,7  SAY	"úLúPúPúKúPúPúO"
	CASE TST_M1=5
	  @ 11,22 SAY	"úLúPúKúPúO"
	CASE TST_M1=7
	  @ 11,36 SAY	"úLúPúKúPúO"
	CASE TST_M1=8
	  @ 11,46 SAY	"úLúKúO"
	CASE TST_M1=10
	  @ 11,53 SAY	"úLúPúPúKúPúO"
	CASE TST_M1=11
	  @ 11,67 SAY	"úLúKúO"
	CASE TST_M1=12
	  @ 11,73 SAY	"úLúKúO"
	ENDCASE
	SET COLOR TO &C7  / &C1
      ENDCASE
    ENDIF
    RETU
  ELSE
    IF LS2[A_M_NAME[TST_M1,8]+1,2]=1
      LS2[A_M_NAME[TST_M1,8]+1,2] :=0
      *dout2(A_M_NAME[TST_M1,8],1)
      SetDigitOut(2,A_M_NAME[TST_M1,8],1)
      SET COLOR TO &C2	/ &C1
      DO CASE
      CASE LCHTYPE=4 .OR. UCHTYPE=1
	DO CASE
	CASE TST_M1=3
	  @ 11,7  SAY	"úLúPúPúKúPúPúO"
	CASE TST_M1=5
	  @ 11,22 SAY	"úLúPúKúPúO"
	CASE TST_M1=7
	  @ 11,36 SAY	"úLúPúKúPúO"
	CASE TST_M1=8
	  @ 11,46 SAY	"úLúKúO"
	CASE TST_M1=10
	  @ 11,53 SAY	"úLúPúPúKúPúO"
	CASE TST_M1=11
	  @ 11,67 SAY	"úLúKúO"
	CASE TST_M1=12
	  @ 11,73 SAY	"úLúKúO"
	ENDCASE
      ENDCASE
      SET COLOR TO &C7	/ &C1
    ENDIF
  ENDIF
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION TST0_LS2
PARAMETERS  TST_M1
IF LS2[A_M_NAME[TST_M1,8]+1,1]=1
  IF DIX(DI_ADS3,A_M_NAME[TST_M1,8])=1 .AND. RDOK2(TST_M1-1)=1
    IF LS2[A_M_NAME[TST_M1,8]+1,2]=0
      *DOUT(TST_M1-1,0)
      SetDigitOut(1,TST_M1-1,0)
      LS2[A_M_NAME[TST_M1,8]+1,2] :=1
      DO CASE
      CASE LCHTYPE=4 .OR. UCHTYPE=1
	SET COLOR TO R * / &C1
	DO CASE
	CASE TST_M1=1 .OR.TST_M1=2 .OR.TST_M1=3
	  @ 11,7  SAY	"úZúYúYúYúYúYú["
	CASE TST_M1=4.OR.TST_M1=5
	  @ 11,22 SAY	"úZúYúYúYú["
	CASE TST_M1=6 .OR.TST_M1=7
	  @ 11,36 SAY	"úZúYúYúYú["
	CASE TST_M1=8
	  @ 11,46 SAY	"úZúYú["
	CASE TST_M1=9 .OR.TST_M1=10
	  @ 11,53 SAY	"úZúYúYúYúYú["
	CASE TST_M1=11
	  @ 11,67 SAY	"úZúYú["
	CASE TST_M1=12
	  @ 11,73 SAY	"úZúYú["
	ENDCASE
	SET COLOR TO &C7  / &C1
      ENDCASE
    ENDIF
    RETU
  ELSE
    IF LS2[A_M_NAME[TST_M1,8]+1,2]=1
      LS2[A_M_NAME[TST_M1,8]+1,2] :=0
      *DOUT(TST_M1-1,1)
      SetDigitOut(1,TST_M1-1,1)
      SET COLOR TO &C2	/ &C1
      DO CASE
      CASE TST_M1=1 .OR.TST_M1=2 .OR.TST_M1=3
	@ 11,7	SAY   "úZúYúYúYúYúYú["
      CASE TST_M1=4.OR.TST_M1=5
	@ 11,22 SAY   "úZúYúYúYú["
      CASE TST_M1=6 .OR.TST_M1=7
	@ 11,36 SAY   "úZúYúYúYú["
      CASE TST_M1=8
	@ 11,46 SAY   "úZúYú["
      CASE TST_M1=9 .OR.TST_M1=10
	@ 11,53 SAY   "úZúYúYúYúYú["
      CASE TST_M1=11
	@ 11,67 SAY   "úZúYú["
      CASE TST_M1=12
	@ 11,73 SAY   "úZúYú["
      ENDCASE
      SET COLOR TO &C7	/ &C1
    ENDIF
  ENDIF
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION WEIG_RESCALL
PARAMETERS  DSM_FN
SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]
IF  SW1 >0
  DSN_WX=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,3]
  MNX_W=SW1/(SW1+DSN_WX) *A_M_NAME[STP_FN,9]
  A_M_NAME[STP_FN,10] := MNX_W
  DO CASE
  CASE LCHTYPE=4
    IF DSM_FN <=3
      A_M_NAME[1,12] := MNX_W
    ELSE
      A_M_NAME[2,12] := MNX_W
    ENDIF
  ENDCASE
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION WEIG_URESCALL
PARAMETERS  DSM_FN
SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]
IF  SW1 >0
  DSN_WX=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,3]
  MNX_W=SW1/(SW1-DSN_WX) *A_M_NAME[STP_FN,9]
  A_M_NAME[STP_FN,10] := MNX_W
  DO CASE
  CASE UCHTYPE=1
    DO CASE
    CASE DSM_FN=8
      A_M_NAME[KLCHN+2,12] := MNX_W
    CASE DSM_FN=9
      A_M_NAME[KLCHN+3,12] := MNX_W
    ENDCASE
  ENDCASE
ENDIF
RETU
**-----------------------------------------------------------------------------
PROCEDURE  CONVEYER
PARAMETERS  P1,P2,P3
DO CASE
CASE   CNVSTP=0
  FOR XF=1  TO GS_TOT
    CNVSTP=1
    UPOV=0
    DNOV=0
    IF WTANK_F[XF,1]<>1
      CNVSTP=0
      UPOV=0
      DNOV=0
      EXIT
    ENDIF
  NEXT
  IF CNVSTP=1
    FOR  I=1  TO  GS_TOT
      WTANK_F[I,1] :=0
      WTANK_F[I,2] :=0
    NEXT
    X=_Tot_d_a[20,4] +2
    @ 15,12 say _Tot_d_a[18,X]
    @ 16,12 say _Tot_d_a[10,X]	PICT  "999.9"
    IC_X=ALLTRIM(STR(GS_TOT+1,2,0))
    IF STPN&ic_x=1   .AND.   F3_RUN=0


      do DSP_aRecipe
      && @ 23,PX_SCANO SAY SUBSTR(SPACE(9)+ALLTRIM(ASCANO),-SCANO_LEN,SCANO_LEN)
      && @ 23,25 SAY ACARNO
      && @ 23,37 SAY ARATNO
      && @ 23,52 SAY AVUSE   PICT "99.9"
      && @ 23,61 SAY ATANDO  PICT "9999"
      IF WASTE <>1
	@ 23,75 SAY ACALW_REP  PICT "99"
      ENDIF
      E_STORE = 1
      X=_TOT_D_A[20,4] +2
      IF empty(_Tot_d_a[2,X]) =.t. .or. val(_Tot_d_a[2,X])=0
	E_STORE = 0
      ENDIF
      IF E_STORE =1
	*DO  PNT_TIT
      ENDIF
    ENDIF
    SET CONS ON
  ENDIF
  SET COLOR TO &C5 +/ &C1
  *@ 14,52 SAY "²V¦X   ²V¦X   ¶}ªù   §t¤ô"
  *@ 15,0 SAY "1.³]©w°t¤ñ:              "
  *@ 16,0 SAY "2.³]©w¦Ì¼Æ:              "
  *@ 17,0 SAY "3.°õ¦æ¦Ì¼Æ:              "
  *@ 18,0 SAY "4.ºÏºÐ®e¶q:      ,000    "
  *@ 17,48  SAY
  SET COLOR TO &C2 / &C1
&&CASE	(CNVSTP=1 .AND. (DIN(8)=0  .OR. GS_PRE=1   ) .AND. DIN(10)=1	.AND.  DIN(11)=1 .AND.	DIN(15)=1)  &&DIN0.08=0  STORE TANK  DOOR CLOSE ,DIN0.11 °©§÷¶i®Æ
CASE  CNVSTP=1	.AND. DIN(10)=1    .AND.  DIN(11)=1 .AND.  DIN(15)=1	&&DIN0.08=0  STORE TANK  DOOR CLOSE ,DIN0.11 °©§÷¶i®Æ
  IF  DIN(8)=1	&&  «Ý¤æLS:OPEN
    IF UPTKSTP <9  .OR.  GS_PRE=0
       SET COLOR TO R+* / &C1
       @ 13,UPTANK[5,1]-2 SAY "újúKúk"
       SET COLOR TO &C2 / &C1

       RETU
    ENDIF
  ELSE

  ENDIF
  CNVSTP=2

  IF UPTKSTP =0
    IF lstanktmp =0  .OR. DIN(8)=0
      SET COLOR TO B+ / &C1
      @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
      SET COLOR TO &C2 / &C1
    ENDIF
  ENDIF
  XWSTPN=    STPN1
  A_STOR_1(@A_PRESS_N0,XWSTPN,1,GS_TOT)
  A_STOR_1(@A_PRESS_B0,XWSTPN,1,GS_TOT)

  for I=1  TO gs_tot +uwc_tot
      A_RAND_W[2,I] =A_RAND_W[1,I]
  NEXT

  FOR  I=1  TO	GS_TOT
    WTANK_F[I,1] :=-99
    WTANK_F[I,2] :=-99
    SET  COLO TO W+   /&C1
    @  4,UPTANK[5,1]   say  UPTANK[4,1]  PICT "99"
    SET COLOR TO &C2 / &C1
  NEXT
  FOR  I=1  TO	KLCHN
    GS_DROP[I,2] :=0
  NEXT
CASE CNVSTP=2
  CNVSTP=3
  UPTANK[4,2]=SECONDS()
  FOR  I=1  TO	GS_TOT
    IF	WTANK_F[I,2] <>1
      CNVSTP=2
      EXIT
    ENDIF
  NEXT
CASE CNVSTP=3
  IF  DIN(15)=0
    SET COLOR TO R +/ &C1
    && 20141123 DO DRAW_P1
    && @  3,UPTANK[5,1]-6  SAY "¢z¢s¢w¢w¢{"
    && @  4,UPTANK[5,1]-6  SAY "¢x¢x    ¢x"
    && @  5,UPTANK[5,1]-6  SAY "¢x¢u¢w¢w¢}"
    && @  6,UPTANK[5,1]-6  SAY "úUúV"
    && @  7,UPTANK[5,1]-6  SAY "¢x¢x"
    && @  8,UPTANK[5,1]-6  SAY "¢x¢x"
    && @  9,UPTANK[5,1]-6  SAY "¢x¢x"
    && @ 10,UPTANK[5,1]-6  SAY "¢x¢x"
    && @ 11,UPTANK[5,1]-6  SAY "úUúV"
    && && @ 12,UPTANK[5,1]-6  SAY "¢x¢x"
    && @ 13,UPTANK[5,1]-6  SAY "    "
    && @ 13,UPTANK[5,1]-38  SAY "¢z¢w¢wúR¢w¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢q¢t"
    && @ 14,UPTANK[5,1]-38  SAY "¢|¢w¢wúQ¢w¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢r¢}"
    && @  4,UPTANK[5,1]   say  UPTANK[4,1]  PICT "99"
    UPTANK[4,2]=SECONDS()
    SET COLOR TO &C2 / &C1
  ELSE
    SET  COLO TO W /&C1
    && 20141123 DO DRAW_P1
    X=SECONDS()-UPTANK[4,2]
    IF X<0
      X=86399+SECONDS()-UPTANK[4,2]
    ENDIF
    X=UPTANK[4,1]-X
    IF	X<=0
      X=0
    ENDIF
    SET  COLO TO GR+ /&C1
    @  4,UPTANK[5,1]   say  X  PICT "99"
    SET  COLO TO &C2 /&C1
  ENDIF
  IF  X<=0


    SET  COLO TO GR+  /&C1
    @  4,UPTANK[5,1]   say  X  PICT "99"
    CNVSTP=4
  ENDIF
CASE CNVSTP=4
  IF UPTKSTP=0
    UPTKSTP=4
    IF lstanktmp =0  .OR. DIN(8)=0
      SET COLOR TO B+ / &C1
      @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
      SET COLOR TO &C2 / &C1
    ENDIF
  ENDIF
ENDCASE
RETU
**-----------------------------------------------------------------------------

PROCEDURE  UP_TANK   && «Ý¤æ
PARAMETERS  P1,P2,P3
  static isSetCNVSTP :=0
DO CASE
CASE UPTKSTP=4	   .AND. (DIN(12)=1) .AND. (DIN(15)=1 ) .AND.  (TANKSTP=0)
  UPTKSTP=5
  FOR XF=GS_TOT + 1  TO GS_TOT + UWC_TOT
     IF  TIME1[XF,1] =88
	if STP_A[XF] <>7   .and.  WEIGHT_TYPE[xf] <>1
	  UPTKSTP=4
	  EXIT
	ENDIF
     ENDIF
    IF WTANK_F[XF,1]<>1
      IF  TIME1[XF,1] <>88
	UPTKSTP=4
	EXIT
      ENDIF
    ENDIF
    do	case
    case  AE_TYPE=89
      IF stp9<>7
	UPTKSTP=4
	EXIT
      ENDIF
   * case  (AE_TYPE=910)  .OR.	(AE_TYPE=10  )
   *   IF (stp10<>7)  .AND.  (TIME1[10,1] =88)
   *	 UPTKSTP=4
   *	 EXIT
   *   ENDIF
    ENDcase
  NEXT
CASE (UPTKSTP=5)  .AND. (DIN(12)=1) .AND. (DIN(15)=1 ) .AND.  (TANKSTP=0)  .AND. ((MIXAMP >MIXMIN)	 )
  TANKSTP=1
  UPTKSTP=61
  change_tot_d(@_tot_d_A,4,3)

  &&V15T
  XTINDEX=1
  IF UWC_TOT=0
    XTINDEX=0
  ENDIF

  Xcn1=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
  XWSTPN=    STPN&xcn1
  A_STOR_1(@A_PRESS_N0,XWSTPN,GS_TOT+1,GS_TOT+UWC_TOT)
  A_STOR_1(@A_PRESS_B0,XWSTPN,GS_TOT+1,GS_TOT+UWC_TOT)
  IF DIN(9)=1
    TANKSTP=0
    UPTKSTP=5
    &&IF PLOT_E=0
      SET COLOR TO R / &C1
      @ 18,40 SAY "úZúYúYúYúYúYúYúYúYúYúYúYúYúYúYúYúYúYú[ "
      IF DIN(9)=1
	@ 18,52   SAY "ûÖ"
      ENDIF
    &&endif
    SET COLOR TO &C2 / &C1
  ENDIF
  IF lstanktmp >0
    lstanktmp =DIN(8)+10
    IF DIN(8)=0
      TANKSTP=0
      UPTKSTP=5
      SET COLOR TO R+ *  / &C1
      &&@ 13,UPTANK[5,1]-2 SAY "újúKúk"
      @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
    ELSE
      SET COLOR TO GR+ / &C1
      && @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
      @ 13,UPTANK[5,1]-2 SAY "újúKúk"
    ENDIF
    SET COLOR TO &C2 / &C1
  ENDIF









CASE UPTKSTP=62
   &&V15T
   XTINDEX=1
   IF UWC_TOT=0
     XTINDEX=0
   ENDIF
   Xcn1=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
   XWSTPN=    STPN&xcn1
  A_STORn_1(@A_PRESS_N0,XWSTPN,1,GS_TOT+UWC_TOT,3,4)
  UPTKSTP=6
  IF  UPTKSTP=6
    IF PLOT_E=0
      SET COLOR TO B+ / &C1
      @ 18,40 SAY "úZúYúYúYúYúYúYúYúYúYúYúYúYúYúYúYúYúYú[ "
      IF DIN(9)=1
	@ 18,52   SAY "ûÖ"
      ENDIF
    endif
    SET COLOR TO &C2 / &C1
    UPTANK[1,2]=SECONDS()
    SET COLOR TO GR +/ &C1
    @ 13,UPTANK[5,1]-2 SAY "újúKúk"
    *DOUT(14,1)
    SetDigitOut(StorerOpen,1)
    SET COLOR TO &C2 / &C1
    FOR XF=GS_TOT + 1  TO GS_TOT + UWC_TOT
      IF TIME1[XF,1] <>88
	WTANK_F[XF,1] :=-99
	WTANK_F[XF,2] :=-99
      ENDIF
    NEXT
  ENDIF
CASE UPTKSTP=61
  xd_wno=fSelectNo()
  IF KOT=1  &&¥þ¤W
    UPTKSTP=0
  ELSE
    UPTKSTP=62
  ENDIF
  STORTIME=TIME()
  X=_TOT_D_A[20,4] +2
  _TOT_D_A[8,X]  := STORTIME
  *PMIXTM=SEEK_PMIXTM(_TOT_D_A[18,X] )
  _TOT_D_A[23,X]  := pmixtm
  SET COLOR TO &C7 +/ &C1
  @ 16,51 SAY  PMIXTM PICT "999"
  IF (HDOK=1) .AND.( FILE("C:\LUW1.DBF")=.T.)  .and.(INT(DISKSPACE( DAA )/1024) >250 )
    E_STORE = 1
    X=_TOT_D_A[20,4] +2
    IF empty(_TOT_D_A[2,X])=.t. .or. val(_Tot_d_a[2,X])=0
      E_STORE = 0
    ENDIF
    X=_TOT_D_A[20,4] +2

    IF (E_STORE =1)   .and.   val(_TOT_D_A[2,X]) >0
      &&V15T
      XTINDEX=1
      if UWC_TOT=0
	 XTINDEX=0
      ENDIF
      IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
      X=_TOT_D_A[20,4] +2

      sele 1
      APPE BLAN
      REPL LUTIME  WITH  STORTIME,LUDATE WITH DATE(),LAG_VUSE WITH A_PRESS_N0[3,STPN&ic_x,1,6]
      REPL  MIX_SEC  WITH  PMIXTM
      REPL  sign  WITH	"1"
      REPL SCANO WITH ALLTRIM(_TOT_D_A[2,X])
      REPL CARNO WITH _TOT_D_A[13,X]
      REPL TVUSE  WITH A_PRESS_N0[3,STPN&ic_x,1,5]
      REPL RATNO WITH _TOT_D_A[18,X]
      REPL LTANDO WITH _TOT_D_A[14,X]
      REPL PAN_NO  WITH  STPN&ic_x
      if empty(_TOT_D_A[19,X])=.F.
	if VALTYPE(_TOT_D_A[19,X])="C"
	  REPL LAGNO1  WITH  _TOT_D_A[19,X]	&& SNO
	ENDIF
      ENDIF
      REPL S_STRO  WITH  _TOT_D_A[12,X]     && SNO
	REPL p1701  WITH _TOT_D_A[22,x]   &&
      IF COM_E=1
	*REPL	 SCANO2  WITH  _TOT_D_A[17,X]	  && S_MAX
      ENDIF
      IF  STORAB_D=1
	sele 19
	APPE BLAN
	REPL LUTIME  WITH  STORTIME,LUDATE WITH DATE(),LAG_VUSE WITH A_PRESS_N0[3,STPN&ic_x,1,6]
	X=_TOT_D_A[20,4] +2
	REPL SCANO WITH ALLTRIM(_TOT_D_A[2,X]),CARNO WITH _TOT_D_A[13,X],TVUSE	WITH A_PRESS_N0[3,STPN&ic_x,1,5] ,RATNO WITH _TOT_D_A[18,X],LTANDO WITH _TOT_D_A[14,X]
	REPL PAN_NO  WITH  STPN&ic_x,LAGNO1 WITH  _TOT_D_A[19,X]     && SNO.
	REPL S_STRO  WITH  _TOT_D_A[12,X]     &&
	  REPL p1701  WITH _TOT_D_A[22,x]   &&
	IF COM_E=1
	  *REPL    SCANO2  WITH  _TOT_D_A[17,X]
	ENDIF
      ENDIF
    ENDIF
  ELSE
    ACTIME=TIME()
    HDOK=0
  ENDIF
  XTW=0
  IF (HDOK=1) .AND.( FILE("C:\LUW1.DBF")=.T.)  .and.(INT(DISKSPACE( DAA )/1024) >250 )
    kX=_TOT_D_A[20,4] +2
    IF (E_STORE =1 .and.  val(_TOT_D_A[2,kX]) >0   )
      IF  (STORAB_D=1)
	&&V15T
	XTINDEX=1
	if UWC_TOT=0
	   XTINDEX=0
	ENDIF
	IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
	sele 19
	kX=_TOT_D_A[20,4] +2
	FOR  XLP=1 TO (GS_TOT+UWC_TOT)
	  XMC_F=A_M_NAME[XLP,3]
	  if  lchtype=16 .or. LCHTYPE=17
	    do	adjwaB0
	    do case
	    case xLP=1
	      repl adjTM1 WITH	G1_WATER
	    case xLP=2
	      repl adjTM2 WITH	G2_WATER
	    case xLP=3
	      repl adjTM3 WITH	S1_WATER
	    case xLP=4
	      repl adjTM4 WITH	S2_WATER
	    endcase
	  endif
	  *XTW=XTW+A_PRESS_B0[3,STPN&ic_x,XLP,1]+A_PRESS_B0[3,STPN&ic_x,XLP,2]
	  XTW=XTW+A_PRESS_n0[3,STPN&ic_x,XLP,1]+A_PRESS_n0[3,STPN&ic_x,XLP,2]
	  XMC1=ALLTRIM(STR(XLP,2,0))
	  *XTMP0 = A_PRESS_B0[3,STPN&IC_X,XLP,1]
	  XTMP0 = A_PRESS_n0[3,STPN&IC_X,XLP,1]
	  IF XTMP0 >0
	    *XTMP0 =  XTMP0 +A_PRESS_B0[3,STPN&IC_X,XLP,2]
	    XTMP0 =  XTMP0 +A_PRESS_n0[3,STPN&IC_X,XLP,2]
	  ENDIF
	  XDEC=CAL_DEC(XLP)
	  IF XDEC=0
	    XTMP0=INT(XTMP0)
	  ENDIF
	  repl TM&XMC1 WITH  XTMP0
	    REPL p1701	WITH _TOT_D_A[22,kx]   &&

	NEXT
      ENDIF
      &&V15T
      XTINDEX=1
      if UWC_TOT=0
	 XTINDEX=0
      ENDIF

      IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
      sele 1
      kX=_TOT_D_A[20,4] +2
      x_pos1=recno()
      FOR  Xlp=1 TO (GS_TOT+UWC_TOT)
	XMC_F=A_M_NAME[Xlp,3]
	IF W0DBF=1
	  A_PRESS_N0[3,STPN&ic_x,Xlp,1] =A_PRESS_N0[3,STPN&ic_x,Xlp,8]
	  A_PRESS_N0[3,STPN&ic_x,Xlp,2] =A_PRESS_N0[3,STPN&ic_x,Xlp,11]
	  *A_PRESS_N0[2,STPN&ic_x,XLP,1] =A_PRESS_N0[3,STPN&ic_x,XLP,8]
	ENDIF
	XDEC=CAL_DEC(XLP)
	IF XDEC=0
	  A_PRESS_N0[3,STPN&ic_x,Xlp,1] =INT(A_PRESS_N0[3,STPN&ic_x,Xlp,1] )
	  A_PRESS_N0[3,STPN&ic_x,Xlp,2]=INT(A_PRESS_N0[3,STPN&ic_x,Xlp,2])
	ENDIF
	XTW=XTW+A_PRESS_N0[3,STPN&ic_x,XLP,1]+A_PRESS_N0[3,STPN&ic_x,XLP,2]
	XMC1=ALLTRIM(STR(XLP,2,0))
	if pnt_func=0
	  XTMP0 = A_PRESS_N0[3,STPN&IC_X,XLP,1]  +A_PRESS_N0[3,STPN&IC_X,XLP,2]
	else
	  XTMP0 = A_PRESS_N0[3,STPN&IC_X,XLP,1]
	endif
	goto x_pos1
	repl TM&XMC1 WITH  XTMP0
	XTMPD=LUDATE
	if   (pnt_func=1) .OR.	(ERRPNT_E=1)
	  skip
	  if eof()
	     append  blank
	     REPL LAGNO1  WITH	_TOT_D_A[19,kX]     && SNO
	     REPL  LUDATE   WITH  XTMPD
	     repl  sign with "2"
	  endif
	  IF XTMP0 =0
	     A_PRESS_N0[3,STPN&IC_X,XLP,2]=0
	  endif
	  repl TM&XMC1 WITH  A_PRESS_N0[3,STPN&IC_X,XLP,2]
	endif
	*IF  WASTE=1
	*  REPL p1701  WITH _TOT_D_A[22,kx]   &&
	*ENDIF
      NEXT
    ENDIF
  ELSE
    HDOK=0
  ENDIF
  IF (HDOK=1) .AND.( FILE("C:\LUW1.DBF")=.T.)  .and.(INT(DISKSPACE( DAA )/1024) >250 )

    X=_TOT_D_A[20,4] +2
    IF (E_STORE =1  .and.  val(_TOT_D_A[2,X]) >0 )
      &&V15T
      XTINDEX=1
      if UWC_TOT=0
	 XTINDEX=0
      ENDIF
      IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
      X=_TOT_D_A[20,4] +2
      SELE 1
      APPE BLANK
      REPL LUTIME  WITH  STORTIME,LUDATE WITH DATE(),LAGNO1 WITH _TOT_D_A[19,X]  &&LAG_PNO
      REPL S_STRO  WITH  _TOT_D_A[12,X]     &&
      repl  sign with  "3"  &&­p¶q¹ê­«
      *APPE BLANK
      *REPL LUTIME  WITH  STORTIME,LUDATE WITH DATE(),LAGNO1 WITH _TOT_D_A[19,X]  &&LAG_PNO
      *repl  sign with	"4"
      *REPL TM1 WITH -99
      *SKIP -1
	REPL p1701  WITH _TOT_D_A[22,x]   &&
      IF COM_E=1
	*REPL	 SCANO2  WITH  _TOT_D_A[17,X]	  && S_MAX
      ENDIF
      if storab_d=1
	SELE 19
	APPE BLANK
	X=_TOT_D_A[20,4] +2
	REPL LUTIME  WITH  STORTIME,LUDATE WITH DATE(),LAGNO1 WITH _TOT_D_A[19,X]  &&LAG_PNO
	REPL S_STRO  WITH  _TOT_D_A[12,X]     &&
	  REPL p1701  WITH _TOT_D_A[22,kx]   &&
	IF COM_E=1
	  *REPL    SCANO2  WITH  _TOT_D_A[17,X]     && S_MAX
	ENDIF
      endif
      xdec_a :=ARRAY(3)
      FOR  X=1 TO (GS_TOT+UWC_TOT)
	getData_dec(a_m_name[x,3],@xdec_a)
	XMC_F=xdec_a[1];


	&& XMC_F=A_M_NAME[X,3]
	XTW=XTW+A_PRESS_N0[3,STPN&IC_X,X,1]+A_PRESS_N0[3,STPN&IC_X,X,2]
	A_PRESS_N0[3,STPN&IC_X,X,10]=A_PRESS_N0[3,STPN&IC_X,X,4]
	if storab_d=1
	  SELE 19
	  XMC1=ALLTRIM(STR(X,2,0))
	  *repl TM&XMC1 WITH A_PRESS_N0[3,STPN&IC_X,X,4]   *¹ê»Ú­È
	    IF ((STANDW_ERR[X] > 0) .or. (STANDW2_ERR[X] > 0)  ) .and.	  lchtype <>30
	      IF A_PRESS_B0[3,STPN&IC_X,X,1] =0
		A_PRESS_B0[3,STPN&IC_X,X,4]=0
		A_PRESS_B0[3,STPN&IC_X,X,4]=0
	      ELSE
		XF_DATA=A_PRESS_b0[3,STPN&IC_X,X,1]+A_PRESS_B0[3,STPN&IC_X,X,2]

		&& IF (VAL(A_M_NAME[X,3])- INT( VAL(A_M_NAME[X,3]))) >0 && 99.99
		&&   xerr=STANDW_ERR[X]  *100
		&&   if (xerr=0)
		&&	 xerr= int(XF_DATA   * STANDW2_ERR[X] * 100)
		&&   endif
		&&   RNDX=int(SECONDS()  * RAND())
		&&   XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
		&&   *XF_DATA1=- STANDW_ERR[X]*100 + MOD(RNDX,(STANDW_ERR[X] * 200) +1)
		&&   XF_DATA1=XF_DATA1/100
		&& ELSE
		&&   xerr=STANDW_ERR[X]
		&&   if (xerr=0)
		&&	 xerr= int(XF_DATA  * STANDW2_ERR[X] )
		&&   endif
		&&   RNDX=int(SECONDS()  * RAND())
		&&   XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
		&&   *XF_DATA1=- STANDW_ERR[X] + MOD(RNDX,(STANDW_ERR[X] * 2) +1)
		&& ENDIF

		xerr=STANDW_ERR[X]  *xdec_a[3]
		if (xerr=0)
		    xerr= int(XF_DATA	* STANDW2_ERR[X] * xdec_a[3])
		endif
		RNDX=int(SECONDS()  * RAND())
		XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
		XF_DATA1=XF_DATA1/xdec_a[3]
		X_W= XF_DATA+XF_DATA1


		IF DSPADJAW=1	  &&MDY 2021/4/22
		  if x <=gs_tot
		    X_W=A_RAND_W[2,X]
		  else
		    X_W=A_RAND_W[1,X]
		  endif
		ENDIF

		A_PRESS_B0[3,STPN&IC_X,X,4]=X_W
		A_PRESS_B0[2,STPN&IC_X,X,4]=X_W
	    ENDIF
	  ENDIF
	  *repl TM&XMC1 WITH A_PRESS_B0[3,STPN&IC_X,X,4]
	  repl TM&XMC1 WITH A_PRESS_n0[3,STPN&IC_X,X,10]

	  &&v15t
	  && A_PRESS_n0[3,5,X,10]=A_PRESS_n0[3,5,X,10] + TM&XMC1 &&¹ê»Ú­È

	  kX=_TOT_D_A[20,4] +2
	    REPL p1701	WITH _TOT_D_A[22,kx]   &&
	endif
	sele 1
	XMC1=ALLTRIM(STR(X,2,0))
	kX=_TOT_D_A[20,4] +2
	IF W0DBF=1
	  IF (STANDW_ERR[X] > 0) .or. (STANDW2_ERR[X] > 0)
	    IF A_PRESS_N0[3,STPN&IC_X,X,8] =0
	      A_PRESS_N0[3,STPN&IC_X,X,4]=0
	      A_PRESS_N0[2,STPN&IC_X,X,4]=0
	      A_PRESS_N0[3,STPN&IC_X,X,12]=0
	      A_PRESS_N0[2,STPN&IC_X,X,12]=0
	    ELSE
	      *A_PRESS_N0[3,STPN&IC_X,X,2]=A_PRESS_N0[1,STPN&IC_X,X,2]
	      XF_DATA=A_PRESS_N0[3,STPN&IC_X,X,1]+A_PRESS_N0[3,STPN&IC_X,X,2]
	      && IF (VAL(A_M_NAME[X,3])- INT( VAL(A_M_NAME[X,3]))) >0 && 99.99
	      &&   xerr=STANDW_ERR[X]  *100
	      &&   if (xerr=0)
	      &&       xerr= int(XF_DATA   * STANDW2_ERR[X] * 100)
	      &&   endif
	      &&   RNDX=int(SECONDS()  * RAND())
	      &&   XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
	      &&   *XF_DATA1=- STANDW_ERR[X]*100 + MOD(RNDX,(STANDW_ERR[X] * 200) +1)
	      &&   XF_DATA1=XF_DATA1/100
	      && ELSE
	      &&   xerr=STANDW_ERR[X]
	      &&   if (xerr=0)
	      &&       xerr= int(XF_DATA  * STANDW2_ERR[X] )
	      &&   endif
	      &&   RNDX=int(SECONDS()  * RAND())
	      &&   XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
	      &&   *XF_DATA1=- STANDW_ERR[X] + MOD(RNDX,(STANDW_ERR[X] * 2) +1)
	      && ENDIF

	      xerr=STANDW_ERR[X]  *xdec_a[3]
	      if (xerr=0)
		  xerr= int(XF_DATA   * STANDW2_ERR[X] * xdec_a[3])
	      endif
	      RNDX=int(SECONDS()  * RAND())
	      XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
	      XF_DATA1=XF_DATA1/xdec_a[3]

	      X_W=XF_DATA+XF_DATA1
	      IF DSPADJAW=1	&&MDY 2021/4/22
		if x <=gs_tot
		  X_W=A_RAND_W[2,X]
		else
		  X_W=A_RAND_W[1,X]
		endif
	      ENDIF

	      A_PRESS_N0[3,STPN&IC_X,X,4]=X_W
	      A_PRESS_N0[2,STPN&IC_X,X,4]=X_W
	      XDEC=CAL_DEC(X)
	      IF XDEC=0
		 A_PRESS_N0[3,STPN&IC_X,X,4]=INT(A_PRESS_N0[3,STPN&IC_X,X,4])
		 A_PRESS_N0[2,STPN&IC_X,X,4]=INT(A_PRESS_N0[2,STPN&IC_X,X,4])
	      ENDIF
	    ENDIF

	  ENDIF
	ENDIF
	repl TM&XMC1 WITH A_PRESS_N0[3,STPN&IC_X,X,4]

	&&v15t
	&& A_PRESS_n0[3,5,X,4]=A_PRESS_n0[3,5,X,4] + TM&XMC1 &&¬ü¤Æ­È

	  REPL p1701  WITH _TOT_D_A[22,kx]   &&
      NEXT
    ENDIF
  ELSE
    HDOK=0
  ENDIF
  XTW=0
  &&V15T
  XTINDEX=1
  if UWC_TOT=0
     XTINDEX=0
  ENDIF
  IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
  FOR  X=1 TO (GS_TOT+UWC_TOT)
    XMC_F=A_M_NAME[X,3]
    XTW=XTW+A_PRESS_N0[3,STPN&IC_X,X,4]
  NEXT
  *if  sio2_fault=0
  *   o_BUF0=get_weight()
  *   TRANS_ERR=0
  *ENDIF
  *IF A_PRESS_N0[3,STPN&IC_X+1,1,5]  =0
    XTWA=0
    XTWBA=0
    IF (HDOK=1) .AND.( FILE("C:\SA.DBF")=.T.)  .and.(INT(DISKSPACE( DAA )/1024) >250 )
      IF (E_STORE =1)
	SELE 7
	goto bott
	kX=_TOT_D_A[20,4] +2
      #ifdef  dfLNK_EN
	if scano <> _TOT_D_A[2,kx]  .OR. LAGNO1 <> _TOT_D_A[19,kx]
	  APPEN BLAN
	  REPL	scano  WITH  _TOT_D_A[2,kx]
	  REPL	LAGNO1	WITH  _TOT_D_A[19,kx]
	  COMMIT
	endif
      #else
	if scano <> _TOT_D_A[2,kx]
	  APPEN BLAN
	  COMMIT
	endif
      #endif
	IF STORAB=1
	  SELE 18
	  goto bott
      #ifdef  dfLNK_EN
	if scano <> _TOT_D_A[2,kx]  .OR. LAGNO1 <> _TOT_D_A[19,kx]
	    APPEN BLAN
	    REPL  scano  WITH  _TOT_D_A[2,kx]
	    REPL  LAGNO1  WITH	_TOT_D_A[19,kx]
	    COMMIT
	endif
      #else
	  if scano <> _TOT_D_A[2,kx]
	    APPEN BLAN
	    COMMIT
	  endif
      #endif
	ENDIF
      ENDIF
    ELSE
      HDOK=0
    ENDIF
    &&V15T
    FOR  X=1 TO (GS_TOT+UWC_TOT)
      XMC_F="9"+A_M_NAME[X,3]
      XTW=0
      XTWB=0
      && FOR XN1=1 TO STPN&IC_X
      &&   XTW=XTW+A_PRESS_N0[3,XN1,X,4]
      &&   XTWB=XTWB+A_PRESS_N0[3,XN1,X,10]
      &&   IF PNT_REMAIN=1
      &&      XTW=XTW - A_PRESS_N0[3,XN1,X,12]
      &&      XTWB=XTWB - A_PRESS_N0[3,XN1,X,12]
      &&   endif
      && NEXT
      XTW=A_PRESS_N0[3,5,X,4]
      XTWB=A_PRESS_N0[3,5,X,10]
      IF (HDOK=1) .AND.( FILE("C:\SA.DBF")=.T.)  .and.(INT(DISKSPACE( DAA )/1024) >250 )
	IF (E_STORE =1)
	  SELE 7
	  XMC1=ALLTRIM(STR(X,2,0))
	  REPL TOTM&XMC1 WITH XTW
	  COMMIT
	  IF (STORAB=1)
	     SELE 18
	     REPL TOTM&XMC1 WITH XTWB
	     COMMIT
	  ENDIF
	ENDIF
      ELSE
	HDOK=0
      ENDIF
      XTWA=XTWA+XTW
      XTWBA=XTWBA+XTWB
    NEXT
    SET DEVI TO SCRE
    kX=_TOT_D_A[20,4] +2
    IF (HDOK=1) .AND.( FILE("C:\SA.DBF")=.T.)  .and.(INT(DISKSPACE( DAA )/1024) >250 )
      IF (E_STORE =1)
	&&V15T
	XTINDEX=1
	if UWC_TOT=0
	   XTINDEX=0
	ENDIF
	IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
	SELE 7
	do  s_sa_d1

	*REPL LUDATE WITH DATE()  && 1
	*REPL SCANO WITH _TOT_D_A[2,kx]  && 2
	*REPL TOTW WITH XTWA   && 7
	*REPL LUTIME WITH STORTIME   && 8
	*REPL CARLAG  WITH _TOT_D_A[9,kx]    && 9
	*REPL TOTVUSE WITH A_PRESS_N0[3,STPN&IC_X,1,6]	 && 10
	*REPL CARNO WITH _TOT_D_A[13,kx] && 13
	*REPL TANDO WITH _TOT_D_A[14,kx] && 14
	*REPL CARDRV WITH _TOT_D_A[15,kx]   && 15
	*REPL S_STRO  WITH  _TOT_D_A[12,KX]	&&
	*REPL p1701  WITH _TOT_D_A[22,kx]   &&
	*IF COM_E=1
	*  repl  p1702	with  _TOT_D_A[4,kx]   && 4
	*  REPL LAGTTW WITH _TOT_D_A[11,kx]  && 11
	*  REPL US2 WITH _TOT_D_A[16,kx]  && 16
	*  REPL US2_1 WITH _TOT_D_A[3,kx]  && 16
	*ENDIF
	*REPL RATNO WITH  _TOT_D_A[18,kx]   &&	18
	*repl  U_PRICE WITH _TOT_D_A[21,kx]   &&
	*REPL LAGNO1 WITH  _TOT_D_A[19,kx]  &&	   LAG_PNO
	COMMIT
	IF STORAB=1
	  &&V15T
	  XTINDEX=1
	  if UWC_TOT=0
	     XTINDEX=0
	  ENDIF
	  IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
	  SELE 18
	  do  s_sa_d1
	  *REPL LUDATE WITH DATE()  && 1
	  *REPL SCANO WITH _TOT_D_A[2,kx]  && 2
	  REPL TOTW WITH XTWBA	 && 7
	  *REPL LUTIME WITH STORTIME   && 8
	  *REPL CARLAG	WITH _TOT_D_A[9,kx]    && 9
	  *REPL TOTVUSE WITH A_PRESS_N0[3,STPN&IC_X,1,6]   && 10
	  *REPL CARNO WITH _TOT_D_A[13,kx] && 13
	  *REPL TANDO WITH _TOT_D_A[14,kx] && 14
	  *REPL CARDRV WITH _TOT_D_A[15,kx]   && 15
	  *REPL S_STRO	WITH  _TOT_D_A[12,KX]	  &&
	  *REPL p1701  WITH _TOT_D_A[22,kx]   &&


	  *IF COM_E=1
	  *  repl  p1702  with	_TOT_D_A[4,kx]	 && 4
	  *  REPL LAGTTW WITH _TOT_D_A[11,kx]  && 11
	  *  REPL US2 WITH _TOT_D_A[16,kx]  && 16
	  *ENDIF
	  *REPL RATNO WITH  _TOT_D_A[18,kx]   &&  18
	  *repl  U_PRICE WITH _TOT_D_A[21,kx]	&&
	  *REPL LAGNO1 WITH  _TOT_D_A[19,kx]  &&     LAG_PNO
	  *COMMIT
	ENDIF
      ENDIF
    ELSE
      HDOK=0
    ENDIF
  IF A_PRESS_N0[3,STPN&IC_X+1,1,5]  =0
    _TOT_D_A[1,kx] :=date()
    _TOT_D_A[7,kx] :=XTWA
    _TOT_D_A[5,kx] := 0
    IF (EMPTY(_TOT_D_A[6,kx])=.F.)  .AND.   (EMPTY(_TOT_D_A[7,kx])=.F.)
    _TOT_D_A[5,kx] :=_TOT_D_A[6,kx] +_TOT_D_A[7,kx]
    ENDIF

    *if  (_TOT_D_A[17,kx]<>0)
    *  &&lag_pno=lag_pno +1
    *  lag_pno=_TOT_D_A[17,kx]
    *  SAVE TO LAGDATA9 ALL LIKE LAG*
    *endif
    lag_pno= str(val(LAG_REPNO)+1,9,0)
    lag_pno=PADR(lag_pno,SCANO_LEN," ")
    lag_pno=_TOT_D_A[2,kx]
     SAVE TO LAGDATA9 ALL LIKE LAG*

    *_TOT_D_A[2,kx] :="00"+LTRIM(STR(LAG_PNO,6,0))
    PRINTERTST=0
    DO	PRINTERTST WITH BPORT
    IF PRINTERTST=1  .AND. (empty(_Tot_d_a[2,kX]) <>.t.)   .AND. (VAL(C_PRT_REP) <>0 )
      *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	SET CONS On
	&& FSetToPrinter(bport)
	FSetToPrinter(bport,PNTW)
      *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       dO REP_&C_PRT_REP
      *FSetToPrinter(aport)
      SET DEVI TO SCRE
    ENDIF
  ENDIF


  PRINTERTST=0
  DO  PRINTERTST    WITH   APORT
  IF (PRINTERTST=1) .AND. (E_STORE =1)
     SET CONS On
     do case
     case aport="1"
       set print to lpt1
       ? chr(27) + "SP1;"
     case aport="2"
       set print to lpt2
       ? chr(27) + "SP2;"
     case aport="3"
       set print to lpt3
       ? chr(27) + "sp3;"
     endcase
     SET CONS ON
     &&V15T
     XTINDEX=1
     if UWC_TOT=0
	XTINDEX=0
     ENDIF
    IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
    &&v15t
    xfirst=0
    if	STPN&IC_X=1
      if  A_PRESS_N0[3,1,1,6]=A_PRESS_N0[3,1,1,5]
	xfirst=1
      endif
    endif
    && IF (E_STORE =1 )  .and.	(STPN&IC_X=1  )
    IF (E_STORE =1 )  .and.  (xfirst=1	)
      *DO  PNT_TIT
      *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      PNT_TITa_p(date(),@_tot_d_a)
      *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ENDIF

    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    pnt_produce(STPN&IC_X,STORTIME,_TOT_D_A[23,kx],A_PRESS_N0,0)
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if pnt_remain=0
      hTOTWACT :=ARRAy(kind)
      afill(hTOTWACT,0)
      pnt_lastw(3,STPN&IC_X,A_PRESS_N0,0,1,hTOTWACT)
    endif
  endif


  #ifdef  dfLNK_EN
  IF  E_STORE =1
    if link_net=70    &&¥xªd
      do geto_buff
    endif
  endif

  #endif && dfLNK_EN

  &&V15T
  &&V15T
  XTINDEX=1
  if UWC_TOT=0
     XTINDEX=0
  ENDIF
  IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
  ChTmp=GS_TOT +XTINDEX
  if UWC_TOT=0
    IC_X=ALLTRIM(STR(GS_TOT,2,0))
    ChTmp=GS_TOT
  ENDIF
  xIsLstRec=0
  ChkStpN=STPN&IC_X
  DO CASE
  CASE	ChkStpN=1
       IF A_PRESS_N0[3,2,ChTmp,5] =0
	 IF A_PRESS_N0[3,1,ChTmp,6] >=A_PRESS_N0[3,2,ChTmp,6]
	   xIsLstRec=1
	 ENDIF
       ENDIF
  CASE	ChkStpN =2
       IF A_PRESS_N0[3,3,ChTmp,5] =0
	 xIsLstRec=1
       ENDIF
  CASE	ChkStpN =3
       xIsLstRec=1
  ENDCASE


  && IF A_PRESS_N0[3,STPN&IC_X + 1,ChTmp,5]  =0
  IF xIsLstRec =1
    x=1
    IF X=1
      X=_TOT_D_A[20,3]
      IF X=0
	_TOT_D_A[20,4] :=0
      ELSE
	_TOT_D_A[20,4] :=X
	_TOT_D_A[20,3] :=0
      ENDIF
    ENDIF

  ENDIF
  sele &xd_wno
CASE UPTKSTP=6
      UPTKSTP=7
CASE UPTKSTP=7
  IF  ((DIN(15)=0))   && 0:WAIT
    *DOUT(14,0)
    SetDigitOut(StorerOpen,0)
    UPTANK[1,2]=SECONDS()
    X=UPTANK[1,1]
    SET COLOR TO GR+/ &C1
    @  7,UPTANK[5,1]   say  UPTANK[1,1]  PICT "99"
    @ 13,UPTANK[5,1]-2 SAY "újúKúk"
    SET COLOR TO &C2 / &C1
  ELSE
   IF lstanktmp >0
      lstanktmp =DIN(8)+10
      IF DIN(8)=0
	SET COLOR TO R+ *  / &C1
	@ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
	UPTANK[1,2]=SECONDS()
      ELSE
	SET COLOR TO GR+ / &C1
	@ 13,UPTANK[5,1]-2 SAY "újúKúk"
      ENDIF
      SET COLOR TO &C2 / &C1
    ELSE
      SET COLOR TO W+ / &C1
      @ 13,UPTANK[5,1]-2 SAY "újúKúk"
      SET COLOR TO &C2 / &C1
    ENDIF

    X=SECONDS()-UPTANK[1,2]
    IF X<0
      X=86399+SECONDS()-UPTANK[1,2]
    ENDIF
    X=UPTANK[1,1]-X
    IF	X<=0
      X=0
    ENDIF
    SET  COLO TO GR+ /&C1
    @  7,UPTANK[5,1]   say  X  PICT "99"
    SET  COLO TO &C2 /&C1
    IF ( (MIXAMP <= MIXMIN) .OR. (MIXAMP >= MIXMAX))
      *DOUT(14,0)
      SetDigitOut(StorerOpen,0)
    ELSE
      *DOUT(14,1)
      SetDigitOut(StorerOpen,1)
    ENDIF
  ENDIF
  IF  X<=0
    UPTKSTP=8
    UPTANK[2,2]=SECONDS()
    SET  COLO TO W+ /&C1
    @  7,UPTANK[5,1]   say  UPTANK[1,1]  PICT "99"
    SET COLOR TO B+ / &C1
    @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
    SET COLOR TO &C2 / &C1
    *DOUT(14,0)
    SetDigitOut(StorerOpen,0)
  ENDIF
CASE UPTKSTP=8
  IF  (DIN(15)=0       )
    *DOUT(14,0)
    SetDigitOut(StorerOpen,0)
    UPTANK[2,2]=SECONDS()
    X=UPTANK[2,1]
    SET COLOR TO GR +/ &C1
    @  9,UPTANK[5,1]   say  UPTANK[2,1]  PICT "99"
    @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
    SET COLOR TO &C2 / &C1
  ELSE
    SET COLOR TO B+ / &C1
    @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
    SET COLOR TO &C2 / &C1
    X=SECONDS()-UPTANK[2,2]
    IF X<0
      X=86399+SECONDS()-UPTANK[2,2]
    ENDIF
    X=UPTANK[2,1]-X
    IF	X<=0
      X=0
    ENDIF
    SET  COLO TO GR+ /&C1
    @  9,UPTANK[5,1]   say  X  PICT "99"
    SET  COLO TO &C2 /&C1
  ENDIF
  IF  X<=0    .AND. ((MIXAMP >MIXMIN) .AND. (MIXAMP <MIXMAX) )
    *DO  CASE
    *CASE UCHTYPE=5   .OR. UCHTYPE=6  .OR.UCHTYPE=22	.OR. UCHTYPE=7	.or.  UCHTYPE=8  .or. UCHTYPE=16  .or.	UCHTYPE=9  .OR. UCHTYPE=10    .OR. UCHTYPE=11  .or. UCHTYPE=12	.or. UCHTYPE=13 .or. UCHTYPE=17   .or. UCHTYPE=19   .or. UCHTYPE=21

    &&MDY190413
    && if gs_pre=1
    &&	 CNVSTP=0
    && endif
    && static isSetCNVSTP :=0
    isSetCNVSTP =0
    *case  cnvrst=1
    *  CNVSTP=0
    *ENDCASE
    SET  COLO TO W+ /&C1
    UPTANK[3,2]=SECONDS()
    @  9,UPTANK[5,1]   say  UPTANK[2,1]  PICT "99"
    UPTKSTP=9
    SET COLOR TO GR +/ &C1
    @ 13,UPTANK[5,1]-2 SAY "újúKúk"
    SET COLOR TO &C2 / &C1
    *DOUT(14,1)
    SetDigitOut(StorerOpen,1)
  ENDIF
CASE UPTKSTP=9
  IF  (DIN(15)=0 .OR. (MIXAMP >= MIXMAX ) .OR. (MIXAMP <= MIXMIN)	  )
    *DOUT(14,0)
    SetDigitOut(StorerOpen,0)
    UPTANK[3,2]=SECONDS()
    X=UPTANK[3,1]
    SET COLOR TO GR+ / &C1
    @ 11,UPTANK[5,1]   say  UPTANK[3,1]  PICT "99"
    @ 13,UPTANK[5,1]-2 SAY "újúKúk"
    SET COLOR TO &C2 / &C1
  ELSE
     IF lstanktmp >0
       lstanktmp =DIN(8)+10
       IF DIN(8)=0
	 SET COLOR TO R+ *  / &C1
	 @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
	 UPTANK[3,2]=SECONDS()
       ELSE
	 SET COLOR TO GR+ / &C1
	 @ 13,UPTANK[5,1]-2 SAY "újúKúk"
	 IF isSetCNVSTP=0
	   isSetCNVSTP =1
	    if gs_pre=1
	      CNVSTP=0
	    endif
	 ENDIF

       ENDIF
       SET COLOR TO &C2 / &C1
     ELSE
       SET COLOR TO W+ / &C1
       @ 13,UPTANK[5,1]-2 SAY "újúKúk"
       SET COLOR TO &C2 / &C1
     ENDIF

    *DOUT(14,1)
    SetDigitOut(StorerOpen,1)
    && SET COLOR TO B+	/ &C1
    && @ 13,UPTANK[5,1]-2 SAY "újúKúk"
    && SET COLOR TO &C2 / &C1
    X=SECONDS()-UPTANK[3,2]
    IF X<0
      X=86399+SECONDS()-UPTANK[3,2]
    ENDIF
    X=UPTANK[3,1]-X
    IF	X<=0
      X=0
    ENDIF
    SET  COLO TO GR+ /&C1
    @  11,UPTANK[5,1]	say  X	PICT "99"
    SET  COLO TO &C2 /&C1
  ENDIF
  IF  X<=0
    SET  COLO TO W+ /&C1
    @  11,UPTANK[5,1]	say  UPTANK[3,1]  PICT "99"
    UPTKSTP=10
    IF lstanktmp =0  .OR. DIN(8)=0
      SET COLOR TO W  / &C1
      @ 13,UPTANK[5,1]-2  SAY "úG--úH"
    ENDIF
    IF CNVSTP=0
      SET  COLO TO W+	/&C1
      @  4,UPTANK[5,1]	 say  UPTANK[4,1]  PICT "99"
      SET COLOR TO &C2 / &C1
    ENDIF
    *DOUT(14,0)
    SetDigitOut(StorerOpen,0)
  ENDIF
CASE UPTKSTP=10
  UPTKSTP=11
  *DOUT(14,0)
  SetDigitOut(StorerOpen,0)
  FOR XF=GS_TOT + 1  TO GS_TOT + UWC_TOT
    IF WTANK_F[XF,2]<>1
      UPTKSTP=11
      EXIT
    ENDIF
  NEXT
CASE UPTKSTP=11
   DO  CASE
   CASE (gs_pre <>1) .or. (UCHTYPE=1) .OR.  (UCHTYPE=2)
     CNVSTP=0
   ENDCASE
   UPTKSTP=0
ENDCASE
RETU

**-----------------------------------------------------------------------------
PROCEDURE  Pnt_MixTime
PARAMETERS  xPnt_MIXT,XPMIXT_PLUS,XMIXTM,RST_PRINTER,xstor
IF XPNT_MIXT =1
  xd_wno=fSelectNo()
  if xstor=1
    IF W0DBF=1
      SELE 19
      GOTO BOTT
      repl TM16 with XMIXTM
    ENDIF
    SELE 1
    GOTO BOTT
    repl TM16 with XMIXTM
  endif
  PRINTERTST=0
   DO  PRINTERTST    WITH   APORt
     *PRINTERTST=1
   IF  PRINTERTST=1
     IF RST_PRINTER=1
       *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       FSetToPrinter(aport,PNTW)
       *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     ELSE
       SET DEVI TO PRINT
     ENDIF
     @ PROW(),1   SAY  "©Õ¦X®É¶¡(s)"
     @ PROW(),13   SAY	 XMIXTM   pict "999"
     @ PROW()+1,1   SAY   " "
     if TOT_DATA[GS_TOT+UWC_TOT+2]=1
       @ PROW(),1 SAY	"=================================================================================================="
       @ PROW()+1,1  SAY  " "
       x_LAST=gs_tot+uwc_tot-ae_tot
       xpn=8
       FOR X=1 TO (GS_TOT+UWC_TOT)
	 XMC_F="9"+A_M_NAME[X,3]
	  &&  x<=X_LAST
	  &&   pw=5
	  && else
	  &&   pw=6
	  && endif
	  PW=getData_pw(A_M_NAME[X,3])
	  @  PROW(),xpn  SAY  tot_data[x]    PICT "&XMC_F"
	  xpn=xpn + pw
       NEXT
       XMC_F="99999"
       if tot_deci>0
	 XMC_F="99999.99"
       endif
       xpn=xpn +7
       @ PROW(),xpn  SAY  TOT_DATA[GS_TOT+UWC_TOT+1]   PICT "&XMC_F"
       @ PROW()+1,1  SAY   " "
     endif
     SET DEVI TO SCREE
   ENDIF
   sele &xd_wno
ENDIF
RETU
**-----------------------------------------------------------------------------
PROCEDURE  TANKSTP0    && mixer tank
PARAMETERS  P1,P2,P3
DO CASE
CASE   TANKSTP=0
CASE  TANKSTP=1 .AND. (DIN(9)=0)   .AND. (DIN(12)=1  .and.   ((MIXAMP >MIXMIN) .AND. (MIXAMP <=MIXMAX)	))
  IF PLOT_E=1
    BMP_SN[2] :=SECONDS()
    DO PLOT_MIXAS
  ENDIF
  tankstp=2
  SET COLOR TO &C7 +/ &C1
  MIXTM=0
  MIXTM_S=SECONDS()
  PAUSE_TM=0
  @ 17,64 SAY "   "
  if spacial_0=0

    &&V15T
    CHTMP=GS_TOT +1
    if UWC_TOT =0
      IC_X=ALLTRIM(STR(GS_TOT,1,0))
      CHTMP=GS_TOT
    ELSE
      IC_X=ALLTRIM(STR(GS_TOT+1,1,0))
    ENDIF
    if lchtype >= 5
      IF LAGDATE=DATE()
	LAGW=LAGW+ A_PRESS_N0[U_PRESS,Stpn&IC_X,CHTMP,5]
      ELSE
	LAGW=A_PRESS_N0[U_PRESS,Stpn&IC_X,CHTMP,5]
	LAGDATE=DATE()
      ENDIF
      SAVE TO LAGDATA9 ALL LIKE LAG*
      @ 0,26 SAY  LAGW	 PICT  "9999.9"
      ACT_V  = A_PRESS_N0[U_PRESS,Stpn&IC_X,CHTMP,6]	 &&4/6/2004

      &&v15t
      @ 17,12 SAY  A_PRESS_N0[U_PRESS,Stpn&IC_X,CHTMP,6]   PICT  "999.9"

    endif
  endif
CASE  TANKSTP=2
  *@ 17,23 SAY "¢u¢w¢w¢t¢u¢w¢w¢t¢x  ¹ê»Ú­È    ¬í     ¢Ï     ¬í      KG¢x"
  *PMIXTM
  IF DIN(15)=0	  && PAUSE
    MIXTM_S=SECONDS()
  ELSE
    IF ABS(SECONDS()-MIXTM_S)>=1
      MIXTM=MIXTM+1
      MIXTM_S=SECONDS()
    ENDIF
  ENDIF
  SET COLO TO  GR+ /&C1
  X=0
  IF PLOT_ACT=1
    X=2
  ENDIF
   @ 17+X,51 SAY MIXTM	PICT "999"
  SET COLO TO  &C2 /&C1
  IF  MIXTM>=PMIXTM
    TANKSTP=3
  ENDIF
  IF KOT=1  &&¥þ¤W
    xindex=1
  else
    xindex=GS_TOT+1
  endif
  IF SPACIAL_0 =0
    FOR   XF=xindex  TO (GS_TOT +UWC_TOT)
      IF (TIME1[XF,1] <>88)
	IF WTANK_F[XF,2]<>1
	  TANKSTP=2
	  EXIT
	ENDIF
      ENDIF
    NEXT
  ELSE
    IF UPTKSTP	> 0
      TANKSTP=2
    ENDIF
  ENDIF
  IF TANKSTP=3
    && FOR  I=GS_TOT+1	TO (GS_TOT +UWC_TOT)
    FOR  I=xindex   TO (GS_TOT +UWC_TOT)
      WTANK_F[I,2] :=0
    NEXT
  ENDIF
  IF DIN(15)=0	 && PAUSE
    MIXTM_S=SECONDS()
  ELSE
    IF ABS(SECONDS()-MIXTM_S)>=1
      MIXTM=MIXTM+1
      MIXTM_S=SECONDS()
    ENDIF
  ENDIF
  SET COLO TO  GR+ /&C1
  X=0
  IF PLOT_ACT=1
    X=2
  ENDIF
  @ 17+X,51 SAY MIXTM  PICT "999"
  SET COLO TO  &C2 /&C1
CASE  TANKSTP=3
  TANKSTP=4
CASE  TANKSTP=4 .AND.DIN(15)=1
  IF KOT=1  &&¥þ¤W
    xindex=1
  else
    xindex=GS_TOT+1
  endif

  XFnish=1
  FOR IX=xindex TO (GS_TOT+UWC_TOT)
    IF WTANK_F[IX,3]=0
      XFnish=0
      EXIT
    ENDIF
  NEXT

  IF (INT((MIXA()-2048)*MAIN_AMP/2048)<=PMIXA)	.AND.  DIN(13)=1
    Pnt_MixTime(PNT_MIXT,PMIXT_PLUS,MIXTM,0,1)
    IF PLOT_E=1
      DO  TANK_DSP
    ENDIF
    TANKSTP=5
    DROPTM_S=SECONDS()
    DROPTM=0
    IF KOT=1  &&¥þ¤W
      xindex=1
    else
      xindex=GS_TOT+1
    endif

    XFN1=1
    FOR IX=xindex TO (GS_TOT+UWC_TOT)
      IF WTANK_F[IX,3]=0
	XFN1=0
	EXIT
      ENDIF
    NEXT
    IF XFN1=1
     &&DOUT(12,1)
      BEEP=1
      FOR IX=xindex TO (GS_TOT+UWC_TOT)
	WTANK_F[IX,3]=0
      NEXT
    ELSE
      BEEP=0
    ENDIF
  ENDIF
  IF DIN(15)=0	 && PAUSE
    MIXTM_S=SECONDS()
  ELSE
    IF ABS(SECONDS()-MIXTM_S)>=1
      MIXTM=MIXTM+1
      MIXTM_S=SECONDS()
    ENDIF
  ENDIF
  SET COLO TO  GR+ /&C1
  XFN1=0
  IF PLOT_ACT=1
    XFN1=2
  ENDIF
  @ 17+XFN1,51 SAY MIXTM  PICT "999"
  SET COLO TO  &C2 /&C1
CASE  TANKSTP=5
   IF ABS(SECONDS()-MIXTM_S)>=1
     MIXTM=MIXTM+1
     MIXTM_S=SECONDS()
     SET COLO TO  GR+ /&C1
     X=0
     @ 17+X,51 SAY MIXTM  PICT "999"
     SET COLO TO  &C2 /&C1
   ENDIF

  IF DIN(13)=1
    SET COLOR TO &C10 / &C1
    @ 18,40 SAY "úLúPúPúPúPúPúPúPúKúPúPúPúPúPúPúPúPúPúO"
    IF DIN(9)=1
      @ 18,52	SAY "ûÖ"
    ENDIF
  ELSE
    SET COLOR TO R+   / &C1
    @ 18,40 SAY "úLúPúPúPúPúPúPúPúKúPúPúPúPúPúPúPúPúPúO"
    IF DIN(9)=1
      @ 18,52	SAY "ûÖ"
    ENDIF
  ENDIF
  SET COLOR TO &C7 +/ &C1
  IF DIN(15)=0	 && PAUSE
    DROPTM_S=SECONDS()
    DROPTM=0
    *DOUT(15,0)
  xn=ReadDigitOut(MixerOpen )
     if xn >0
       SetDigitOut(MixerOpen,0)
     endif
  ELSE
    IF DIN(13)=1
      IF DIN(9)=0
	DROPT_S=SECONDS()
	DROPTM=0
	*DOUT(12,0)
	SetDigitOut(lastBuzzer,0)
	IF BEEP=2
	  BEEP=1
	ENDIF
      ELSE
	IF BEEP=1
	  *DOUT(12,1)
	  SetDigitOut(lastBuzzer,1)
	  ALMTM[1,2] := SECONDS()
	  ALMTM[2,2] := 0
	  BEEP=2
	ENDIF
      ENDIF
      IF ABS(SECONDS()-DROPTM_S)>=1
	DROPTM=DROPTM+1
	DROPTM_S=SECONDS()
      ENDIF
      *DOUT(15,1)
      SetDigitOut(MixerOpen,1)
    ELSE
      DROPTM_S=SECONDS()
      DROPTM=0
      *DOUT(15,0)
      SetDigitOut(MixerOpen,0)
    ENDIF
  ENDIF
  IF DROPTM >=PMIXOP
    TANKSTP=6
  ENDIF
  SET COLO TO  W + /&C1
  @ 17,64 SAY  DROPTM	PICT  "999"
  SET COLO TO  &C2 /&C1
  IF BEEP=2
    IF ALMTM[1,2] >0
      IF (SECONDS()-ALMTM[1,2]) >= ALMTM[1,1]
	 *DOUT(12,0)
	SetDigitOut(lastBuzzer,0)
	 ALMTM[1,2] =0
	 ALMTM[2,2] := SECONDS()
      ENDIF
    ELSE
      IF (SECONDS()-ALMTM[2,2]) >= ALMTM[2,1]
	 *DOUT(12,1)
	SetDigitOut(lastBuzzer,1)
	 ALMTM[1,2] := SECONDS()
	 ALMTM[2,2] =0
      ENDIF
    ENDIF
  ENDIF
CASE  TANKSTP=6
  *DOUT(15,0)  &&MAIN M/C DOOR
  SetDigitOut(MixerOpen,0)
  *DOUT(12,0)  && LAST ALARM
  SetDigitOut(lastBuzzer,0)
  X=1
  FOR IX=1 TO kind
    IF WTANK_F[IX,3]=0
      X=0
      EXIT
    ENDIF
  NEXT
  IF X=1
    FOR IX=1 TO kind
      WTANK_F[IX,3] :=0
    NEXT
    ACT_V=-1
    @ 15,12 SAY   space(9)
    @ 16,12 SAY "     "
    @ 17,12 SAY "     "
  ENDIF
  IF  SPACIAL_0=1
     set  colo	to  W+	/&C1
     @ 15,41 SAY "©Õ¦X¢²"

  ENDIF
  SET COLOR TO &C2 / &C1
  @ 18,40 SAY "úLúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúO"
  SET COLOR TO &C7 +/ &C1
  @ 17,64 SAY  "   "
  @ 17,51 SAY "   "
  TANKSTP=0
ENDCASE

**-----------------------------------------------------------------------------
PROCEDURE  OUTDATA_RST
PARAMETERS  P1,P2,P3
** <<<<<¥þ¤W«¬±M¥Î>>>>>    XF_DATA=A_PRESS_N0[3,STPN&IC_X,X,1]+A_PRESS_N0[3,STPN&IC_X,X,2]
DRSTX=STPN7
xdec_a :=ARRAY(3)
FOR  X=1  TO (GS_TOT+UWC_TOT)
  getData_dec(a_m_name[x,3],@xdec_a)
  A_PRESS_N0[2,DRSTX,X,9]=A_PRESS_N0[2,DRSTX,X,4]
  A_PRESS_N0[2,DRSTX,X,10]=A_PRESS_N0[2,DRSTX,X,4]
  IC_X=NTOC(X)
  *IF (W0DBF=1)
  *  ntmp1= A_PRESS_N0[2,DRSTX,X,1]
  *  A_PRESS_N0[2,DRSTX,X,1]= A_PRESS_N0[2,DRSTX,X,8]
  * *  A_PRESS_N0[2,DRSTX,X,8]= ntmp1
  *ENDIF
  IF STANDW_ERR[X] > 0
    IF A_PRESS_N0[2,DRSTX,X,8] =0
      A_PRESS_N0[2,DRSTX,X,9]=0
    ELSE
      IF LCHTYPE=4
	XF_DATA=A_PRESS_N0[2,DRSTX,X,1]+A_PRESS_N0[2,DRSTX,X,2]
      ELSE
	XF_DATA=A_PRESS_N0[2,DRSTX,X,8]+A_PRESS_N0[2,DRSTX,X,11]
      ENDIF
      && IF (VAL(A_M_NAME[X,3])- INT( VAL(A_M_NAME[X,3]))) >0 && 99.99
      &&   RNDX=SECONDS()  * RAND()
      &&   XF_DATA1=- STANDW_ERR[X]*100 + MOD(RNDX,(STANDW_ERR[X] * 200) +1)
      &&   XF_DATA1=XF_DATA1/100
      && ELSE
      &&   RNDX=SECONDS()  * RAND()
      &&   XF_DATA1=- STANDW_ERR[X] + MOD(RNDX,(STANDW_ERR[X] * 2) +1)
      && ENDIF
	RNDX=SECONDS()	* RAND()
	XF_DATA1=- STANDW_ERR[X]*xdec_a[3] + MOD(RNDX,(STANDW_ERR[X]*xdec_a[3] * 2) +1)
	XF_DATA1=XF_DATA1/xdec_a[3]



      IF   ABS(XF_DATA-A_PRESS_N0[2,DRSTX,X,4]) > STANDW_ERR[X]
	A_PRESS_N0[2,DRSTX,X,9]=XF_DATA+XF_DATA1
      ENDIF
    ENDIF
  ENDIF
  A_PRESS_N0[2,DRSTX,X,4]=A_PRESS_N0[2,DRSTX,X,9]
  NEXT
RETU
**-----------------------------------------------------------------------------
PROCEDURE  stp4_2_21
PARAMETERS  P1,P2,P3
XPA1=0
XPA2= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]+A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN-1,4]+A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN-2,4]  +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN-2,4]
RDDLY(STP_FN,xpa1,xpa2)     &&care
XRD := RDDELAY[STP_FN,3]
IF XRD<>0
  IF XRD=1
    XMC_F=A_M_NAME[STP_FN,3]
    @  4,A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]+A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]  PICT  "&XMC_F"
    DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
    WTANK_F[STP_FN,1] :=1
    IF	(A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN+1,1] >0)
      EW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]+A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := INT(EW1)
      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
      XMC_F=A_M_NAME[STP_FN,3]
      *@  8,A_M_NAME[STP_FN,13]  SAY  EW1   PICT "&XMC_F"
      EWN=EW1*2048/A_M_NAME[STP_FN,10]
      SETCHDATA(STP_ZN,EWN)
      X=EWN +CHENDATA(0)  +CHENDATA(1)+CHENDATA(2)
      SETDLA(0,X)
      STP4=0
      STP5=1
    ELSE
      EWN=WDATA(0)-2048
      EW1=INT  ((EWN)*A_M_NAME[STP_FN,10]/PER/2048)
      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := INT(EW1)
      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
      XMC_F=A_M_NAME[STP_FN,3]
      *@  8,A_M_NAME[STP_FN,13]  SAY  EW1   PICT "&XMC_F"
      SETCHDATA(STP_ZN,EWN)
      X=EWN +CHENDATA(0)  +CHENDATA(1)+CHENDATA(2)
      SETDLA(0,x)
      STP4=0
      STP5=1
    ENDIF
  ENDIF
  RET_F=1
  RETU
endIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION    GET_WEIGHT
PARAMETERS  XB_TOT
  xd_wno=fSelectNo()
  IC_X=ALLTRIM(STR(GS_TOT+1,2,0))
  RET_S=STX+"D,2,"
  kX=_TOT_D_A[20,4] +2
  *XC=_TOT_D_A[2,kx]  &&REP NO
  SELE 7
  XC=SCANO
  RET_S=RET_S+FSUBSTR(XC,-20," ",0) +","
  XC=DTOS(DATE())
  RET_S=RET_S+FSUBSTR(XC,-10," ",0) +","
  XC=SUBSTR(STORTIME,1,2) + SUBSTR(STORTIME,4,2) + SUBSTR(STORTIME,7,2)
  RET_S=RET_S+FSUBSTR(XC,-10," ",0) +","
  *XC=A_PRESS_N0[3,STPN&IC_X,1,5]


  *XC=_TOT_D_A[10,kx]  &&TOTVUSE
  XC=TOTVUSE
  RET_S=RET_S+FSUBSTR(XC,-10," ",0) +","


  XC=RATVOL
  RET_S=RET_S+FSUBSTR(XC,-10," ") +","
  *XC=_TOT_D_A[13,kx]  &&CAR NO
  XC=CARNO
  RET_S=RET_S+FSUBSTR(XC,10," ") +","
  *XC=_TOT_D_A[22,kx]  &&WORK AREA  NO
  XC=P1701
  RET_S=RET_S+FSUBSTR(XC,-10," ") +",A,"
  *XC=_TOT_D_A[18,kx]  && RATNO
  XC=RATNO
  RET_S=RET_S+FSUBSTR(XC,10," ") +","
  xtotw=0
  FOR  XG=1  TO  kind
    *xc=A_PRESS_N0[3,STPN&IC_X,XG,4]
    X_DEC=CAL_DEC(XG)
    xc=STR(XB_TOT[XG],10,X_DEC)
    RET_S=RET_S+ FSUBSTR(XC,-10," ") +","
    xtotw=xtotw+VAL(xc)
  next
  XC=XTOTW
  RET_S=RET_S+ FSUBSTR(XC,-10," ")
  RET_S=RET_S + ",B,"
  *XC=_TOT_D_A[18,kx]  && RATNO
  XC=RATNO
  RET_S=RET_S+FSUBSTR(XC,10," ") +","
  xtotw=0
  FOR  XG=1  TO  kind
    *xc=A_PRESS_N0[3,STPN&IC_X,XG,1]+A_PRESS_N0[3,STPN&IC_X,XG,2]
    X_DEC=CAL_DEC(XG)
    xc=STR(XB_TOT[XG],10,X_DEC)
    RET_S=RET_S+ FSUBSTR(XC,-10," ") +","
    xtotw=xtotw+VAL(xc)
  next
  XC=XTOTW
  RET_S=RET_S+ FSUBSTR(XC,-10," ") +ETX
  *PNT_SBUF0(RET_S,100,77)
  sele &xd_wno
RETU  RET_S
&&-----------------------------------------------------------------------------
FUNCTION   CAL_DEC
PARAMETERS  XINDEX
XRET=0
X1=VAL(A_M_NAME[XINDEX,3]) -INT(VAL(A_M_NAME[XINDEX,3]))
IF X1 >0
  XRET=2
ENDIF
RETU  XRET



&&-----------------------------------------------------------------------------
FUNCTION   getData_DEC	 &&  A_M_NAME[X,3] =99.99
PARAMETERS  s_txt,ret_a
ret_a[1]=s_txt
ret_a[2]=len(s_txt)
ret_a[3]=1
xna=val(ret_a[1])
if xna-int(xna)>0
     xna=xna *10
     if (xna-int(xna))=0
       ret_a[2]=len(s_txt)-2+0.1
       ret_a[3]=10
     else
       ret_a[2]=len(s_txt)-3+0.2
       ret_a[3]=100
     endif
endif
retu
&&-----------------------------------------------------------------------------
FUNCTION   getData_PW	&&  A_M_NAME[X,3] =99.99
PARAMETERS  s_txt
XPW=5
IF LEN(S_TXT) >4
  XPW= LEN(S_TXT) +1
ENDIF
retu  XPW
&&-----------------------------------------------------------------------------
FUNCTION   PNT_SBUF0
PARAMETERS  XTEXT,LINEW,XOK
  IF  XOK=77
    XOK=PNT1_OK()
    IF XOK=1
       SET  DEVI  TO  PRINT
       XLINE=INT((LEN(XTEXT)+(LINEW -1))/LINEW)
       FOR X=0	TO   XLINE-1
	  @  PROW()+1,1  SAY SUBSTR(xtext,(X * LINEW)+1,LINEW )
       NEXT
       @  PROW()+1,1   SAY  " "
       SET  DEVI  TO SCREE
    ENDIF
  ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION   SEEK_PMIXTM
PARAMETERS  RATNO_X
XRET_S=PMIXTM
xd_wno=fSelectNo()
SELE  2
LOCA FOR ALLTRIM(RATNO)==ALLTRIM(RATNO_X)
IF .NOT. EOF()
   IF MIXSEC >30
      XRET_S=MIXSEC
   ELSE
      XRET_S=PMIXTM_O
   ENDIF
ENDIF
sele &xd_wno
RETU  XRET_S
**-----------------------------------------------------------------------------
FUNCTION    pnt_tita_p
PARAMETERS  date_p,pnt_d_a


PRINTERTST=0
DO  PRINTERTST	  WITH	 APORT
IF PRINTERTST=1
  xd_wno=fSelectNo()
  *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  && FSetToPrinter(aport)
  FSetToPrinter(aport,PNTW)
  *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  X=pnt_d_a[20,4] +2
  IF pnt_CName=1  .AND. COM_E=1

    @ PROW(),1	SAY   "«È¤á:"
    IF	EMPTY(pnt_d_a[16,X])=.F.
	@ PROW(),6 SAY	alltrim(pnt_d_a[3,X])+"(" +alltrim(pnt_d_a[16,X]) +")"
    ENDIF
  ENDIF
  @ PROW(),45  SAY   "¤é´Á:"
  @ PROW(),51  say  DATE_p
  *@ PROW(),wide_page -21  SAY	"§Ç¸¹:"
  *@ PROW(),wide_page -15 SAY  pnt_d_a[2,X]
  IF COM_E=1
    @ PROW()+1 ,1 SAY  "¤u¦a:"
    X_DET=" "
    fseek_C(13,"P1701",alltrim(pnt_d_a[22,X]),"P1702",@X_DET)
    *@ PROW(),6 SAY  alltrim(pnt_d_a[22,X] )
    XC=""
    IF EMPTY(pnt_d_a[22,X])=.F.
      XC="("  +  ALLTRIM(pnt_d_a[22,X]) +")"
    ENDIF
    @ PROW(),6 SAY  alltrim(X_DET) +XC
    @ PROW(),36  SAY  "°t¤ñ:"
    X_POS=41
  ELSE
    @ PROW(),6	SAY  "°t¤ñ:"
    X_POS=11
  ENDIF
  X_RATNO=alltrim(pnt_d_a[18,X])
  X_DET=" "
  fseek_C(2,"RATNO",X_RATNO,"DETAIL",@X_DET)
  X_DET=ALLTRIM(X_DET)
  IF   EMPTY(X_DET)=.F.
     X_RATNO=X_RATNO +" (" +X_DET +")"
  ENDIF
  @ PROW(),X_POS SAY   X_RATNO

  @ PROW(),68 SAY  "¨®¸¹:"
  X_s=alltrim(pnt_d_a[13,X])
  *SELE 10
  *LOCA FOR  ALLTRIM(P12100)=ALLTRIM(X)
  *IF  EOF()=.F.
  *  @ PROW(),90  SAY  ALLTRIM(P12101)
  *ELSE
    @ PROW(),75  SAY  X_s
  *ENDIF


  *@ PROW()+1,1  SAY  "¾÷§O: 2 ¸¹¾÷"
  @ PROW()+1,1	SAY  "§Ç¸¹:"
  @ PROW(),6 SAY  pnt_d_a[2,X]
  @ PROW(),40 SAY  "§~«×(CM):"
  @ PROW(),50 SAY  pnt_d_a[14,X]  PICT "9999"
  @ PROW(),60 SAY  "±j«×(Kg/cm2):"
  @ PROW(),75 SAY  pnt_d_a[12,X]








  @ PROW()+1,1 SAY   "=================================================================================================="
  @ PROW()+1,1 SAY   "      NO.  ®É¶¡  ¦Ì¼Æ  ²Ö­p(¦Ì)"
  @ PROW()+1,1 SAY   " "
  xpn=8
  &&x1=gs_tot+uwc_tot-ae_tot
  FOR X=1 TO (GS_TOT+UWC_TOT)
    && X1=A_M_NAME[X,3]
    && if x1<=4
    &&	pw=5
    && else
    &&	pw=X1+1
    && endif
    PW=getData_PW(A_M_NAME[X,3])
    xcd=fSUBSTR(A_M_NAME[X,1],-pw," ")
    @  PROW(),xpn+1  SAY  XCD
    xpn=xpn + pw
  NEXT
  xpn=xpn +1
  @ PROW(),xpn+1  SAY	" Á`­«"
  @ PROW()+1,1 SAY   "=================================================================================================="
  @ PROW()+1,1 SAY  " "
  SET DEVI TO SCRE
  sele &xd_wno
endif
RETU
**-----------------------------------------------------------------------------
FUNCTION    pnt_produce
PARAMETERS  p_STPN,p_STORTIME,p_mixsec,pnt_press,RST_PRINTER
PRINTERTST=0
DO  PRINTERTST	  WITH	 APORt
  *PRINTERTST=1
IF PRINTERTST=1
  IF RST_PRINTER=1
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    && FSetToPrinter(aport)
    FSetToPrinter(aport,PNTW)
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ELSE
    SET DEVI TO PRINT
  ENDIF
  @ PROW(),6  SAY  P_STPN  PICT "99"
  @ PROW(),10	 SAY  p_STORTIME
  p_mixv=pnt_press[3,p_STPN,1,5]
  @ PROW(),18	 SAY  pnt_press[3,p_STPN,1,5]  PICT "99.9"
  @ PROW(),25	 SAY  pnt_press[3,p_STPN,1,6]  PICT "99.9"
  if read_dbf(SELPAR,75,"PA12")=1
    @ PROW(),40   SAY  "©Õ¦X®É¶¡(¬í):"
    @ PROW(),54    SAY	p_mixsec  PICT "99.9"
  ENDIF
  @ PROW()+1,1	 SAY  "°t¤è"
  XTW=0
  xpn=8
  && x_LAST=gs_tot+uwc_tot-ae_tot
  xdec_a :=ARRAY(3)
  FOR X=1 TO (GS_TOT+UWC_TOT)
    getData_dec(a_m_name[x,3],@xdec_a)
    XMC_F=xdec_a[1];
    && XMC_F=A_M_NAME[X,3]
    if pnt_func=1 && .OR. ERRPNT_E=1
      XTMP0 =  pnt_press[3,P_STPN,X,1]
    else
      XTMP0 =  pnt_press[3,P_STPN,X,1] + pnt_press[3,P_STPN,X,2]
    endif
    && if x<=X_LAST
    &&	 pw=5
    &&	 if pnt_func=1
    &&	   xtmp0=int((xtmp0 /p_mixv)  )   &&+0.2
    &&	 else
    &&	   xtmp0=int(xtmp0)
    &&	 endif
    && else
    &&	 pw=6
    &&	 if pnt_func=1
    &&	   xtmp0=int((xtmp0*100 /p_mixv)     )/100   && +0.2
    &&	 else
    &&	   xtmp0=int(xtmp0*100)/100
    &&	 endif
    && endif
    if pnt_func=1
      xtmp0=int((xtmp0 *xdec_a[3] /p_mixv)+0.4	)/xdec_a[3]
    else
      xtmp0=int(xtmp0 *xdec_a[3] +0.4 )/xdec_a[3]
    endif
    XTW =XTW+ XTMP0
    PW=getData_PW(A_M_NAME[X,3])
    @  PROW(),xpn+1  SAY  XTMP0    PICT "&XMC_F"
    xpn=xpn + pw
  NEXT
  XMC_F="9999"
  if tot_deci>0
    XMC_F="99999"
  endif
  xpn=xpn +2
  @ PROW(),xpn	SAY  XTW   PICT  "&XMC_F"


  if pnt_func=1
    @ PROW()+1,1   SAY	"½Õ¤ô«á"
    XTW=0
    xpn=8
    x_LAST=gs_tot+uwc_tot-ae_tot
    xdec_a :=array(3)
    FOR X=1 TO (GS_TOT+UWC_TOT)
      getData_dec(a_m_name[x,3],@xdec_a)
      XMC_F=xdec_a[1]
      XTMP0 =  pnt_press[3,P_STPN,X,1]
      xtmp0=int(xtmp0*xdec_a[3]+0.4 )/xdec_a[3]

      && XMC_F=A_M_NAME[X,3]
      && XTMP0 =  pnt_press[3,P_STPN,X,1]
      && if x<=X_LAST
      &&   xtmp0=int(xtmp0  )
      &&   pnt_press[3,P_STPN,X,2] =int(pnt_press[3,P_STPN,X,2])
      && else
      &&   xtmp0=int(xtmp0*100 )/100
      && endif
      IF XTMP0 >0
	XTMP0 =  XTMP0 +pnt_press[3,P_STPN,X,2]
      ENDIF
      XTW =XTW+ XTMP0
      && if x<=X_LAST
      &&   pw=5
      && else
      &&   pw=6
      && endif
      PW=getData_PW(A_M_NAME[X,3])
      @  PROW(),xpn+1  SAY  XTMP0    PICT "&XMC_F"
      xpn=xpn + pw
    NEXT
    XMC_F="9999"
    if tot_deci>0
      XMC_F="9999.99"
    endif
    xpn=xpn +2
    @ PROW(),xpn  SAY  XTW   PICT "&XMC_F"
  endif
  @ PROW()+1,1	 SAY  "­p¶q­È"
  XTW=0
  xpn=8
  FOR X=1 TO (GS_TOT+UWC_TOT)
    XMC_F=A_M_NAME[X,3]
    XTMP0 =  pnt_press[3,P_STPN,X,4]
    XTW =XTW+ XTMP0
    PW=getData_pw(A_M_NAME[X,3])
    @  PROW(),xpn+1  SAY  XTMP0    PICT "&XMC_F"
    xpn=xpn + pw
  NEXT
  XMC_F="9999"
  if tot_deci>0
    XMC_F="99999"
  endif
  xpn=xpn +2
  @ PROW(),xpn	SAY  XTW   PICT "&XMC_F"
  @ PROW()+1,1	 SAY  " "
ENDIF
SET CONS On
SET DEVI TO SCRE
RETU
&&---------------------------------------------------------------
FUNCTION    gotosno
PARAMETERS  xb_sno
retn=-2
sele 1
goto bott
if alltrim(lagno1)==xb_sno
   retn=1
endif
if (eof()=.f.)	.and.	retn=1
  WHILE   (alltrim(lagno1)==xb_sno)  .AND.  (BOF()=.F.)
    skip -1
  END WHILE
  IF BOF()
     GOTO TOP
  ELSE
    skip
  ENDIF
  retn=recno()
endif
return	retn
&&---------------------------------------------------------------
FUNCTION    add_data
PARAMETERS  xb_tm,xindex
  for xloop=1	to  kind
    xlpc=alltrim(str(xloop,2,0))
    xb_tm[xloop] =xb_tm[xloop]	+  (tm&xlpc * xindex)
  next
return
**-------------------------------------------------------------
FUNCTION    save2_sadbf
PARAMETERS  xa_tot
  sele 7
  goto bott
  if eof()=.f.
    xa_serno=alltrim(lagno1)
    xa_ok=gotosno(xa_serno)
    if xa_ok>0
      sele 1
      xa_tot :=array(kind)
      AFILL(XA_TOT,0)
      WHILE alltrim(lagno1)==xa_serno
	 if sign="3"
	   &&+++++++++++++++++++++
	   add_data(@xa_tot,1)
	 endif
	 if sign="4"
	   &&+++++++++++++++++++++
	   add_data(@xa_tot,-1)
	 endif
	 skip
      END WHILE
      sele 7
      for xloop=1   to	kind
	xlpc=alltrim(str(xloop,2,0))
	 repl TOTM&XLPC with XA_TOT[XLOOP]
      next
    endif
  endif
  sele 1
  goto bott
RETU
**-------------------------------------------------------------
FUNCTION    pnt_remains
PARAMETERS  p_pos,p_STPN,pnt_press,RST_PRINTER,p_stor,p_totwact
PRINTERTST=0
&&++++++++++++++++++++++++++++
*rst_WTANK_F2()
if (E_STORE =1)   .and. p_stor=1
  SELE	1
  GOTO BOTT
  px_date=ludate
  px_lagno1=lagno1
  IF TM1<> -99
    APPE   BLANK
    repl   ludate  with  px_date
    repl   lagno1   with  px_lagno1
    repl   sign  with  "4"
  ENDIF
  FOR  XN=1  TO    GS_TOT +UWC_TOT
    xNC=ALLTRIM(STR(XN,2,0))
    XD= pnt_press[p_pos,P_STPN,XN,12]
    XDEC=CAL_DEC(XN)
    IF XDEC=0
      pnt_press[p_pos,P_STPN,XN,12] =INT(XD)
    ENDIF
    REPL  TM&XNC   WITH  pnt_press[p_pos,P_STPN,XN,12]
  NEXT
  if  pnt_press[p_pos,P_STPN+1,1,5]=0
    APPE   BLANK
    repl   ludate  with  px_date
    repl   lagno1   with  px_lagno1
    repl   sign  with  "5"
    FOR  XN=1  TO    GS_TOT +UWC_TOT
      xNC=ALLTRIM(STR(XN,2,0))
      REPL  TM&XNC   WITH    p_totwact[XN]
    NEXT
  endif
endif
if  pnt_press[p_pos,P_STPN+1,1,5]=0
  &&++++++++++++++++++++++++++++++++++
   pa_tot :=array(kind)
   AFILL(pA_TOT,0)
   save2_sadbf(@PA_TOT)
   IF  STAR=1
     o_BUF0=GET_WEIGHT(PA_TOT)
   ENDIF
endif
DO  PRINTERTST	  WITH	 APORt
  *PRINTERTST=1
IF (E_STORE =1) .AND.  PRINTERTST=1
  IF RST_PRINTER=1
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    && FSetToPrinter(aport)
    FSetToPrinter(aport,PNTW)
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ELSE
    SET DEVI TO PRINT
  ENDIF
  @ PROW(),1   SAY  "´Ý¯d­È"
  x_LAST=gs_tot+uwc_tot-ae_tot
  xpn=8
  FOR X=1 TO (GS_TOT+UWC_TOT)
    XMC_F=A_M_NAME[X,3]
    XTMP0= pnt_press[p_pos,P_STPN,X,12]
    PW=getData_pw(A_M_NAME[X,3])
    @  PROW(),xpn+1  SAY  XTMP0    PICT "&XMC_F"
    xpn=xpn + pw
  NEXT

    @ PROW()+1,1   SAY	"»~®t¢H"
    xpn=8
    FOR X=1 TO (GS_TOT+UWC_TOT)
      if maker_sn=1
	 x_err=0
      else
	x_err= pnt_press[p_pos,P_STPN,X,12]
      endif
      XTMP0_1= (pnt_press[p_pos,P_STPN,X,4]- X_ERR - (pnt_press[p_pos,P_STPN,X,1] + pnt_press[p_pos,P_STPN,X,2]  )) * 100
      XTMP0_2= pnt_press[p_pos,P_STPN,X,1] + pnt_press[p_pos,p_STPN,X,2]
      XTMP0= XTMP0_1/XTMP0_2
      PW=getData_pw(A_M_NAME[X,3])
      @  PROW(),xpn+1  SAY  XTMP0    PICT "99.9"
      xpn=xpn + pw
    NEXT

    @ PROW()+1,1   SAY	"§t¤ô¢H"
    xpn=8
    FOR X=1 TO (GS_TOT)
      XTMP0= INT(pnt_press[p_pos,P_STPN,X,2]*1000/pnt_press[p_pos,P_STPN,X,1])/10
      PW=getData_pw(A_M_NAME[X,3])
      @ PROW(),xpn+1  SAY  XTMP0    PICT "99.9"
      xpn=xpn + pw
    NEXT
    @ PROW()+1,1  SAY	" "
    tot_data[gs_tot +uwc_tot+2]=0
  IF pnt_press[p_pos,p_STPN+1,1,5]  =0
    tot_data[gs_tot +uwc_tot+2]=1
    if pnt_mixt<>1
      @ PROW(),1 SAY   "=================================================================================================="
      @ PROW()+1,1  SAY  " "
    endif
    XTW=0
    xpn=8
    x_LAST=gs_tot+uwc_tot-ae_tot
    && FOR X=1 TO (GS_TOT+UWC_TOT)
    &&	 XMC_F="9"+A_M_NAME[X,3]
    &&	 XTMP0=0
    &&	 FOR XN1=1 TO P_STPN
    &&	   XDE=CAL_DEC(X)
    &&	   IF  XDE=0
    &&	     pnt_press[p_pos,XN1,X,4]=INT(pnt_press[p_pos,XN1,X,4])
    &&	     pnt_press[p_pos,XN1,X,12] =INT(pnt_press[p_pos,XN1,X,12] )
    &&
    &&	   ENDIF
    &&	   IF MAKER_SN=1
    &&	     X_ERR=0
    &&	   ELSE
    &&	     X_ERR=pnt_press[p_pos,XN1,X,12]
    &&	   ENDIF
    &&	   XTMP0=XTMP0+pnt_press[p_pos,XN1,X,4]-X_ERR
    &&	 NEXT
    &&	 IF (P_TOTWACT[X]>0)
    &&	    XTMP0=P_TOTWACT[X]
    &&	 ENDIF
    &&	 XTW=XTW+XTMP0
    &&	 PW=getData_pw(A_M_NAME[X,3])
    &&	 tot_data[x]=xtmp0
    &&	 if pnt_mixt<>1
    &&	   @  PROW(),xpn  SAY  XTMP0	PICT "&XMC_F"
    &&	 endif
    &&	 xpn=xpn + pw
    && NEXT

    FOR X=1 TO (GS_TOT+UWC_TOT)
       XTMP0=pnt_press[p_pos,5,X,4]-X_ERR
       xtw=xtw+XTMP0
       xpn=xpn + pw
       PW=getData_pw(A_M_NAME[X,3])
       if pnt_mixt<>1
	 @  PROW(),xpn	SAY  XTMP0    PICT "&XMC_F"
       endif
    next
    XMC_F="99999"

    if tot_deci>0
      XMC_F="99999.99"
    endif
    xpn=xpn +1
    tot_data[gs_tot +uwc_tot+1]=XTW
    if pnt_mixt<>1
      @ PROW(),xpn  SAY  XTW   PICT "&XMC_F"
      @ PROW()+1,1  SAY   " "
    endif
  ENDIF
  SET CONS On
  SET DEVI TO SCRE
ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION    FSetToPrinter
PARAMETERS  fport,XPNTW
SET CONS On
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
x= RDLPT(VAL(fPORT)-1)
IF (x =144)  .or. (x=pnt_redy_code)
  SET DEVI TO PRINT
  if empty(Xpntw)=.t.
    @ PROW(),0 say   "~X15;"
  else
    @ PROW(),0 say   " ~X&Xpntw" +";"
  endif
endif
RETU

**-----------------------------------------------------------------------------
FUNCTION    FSetToPnt
PARAMETERS  fport,fcmd
PRINTERTST=0
DO  PRINTERTST	  WITH	 fPORT
if  PRINTERTST	=0
  return
endif
SET CONS On
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
SET DEVI TO PRINT
*SetPntWx("fcmd")
  @ PROW(),0 SAY   fcmd
RETU

**-----------------------------------------------------------------------------
FUNCTION    save_produce1
PARAMETERS  p_STPN,p_STORTIME,p_mixsec,pnt_press,P_TOT,P_DATE,p_totwact
  sele 1
  APPE BLAN
  REPL LUTIME  WITH  p_STORTIME
  repl LUDATE WITH P_DATE
  REPL LAG_VUSE WITH pnt_press[3,p_STPN,1,6]
  REPL	MIX_SEC  WITH  p_mixsec
  REPL TVUSE  WITH pnt_press[3,p_STPN,1,5]
  REPL PAN_NO  WITH  P_STPN
  REPL	sign  WITH  "1"
  HX=P_TOT[20,4] +2
  REPL SCANO WITH P_TOT[2,HX]
  REPL CARNO WITH P_TOT[13,HX]
  REPL RATNO WITH P_TOT[18,HX]
  REPL LTANDO WITH P_TOT[14,HX]
  REPL LAGNO1  WITH  P_TOT[19,HX]     && SNO
  REPL S_STRO  WITH  P_TOT[12,HX]     && SNO
  REPL p1701  WITH   P_TOT[22,Hx]   &&
  *REPL SCANO2	WITH  P_TOT[17,HX]     && S_MAX


  FOR X=1 TO (GS_TOT+UWC_TOT)
    XC=ALLTRIM(STR(X,2,0))
    REPL TM&XC WITH pnt_press[3,P_STPN,X,1]
  NEXT


  APPEN   BLANK
  REPL LAGNO1  WITH  P_TOT[19,HX]     && SNO
  repl LUDATE WITH P_DATE
  REPL	sign  WITH  "2"
  FOR X=1 TO (GS_TOT+UWC_TOT)
    XC=ALLTRIM(STR(X,2,0))
    REPL TM&XC WITH  pnt_press[3,P_STPN,X,2]
  NEXT


  APPEN   BLANK
  REPL LAGNO1  WITH  P_TOT[19,HX]     && SNO
  repl LUDATE WITH P_DATE
  REPL	sign  WITH  "3"
  FOR X=1 TO (GS_TOT+UWC_TOT)
    XC=ALLTRIM(STR(X,2,0))
    REPL TM&XC WITH   pnt_press[3,P_STPN,X,4]
  NEXT
  COMMIT
RETU
**-------------------------------------------------------------
FUNCTION    save_sadbf
PARAMETERS  p_STPN,p_STORTIME,p_mixsec,pnt_press,P_TOT,P_DATE,p_totwact
  HX=P_TOT[20,4] +2
  SELE 7
  appen  blank
  REPL LUDATE WITH p_date  && 1
  REPL SCANO WITH P_TOT[2,Hx]  && 2
  REPL LUTIME WITH P_STORTIME	&& 8
  REPL CARNO WITH P_TOT[13,Hx] && 13
  REPL TANDO WITH P_TOT[14,Hx] && 14
  REPL S_STRO  WITH  P_TOT[12,HX]     &&
  REPL p1701  WITH P_TOT[22,Hx]   &&
  REPL US2 WITH P_TOT[16,Hx]  && 16
  REPL US2_1 WITH P_TOT[3,Hx]  && 16
  REPL RATNO WITH  P_TOT[18,Hx]   &&  18
  *repl  U_PRICE WITH P_TOT[21,Hx]   &&
  REPL LAGNO1 WITH  P_TOT[19,Hx]  &&	 LAG_PNO
  if com_e=1
    REPL CARLAG  WITH P_TOT[9,Hx]    && 9
    REPL CARDRV WITH P_TOT[15,Hx]   && 15
    repl  p1702  with  P_TOT[4,Hx]   && 4
    REPL LAGTTW WITH P_TOT[11,Hx]  && 11
    *REPL    SCANO2  WITH  P_TOT[17,Hx]     && 17   S_MAX
  endif



  X_KINDTOT=GS_TOT+UWC_TOT
  X2_TOT :=ARRAY(X_KINDTOT +1)
  FOR X2=1 TO (X_KINDTOT+1)
     X2_TOT[X2]=0
  NEXT
  LOOPX2=1
  DO WHILE (A_PRESS_N0[3,LOOPX2,1,5]>0)
    X2_TOT[X_KINDTOT+1]=0
    FOR X2=1 TO (X_KINDTOT)
      XC=ALLTRIM(STR(X2,2,0))
      X2_TOT[X2]=X2_TOT[X2] + pnt_press[3,LOOPX2,X2,4] - pnt_press[3,LOOPX2,X2,12]
      X2_TOT[X_KINDTOT +1]=X2_TOT[X_KINDTOT +1] + X2_TOT[X2]
    NEXT
    LOOPX2=LOOPX2 +1
    IF	(A_PRESS_N0[3,LOOPX2,1,5]=0)
      REPL TOTVUSE WITH A_PRESS_N0[3,LOOPX2-1,1,6]   && 10
    ENDIF
  ENDDO
  REPL TOTW WITH   X2_TOT[X_KINDTOT +1]
  FOR X2=1 TO (X_KINDTOT)
    XC=ALLTRIM(STR(X2,2,0))
    if (p_totwact[x2] >0)
      REPL TOTM&XC  WITH   p_totwact[X2]
    else
      REPL TOTM&XC  WITH   X2_TOT[X2]
    endif
  NEXT
  COMMIT
RETU
**------------------------------------------------------------
**-------------------------------------------------------------
FUNCTION    pnt_Lastw
PARAMETERS  p_pos,p_STPN,pnt_press,RST_PRINTER,p_stor,p_totwact
PRINTERTST=0
&&++++++++++++++++++++++++++++
*rst_WTANK_F2()
x_LAST=gs_tot+uwc_tot-ae_tot
if  pnt_press[p_pos,P_STPN+1,1,5]=0
  &&++++++++++++++++++++++++++++++++++
   pa_tot :=array(kind)
   AFILL(pA_TOT,0)
   save2_sadbf(@PA_TOT)
endif
DO  PRINTERTST	  WITH	 APORt
IF PRINTERTST=1
  IF RST_PRINTER=1
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    && FSetToPrinter(aport)
    FSetToPrinter(aport,PNTW)
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ELSE
    SET DEVI TO PRINT
  ENDIF
  if  errpnt_e=1
    @ PROW(),1	 SAY  "»~®t¢H"
    xpn=8
    FOR X=1 TO (GS_TOT+UWC_TOT)
      if maker_sn=1
	 x_err=0
      else
	x_err= pnt_press[p_pos,P_STPN,X,12]
      endif
      XTMP0_1= (pnt_press[p_pos,P_STPN,X,4]-x_err  - (pnt_press[p_pos,P_STPN,X,1] + pnt_press[p_pos,P_STPN,X,2]  )) * 100
      XTMP0_2= pnt_press[p_pos,P_STPN,X,1] + pnt_press[p_pos,p_STPN,X,2]
      XTMP0= XTMP0_1/XTMP0_2
      PW=getData_pw(A_M_NAME[X,3])
      @  PROW(),xpn+1  SAY  XTMP0    PICT "99.9"
      xpn=xpn + pw
    NEXT
    @ PROW()+1,1  SAY	" "
   endif
     if  pnt_func=1
       @ PROW(),1   SAY  "§t¤ô¢H"
       xpn=8
       FOR X=1 TO (GS_TOT)
	 XTMP0= INT((pnt_press[p_pos,P_STPN,X,2]*1000/pnt_press[p_pos,P_STPN,X,1])    )/10     &&+0.2
	 PW=getData_pw(A_M_NAME[X,3])
	 @ PROW(),xpn+1  SAY  XTMP0    PICT "99.9"
	 xpn=xpn + pw
       NEXT
       @ PROW()+1,1  SAY   " "
    endif
  IF pnt_press[p_pos,p_STPN+1,1,5]  =0
    @ PROW(),1 SAY   "=================================================================================================="
    @ PROW()+1,1  SAY  " "
    XTW=0
    xpn=8
    x_LAST=gs_tot+uwc_tot-ae_tot
    &&V15T

    && FOR X=1 TO (GS_TOT+UWC_TOT)
    &&	 XMC_F="9"+A_M_NAME[X,3]
    &&	 XTMP0=0
    &&	 FOR XN1=1 TO P_STPN
    &&	   XDE=CAL_DEC(X)
    &&	   IF  XDE=0
    &&	     pnt_press[p_pos,XN1,X,4]=INT(pnt_press[p_pos,XN1,X,4])
    &&	     pnt_press[p_pos,XN1,X,12] =INT(pnt_press[p_pos,XN1,X,12] )

    &&	   ENDIF
    &&	   IF MAKER_SN=1
    &&	     X_ERR=0
    &&	   ELSE
    &&	     X_ERR=pnt_press[p_pos,XN1,X,12]
    &&	   ENDIF

    &&	   XTMP0=XTMP0+pnt_press[p_pos,XN1,X,4] -X_ERR
    &&	 NEXT
    &&	 IF (P_TOTWACT[X]>0)
    &&	    XTMP0=P_TOTWACT[X]
    &&	 ENDIF
    &&	 XTW=XTW+XTMP0
    &&	 PW=getData_pw(A_M_NAME[X,3])
    &&	 @  PROW(),xpn	SAY  XTMP0    PICT "&XMC_F"
    &&	 xpn=xpn + pw
    && NEXT

    &&V15T
    FOR X=1 TO (GS_TOT+UWC_TOT)
       XTMP0=pnt_press[p_pos,5,X,4]-X_ERR
       xtw=xtw+XTMP0
       XMC_F="9"+A_M_NAME[X,3]
       PW=getData_pw(A_M_NAME[X,3])
       if pnt_mixt<>1
	 @  PROW(),xpn	SAY  XTMP0    PICT "&XMC_F"
       endif
       xpn=xpn + pw
    next


    XMC_F="99999"
    if tot_deci>0
      XMC_F="999999"
    endif
    xpn=xpn +1
    @ PROW(),xpn  SAY  XTW   PICT "&XMC_F"
    @ PROW()+1,1  SAY	" "
  ENDIF
  SET CONS On
  SET DEVI TO SCRE
ENDIF
RETU
**-----------------------------------------------------------------------------
PROCEDURE  S_SA_d1
PARAMETERS  P1,P2,P3
    kX=_TOT_D_A[20,4] +2
    XTINDEX=1
    IF UWC_TOT=0
      XTINDEX=0
    ENDIF
	IC_X=ALLTRIM(STR(GS_TOT+XTINDEX,2,0))
REPL LUDATE WITH DATE()  && 1
REPL SCANO WITH _TOT_D_A[2,kx]	&& 2
REPL TOTW WITH XTWA   && 7
REPL LUTIME WITH STORTIME   && 8
REPL CARLAG  WITH _TOT_D_A[9,kx]    && 9
REPL TOTVUSE WITH A_PRESS_N0[3,STPN&IC_X,1,6]	&& 10
REPL CARNO WITH _TOT_D_A[13,kx] && 13
REPL TANDO WITH _TOT_D_A[14,kx] && 14
REPL CARDRV WITH _TOT_D_A[15,kx]   && 15
REPL S_STRO  WITH  _TOT_D_A[12,KX]     &&
REPL p1701  WITH _TOT_D_A[22,kx]   &&


IF COM_E=1
  repl	p1702  with  _TOT_D_A[4,kx]   && 4
  REPL LAGTTW WITH _TOT_D_A[11,kx]  && 11
  REPL US2 WITH _TOT_D_A[16,kx]  && 16
  REPL US2_1 WITH _TOT_D_A[3,kx]  && 16
  *REPL    SCANO2  WITH  _TOT_D_A[17,kx]     && 17   S_MAX
  *REPL LAG_LAG with  _TOT_D_A[11,kx]  && 16
  *REPL CAR_LAG  with _TOT_D_A[9,kx]  && 16
ENDIF
REPL RATNO WITH  _TOT_D_A[18,kx]   &&  18
&& repl  U_PRICE WITH _TOT_D_A[21,kx]	&&
REPL LAGNO1 WITH  _TOT_D_A[19,kx]  &&	  LAG_PNO
COMMIT
RETU
**-----------------------------------------------------------------------------
PROCEDURE  DRAW_P1
PARAMETERS  P1,P2,P3
    @  3,UPTANK[5,1]-2	SAY "¢z¢w¢{"
    @  4,UPTANK[5,1]-2	SAY "¢x"
    @  4,UPTANK[5,1]+2	SAY	"¢x"
    @  5,UPTANK[5,1]-2	SAY "¢u¢w¢}"
    @  6,UPTANK[5,1]-2	SAY "¢u¢w¢{"
    @  7,UPTANK[5,1]-2	SAY "¢x"
    @  7,UPTANK[5,1]+2	SAY	"¢x"
    @  8,UPTANK[5,1]-2	SAY "¢u¢w¢t"
    @  9,UPTANK[5,1]-2	SAY "¢x"
    @  9,UPTANK[5,1]+2	SAY	"¢x"
    @ 10,UPTANK[5,1]-2	SAY "¢u¢w¢t"
    @ 11,UPTANK[5,1]-2	SAY "¢x"
    @ 11,UPTANK[5,1]+2	SAY	"¢x"
    @ 12,UPTANK[5,1]-2	SAY "¢x  ¢x"
    @ 13,UPTANK[5,1]-2	SAY "úG--úH"
    XP= UPTANK[5,1]-29
    IF XP <0
      XP=1
    ENDIF
    @ 13,XP  SAY " ¢z¢wúR¢w¢w¢w¢wúR¢w¢w¢w¢w¢{úG--úH"
    @ 14,XP  SAY " ¢|¢wúQ¢w¢w¢w¢wúQ¢w¢w¢w¢w¢}"
    @ 13,UPTANK[5,1]-4 SAY  "¢{úG--úH "
    @ 14,UPTANK[5,1]-4 SAY  "¢}       "
    SET COLOR TO W+/&C1
    &&@  4,UPTANK[5,1]	 say  UPTANK[4,1]  PICT "99"
    @  7,UPTANK[5,1]   say  UPTANK[1,1]   PICT "99"
    @  9,UPTANK[5,1]   say  UPTANK[2,1]    PICT "99"
    @ 11,UPTANK[5,1]   say  UPTANK[3,1]   PICT "99"
    SET COLOR TO &C2 / &C1
RETU





#ifdef	dfLNK_EN


**-----------------------------------------------------------------------------
PROCEDURE  GETO_BUFF
PARAMETERS  P1,P2,P3
IF PCL745=0
IC_X=ALLTRIM(STR(GS_TOT+1,2,0))
X=_TOT_D_A[20,4] +2
&&REPL SCANO WITH _TOT_D_A[2,X],CARNO WITH _TOT_D_A[13,X],TVUSE  WITH A_PRESS_N0[3,STPN&ic_x,1,5] ,RATNO WITH _TOT_D_A[18,X],LTANDO WITH _TOT_D_A[14,X]


  O_BUF=chr(2)
  O_BUF=o_buf+substr(alltrim(_TOT_D_A[18,X],8,0)+space(8),1,8)	 &&RATNO
  O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&ic_x,1,5] *10,3,0)	   &&¥»½L¦Ì¼Æ
  O_BUF=O_BUF+" "  &&¾Þ§@­û
  O_BUF=O_BUF+SUBSTR(alltrim(_TOT_D_A[13,X]) + space(8),1,8)  && carno
  O_BUF=O_BUF+STR(STPN&ic_x,1,0)  &&½L¦¸
  O_BUF=O_BUF+STR(_Tot_d_a[10,X] *10,3,0)  &&¥»¨®¦Ì¼Æ


  &&  ACTIME=TIME()
  ACTIME= _TOT_D_A[8,X]
  O_BUF=O_BUF+ACTIME
  && O_BUF=O_BUF+TIME()
  O_BUF=O_BUF+ACTIME


  #ifdef   _dfTansAct

    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,1,10],5,0) && S1  && ,10]=act  ,4]=good data
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,2,10],5,0) && S2
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,3,10],5,0) && G1
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,4,10],5,0) && G2
    O_BUF=O_BUF+"    0"  && G3

    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,5,10],5,0)  && w1
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,6,10],5,0)  && w2
    O_BUF=O_BUF+"    0"  && W3

    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,9,10],5,0)  && c1
    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,7,10],5,0)    && c2
    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,8,10],5,0)  && ¦Ç
    && O_BUF=O_BUF+"    0"  && C3
    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,10,10],5,0)  && Äl¥Û


    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,7,10],5,0)  && c1
    O_BUF=O_BUF+"    0"  && C2
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,10,10],5,0)	&& c3
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,8,10],5,0)  && c4
    O_BUF=O_BUF+"    0"  && C5



    O_BUF=O_BUF+STR((A_PRESS_N0[3,STPN&IC_X,11,10])*100,5,0)  && ae1
    O_BUF=O_BUF+STR((A_PRESS_N0[3,STPN&IC_X,12,10])*100,5,0) && ae2
    O_BUF=O_BUF+STR((A_PRESS_N0[3,STPN&IC_X,13,10])*100,5,0) && ae3
    O_BUF=O_BUF+"    0"  && AE4
    O_BUF=O_BUF+"    0"  && AE5

  #else

    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,1,4],5,0) && ,10]=act  ,4]=good data
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,2,4],5,0)
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,3,4],5,0)
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,4,4],5,0)
    O_BUF=O_BUF+"    0"  && G3


    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,5,4],5,0)  && w1
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,6,4],5,0)  && w2
    O_BUF=O_BUF+"    0"  && W3




    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,9,4],5,0)  && c1
    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,7,4],5,0)  && c2
    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,8,4],5,0)  && ¦Ç
    && O_BUF=O_BUF+"    0"  && C3
    && O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,10,4],5,0)  && Äl¥Û

    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,7,4],5,0)   && c1
    O_BUF=O_BUF+"    0"  && C2
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,10,4],5,0)	&& c3
    O_BUF=O_BUF+STR(A_PRESS_N0[3,STPN&IC_X,8,4],5,0)  && c4
    O_BUF=O_BUF+"    0"  && C3



    O_BUF=O_BUF+STR((A_PRESS_N0[3,STPN&IC_X,11,4])*100,5,0)  && ae1
    O_BUF=O_BUF+STR((A_PRESS_N0[3,STPN&IC_X,12,4])*100,5,0) && ae2
    O_BUF=O_BUF+STR((A_PRESS_N0[3,STPN&IC_X,13,4])*100,5,0) && ae2
    O_BUF=O_BUF+"    0"  && AE4
    O_BUF=O_BUF+"    0"  && AE5

  #endif


  xn=get_wratio(3,STPN&IC_X,1)
  O_BUF=O_BUF+STR(xn*100,5,0) && && s1§t¤ô²v
  xn=get_wratio(3,STPN&IC_X,2)
  O_BUF=O_BUF+STR(xn*100,5,0) && && s2§t¤ô²v
  xn=get_wratio(3,STPN&IC_X,3)
  O_BUF=O_BUF+STR(xn*100,5,0) && && g1§t¤ô²v
  xn=get_wratio(3,STPN&IC_X,4)
  O_BUF=O_BUF+STR(xn*100,5,0) && && g2§t¤ô²v
  O_BUF=O_BUF+"    0"  && g3§t¤ô²v
  if   A_PRESS_N0[3,STPN&ic_x+1,1,5]>0	 && ? §À½L
    O_BUF=O_BUF+"0"
  else
    O_BUF=O_BUF+"1"   &&§À½L
  endif
  O_BUF=O_BUF+CHR(3)
  XBCC=GET_BCC(@O_BUF,2,158)
  O_BUF=O_BUF+CHR(XBCC)
  &&OUT_REP=10
  LNK_FULI(0,1,0)   && ²Ä¤@½Lstart  tx to  server

ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION GET_BCC
PARAMETERS  S_TXT,B_S,B_END
T_L=LEN(S_TXT)
T_L1=1
XBCC=0
FOR XLOP=B_S  TO B_END
  NASC=ASC(SUBSTR(S_TXT,XLOP,1))
  XBCC=NXOR(XBCC,NASC)
NEXT
RETU  XBCC
**---------------------------------------
FUNCTION get_wratio
PARAMETERS xindex ,XSTPN,XSTP_FN
 xwratio=0
 xw=A_PRESS_N0[xindex,XSTPN,XSTP_FN,1]
  if  xw>0
      xwratio =int(A_PRESS_N0[xindex,XSTPN,XSTP_FN,2] *100 *100/xw )/100
  endif
RETU  xwratio





#ENDif	&&#ifdef  dfLNK_EN




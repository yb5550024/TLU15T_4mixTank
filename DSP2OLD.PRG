
#INCLUDE "SIO_TXT.CH"
#INCLUDE "T15_COM.H"
sET COLO TO &C7 +/ &C1
if  sio2_fault=0
   DO ChkMixerFunc
   *do transceive
endif
x=s_bcc("12")
IF INFUNC =1
  T0A=INKEY()
  IF T0A <> 0
    RETU
  ENDIF
ENDIF
if ERROR_LINK=0
  C_BUFF=SPACE(20)
  N=SIO_READ(0,C_BUFF)
  IF  N >0
    *C_READ=C_READ+SUBSTR(C_BUFF,1,N)
    *@ 20,0  SAY C_READ
    ??	SUBSTR(C_BUFF,1,N)
    IF	LEN(C_READ) > 70
      C_READ=""
    ENDIF
  ENDIF
ENDIF
FOR  X=13 TO 12
  MTANK_MARK(6,X,1)
  CTANK_MARK(11,X,1)
  INKEY(1)
  MTANK_MARK(6,X,0)
  CTANK_MARK(11,X,0)
  INKEY(1)
NEXT
@ 0,71 SAY  TIME()
IF DO0_DSP=1
  FOR  x=1  TO (GS_TOT+UWC_TOT)
    h_plus=0
    xn=ReadDigitOut(1,x-1)
    @ 1+h_plus,A_M_NAME[x,2]  SAY  xn  pict  "9"
    DO0_DSPF=1
  NEXT
  FOR  x=1  TO (KLCHN+KUCHN)
    xn=ReadDigitOut(2,x-1)
    *@ 13,(A_M_NAME[x,20]/8)  SAY  rd_do2(x-1)	pict  "9"
    @ 13,(A_M_NAME[x,20]/8)  SAY  xn   pict  "9"
    DO0_DSPF=1
  NEXT
  @ 14,UPTANK[5,1]    SAY   rd_do2(14)	pict  "9"
  xn=ReadDigitOut(MixerOpen )
  @ 19,58    SAY   xn  pict  "9"
  @ 19,62    SAY   "Bee"
  xn=ReadDigitOut(lastBuzzer)
  @ 19,66    SAY   xn  pict  "9"

ELSEIF DO0_DSPF=1
 @ 1,0 CLEA  TO 1,79
  DO0_DSPF=0
ENDIF
IF lstanktmp >0
  IF DIN(8)+10 <> lstanktmp
     lstanktmp =DIN(8)+10
     IF DIN(8)=1
	SET COLOR TO GR +/ &C1
	@ 13,UPTANK[5,1]-2 SAY "újúKúk"
     ELSE
       SET COLOR TO W+	/ &C1
       @ 13,UPTANK[5,1]-2 SAY "ú^ú]ú_"
     ENDIF
     SET COLOR TO &C2 / &C1
  ENDIF
ENDIF


IF  STAR=0 .AND. DOSIGN=1 .AND. DIN(15)=1
  @ 1,0 SAY "      "
  DOSIGN=0
  SETMEM(HEXTODEC("284"),INT(PDROP1*INTNO))
  SETMEM(HEXTODEC("286"),INT(PDRCL*INTNO))
  SETMEM(HEXTODEC("288"),INT(PDROP2*INTNO))
  SETMEM(HEXTODEC("28A"),INT(PMIXTM*INTNO))
  SETMEM(HEXTODEC("28C"),INT(PMIXA*2048/MAIN_AMP)+2048)
  SETMEM(HEXTODEC("28E"),INT(PMIXOP*INTNO))
ENDIF
IF  STAR=0
  if spacial=1
    if spacial_0 <>  din(7)
       spacial_0 =  din(7)
       DO   DSP_SPACIAL
    endif
  endif
endif
*do  chk_cancel_key
IF STAR=1
  if (	din(5)=0  .AND. DAct_Sw <>9 )	.OR.  K_DIN5 =1
     IF DSPD_NOR=0
       dspd_nor=1
       DspSetData(1)
       SET COLOR TO w +/ &C1
       @ 0,66 SAY "®É¶¡"
     ENDIF
  else
     IF DSPD_NOR=1
       dspd_nor=0
       DspSetData(8)
       SET COLOR TO &c5 +/ &C1
       @ 0,66 SAY "®É¶¡"
     ENDIF
  endif
  DO CASE
  CASE	 DOSIGN=1 .AND.   DIN(15)=1
    DOSIGN=0
    x=RDN_DATA(HEXTODEC("82A"))
    S1="6C1"    &&  SV16.COM
    IF X=13910	&& 3656H
      S1="7C1"  && SV16DBL.COM
    ENDIF
    SET_DB(HEXTODEC(S1),0) &&¼È°± disable
    RESTOUT()
    OFF_LONG=ABS(SECONDS()-OFF_TIME)
    MIXSTM=MIXSTM + OFF_LONG
    @ 1,0 SAY "      "
    IF (KOT=0  ) .AND. (UPTKSTP=3)
      SET COLOR TO W/ &C1
      @  3,UPTANK[5,1]-6  SAY "¢z¢s¢w¢w¢{"
      @  4,UPTANK[5,1]-6  SAY "¢x¢x    ¢x"
      @  5,UPTANK[5,1]-6  SAY "¢x¢u¢w¢w¢}"
      @  6,UPTANK[5,1]-6  SAY "úUúV"
      @  7,UPTANK[5,1]-6  SAY "¢x¢x"
      @  8,UPTANK[5,1]-6  SAY "¢x¢x"
      @  9,UPTANK[5,1]-6  SAY "¢x¢x"
      @ 10,UPTANK[5,1]-6  SAY "¢x¢x"
      @ 11,UPTANK[5,1]-6  SAY "úUúV"
      @ 12,UPTANK[5,1]-6  SAY "¢x¢x"
      @ 13,UPTANK[5,1]-6  SAY "    "
      @ 13,UPTANK[5,1]-38  SAY "¢z¢w¢wúR¢w¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢q¢t"
      @ 14,UPTANK[5,1]-38  SAY "¢|¢w¢wúQ¢w¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢r¢}"
      SET COLOR TO &C2 / &C1
    ENDIF

    DO CASE
    CASE  TANKSTP=2
      *dout(8,1)
      xx=ABS(INT((PDROP1-abs(SECONDS() -MIXSTM)) *INTNO))
      SETMEM(HEXTODEC("284"),xx)
      SETMEM(HEXTODEC("286"),INT(PDRCL*INTNO))
      SETMEM(HEXTODEC("288"),INT(PDROP2*INTNO))
      SETMEM(HEXTODEC("28A"),ABS(INT((PMIXTM-abs((SECONDS() -MIXSTM)) )*INTNO)))
      SETMIX()
      setdrop()
    CASE  TANKSTP=4  .or. TANKSTP=3
      *dout(8,1)
      SETMEM(HEXTODEC("284"),0)
      SETMEM(HEXTODEC("286"),0)
      XX=ABS(INT((PDROP1+PDRCL+PDROP2-abs((SECONDS() -MIXSTM)) )*INTNO))
      SETMEM(HEXTODEC("288"),XX)
      XX=ABS(INT((PMIXTM-abs((SECONDS() -MIXSTM)) )*INTNO))
      SETMEM(HEXTODEC("28A"),XX)
      SETMIX()
      setdrop()
    ENDCASE
  CASE	 DOSIGN=0  .AND.     DIN(15)=0
    DOSIGN=1
    x=RDN_DATA(HEXTODEC("82A"))
    S1="6C1"    &&  SV16.COM
    IF X=13910	&& 3656H
      S1="7C1"        && SV16DBL.COM
    ENDIF
    SET_DB(HEXTODEC(S1),1) &&¼È°± enable
    WAITOUT()
    SETMEM(HEXTODEC("284"),0)
    SETMEM(HEXTODEC("286"),0)
    SETMEM(HEXTODEC("288"),0)
    OFF_TIME=SECONDS()
    *SET COLOR TO &C5* +/ &C1
    SET COLO TO R+ /&C1
    @ 1,0 SAY " Wait "
    SET COLOR TO &C2 +/ &C1
  ENDCASE
ELSEIF X_MONI=77
  DO MONI
ENDIF
if ABS(seconds()-dsptime) >0.3
  dsptime=seconds()
  DO CASE
  CASE	LCHTYPE=2
    IF STAR=1
      IF     ISDEMO=1	.and. dosign=0
	&& DO DEMO_INP
      ENDIF
      IF W0DBF=1 .AND. DSPD_NOR=0
	FOR I=1 TO GS_TOT
	  IC_X=ALLTRIM(STR(I,2,0))
	  IF (STP&IC_X >=1)  .OR. (I=4 .AND. STP5 >0)
	    IF	A_PRESS_N0[2,1,I,1]>0
	      A_M_NAME[I,10]=A_M_NAME[I,9] * A_PRESS_N0[2,STPN&IC_X,I,8]/A_PRESS_N0[2,STPN&IC_X,I,1]
	    ENDIF
	  ELSE
	    A_M_NAME[I,10]=A_M_NAME[I,9]
	  ENDIF
	NEXT
      ENDIF

      DD1=INT((CHENDATA(0))*A_M_NAME[1,10]/PER/2048)
      DD2=INT((CHENDATA(1))*A_M_NAME[2,10]/PER/2048)
      DD3=INT((CHENDATA(2))*A_M_NAME[3,10]/PER/2048)-disc2_s3
      DD4=INT((CHENDATA(3))*A_M_NAME[4,10]/PER/2048)
      DD5=INT((CHENDATA(4))*A_M_NAME[5,10]/PER/2048)
      @ 8,A_M_NAME[1,13]  SAY	 DD1   PICT "9999"
      @ 8,A_M_NAME[2,13]  SAY	DD2   PICT "9999"
      @ 8,A_M_NAME[3,13]  SAY	DD3   PICT "9999"
      @ 8,A_M_NAME[4,13]  SAY	DD4   PICT "9999"
      @ 8,A_M_NAME[5,13]  SAY	DD5   PICT "9999"
      IF W0DBF=1  .AND. DSPD_NOR=0
	FOR I=1 TO KLCHN
	  IC_X=ALLTRIM(STR(I,2,0))
	  IF (STP&IC_X >=1)
	    IF	A_PRESS_N0[2,1,I,8]>0
	      A_M_NAME[I,12]=A_M_NAME[I,6] * A_PRESS_N0[2,STPN&IC_X,I,8]/A_PRESS_N0[2,STPN&IC_X,I,1]
	    ENDIF
	  ENDIF
	NEXT
      ENDIF
      A_M_NAME[4,12]=A_M_NAME[4,10]
      IF  W0DBF=1
	FOR I=	1  to GS_TOT
	  *IC_X=ALLTRIM(STR(I,2,0))
	  *IF (STP&IC_X >=1)
	    A_M_NAME[I,10]=A_M_NAME[I,9]
	  *ENDIF
	NEXT
      ENDIF
    ENDIF
    @ 10,A_M_NAME[1,16] SAY INT((WDATA(0)-2048)*A_M_NAME[1,12]/PER/2048)   PICT "9999"
    @ 10,A_M_NAME[2,16]  SAY INT((WDATA(1)-2048)*A_M_NAME[2,12]/PER/2048)   PICT "9999"
    @ 10,A_M_NAME[3,16]  SAY INT((WDATA(2)-2048)*A_M_NAME[3,12]/PER/2048)   PICT "9999"
    IF	(DSPD_NOR=0) .AND. ((STP4>=1 .AND. STP4<=3) .OR. (STP5>=1 .AND. STP5<=6))
      DD5_MY=INT((WDATA(3)-CHENDATA(3)-CHENDATA(4)-2048)*A_M_NAME[4,12]/PER/2048)
      @ 10,A_M_NAME[4,16]  SAY INT(DD4 +DD5 +DD5_MY)   PICT "9999"
    ELSE
      @ 10,A_M_NAME[4,16]  SAY INT((WDATA(3)-2048)*A_M_NAME[4,12]/PER/2048)   PICT "9999"
    ENDIF
    IF W0DBF=1
      FOR I=1 TO KLCHN
	*IC_X=ALLTRIM(STR(I,2,0))
	*IF (STP&IC_X >=1)
	*  IF  A_PRESS_N0[2,1,I,8]>0
	    A_M_NAME[I,12]=A_M_NAME[I,6]
	*  ENDIF
	*ENDIF
      NEXT
    ENDIF
  CASE	 LCHTYPE=32
  ENDCASE
  DO  D_UPPER
  mixamp=INT((MIXA()-2048)*MAIN_AMP/2048)
  IF ((MIXAMP <= 10) .OR. (MIXAMP >= MIXMAX))
     SET  COLO	TO  R+ / &C1
     MIX_ERR=1
     @ 14,58 SAY  " ²V¦X"
     @ 15,58 SAY  " ¹q¬y"
  ELSE
    IF MIX_ERR=1
      SET COLOR TO &C5 +/ &C1
      @ 14,58 SAY  " ²V¦X"
      @ 15,58 SAY  " ¹q¬y"
    ENDIF
     SET  COLO	TO  W+	/ &C1
     MIX_ERR=0
  ENDIF
  X=0
  IF PLOT_ACT=1
    X=2
  ENDIF
  if dspe_mixamp=1
    @ 17+X,57 SAY  mixamp   PICT  "999"
  endif
  IF  WATER_INPUT=0
    PWATER=INT((WDATA(15)-2048)*WATER_ADJ/2048)
    SET  COLO  TO  W+  / &C1
   * if PWATER<0
   *	PWATER=0
   * ELSEIF PWATER>100
   *	PWATER=100
   * ENDIF
  if dspe_mixamp=1
    @ 17,71 SAY  PWATER  PICT "9999"
  endif
  else
    if rd_do2(12)=1
       SET  COLO  TO  W+  / &C1
    ELSE
      SET  COLO  TO  W	/ &C1
    endif
    *@ 0,63 SAY  PWATER  PICT "999"
  ENDIF
  IF PLOT_E=1
    IF (TANKSTP >0 )   .AND.  (TANKSTP <5)
      if  empty(bmp_sn[2])=.t.
	  BMP_SN[2]=SECONDS()
      endif
      IF (SECONDS()-BMP_SN[2]) > PLOT_PN[7]
	DO PLOT_MIXAS
      ENDIF
      DO PLOT_MIXA
    ENDIF
  ENDIF
ENDIF
*______________________________________________________________________________
***SCALE_DSP(W0DBF,DSPD_NOR,STAR,0,
FUNCTION  SCALE_DSP
PARAMETERS  PW0DBF,PDSPD_NOR,PSTAR,WEITR,MAT_TOTW,MAT_STAR,MAT_END
SCALE_DW=MAT_TOTW
*IF (PW0DBF=1) .AND. (PDSPD_NOR=0) .AND. ( PSTAR=1) .AND.  (MAT_TOTW > 0)
IF (PW0DBF=1) .AND. (PDSPD_NOR=0) .AND. ( PSTAR=1) .and. (a_press_n0[2,1,MAT_STAR,1] > 0  .or. a_press_n0[2,1,MAT_STAR,8] > 0 )   .and. (a_press_n0[2,1,MAT_STAR,1] <> a_press_n0[2,1,MAT_STAR,8] )
  FSKIP=1
  FOR I=MAT_STAR TO MAT_END
    IC=NTOC(I)
    IF	STP&IC > 0
      FSKIP=0
      EXIT
    ENDIF
  NEXT
  IF  FSKIP=0
    IC=NTOC(MAT_END)
    *DO CASE
    *CASE   (STP&IC > 0)
      SCALE_X1=WDATA(WEITR)-2048
      SCALE_X2=0
      FOR I=MAT_STAR TO MAT_END
	SCALE_X2=SCALE_X2 + CHENDATA(I-1)
      NEXT
      IF SCALE_X2 > 0
	SCALE_DW=MAT_TOTW * SCALE_X1 /SCALE_X2
      ENDIF
    *ENDCASE
  ENDIF
ELSE
  SCALE_DW= (WDATA(WEITR)-2048)*A_M_NAME[WEITR+1,12]/2048
ENDIF
RETU  SCALE_DW
&&-----------------------------------------------------------------------------
FUNCTION   LEDEACH_DSP
PARAMETERS  PCB_N,CH_N,X_DATA,x_decdsp
x_data1=INT(abs(x_data)  * (10 ^x_decdsp)  )
d1_1=160
d2_0=10
d2_1=160
pch=0
if ch_n <=7
  if X_data < 0
    SIMBOUT[CH_N+1,1]=2 ^ CH_N
  ELSE
    SIMBOUT[CH_N+1,1]=0
  endif
endif
do case
case ch_n >=8
  ch_n=ch_n -8
  pch=64
  if X_data < 0
    SIMBOUT[CH_N+1,2] := 2 ^ CH_N
  ELSE
    SIMBOUT[CH_N+1,2] := 0
  endif
  IF CH_N=1
    MM=SIMBOUT[1,2]+SIMBOUT[2,2]
    _out(576 +2,MM)
    MM=0
    FOR  I=1 TO 8
      MM=MM+SIMBOUT[I,1]
    NEXT
    _out(576,MM)
  ENDIF
case ch_n >=4
  ch_n=ch_n  -4
  pch=1
endcase
d1_0=mod(X_data1,10)
if int(x_data1/10) >0
  d1_1=mod(int(X_data1/10),10)*16
  if int(x_data1/100) >0
    d2_0=mod(int(X_data1/100),10)
    if int(x_data1/1000) >0
      d2_1=mod(int(X_data1/1000),10)*16
    endif
  endif
endif
mm=0
d1=d1_0+d1_1
d2=d2_0+d2_1
_out(LED_IO,d1)
xn=255-(2 ^(ch_n *2))
_out(LED_IO +pch + 1,xn )
_out(LED_IO +pch  + 1,255 )
_out(LED_IO,d2)
xn=255-(2 ^(ch_n *2+1))
_out(LED_IO +pch  + 1,xn )
_out(LED_IO +pch  + 1,255 )
RETU
&&-----------------------------------------------------------------------------
FUNCTION   N_DIV_nused
PARAMETERS  NDX,NDIV,N_DEC
XA=10 **N_DEC
NDX *=XA
IF (XA =100)  .AND. (NDIV <>1)
  NDIV *=XA
ENDIF
NDX=INT((NDX +(0.49 * NDIV))/NDIV )  * NDIV
NDX /=XA
RETU  NDX
&&-----------------------------------------------------------------------------
FUNCTION   N_DIV
PARAMETERS  NDX,NDIV
NDX=INT((NDX +(0.49 * NDIV))/NDIV )  * NDIV
RETU  NDX
&&-----------------------------------------------------------------------------
FUNCTION   N_DIV2
PARAMETERS  NDX,NDIV,dsp_type  && 25.65 ,0.5,"99.99"
XA=1
if substr(alltrim(dsp_type),-2,1)="."
  XA=10
elseif substr(alltrim(dsp_type),-3,1)="."
  XA=100
endif
NDX *=XA
IF NDIV <>1
  NDIV *=XA
ENDIF
NDX=INT((NDX +(0.49 * NDIV))/NDIV )  * NDIV
NDX /=XA
RETU  NDX
&&-----------------------------------------------------------------------------
FUNCTION   getDigit
PARAMETERS  dsp_type  && "99.99" =retu 2
xdig=0
if substr(alltrim(dsp_type),-2,1)="."
  xdig=1
elseif substr(alltrim(dsp_type),-3,1)="."
  xdig=2
endif
RETU  xdig
&&-----------------------------------------------------------------------------








&&-----------------------------------------------------------------------------
PROCEDURE   D_UPPER
PARAMETERS  P1,P2,P3
DO CASE
CASE  UCHTYPE=1
CASE  UCHTYPE=2
  IF STAR=1
    IF W0DBF=1	.AND. DSPD_NOR=0
      FOR I= GS_TOT + 1  to GS_TOT + UWC_TOT
	IC_X=ALLTRIM(STR(I,2,0))
	IF (STP&IC_X >=1)  .OR. (I=8 .AND. STP9 >0)
	  IF  A_PRESS_N0[2,1,I,1]>0
	    A_M_NAME[I,10]=A_M_NAME[I,9] * A_PRESS_N0[2,STPN&IC_X,I,8]/A_PRESS_N0[2,STPN&IC_X,I,1]
	  ELSE
	    A_M_NAME[I,10]=1
	  ENDIF
	ELSE
	  A_M_NAME[I,10]=A_M_NAME[I,9]
	ENDIF
      NEXT
    ENDIF
    DD1=INT((CHENDATA(5))*A_M_NAME[6,10]/PER/2048)
    DD2=INT((CHENDATA(6))*A_M_NAME[7,10]/PER/2048)
    DD3=INT((CHENDATA(7))*A_M_NAME[8,10]/PER/2048)
    DD4=INT((CHENDATA(8))*A_M_NAME[9,10]/PER/2048)
    DD5=((CHENDATA(9))*A_M_NAME[10,10]/PER/2048)
    DD6=INT((CHENDATA(10))*A_M_NAME[11,10]*100/PER/2048)/100
    DD7=INT((CHENDATA(11))*A_M_NAME[12,10]*100/PER/2048)/100
    @ 8,A_M_NAME[6,13]	  SAY	 DD1   PICT "9999"
    @ 8,A_M_NAME[7,13]	   SAY	 DD2   PICT "9999"
    @ 8,A_M_NAME[8,13]	   SAY	 DD3   PICT "9999"
    ICS=A_M_NAME[9,3]
    @ 8,A_M_NAME[9,13]	   SAY	 DD4   PICT "&ICS"
    ICS=A_M_NAME[10,3]
    @ 8,A_M_NAME[10,13]     SAY   DD5	PICT "&ICS"
    IF A_M_NAME[11,13]	<>0
      ICS=A_M_NAME[11,3]
      @ 8,A_M_NAME[11,13]     SAY   DD6   PICT "&ICS"
    ENDIF
    IF A_M_NAME[12,13]	<>0
      ICS=A_M_NAME[12,3]
      @ 8,A_M_NAME[12,13]     SAY   DD7   PICT "&ICS"
    ENDIF
  ENDIF
  IF W0DBF=1
    A_M_NAME[KLCHN+1,12]=A_M_NAME[GS_TOT+1,10]
    A_M_NAME[KLCHN+2,12]=A_M_NAME[GS_TOT+2,10]
    A_M_NAME[KLCHN+3,12]=A_M_NAME[GS_TOT+3,10]
    A_M_NAME[KLCHN+4,12]=A_M_NAME[GS_TOT+5,10]

    FOR I= GS_TOT + 1  to GS_TOT + UWC_TOT
      *IC_X=ALLTRIM(STR(I,2,0))
      *IF (STP&IC_X >=1)
	A_M_NAME[I,10]=A_M_NAME[I,9]
      *ENDIF
    NEXT
  ENDIF

  DD1=INT(((WDATA(KLCHN+0)-2048)*A_M_NAME[KLCHN+1,12])/PER/2048)
  DD2=INT(((WDATA(KLCHN+1)-2048)*A_M_NAME[KLCHN+2,12])*PERCON/PER/2048)
  IF (DSPD_NOR=0) .AND. ((STP8>=1 .AND. STP8<=3) .OR. (STP9>=1 .AND. STP9<=5))
    DD3=DD3+DD4
    DD3_MY=INT(((WDATA(KLCHN+2)-2048-CHENDATA(7)-CHENDATA(8))*A_M_NAME[KLCHN+3,12])/PER/2048)
  ELSE
    DD3=INT(((WDATA(KLCHN+2)-2048)*A_M_NAME[KLCHN+3,12])/PER/2048)
    DD3_MY=0
  ENDIF
  DD4=(((WDATA(KLCHN+3)-2048)*A_M_NAME[KLCHN+4,12])/PER/2048)
  DD5=(((WDATA(KLCHN+4)-2048)*A_M_NAME[KLCHN+5,12])/PER/2048)
  W_1=DD2
  W_2=DD3
  XDSPC=ALLTRIM(A_M_NAME[KLCHN+1,5])
  @ 10,A_M_NAME[KLCHN+1,16]   SAY DD1	PICT "&XDSPC"
  XDSPC=ALLTRIM(A_M_NAME[KLCHN+2,5])
  @ 10,A_M_NAME[KLCHN+2,16]   SAY DD2	PICT "&XDSPC"

  XDSPC=ALLTRIM(A_M_NAME[KLCHN+3,5])
  @ 10,A_M_NAME[KLCHN+3,16]   SAY (DD3 + DISC2_C2N)+DD3_MY   PICT "&XDSPC"
  XDSPC=ALLTRIM(A_M_NAME[KLCHN+4,5])
  @ 10,A_M_NAME[KLCHN+4,16]   SAY DD4	PICT "&XDSPC"
  XDSPC=ALLTRIM(A_M_NAME[KLCHN+5,5])
  IF A_M_NAME[KLCHN+5,16]  <>0
    @ 10,A_M_NAME[KLCHN+5,16]	SAY DD5   PICT "&XDSPC"
  ENDIF

  DA726(int(IO_726+2),INT(2048+2048*(DD1/DA_MAX2)))
  DA726(int(IO_726+4),INT(2048+2048*(DD2/DA_MAX3)))
  x_x1=int(IO_726+6)
  x_x2=INT(2048 + (2048*DD3/DA_MAX4))
  DA726(x_x1,x_x2)
  DA726(int(IO_726+8),INT(2048+2048*(DD4/DA_MAX5)))
CASE  UCHTYPE=99
   DO  DSP2_UP99
ENDCASE
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   DSP_SPACIAL
PARAMETERS  P1,P2,P3
if spacial_0=1
  SET COLOR TO GR+ / &C1
  @ 12,47			  SAY " ¬í  Àu½è¤ôªd©Õ¦X¬yµ{"
  SET COLOR TO W+ / &C1
  @ 13,41 SAY "©Õ¦X¢°   "
  @ 14,41 SAY "©Õ¦X¢±   "
  @ 15,41 SAY "©Õ¦X¢²   "
  @ 13,48  SAY	SPACMIXTM[1,1]	PICT  "99"
  @ 14,48  SAY	SPACMIXTM[2,1]	PICT  "99"
 *@ 16,52 SAY  SPACMIXTM[3,1] PICT "99"
  SET COLOR TO &C2 / &C1
else
  if  lchtype <> 21
    SET COLOR TO &C2 / &C1
    @ 12,47 SAY "                     "
    *@ 13,47 SAY "         "
    @ 13,47			    SAY "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{"
    *@ 13,51			      SAY "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{"
    @ 14,41 SAY "         "
    @ 15,41 SAY "         "
    SET COLOR TO W+  / &C1
    @ 16,52 SAY  PMIXTM PICT "99"
    SET COLOR TO &C2 / &C1
  endif
endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION   LED_DSP
PARAMETERS  PCB_N,CH_N,X_DATA,x_decdsp
x_data1=abs(x_data)
d1_1=160
d2_0=10
d2_1=160
d1_0=mod(X_data1,10)
if (int(x_data1/10) >0)  .or. (x_decdsp>0 )
  d1_1=mod(int(X_data1/10),10)*16
  if (int(x_data1/100) >0)   .or. (x_decdsp>1 )
    d2_0=mod(int(X_data1/100),10)
    if (int(x_data1/1000) >0)	.or. (x_decdsp>2 )
      d2_1=mod(int(X_data1/1000),10)*16
    endif
  endif
endif
mm=0
d1=d1_0+d1_1
d2=d2_0+d2_1
if X_data < 0
  mm=128
endif
_out(LED_IO,d1)
_out(LED_IO+2,d2)
_out(LED_IO+4,(4*PCB_N)+CH_N+mm)
_out(LED_IO+4,(4*PCB_N)+CH_N+mm+16)
_Out(LED_IO+4,17)
RETU
&&-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
FUNCTION _SEND_RS40
PARAMETERS  SLN,x_decn,sdn1
IF SIO1_FAULT <> 0
   RETU
ENDIF
txc=send_txt1 + chr(sln) + chr(x_decn)
bccn=sln + x_decn
IF (X_DECN >0)
  SDN1=STR(SDN1,6,X_DECN)
  SDNC=SDN1
   SDN1=""
   FOR X2=1 TO 5
     XSDN=SUBSTR(SDNC,-X2,1)
     IF XSDN <> "."
       SDN1=XSDN + SDN1
     ENDIF
   NEXT
ELSE
SDN1=STR(SDN1,4,0)
ENDIF
FOR X2=1 TO 4
  x1_tmp=SUBSTR(SDN1,X2,1)
  bccn=BCCN + ASC(X1_TMP)
  TXC=TXC + X1_TMP
NEXT
BCCN=MOD(BCCN,128)
TXC=TXC +CHR(3) + CHR(BCCN) + CHR(4)
*com_write(S_PORT-1,TXC)
SIO_PUTB(S_PORT,TXC)
RETU

&&-----------------------------------------------------------------------------
&&¤j¦r¹õ
FUNCTION   SEND_ES2001
PARAMETERS  x_decn,sdn1,xmark
IF SIO2_FAULT <> 0
   RETU
ENDIF
txc="ST,GS,"
IF (SDN1 <0)
  TXC =TXC +"-"
  SDN1=-SDN1
ELSE
  TXC =TXC +"+"
ENDIF
IF (X_DECN >0)
  SDNC=STR(SDN1,7,X_DECN)
ELSE
  SDNC=STR(SDN1,7,0)
ENDIF
TXC=TXC +SDNC
if empty(xmark)=.f.
  TXC=TXC + xmark
endif
TXC=TXC +CHR(13) +  CHR(10)
SIO_PUTB(S2_PORT,TXC)
RETU


&&-----------------------------------------------------------------------------
FUNCTION   GET_RND
PARAMETERS  STDN
IF STDN=0
   STDN=2
ENDIF
XRAND=int(RAND() *  SECONDS())
RETN =( -STDN + MOD(XRAND,2*STDN))
RETU   RETN
&&-----------------------------------------------------------------------------
FUNCTION    GET_MCALW
PARAMETERS  X_STP_FN
if   A_M_NAME[X_STP_FN,10] >0
  IF (VAL(A_M_NAME[X_STP_FN,3])  <100)
    DDY1[X_STP_FN] =INT((CHENDATA(X_STP_FN-1))*A_M_NAME[X_STP_FN,10]*100/PER/2048)/100
  ELSE
    DDY1[X_STP_FN] =INT((CHENDATA(X_STP_FN-1))*A_M_NAME[X_STP_FN,10]/PER/2048)
  ENDIF
else
    DDY1[X_STP_FN] =0
endif
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   DSP2_UP99
PARAMETERS  P1,P2,P3
IF STAR=1
  IF	 ISDEMO=1   .and. dosign=0
    && DO DEMO_INP
  ENDIF
  DDY1 :=ARRAY(kind)
  IF W0DBF=1 .AND. DSPD_NOR=0
    FOR I=1 TO (GS_TOT +UWC_TOT)
      IC_X=ALLTRIM(STR(I,2,0))
      STXC=IC_X
      do case
      case   WEIGHT_TYPE[I]=1
	  STXC_B=ALLTRIM(STR(I+1,2,0))
      case   WEIGHT_TYPE[I]=2
	  STXC_2=ALLTRIM(STR(I-1,2,0))
      ENDCASE
      A_M_NAME[I,10]=A_M_NAME[I,9]
      do case
      case  WEIGHT_TYPE[I]=77
	  IF (STP_a[I] >=1)
	      x=A_PRESS_N0[2,STPN&IC_X,i,2]
	      x1=A_PRESS_N0[2,STPN&IC_X,i,11]
	      x3= (A_PRESS_N0[2,STPN&IC_X,I,1]+x)
	      if x3 >0
	      A_M_NAME[I,10]=A_M_NAME[I,9] * (A_PRESS_N0[2,STPN&IC_X,I,8]+x1)/x3
	      else
		   A_M_NAME[I,10]=0
	      endif
	      A_M_NAME[A_M_NAME[I,8]+1 ,12]=A_M_NAME[I,10]
	  ENDIF
	  GET_MCALW(I)
      case  WEIGHT_TYPE[I]=1
	  LAG_TYPE1_2(i,STPN&IC_X)
	  i=i+1
      case  WEIGHT_TYPE[I]=11111
	  IF ((STP_a[I] >=1) .OR. (STP_a[I+1] >=1)  )
	      x=A_PRESS_N0[2,STPN&IC_X,i,2]
	      x1=A_PRESS_N0[2,STPN&IC_X,i,11]
	      A_M_NAME[I,10]=A_M_NAME[I,9] * (A_PRESS_N0[2,STPN&IC_X,I,8]+x1)/(A_PRESS_N0[2,STPN&IC_X,I,1]+x)
	  ENDIF
	  GET_MCALW(I)
	  I=I+1
	  GET_MCALW(I)
      case  WEIGHT_TYPE[I]=222222
	  IF ((STP_a[I] >=1) .OR. (STP_a[I-1] >=1)  )
	      x=A_PRESS_N0[2,STPN&IC_X,i,2]
	      x1=A_PRESS_N0[2,STPN&IC_X,i,11]
	      A_M_NAME[I,10]=A_M_NAME[I,9] * (A_PRESS_N0[2,STPN&IC_X,I,8]+x1)/(A_PRESS_N0[2,STPN&IC_X,I,1]+x)
	  ENDIF
	  GET_MCALW(I)
      case  WEIGHT_TYPE[I]=3
	  LAG_TYPE3_5(i,STPN&IC_X)
	  I=I+2
      case  WEIGHT_TYPE[I]=6
	  LAG_TYPE6_9(i,STPN&IC_X)
	  I=I+3
      case  WEIGHT_TYPE[I]=10
	  LAG_TP10_5(i,STPN&IC_X)
	  I=I+4
      endcase
    NEXT
  ELSE
    FOR XN1=1  TO  (GS_TOT + UWC_TOT)
	  GET_MCALW(XN1)
    NEXT
  ENDIF
  FOR XN1=1  TO  (GS_TOT + UWC_TOT)
      XN2=A_M_NAME[XN1,3]
      if A_M_NAME[XN1,23]=2
	x_tmp=8
      else
	x_tmp=9
      endif
      XN2=A_M_NAME[XN1,3]
      DDY1[XN1]=n_div2(DDY1[XN1],dsp_div[a_m_name[XN1,8]+1],xn2)  && 25.5,0.5,"99.99"
      && 20171201
      XCOR=CHKWERR(DDY1[XN1],WERR_COLOR[XN1],STP_A[XN1],XN1)
      SET COLOR TO &XCOR / &C1

      @ x_tmp,A_M_NAME[XN1,13]	SAY   DDY1[XN1]   PICT	 "&XN2"

      SET COLOR TO W+ / &C1

      A_M_NAME[XN1,10]=A_M_NAME[XN1,9]
      && BIGLCD="E"
      && old IF  XN1=GS_TOT  .AND. BIGLCD="E"
      IF  a_m_NAME[XN1,8]=a_m_NAME[GS_TOT,8]  .AND. substr(BIGLCD,1,1)="E"
	  && old STP_BIGLCD=stp_a[gs_tot]
	  STP_BIGLCD=stp_a[xn1]
	  XMN=STR(GS_TOT,1,0)
	  STPN_BIGLCD=STPN&XMN
	  IF ((STP_BIGLCD >=3)	.AND. (STP_BIGLCD   <=3))
	    && old XSW=A_PRESS_N0[2,STPN_BIGLCD,5,1]  +A_PRESS_N0[2,STPN_BIGLCD,5,2]
	    XSW=A_PRESS_N0[2,STPN_BIGLCD,xn1,8] *  A_PRESS_N0[2,STPN_BIGLCD,xn1,2]/A_PRESS_N0[2,STPN_BIGLCD,xn1,1]
	    XSW=xsw + A_PRESS_N0[2,STPN_BIGLCD,xn1,8]
	    XSW =DDY1[XN1] -XSW
	     SEND_ES2001(0,XSW,substr(BIGLCD,2,2))
	  ELSE
	    x=1
	    xbig=1
	    for  xloop2=1   to	 gs_tot
	      IF ((STP_a[xloop2]>=3)  .AND. (STP_a[xloop2]   <=3))
		xbig=0
	      endif
	    next
	    if xbig=1
	      SEND_ES2001(0,0)
	    endif
	  ENDIF
      ENDIF




      *LINE((x_tmp-1)*8,161,x_tmp*16+40,161,2)
  NEXT
ENDIF
DDY2 :=ARRAY(kind)
mtn=1
FOR XN1=1  TO  (KLCHN + KUCHN )
    DDY2[XN1] = (WDATA(XN1-1)-2048)*A_M_NAME[XN1,6]/PER/2048
    IF W0DBF<>0  .and. DSPD_NOR <>1 .and. STAR<>0
       DO CASE
       CASE  WSCALE_TYPE[xn1]=1
	     if (stp_a[mtn]<>0)
	       n1=chendata(mtn-1)
	       n2=WDATA(XN1-1) -2048
	       if (n2 >n1)
		 DDY2[XN1] =ddy1[mtn]+ (n2-n1)*A_M_NAME[XN1,6]/PER/2048
	       else
		 DDY2[XN1] =ddy1[mtn] * n2/n1
	       endif
	      endif
	      mtn=mtn+1
       CASE  WSCALE_TYPE[xn1]=2
	     IF ((STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0)  )
	       n1=chendata(mtn-1)+chendata(mtn)
	       n2=WDATA(XN1-1) -2048
	       *IF WASTE_ACT=1
	       *  n1=N1+chendata(GS_TOT+UWC_TOT)
	       *ENDIF
	       w1=ddy1[mtn]+ddy1[mtn+1]
	       if (n2 >n1)
		 DDY2[XN1] =w1 + (n2-n1)*A_M_NAME[XN1,6]/PER/2048
	       else
		 DDY2[XN1] =w1	* n2/n1
	       endif
	     ENDIF
	     mtn=mtn+2
       CASE  WSCALE_TYPE[XN1]=3
	     IF ((STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0)  .OR. (STP_a[mtn+2] >0)  )
	       n1=chendata(mtn-1)+chendata(mtn) +chendata(mtn+1)
	       n2=WDATA(XN1-1) -2048
	       w1=ddy1[mtn]+ddy1[mtn+1]  +ddy1[mtn+2]
	       if (n2 >n1)
		 DDY2[XN1] =w1 + (n2-n1)*A_M_NAME[XN1,6]/PER/2048
	       else
		 DDY2[XN1] =w1	* n2/n1
	       endif
	     ENDIF
	   mtn=mtn+3
       CASE  WSCALE_TYPE[XN1]=4
	  IF ((STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0)  .OR. (STP_a[mtn+2] >0)  .OR. (STP_a[mtn+3] >0)  )
	    n1=chendata(mtn-1)+chendata(mtn) +chendata(mtn+1)  +chendata(mtn+2)
	    n2=WDATA(XN1-1) -2048
	    w1=ddy1[mtn]+ddy1[mtn+1]  +ddy1[mtn+2] +ddy1[mtn+3]
	    if (n2 >n1)
	      DDY2[XN1] =w1 + (n2-n1)*A_M_NAME[XN1,6]/PER/2048
	    else
	      DDY2[XN1] =w1  * n2/n1
	    endif
	  ENDIF
	   mtn=mtn+4

       CASE  WSCALE_TYPE[XN1]=5
	  IF (STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0) ;
	     .OR. (STP_a[mtn+2] >0)  .OR. (STP_a[mtn+3] >0) ;
	     .OR. (STP_a[mtn+4] >0)

	    n1=chendata(mtn-1)+chendata(mtn) +chendata(mtn+1) ;
	       +chendata(mtn+2) + chendata(mtn+3)

	    n2=WDATA(XN1-1) -2048
	    w1=ddy1[mtn] +ddy1[mtn+1]  +ddy1[mtn+2] +ddy1[mtn+3]  +ddy1[mtn+4]
	    if (n2 >n1)
	      DDY2[XN1] =w1 + (n2-n1)*A_M_NAME[XN1,6]/PER/2048
	    else
	      DDY2[XN1] =w1  * n2/n1
	    endif
	  ENDIF
	   mtn=mtn+5

       ENDCASE
    ENDIF
    && IF ( VAL(A_M_NAME[XN1,5] )  <100)
    xtmp=VAL(A_M_NAME[XN1,5])
    IF (xtmp -int(xtmp)) >0
      IF (xtmp -int(xtmp)) >0.98
	DDY2[XN1] =INT(DDY2[XN1] *100)/100
	XDIGIT=2
      else
	DDY2[XN1] =INT(DDY2[XN1] *10)/10
	XDIGIT=1
      endif
    ELSE
	DDY2[XN1] =INT(DDY2[XN1])
	XDIGIT=0
    ENDIF
    DDY2[XN1] =DDY2[XN1] &&+ REMOTE[XN1]
    XN2=A_M_NAME[XN1,5]
    XN3=N_DIV2(DDY2[XN1] ,DSP_DIV[XN1],XN2) && 25.5,0.5,"99.99"
    @ 11,A_M_NAME[XN1,16]  SAY	XN3  PICT "&XN2"
    _SEND_RS40D(XN1-1,XDIGIT,XN3)
NEXT
RETU
&&-----------------------------------------------------------------------------
FUNCTION      LAG_TYPE1_2
PARAMETERS  X_STP_FN,X_STPN
dd3=0
dd4=0
DDY1[X_STP_FN] =dd3
DDY1[X_STP_FN+1] =dd4
IF (STP_a[X_STP_FN] =0) .and. (STP_a[X_STP_FN+1] =0)
   retu
endif
for i2=x_stp_fn to  x_stp_fn +1
  ic_x=alltrim(str(i2,2,0))
  xw1=A_PRESS_N0[2,STPN&IC_X,I2,1]+A_PRESS_N0[2,STPN&IC_X,I2,2]
  IF  xw1>0
    xw8=A_PRESS_N0[2,STPN&IC_X,I2,8]+A_PRESS_N0[2,STPN&IC_X,I2,11]
    A_M_NAME[I2,10]=A_M_NAME[I2,9] * xw8/xw1
  ELSE
    A_M_NAME[I2,10]=A_M_NAME[I2,9]
  ENDIF
next
DD3=((CHENDATA(x_stp_fn-1))*A_M_NAME[x_stp_fn,10]/PER/2048)  && INT
DD4=((CHENDATA(x_stp_fn))*A_M_NAME[x_stp_fn+1,10]/PER/2048)  && INT
DO  CASE
CASE	(A_PRESS_N0[2,X_STPN,X_STP_FN,8]=0)  .AND. (A_PRESS_N0[2,X_STPN,X_STP_FN,1]>0)	  .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1] =0)   .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,8]>0)
       DD3=((CHENDATA(X_STP_FN-1))*A_M_NAME[X_STP_FN,9]/PER/2048) && INT
       X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]
       X1= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+A_PRESS_N0[2,STPN8,X_STP_FN +1,8]
       X2= A_PRESS_N0[2,X_STPN,X_STP_FN,1]+A_PRESS_N0[2,STPN8,X_STP_FN +1,1]
       DD4=DD3 *X1/X2
       DD3=0
       TEMP_CAL[4,X_STP_FN]=0
       TEMP_CAL[4,X_STP_FN+1]=-1
       IF (STP_A[X_STP_FN+1] <4)
	 DSPA_ARROW(X_STP_FN+1,1,14)  &&   úD
       ELSE
	 DSPA_ARROW(X_STP_FN+1,0,0)  && EREASE	úD
       ENDIF
CASE	(A_PRESS_N0[2,X_STPN,X_STP_FN,8]>0)  .AND. (A_PRESS_N0[2,X_STPN,X_STP_FN,1]=0)	  .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1] >0)   .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,8]=0)
       DD4=((CHENDATA(X_STP_FN))*A_M_NAME[X_STP_FN,9]/PER/2048)  &&  INT
       X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]
       X1= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+A_PRESS_N0[2,STPN8,X_STP_FN +1,8]
       X2= A_PRESS_N0[2,X_STPN,X_STP_FN,1]+A_PRESS_N0[2,STPN8,X_STP_FN +1,1]
       DD3=DD4 *X1/X2
       DD4=0
       TEMP_CAL[4,X_STP_FN]=-1
       TEMP_CAL[4,X_STP_FN+1]=0
       IF (STP_A[X_STP_FN+1] <4)
	 DSPA_ARROW(X_STP_FN,1,14)  &&	 úD
       ELSE
	 DSPA_ARROW(X_STP_FN,0,0)  && EREASE  úD
       ENDIF
CASE	(A_PRESS_N0[2,X_STPN,X_STP_FN,8]>0)  .AND. (A_PRESS_N0[2,X_STPN,X_STP_FN,1]=0)	  .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1]>0)	   .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,8]>0)
	 IF   (A_PRESS_N0[2,X_STPN,X_STP_FN,8]>0)  .AND. (A_PRESS_N0[2,X_STPN,X_STP_FN,1]=0)	.AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1]>0)
	   DD4=((CHENDATA(X_STP_FN))*A_M_NAME[X_STP_FN,9]/PER/2048)  && INT
	   X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]-STANDW_ERR[7]
	   X1= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+A_PRESS_N0[2,STPN8,X_STP_FN +1,8]
	   X2= A_PRESS_N0[2,X_STPN,X_STP_FN,1]+A_PRESS_N0[2,STPN8,X_STP_FN +1,1]
	   X3=DD4 *X1/X2
	   IF (X3 <X)
	     TEMP_CAL[3,X_STP_FN]=X3
	     TEMP_CAL[4,X_STP_FN]=-1
	     DSPA_ARROW(X_STP_FN,1,14)	&&   úD
	     DSPA_ARROW(X_STP_FN+1,0,0)  && EREASE  úD
	     DD3=X3
	     DD4=0
	   ELSE
	     IF (TEMP_CAL[4,X_STP_FN]<>1)
	       X=GET_RND(STANDW_ERR[7])
	       X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+X
	       TEMP_CAL[3,X_STP_FN]=X
	       TEMP_CAL[4,X_STP_FN]=1
	       TEMP_CAL[4,X_STP_FN+1]=-1
	     ENDIF
	      DD3= TEMP_CAL[3,X_STP_FN]
	      DD4=X3-DD3
	      DSPA_ARROW(X_STP_FN,0,0)	&& EREASE  úD
	      IF (STP_A[X_STP_FN+1] <4)
		DSPA_ARROW(X_STP_FN+1,1,14)  &&   úD
	      ENDIF
	   ENDIF
	 ENDIF
CASE	(A_PRESS_N0[2,X_STPN,X_STP_FN,8]>0)  .AND. (A_PRESS_N0[2,X_STPN,X_STP_FN,1]>0)	  .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1]=0)	   .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,8]>0)
	   DD3=((CHENDATA(X_STP_FN-1))*A_M_NAME[X_STP_FN,9]/PER/2048)
	   X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]-STANDW_ERR[7]
	   X1= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+A_PRESS_N0[2,STPN8,X_STP_FN +1,8]
	   X2= A_PRESS_N0[2,X_STPN,X_STP_FN,1]+A_PRESS_N0[2,STPN8,X_STP_FN +1,1]
	   X3=DD3 *X1/X2
	   IF (X3 <X)
	     TEMP_CAL[3,X_STP_FN]=X3
	     TEMP_CAL[4,X_STP_FN]=-1
	     DD3=X3
	     DD4=0
	     DSPA_ARROW(X_STP_FN,1,14)	&&   úD
	     DSPA_ARROW(X_STP_FN+1,0,0)  && EREASE  úD
	   ELSE
	     IF (TEMP_CAL[4,X_STP_FN]<>1)
	       X=GET_RND(STANDW_ERR[7])
	       X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+X
	       TEMP_CAL[3,X_STP_FN]=X
	       TEMP_CAL[4,X_STP_FN]=1
	       TEMP_CAL[4,X_STP_FN+1]=-1
	     ENDIF
	     TEMP_CAL[4,X_STP_FN+1]=-1
	      DD3= TEMP_CAL[3,X_STP_FN]
	      DD4=X3-DD3
	      DSPA_ARROW(X_STP_FN,0,0)	&& EREASE  úD
	      IF (STP_A[X_STP_FN+1] <4)
		DSPA_ARROW(X_STP_FN+1,1,14)  &&   úD
	      ENDIF
	   ENDIF
CASE	(A_PRESS_N0[2,X_STPN,X_STP_FN,8]=0) .and.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1]=0)
	     TEMP_CAL[4,X_STP_FN]=0
	     TEMP_CAL[4,X_STP_FN+1]=0
	dd3=0
	dd4=0
  otherwise
	   x=A_PRESS_N0[2,STPN&IC_X,i,2]
	   x1=A_PRESS_N0[2,STPN&IC_X,i,11]
	   x3= (A_PRESS_N0[2,STPN&IC_X,I,1]+x)
	   if x3 >0
	   A_M_NAME[I,10]=A_M_NAME[I,9] * (A_PRESS_N0[2,STPN&IC_X,I,8]+x1)/x3
	   else
		A_M_NAME[I,10]=0
	   endif
	   A_M_NAME[A_M_NAME[I,8]+1 ,12]=A_M_NAME[I,10]
       GET_MCALW(I)
  ENDCASE

  IF (VAL(A_M_NAME[X_STP_FN,3])  <100)
    DD3=INT(DD3 * 100) /100
    DD4=INT(DD4 * 100) /100
  ELSE
    DD3=INT(DD3)
    DD4=INT(DD4)
  ENDIF
  DDY1[X_STP_FN] =dd3
  DDY1[X_STP_FN+1] =dd4
RETU
&&-----------------------------------------------------------------------------
FUNCTION      LAG_TYPE3_5
PARAMETERS  X_STP_FN,X_STPN
dd3=0
dd4=0
dd5=0
DDY1[X_STP_FN] =dd3
DDY1[X_STP_FN+1] =dd4
DDY1[X_STP_FN+2] =dd5
IF (STP_a[X_STP_FN] =0) .and. (STP_a[X_STP_FN+1] =0)   .and. (STP_a[X_STP_FN+2] =0)
   retu
endif
for i2=x_stp_fn to  x_stp_fn +2
  ic_x=alltrim(str(i2,2,0))
  xw1=A_PRESS_N0[2,STPN&IC_X,I2,1]+A_PRESS_N0[2,STPN&IC_X,I2,2]
  IF  xw1>0
    xw8=A_PRESS_N0[2,STPN&IC_X,I2,8]+A_PRESS_N0[2,STPN&IC_X,I2,11]
    A_M_NAME[I2,10]=A_M_NAME[I2,9] * xw8/xw1
  ELSE
    A_M_NAME[I2,10]=A_M_NAME[I2,9]
  ENDIF
next
DD3=((CHENDATA(x_stp_fn-1))*A_M_NAME[x_stp_fn,10]/PER/2048)
DD4=((CHENDATA(x_stp_fn))*A_M_NAME[x_stp_fn+1,10]/PER/2048)
DD5=((CHENDATA(x_stp_fn+1))*A_M_NAME[x_stp_fn+2,10]/PER/2048)
IF (VAL(A_M_NAME[X_STP_FN,3])  <100)
  DD3=INT(DD3 * 100) /100
  DD4=INT(DD4 * 100) /100
  DD5=INT(DD5 * 100) /100
ELSE
  DD3=INT(DD3)
  DD4=INT(DD4)
  DD5=INT(DD5)
ENDIF



DDY1[X_STP_FN] =dd3
DDY1[X_STP_FN+1] =dd4
DDY1[X_STP_FN+2] =dd5
RETU
&&-----------------------------------------------------------------------------
FUNCTION      LAG_TYPE6_9
PARAMETERS  X_STP_FN,X_STPN
dd3=0
dd4=0
dd5=0
dd6=0
DDY1[X_STP_FN] =dd3
DDY1[X_STP_FN+1] =dd4
DDY1[X_STP_FN+2] =dd5
DDY1[X_STP_FN+3] =dd6
IF (STP_a[X_STP_FN] =0) .and. (STP_a[X_STP_FN+1] =0)   .and. (STP_a[X_STP_FN+2] =0)  .and. (STP_a[X_STP_FN+3] =0)
   retu
endif
for i2=x_stp_fn to  x_stp_fn +3
  ic_x=alltrim(str(i2,2,0))
  xw1=A_PRESS_N0[2,STPN&IC_X,I2,1]+A_PRESS_N0[2,STPN&IC_X,I2,2]
  IF  xw1>0
    xw8=A_PRESS_N0[2,STPN&IC_X,I2,8]+A_PRESS_N0[2,STPN&IC_X,I2,11]
    A_M_NAME[I2,10]=A_M_NAME[I2,9] * xw8/xw1
  ELSE
    A_M_NAME[I2,10]=A_M_NAME[I2,9]
  ENDIF
next
DD3=INT((CHENDATA(x_stp_fn-1))*A_M_NAME[x_stp_fn,10]/PER/2048)
DD4=INT((CHENDATA(x_stp_fn))*A_M_NAME[x_stp_fn+1,10]/PER/2048)
DD5=INT((CHENDATA(x_stp_fn+1))*A_M_NAME[x_stp_fn+2,10]/PER/2048)
DD6=INT((CHENDATA(x_stp_fn+2))*A_M_NAME[x_stp_fn+3,10]/PER/2048)
DDY1[X_STP_FN] =dd3
DDY1[X_STP_FN+1] =dd4
DDY1[X_STP_FN+2] =dd5
DDY1[X_STP_FN+3] =dd6
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   transceive
PARAMETERS  P1,P2,P3
  IF (ABS(SECONDS()-O_SEC) >TransDlyS )
    if	EMPTY(O_BUF0) = .F.
       IF (SUBSTR(O_BUF0,3,1)<>ETX)
	 S_SEC=SECONDS()-TransDlyS-1
	 O_BUF=STX + "D" + ETX
	 O_BUF0=O_BUF + O_BUF0
	 trans_err=0
       ELSE
	 XLN=LEN(O_BUF0)
	 O_BUF=SUBSTR(O_BUF0,4,XLN-3)
	 *XRND=STR(INT(MOD(RAND() +SECONDS(),10)),1,0)
	 *XL=LEN(O_BUF)
	 *O_BUF=SUBSTR(1,5) +XRND + SUBSTR(O_BUF,7,XL-6)
       ENDIF
       trans_e=1
    elseif (AVUSE=0  .OR. EMPTY(ARATNO)=.T.)
       trans_e=1
       O_BUF=STX+"R2" +ETX

       *o_buf=xget_rcp()
       *XRND=STR(INT(MOD(RAND() +SECONDS(),10)),1,0)
       *XL=LEN(O_BUF)
       *O_BUF=SUBSTR(O_BUF,1,90) +XRND + SUBSTR(O_BUF,92,XL-91)


    ENDIF
  ENDIF
  if (trans_e=1).AND.(EMPTY(O_BUF)=.F.)
      XO_LEN=SIO_write(S2_PORT,O_BUF)

      *@ 19,0  CLEA TO 21,79
      *@ 19,1 SAY  "Recive len="
      *@ 19,13 SAY  LEN(o_BUF)	 pict "999"
      *@ 20,0 say  substr(o_buf,1,80)
      *@ 21,0 say  substr(o_buf,81,160)
      O_SEC=SECONDS()

      IF O_BUF= STX + "D" + ETX
	O_SEC=SECONDS()-TransDlyS+3	&&
      ENDIF

      XO_LEN=0
      trans_e=0
      o_buf=""
      xo_len=1000
      trans_err=trans_err + 1
      if (trans_err >TransMax)
	o_buf0=""
      endif
  else
    *R_LONG=SIO_GETCH(S2_PORT)
    xr_free=sio_ifree(S2_PORT)
    if (xr_free<4095)
      if (xr_free <> r_free )
	 r_free=xr_free
      else
	IF R_ISNEW=0
	   R_SEC=SECONDS()
	   R_ISNEW=1
	   RETU
	ENDIF
	IF SECONDS()-R_SEC <1
	   RETU
	ENDIF
	R_ISNEW=0
	R1_BUF=space(4095-r_free+100)
	R_LONG=sio_read(S2_PORT,R1_BUF)
	IF (R_LONG>0)
	   R_BUF=R_BUF +substr(R1_BUF,1,r_long)
	   r_free=4095
	   DO ChkReadBuff
	ENDIF
      endif
    endif
  endif
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   ChkReadBuff
PARAMETERS  P1,P2,P3
  *@  1,1 say	r_buf+SPACE(5)
  IF OP_MODE="S_F8"
    @ 19,0  CLEA TO 21,79
    @ 19,1 SAY	"Recive len="
    @ 19,13 SAY  LEN(R_BUF)   pict "999"
    @ 20,0 say	substr(r_buf,1,80)
    @ 21,0 say	substr(r_buf,81,160)
    *@	1,0 say   R_CNT  PICT "9"
  else
    R_CNT=R_CNT+1
    R_CNT=MOD(R_CNT,10)
    @  1,0 say	 R_CNT	PICT "9"
  ENDIF
  IF EMPTY(O_BUF0)<> .T.
    do	CHK_ACK
  ENDIF
  IF AVUSE=0
    do	get_rcp
  ELSE
    R_BUF=""
  ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION    xget_rcp
  x_len=12
  RCPX :=ARRAY(x_len)
  RCPX[1]="A"
  RCPX[2]=" d12377   "
  RCPX[3]=" 2.43     "
  RCPX[4]="      1.20"
  RCPX[5]="                    "
  RCPX[6]=" yb0246   "
  RCPX[7]=" adr1234  "
  RCPX[8]="      sh000000003123"
  RCPX[9]=" b123456"
  RCPX[10]="  36"
  RCPX[11]=" name12345  "
  RCPX[12]="  37"
  xc=STX
  for xg=1  to	x_len
   xc=XC+RCPx[xg]
   IF XG <x_len
     xc=XC+","
   ENDIF
  next
  XC=XC+ETX
RETU   XC
&&-----------------------------------------------------------------------------
PROCEDURE   ChkMixerFunc
PARAMETERS  P1,P2,P3
if (avuse=0)  .or. (empty(alltrim(aratno))=.t.)
  req_n=1
else
  req_n=0
endif
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   CHK_ACK
PARAMETERS  P1,P2,P3
  x_len=len(r_buf)
  for xg=1 to  x_len
    if substr(r_buf,xg,1)=ACK
      IF TRANS_ERR >1
	O_BUF0=""
	TRANS_ERR=100
	O_BUF=""
      ENDIF
    endif
  next
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   get_rcp
PARAMETERS  P1,P2,P3
RCPX :=ARRAY(12)
RCPX[1]=2 &&c1 a=add n=not
RCPX[2]=4 && c10 " d12377   "
RCPX[3]=15 && c10 " 5.43     "
RCPX[4]=26 && c10 " 5.43     "
RCPX[5]=37 && c20 "          "
RCPX[6]=58  && c10" yb0246   "
RCPX[7]=69 && c10 " adr1234  "
RCPX[8]=80 && c20 " sh02700000000003123"
RCPX[9]=101 && c8 " custom6"
RCPX[10]=110 && c4 tando1 "  36"
RCPX[11]=115 && c12 " name12345  "
RCPX[12]=128 && c4 tando2 "  37"
x_len=len(r_buf)
if x_len>=132
   for xg=1 to	x_len-131
     if substr(r_buf,xg,1)=STX	.and. substr(r_buf,xg+131,1)=ETX
       xret=chk_rcp(substr(r_buf,xg,XG+131))
       IF XRET=1
	  XREP_IS=0
	  XREP_IS=SET_RCP(substr(r_buf,xg,XG+131))
	  XO_LEN=SIO_write(S2_PORT," ")
	  XO_LEN=SIO_write(S2_PORT,ACK)
	  XO_LEN=SIO_write(S2_PORT,ACK)
	  XO_LEN=SIO_write(S2_PORT,ACK)
	  do  dsp_rcp
       ENDIF
       R_BUF=""
     endif
   next
   r_buf=substr(r_buf,xg,x_len)
endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION    chk_rcp
PARAMETERS  rx_s
xret1=1
IF SUBSTR(RX_S,2,1) <> "A"
  xret1=0
ENDIF

    for xchk=2	to  10
       if substr(rx_s,rcpx[xchk]-1,1) <> ","
	 xret1=0
	 xchk=100
       endif
    next
RETU   xret1
&&-----------------------------------------------------------------------------
FUNCTION    SET_rcp
PARAMETERS  rx_s
XRET=1
for xchk=2  to	9
  DO CASE
  CASE xchk=2
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    XARATNO=SUBSTR(ALLTRIM(UPPER(SUBSTR(RX_S,rcpx[xchk],XPS)))+SPACE(9),1,9)
  CASE xchk=3
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    XAVUSE=VAL(SUBSTR(RX_S,rcpx[xchk],XPS))

  CASE xchk=6
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    ACARNO=SUBSTR(ALLTRIM(UPPER(SUBSTR(RX_S,rcpx[xchk],XPS)))+SPACE(9),1,7)
  CASE xchk=7
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    APOSITION=SUBSTR(ALLTRIM(UPPER(SUBSTR(RX_S,rcpx[xchk],XPS)))+SPACE(10),1,10)
  CASE xchk=8
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    XASCANO=FSUBSTR(UPPER(SUBSTR(RX_S,rcpx[xchk],XPS)),-17," ")
  CASE xchk=9
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    AUS2=SUBSTR(ALLTRIM(UPPER(SUBSTR(RX_S,rcpx[xchk],XPS)))+SPACE(10),1,10)
  CASE xchk=10
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    ATANDO=VAL(SUBSTR(RX_S,rcpx[xchk],XPS))
  CASE xchk=11
    XPS=rcpx[xchk+1]-rcpx[xchk]-1
    AUS2_1=SUBSTR(ALLTRIM(SUBSTR(RX_S,rcpx[xchk],XPS))+SPACE(24),1,24)
  ENDCASE
NEXT
IF (ALLTRIM(O_RCPS[1]) <> ALLTRIM(XASCANO)) .OR. (ALLTRIM(O_RCPS[2]) <> ALLTRIM(XARATNO)) .OR.	(O_RCPS[3]<>XAVUSE)
   ASCANO=XASCANO
   ARATNO=XARATNO
   AVUSE =XAVUSE
   O_RCPS[1] =XASCANO
   O_RCPS[2] =XARATNO
   O_RCPS[3] =XAVUSE
   XRET=0

ENDIF

RETU  XRET
&&-----------------------------------------------------------------------------
PROCEDURE  chk_cancel_key
PARAMETERS  P1,P2,P3
IF STAR=1
   if  cancel_key[1] <>9
     for xg=1  to  kind
       IF DIX(DI_ADS2,xg-1)=0 .AND. RDOK2(xg-1)=1
	   DOUT(xg-1,0)
	   setokn(xg-1,0)
       Endif
     next
   endif

   if  cancel_key[2] <>9
     FOR  Xg=1 TO   (KLCHN + KUCHN  )
       IF DIX(DI_ADS3,xg-1)=0 .AND. RDZEROK(xg-1)=1
	   DOUT2(xg-1,0)
	   setZokn(xg-1,0)
       Endif
     next
   endif
endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION CHKWERR
PARAMETERS  XDATA,XUPP,XSTPN,XINDEX
   XCOLOR="W+"
   *IF (XSTPN >2 )  .AND.  (XSTPN <7 )
   IF (XSTPN <7  )  .AND. XUPP > 0
     XC=ALLTRIM(STR(XINDEX,2,0))
     XSTD= A_PRESS_N0[L_PRESS,STPN&XC,XINDEX,8] +A_PRESS_N0[L_PRESS,STPN&XC,XINDEX,11]
     IF XSTD >0
       XER=(XDATA-XSTD)*100/XSTD
       IF XER <-XUPP
	 XCOLOR="GR+"
       ELSEIF	XER >XUPP
	 XCOLOR="R+"
       ENDIF
     ENDIF
   ENDIF
RETU  XCOLOR
&&-----------------------------------------------------------------------------
&&  2019/7/18-----------------------------------------------------------------------------

FUNCTION      LAG_TP10_5
PARAMETERS  X_STP_FN,X_STPN
dd1=0
dd2=0
dd3=0
dd4=0
dd5=0
DDY1[X_STP_FN] =dd1
DDY1[X_STP_FN+1] =dd2
DDY1[X_STP_FN+2] =dd3
DDY1[X_STP_FN+3] =dd4
DDY1[X_STP_FN+4] =dd5
IF (STP_a[X_STP_FN] =0) .and. (STP_a[X_STP_FN+1] =0) ;
     .and. (STP_a[X_STP_FN+2] =0)  .and. (STP_a[X_STP_FN+3] =0) ;
     .and. (STP_a[X_STP_FN+4] =0)
  retu
endif
for i2=x_stp_fn to  x_stp_fn +4
  ic_x=alltrim(str(i2,2,0))
  xw1=A_PRESS_N0[2,STPN&IC_X,I2,1]+A_PRESS_N0[2,STPN&IC_X,I2,2]
  IF  xw1>0
    xw8=A_PRESS_N0[2,STPN&IC_X,I2,8]+A_PRESS_N0[2,STPN&IC_X,I2,11]
    A_M_NAME[I2,10]=A_M_NAME[I2,9] * xw8/xw1
  ELSE
    A_M_NAME[I2,10]=A_M_NAME[I2,9]
  ENDIF
next
DD1=INT((CHENDATA(x_stp_fn-1))*A_M_NAME[x_stp_fn,10]/PER/2048)
DD2=INT((CHENDATA(x_stp_fn))*A_M_NAME[x_stp_fn+1,10]/PER/2048)
DD3=INT((CHENDATA(x_stp_fn+1))*A_M_NAME[x_stp_fn+2,10]/PER/2048)
DD4=INT((CHENDATA(x_stp_fn+2))*A_M_NAME[x_stp_fn+3,10]/PER/2048)
DD5=INT((CHENDATA(x_stp_fn+3))*A_M_NAME[x_stp_fn+4,10]/PER/2048)


DDY1[X_STP_FN] =dd1
DDY1[X_STP_FN+1] =dd2
DDY1[X_STP_FN+2] =dd3
DDY1[X_STP_FN+3] =dd4
DDY1[X_STP_FN+4] =dd5



RETU
&&-----------------------------------------------------------------------------


#INCLUDE "SIO_TXT.CH"
#INCLUDE "T15_COM.H"

#INCLUDE "FULI.h"

&& FUNCTION   SEND_ES2001 ¤j¦r¹õ
&& FUNCTION _SEND_RS40
&& FUNCTION   LED_DSP
&& FUNCTION   LEDEACH_DSP
&& FUNCTION  SCALE_DSP


sET COLO TO &C7 +/ &C1

#ifdef	dfLNK_EN
if  sio2_fault=0
   IF  LINK_NET=70     &&¥xªd
     DO ChkMixerFunc
     LNK_FULI(0,0,0)
   ENDIF

   && IF  LINK_NET=70	  &&¥xªd
   && DO  LNK_FULI
   && ELSE
   &&	DO ChkMixerFunc
   &&	IF  LINK_NET=77 .or.  LINK_NET=78
   &&	  do transceive
   &&	ENDIF
   && ENDIF
endif



#endif	&& #ifdef  dfLNK_EN


x=s_bcc("12")
IF INFUNC =1	 && NREAD()¶i¦æ¤¤
  T0A=INKEY()
  IF T0A <> 0
    RETU
  ENDIF
ENDIF
if ERROR_LINK=0    && NOW SET =1¤£°õ¦æ
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

&&V15T
FOR  X=1  TO 4

  xopen= din(x-1)
  xtype=stp_a[x]
  if  xopen <> a_m_name[gs_tot + uwc_tot +x,6]	 .or.  xtype <> a_m_name[gs_tot + uwc_tot +x,7]
     a_m_name[gs_tot + uwc_tot +x,6] =xopen
     xtype=0
     if (STP_A[X] >2  .AND. STP_A[X] <6  )  .OR. STP_A[X] =41 && .OR. STP_A[X] >6
       xtype=1
       IF STP_A[X] =3
	 DSPA_ARROW(X,1,14 -(2 *XOPEN) )  &&   úD    RED+     14:GR+
       ENDIF
     ENDIF
     a_m_name[gs_tot + uwc_tot +x,7]=stp_a[x]
     CTANK_MARK(12,X,xopen,xtype)
  endif

 && MTANK_MARK(6,X,1)
 &&  INKEY(1)
 && MTANK_MARK(6,X,0)
 && CTANK_MARK(12,X,0)
 &&  INKEY(1)
NEXT

&& MIX TANK
xopen= din(9)
xtype=TANKSTP
if  xopen <> a_m_name[15,6]   .or.  xtype <> a_m_name[15,7]
   a_m_name[15,6] =xopen
   xtype=0
   if (TANKSTP >0  .AND. TANKSTP <7  )
     xtype=1
   elseif  TANKSTP =-1	   &&	check  door l/s
     xtype=1
   else

   ENDIF
   a_m_name[15,7]=TANKSTP
   IF XTYPE <> 1
     MixTANK_mark(18,15,xopen,xtype)
   ENDIF
endif

@ 0,71 SAY  TIME()
IF DO0_DSP=1
  && @ 0,3  say  rdok1(7)  pict "9"
  && @ 0,5  say  rdok2(7)  pict "9"
  && @ 0,7  say  rd_do1(7)  pict "9"

  FOR  x=1  TO (GS_TOT+UWC_TOT)
    h_plus=0
    xn=ReadDigitOut(1,x-1)
    && @ 1+h_plus,A_M_NAME[x,2]  SAY  xn  pict	"9"
    @ A_M_NAME[x,23]-1,A_M_NAME[x,2]-1	SAY  xn  pict  "9"
    DO0_DSPF=1
  NEXT

  #ifdef  dfTLU15T
    FOR  x=1  TO (GS_TOT+UWC_TOT)
      h_plus=0
      xn=ReadDigitOut(1,x-1 +4)
      && @ 1+h_plus,A_M_NAME[x,2]  SAY	xn  pict  "9"
      @ A_M_NAME[x,23]-1,A_M_NAME[x,2]-1 +6  SAY  xn  pict  "9"
      DO0_DSPF=1
    NEXT
  #endif

  FOR  x=1  TO (KLCHN+KUCHN)
    xn=ReadDigitOut(2,x-1)
    *@ 13,(A_M_NAME[x,20]/8)  SAY  rd_do2(x-1)	pict  "9"
    @ 13,(A_M_NAME[x,20]/8)  SAY  xn   pict  "9"
    DO0_DSPF=1
  NEXT
  @ 14,UPTANK[5,1]    SAY   rd_do2(14)	pict  "9"
  xn=ReadDigitOut(MixerOpen )
  @ 19,50    SAY   xn  pict  "9"
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
  IF ((MIXAMP <= MIXMIN) .OR. (MIXAMP >= MIXMAX))
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
  if   DSPD_NOR=1
    x_tmp= gs_tot +water_tot
    if X_STP_FN >  x_tmp  .and.  X_STP_FN <= x_tmp +c_tot
      DDY1[X_STP_FN] = DDY1[X_STP_FN] -SPEEDW[X_STP_FN-x_tmp,3]
      if    DDY1[X_STP_FN]  <0
	  DDY1[X_STP_FN]=0
      endif
    endif
  endif

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
  AFILL(DDY1,0)
  IF W0DBF=1 .AND. DSPD_NOR=0
    FOR I=1 TO (GS_TOT +UWC_TOT)
      iold=i
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
	     xtmp1=0
	     xtmp=gs_tot +water_tot
	     if i>xtmp .and. i<=xtmp+4	  &&c1-c4
	       if  A_PRESS_N0[2,1,I,1]=0 .AND. A_PRESS_N0[2,1,I ,8] >0
		 if SPEEDW[i-xtmp,3] >0  .and. STP_A[i] >=3
		   xtmp1=1
		 endif
	       endif
	     endif
	     if  xtmp1=1   &&c1-c4
		 IF  STP_A[i] =3   .and.  SPEEDW[i-xtmp,2] >0
		   WTMP=INT((CHENDATA(I-1))*A_M_NAME[I,9]/PER/2048)
		     IF WTMP<  SPEEDW[i-xtmp,3]
		       WTMP=ABS(SECON()-SPEEDW[i-xtmp,2]) * SPEEDW[i-xtmp,1]
		       IF WTMP > SPEEDW[i-xtmp,3]
			 WTMP=SPEEDW[i-xtmp,3]
			 SPEEDW[i-xtmp,2]=0
		       ENDIF
		       EWN= WTMP  * 2048/A_M_NAME[I,9]
		       SETCHDATA(I -1,EWN)
		     else
		       SPEEDW[i-xtmp,2]=0
		     ENDIF
		 elseif  STP_A[i] =6
		   && ic_x=alltrim(str(X_STP_FN+1,2,0))
		   && IF SPEEDW[2,3]=0
		   &&	 SPEEDW[2,2]=SECOND()
		   &&	 SPEEDW[2,3]=GetRandW(XTMP,XW8)
		   && ENDIF
		   WTMP=INT((CHENDATA(I-1))*A_M_NAME[I,9]/PER/2048)
		   IF SPEEDW[i-xtmp,3] >0
		     WTMP=ABS(SECON()-SPEEDW[i-xtmp,2]) *WTMP /6
		     SPEEDW[i-xtmp,2]=SECOND()
		     WTMP = SPEEDW[i-xtmp,3]  -WTMP
		     IF WTMP <0
		       WTMP=0
		     ENDIF
		     SPEEDW[i-xtmp,3] =WTMP
		   else
		     SPEEDW[i-xtmp,2]=0
		     SPEEDW[i-xtmp,3]=0
		   ENDIF
		 ENDIF


	     else
	       x=A_PRESS_N0[2,STPN&IC_X,i,2]
	       x1=A_PRESS_N0[2,STPN&IC_X,i,11]
	       x3= (A_PRESS_N0[2,STPN&IC_X,I,1]+x)
	       if x3 >0
		 A_M_NAME[I,10]=A_M_NAME[I,9] * (A_PRESS_N0[2,STPN&IC_X,I,8]+x1)/x3
	       else
		 A_M_NAME[I,10]=0
	       endif
	       A_M_NAME[A_M_NAME[I,8]+1 ,12]=A_M_NAME[I,10]
	     endif
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
	    if WSCALE_type[1]=5  .and. i <=5   &&wnoreset
	      i=1
	    endif
	    LAG_TP10_5(I,STPN&IC_X)
	  I=I+4
      endcase

      IF DSPADJAW=1
	for xloop=iold to i
	  IF  (STP_a[xloop] =2)  .or. (STP_a[xloop] =3)
	   if A_RAND_W[1,xloop]>0
	     if ddy1[xloop] > A_RAND_W[1,xloop]
	       ddy1[xloop]= A_RAND_W[1,xloop]
	     endif
	   endif
	  && elseif stp_a[xloop] >3
	  else
	     if  empty(A_RAND_W[1,xloop])=.f.
	       if  A_RAND_W[1,xloop] >0
		 ddy1[xloop]=A_RAND_W[1,xloop]
		endif
	     endif
	  endif
	next
      endif

    NEXT
  ELSE
    FOR XN1=1  TO  (GS_TOT + UWC_TOT)
	  GET_MCALW(XN1)
    NEXT
  ENDIF
  BIGLCDch=GS_TOT
  if empty(BIGLCD)=.F.
     IF VAL(substr(BIGLCD+"     ",5,1)) >0
       BIGLCDch=VAL(substr(BIGLCD,5,1))
     ENDIF
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
      if x_tmp=9
	xa1=A_M_NAME[XN1,13]*8
	ya1= (x_tmp *18)-1
	xa2=xa1+32
	LINE(xa1,ya1,xa2,ya1,2)
      endif


      A_M_NAME[XN1,10]=A_M_NAME[XN1,9]

      BLCDDSP=0
      IF BIGLCDch=GS_TOT
	IF  a_m_NAME[XN1,8]=a_m_NAME[GS_TOT,8]
	  BLCDDSP=1
	ENDIF
      ELSE
	IF BIGLCDch=XN1
	  BLCDDSP=1
	ENDIF
      ENDIF

      && BIGLCD="E"
      && old IF  XN1=GS_TOT  .AND. BIGLCD="E"
      && IF  a_m_NAME[XN1,8]=a_m_NAME[GS_TOT,8]  .AND. substr(BIGLCD,1,1)="E"   &&par1.pa2="E"
      && 2020/3/18
      IF  BLcddSP=1  .AND. substr(BIGLCD,1,1)="E"   &&par1.pa2="E"
	  && old STP_BIGLCD=stp_a[gs_tot]
	  STP_BIGLCD=stp_a[xn1]

	  &&XMN=STR(GS_TOT,1,0)
	  && 2020/3/18
	  XMN=STR(BIGLCDch,1,0)
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
AFILL(DDY2,0)
mtn=1
FOR XN1=1  TO  (KLCHN + KUCHN )
    DDY2[XN1] = (WDATA(XN1-1)-2048)*A_M_NAME[XN1,6]/PER/2048
    IF W0DBF<>0  .and. DSPD_NOR <>1 .and. STAR<>0
       DO CASE
       CASE  WSCALE_TYPE[xn1]=1
	     if (stp_a[mtn]<>0)
	       xtmp=gs_tot +water_tot
	       XTMP1=0
	       IF MTN >XTMP .AND. MTN <= XTMP+3
		    IF SPEEDW[MTN-XTMP,3]>0
		       XTMP1=1
		    ENDIF
	       ENDIF

	       IF XTMP1=1
		 IF STP_A[MTN]<6
		   DDY2[XN1]=DDY1[MTN]
		 ELSE
		   DDY2[XN1]=SPEEDW[MTN-XTMP,3]
		 ENDIF
	       ELSE
		   n1=chendata(mtn-1)
		   n2=WDATA(XN1-1) -2048
		   if (n2 >n1)
		     DDY2[XN1] =ddy1[mtn]+ (n2-n1)*A_M_NAME[XN1,6]/PER/2048
		   else
		     DDY2[XN1] =ddy1[mtn] * n2/n1
		   endif
	       endif
	     endif
	      mtn=mtn+1
       CASE  WSCALE_TYPE[xn1]=2
	     IF ((STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0)  )
	       xtmp=gs_tot +water_tot
	       n1=chendata(mtn-1)+chendata(mtn)
	       n2=WDATA(XN1-1) -2048
	       *IF WASTE_ACT=1
	       *  n1=N1+chendata(GS_TOT+UWC_TOT)
	       *ENDIF
	       w1=ddy1[mtn]+ddy1[mtn+1]

	       XCHK1=0
	       xtmp=gs_tot +water_tot
	       IF MTN>XTMP .AND. MTN<=XTMP+3
		 IF  SPEEDW[MTN-XTMP,3] >0   .OR. SPEEDW[MTN-XTMP+1,3] >0
		   XCHK1=1
		 ENDIF
	       ENDIF

	       IF XCHK1=1
		 IF STP_a[mtn+1] <6
		   IF  STP_A[MTN]=0 .AND.  STP_A[MTN+1] >0
		       SPEEDW[MTN-XTMP,2]=WDATA(XN1-1)-2048
		   ENDIF
		   DDY2[XN1] =w1

		 ELSE

		   mtn_c=ALLTRIM(STR(mtn,2,0))
		   if A_PRESS_N0[L_PRESS,1,mtn,1] =0  .and. (A_PRESS_N0[L_PRESS,1,mtn +1,1] =0)
		      WTMP=w1
		      IF SPEEDW[mtn-xtmp+1,3] >0
			WTMP=ABS(SECON()-SPEEDW[mtn-xtmp+1,2]) *WTMP /6
			SPEEDW[mtn-xtmp+1,2]=SECOND()
			WTMP = SPEEDW[mtn-xtmp+1,3]  -WTMP
			IF WTMP <0
			  WTMP=0
			ENDIF
			SPEEDW[mtn-xtmp+1,3] =WTMP
		      else
			SPEEDW[mtn-xtmp+1,2]=0
			SPEEDW[mtn-xtmp+1,3]=0
		      ENDIF

		     DDY2[XN1]=SPEEDW[MTN-XTMP+1,3]
		   else
		     XTMPW=WDATA(XN1-1)-2048
		     XTMPW=W1  *  XTMPW / SPEEDW[MTN-XTMP,2]
		     DDY2[XN1]=XTMPW
		   endif
		 endif


	       ELSE
		 if (n2 >n1)
		   DDY2[XN1] =w1 + (n2-n1)*A_M_NAME[XN1,6]/PER/2048
		 else
		   DDY2[XN1] =w1  * n2/n1
		 endif
	       ENDIF
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
	 bCalBzy=0
	 if xn1=1
	    IF (STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0) ;
	       .OR. (STP_a[mtn+2] >0)  .OR. (STP_a[mtn+3] >0) ;
	       .OR. (STP_a[mtn+4] >0)

	       bCalBzy=1

	    endif


	 else
	    IF (STP_a[mtn] >0) .OR. (STP_a[mtn+1] >0) ;
	       .OR. (STP_a[mtn+2] >0)  .OR. (STP_a[mtn+3] >0) ;
	       .OR. (STP_a[mtn+4] >0)

	       bCalBzy=1

	    endif

	 endif
	  IF  bCalBzy=1

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

xISC12=0
xtmp=gs_tot +water_tot
for I2=x_stp_fn to  x_stp_fn +1
  if I2>xtmp .and. I2<=xtmp+3	 &&c1-c3
    xISC12=1
    if	A_PRESS_N0[2,1,I2,1]=0 .AND. A_PRESS_N0[2,1,I2 ,8] >0
      if SPEEDW[I2-xtmp,3] >0  .and. STP_A[I2] =3
	    WTMP=INT((CHENDATA(I2-1))*A_M_NAME[I2,9]/PER/2048)
	      IF WTMP<	SPEEDW[I2-xtmp,3]
		  WTMP=ABS(SECON()-SPEEDW[I2-xtmp,2]) * SPEEDW[I2-xtmp,1]
		  IF WTMP > SPEEDW[I2-xtmp,3]
		    WTMP=SPEEDW[I2-xtmp,3]
		    SPEEDW[I2-xtmp,2]=0
		  ENDIF
		  EWN= WTMP  * 2048/A_M_NAME[I2,9]
		  SETCHDATA(I2 -1,EWN)
		else
		SPEEDW[I2-xtmp,2]=0
	      ENDIF

      endif
    endif
  endif
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
	   xchk1=0
	   IF  xISC12=1
	     if (SPEEDW[X_STP_FN-xtmp,3] >0  .and. ( STP_A[X_STP_FN] >=3 .or. STP_A[X_STP_FN+1] >0  )) .or. (SPEEDW[X_STP_FN-xtmp+1,3] >0  .and. STP_A[X_STP_FN+1] >=0)
	       xchk1=1


	     ENDIF
	   Endif
	  if xchk1=0
	    DD4=((CHENDATA(X_STP_FN))*A_M_NAME[X_STP_FN,9]/PER/2048)  && INT
	     X= A_PRESS_N0[2,X_STPN,X_STP_FN,8]-STANDW_ERR[7]
	     X1= A_PRESS_N0[2,X_STPN,X_STP_FN,8]+A_PRESS_N0[2,STPN8,X_STP_FN +1,8]
	     X2= A_PRESS_N0[2,X_STPN,X_STP_FN,1]+A_PRESS_N0[2,STPN8,X_STP_FN +1,1]
	     X3=DD4 *X1/X2
	     IF (X3 <X)
	       TEMP_CAL[3,X_STP_FN]=X3
	       TEMP_CAL[4,X_STP_FN]=-1
	       DSPA_ARROW(X_STP_FN,1,14)  &&   úD
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
		DSPA_ARROW(X_STP_FN,0,0)  && EREASE  úD
		IF (STP_A[X_STP_FN+1] <4)
		  DSPA_ARROW(X_STP_FN+1,1,14)  &&   úD
		ENDIF
	     ENDIF
	   ENDIF
	 ENDIF
CASE	(A_PRESS_N0[2,X_STPN,X_STP_FN,8]>0)  .AND. (A_PRESS_N0[2,X_STPN,X_STP_FN,1]>0)	  .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,1]=0)	   .AND.  (A_PRESS_N0[2,STPN8,X_STP_FN +1,8]>0)

	  xchk1=0
	  IF  xISC12=1
	    if SPEEDW[X_STP_FN-xtmp+1,1] >0
	      xchk1=1


	    ENDIF
	  Endif
	 if xchk1=0
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
PROCEDURE   ChkMixerFunc
PARAMETERS  P1,P2,P3
if (avuse=0)  .or. (empty(alltrim(aratno))=.t.)
  req_n=1
else
  req_n=0
endif
RETU
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
   IF ((XSTPN <7  ).or.(XSTPN =41  ) )	.AND. XUPP > 0
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

FUNCTION chkGS_isIdle
PARAMETERS  P1,P2,P3
  is_idle=0
  FOR  xloop=1	TO (GS_TOT)
    if	stp_a[xloop]>0 .or. UPTKSTP >0	.or.   CNVSTP >0  .or. NEXTOK1=1
      is_idle=0
    else
      is_idle=1
    endif
  next
RETU is_idle

&&-----------------------------------------------------------------------------
&&  last pgm






#ifdef	dfLNK_EN

&&-----------------------------------------------------------------------------
PROCEDURE   LNK_FULI   &&¥xªd ->old fuli
PARAMETERS  isFirstCalc,sndCalcData,isReset
static XT2_SEC :=0
static XO_Buff2 :=""
static XisFirstCalc :=0
static XSDEB :=19
static XCNT :=0
static Tx_Cnt:=0
static Tx_Type:=0
static Tx_DataEn :=0   && 1:¤wµo°e 32,96,5   2:¥iTX DATA


    && xr_free=sio_ifree(S2_PORT)
    && R_LONG1=2047 - xr_free
    && R_LONG=sio_read(S2_PORT,R_BUF)
    && xr_free1=sio_oqueue(S2_PORT) ©T©w=0
    && xr_free=sio_ofree(S2_PORT)  ©T©w=2047
    if isReset=1
       XT2_SEC :=0
       XO_Buff2 :=""
       XisFirstCalc :=0
       XSDEB :=19
       XCNT :=0
       Tx_Cnt:=0
       Tx_Type:=0
       Tx_DataEn :=0   && 1:¤wµo°e 32,96,5   2:¥iTX DATA
       retu
    endif

if  sio2_fault=0
    R_BUF=""
    R_LONG=0
    R_BUF_X=space(512)
    R_LONG_X=sio_read(S2_PORT,R_BUF_X)

    IF R_LONG_X >0    &&§¹¾ã±µ¦¬,¨ä¥L¦³®É±µ¦¬³¡¥÷
      R_LONG=R_LONG_X
      R_BUF=SUBSTR(R_BUF_X,1,R_LONG_X)
      DO WHILE R_LONG_X >0
	R_BUF_X=space(512)
	R_LONG_X=sio_line_t(S2_PORT,R_BUF_X,CHR(255))
	IF R_LONG_X >0 .or.  R_LONG_X=-2
	  R_BUF_X=space(512)
	  R_LONG_X=sio_read(S2_PORT,R_BUF_X)
	  IF R_LONG_X >0
	    R_LONG=R_LONG + R_LONG_X
	    R_BUF=R_BUF + SUBSTR(R_BUF_X,1,R_LONG_X)
	  ENDIF
	ELSE
	  R_LONG_X=0
	ENDIF
      ENDDO
    ENDIF


    && R_LONG=sio_line_t(S2_PORT,R_BUF,CHR(255))
    && IF R_LONG >0 .or.  R_LONG=-2
    &&	 && R_BUF=space(R_LONG +30)
    &&	 && R_LONG=sio_line_t(S2_PORT,R_BUF,CHR(255))
    &&	 if r_long =-2
    &&	   R_LONG=sio_read(S2_PORT,R_BUF)
    &&	 endif
    && else
    &&	   r_long=0
    && ENDIF
    if	  r_long >0
      if (show_sio2=77 .or. show_sio2=66  )
	@ XSDEB,0  CLEA TO XSDEB,79
	@ XSDEB,0 SAY XCNT   PICT "9"
	XCNT=XCNT+1
	XCNT=MOD(XCNT,10)
	@ XSDEB,2 SAY R_LONG   PICT "999"
	@ XSDEB,6 SAY "±µ¦¬2:"
	@ XSDEB,12 SAY R_BUF
	XSDEB =XSDEB+1
	IF XSDEB >22
	    XSDEB=19
	ENDIF


      ENDIF
      IF  R_LONG=1
	 IF R_BUF=CHR(4)  && EOT
	    R_BUF=""
	    R_LONG=0
	 ELSEIF  R_BUF=CHR(6)  && ACK
	   IF  Tx_DataEn =1
	      Tx_DataEn =2
	      Tx_Cnt=0
	      XT2_SEC=0
	   ELSE
	     IF Tx_Type=1
	       xisFirstCalc=0
	       SIO_PUTCH(S2_PORT,4)
	       ShowTxAsc(XSDEB,4)
	     ELSEIF Tx_Type=2
	       SIO_PUTCH(S2_PORT,4)
	       ShowTxAsc(XSDEB,4)
	       XO_BUFF2=""
	     ENDIF
	       Tx_DataEn=0
	       Tx_Cnt=0
	       Tx_Type=0
	   ENDIF
	 ENDIF
	 R_LONG=0
	 R_BUF=""
      ELSE
	DO   ChkReadBuff   with  XSDEB
	R_LONG=0
	R_BUF=""
      ENDIF
    ENDIF


  if   isFirstCalc =1 .OR.  sndCalcData =1 .OR. Tx_Type >0
    if	 isFirstCalc =1 .OR.  sndCalcData =1
	Tx_DataEn=0

    endif
    IF	Tx_DataEn <>2
      IF Tx_DataEn=0
	Tx_DataEn=1
	Tx_Cnt=1
      ENDIF
      IF   Tx_Cnt <6
      if abs(seconds()-XT2_SEC) >5

	R_BUF=""
	R_LONG=0
	R_BUF_X=space(512)
	R_LONG_X=sio_read(S2_PORT,R_BUF_X)


	Tx_Cnt=Tx_Cnt +1
	XT2_SEC=seconds()
	o_buff_tmp=" `"  && 32,96,5
	S_RET=SIO_PUTB(S2_PORT,o_buff_tmp)
	&& ShowTxT1(@XSDEB,Tx_Cnt,@o_buff_tmp)
	@ XSDEB,70 SAY o_buff_tmp
	INKEY(1)

	DO ReadBuff

	if    r_long >0
	  IF substr(R_BUF,1,1)= CHR(6)	&& ACK
	    ShowTxAsc(XSDEB,6)
	    Tx_DataEn=2
	    XT2_SEC=0
	  ENDIF
	  R_BUF=""
	ENDIF
      endif
    endif
    endif
  endif
  if   isFirstCalc =1
    xisFirstCalc=isFirstCalc
    Tx_Type=1
    IF Tx_DataEn=2
      IF  R_LONG=0  .and.  "" =XO_BUFF2  &&  A="1"  ? A="" .T.  ? ""=A .F.
	 if abs(seconds()-XT2_SEC) >5
	   Tx_Type=1
	   Tx_Cnt=1
	   XT2_SEC=seconds()
	   o_buff_tmp="SP"
	   S_RET=SIO_PUTB(S2_PORT,o_buff_tmp)
	   ShowTxT1(@XSDEB,Tx_Cnt,@o_buff_tmp)
	 endif
      endif
    ELSE
      Tx_Cnt=1
    endif

  endif

  if   sndCalcData =1
    XO_BUFF2 = O_BUF
    O_BUF=""
    if xisFirstCalc=0
      Tx_Type=2
    endif
    IF Tx_DataEn=2
      IF  R_LONG=0  .and.  Tx_Type=0  .and.  xisFirstCalc=0
	 if abs(seconds()-XT2_SEC) >5
	   Tx_Type=2
	   Tx_Cnt=1
	   XT2_SEC=seconds()
	   S_RET=SIO_PUTB(S2_PORT,XO_BUFF2)
	   ShowTxT2(@XSDEB,Tx_Cnt,@XO_BUFF2)
	 endif
      endif
    ELSE
      Tx_Cnt=1
    endif

  endif


  IF  Tx_DataEn=2
  IF  "" <> XO_BUFF2   .OR. xisFirstCalc=1
     if abs(seconds()-XT2_SEC) >5
       Tx_Cnt=Tx_Cnt +1
       if Tx_Type=1
	  XT2_SEC=seconds()
	  o_buff_tmp="SP"
	  S_RET=SIO_PUTB(S2_PORT,o_buff_tmp)
	  ShowTxT1(@XSDEB,Tx_Cnt,@o_buff_tmp)
       elseif Tx_Type=2
	  XT2_SEC=seconds()
	  S_RET=SIO_PUTB(S2_PORT,XO_BUFF2)
	  ShowTxT2(@XSDEB,Tx_Cnt,@XO_BUFF2)
       endif
       if Tx_Cnt >=5
	 if Tx_Type=1
	   xisFirstCalc=0
	 elseif Tx_Type=2
	   XO_BUFF2=""
	 endif
	 Tx_Cnt=0
	 Tx_Type=0
       endif
     endif

  ENDIF    && IF XO_BUFF2 <>""
  endif

endif
RETU
* -----------------------------------------------------------------------------

PROCEDURE   ChkReadBuff
PARAMETERS  XSDEB,P2,P3

if R_LONG=3
  IF R_BUF=C_GETF  && `   =CHR 96,32,6

    GS_isIdle=chkGS_isIdle()
    GS_isIdle=1
    if	GS_isIdle=1 .AND.  (AVUSE=0  .OR. EMPTY(ARATNO)=.T.  )
      SIO_PUTCH(S2_PORT,6)
      ShowTxAsc(XSDEB,6)
    else
      SIO_PUTCH(S2_PORT,7)  &&¦£¸L¤¤
      ShowTxAsc(XSDEB,7)
    ENDIF

  ENDIF
  RETU

ELSEIF	R_LONG=51
   IF R_BUF==R2_BUF_O
     SIO_PUTCH(S2_PORT,6)
     ShowTxAsc(XSDEB,6)
     RETU
   ENDIF
   IF SUBSTR(R_BUF,1,1)=CHR(2)	 .AND. SUBSTR(R_BUF,50,1)=CHR(3)

     BCC=GET_BCC(@R_BUF,2,50)	&&50

     && BCC=0
     && FOR XLOOP=2  TO 50    &&  INCLUDE ETX
     &&   XASC=ASC(SUBSTR(R_BUF,XLOOP,1))
     &&   BCC=NXOR(BCC,XASC)
     && NEXT
     XASC=ASC(SUBSTR(R_BUF,51,1))
     && IF BCC=XASC
     bcc= XASC
     IF BCC=XASC
       GS_isIdle=chkGS_isIdle()
       GS_isIdle=1
       if  GS_isIdle=1 .AND.  (AVUSE=0	.OR. EMPTY(ARATNO)=.T.	)
	 SIO_PUTCH(S2_PORT,6)
	 ShowTxAsc(XSDEB,6)
       ELSE
	 SIO_PUTCH(S2_PORT,7)  &&¦£¸L¤¤
	 ShowTxAsc(XSDEB,7)
	 RETU
       ENDIF

	R2_BUF_O=R_BUF

	ARATNO=ALLTRIM(UPPER(SUBSTR(R_BUF,2,8))) &&  par1.19.pa17=8
	ARATNO=SUBSTR(alltrim(ARATNO) +  SPACE(20),1,ratno_wid)

	AVUSE=VAL(SUBSTR(R_BUF,10,3))/10

	ACARNO=SUBSTR(R_BUF,14,8)
	&& ASCANO=SUBSTR(R_BUF,22,3)+space(6)
	ASCANO=SUBSTR(R_BUF,35,15)
	SET COLOR TO &C7 +/ &C1


	ATANDO =0
	ACALW_REP=1

	SET COLOR TO &C7 +/ &C1
	do DSP_aRecipe
	*@ 23,16 SAY ASCANO  PICT "9999"
	*@ 23,28 SAY ACARNO
	*@ 23,46 SAY ARATNO
	*@ 23,64 SAY AVUSE   PICT "99.9"
	*@ 23,74 SAY ATANDO  PICT "9999"
     else
       retu

     ENDIF

   ENDIF

ELSE
  RETU

ENDIF
RETU

* -----------------------------------------------------------------------------
function   ShowTxT1
PARAMETERS xtmp,xncnt,xTxBuf
if (show_sio2=77 .or. show_sio2=66  )
  @ xtmp,0  CLEA TO xtmp,79
  @ xtmp,0 SAY xncnt   PICT "9"
  @ xtmp,2  SAY len(xTxBuf)   PICT "99"
  @ xtmp,5 SAY "²Ä¤@½LStart:"
  @ xtmp,17 SAY xTxBuf
endif
xtmp =xtmp+1
IF xtmp >22
    xtmp=19
ENDIF
RETU xtmp
* -----------------------------------------------------------------------------
function   ShowTxAsc
PARAMETERS xtmp,xasc
if (show_sio2=77 .or. show_sio2=66  )
  @ xtmp,70  CLEA TO xtmp,79
  @ xtmp,70 SAY "¶Ç°e½X:"
  @ xtmp,77 SAY xasc  pict "999"
endif
RETU
* -----------------------------------------------------------------------------
function   ShowTxT2
PARAMETERS xtmp,xncnt,xTxBuf
if (show_sio2=77 .or. show_sio2=66  )
  @ 19,0  CLEA TO 22,79
  @ 19,0 SAY "¦¸:  ¦r¼Æ:    BCC:   "
  @ 19,3  SAY xncnt   PICT "9"
  @ 19,10 SAY len(xTxBuf)   PICT "999"
  @ 19,19 SAY ASC(SUBSTR(xTxBuf,159,1))   PICT "999"

  @ 20,0  SAY SUBSTR(xTxBuf,1,80)
  @ 21,0  SAY SUBSTR(xTxBuf,81,79)
endif
xtmp =22

RETU xtmp
* -----------------------------------------------------------------------------

PROCEDURE   ReadBuff
PARAMETERS  P1,P2,P3
  R_BUF=""
  R_LONG=0
  R_BUF_X=space(512)
  R_LONG_X=sio_read(S2_PORT,R_BUF_X)

  IF R_LONG_X >0    &&§¹¾ã±µ¦¬,¨ä¥L¦³®É±µ¦¬³¡¥÷
    R_LONG=R_LONG_X
    R_BUF=SUBSTR(R_BUF_X,1,R_LONG_X)
    DO WHILE R_LONG_X >0
      R_BUF_X=space(512)
      R_LONG_X=sio_line_t(S2_PORT,R_BUF_X,CHR(255))
      IF R_LONG_X >0 .or.  R_LONG_X=-2
	R_BUF_X=space(512)
	R_LONG_X=sio_read(S2_PORT,R_BUF_X)
	IF R_LONG_X >0
	  R_LONG=R_LONG + R_LONG_X
	  R_BUF=R_BUF + SUBSTR(R_BUF_X,1,R_LONG_X)
	ENDIF
      ELSE
	R_LONG_X=0
      ENDIF
    ENDDO
  ENDIF
retu



#endif	&&#ifdef  dfLNK_EN




*LUSTP`PRG

  &&20170826 TESTPGM

&&  FUNNCTION  get_rand
&&  PROCEDURE  MP1T
&&
&&  PROCEDURE  STP5
&&  PROCEDURE  STP6
&&  PROCEDURE  STP7
&&  PROCEDURE  STP8
&&  PROCEDURE  STP9
&&  PROCEDURE  STP10
&&  PROCEDURE  STP11
&&  PROCEDURE  STP12
&&  PROCEDURE  STP_ALL
&&  PROCEDURE  STP_ALL_AE
&&  FUNCTION DSP_RECIP
&&  FUNCTION GET_DATA2	  GET ²Ö­p°£¥»¨­¥H¥~¼Æ
&&  FUNCTION GET_WATER_ADJ
&&PARAMETERS  X_STP_FN,X_STPN,XWATER_INPUT,STOR_F,@W2,@W11
&&  FUNCTION  GET_RECIP_A
&&  FUNCTION setArrowA &&(weight_type[stp_fn],stp_fn)
&&  FUNCTION	  get_dspb
&&  FUNCTION setArrowA &&(weight_type[stp_fn],stp_fn)
&&  FUNCTION	  JMP_E
&&
&&  *do r_com
*   setdla()  cleachw()=set 0
#INCLUDE "T15_COM.H"

x=kind



IF STAR=1 && .AND. DOSIGN=0
  *SET CONS Off
  SET DEVI TO SCRE
  do  npah1_1
  DO STPSTARN
  IF star=1 .or.NEXTOK=1  .OR. NEXTOK2=1 .OR. PRCEND=1
    if t=woff_code

      if water_tot=2
	IF STP_a[gs_tot+1]=6  .or.  STP_a[gs_tot+2]=6
	  && IF (T=-7 )  .or.  (t=woff_code)
	  IF t=woff_code
	    WATER_OUT=VAL(WATER_OUT_NC)
	    water_off=1
	  ENDIF
	ENDIF
      else
	IF STP_a[val(WATER_OUT_NC)]=6
	  && IF (T=-7 )  .or.  (t=woff_code)
	  IF t=woff_code
	    WATER_OUT=VAL(WATER_OUT_NC)
	    water_off=1
	  ENDIF
	ENDIF
      endif
    endif
    for xstp=1	to gs_tot
	  STP_ALL(XSTP,STP_A[XSTP],2)
      IF INFUNC =1
	T0A=INKEY()
	IF T0A <> 0
	  RETU
	ENDIF
      ENDIF
    next
    for xstp=gs_tot+1  to gs_tot+water_tot
      STP_ALL_W(XSTP,STP_A[XSTP],2)
      IF INFUNC =1
	T0A=INKEY()
	IF T0A <> 0
	  RETU
	ENDIF
      ENDIF
    next
    for xstp=gs_tot+water_tot+1  to gs_tot+uwc_tot
      IF (XSTP	> gs_tot+water_tot+c_tot)
	STP_ALL_AE(XSTP,STP_A[XSTP],2)
      ELSE
	STP_ALL(XSTP,STP_A[XSTP],2)
      ENDIF
      IF INFUNC =1
	T0A=INKEY()
	IF T0A <> 0
	  RETU
	ENDIF
      ENDIF
    next
    x=RDN_DATA(368)
    IF INFUNC =1
      T0A=INKEY()
      IF T0A <> 0
	RETU
      ENDIF
    ENDIF
    IF KOT=1  &&¥þ¤W
      DO TANKsTPAU
    else
      DO CONVEYER
      DO TANKSTP0  && mixer tank
    ENDIF
    DO UP_TANK	  && «Ý¤æ
    DO TANKSTP0


  ENDIF
ENDIF



FUNCTION GET_PANData
PARAMETERS  XDIMN,xWVolTon,xRatTotW,xLagW    && ,xNowW
  xWVolKg=xWVolTon  *1000
  SELE 2
  FOR I=1 TO gs_tot +uwc_tot
      IX_C=ALLTRIM(STR(I,2,0))
      xMatiW= M&IX_C
      xMatiW= round((xMatiW * xWVolKg  / xRatTotW),0)
      A_PRESS_N0[GD_PRESS,XDIMN,I,1] :=xMatiW
      && IF xNowW =0
      &&    xNowW =xWVolTon
      && ENDIF
      A_PRESS_N0[GD_PRESS,XDIMN,I,5] :=xWVolTon
      A_PRESS_N0[GD_PRESS,XDIMN,I,6] :=xLagW



  NEXT


RETU
**-----------------------------------------------------------------------------
&&V15T
PROCEDURE  MP1T    && AUTOR =0
PARAMETERS  P1,P2,P3
  XTMP=VUSE /RATVOL
  XSTP_TOT=INT(XTMP)
  if xtmp-XSTP_TOT >0
     XSTP_TOT =XSTP_TOT+1
  endif
  FILL_A_D4(A_PRESS_N0,GD_PRESS,1,5,kind,11,0)
  SELE 2
  ratTotW=0
  FOR I=1 TO gs_tot +uwc_tot
      IX_C=ALLTRIM(STR(I,2,0))
      ratTotW=ratTotW  + M&IX_C
  NEXT
  IF  ratTotW =0
     XSTP_TOT =0
  ENDIF

  DO CASE
  CASE	XSTP_TOT =0
  CASE	XSTP_TOT =1
       GET_PANData(1,vuse,ratTotW,0)
       GET_PANData(2,0,ratTotW,vuse)
  CASE	XSTP_TOT =2
	xvuse1=round(vuse  /2,1)
	GET_PANData(1,xvuse1,ratTotW,0)
	xvuse2=vuse-xvuse1
	GET_PANData(2,xvuse2,ratTotW,xvuse1)
	GET_PANData(3,0,ratTotW,vuse)
  CASE	XSTP_TOT >2
	GET_PANData(1,RATVOL,ratTotW,0)
	xLagWTot1= RATVOL * (XSTP_TOT-2)
	xvuse_r=vuse -xLagWTot1
	xvuse1=round(xvuse_r  /2,1)
	GET_PANData(2,xvuse1,ratTotW,xLagWTot1)
	xvuse2=xvuse_r-xvuse1
	GET_PANData(3,xvuse2,ratTotW,vuse-xvuse2)

  ENDCASE

RETU
**-----------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------
FUNCTION DSP_RECIP
PARAMETERS  CHN,CHTYPE
SET COLO TO &C7 +/ &C1
INDEX1=GET_DATA2(CHN,1)
DO CASE
CASE  CHTYPE=0	&&  H,S,W
  IF   ((WEIGHT_TYPE[chn]=77) .OR.  (WEIGHT_TYPE[chn]=1) .OR. (WEIGHT_TYPE[chn]=3) .OR. (WEIGHT_TYPE[chn]=6) .OR. (WEIGHT_TYPE[chn]=10)  )

    if WSCALE_type[1]=5  .AND.	CHN<=5
       CHN=1
    ENDIF

    FOR  XLOOP=chn  TO	chn +INDEX1
      XLOOPC=ALLTRIM(STR(XLOOP,2,0))
      XMC_F=A_M_NAME[XLOOP,3]
      if DSPD_NOR=0
	@  A_M_NAME[xloop,23] ,A_M_NAME[xloop,13]  SAY	A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,8] + A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,11]   PICT "&XMC_F"
      ELSE
	@  A_M_NAME[xloop,23],A_M_NAME[xloop,13]  SAY  A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,1] + A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,2]	PICT "&XMC_F"
      ENDIF
    NEXT
  ENDIF
CASE  CHTYPE=1
   DO CASE
    CASE  WEIGHT_TYPE[CHN]=1
      XMC_F=A_M_NAME[STP_FN,3]
      XMC_F2=A_M_NAME[STP_FN+1,3]
      if DSPD_NOR=0
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]    PICT "&XMC_F"
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN+1,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN+1,8]	PICT "&XMC_F2"
      ELSE
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]	PICT "&XMC_F"
	@  A_M_NAME[STP_FN,23]+1,A_M_NAME[STP_FN+1,13]	SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN+1,1]       PICT "&XMC_F2"
      ENDIF
    ENDCASE
  ENDCASE
  SET COLOR TO &C7 +/ &C1
  RETU
  **-----------------------------------------------------------------------------
  FUNCTION GET_DATA2
  PARAMETERS  XWEIGHT_TYPE ,XMOD
     XRETU=0
     DO CASE
     CASE    XMOD=1
       DO  CASE
       CASE WEIGHT_TYPE[STP_FN]=77
	  XRETU=0
       CASE  WEIGHT_TYPE[STP_FN]=1
	    XRETU=1
       CASE  WEIGHT_TYPE[STP_FN]=3
	    XRETU=2
       CASE  WEIGHT_TYPE[STP_FN]=6
	    XRETU=3
       CASE  WEIGHT_TYPE[STP_FN]=10
	    XRETU=4
       ENDCASE
   CASE  XMOD=-1   &&  GET  SETDLA
      DO  CASE
      CASE WEIGHT_TYPE[STP_FN]=77  .OR.   WEIGHT_TYPE[STP_FN]=1   .OR.	 WEIGHT_TYPE[STP_FN]=3	.OR.   WEIGHT_TYPE[STP_FN]=6   .OR.   WEIGHT_TYPE[STP_FN]=10
	 XRETU=0
      CASE    WEIGHT_TYPE[STP_FN]=2   .OR. WEIGHT_TYPE[STP_FN]=4   .OR.   WEIGHT_TYPE[STP_FN]=7  .OR.	WEIGHT_TYPE[STP_FN]=11
	   XRETU=1
      CASE	 WEIGHT_TYPE[STP_FN]=5	 .OR. WEIGHT_TYPE[STP_FN]=8  .OR.   WEIGHT_TYPE[STP_FN]=12
	   XRETU=2
      CASE  WEIGHT_TYPE[STP_FN]=9   .OR. WEIGHT_TYPE[STP_FN]=13
	   XRETU=3
      CASE  WEIGHT_TYPE[STP_FN]=14
	   XRETU=4
      ENDCASE
   CASE    XMOD=-2
       DO  CASE
       CASE WEIGHT_TYPE[STP_FN]=77
	  XRETU=0
       CASE  WEIGHT_TYPE[STP_FN]=2
	    XRETU=1
       CASE  WEIGHT_TYPE[STP_FN]=5
	    XRETU=2
       CASE  WEIGHT_TYPE[STP_FN]=9
	    XRETU=3
       CASE  WEIGHT_TYPE[STP_FN]=14
	    XRETU=4
       ENDCASE
   ENDCASE
RETU	XRETU
**-------------------------------------------------------
FUNCTION SH_W_ADJ2
PARAMETERS  X_STPN,XWATER_INPUT
  W2=0
  W11=0
  IF WATER_CHG=0
    RETURN
  ENDIF
  IF XWATER_INPUT=0
    RETURN
  ENDIF
  WATER_CHG=0
  W11=0
  FOR  I=1 TO GS_TOT
	w11=W11- (A_PRESS_N0[L_PRESS,X_STPN,I,8]  *  WATER_INC[I]  /100 )
	w2 =W2- (A_PRESS_N0[L_PRESS,X_STPN,I,1]  *  WATER_INC[I]  /100 )
  NEXT
  PWATER=W11
  IF  WATER_INPUT=1
    SET  COLO  TO  W+  / &C1
    if dspe_mixamp=1
      if dspd_nor=0
	PWATER=W11
      else
	PWATER=W2
      endif
      @ 17,71 SAY  PWATER  PICT "9999"
    endif
    SET COLOR TO &C2 / &C1
  ENDIF
  XWT8=0
  XWT8a=0
  FOR  X_STP_FN =GS_TOT+1   TO GS_TOT +WATER_TOT
      XWT8=XWT8+ A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]
      XWT8a=XWT8a+ A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]
  NEXT
  IF XWT8 >0
     FOR  X_STP_FN =GS_TOT+1   TO GS_TOT +WATER_TOT
	 XWT=A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]+(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]*W11/XWT8)
	 XWTa=A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]+(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]*W2/XWT8a)
	 IF XWT >0
	   XMC_F=A_M_NAME[X_STP_FN,3]
	   SET COLOR TO w / &C1
	   if dspd_nor=0
	     @	A_M_NAME[X_STP_FN,23],A_M_NAME[X_STP_FN,13]  SAY  XWT	PICT "&XMC_F"
	   else
	     @	A_M_NAME[X_STP_FN,23],A_M_NAME[X_STP_FN,13]  SAY  XWTa	 PICT "&XMC_F"
	   endif
	   SET COLOR TO &C2 / &C1
	 ENDIF
     NEXT

  ENDIF
RETU
**-----------------------------------------------------------------------------
FUNCTION GET_W_ADJ2
PARAMETERS  X_STP_FN,X_STPN,XWATER_INPUT,STOR_F,W2,W11
W2=0
W11=0
IF XWATER_INPUT=1
     FOR  I=1 TO GS_TOT
	   w2=W2- INT(A_PRESS_N0[L_PRESS,X_STPN,I,1]  *  WATER_INC[I]  /100)
	   w11=W11- INT(A_PRESS_N0[L_PRESS,X_STPN,I,8]	*  WATER_INC[I]  /100)
     NEXT
     if dspd_nor=0
       PWATER=W11
     else
       PWATER=W2
     endif
ELSE
     W2=INT(PWATER *  A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,5]/ RATVOL)
     W11=W2
ENDIF
DO CASE
CASE WEIGHT_TYPE[X_STP_FN]=77
     if water_tot =1
	IF (A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1] =0)
	    W2=0
	ENDIF
	IF (A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8] =0)
	    W11=0
	ENDIF
	IF  STOR_F=1
	  A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,2]=W2
	  A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,11]=W11
	ENDIF
      elseif water_tot =2
	   XWT1=A_PRESS_N0[L_PRESS,X_STPN,gs_tot+1,1] +A_PRESS_N0[L_PRESS,X_STPN,gs_tot+2,1]
	   XWT8=A_PRESS_N0[L_PRESS,X_STPN,gs_tot+1,8] +A_PRESS_N0[L_PRESS,X_STPN,gs_tot+2,8]
	   if XWT1 >0
	     W2=INT(W2 *A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]/XWT1)
	   ENDIF
	   IF XWT8 >0
	     W11=INT(W11 *A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]/XWT8)
	   ENDIF
	   IF (A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1] =0)
	       W2=0
	   ENDIF
	   IF (A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8] =0)
	       W11=0
	   ENDIF
	   IF  STOR_F=1
	     A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,2]=W2
	     A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,11]=W11
	   ENDIF
      ENDIF
CASE WEIGHT_TYPE[X_STP_FN]=1  .OR.  WEIGHT_TYPE[X_STP_FN]=2
      IF   WEIGHT_TYPE[X_STP_FN]=1
	XCHN=1
      ELSE
	XCHN=-1
      ENDIF
      XWT1=A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1] +A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+XCHN,1]
      XWT8=A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8] +A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+XCHN,8]
      W2=INT(W2 *A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]/XWT1)
      W11=INT(W11 *A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]/XWT8)
      IF (A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1] =0)
	  W2=0
      ENDIF
      IF (A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8] =0)
	  W11=0
      ENDIF
      IF  STOR_F=1
	A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,2]=W2
	A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,11]=W11
      ENDIF
ENDCASE
RETU
**-----------------------------------------------------------------------------
FUNCTION GET_WATER_ADJ
PARAMETERS  X_STP_FN,X_STPN,XWATER_INPUT,STOR_F,W2,W11,xWATER_INC
   W2=0
   W11=0
   IF X_STP_FN	>  GS_TOT
      RETU
   ENDIF
   RETUN=0
   IF XWATER_INPUT=1
       W2=INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]  *	xWATER_INC[X_STP_FN]  /100)
       A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,2]=W2
       W11=INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]  *  xWATER_INC[X_STP_FN]  /100 )
       A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,11]=W11

       DO CASE
       CASE WEIGHT_TYPE[X_STP_FN]=77
	    A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,2]=  INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]  *  xWATER_INC[X_STP_FN]	/100)
	    A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,11]= INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]  *  xWATER_INC[X_STP_FN]	/100 )
       CASE WEIGHT_TYPE[X_STP_FN]=1
	   FOR X=0  TO 1
	    A_PRESS_N0[ L_PRESS,X_STPN,X_STP_FN+X,2]= INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+X,1]  *  xWATER_INC[X_STP_FN+X]  /100)
	    A_PRESS_N0[ L_PRESS,X_STPN,X_STP_FN+X,11]=INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+X,8]  *  xWATER_INC[X_STP_FN+X]  /100)
	   NEXT
       CASE WEIGHT_TYPE[X_STP_FN]=3
	   FOR X=0  TO 2
	    A_PRESS_N0[ L_PRESS,X_STPN,X_STP_FN+X,2]= INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+X,1]  *  xWATER_INC[X_STP_FN+X]  /100 )
	    A_PRESS_N0[ L_PRESS,X_STPN,X_STP_FN+X,11]=INT( A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+X,8]  *  xWATER_INC[X_STP_FN+X]  /100)
	   NEXT
       CASE WEIGHT_TYPE[X_STP_FN]=6
	   FOR X=0  TO 3
	    A_PRESS_N0[ L_PRESS,X_STPN,X_STP_FN+X,2]= INT(A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+X,1]  *  xWATER_INC[X_STP_FN+X]  /100)
	    A_PRESS_N0[ L_PRESS,X_STPN,X_STP_FN+X,11]=INT( A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN+X,8]  *  xWATER_INC[X_STP_FN+X]  /100)
	   NEXT

       ENDCASE

   ELSE
	IF   X_STP_FN <= G_TOT
	   RETU
	ENDIF
	 STOT1=0
	 STOT8=0
	 FOR X=G_TOT+1	TO   GS_TOT
	     STOT1 +=A_PRESS_N0[L_PRESS,X_STPN,X,1]
	     STOT8 +=A_PRESS_N0[L_PRESS,X_STPN,X,8]
	 NEXT
	 PWATER_A=INT(-PWATER *  A_PRESS_N0[L_PRESS,X_STPN,X,5]/ RATVOL)
	 IF STOR_F=0
	    IF STOT1 >0
	      W2=INT(PWATER_A *A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,1]/ STOT1)
	    ENDIF
	    IF STOT8 >0
	      W11=INT(PWATER_A *A_PRESS_N0[L_PRESS,X_STPN,X_STP_FN,8]/ STOT8)
	    ENDIF
	    RETU
	 ENDIF
	 FOR  X=G_TOT +1  TO  GS_TOT
	   A_PRESS_N0[ L_PRESS,X_STPN,X,2]=0
	   A_PRESS_N0[ L_PRESS,X_STPN,X,11]=0
	    IF STOT1 >0
	      A_PRESS_N0[ L_PRESS,X_STPN,X,2]=INT(PWATER_A *A_PRESS_N0[L_PRESS,X_STPN,X,1]/ STOT1)
	    ENDIF
	    IF STOT8 >0
	      A_PRESS_N0[ L_PRESS,X_STPN,X,11]=INT(PWATER_A *A_PRESS_N0[L_PRESS,X_STPN,X,8]/ STOT8)
	    ENDIF
	 NEXT
   ENDIF
RETU   0
**-----------------------------------------------------------------------------
FUNCTION  GET_RECIP_A
PARAMETERS  CHN
INDEX1=GET_DATA2(CHN,-1)
xstar=index1
XRETU=0
FOR XLOOP=CHN TO CHN-INDEX1  STEP  -1
    XLOOPC=ALLTRIM(STR(XLOOP,2,0))
    IF XLOOP=CHN
      XRETU=A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,1] + A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,2]
    ELSE
      if WSCALE_type[1]=5  .AND.  CHN <=5
	XLOOP_b=aWnoreset[xstar]
	XLOOPC=ALLTRIM(STR(XLOOP_b,2,0))
	XRETU=XRETU + A_PRESS_N0[L_PRESS,STPN&xloopc,xloop_b,4]
	xstar=xstar -1
      else
	XRETU=XRETU + A_PRESS_N0[L_PRESS,STPN&xloopc,xloop,4]
      ENDIF
    ENDIF
NEXT
RETU	XRETU

**-----------------------------------------------------------------------------
FUNCTION setArrowA &&(weight_type[stp_fn],stp_fn)
PARAMETERS  WEITYPE,XSTP_FN,FLAG
IF FLAG=1
  DO CASE
  CASE WEITYPE=1
    if (temp_cal[4,stp_fn]=-1)
      DSPA_ARROW(STP_FN,1,14)  && úD
      DSPA_ARROW(STP_FN+1,0,0)	&& úD
    elseif (temp_cal[4,stp_fn+1]=-1)
      DSPA_ARROW(STP_FN+1,1,14)  && úD
      DSPA_ARROW(STP_FN,0,0)  && úD
    else
      DSPA_ARROW(STP_FN+1,0,0)	&& úD
      DSPA_ARROW(STP_FN,0,0)  && úD
    endif
  CASE WEITYPE=2
    if (temp_cal[4,stp_fn-1]=-1)
      DSPA_ARROW(STP_FN-1,1,14)  && úD
      DSPA_ARROW(STP_FN,0,0)  && úD
    elseif (temp_cal[4,stp_fn]=-1)
      DSPA_ARROW(STP_FN,1,14)  && úD
      DSPA_ARROW(STP_FN-1,0,0)	&& úD
    else
      DSPA_ARROW(STP_FN-1,0,0)	&& úD
      DSPA_ARROW(STP_FN,0,0)  && úD
    endif
  ENDCASE
ELSE
    DO CASE
    CASE WEITYPE=2
      DSPA_ARROW(XSTP_FN,0,0)  && úD
      DSPA_ARROW(XSTP_FN-1,0,0)  && úD
    ENDCASE
ENDIF
**------------------------------------------------------------------------------------------------------------
PROCEDURE  STP_ALL
PARAMETERS  STPA_NAME,STPA_STEP,P3
if (din(15)=0)
   retu
endif
STP_ZN=STPA_NAME-1
STP_FN=STPA_NAME
STP_FC=ALLTRIM(STR(STP_FN,2,0))
DO CASE
CASE (STPA_STEP=0)   .and. (din(14)=1) .AND. (DIN(15)=1)    &&AUTO ,NO PAUSE
  IF   ((WEIGHT_TYPE[STP_FN]=77) .OR.  (WEIGHT_TYPE[STP_FN]=1) .OR. (WEIGHT_TYPE[STP_FN]=3) .OR. (WEIGHT_TYPE[STP_FN]=6) .OR. (WEIGHT_TYPE[STP_FN]=10)	)  .AND. NEXTOK1=1
    IF (A_PRESS_n0[1,dima_len,STP_FN,1] =77)
       INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],1)

       XSTART= STP_FN
       if WSCALE_type[1]=5 .AND. STP_FN <=5
	 XSTART= 1
	 INDEX1=4
       ENDIF
       FOR  XLOOP=XSTART  TO XSTART +INDEX1
	    if stp_a[xloop] <> 0
	       retu
	    endif
       NEXT
	 a_copy_4(A_PRESS_N0,XSTART,XSTART+INDEX1)  && COPY A_PRESS_N0[1,1-20,N1-N3,1-7) DATA TO A_PRESS_N0[2,1-20,N1-N3,1-7)
	 NEXTOK1=0
	 FOR  XLOOP=XSTART  TO XSTART +INDEX1
	   A_PRESS_n0[1,dima_len,XLOOP,1] :=0
	 NEXT
	 STP_A[STPA_NAME]=1
	 #ifdef  dfLNK_EN
	   if STPA_NAME=1   && lnk_net
	     LNK_FULI(1,0,0)   && ²Ä¤@½Lstart  tx to  server
	   endif
	 #endif  && #ifdef  dfLNK_EN
	 FOR IX=1 TO (GS_TOT+UWC_TOT)
	   IF  A_PRESS_n0[1,dima_len,ix,1] =77
	     NEXTOK1=1
	   ENDIF
	 NEXT
    ENDIF
  ENDIF
CASE (STPA_STEP=1)   .and. (din(14)=1) .AND. (DIN(15)=1)    &&AUTO ,NO PAUSE
  IF   ((WEIGHT_TYPE[STP_FN]=77) .OR.  (WEIGHT_TYPE[STP_FN]=1) .OR. (WEIGHT_TYPE[STP_FN]=3) .OR. (WEIGHT_TYPE[STP_FN]=6) .OR. (WEIGHT_TYPE[STP_FN]=10)	)
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],1)
    FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
      WTANK_F[XLOOP,1] :=77
      A_RAND_W[1,XLOOP]=0    && 2021/4/19
    NEXT
    STP_A[STPA_NAME]=2
    RDDELAY[STP_FN,2] :=SECONDS()
    RDDELAY[STP_FN,3] :=0
  ENDIF
CASE STPA_STEP=2
  DRAF=0
  GS_CHG=0
  W2=0
  W11=0
  A_RAND_W[1,STP_FN]=0

    *MDY2019/6/2
  if DROP_AUTO=7  .AND. WSCALE_type[1]=4  .AND. STP_FN <5
     if STP_FN=1
       GSTOT_ERR=0
     ENDIF
     && ELSE
    && GSTOT_ERR=0
  ENDIF
  GET_WATER_ADJ(STP_FN,STPN&STP_FC,WATER_INPUT,1,W2,W11,@WATER_INC)
  DO CASE
  CASE (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] =0 )
    DSP_RECIP(STP_FN,0)
    WTANK_F[STP_FN,1] :=1

    xconti=0
    xtmp=gs_tot + water_tot
    if stp_fn > xtmp .and. stp_fn <=xtmp +3  .and. WEIGHT_TYPE[STP_FN]=1
	 xw8=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
	 if xw8>0    .and.  speedw[stp_fn-xtmp,1]  >0
	   xconti=1
	 endif
    endif


    DO CASE
    CASE xconti=1 .or.	WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
      STP_A[STP_FN]=3
      xtmp=gs_tot + water_tot
      if stp_fn > xtmp	.and.  stp_fn <= xtmp+3
	 &&speedw[stp_fn-xtmp,1]  kg/sec
	 speedw[stp_fn-xtmp,2]=0
	 speedw[stp_fn-xtmp,3]=0
	 xw8=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
	 if xw8>0    .and.  speedw[stp_fn-xtmp,1]  >0
	   speedw[stp_fn-xtmp,2]=seconds()
	   SPEEDW[stp_fn-xtmp,3]=GetRandW(stp_fn,XW8)
	   SET COLOR TO &C2  / &C1
	   *MTANK_MARK(6,STP_FN,1)
	   DSPA_ARROW(STP_FN,1,14)  &&	 úD
	   DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
	   SET COLOR TO &C7 +/ &C1
	   CLEACHMEM(STP_ZN)
	   WTANK_F[STP_FN,1] :=77

	 endif
      endif
    OTHERWISE
      STP_A[STPA_NAME]=0
      if WSCALE_type[1]=5  .AND. STP_FN <=5
	XNTMP= STP_FN +1
	FOR ITMP=1 TO 4
	  XNTMP=VAL(SUBSTR(WNORESET,ITMP,1))
	  IF XNTMP=STP_FN
	    XNTMP=VAL(SUBSTR(WNORESET,ITMP+1,1))
	    EXIT
	  ENDIF
	NEXT
	STP_A[XNTMP]=2
      ELSE
	STP_A[STPA_NAME+1]=2
      ENDIF
    ENDCASE
    && WTANK_F[STP_FN,1] :=1
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4]  :=0
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7]  :=1
  CASE (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] > 0 )

      &&V15T:4CH
      WDOOR_OP=0
      &&WDOOR_OP= WDOOR_CHK(STP_FN,WDOOR_CHK)
      WDOOR_OP= WDOOR_CHK(STP_FN,10)  &&  DI0.0-3­p¶q±íªùL/S  <=4  ONLY
      IF WDOOR_OP=1
      SET COLOR TO R  / &C1
	 SET COLOR TO R+  / &C1
	 DSPA_ARROW(STP_FN,1,12)  &&   úD    RED+     14:GR+
	 &&DSPB_FMK(A_M_NAME[STP_FN,8]+1,0)  && fill blank
	&& DSPB_FMK(A_M_NAME[STP_FN,8]+1,2)  && "úZúYúYú["  fill red color
	&& DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["  fill red color
	SET COLOR TO &C7 +/ &C1
	RETURN
      ENDIF
      && DSPB_FMK(A_M_NAME[STP_FN,8]+1,0)  && fill blank
      SET COLOR TO &C7 +/ &C1

    xdirect=0
    IF (STP_FN= gs_tot+water_tot+1)
      xdirect=1
    endif

    XW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
    IF DSPADJAW=1  && STD A°t ¬y¤ô³æPRINT
      XWadj11=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
      A_RAND_W[1,STP_FN]=Get_Rand_w(STP_FN,xw1+XWadj11,xdirect)
    endif

    IF	A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] >0
      DSPDATA_A[STP_FN] := 1
    ELSE
      DSPDATA_A[STP_FN] := 0
    ENDIF
    ADJWN=0
    ADJWN_f=0
    *W2=0
    *W11=0
    *GET_WATER_ADJ(STP_FN,STPN&STP_FC,WATER_INPUT,1,W2,W11,@WATER_INC)
    DSP_RECIP(STP_FN,0)
    IF	 ((WEIGHT_TYPE[STP_FN]<>77) .and.  (WEIGHT_TYPE[STP_FN]<>2) .and. (WEIGHT_TYPE[STP_FN]<>5) .and. (WEIGHT_TYPE[STP_FN]<>9) .and. (WEIGHT_TYPE[STP_FN]<>14)  )
       index1=0
       index1=GET_RECIP_A(STP_FN)
       RDDLY(STP_FN,A_M_NAME[STP_FN,8],INDEX1,2)
       XRD := RDDELAY[STP_FN,3]
       IF XRD<>0
	    IF XRD=1
	      XMC_F=A_M_NAME[STP_FN,3]
	      EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
	      A_RAND_W[1,STP_FN]=EWN
	      if dspd_nor=0
		@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  EWN	PICT "&XMC_F"
	      else
		EWNa= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
		@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  EWNa	 PICT "&XMC_F"
	      endif
	      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := EWN
	      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
	      EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
	      EWN= EWN	* 2048/A_M_NAME[STP_FN,9]
	      SETCHDATA(STP_ZN,EWN)
	      STP_A[STPA_NAME]=3
	      WTANK_F[STP_FN,1] :=1
	      && DO CASE
	      && CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
	      &&   STP_A[STP_FN]=3
	      && OTHERWISE
	      &&   STP_A[STPA_NAME]=0
	      &&   STP_A[STPA_NAME+1]=2
	      && ENDCASE
	    endif
	    DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
	    RETU
       endif
    endif
    XMC_F=A_M_NAME[STP_FN,3]
    *MTANK_MARK(6,STP_FN,1)
    IF DSPDATA_A[STP_FN] =1
      if dspd_nor=0
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]+ A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]  PICT "&XMC_F"
      else  && b°t¹ê»Ú­È³]©w
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]+ A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]  PICT "&XMC_F"
      endif
      SET COLOR TO &C2	/ &C1
      *MTANK_MARK(6,STP_FN,1)
      DSPA_ARROW(STP_FN,1,14)  &&   úD
      DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)	&& "úZúYúYú["
    endif
      SET COLOR TO &C10 / &C1
      *@ 11,7  SAY   "úZúYúYúYúYúYú["
      DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)	&& "úZúYúYú["
      WEIG_RESCALL(STP_FN)
    DSP_RECIP(STP_FN,0)
    *A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]=ADJWN
    SET COLOR TO &C7 +/ &C1
    CLEACHMEM(STP_ZN)

    *MDY2019/6/2

    if DROP_AUTO=7  .AND. WSCALE_type[1]=4  .AND. STP_FN <5
      wtmp=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  + A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
      if GSTOT_ERR > wtmp
	 GSTOT_ERR =wtmp
      endif
      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] = -GSTOT_ERR +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]
      GSTOT_ERR = 0
    endif

    *IF GSTOT_ERR <> 0
    *  EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
    *  @  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY	EWN    PICT "&XMC_F"
    *ENDIF

    SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  + A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
    && SETW1(STP_ZN,(SW1-PFLOR&STP_FC)*2048/A_M_NAME[STP_FN,10])
    && SETW2(STP_ZN,(SW1-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,10])

    wtmp=SW1-PFLOR&STP_FC
    if wtmp <0
     &&  wtmp=0
    endif
    SETW1(STP_ZN,wtmp *2048/A_M_NAME[STP_FN,10])

    wtmp=SW1-ERKG&STP_FC
    if wtmp <0
    &&	wtmp=0
    endif
    SETW2(STP_ZN,wtmp *2048/A_M_NAME[STP_FN,10])


    SETOK(STP_ZN)
    *DOUT(STP_ZN,1)
    SetDigitOut(1,STP_ZN,1)
    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
    STP_A[STPA_NAME]=3
    if (STP_FN>gs_tot + water_tot) .and. (STP_FN < gs_tot + water_tot +c_tot+1)
      SetCout2(STP_FC,1)
    endif

    && MDY180902
    IF	 mdirty_no[1] >0
      IF   stp_fn  = mdirty_no[1]
	 mdirty_no[4]=-1
	 mdirty_no[5]=0
      ENDIF
    ENDIF
  ENDCASE
CASE STPA_STEP=3


  *TST1_LS1(STP_FN)
  *IF LS1[STP_FN,2]=1
  *  RETU
  *ENDIF
  *TST0_LS2(STP_FN)
  isC12=0
    IF	 (stp_fn  <= gs_tot)

       && IF WATER_INPUT=0
	   W2_X=A_PRESS_N0[U_PRESS,STPN&STP_FC,STP_FN,2]
	   W2=0
	   W11=0
	   GET_WATER_ADJ(STP_FN,STPN&STP_FC,WATER_INPUT,0,@W2,@W11,@WATER_INC)
	   IF  W2  <> W2_X
	     ADJW12(STP_ZN,(W2 -W2_X)*2048/A_M_NAME[STP_FN,10])
	     A_PRESS_N0[U_PRESS,STPN&STP_FC,STP_FN,2] :=W2
	     A_PRESS_N0[U_PRESS,STPN&STP_FC,STP_FN,11] :=W11
	     XMC_F=A_M_NAME[STP_FN,3]
	     IF  (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] >0)
	       @  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY	A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] +W11	PICT "&XMC_F"
	     ENDIF

	     IF DSPADJAW=1  && STD A°t ¬y¤ô³æPRINT
	       XW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
	       XWadj11=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
	       A_RAND_W[1,STP_FN]=Get_Rand_w(STP_FN,xw1+XWadj11)
	     endif
	   ENDIF
       && ENDIF

    else  && c1-c3
      xtmp=gs_tot + water_tot
      if stp_fn > xtmp	.and.  stp_fn <= xtmp+3
	isC12=1

	 &&speedw[stp_fn-xtmp,1]  kg/sec
	 &&speedw[stp_fn-xtmp,2]=0
	 &&speedw[stp_fn-xtmp,3]=0
	 if  speedw[stp_fn-xtmp,2]  =0 .and. speedw[stp_fn-xtmp,3] >0
	      SET COLOR TO &C2	/ &C1
	      *MTANK_MARK(6,STP_FN,1)
	      DSPA_ARROW(STP_FN,0,0)  && EREASE  úD
		&& DSPA_FMK(STP_FN,1)  && "úZúYúYú["
	      SET COLOR TO &C7 +/ &C1

	 endif

	 if  speedw[stp_fn-xtmp,2]  >0 .and. speedw[stp_fn-xtmp,3] >0
	    retu
	 endif
      endif
    ENDIF


    IF	 mdirty_no[1] >0
      IF   (stp_fn  = mdirty_no[1])
	DO CASE
	CASE  mdirty_no[5]=0   && COUNT
	  XDD1=INT((CHENDATA( mdirty_no[1]-1 ))*A_M_NAME[ mdirty_no[1],9 ]/PER/2048)
	  if xdd1 >= mdirty_no[2]
	    SetDigitOut(1,STP_ZN,0)
	    mdirty_no[4]=SECONDS()
	    mdirty_no[5]=1
	    SetDigitOut(2,A_M_NAME[STP_FN,8],1)
	    DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
	    RETU
	  ENDIF
	CASE  mdirty_no[5]=1
	  if ABS(SECONDS()-mdirty_no[4]) >= mdirty_no[3]
	    SetDigitOut(1,STP_ZN,1)
	    IF RDOK2(STP_ZN)=0
	      SETOK(STP_ZN)
	    ENDIF
	    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
	    DSPB_FMK(A_M_NAME[STP_FN,8]+1,0)
	    mdirty_no[5]=2
	  ELSE
	    RETU
	  ENDIF
	ENDCASE
      ENDIF
    ENDIF



  IF RDOK2(STP_ZN)=0
    *DOUT(STP_ZN,0)
    SetDigitOut(1,STP_ZN,0)
    SetCout2(STP_FC,0)
    *TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
    STOPTM&STP_FC=0
    EWN=CHENDATA(STP_ZN)
    EW1=EWN*A_M_NAME[STP_FN,10]/PER/2048
    EW_CHK=EWN*A_M_NAME[STP_FN,9]/PER/2048


    &&20170826 TESTPGM
    XMC_F=A_M_NAME[STP_FN,3]
    SW1_TMP=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  + A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
    xFlorTmp=PFLOR&STP_FC
    if	  xFlorTmp < ERKG&STP_FC
       xFlorTmp = ERKG&STP_FC
    endif
    IF EW_CHK <(SW1_TMP -xFlorTmp)
      SET COLOR TO GR+	/ &C1
      @  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]+ A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]  PICT "&XMC_F"
      SET COLOR TO &C2	/ &C1
      *MTANK_MARK(6,STP_FN,1)
      DSPA_ARROW(STP_FN,1,14)  &&   úD


      SETW1(STP_ZN,(SW1_TMP-PFLOR&STP_FC)*2048/A_M_NAME[STP_FN,9])
      SETW2(STP_ZN,(SW1_TMP-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,9])
      SETOK(STP_ZN)
      *DOUT(STP_ZN,1)
      SetDigitOut(1,STP_ZN,1)
      SetDigitOut(2,A_M_NAME[STP_FN,8],0)
      RETU
    ENDIF




    && MDY180902
    if DROP_AUTO=7  .AND. WSCALE_type[1]=4  .AND. STP_FN <4
       GSTOT_ERR= EW_CHK -A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  - A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
       GSTOT_ERR=INT(GSTOT_ERR)

    ENDIF
    xtmp=gs_tot + water_tot
    if stp_fn > xtmp  .and.  stp_fn <= xtmp+3
       &&speedw[stp_fn-xtmp,1]	kg/sec
       &&speedw[stp_fn-xtmp,2]=0
       &&speedw[stp_fn-xtmp,3]=0
       if  speedw[stp_fn-xtmp,3] >0
	  EW1=0
       endif
    ENDIF
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := INT(EW1)
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1

    A_PRESS_N0[L_PRESS,5,STP_FN,4]=A_PRESS_N0[L_PRESS,5,STP_FN,4] + INT(EW1)

    XMC_F=A_M_NAME[STP_FN,3]
    *@	8,A_M_NAME[STP_FN,13]  SAY  EW1   PICT "&XMC_F"
    SET COLOR TO &C2 / &C1
    *MTANK_MARK(6,STP_FN,0)
    DSPA_ARROW(STP_FN,0,0)  && EREASE  úD
      && DSPA_FMK(STP_FN,1)  && "úZúYúYú["

    SET COLOR TO &C7 +/ &C1
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-1)
    xstar=index1 +1
    EWN=0
    FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP  -1

      if WSCALE_type[1]=5  .AND.  STP_FN <=5
	XLOOP_b=aWnoreset[xstar]
	EWN=EWN +CHENDATA(XLOOP_b-1)
	xstar=xstar -1

      else
	EWN=EWN +CHENDATA(XLOOP-1)
      endif
      WTANK_F[STP_FN,1] :=1
    NEXT
    DO CASE
    CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
      STP_A[STPA_NAME]=4
    OTHERWISE
      if STP_FN <=5  .AND. WSCALE_type[1]=5
	SETDLA(A_M_NAME[STP_FN,8],EWN)
      ELSE
	xchk1=0
	if isC12=1
	  xtmp=gs_tot + water_tot
	  if speedw[STP_FN-xtmp,3]>0
	    xchk1=1

	  endif

	endif
	if xchk1=0
	  SETDLA(A_M_NAME[STP_FN,8],EWN)
	endif

      ENDIF
      STP_A[STPA_NAME]=0
      if WSCALE_type[1]=5  .AND. STP_FN <=5
	XNTMP= STP_FN +1
	FOR ITMP=1 TO 4
	  XNTMP=VAL(SUBSTR(WNORESET,ITMP,1))
	  IF XNTMP=STP_FN
	    XNTMP=VAL(SUBSTR(WNORESET,ITMP+1,1))
	    EXIT
	  ENDIF
	NEXT
	STP_A[XNTMP]=2
      ELSE
	STP_A[STPA_NAME+1]=2
      ENDIF
    ENDCASE

  ENDIF
  TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
CASE STPA_STEP=4  .AND.  (WTANK_F[STP_FN,1]=-99)
    STP_A[STPA_NAME]=41
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-2)
    FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP  -1
      WTANK_F[XLOOP,1] :=-98  &&¶i®Æ¤¤
      && WTANK_F[XLOOP,2] :=-98  &&¶i®Æ¤¤
    NEXT

CASE STPA_STEP=41
  if stp_fn > gs_tot
     IF ( DIN(9)=1 )   .OR.  ( DIN(12)=0)
       RETU
     ENDIF
  else
    IF KOT=1
      IF ( DIN(9)=1 )	.OR.  ( DIN(12)=0)
	RETU
      ENDIF
    ELSE

      &&MDY190413
      &&IF DIN(8)=1) .OR. (DIN(11)=0)

      IF  (DIN(11)=0)
	RETU
      ENDIF
    ENDIF
  endif
  IF  TIME1[A_M_NAME[STP_FN,8]+1,2] =0
    TIME1[A_M_NAME[STP_FN,8]+1,2] :=SECONDS()
  ENDIF
  IF ABS(SECONDS()-TIME1[A_M_NAME[STP_FN,8]+1,2]) >=TIME1[A_M_NAME[STP_FN,8]+1,1]
    TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
    STP_A[STPA_NAME]=5
  ENDIF
  if ( stp_fn <=gs_tot )
    IF GS_DROPOK(A_M_NAME[STP_FN,8] +1)<> 1
      IF SPACIAL_0=0
	STP_A[STPA_NAME]=41
      ENDIF
    ENDIF
  ENDIF
CASE STPA_STEP=5
  if GS_DROP[A_M_NAME[STP_FN,8] +1,1] >100
    GS_DROP[A_M_NAME[STP_FN,8] +1,2] :=3
  else
    GS_DROP[A_M_NAME[STP_FN,8] +1,2] :=2
  endif
  *TOTDR1=TOTDR1-1
  INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-2)
  EWN=0
  FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP	-1
    WTANK_F[XLOOP,1] :=66  &&¶i®Æ¤¤
    WTANK_F[XLOOP,2] :=0  &&¶i®Æ¤¤
  NEXT
  STP_A[STPA_NAME]=6
  dsp_e=get_dspb(STP_FN,WEIGHT_TYPE[STP_FN])
  IF DSP_E=1
      DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
  ENDIF
    if	(A_PRESS_N0[L_PRESS,1,STP_FN,1]  <> 0) .or.   (WEIGHT_TYPE[STP_FN]=2) .or. (WEIGHT_TYPE[STP_FN]=5) .or. (WEIGHT_TYPE[STP_FN]=9) .or. (WEIGHT_TYPE[STP_FN]=14)
      SET COLOR TO &C11 / &C1
      *@ 11,7  SAY   "úLúPúPúKúPúPúO"
      *DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
      xc=alltrim(str(A_M_NAME[STP_FN,8] + 1,2,0))
      *XA=PZER[A_M_NAME[STP_FN,8]+1]
      *XB= A_M_NAME[A_M_NAME[STP_FN,8]+1,6]
      *XB=INT((XA/XB)*PER*2048)
      *SETZER(A_M_NAME[STP_FN,8],XB+2048)
      && xz=INT(((PZER_W_A[A_M_NAME[STP_FN,8]+1]/A_M_NAME[A_M_NAME[STP_FN,8]+1,6]))*PER*2048)+2048
      && xz=INT(((PZER_W_A[A_M_NAME[STP_FN,8]+1]/A_M_NAME[A_M_NAME[STP_FN,8]+1,6]))*PER*2048)+2048
      && SETZER(A_M_NAME[STP_FN,8],xz)
      SETZERTM(A_M_NAME[STP_FN,8],PZERTM[A_M_NAME[STP_FN,8]+1])
      SETZEROK(A_M_NAME[STP_FN,8])
      *dout2(A_M_NAME[STP_FN,8],1)
      SetDigitOut(2,A_M_NAME[STP_FN,8],1)
  ENDIF
  if ( stp_fn <=gs_tot )
    SANDCUTW[A_M_NAME[STP_FN,8]+1,2] := 0
  endif

  xtmp=gs_tot + water_tot
  if stp_fn > xtmp  .and.  stp_fn <= xtmp+3
     &&speedw[stp_fn-xtmp,1]  kg/sec
     &&speedw[stp_fn-xtmp,2]=0
     &&speedw[stp_fn-xtmp,3]=0
     if WEIGHT_TYPE[stp_fn]=2
       if A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] =0  .and.  (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN-1,1] =0)
	  speedw[stp_fn-xtmp,3] =speedw[stp_fn-xtmp-1,3] +speedw[stp_fn-xtmp,3]
	  speedw[stp_fn-xtmp-1,2]=0
	  speedw[stp_fn-xtmp-1,3]=0
       else
	 speedw[stp_fn-xtmp,2]=0
	 if speedw[stp_fn-xtmp,3]>0
	   speedw[stp_fn-xtmp-1,3]=speedw[stp_fn-xtmp,3]
	   speedw[stp_fn-xtmp,3]=0
	 endif
       endif
     endif
     if  speedw[stp_fn-xtmp,3] >0
       speedw[stp_fn-xtmp,2]=SECONDS()
      DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
     endif
  endif


CASE STPA_STEP=6
  JMPF=0
  JMPF=JMP_E(STP_FN,WEIGHT_TYPE[STP_FN])
  IF JMPF=0
    *TST1_LS2(STP_FN)
    *  IF LS2[STP_FN,2]=1
    *	 RETU
    *  ENDIF
    *  TST0_LS1(STP_FN,STP_FN)
    ELSE
	setZokn(A_M_NAME[STP_FN,8],0)
    ENDIF
    IF	 ( stp_fn <=gs_tot )
      IF (SANDCUTW[A_M_NAME[STP_FN,8]+1,1] >0)
	IF  ( SANDCUTW[A_M_NAME[STP_FN,8]+1,2] =0 )
	  X=INT((WDATA(A_M_NAME[STP_FN,8])-2048)*A_M_NAME[A_M_NAME[STP_FN,8]+1,6]/PER/2048)
	    IF X <= SANDCUTW[A_M_NAME[STP_FN,8]+1,1]
	      *dout2(A_M_NAME[STP_FN,8],0)
	      SetDigitOut(2,A_M_NAME[STP_FN,8],0)
	      GS_DROP[A_M_NAME[STP_FN,8] +1,2] :=3
	      SANDCUTW[A_M_NAME[STP_FN,8]+1,2] := 1
	      RETU
	    ENDIF
	  ELSE
	    xlast= CHK_LASTOUT()
	    xlast=xlast -WSCALE_type[A_M_NAME[STP_FN,8]+1]
	    IF XLAST >0
	      RETU
	    ENDIF
	    SANDCUTW[A_M_NAME[STP_FN,8]+1,2] := 1
	    IF	RDZEROK(A_M_NAME[STP_FN,8])<>0
	      *dout2(A_M_NAME[STP_FN,8],1)
	      SetDigitOut(2,A_M_NAME[STP_FN,8],1)
	    endif
	  ENDIF
	ENDIF
     ENDIF
     xtmp=gs_tot + water_tot
     if stp_fn > xtmp  .and.  stp_fn <= xtmp+3	  .and. ( WEIGHT_TYPE[STP_FN]=77  .or.	WEIGHT_TYPE[STP_FN]=2)
	&&speedw[stp_fn-xtmp,1]  kg/sec
	&&speedw[stp_fn-xtmp,2]=0
	&&speedw[stp_fn-xtmp,3]=0
	if  speedw[stp_fn-xtmp,2]  >0 .and. speedw[stp_fn-xtmp,3] >0
	   retu
	endif
     endif


  IF  RDZEROK(A_M_NAME[STP_FN,8])=0
     SET COLOR TO &C2 / &C1
     *@ 11,7  SAY   "úLúPúPúPúPúPúO"
     DSPB_FMK(A_M_NAME[STP_FN,8]+1,0)
     SET COLOR TO &C7 +/ &C1
    *dout2(A_M_NAME[STP_FN,8],0)
    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
    INDEX1=GET_DATA2(STP_FN,-1)
    *+++++++++++++++++++++++++++++++++++++++++++++++++
    if stp_fn >gs_tot  .and.   KOT=0  && ¤W¤U«¬¦³«Ý¤æ
      x_stor=4
    else
      x_stor=3
    endif
    IF PNT_REMAIN=1
      XREM=GET_REMAINS(STP_FN,STPN&STP_FC,INDEX1,@A_PRESS_N0,x_stor)
    ENDIF
    *+++++++++++++++++++++++++++++++++++++++++++++++++
    STP_A[STPA_NAME]=7
    setdla(A_M_NAME[STP_FN,8],0)
    stpn_old=stpn&stp_fc
    FOR XLOOP=stp_fn TO stp_fn-INDEX1  STEP  -1
      XLOOPC=ALLTRIM(STR(XLOOP,2,0))
      XMC_F=A_M_NAME[xloop,3]
      @  A_M_NAME[XLOOP,23],A_M_NAME[XLOOP,13]	SAY  "     " PICT "&XMC_F"
      A_M_NAME[XLOOP,10] := A_M_NAME[XLOOP,9]
      A_M_NAME[XLOOP,12] := A_M_NAME[XLOOP,6]
      CLEACHMEM(XLOOP-1)
      &&v15t

      && xtmpwt5=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,5]  CHANGE TO  LUSTP2.PRG
      && xtmpwt6=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,6]
      && A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,6]:= xtmpwt6 +xtmpwt5
      if STPN&XLOOPC=1
	if  A_PRESS_N0[L_PRESS,1,STP_FN,6] >=A_PRESS_N0[L_PRESS,2,STP_FN,6]
	  STPN&XLOOPC=STPN&xLOOPC+1
	endif
      else
	STPN&XLOOPC=STPN&xLOOPC+1
      endif

      WTANK_F[xloop,1] :=0
      WTANK_F[xloop,2] :=1    &&¶i®Æ§¹¦¨
      SET COLOR TO R+  / &C1
      && DSPA_FMK(STP_FN,0)  && "úLúPúPúO"

      xtmp=gs_tot + water_tot
      if XLOOP > xtmp  .and.  XLOOP  <= xtmp+3
	 &&speedw[XLOOP -xtmp,1]  kg/sec
	 &&speedw[XLOOP -xtmp,2]=0
	 &&speedw[XLOOP -xtmp,3]=0
	 speedw[XLOOP -xtmp,2]=0
	 speedw[XLOOP -xtmp,3]=0
      endif
    NEXT			STST
    if	stp_fn	>gs_tot
      *+++++++++++++++++++++++++++++++++++++++++++++++++++++++
      X_LAST=CHK_LAST_DROP(0)
      *+++++++++++++++++++++++++++++++++++++++++++++++++++++++
      IF X_LAST=1
	IF PNT_REMAIN=1
	   if  KOT=0  && ¤W¤U«¬¦³«Ý¤æ
	     x_stor=4
	   else
	     x_stor=3
	   endif

	   hTOTWACT :=ARRAy(kind)
	   afill(hTOTWACT,0)
	   && pnt_remains(4,STPN_OLD,A_PRESS_N0,0,1,hTOTWACT)
	   pnt_remains(x_stor,STPN_OLD,A_PRESS_N0,0,1,hTOTWACT)
	ENDIF
      ENDIF
    endif
  ENDIF
CASE STPA_STEP=7
  if ( stp_fn <=gs_tot )
    if kot=0
      SET_LAST_PCS(STP_FN,A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,5],0)
    endif
    GS_DROP[A_M_NAME[STP_FN,8] +1,2] :=1
    GS_DROPRST()
  endif
  INDEX1=GET_DATA2(STP_FN,-1)
  STP_A[STPA_NAME]=0
  && FOR XLOOP=stp_fn TO stp_fn-INDEX1	STEP  -1
  &&  WTANK_F[XLOOP,3] :=1
  && NEXT
  IF  (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,5] <>0)
     if WSCALE_type[1]=5  .AND.  STP_FN <=5
       XLOOP_b=aWnoreset[1]
       STP_A[XLOOP_B]=1
     ELSE
       STP_A[STPA_NAME-INDEX1]=1
     ENDIF

  ELSE
    FOR XLOOP=stp_fn TO stp_fn-INDEX1  STEP  -1
      XLOOPC=ALLTRIM(STR(XLOOP,2,0))
      STPN&XLOOPC=1
       WTANK_F[XLOOP,3] :=1
    NEXT
    if kot=1
      SET_LAST_PCS(1,1,0)
    endif
  ENDIF
ENDCASE
RETU

**-----------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------
PROCEDURE  STP_ALL_AE
PARAMETERS  STPA_NAME,STPA_STEP,P3
if (din(15)=0)
   retu
endif
STP_ZN=STPA_NAME-1
STP_FN=STPA_NAME
STP_FC=ALLTRIM(STR(STP_FN,2,0))
DO CASE
CASE (STPA_STEP=0)   .and. (din(14)=1) .AND. (DIN(15)=1)    &&AUTO ,NO PAUSE
  IF   ((WEIGHT_TYPE[STP_FN]=77) .OR.  (WEIGHT_TYPE[STP_FN]=1) .OR. (WEIGHT_TYPE[STP_FN]=3) .OR. (WEIGHT_TYPE[STP_FN]=6) .OR. (WEIGHT_TYPE[STP_FN]=10)	)  .AND. NEXTOK1=1
    IF (A_PRESS_n0[1,dima_len,STP_FN,1] =77)
       INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],1)
       FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
	    if stp_a[xloop] <> 0
	       retu
	    endif
       NEXT
	 a_copy_4(A_PRESS_N0,STP_FN,STP_FN+INDEX1)  && COPY A_PRESS_N0[1,1-20,N1-N3,1-7) DATA TO A_PRESS_N0[2,1-20,N1-N3,1-7)
	 NEXTOK1=0
	 FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
	   A_PRESS_n0[1,dima_len,XLOOP,1] :=0
	 NEXT
	 STP_A[STPA_NAME]=1
	 FOR IX=1 TO (GS_TOT+UWC_TOT)
	   IF  A_PRESS_n0[1,dima_len,ix,1] =77
	     NEXTOK1=1
	   ENDIF
	 NEXT
    ENDIF
  ENDIF
CASE (STPA_STEP=1)   .and. (din(14)=1) .AND. (DIN(15)=1)    &&AUTO ,NO PAUSE
  IF   ((WEIGHT_TYPE[STP_FN]=77) .OR.  (WEIGHT_TYPE[STP_FN]=1) .OR. (WEIGHT_TYPE[STP_FN]=3) .OR. (WEIGHT_TYPE[STP_FN]=6) .OR. (WEIGHT_TYPE[STP_FN]=10)	)
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],1)
    FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
      WTANK_F[XLOOP,1] :=77
      A_RAND_W[1,XLOOP]=0    && 2021/4/19
    NEXT
    STP_A[STPA_NAME]=2
    RDDELAY[STP_FN,2] :=SECONDS()
    RDDELAY[STP_FN,3] :=0
  ENDIF
CASE STPA_STEP=2
  dsp_e=get_dspb(STP_FN,WEIGHT_TYPE[STP_FN])
  DSP_E=1
  DSPB_FMK(A_M_NAME[STP_FN,8]+1,dsp_e)	&& "úZúYúYú["
  DRAF=0
  GS_CHG=0
  A_RAND_W[1,STP_FN]=0	  && 2021/4/19

  DO CASE
  CASE (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] =0 )
    DSP_RECIP(STP_FN,0)
    DO CASE
    CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
      STP_A[STP_FN]=3
    OTHERWISE
      STP_A[STPA_NAME]=0
      STP_A[STPA_NAME+1]=2
    ENDCASE
    WTANK_F[STP_FN,1] :=1
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4]  :=0
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7]  :=1
  CASE (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] > 0 )
    XW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
    IF DSPADJAW=1  && STD A°t ¬y¤ô³æPRINT
      XWadj11=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
      A_RAND_W[1,STP_FN]=Get_Rand_w(STP_FN,xw1+XWadj11)
    endif
    IF	A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] >0
      DSPDATA_A[STP_FN] := 1
    ELSE
      DSPDATA_A[STP_FN] := 0
    ENDIF
    ADJWN=0
    ADJWN_f=0
    W2=0
    W11=0

    *GET_WATER_ADJ(STP_FN,STPN&STP_FC,WATER_INPUT,@WATER_INC)
    DSP_RECIP(STP_FN,0)
    IF	 ((WEIGHT_TYPE[STP_FN]<>77) .and.  (WEIGHT_TYPE[STP_FN]<>2) .and. (WEIGHT_TYPE[STP_FN]<>5) .and. (WEIGHT_TYPE[STP_FN]<>9) .and. (WEIGHT_TYPE[STP_FN]<>14)  )
       index1=0
       index1=GET_RECIP_A(STP_FN)
       RDDLY(STP_FN,A_M_NAME[STP_FN,8],INDEX1,2)
       XRD := RDDELAY[STP_FN,3]
       IF XRD<>0
	    IF XRD=1
	      XMC_F=A_M_NAME[STP_FN,3]
	      EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
	      @  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  EWN    PICT "&XMC_F"
	      A_RAND_W[1,STP_FN]=EWN
	      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := EWN
	      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
	      EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
	      EWN= EWN	* 2048/A_M_NAME[STP_FN,10]
	      SETCHDATA(STP_ZN,EWN)
	      STP_A[STPA_NAME]=3
	      WTANK_F[STP_FN,1] :=1


	      && DO CASE
	      && CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
	      &&   STP_A[STP_FN]=3
	      && OTHERWISE
	      &&   STP_A[STPA_NAME]=0
	      &&   STP_A[STPA_NAME+1]=2
	      && ENDCASE

	    endif
	    *DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
	    RETU
       endif
    endif
    XMC_F=A_M_NAME[STP_FN,3]
    *MTANK_MARK(6,STP_FN,1)
    IF DSPDATA_A[STP_FN] =1
      if dspd_nor=0
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]+ ADJWN_f  PICT "&XMC_F"
      else  && b°t¹ê»Ú­È³]©w
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]+ ADJWN_f  PICT "&XMC_F"
      endif

      SET COLOR TO &C2	/ &C1
      *MTANK_MARK(6,STP_FN,1)
      DSPA_ARROW(STP_FN,1,14)  &&   úD
      *DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
    endif
      SET COLOR TO &C10 / &C1
      *@ 11,7  SAY   "úZúYúYúYúYúYú["
      *DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
      WEIG_RESCALL(STP_FN)
    DSP_RECIP(STP_FN,0)
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]=ADJWN
    SET COLOR TO &C7 +/ &C1
    CLEACHMEM(STP_ZN)
    SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  + ADJWN
SETW1(STP_ZN,(SW1-PFLOR&STP_FC)*2048/A_M_NAME[STP_FN,10])
    SETW2(STP_ZN,(SW1-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,10])
    SETOK(STP_ZN)
    *DOUT(STP_ZN,1)
    SetDigitOut(1,STP_ZN,1)
    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
    STP_A[STPA_NAME]=3
  ENDCASE
CASE STPA_STEP=3
  *TST1_LS1(STP_FN)
  *IF LS1[STP_FN,2]=1
  *  RETU
  *ENDIF
  *TST0_LS2(STP_FN)
  IF RDOK2(STP_ZN)=0
    *DOUT(STP_ZN,0)
    SetDigitOut(1,STP_ZN,0)
    STOPTM&STP_FC=0
    EWN=CHENDATA(STP_ZN)
    EW1=EWN*A_M_NAME[STP_FN,10]/PER/2048
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := INT(EW1*100)/100
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
    XMC_F=A_M_NAME[STP_FN,3]
    *@	8,A_M_NAME[STP_FN,13]  SAY  EW1   PICT "&XMC_F"
    SET COLOR TO &C2 / &C1
    *MTANK_MARK(6,STP_FN,0)
    DSPA_ARROW(STP_FN,0,0)  && EREASE  úD
    SET COLOR TO &C7 +/ &C1
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-1)
    EWN=0
    FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP  -1
      EWN=EWN +CHENDATA(XLOOP-1)
      WTANK_F[STP_FN,1] :=1
    NEXT
    DO CASE
    CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
      STP_A[STPA_NAME]=4
    OTHERWISE
      SETDLA(A_M_NAME[STP_FN,8],EWN)
      STP_A[STPA_NAME]=0
      STP_A[STPA_NAME+1]=2
    ENDCASE
  ENDIF
CASE STPA_STEP=4  .AND.   ((WTANK_F[STP_FN,1]=-99    .AND. DIN(9)=0  ) .OR. (TIME1[STP_FN,1]=88 .AND. GS_DROP[STP_FN,1]<>58   ) .OR. ( TIME1[STP_FN,1]=88 .and. gs_drop[STP_FN,1]=58   .and. STP_A[VAL(WATER_OUT_NO)]>=4 ) )   .AND. DIN(12)=1
    &&IF ( DIN(9)=1 )	.OR.  ( DIN(12)=0)
    IF ( DIN(9)=1  .and. TIME1[STP_FN,1] <>88 )   .OR.	( DIN(12)=0)
      RETU
    ENDIF
  if TIME1[A_M_NAME[STP_FN,8]+1,1]=88  && TIME1[STP_FN,1] =88
	TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
	STP_A[STPA_NAME]=5
  ELSE
    IF	TIME1[A_M_NAME[STP_FN,8]+1,2] =0
      TIME1[A_M_NAME[STP_FN,8]+1,2] :=SECONDS()
    ENDIF
    IF ABS(SECONDS()-TIME1[A_M_NAME[STP_FN,8]+1,2]) >=TIME1[A_M_NAME[STP_FN,8]+1,1]
      TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
      STP_A[STPA_NAME]=5
    ENDIF
  ENDIF
CASE STPA_STEP=5
  INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-2)
  EWN=0
  FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP	-1
    WTANK_F[XLOOP,1] :=66  &&¶i®Æ¤¤
    WTANK_F[XLOOP,2] :=0  &&¶i®Æ¤¤
  NEXT
  STP_A[STPA_NAME]=6
  dsp_e=get_dspb(STP_FN,WEIGHT_TYPE[STP_FN])
  IF DSP_E=1
      DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
  ENDIF

    if	(A_PRESS_N0[L_PRESS,1,STP_FN,1]  <> 0) .or.   (WEIGHT_TYPE[STP_FN]=2) .or. (WEIGHT_TYPE[STP_FN]=5) .or. (WEIGHT_TYPE[STP_FN]=9) .or. (WEIGHT_TYPE[STP_FN]=14)
      xskip=0
      if WEIGHT_TYPE[STP_FN]=2
	if (A_PRESS_N0[L_PRESS,1,STP_FN,1]  = 0) .and. (A_PRESS_N0[L_PRESS,1,STP_FN-1,1]  = 0)
	  xskip=1

	endif
      endif
      if xskip=0

	SET COLOR TO &C11 / &C1
	*@ 11,7  SAY   "úLúPúPúKúPúPúO"
	*DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)	&& úD
	xc=alltrim(str(A_M_NAME[STP_FN,8] + 1,2,0))
	*XA=PZER[A_M_NAME[STP_FN,8]+1]
	*XB= A_M_NAME[A_M_NAME[STP_FN,8]+1,6]
	*XB=INT((XA/XB)*PER*2048)
	*SETZER(A_M_NAME[STP_FN,8],XB+2048)
	*SETZER(A_M_NAME[STP_FN,8],INT(((PZER_W_A[A_M_NAME[STP_FN,8]+1]/A_M_NAME[A_M_NAME[STP_FN,8]+1,6]))*PER*2048)+2048)
	&& x=PZER_W_A[A_M_NAME[STP_FN,8]+1]
	y= A_M_NAME[A_M_NAME[STP_FN,8]+1,6]
	x=x/y
	&& SETZER(A_M_NAME[STP_FN,8],(((PZER_W_A[A_M_NAME[STP_FN,8]+1]/A_M_NAME[A_M_NAME[STP_FN,8]+1,6]))*PER*2048)+2048)
	SETZERTM(A_M_NAME[STP_FN,8],PZERTM[A_M_NAME[STP_FN,8]+1])
	SETZEROK(A_M_NAME[STP_FN,8])
	*dout2(A_M_NAME[STP_FN,8],1)
	SetDigitOut(2,A_M_NAME[STP_FN,8],1)
     endif
  ENDIF
CASE STPA_STEP=6
  JMPF=0
  if WEIGHT_TYPE[STP_FN]=2
    if (A_PRESS_N0[L_PRESS,1,STP_FN,1]	= 0) .and. (A_PRESS_N0[L_PRESS,1,STP_FN-1,1]  = 0)
      JMPF=1
    endif
  endif
  IF JMPF=0
    *TST1_LS2(STP_FN)
    *  IF LS2[STP_FN,2]=1
    *	 RETU
    *  ENDIF
    *  TST0_LS1(STP_FN,STP_FN)
    ELSE
	setZokn(A_M_NAME[STP_FN,8],0)
    ENDIF
  IF  RDZEROK(A_M_NAME[STP_FN,8])=0
     SET COLOR TO &C2 / &C1
     *@ 11,7  SAY   "úLúPúPúPúPúPúO"
     DSPB_FMK(A_M_NAME[STP_FN,8]+1,0)
     SET COLOR TO &C7 +/ &C1
    *dout2(A_M_NAME[STP_FN,8],0)
    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
    INDEX1=GET_DATA2(STP_FN,-1)
    *+++++++++++++++++++++++++++++++++++++++++++++++++
    IF PNT_REMAIN=1  .and.  TIME1[STP_FN,1] <>88
       if  KOT=0  && ¤W¤U«¬¦³«Ý¤æ
	 x_stor=4
       else
	 x_stor=3
       endif



       XREM=GET_REMAINS(STP_FN,STPN&STP_FC,INDEX1,@A_PRESS_N0,x_stor ) &&  4)
    ENDIF
    *+++++++++++++++++++++++++++++++++++++++++++++++++
    STP_A[STPA_NAME]=7
    setdla(A_M_NAME[STP_FN,8],0)
    stpn_old=stpn&stp_fc
    FOR XLOOP=stp_fn TO stp_fn-INDEX1  STEP  -1
	XLOOPC=ALLTRIM(STR(XLOOP,2,0))
	XMC_F=A_M_NAME[xloop,3]
	@  A_M_NAME[XLOOP,23],A_M_NAME[XLOOP,13]  SAY  "     " PICT "&XMC_F"
      A_M_NAME[XLOOP,10] := A_M_NAME[XLOOP,9]
      A_M_NAME[XLOOP,12] := A_M_NAME[XLOOP,6]
      CLEACHMEM(XLOOP-1)
      STPN&XLOOPC=STPN&xLOOPC+1
      WTANK_F[xloop,1] :=0
      WTANK_F[xloop,2] :=1
    NEXT
    *+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    X_LAST=CHK_LAST_DROP(0)
    *+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    IF X_LAST=1
      IF PNT_REMAIN=1	 .and.	TIME1[STP_FN,1] <>88
	 hTOTWACT :=ARRAy(kind)
	 for  xlpa=1  to  kind
	      hTOTWACT[xlpa]=0
	 next
	 if  KOT=0  && ¤W¤U«¬¦³«Ý¤æ
	   x_stor=4
	 else
	   x_stor=3
	 endif

	 && pnt_remains(4,STPN_OLD,A_PRESS_N0,0,1,hTOTWACT)
	 pnt_remains(x_stor,STPN_OLD,A_PRESS_N0,0,1,hTOTWACT)
      ENDIF
    ENDIF





  ENDIF
CASE STPA_STEP=7 .AND.	(WTANK_F[STP_FN,1] =2  .OR. TIME1[STP_FN,1] <>88  )
    if kot=0
      SET_LAST_PCS(STP_FN,A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,5],0)
  endif
  INDEX1=GET_DATA2(STP_FN,-1)
  STP_A[STPA_NAME]=0
  && FOR XLOOP=stp_fn TO stp_fn-INDEX1	STEP  -1
  &&   WTANK_F[XLOOP,3] :=1
  && NEXT
  IF  (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,5] <>0)
    STP_A[STPA_NAME-INDEX1]=1
  ELSE
    FOR XLOOP=stp_fn TO stp_fn-INDEX1  STEP  -1
      XLOOPC=ALLTRIM(STR(XLOOP,2,0))
      STPN&XLOOPC=1
      WTANK_F[XLOOP,3] :=1
    NEXT
    if kot=1
      SET_LAST_PCS(1,1,0)
    endif
  ENDIF
ENDCASE
RETU

**-----------------------------------------------------------------------------
FUNCTION      get_dspb
PARAMETERS  X_STP_FN,X_WEIGHT_TYPE
RETUN=0
   DO  CASE
   CASE  X_WEIGHT_TYPE =77
       IF   A_PRESS_N0[2,1,X_STP_FN,8] >0
	 RETUN=1
       ENDIF
   CASE  X_WEIGHT_TYPE =2
      IF  ( A_PRESS_N0[2,1,X_STP_FN,8] >0 )   .or.  ( A_PRESS_N0[2,1,X_STP_FN-1,8] >0 )
	RETUN=1
      ENDIF
   CASE  X_WEIGHT_TYPE =5
      IF  ( A_PRESS_N0[2,1,X_STP_FN,8] >0 )   .or.  ( A_PRESS_N0[2,1,X_STP_FN-1,8] >0 )    .or.  ( A_PRESS_N0[2,1,X_STP_FN-2,8] >0 )
	RETUN=1
      ENDIF
   CASE  X_WEIGHT_TYPE =9
      IF  ( A_PRESS_N0[2,1,X_STP_FN,8] >0 )   .or.  ( A_PRESS_N0[2,1,X_STP_FN-1,8] >0 )    .or.  ( A_PRESS_N0[2,1,X_STP_FN-2,8] >0 )	.or.  ( A_PRESS_N0[2,1,X_STP_FN-3,8] >0 )
	RETUN=1
      ENDIF
   CASE  X_WEIGHT_TYPE =14
      IF  ( A_PRESS_N0[2,1,X_STP_FN,8] >0 ) ;
	  .or.	( A_PRESS_N0[2,1,X_STP_FN-1,8] >0 ) ;
	  .or.	( A_PRESS_N0[2,1,X_STP_FN-2,8] >0 ) ;
	  .or.	( A_PRESS_N0[2,1,X_STP_FN-3,8] >0 ) ;
	  .or.	( A_PRESS_N0[2,1,X_STP_FN-4,8] >0 )

	RETUN=1
      ENDIF



   ENDCASE
RETU   RETUN
**-----------------------------------------------------------------------------
FUNCTION      JMP_E
PARAMETERS  X_STP_FN,X_WEIGHT_TYPE
RETUN=0
   DO  CASE
   CASE  X_WEIGHT_TYPE =77
       IF   A_PRESS_N0[2,1,X_STP_FN,1] =0
	 RETUN=1
       ENDIF
   CASE  X_WEIGHT_TYPE =2
      IF  ( A_PRESS_N0[2,1,X_STP_FN,1] =0 )  .AND.  ( A_PRESS_N0[2,1,X_STP_FN-1,1]=0)
	RETUN=1
      ENDIF
   CASE  X_WEIGHT_TYPE =5
      IF  ( A_PRESS_N0[2,1,X_STP_FN,8]=0 ) .AND.  ( A_PRESS_N0[2,1,X_STP_FN-1,1]=0)    .AND.  ( A_PRESS_N0[2,1,X_STP_FN-2,1]=0)
	RETUN=1
      ENDIF
   ENDCASE
RETU   RETUN
**-----------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------
PROCEDURE  STP_ALL_W
PARAMETERS  STPA_NAME,STPA_STEP,P3
if (din(15)=0)
   retu
endif
STP_ZN=STPA_NAME-1
STP_FN=STPA_NAME
STP_FC=ALLTRIM(STR(STP_FN,2,0))
SH_W_ADJ2(STPN&STP_FC,WATER_INPUT)
DO CASE
CASE (STPA_STEP=0)   .and. (din(14)=1) .AND. (DIN(15)=1)    &&AUTO ,NO PAUSE
  IF   ((WEIGHT_TYPE[STP_FN]=77) .OR.  (WEIGHT_TYPE[STP_FN]=1) .OR. (WEIGHT_TYPE[STP_FN]=3) .OR. (WEIGHT_TYPE[STP_FN]=6) .OR. (WEIGHT_TYPE[STP_FN]=10)	)  .AND. NEXTOK1=1
    IF (A_PRESS_n0[1,dima_len,STP_FN,1] =77)
       INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],1)
       FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
	    if stp_a[xloop] <> 0
	       retu
	    endif
       NEXT
	 a_copy_4(A_PRESS_N0,STP_FN,STP_FN+INDEX1)  && COPY A_PRESS_N0[1,1-20,N1-N3,1-7) DATA TO A_PRESS_N0[2,1-20,N1-N3,1-7)
	 *IF   WASTE=1
	 *  a_copy_4(A_PRESS_N0,GS_TOT+UWC_TOT+1,GS_TOT+UWC_TOT+1)  && COPY A_PRESS_N0[1,1-20,N1-N3,1-7) DATA TO A_PRESS_N0[2,1-20,N1-N3,1-7)
	 *ENDIF
	 NEXTOK1=0
	 FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
	   A_PRESS_n0[1,dima_len,XLOOP,1] :=0
	 NEXT
	 STP_A[STPA_NAME]=1
	 FOR IX=1 TO (GS_TOT+UWC_TOT)
	   IF  A_PRESS_n0[1,dima_len,ix,1] =77
	     NEXTOK1=1
	   ENDIF
	 NEXT
    ENDIF
  ENDIF
CASE (STPA_STEP=1)   .and. (din(14)=1) .AND. (DIN(15)=1)    &&AUTO ,NO PAUSE
  IF   ((WEIGHT_TYPE[STP_FN]=77) .OR.  (WEIGHT_TYPE[STP_FN]=1) .OR. (WEIGHT_TYPE[STP_FN]=3) .OR. (WEIGHT_TYPE[STP_FN]=6) .OR. (WEIGHT_TYPE[STP_FN]=10)	)
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],1)
    FOR  XLOOP=STP_FN  TO STP_FN +INDEX1
      WTANK_F[XLOOP,1] :=77
      A_RAND_W[1,XLOOP]=0    && 2021/4/19
    NEXT
    STP_A[STPA_NAME]=2
    RDDELAY[STP_FN,2] :=SECONDS()
    RDDELAY[STP_FN,3] :=0
  ENDIF
CASE STPA_STEP=2
  DRAF=0
  GS_CHG=0
  A_RAND_W[1,STP_FN]=0	  && 2021/4/19
  W_LOWLEVEL[STP_FN-GS_TOT]=0
  DO CASE
  CASE (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] =0 )
     *if (waste=1)
     *	IF STP_FN=GS_TOT +WATER_TOT
     *	    waste_ACT=0
     *	endif
    *endif
    DSP_RECIP(STP_FN,0)
    DO CASE
    CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
      STP_A[STP_FN]=3
    OTHERWISE
      STP_A[STPA_NAME]=0
      STP_A[STPA_NAME+1]=2
    ENDCASE
    WTANK_F[STP_FN,1] :=1
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4]  :=0
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7]  :=1
  CASE (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] > 0 )
    XW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
    IF	A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] >0
      DSPDATA_A[STP_FN] := 1
    ELSE
      DSPDATA_A[STP_FN] := 0
    ENDIF
    ADJWN=0
    ADJWN_f=0
    W2=0
    W11=0
    GET_W_ADJ2(STP_FN,STPN&STP_FC,WATER_INPUT,1,@W2,@W11)
    DSP_RECIP(STP_FN,0)

    IF DSPADJAW=1  && STD A°t ¬y¤ô³æPRINT
      XWadj11=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
      A_RAND_W[1,STP_FN]=Get_Rand_w(STP_FN,xw1+w11)
    endif

    IF	 ((WEIGHT_TYPE[STP_FN]<>77) .and.  (WEIGHT_TYPE[STP_FN]<>2) .and. (WEIGHT_TYPE[STP_FN]<>5) .and. (WEIGHT_TYPE[STP_FN]<>9) .and. (WEIGHT_TYPE[STP_FN]<>14)  )
       index1=0
       index1=GET_RECIP_A(STP_FN)
       RDDLY(STP_FN,A_M_NAME[STP_FN,8],INDEX1,2)
       XRD := RDDELAY[STP_FN,3]
       IF XRD<>0
	    IF XRD=1
	      XMC_F=A_M_NAME[STP_FN,3]
	      EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
	      if dspd_nor=0
		@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  EWN	PICT "&XMC_F"
	      else  && b°t¹ê»Ú­È³]©w
		EWNa= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
		@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  EWNa	PICT "&XMC_F"
	      endif

	      A_RAND_W[1,STP_FN]=EWN
	      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := EWN
	      A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
	      EWN= A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
	      EWN= EWN	* 2048/A_M_NAME[STP_FN,9] && old ,10]
	      SETCHDATA(STP_ZN,EWN)

	      &&W_LOWLEVEL[STP_FN-GS_TOT]=EWN
	      &&20171201

	      SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  + A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
	      W_LOWLEVEL[STP_FN-GS_TOT]=(SW1-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,10]  && [1 or 2]
	      if W_LOWLEVEL[STP_FN-GS_TOT] < 0
		W_LOWLEVEL[STP_FN-GS_TOT] = 0
	      endif

	      STP_A[STPA_NAME]=3
	      WTANK_F[STP_FN,1] :=1



	      && DO CASE
	      && CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
	      &&   STP_A[STP_FN]=3
	      && OTHERWISE
	      &&   STP_A[STPA_NAME]=0
	      &&   STP_A[STPA_NAME+1]=2
	      && ENDCASE

	    endif
	    DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)  && "úZúYúYú["
	    RETU
       endif
    endif
    XMC_F=A_M_NAME[STP_FN,3]
    *MTANK_MARK(6,STP_FN,1)
    IF DSPDATA_A[STP_FN] =1
      if dspd_nor=0
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]+ A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]  PICT "&XMC_F"
      else  && b°t¹ê»Ú­È³]©w
	@  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]+ A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]  PICT "&XMC_F"
      endif

      SET COLOR TO &C2	/ &C1
      *MTANK_MARK(6,STP_FN,1)
      DSPA_ARROW(STP_FN,1,14)  &&   úD
      DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)	&& "úZúYúYú["
    endif
      SET COLOR TO &C10 / &C1
      *@ 11,7  SAY   "úZúYúYúYúYúYú["
      DSPB_FMK(A_M_NAME[STP_FN,8]+1,1)	&& "úZúYúYú["
      WEIG_RESCALL(STP_FN)
    DSP_RECIP(STP_FN,0)
    *A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]=ADJWN
    SET COLOR TO &C7 +/ &C1
    *if (waste=1)
    *  IF STP_FN=GS_TOT +WATER_TOT
    *	 if  A_PRESS_N0[L_PRESS,STPN&STP_FC,gs_tot+uwc_tot+1,1] =1
    *	   STP_ZN=gs_tot+uwc_tot
    *	   waste_ACT=1
    *	 ELSE
    *	   waste_ACT=0
    *	 ENDIF
    *  endif
    *endif
    CLEACHMEM(STP_ZN)
    SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]  + A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
    *sw1=sw1-ERKG&STP_FC
    *SETW1(STP_ZN,(SW1-PFLOR&STP_FC)*2048/A_M_NAME[STP_FN,10])
    *if  stp_fn=gs_tot+1
    *  xSW1=sw1  * pwater /100
    *  xsw1=xsw1 *2048/A_M_NAME[STP_FN,10]
    *  SETMEM(HEXTODEC("7C4"),xSW1)
    *  XSW1=sw1  * (100-pwater) /100
    *  xsw1=xsw1 *2048/A_M_NAME[STP_FN,10]
    *  SETMEM(HEXTODEC("7C2"),XSW1)
    *endif
    *SETW2(STP_ZN,SW1*2048/A_M_NAME[STP_FN,10])

    SETW1(STP_ZN,(SW1-PFLOR&STP_FC)*2048/A_M_NAME[STP_FN,10])
    W_LOWLEVEL[STP_FN-GS_TOT]=(SW1-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,10]  && [1 or 2]
    SETW2(STP_ZN,(SW1-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,10])
    SETOK(STP_ZN)
    *DOUT(STP_ZN,1)
    SetDigitOut(1,STP_ZN,1)
    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
    STP_A[STPA_NAME]=3
  ENDCASE
CASE STPA_STEP=3
  *TST1_LS1(STP_FN)
  *IF LS1[STP_FN,2]=1
  *  RETU
  *ENDIF
  *TST0_LS2(STP_FN)
  _last=chk_dnlast(A_PRESS_N0,U_PRESS,STPN&STP_FC,STP_FN,cnvstp)  && gs= is_last  and	weight	ok
  TMPDATA=A_PRESS_N0[U_PRESS,STPN&STP_FC,STP_FN,2]
  if _last=0
	W2=0
	W11=0
	GET_W_ADJ2(STP_FN,STPN&STP_FC,WATER_INPUT,0,@W2,@W11)
	IF  W2	<> TMPDATA
	  XWADJTMP=(W2 -TMPDATA)*2048/A_M_NAME[STP_FN,10]
	  && ADJW12(STP_ZN,(W2 -TMPDATA)*2048/A_M_NAME[STP_FN,10])
	  && MDY20161022
	  ADJW12(STP_ZN,XWADJTMP)
	  IF  W_LOWLEVEL[STP_FN-GS_TOT] >0
	    W_LOWLEVEL[STP_FN-GS_TOT]=W_LOWLEVEL[STP_FN-GS_TOT]+XWADJTMP
	  ENDIF

	  A_PRESS_N0[U_PRESS,STPN&STP_FC,STP_FN,2] :=W2
	  A_PRESS_N0[U_PRESS,STPN&STP_FC,STP_FN,11] :=W11
	  XMC_F=A_M_NAME[STP_FN,3]
	  IF  (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] >0)
	    if dspd_nor=0
	      @  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8] +W11   PICT "&XMC_F"
	    else
	      @  A_M_NAME[STP_FN,23],A_M_NAME[STP_FN,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1] +W2   PICT "&XMC_F"
	    endif
	  ENDIF

	  IF DSPADJAW=1  && STD A°t ¬y¤ô³æPRINT
	    XW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,8]
	    XWadj11=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,11]
	    A_RAND_W[1,STP_FN]=Get_Rand_w(STP_FN,xw1+XWadj11)
	  endif

	ENDIF
  endif
  IF  WATER_INPUT=1
    SET  COLO  TO  W+  / &C1
    if dspe_mixamp=1
      @ 17,71 SAY  PWATER  PICT "9999"
    endif
  ENDIF

  &&20171201

  SW1=A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,1]	+ A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,2]
  EWN=CHENDATA(STP_ZN)
  EW1=EWN*A_M_NAME[STP_FN,10]/PER/2048
  W_LOWLEVEL[STP_FN-GS_TOT]=(SW1-ERKG&STP_FC)*2048/A_M_NAME[STP_FN,10]	&& [1 or 2]
  if W_LOWLEVEL[STP_FN-GS_TOT] < 0
    W_LOWLEVEL[STP_FN-GS_TOT] = 0
  endif


  IF RDOK2(STP_ZN)=1
    xFlorTmp=PFLOR&STP_FC
    if	xFlorTmp > ERKG&STP_FC
       xFlorTmp = ERKG&STP_FC
    endif
    IF	EW1  > sw1-xFlorTmp  + 2
      SetDigitOut(1,STP_ZN,0)
	 && IF	EW1  > sw1 + 20
	 &&  SETOKn(STP_ZN,0)
	 && ENDIF
    ENDIF
  enDif


  IF RDOK2(STP_ZN)=0
    *DOUT(STP_ZN,0)
    SetDigitOut(1,STP_ZN,0)
    if waste=1
      SetDigitOut(2,13,0)
    endif

    if	w_lowlevel[stp_fn-gs_tot] >0
      x_ads=HEXTODEC("130")
      x_ads=x_ads +  stp_zn *2
      x_data=rdn_data(x_ads)
      if x_data <> w_lowlevel[stp_fn-gs_tot]
    &&	w_lowlevel[stp_fn-gs_tot] =x_data

      endif
    endif

    STOPTM&STP_FC=0
    EWN=CHENDATA(STP_ZN)
    EW1=EWN*A_M_NAME[STP_FN,10]/PER/2048
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,4] := INT(EW1)
    A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,7] := 1
    XMC_F=A_M_NAME[STP_FN,3]
    *@	8,A_M_NAME[STP_FN,13]  SAY  EW1   PICT "&XMC_F"
    SET COLOR TO &C2 / &C1
    *MTANK_MARK(6,STP_FN,0)
    DSPA_ARROW(STP_FN,0,0)  && EREASE  úD
    SET COLOR TO &C7 +/ &C1
    INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-1)
    EWN=0
    FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP  -1
      EWN=EWN +CHENDATA(XLOOP-1)
      WTANK_F[STP_FN,1] :=1
    NEXT
    DO CASE
    CASE WEIGHT_TYPE[STP_FN]=77 .OR.  WEIGHT_TYPE[STP_FN]=2 .OR. WEIGHT_TYPE[STP_FN]=5 .OR. WEIGHT_TYPE[STP_FN]=9 .OR. WEIGHT_TYPE[STP_FN]=14
      STP_A[STPA_NAME]=4
    OTHERWISE
      SETDLA(A_M_NAME[STP_FN,8] ,EWN)
      STP_A[STPA_NAME]=0
      STP_A[STPA_NAME+1]=2
    ENDCASE
  ENDIF
  TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
  waterlow[STP_FN-GS_TOT]=0
&&CASE STPA_STEP=4  .AND.  (WTANK_F[STP_FN,1]=-99)
CASE STPA_STEP=4
 IF STP_FN=val(water_out_no) .and. (WTANK_F[STP_FN,1]<>-99)


   xwch=val(water_out_no)
   xwaterset=0
   SetDigitOut(2,A_M_NAME[STP_FN,8],0)
   if  (autoin_w <> -1 )
     if   W_LOWLEVEL[xwch-GS_TOT] >0   && [1 or 2]
       xwaterset=1
     elSe
       if   weight_type[STP_FN]=2
	    if	xwch <> STP_FN
	      xwch= STP_FN
	    else
	      xwch= STP_FN -1
	    endif
	    if	 W_LOWLEVEL[xwch-GS_TOT] >0   && [1 or 2]
	      xwaterset=1
	    endif
       endif
     endif
   endif
    if	xwaterset=1
      if  ReChk_WFull(xwch,STP_FN)<0
	wtank_f[stp_fn,1]=-100
	retu
      else
	wtank_f[stp_fn,1]=1
      endif
    endif

  ENDIF






 if  (WTANK_F[STP_FN,1]<>-99)
    return
 endif
  water_off=0
    IF ( DIN(9)=1 )   .OR.  ( DIN(12)=0)
      RETU
    ENDIF
  IF  TIME1[A_M_NAME[STP_FN,8]+1,2] =0
    TIME1[A_M_NAME[STP_FN,8]+1,2] :=SECONDS()
  ENDIF
  IF ABS(SECONDS()-TIME1[A_M_NAME[STP_FN,8]+1,2]) >=TIME1[A_M_NAME[STP_FN,8]+1,1]
    TIME1[A_M_NAME[STP_FN,8]+1,2] :=0
    STP_A[STPA_NAME]=5
  ENDIF
CASE STPA_STEP=5
  SETOKn(STP_ZN,0)
  SetDigitOut(2,A_M_NAME[STP_FN,8],0)
  SetDigitOut(1,STP_ZN,0)
  if weight_type[STP_ZN]=2
    SETOKn(STP_ZN-1,0)
    SetDigitOut(1,STP_ZN-1,0)
  endif
  water_off=0
  *TOTDR1=TOTDR1-1
  INDEX1=GET_DATA2(WEIGHT_TYPE[STP_FN],-2)
  EWN=0
  FOR  XLOOP=STP_FN  TO (STP_FN- INDEX1)  STEP	-1
    WTANK_F[XLOOP,1] :=66  &&¶i®Æ¤¤
    WTANK_F[XLOOP,2] :=0  &&¶i®Æ¤¤
  NEXT
  STP_A[STPA_NAME]=6
  dsp_e=get_dspb(STP_FN,WEIGHT_TYPE[STP_FN])
  IF DSP_E=1
      DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
  ENDIF
    if	(A_PRESS_N0[L_PRESS,1,STP_FN,1]  <> 0) .or.   (WEIGHT_TYPE[STP_FN]=2) .or. (WEIGHT_TYPE[STP_FN]=5) .or. (WEIGHT_TYPE[STP_FN]=9) .or. (WEIGHT_TYPE[STP_FN]=14)
      SET COLOR TO &C11 / &C1
      *@ 11,7  SAY   "úLúPúPúKúPúPúO"
      *DSPB_ARROW(A_M_NAME[STP_FN,8]+1,1,14)  && úD
      xc=alltrim(str(A_M_NAME[STP_FN,8] + 1,2,0))
      *XA=PZER[A_M_NAME[STP_FN,8]+1]
      *XB= A_M_NAME[A_M_NAME[STP_FN,8]+1,6]
      *XB=INT((XA/XB)*PER*2048)
      *SETZER(A_M_NAME[STP_FN,8],XB+2048)
      &&SETZER(A_M_NAME[STP_FN,8],INT(((PZER_W_A[A_M_NAME[STP_FN,8]+1]/A_M_NAME[A_M_NAME[STP_FN,8]+1,6]))*PER*2048)+2048)
      SETZERTM(A_M_NAME[STP_FN,8],PZERTM[A_M_NAME[STP_FN,8]+1])
      SETZEROK(A_M_NAME[STP_FN,8])
      *dout2(A_M_NAME[STP_FN,8],1)
      SetDigitOut(2,A_M_NAME[STP_FN,8],1)
  ENDIF
  SANDCUTW[A_M_NAME[STP_FN,8]+1,2] := 0
CASE STPA_STEP=6
  JMPF=0
  JMPF=JMP_E(STP_FN,WEIGHT_TYPE[STP_FN])
  if (water_off=1)
    JMPF=1
    if water_tot=2
	if STP_FN=GS_TOT +1
	  IF STP_a[gs_tot+2]<>6
	    water_off=0
	  ENDIF
	ELSE
	  IF STP_a[gs_tot+1]<>6
	    water_off=0
	  ENDIF
	ENDIF
    else
      water_off=0
    endif
  endif

  IF JMPF=0
    *TST1_LS2(STP_FN)
    *  IF LS2[STP_FN,2]=1
    *	 RETU
    *  ENDIF
    *  TST0_LS1(STP_FN,STP_FN)
    ELSE
	setZokn(A_M_NAME[STP_FN,8],0)
    ENDIF
  IF  RDZEROK(A_M_NAME[STP_FN,8])=0
     SET COLOR TO &C2 / &C1
     *@ 11,7  SAY   "úLúPúPúPúPúPúO"
     DSPB_FMK(A_M_NAME[STP_FN,8]+1,0)
     SET COLOR TO &C7 +/ &C1
    *dout2(A_M_NAME[STP_FN,8],0)
    SetDigitOut(2,A_M_NAME[STP_FN,8],0)
    INDEX1=GET_DATA2(STP_FN,-1)
    *+++++++++++++++++++++++++++++++++++++++++++++++++
    IF PNT_REMAIN=1
       if  KOT=0  && ¤W¤U«¬¦³«Ý¤æ
	 x_stor=4
       else
	 x_stor=3
       endif

       XREM=GET_REMAINS(STP_FN,STPN&STP_FC,INDEX1,@A_PRESS_N0,x_stor)	&& 4)
       for xstp=gs_tot+water_tot+c_tot+1  to gs_tot+uwc_tot
	 IF PNT_REMAIN=1  .and.  TIME1[xstp,1] =88
	   if KOT=0  && ¤W¤U«¬¦³«Ý¤æ
	     x_stor=4
	   else
	     x_stor=3
	   endif

	   INDEX1=GET_DATA2(xstp,-1)
	   XREM=GET_REMAINS(xstp,STPN&STP_FC,INDEX1,@A_PRESS_N0,x_stor)  &&  4)
	 ENDIF
      next
    ENDIF
    *+++++++++++++++++++++++++++++++++++++++++++++++++
    INDEX1=GET_DATA2(STP_FN,-1)
    STP_A[STPA_NAME]=7
    setdla(A_M_NAME[STP_FN,8],0)
    STPN_OLD=STPN&STP_FC
    FOR XLOOP=stp_fn TO stp_fn-INDEX1  STEP  -1
	XLOOPC=ALLTRIM(STR(XLOOP,2,0))
	XMC_F=A_M_NAME[xloop,3]
	@  A_M_NAME[XLOOP,23],A_M_NAME[XLOOP,13]  SAY  "     " PICT "&XMC_F"
	A_M_NAME[XLOOP,10] := A_M_NAME[XLOOP,9]
	A_M_NAME[XLOOP,12] := A_M_NAME[XLOOP,6]
	CLEACHMEM(XLOOP-1)
	STPN&XLOOPC=STPN&xLOOPC+1
	WTANK_F[xloop,1] :=0
	WTANK_F[xloop,2] :=1
    NEXT
    *+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    X_LAST=CHK_LAST_DROP(0)
    *+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    IF X_LAST=1
       if pnt_remain=1
	  hTOTWACT :=ARRAy(kind)
	  for  xlpa=1  to  kind
	       hTOTWACT[xlpa]=0
	  next
	  if  KOT=0  && ¤W¤U«¬¦³«Ý¤æ
	    x_stor=4
	  else
	    x_stor=3
	  endif

	  && pnt_remains(4,STPN_OLD,A_PRESS_N0,0,1,hTOTWACT)
	  pnt_remains(x_stor,STPN_OLD,A_PRESS_N0,0,1,hTOTWACT)

       endif
    ENDIF
    *IF WASTE=1
    *  CLEACHMEM(GS_TOT+UWC_TOT)
    *ENDIF
  ENDIF
CASE STPA_STEP=7
   xaeok=0
   IF  water_tot=2  .and. WEIGHT_TYPE[stp_fn] =77
     x_index=stp_fn - gs_tot
     IF (TIME1[AE_LAST_CH[x_index],1] =88) .and. AE_LAST_CH[x_index +2]=stp_fn
       IF STP_A[AE_LAST_CH[X_INSEX]] =7  .OR. WEIGHT_TYPE[AE_LAST_CH[I]] =1
	 xaeok=1
       ENDIF
     else
       xaeok=1
     endif
     IF  XAEOK=1   .and. (TIME1[AE_LAST_CH[x_index],1] =88)

       WTANK_F[AE_LAST_CH[X_INDEX],1] :=2
     ENDIF
   else
     XAEOK=CHK_AEOK()
   endif
   IF XAEOK=0
       RETU
   ENDIF
  INDEX1=GET_DATA2(STP_FN,-1)
  STP_A[STPA_NAME]=0
  && FOR XLOOP=stp_fn TO stp_fn-INDEX1	STEP  -1
  &&   WTANK_F[XLOOP,3] :=1
  && NEXT
  IF  (A_PRESS_N0[L_PRESS,STPN&STP_FC,STP_FN,5] <>0)
    STP_A[STPA_NAME-INDEX1]=1
  ELSE
    IF	WATER_INPUT=1
      SET  COLO  TO  W+  / &C1
      if dspe_mixamp=1
	@ 17,71 SAY  "    "
      endif
    ENDIF
    FOR XLOOP=stp_fn TO stp_fn-INDEX1  STEP  -1
      XLOOPC=ALLTRIM(STR(XLOOP,2,0))
      STPN&XLOOPC=1
      WTANK_F[XLOOP,3] :=1
    NEXT
    if kot=1
      SET_LAST_PCS(1,1,0)
    endif
  ENDIF
ENDCASE
RETU
**-----------------------------------------------------------------------------
FUNCTION chk_dnlast
PARAMETERS x_press,x_lpress,X_STPN,x_stpfn,x_cnvstp
retn=0
_x1=x_press[x_lpress,x_stpn+1,x_stpfn,5]
if   (_x1=0)  .and.   x_cnvstp>0
   retn=1
endif
RETU retn

**-----------------------------------------------------------------------------
FUNCTION CHK_AEOK
PARAMETERS  XWEIGHT_TYPE ,XMOD
   XRETU=1
   FOR	I=1  TO  AE_LAST_CH[5]
       IF (TIME1[AE_LAST_CH[I],1] =88)
	   IF  STP_A[AE_LAST_CH[I]] <> 7  .and. WEIGHT_TYPE[AE_LAST_CH[I]] <>1
	     XRETU=0
	     RETU   XRETU
	   ENDIF
       ENDIF
   NEXT
   FOR	I=1  TO  AE_LAST_CH[5]
     IF (TIME1[AE_LAST_CH[I],1] =88)
       WTANK_F[AE_LAST_CH[I],1] :=2
     ENDIF
   NEXT
RETU   XRETU
**-----------------------------------------------------------------------------
FUNCTION  GET_REMAINS
PARAMETERS X_STP_FN,X_STPN,X_LOOP,X_PRESS,X_POS
XN =A_M_NAME[X_STP_FN,8]
XNC=ALLTRIM(STR(XN+1,2))
Xn2=WDATA(XN) -2048
XN2 =XN2*A_M_NAME[xn+1,6]/2048
x_stp_fc=alltrim(str(X_STP_FN,2,0))

xd_wno=fSelectNo()
SELE 5
xn_recno=recno()
GOTO 70
XN3=0
IF EOF()=.F.
 XN3=PA&xnc /1000
ENDIF

x_LAST=gs_tot+uwc_tot-ae_tot
XRET=XN2
XWTOT=0
  FOR X_LOOP1 =X_STP_FN TO X_STP_FN-X_LOOP  STEP -1
    XWTOT=XWTOT+X_PRESS[X_POS,X_STPN,X_LOOP1,1]+X_PRESS[X_POS,X_STPN,X_LOOP1,2]
  NEXT
  FOR X_LOOP1 =X_STP_FN TO X_STP_FN-X_LOOP  STEP -1
    Xw0=(X_PRESS[X_POS,X_STPN,X_LOOP1,1]+X_PRESS[X_POS,X_STPN,X_LOOP1,2])
    IF XN3 >0
       if x_stp_fn > x_last
	  x_amp=100
	  x_div=100
       else
	  x_amp=1
	  x_div=1
       endif
       x_w=get_rand(xw0,xn3,x_amp,x_div,1)

    else
      &&if xwtot>0
      &&  X_w=XN2*xw0/XWTOT
      &&else
      &&   x_w=0
      &&endif
      if xwtot=0   .OR.  XN3=0
	 x_w=0
      else
	X_w=XN2*xw0/XWTOT
      endif






    endif
    X_PRESS[X_POS,X_STPN,X_loop1,12]=x_w
  NEXT
  goto xn_recno
  sele &xd_wno
RETU  XRET
**-----------------------------------------------------------------------------
FUNCTION  CHK_LAST_DROP
PARAMETERS X_STP_FN
XRET=1
FOR  I=GS_TOT+1  TO (GS_TOT +UWC_TOT)
  IF (TIME1[I,1] <>88)
    IF WTANK_F[I,2]<>1
      XRET=0
      EXIT
    ENDIF
  ENDIF
NEXT
RETU  XRET
**-----------------------------------------------------------------------------
FUNCTION  rst_WTANK_F2
PARAMETERS P1
FOR  I=GS_TOT+1  TO (GS_TOT +UWC_TOT)
  IF (TIME1[I,1] <>88)
     WTANK_F[I,2]=0
  ENDIF
NEXT
RETU
**-----------------------------------------------------------------------------
FUNCTION  get_rand     && (100,0.05,100,100,2 )
PARAMETERS x_stdn,x_err,x_a,x_d,X_DIR  && 2:+/- 1:+
if x_stdn=0 .or.   x_err=0
   xret=0
else
  x_err= int(INT(x_stdn  *x_a)	 * x_err)
  RNDX=int(SECONDS()  * RAND())
  xret=INT(MOD(RNDX,(x_err * X_DIR) +1)-(x_err*(X_DIR-1)))/x_d
endif
RETU  XRET
**-----------------------------------------------------------------------------
&& FUNCTION ReChk_WFull
&& PARAMETERS  x_stpfn
&&    XRETU=-1
&&    XSTP_ZN=x_stpfn -1
&&     IF   weight_type[x_stpfn]=77
&&	  IF WATERLOW[X_STPFN-GS_TOT]=0
&&	      X=WDATA(a_m_name[x_stpfn,8])-2048
&&	      XRETU=1
&&	      IF X <W_LOWLEVEL[X_STPFN-GS_TOT]
&&		WATERLOW[X_STPFN-GS_TOT]=1
&&		SET COLOR TO &C10 / &C1
&&		*@ 11,22 SAY   "úZúYúYúYú["
&&		DSPA_ARROW(x_stpfn,1,14)  &&   úD
&&		SETOK(XSTP_ZN)
&&		*DOUT(XSTP_ZN,1)
&&		SetDigitOut(1,XSTP_ZN,1)
&&		SetDigitOut(2,A_M_NAME[x_stpfn,8],0)
&&		XRETU=-1
&&	      ENDIF
&&	  ELSE
&&	     IF RDOK2(XSTP_ZN)=0
&&	       WATERLOW[X_STPFN-GS_TOT]=0
&&	       &&DOUT(XSTP_ZN,0)
&&	       SetDigitOut(1,XSTP_ZN,0)
&&	       SET COLOR TO &C2 / &C1
&&	       *MTANK_MARK(6,x_stpfn,0)
&&	       DSPA_ARROW(x_stpfn,0,0)	&& EREASE  úD
&&	       SET COLOR TO &C7 +/ &C1
&&	       XRETU=1
&&	     ENDIF
&&	  ENDIF
&&     ELSE
&&	 XRETU=1
&&     ENDIF
&& RETU   XRETU
**-----------------------------------------------------------------------------
PROCEDURE  SetCout2	 &&SetCout2(STP_FC,1)
PARAMETERS  XSTP_FC,xout
  sele 8
  use
  USE PAR1
  GOTO 24
  IF VAL(PA1)=77
     chn=VAL(PA&XSTP_FC) && 0-15=do1,16-31=do2
     IF chn>4
       if (chn >= 16)
	    chn=chn-16
	    dout2(chn,xout)
	 else
	    dout(chn,xout)
	 endif
     ENDIF
  ENDIF
  sele 8
  use
  USE  MLDSP
RETU
**-----------------------------------------------------------------------------
FUNCTION ReChk_WFull
PARAMETERS  x_wchadj,x_stpfn
   static chkook_t :=-1
   XRETU=-1
   xwadj_ZN=x_wchadj-1
    if	(autoin_w <> -1 )  .and.  (weight_type[x_stpfn]=77  .or.  weight_type[x_stpfn]=2)

      && x_STP_FC=ALLTRIM(STR(x_stpfn,2,0))
      && xFlorTmp=PFLOR&X_STP_FC
      && if  xFlorTmp > ERKG&X_STP_FC
      &&   xFlorTmp = ERKG&X_STP_FC
      && endif
      && xFlorTmp=1
      && xFlorN=xFlorTmp*2048/A_M_NAME[X_STPFN,10]

       IF WATERLOW[x_stpfn-GS_TOT]=0
	   X=WDATA(a_m_name[x_wchadj,8])-2048
	   XRETU=1
	   IF weight_type[x_stpfn]=77
	       W_LOWLEVEL[2]=0
	   ENDIF




	   IF X <W_LOWLEVEL[1]+W_LOWLEVEL[2]   &&  -xFlorN
	     WATERLOW[X_STPFN-GS_TOT]=1
	     SET COLOR TO &C10 / &C1
	     *@ 11,22 SAY   "úZúYúYúYú["
	     if (val(water_out_no)< x_stpfn )  .OR. (x_wchadj<x_stpfn )
	       xdla=0
	       if W_LOWLEVEL[1]>0
		 if W_LOWLEVEL[2]>0
		   xdla=CHENDATA(x_stpfn-1)
		 endif
		    && x_stpfn = val(water_out_no)
		    && XSTP_ZN=x_stpfn -1
	       endif
	       SETDLA(A_M_NAME[x_stpfn,8] ,xdla)
	     endif

	     DSPA_ARROW(x_wchadj,1,14)	&&   úD

	     && xn=ReadDigitOut(1,x-1)


	     SETOK(xwadj_ZN)
	     *DOUT(XSTP_ZN,1)
	     SetDigitOut(1,xwadj_ZN,1)
	     SetDigitOut(2,A_M_NAME[x_wchadj,8],0)

	     XRETU=-1
	     chkook_t :=-1
	   else
	     SetDigitOut(1,xwadj_ZN,0)
	   ENDIF
       ELSE
	 && if val(water_out_no)< x_stpfn
	 &&  if W_LOWLEVEL[1]>0
	 &&	XSTP_ZN=val(water_out_no) -1
	 &&  endif
	 && endif

	   X=WDATA(a_m_name[x_wchadj,8])-2048
	   IF weight_type[x_stpfn]=77
	       W_LOWLEVEL[2]=0
	   ENDIF

	   IF X >W_LOWLEVEL[1]+W_LOWLEVEL[2]   &&  -xFlorN
	      &&  static chkook_t=seconds()
	      SetDigitOut(1,xwadj_ZN,0)
	      SETOKn(xwadj_ZN,0)
	      if chkook_t  <0
		 chkook_t=seconds()
	      else
		if abs(seconds()-chkook_t)  >0.5
		  SETOKn(xwadj_ZN,0)
		endif
	      endif
	      SetDigitOut(1,xwadj_ZN,0)
	   endif


	   && IF RDOK2(STP_ZN)=1
	   &&	IF  EW1  > sw1-xFlorTmp
	   &&	 SETOKn(STP_ZN,0)
	   &&	ENDIF
	  && endif

	  iF RDOK2(xwadj_ZN)=0
	    WATERLOW[X_STPFN-GS_TOT]=0
	     && DOUT(XSTP_ZN,0)
	     && if val(water_out_no)< x_stpfn
	     &&   if W_LOWLEVEL[X_STPFN-GS_TOT-1]>0
	     &&      x_stpfn = val(water_out_no)
	     &&      XSTP_ZN=x_stpfn -1
	     &&   endif
	     && endif
	    SetDigitOut(1,xwadj_ZN,0)
	    SET COLOR TO &C2 / &C1
	    *MTANK_MARK(6,x_stpfn,0)
	    DSPA_ARROW(x_wchadj,0,0)  && EREASE  úD
	    SET COLOR TO &C7 +/ &C1
	    XRETU=1
	  else
	  && mdy2020/4/15
	    SetDigitOut(1,xwadj_ZN,1)
	  ENDIF
       ENDIF
    ELSE
      XRETU=1
    ENDIF
RETU   XRETU
**-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
&& MDY20190717
&& xtmpd=adjdigit(x_tmpd,a_m_name[STP_FN,3])
FUNCTION  adjdigit  && ¦ì¼Æ­×§ï
PARAMETERS DATA_SRC,DIGITYPE && 12.34,"9999"
  if DATA_SRC >0
    DO	CASE
    CASE  SUBSTR(DIGITYPE,-2,1)="."
      DATA_SRC=INT(DATA_SRC *10 +0.5)
      DATA_SRC=DATA_SRC/ 10
    CASE  SUBSTR(DIGITYPE,-3,1)="."
      DATA_SRC=INT(DATA_SRC *100 +0.5)
      DATA_SRC=DATA_SRC/ 100
    OTHERWISE
      DATA_SRC=INT(DATA_SRC + 0.5)
    ENDCASE
  ENDIF

  XRET=DATA_SRC
RETU  XRET
&&-----------------------------------------------------------------------------
FUNCTION      GetRandW
PARAMETERS  XSTP_F,W_STD
  xdec_a :=ARRAY(3)
  getData_dec(a_m_name[XSTP_F,3],@xdec_a)
  XMC_F=xdec_a[1]
  xerr=STANDW_ERR[XSTP_F]  *xdec_a[3]
  if (xerr=0)
      xerr= int(W_STD	* STANDW2_ERR[XSTP_F] * xdec_a[3])
  endif
  RNDX=int(SECONDS()  * RAND())
  XF_DATA1=- xerr + MOD(RNDX,(xerr * 2) +1)
  XF_DATA1=XF_DATA1/xdec_a[3]
  W_RAND=W_STD+XF_DATA1
RETU  W_RAND
&&-----------------------------------------------------------------------------
FUNCTION  Get_Rand_w
PARAMETERS  XIndex,xw_source,isPlus
  if empty(isPlus)
     isPlus=0
  endif
  wret=xw_source
  if standw2_err[xindex]>0
     if xw_source>0
       &&err_maxw=2* xw_source	* standw2_err[xindex]
       &&XEN=Get_RAND_ERR(w_std,XERR,"999")
       xdeci=a_m_name[xindex,3]
       xerr=standw2_err[xindex]
       wret=Get_RAND_ERR(xw_source,XERR,xdeci,isPlus )
       wret=wret +xw_source
     else
       wret=0
     endif
  endif
RETU	wret
**-----------------------------------------------------------------------------
FUNCTION  WDOOR_CHK
PARAMETERS  XW_NO,CHKPORT
ISOPEN=0
IF CHKPORT=10
   ISOPEN=DIN(A_M_NAME[XW_NO,8])
ENDIF
RETU	ISOPEN
**-----------------------------------------------------------------------------

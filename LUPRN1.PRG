

#INCLUDE "T15_COM.H"
* SAD1 ,SAD2  IS CHANGE  WITH ST1 ,ST2
xTOTWACT :=ARRAy(kind)
for  x_loop1=1	to  kind
     xTOTWACT[x_loop1]=0
next

pnt_std=1
L_PRESS=3
if (lchtype=14	.and.  uchtype=13  .and.  pnt_water=0 )
*   pnt_std=0
endif
SELECT 4
GOTO TOP
DO WHILE  .NOT.  EOF()
  IF COUNT=0  .OR. empty(alltrim(RATNO))=.t. .or.  alltrim(RATNO)="0"
    DELE
  ENDIF
  SKIP
ENDDO
PACK
GOTO TOP
STOR 0 TO TXP1,TXP2,TXP3,TXP4,TXP5,TXP6,TXP7,TXP8,TXP9,TXP10,TXP11,TXP12,TXP13,TXP14,TXP15,TXP16,TOTTXP
PNST=1
LPT1_E=0
LPT2_E=0
   IF  VAL(APORT)=1
     if pnt0_en=1
       LPT1_E=pnt1_ok()
     endif
     IF COM_E=1
       LPT2_E=pnt2_ok()
     ELSE
       LPT2_E=0
     ENDIF
   ELSE
     if pnt0_en=1
       LPT1_E=pnt2_ok()
     endif
     IF COM_E=1
       LPT2_E=pnt1_ok()
     ELSE
       LPT2_E=0
     ENDIF
   ENDIF
DO WHILE .NOT. EOF()
  PCOUNT=0
  XDATE=CDATE
  XHOUR=CHOUR
  XMIN=CMIN
  XSEC=CSEC
  X_STORTIME=fctoTime(XHOUR,XMIN,XSEC)
  XRATNO=RATNO
  xscano=scano
  XCARNO = CARNO
  XXTANDO=TANDO
  XCOUNT=COUNT
  VUSE=COUNT
  TEST=MOD(COUNT,RATVOL)
  IF TEST=0
    XCOUNT=INT(COUNT/RATVOL)
    XVOL1=RATVOL
  ELSE
   XCOUNT=INT(COUNT/RATVOL)+1
   XVOL1=MOD(COUNT,RATVOL)
  ENDIF
  XVOL=RATVOL
  TOTSEC=(XHOUR*3600)+(XMIN*60)+XSEC
  PNST=1
  IF LPT1_E=1
    X_LPT1=pnt1_ok()
    IF	VAL(APORT)=1
      X_LPT1=pnt1_ok()
    ELSE
      X_LPT1=pnt2_ok()
    ENDIF

  ELSE
    X_LPT1=0
  ENDIF
  if	pnt0_en=0
    X_LPT1=0
  endif
  *++++++++++++++++++++++++++++++++++++++++
  get_tite_d1(@_tot_d_a)
  *++++++++++++++++++++++++++++++++++++++++






  *IF  X_LPT1=1
    *SET DEVI TO SCRE
    *SET COLOR TO &C5 +/ &C1
    *clea
    *@ 22,2 SAY "   車次      資料列印中      <車次 = 0  者不列印,列印後資料自動取消> "
    *SET COLOR TO &C7 +/ &C1
    *@ 22,10  SAY CARNO  PICT "9999"

    *++++++++++++++++++++++++++++++++++++++++
    PNT_TITa_p(Xdate,@_tot_d_a)
  *ENDIF
  SELECT 2
  XRATNO=FSUBSTR(XRATNO,Len_ratno_dbf," ",0)
  LOCA FOR ALLTRIM(XRATNO)==ALLTRIM(RATNO)
  PNST=1

  IF .NOT. EOF()
    X_mixsec=MIXSEC
    IF X_MIXSEC <10
      X_mixsec=PMIXTM
    ENDIF




    NO=1
    IF AUTOR =0
      DO MP1_A WITH  L_PRESS
    ELSE
      DO MP1_B	 WITH L_PRESS
    ENDIF
    DO RAND_W_INC
    DO	ADJWATER
    SELECT 2
    STOR 0 TO TXP1,TXP2,TXP3,TXP4,TXP5,TXP6,TXP7,TXP8,TXP9,TXP10,TXP11,TXP12,TXP13,TXP14,TXP15,TXP16,TOTTXP
    XA_STPN=1
    X_STORTIME=FSUBSTR(XHOUR,-2,"0",-2) +":" + FSUBSTR(XMIN,-2,"0",-2) +":" + FSUBSTR(XSEC,-2,"0",-2)
    XA_TOTS=(XHOUR * 3600) +(XMIN*60) +XSEC
    xTOTWACT :=ARRAy(kind)
    for  x_loop1=1  to	kind
	 xTOTWACT[x_loop1]=0
    next

    DO WHILE (A_PRESS_N0[l_press,xa_stpn,1,5]>0)
       *x_w=get_rand(xw0,xn3,x_amp,x_div,2)
       *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       xw1=cAL_W(XA_STPN,@A_PRESS_N0,L_PRESS)
       tottxp=tottxp +xw1
       pnt_produce(XA_STPN,X_STORTIME,X_MIXSEC,A_PRESS_N0,0)
	XSAVE=0
	IF   ((USAVE="Y") .OR. (USAVE="y"))
	  SAVE_produce1(XA_STPN,X_STORTIME,X_MIXSEC,A_PRESS_N0,_TOT_D_A,XDATE)
	  XSAVE=1
	ENDIF
       *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

       IF PNT_REMAIN=1
	 pnt_remains(l_press,xa_stpn,A_PRESS_N0,0,XSAVE,xTOTWACT)
	 xmixtm =get_rand(pmixt_plus ,1,1,1,1)
	 xmixtm =xmixtm +pmixtm
	 Pnt_MixTime(PNT_MIXT,PMIXT_PLUS,xMIXTM,0,0)
       else
	 pnt_lastw(l_press,xa_stpn,A_PRESS_N0,0,XSAVE,xTOTWACT)
       endif
	 xA_SEC =get_rand(pmixt_plus ,1,1,1,1)
       Xa_TOTS=Xa_TOTS+PMIXOP+X_MIXSEC +xA_SEC
       *XHOUR=INT(Xa_TOTS/3600)
       *XMIN=INT(MOD(Xa_TOTS,3600)/60)
       *XMIN=MOD(Xa_TOTS,60)
       *X_STORTIME=FSUBSTR(XHOUR,-2,"0") +":" + FSUBSTR(XMIN,-2,"0") +":" + FSUBSTR(XSEC,-2,"0")
       X_STORTIME=Fntotime(0,0,0,xa_tots)
       XA_STPN=XA_STPN+1
       IF   ((USAVE="Y") .OR. (USAVE="y"))
	 IF  (A_PRESS_N0[l_press,xa_stpn,1,5]=0)
	   *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	   SAVE_SADBF(XA_STPN-1,X_STORTIME,X_MIXSEC,A_PRESS_N0,_TOT_D_A,XDATE,xTOTWACT)
	 ENDIF
       ENDIF
    ENDDO
    USAVE="N"
    SET DEVI TO SCRE
  ELSE
    PNST=0
    SET DEVI TO SCRE
    @ 22,1 SAY "     <<<  配比錯誤             按任一鍵開始    ESC 鍵停止列印 >>>          "
    *  SET CONS ON
    *  ? CHR(7)
    *  ? CHR(7)
    *  ? CHR(7)
    SET CONS OFF
    WAIT
    SET CONS On
    PRLSK=INKEY()
    IF PRLSK=27
      RETU
    ELSE
      SET DEVI TO  PRINT
    ENDIF
  ENDIF
  xpast=1
  IF (RDLPT(val(bport)-1)=144  .AND. PNST=1  .AND. LPT2_E=1)  .or. (xpast=1)
    DO CASE
    CASE (VAL(C_PRT_REP) = 1 )
    CASE (VAL(C_PRT_REP) = 2)  .or.  (VAL(C_PRT_REP) =61) .or.	(VAL(C_PRT_REP) =77)
      SELEC 4
      &&車號		ACARNO
      &&空重		ACARW
      &&配比NO		ARATNO
      &&米數		AVUSE
      &&坍度		ATANDO
      &&客戶NO		AUS2
      &&DRIVER NAME	ACARDRV
      &&累計米數	AUS3=XU
      &&累計車次	ATOT_CAR
      &&客戶名稱	AUS2_1
      &&送貨地址	AUS2_2
      X=_TOT_D_A[20,4]
      IF  X =1
	  _TOT_D_A[20,4] :=2
      ELSE
	  _TOT_D_A[20,4] :=1
      ENDIF
      X=_TOT_D_A[20,4] +2
      _TOT_D_A[1,X] :=XDATE
     *IF  C_MINK=0
     *	_TOT_D_A[1,X] :=XDATE
     *ELSE
     *	_TOT_D_A[1,X] := SUBSTR(STR(YEAR(XDATE)-1911,4,0),3,2)	+"   "+ SUBSTR(DTOC(XDATE),1,2)+"   " +SUBSTR(DTOC(XDATE),4,2)
     *ENDIF


      _TOT_D_A[2,X] :=SCANO
      _TOT_D_A[19,X] :=SCANO
      IF (COM_E=1)
	IF (pnt_mode=3) &&假表
	  _TOT_D_A[4,X]  :=US2_2
	endif
      endif
      _TOT_D_A[3,X]  :=US2_1
      _TOT_D_A[5,X]  :=TOTTXP + CCARW
      _TOT_D_A[6,X]  :=CCARW
      _TOT_D_A[7,X]  :=TOTTXP
      _TOT_D_A[8,X]  :=X_STORTIME
      _TOT_D_A[9,X]  :=LAG_CAR
      _TOT_D_A[10,X] :=COUNT
      _TOT_D_A[11,X] :=LAG_LAG
      _TOT_D_A[17,X] :=SCANO
      SELE 2
      _TOT_D_A[12,X] :=S_STRO
      _TOT_D_A[14,X] :=S_TANDO
      _TOT_D_A[17,X] :=S_MAX
      SELE 4
      _TOT_D_A[13,X] :=CARNO
      IF TANDO <> 0
	_TOT_D_A[14,X] :=TANDO
      ENDIF
      _TOT_D_A[15,X] :=CCARDRV
      _TOT_D_A[16,X] :=US2
      _TOT_D_A[18,X] :=XRATNO
      if  (LPT2_E=1)
	SET CONS On
	FSetToPrinter(bport)
	DO REP_&C_PRT_REP
	*FSetToPrinter(aport)
     endif
	SET DEVI TO SCRE
    ENDCASE
  endif
  SELEC 4
  DELET
  SKIP
  STOR 0 TO TXP1,TXP2,TXP3,TXP4,TXP5,TXP6,TXP7,TXP8,txp11
   PWDSPN=SECONDS()
   waits=SECONDS()
   t=1
   while  t=1
     if     abs(seconds() -waits) > 10
       t=0
     endif
     GG=INKEY()
     IF  GG=27
	T=0
     ENDIF
     iF  (WATER_INPUT=0) .AND. (SECONDS()- PWDSPN > 0.5)
       @ 1,11 SAY  PWATER  PICT "9999"
       @ 1,18 SAY  SCANO  PICT "XXXXXXXXXXXXXX"
       PWATER=INT((WDATA(15)-2048)*WATER_ADJ/2048)
       PWDSPN=SECONDS()
     ENDIF
  ENDDO
  SELECT 4
  *SKIP
ENDDO
L_PRESS=2

	SET DEVI TO SCRE
**-----------------------------------------------------------------------------
PROCEDURE  MP1_A
PARAMETERS  P1,P2,P3
  MX="1"
  MLA_LAG=0
  XSTP=INT((VUSE+RATVOL-0.1)/RATVOL)
  DO WHILE MLA_LAG < VUSE
    IF VAL(MX) < XSTP
      MLA_LAG=MLA_LAG+RATVOL
      SELE 2
      XM_PLUS=0
      FOR XNP=1  TO  kind
	XNPC=LTRIM(STR(INT(XNP),2,0))
	A_PRESS_N0[P1,VAL(MX),XNP,1] :=M&XNPC * RATVOL

	x_tmpd=A_PRESS_N0[P1,VAL(MX),XNP,1]
	xtmpd=adjdigit(x_tmpd,a_m_name[XNP,3])
	A_PRESS_N0[P1,VAL(MX),XNP,1]=xtmpd

	A_PRESS_N0[P1,VAL(MX),XNP,2] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,3] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,5] := RATVOL
	A_PRESS_N0[P1,VAL(MX),XNP,6] := MLA_LAG
      NEXT
      SELE 2
    ELSE
      LVUSE=VUSE -MLA_LAG
      MLA_LAG=VUSE
      XM_PLUS=0
      SELE 2
      FOR XNP=1  TO  kind
	XNPC=LTRIM(STR(INT(XNP),2,0))
	A_PRESS_N0[P1,VAL(MX),XNP,1] :=M&XNPC * LVUSE

	x_tmpd=A_PRESS_N0[P1,VAL(MX),XNP,1]
	xtmpd=adjdigit(x_tmpd,a_m_name[XNP,3])
	A_PRESS_N0[P1,VAL(MX),XNP,1]=xtmpd

	A_PRESS_N0[P1,VAL(MX),XNP,2] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,3] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,5] := LVUSE
	A_PRESS_N0[P1,VAL(MX),XNP,6] := MLA_LAG
	A_PRESS_N0[P1,VAL(MX)+1,XNP,5] :=0
	A_PRESS_N0[P1,VAL(MX)+1,XNP,6] :=0
      NEXT
      SELE 2
    ENDIF
    MX=LTRIM(STR(INT(VAL(MX)+1),2,0))
  ENDDO
  A_PRESS_N0[P1,VAL(MX),1,5] := 0
  A_PRESS_N0[P1,VAL(MX),1,6] := 0
RETU
**-----------------------------------------------------------------------------
PROCEDURE  MP1_B
PARAMETERS  P1,P2,P3
SELE 8
MX=INT((VUSE+0.4)*2)*.5
LOCA FOR (MLAV=RATVOL) .AND.(MLMV=MX)
IF   .NOT. EOF()
  MX="1"
  MLA_LAG=0
  DO WHILE MLA&MX >0
    IF MLMV_1 > MLA_LAG
      X_MLA=MLA&MX
      MLA_LAG=MLA_LAG+X_MLA
      XM_PLUS=0
      SELE 2
      FOR XNP=1  TO  kind
	XNPC=LTRIM(STR(INT(XNP),2,0))
	A_PRESS_N0[p1,VAL(MX),XNP,1] :=M&XNPC * X_MLA

	x_tmpd=A_PRESS_N0[P1,VAL(MX),XNP,1]
	xtmpd=adjdigit(x_tmpd,a_m_name[XNP,3])
	A_PRESS_N0[P1,VAL(MX),XNP,1]=xtmpd

	A_PRESS_N0[P1,VAL(MX),XNP,2] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,3] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,5] := X_MLA
	A_PRESS_N0[P1,VAL(MX),XNP,6] := MLA_LAG
      NEXT
      SELE 8
    ELSE
      LVUSE=VUSE -MLMV_1
      MLA_LAG=MLA_LAG+LVUSE
      XM_PLUS=0
      SELE 2
      FOR XNP=1  TO  kind
	XNPC=LTRIM(STR(INT(XNP),2,0))
	A_PRESS_N0[P1,VAL(MX),XNP,1] :=M&XNPC * LVUSE

	x_tmpd=A_PRESS_N0[P1,VAL(MX),XNP,1]
	xtmpd=adjdigit(x_tmpd,a_m_name[XNP,3])
	A_PRESS_N0[P1,VAL(MX),XNP,1]=xtmpd

	A_PRESS_N0[P1,VAL(MX),XNP,2] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,3] := 0
	A_PRESS_N0[P1,VAL(MX),XNP,5] := LVUSE
	A_PRESS_N0[P1,VAL(MX),XNP,6] := MLA_LAG
	A_PRESS_N0[P1,VAL(MX)+1,XNP,5] :=0
	A_PRESS_N0[P1,VAL(MX)+1,XNP,6] :=0
      NEXT
      SELE 8
    ENDIF
    MX=LTRIM(STR(INT(VAL(MX)+1),2,0))
  ENDDO
  A_PRESS_N0[P1,VAL(MX),1,5] := 0
  A_PRESS_N0[P1,VAL(MX),1,6] := 0
ELSE
  DO MP1_A  WITH P1
ENDIF
RETU
**------------------------------------------------------------------------------------------------------------
PROCEDURE  RAND_W_INC
PARAMETERS  P1,P2,P3
  IF Watr_chg[2]<0
     Watr_chg[2] =get_rand(Watr_chg[1],1,1,1,1)
     FOR X_LOOP=1  TO 6
       WATR_act[X_LOOP]=get_rand(watr_er[X_LOOP]*10,1,1,1,2)
       WATR_act[X_LOOP]=WATR_act[X_LOOP]/10
       WATR_act[X_LOOP]=WATER_INC[X_LOOP]+WATR_act[X_LOOP]
     NEXT
  ENDIF
  Watr_chg[2] =Watr_chg[2]-1

RETU
**------------------------------------------------------------------------------------------------------------
PROCEDURE  ADJWATER
PARAMETERS  P1,P2,P3
*IF WATER_INPUT=1
     FOR XLOOP5=1  TO  20
       IF  INT(A_PRESS_N0[l_press,XLOOP5,1,5]+0.9 ) >0
	 for  x_index=1  to  gs_tot +uwc_tot
	   if x_index <=gs_tot
	     GET_WATER_ADJ(x_index,xloop5,WATER_INPUT,1,0,0,@WATR_ACT)
	   elseif  (x_index >gs_tot ) .and. (x_index <=gs_tot+water_tot)
	     GET_W_ADJ2(x_index,xloop5,WATER_INPUT,1,0,0)
	   else
	      A_PRESS_N0[l_press,XLOOP5,X_INDEX,2]=0
	   endif
	 NEXT
	ELSE
	  RETU
	ENDIF
     NEXT
*ENDIF
RETU
**------------------------------------------------------------------------------------------------------------
FUNCTION    get_tite_d1
PARAMETERS  p_tot_d
xpn=1
p_tot_d[20,4]=xpn
xpn=xpn+2
p_tot_d[2,xpn]=alltrim(scano)
p_tot_d[3,xpn]=alltrim(us2_1)
p_tot_d[12,xpn]=S_STRO
p_tot_d[13,xpn]=alltrim(carno)
p_tot_d[14,xpn]=Tando
p_tot_d[16,xpn]=alltrim(us2)
p_tot_d[18,xpn]=alltrim(ratno)
p_tot_d[22,xpn]=alltrim(P1701)
p_tot_d[6,xpn]=0
 xwn= fSelectNo()
 XRATNO=alltrim(ratno)
 IF  EMPTY(XRATNO)=.F.
   SELECT 2
   LOCA FOR ALLTRIM(XRATNO)==ALLTRIM(RATNO)
   IF EOF()=.F.
     p_tot_d[12,xpn]=S_STRO
   ENDIF
   SELE &XWN
 ENDIF





if (com_e=1) .and.  (xwn=4)
  p_tot_d[4,Xpn]  :=US2_2
 * p_tot_d[4,Xpn]  :=p1702
  p_tot_d[9,Xpn]  :=LAG_CAR
  p_tot_d[11,Xpn] :=LAG_LAG
  p_tot_d[15,Xpn] :=CCARDRV
  if  empty(p_tot_d[13,xpn])=.f.
    X_carno=p_tot_d[13,xpn]
    X_DET=0
    fseek_C(10,"P12100",X_CARNO,"P12103",@X_DET)
    p_tot_d[6,xpn]=X_DET
  ENDIF
endif
*p_tot_d[5,xpn]=p_tot_d[6,xpn]+p_tot_d[7,xpn]
retu
*------------------------------------------------------------------------------------------------------------
FUNCTION  CAL_W
PARAMETERS X_STPN,X_PRESS,X_POS
x_LAST=gs_tot+uwc_tot-ae_tot
xwtot=0


xdec_a :=ARRAY(3)
FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
  getData_dec(a_m_name[X_LOOP1,3],@xdec_a)
    Xw0=(X_PRESS[X_POS,X_STPN,X_LOOP1,1]+X_PRESS[X_POS,X_STPN,X_LOOP1,2])
    XN3=STANDW2_ERR[X_loop1]
    SELE 5
    xnc=alltrim(str(x_loop1,2,0))

    && GOTO 76	 && 77:手動Print report par.67誤差率為 0~0.0xx 2:+/- 0.0xx
    && x_dir=2	&&  +/-
    && if  PA&xnc=77
    &&	 x_dir=1  &&  +方向
    && endif


    GOTO 70   &&殘留0.0xx %

    XN12=0
    IF EOF()=.F.
     XN12=PA&xnc /1000
    ENDIF
       && if x_loop1 > x_last
       &&    x_amp=100
       &&    x_div=100
       && else
       &&    x_amp=1
       &&    x_div=1
       && endif
       x_amp =xdec_a[3]
       x_div=xdec_a[3]

       x_w=get_rand(xw0,xn3,x_amp,x_div,2)
       && x_w=get_rand(xw0,xn3,x_amp,x_div,x_dir)
       x_w=x_w +xw0
       x_w =int(x_w  * x_amp)/x_amp
       X_PRESS[X_POS,X_STPN,X_loop1,4]=x_w
       xret=X_PRESS[X_POS,X_STPN,X_loop1,4]
       xwtot=xwtot +xret
       x_w=get_rand(xw0,xn12,x_amp,x_div,1)
       x_w =int(x_w  * x_amp)/x_amp
       X_PRESS[X_POS,X_STPN,X_loop1,12]=x_w
  NEXT
RETU  Xwtot
**-----------------------------------------------------------------------------
FUNCTION  CAL_W20  &&  DSP->PNT_CARDATA
PARAMETERS X_STPN,X_PRESS,X_POS,Y2_TOTWACT
x_LAST=gs_tot+uwc_tot-ae_tot
XRET=0
XWTOT=0
FOR X_LOOP2=1	TO  GS_TOT  + UWC_TOT
  Y2_TOTWACT[x_loop2]=0
next
  X_PRESS[X_POS,X_STPN,1,5]=TVUSE
  X_PRESS[X_POS,X_STPN,1,6]=LAG_VUSE
  x_seno=lagno1
  FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
    x_c=alltrim(str(x_loop1))
    X_PRESS[X_POS,X_STPN,X_LOOP1,1]=TM&X_C
  NEXT
  skip 1
  if (lagno1 <> x_seno) .or.  (sign<>"2"  )
     *SKIP -1
     *SET_DATAZ1(@X_PRESS,X_POS,X_STPN,2,0)
     *SET_DATAZ1(@X_PRESS,X_POS,X_STPN,4,0)
     *SET_DATAZ1(@X_PRESS,X_POS,X_STPN,12,0)
     *return
  else
     FOR X_LOOP1 =1 TO	 GS_TOT+UWC_TOT
       x_c=alltrim(str(x_loop1))
       X_PRESS[X_POS,X_STPN,X_LOOP1,2]=TM&X_C
       if   pnt_func=0
	 xnw=X_PRESS[X_POS,X_STPN,X_LOOP1,1]
	 X_PRESS[X_POS,X_STPN,X_LOOP1,1]=xnw - TM&X_C
       endif
     NEXT
     skip 1
  endif
  if (lagno1 <> x_seno) .and.  (sign<>"3"  )
     SKIP -1
     SET_DATAZ1(@X_PRESS,X_POS,X_STPN,4,0)
     SET_DATAZ1(@X_PRESS,X_POS,X_STPN,12,0)
     return
  endif
  FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
    x_c=alltrim(str(x_loop1))
    X_PRESS[X_POS,X_STPN,X_LOOP1,4]=TM&X_C
  NEXT
  *skip 1
  *if (lagno1 <> x_seno) .and.	(sign<>"4"  )
  *    SKIP -1
  *    SET_DATAZ1(@X_PRESS,X_POS,X_STPN,12,0)
  *   return
  *endif
  *FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
  *  x_c=alltrim(str(x_loop1))
  *  X_PRESS[X_POS,X_STPN,X_LOOP1,12]=TM&X_C
  *NEXT

  *skip 1
  *if (lagno1 <> x_seno) .or.  (sign<>"5"  )
  *    SKIP -1
  *else
  *   FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
  *	x_c=alltrim(str(x_loop1))
  *	  Y2_TOTWACT[x_loop1]=TM&X_C
  *   NEXT
  *endif
  skip 1
  if (lagno1 <> x_seno)
    X_PRESS[X_POS,X_STPN+1,1,5]=0
    X_PRESS[X_POS,X_STPN+1,1,6]=0
    SET_DATAZ1(@X_PRESS,X_POS+1,X_STPN,12,0)
  else
    X_PRESS[X_POS,X_STPN+1,1,5]=TVUSE
    X_PRESS[X_POS,X_STPN+1,1,6]=LAG_VUSE

  ENDIF
  skip -1
RETU
**------------------------------------------------------------------------------------------------------------
FUNCTION  SET_DATAz1
PARAMETERS  X1_PRESS,X1_POS,X1_STPN,X1_IDX,NX1
     X1_PRESS[X1_POS,X1_STPN+1,1,5]=0
     X1_PRESS[X1_POS,X1_STPN+1,1,6]=0
   FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
     X1_PRESS[X1_POS,X1_STPN,X_LOOP1,X1_IDX]=NX1
   NEXT
RETU
**-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
FUNCTION  CAL_W2  &&  DSP->PNT_CARDATA
PARAMETERS X_STPN,X_PRESS,X_POS,Y2_TOTWACT
x_LAST=gs_tot+uwc_tot-ae_tot
XRET=0
XWTOT=0
FOR X_LOOP2=1	TO  kind
  Y2_TOTWACT[x_loop2]=0
next
  X_PRESS[X_POS,X_STPN,1,5]=TVUSE
  X_PRESS[X_POS,X_STPN,1,6]=LAG_VUSE
  x_seno=lagno1
  FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
    x_c=alltrim(str(x_loop1))
    X_PRESS[X_POS,X_STPN,X_LOOP1,1]=TM&X_C
  NEXT
  skip 1
  if (lagno1 = x_seno)
     if     sign<>"2"
       SKIP -1
       SET_DATAZ1(@X_PRESS,X_POS,X_STPN,2,0)
       SET_DATAZ1(@X_PRESS,X_POS,X_STPN,4,0)
       SET_DATAZ1(@X_PRESS,X_POS,X_STPN,12,0)
     else
       FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
	 x_c=alltrim(str(x_loop1))
	 X_PRESS[X_POS,X_STPN,X_LOOP1,2]=TM&X_C
       NEXT
     endif
  else
     SKIP -1
     return
  endif
  skip 1
  if (lagno1 <> x_seno) && .or.  (sign<>"3"  )
     SKIP -1
     SET_DATAZ1(@X_PRESS,X_POS,X_STPN,4,0)
     SET_DATAZ1(@X_PRESS,X_POS,X_STPN,12,0)
     return
  endif
  FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
    x_c=alltrim(str(x_loop1))
    X_PRESS[X_POS,X_STPN,X_LOOP1,4]=TM&X_C
  NEXT
  skip 1
  if (lagno1 = x_seno)
      if  sign<>"4"
	SKIP -1
	SET_DATAZ1(@X_PRESS,X_POS,X_STPN,12,0)
      else
	FOR X_LOOP1 =1 TO   GS_TOT+UWC_TOT
	  x_c=alltrim(str(x_loop1))
	  X_PRESS[X_POS,X_STPN,X_LOOP1,12]=TM&X_C
	NEXT
      endif
  else
     return
  endif
  skip 1
  if (lagno1 <> x_seno) .or.  (sign<>"5"  )
      SKIP -1
  else
     FOR X_LOOP1 =1 TO	 GS_TOT+UWC_TOT
       x_c=alltrim(str(x_loop1))
	 Y2_TOTWACT[x_loop1]=TM&X_C
     NEXT
  endif
  skip 1
  if (lagno1 <> x_seno)
    X_PRESS[X_POS,X_STPN+1,1,5]=0
    X_PRESS[X_POS,X_STPN+1,1,6]=0
    SET_DATAZ1(@X_PRESS,X_POS+1,X_STPN,12,0)
  else
    X_PRESS[X_POS,X_STPN+1,1,5]=TVUSE
    X_PRESS[X_POS,X_STPN+1,1,6]=LAG_VUSE

  ENDIF
  skip -1
RETU

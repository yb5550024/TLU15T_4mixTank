


#INCLUDE "T15_COM.H"
#INCLUDE "SIO_TXT.CH"
#INCLUDE "\clip52e\INCLUDE\INKEY.CH"
#INCLUDE "\CLIPLIB\KEYBJ.CH"






#ifdef	dfTLU16
  #define  dfRaten_2Page
  #define  dfRatPnt15
#else
#endif


&& #ifdef  dfRaten_2Page
#ifdef	dfRatPnt16
   &&-----------------------------------------------------------------------------
   PROCEDURE  PNT_RATEN
   && PARAMETERS  P1,P2,P3
   && PARAMETERS  KEY_NO,xRET_DNX ,P3
   PARAMETERS  xActNo,KEY_NO,xRET_DNX ,P3
   IF EMPTY(xActNo)=.T.
     xActNo="2"
   ENDIF
     ActNo_N =VAL(xActNo)
   x= RDLPT(val(aport)-1)
   if	  (x= 128 )  .or. (x= 144 ) .or. (x= pnt_redy_code )
     SETETSP(APORT)
     SetPntWx("3")
     @	PROW(),0  SAY  "~L12;"
     @ PROW()+3,3  SAY "日期:"
     @ PROW(),8  SAY DATE()
     *@ PROW()+1,1 SAY "NO.  石１ 石２ 石３ 砂１ 砂２  總重 清水 冰水 水泥1 水泥2 水泥3 藥劑１ 藥劑２"
     *ppp
     &&XTIT="NO.      "
     XTIT=fsubstr("配比代號  ",-ratno_wid," ",0)
     ARR1 :=ARRAY(kind+3)
     ARR2 :=ARRAY(kind+3)
     ARR1[1]="NO.      "
     XN_TITL=0
     ARR2[1]=1
     FOR I=1 TO gs_tot + uwc_tot
       IF EMPTY(A_M_NAME[I,3]) =  .F.
	 ARR1[I+1] = A_M_NAME[I,17]
	 IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
	   ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
	 ENDIF
	 ARR2[I+1]=ARR2[I] + LEN(ARR1[I]) +1
	 IF  I=GS_TOT
	   ARR1[I+1] :=ARR1[I+1] + " 總重 "
	 ENDIF

	 IF  I=GS_TOT  +1
	   ARR2[kind+2]=ARR2[I+1]-7  &&-5
	   *ARR1[I+1] :=" 總重 " + ARR1[I+1]
	   *ARR2[I+1]=ARR2[I+1] +6
	 ENDIF
	 XTIT=XTIT +" " + ARR1[I+1]
       ENDIF
     NEXT
     titlen=len( XTIT)
     @ PROW()+1,1 SAY  XTIT
     @ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------------"
     && SELE 2
     sele &ActNO_N
     REC_OLD=RECNO()
     if F7_ACT=1
       GOTO TOP
     endif
     DO WHILE .NOT. EOF()
       XN_TOTW=0
       XCNR="1"
       @ PROW()+1,1 SAY RATNO  pict "XXXXXXXXXX"
       for i=1	to    gs_tot +uwc_tot
	 XMC_F=A_M_NAME[I,3]
	 xcnr=alltrim(str(I,0))
	 @ PROW(),ARR2[I+1] SAY M&XCNR	PICT  "&XMC_F"
	 XN_TOTW=XN_TOTW + M&XCNR
       next
       @ PROW(),ARR2[kind+2] SAY XN_TOTW  PICT "99999"
       @ PROW()+1,1  SAY "--------------------------------------------------------------------------------------------------"

       *@ PROW(),ARR2[2] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[3] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[4] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[5] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[6] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[7] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *XMC_F=A_M_NAME[7,3]
       *@ PROW(),ARR2[8] SAY M&XCNR  PICT  "&XMC_F"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XMC_F=A_M_NAME[8,3]
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[9] SAY M&XCNR  PICT "&XMC_F"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *XMC_F=A_M_NAME[9,3]
       *@ PROW(),ARR2[10] SAY M&XCNR  PICT "&XMC_F"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *IF EMPTY(ARR2[11]) =.F.
       *  XMC_F=A_M_NAME[10,3]
       *  @ PROW(),ARR2[11] SAY M&XCNR	PICT "&XMC_F"
       *    XN_TOTW=XN_TOTW + M&XCNR
       *endif
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *IF EMPTY(ARR2[12]) =.F.
       *  XMC_F=A_M_NAME[11,3]
       *  @ PROW(),ARR2[12] SAY M&XCNR	PICT "&XMC_F"
       *  XN_TOTW=XN_TOTW + M&XCNR
       *ENDIF
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *IF EMPTY(ARR2[13]) =.F.
       *  XMC_F=A_M_NAME[12,3]
       *  @ PROW(),ARR2[13] SAY M&XCNR	PICT "&XMC_F"
       *  XN_TOTW=XN_TOTW + M&XCNR
       *ENDIF
       *
       *@ PROW(),ARR2[kind+2] SAY XN_TOTW  PICT "99999"
       if F7_ACT=1
	 SKIP
       else
	 exit
       endif
     ENDDO
     *@ PROW()+1,1  SAY "-------------------------------------------------------------------------------"
     *@ PROW()+1,1  SAY "---------------------------------------------------------------------------------------------------
     @ PROW()+1,1  SAY " "
     @ PROW()+1,1  SAY " "
     SET DEVI TO SCRE
     GOTO  REC_OLD
     SET CONS ON
     F7_ACT=0
   ENDIF
   RETU

#endif


#ifdef	dfRaten_2Page



&&----raten_pr-----------------------------------------------------------------
PROCEDURE  RATEN
PARAMETERS  P1,BisDataChg,ActNo,P4
&&RAMETERS  P1,P2,P3
   IF EMPTY(ActNo)=.T.
     ActNo="2"
   ENDIF
     ActNo_N =VAL(ActNo)
dspe_mixamp=0
c_top2=""
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*ARR1 :={" NO. ","石１","石２","石３","砂１","砂２"," 總重 清水","冰水","水泥1","水泥2","水泥3","藥劑１","藥劑２"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)
ARR_PCS :=ARRAY(kind+3)
if ratno_wid <9
  ARR1[1]="配比" +  space(ratno_wid-4)

else
  ARR1[1]="配比代號" +space(ratno_wid-7)

endif
ARR1[1]=ARR1[1] + " 總重 "
ARR1[gs_tot +uwc_tot+ 2]="乾拌秒數"
&&ARR1[gs_tot +uwc_tot+ 2]=""

XN_TITL=0
FOR I=1 TO  gs_tot +uwc_tot
  IF EMPTY(A_M_NAME[I,17]) <> .T.
    XN_TITL=XN_TITL+1
  ENDIF
  ARR1[I+1] :=A_M_NAME[I,17]
  IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
    ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
  ENDIF
     *IF  I=GS_TOT  +1
     *	ARR1[I+1] :="總重 " + ARR1[I+1]
     *ENDIF
NEXT
&& ARR2 :={"RATNO","M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11","M12","M13","M14","M15"}
ARR2[1] :="RATNO"
ARR2[gs_tot +uwc_tot+2] :="MIXSEC"
xcx=""
for _xcnt=1   to  ratno_wid
xcx=xcx+"!"
next
&&ARR3 :={xcx,"9999","9999","9999","9999","9999","9999","999","999","999","999","999","999",,"99.99","99.99","99.99"}
ARR3[1] :=XCX
ARR3[gs_tot +uwc_tot+ 2] :="99"
ARR_PCS[1] :="dSP_TOTW"
FOR I=1 TO  gs_tot +uwc_tot
  ARR2[I+1] :="M" + ALLTRIM(STR(I))
  ARR3[I+1] :=A_M_NAME[I,3]
  ARR_PCS[I+1] :="dSP_TOTW"
NEXT

SELE 5
USE
USE PAR1
FOR I=1 TO GS_TOT +UWC_TOT
  IX_C=ALLTRIM(STR(I,2,0))
  GOTO 20
  ARR3[I+1] :=ALLTRIM(PA&IX_C)
NEXT
USE
USE PAR

*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,2,2}
ARR4[gs_tot +uwc_tot+ 2]=0
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,3]) <> .T.
    XX_DE:=A_M_NAME[I,3]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I+1] :=0
    ELSE
      ARR4[I+1] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
    &&TW_DSPX=2
    &&FOR I=1  TO  GS_TOT +1
    &&	TW_DSPX=TW_DSPX + 1 + LEN(ARR1[I])
    &&NEXT
TW_DSPX= LEN(ARR1[1])-5

&& ARR_PCS :={"dSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW" }
RET_X1=SPACE(4)
C_TOP1="F7-列印 F8-列印本筆 "
F7_FUNC="PNT_RATEN"
C_TOP2=""
F8_FUNC="PNT_RATEN"
F9_FUNC="PNT_RATEN"
if SECR[2]=1
  F3_FUNC="GET_SECRE"
C_TOP1="F7-列印 F8-列印本筆 F3-"
ENDIF
xd_wno=fSelectNo()
//sele 2

IF EMPTY(ActNo)=.T.
    ActNo="2"
ENDIF
    ActNo_N =VAL(ActNo)
   sele &ActNO_N


goto top
if  BOF()
  APPE BLANK
  ENDIF
n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13
P_FUNC0="dsp_totw"
DLA_DSP=0
xposn=3
&&if  kind >=14
if  kind >=13
  xposn=0
endif
IF  STAR=0
  IF SECR[2]=0
    &&_GET_BROW(3,xposn,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
    &&_GET_BROW(3,xposn,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
    _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"P",.T.,.T.,@BisDataChg)
  ELSE
    &&_GET_BROW(3,xposn,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
    _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"N",.T.,.T.,@BisDataChg)
  ENDIF
ELSE
  DLA_DSP=1
  IF SECR[2]=0
    _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"Y",.T.,.T.,@BisDataChg)
  ELSE
    _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"N",.T.,.T.,@BisDataChg)
  ENDIF
ENDIF
DLA_DSP=1
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13
STOR " "  TO C_TOP1,F3_FUNC,F7_FUNC,F8_FUNC
SET COLOR TO &C7 +/ &C1
dspe_mixamp=1
sele &xd_wno
retu
&&-----------------------------------------------------------------------------

#endif

#ifdef	dfRaten_2Page


   &&---------------------------------------------------------------------------------------------------
   FUNCTION _GET_BROW
   PARAMETERS  Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,Nb_SELE,_MODI,MDYPAGE,DELREC,isDataChg
   IF _MODI="Y"
     STOR 0 TO FIST_REC,LAST_REC
   ENDIF
   item_max=0
   item_ofsa=0
   _DATA_MODIFY =0
   X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+YL_N,79)
   XCOR=SETCOLOR()
   XXP=LEN(C_TOP2)+1
   IF EMPTY(C_TOP2)=.T.
   XXP=0
   ENDIF
   PUBLIC   ARR_DSPN
   ARR_DSPN=ARRAY(kind +3)
   AFILL(ARR_DSPN,0)
   stor 0 to   sIndexp
   XX=X1_N+XXP +1+LEN(ARR_TITLE[1])
   if f3_run=-1
       ARR_DSPN[1] :=0
   else
       ARR_DSPN[1] :=XX -1-LEN(ARR3[1])
   endif
   X=2
   *XX=X1_N+XXP
   if x1_n >1
     D_C=ALLTRIM(C_TOP2) +" "
   else
     d_c=""
   endif
   D_C=D_C +ARR_TITLE[1]+" "
   DO WHILE  X <=  TIT_N
     *XX=XX+1+LEN(ARR_TITLE[X])
     xp=1
     xspace=" "
     if ( LEN(ARR_TITLE[X]) > len(arr_type[x]))  .and. x <> gs_tot+2
       xp=0
     xspace=""
     endif
     XX=XX+xp+LEN(ARR_TITLE[X])
     *AADD(ARR_DSPN,XX -LEN(ARR3[X])-1)
      ARR_DSPN[x]=XX -LEN(ARR3[X])-1
      if ARR_DSPN[X] + LEN(ARR_TYPE[X]) >79
	 IF ITEM_MAX=0
	    ITEM_MAX=X-1
	    ARR_DSPN[x]= ARR_DSPN[2]
	    XX=ARR_DSPN[x] +xp +LEN(ARR_TITLE[X])
	 ENDIF

      ENDIF
     *X=X+1
     D_C=D_C +ARR_TITLE[X]
     X=X+1
     IF X <= TIT_N
       D_C=D_C +xspace
     ENDIF
   ENDDO
   IF item_max=0
      item_max=TIT_N
   ENDIF
   *ARR_DSPN[gs_tot+uwc_tot+3]=0
   *IF EMPTY(ARR_DSPN[gs_tot+1])=.F.  .AND.  EMPTY(ARR3[gs_tot])=.F.
   *  ARR_DSPN[gs_tot+uwc_tot+2]=ARR_DSPN[gs_tot+1]+LEN(ARR3[gs_tot])+1
   *ENDIF
   *X=1
   *D_C=ALLTRIM(C_TOP2) +" "
   *DO WHILE  X <=  TIT_N
   *  D_C=D_C +ARR_TITLE[X]
   *  X=X+1
   *  IF X <= TIT_N
   *	D_C=D_C +" "
   *  ENDIF
   *ENDDO
   DC_L=LEN(D_C)
   SET DEVI TO SCRE
   X_C2=" Pg-Wown Up上下頁 Enter選擇 "
   IF  (_MODI="Y") .OR. (_MODI="K")
     X_C1="↑↓上下筆 F10-刪除 Esc跳離"
   ELSE
     X_C1="↑↓上下筆 Esc跳離 "
   ENDIF
   IF (FIST_REC<>0).AND. (FIST_REC=LAST_REC)
     X_C1=" ↑↓-修改 Esc跳離 "
     X_C2=""
   ENDIF
   IF ITEM_MAX <> TIT_N
      X_C2= "Ctrl→右頁 Ctrl←左頁"
   ENDIF
   IF EMPTY(C_TOP1)= .F.
     x_c2=c_top1 +x_c2
   ENDIF
   X=LEN(X_C1)
   IF X>DC_L
     XX=INT((X-DC_L)/2)
   ELSE
     XX=0
   ENDIF
   SET COLOR TO GR+ / BL
   *@ Y1_N-1,X1_N-2-XX	CLEA TO Y1_N+YL_N+1,X1_N + DC_L +2 +XX
   @ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+YL_N+1,X1_N + DC_L +1 +XX
   *BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N+1,X1_N + DC_L+XX)
   BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N,X1_N + DC_L+XX)
   SET COLOR TO GR+ / R
   @ Y1_N-1,X1_N  SAY	D_C
   *@ Y1_N+YL_N,X1_N  SAY   SPACE(DC_L)
   IF  DC_L>LEN(X_C1)+LEN(X_C2)+1
     X=LEN(X_C1)+LEN(X_C2)
     *@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C2+" "+X_C1
     @ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2+" "+X_C1
   ELSE
     *@ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C1
     *@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C2
     @ Y1_N+YL_N-1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C1
     @ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2
   ENDIF
   *IF EMPTY(C_TOP1)= .F.
   *  @ Y1_N+YL_N+1,X1_N   SAY	 C_TOP1
   *ENDIF
   SELE &Nb_SELE
   N_YN=Y1_N
   N_REC=1
   *GOTO TOP
   SET COLOR TO W+ / BL
   DO _DSP_ALL
   N_REC=RECNO()
   *N_YN=Y1_N
   *GOTO TOP
   SET COLOR TO B / W+
   _REC_DSP(N_YN,"W+")
   _LOOP_BR=1
   T=0
   DO WHILE _LOOP_BR =1
     IF _MODI="P"
       T=-992
       _MODI="Y"
     ENDIF
     SELE &Nb_SELE
     NS_RECNO=RECNO()
     DO WHILE T=0
       IF T0A <>0
	 T=T0A
	 T0A=0
       ELSE
	 T=INKEY()
       ENDIF
       IF DLA_DSP=1
	 DO DSP2
       ENDIF
       IF T0A=0
	 DO LUSTP
       ENDIF
     ENDDO
     SELE &Nb_SELE
     GOTO NS_RECNO
     DO CASE
     CASE T=K_CTRL_RIGHT  .OR. T=K_CTRL_LEFT
       IF ITEM_MAX <> TIT_N
	 SET COLOR TO GR+ / R
	  if item_ofsa=0
	     item_ofsa=item_max
	     @ Y1_N-1,ARR_DSPN[2]  SAY	 SPACE(80-ARR_DSPN[2])
	     FOR XLOOP3=ITEM_MAX +1 TO TIT_N
	       @ Y1_N-1,ARR_DSPN[XLOOP3]  SAY	ARR_TITLE[XLOOP3]
	     NEXT
	  else
	     item_ofsa=0
	     @ Y1_N-1,X1_N  SAY   D_C
	  endif
       endif
       xN_REC=RECNO()
       xN_YN=N_YN
       SKIP -(N_YN-Y1_N)
       IF BOF()
	 GOTO TOP
       ENDIF
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       N_REC=XN_REC
       N_YN=XN_YN
       GOTO N_REC
       _REC_DSP(N_YN,"W+")
       TNSTP=1
       T=-992
     CASE T=K_F1
       IF  EMPTY(F3_FUNC) =.F.
	 DO &F1_FUNC
       ENDIF
       T=0
     CASE T=K_F3
       IF  EMPTY(F3_FUNC) =.F.
	 DO &F3_FUNC
       ENDIF
       T=0
     CASE T=K_F7
       F7_ACT=1
       IF  EMPTY(F7_FUNC) =.F.
	 F7_ACT=1
	 DO &F7_FUNC with  Nb_SELE
       ENDIF
       T=0
     CASE T=K_F8
       IF  EMPTY(F8_FUNC) =.F.
	 DO &F8_FUNC with  Nb_SELE
       ENDIF
       T=0
     CASE T=K_DEL
       isDataChg=1
       IF  EMPTY(DEL_FUNC) =.F.
	 DO &DEL_FUNC
       ENDIF
       T=0
     CASE T=-992   .AND. (_MODI="Y"  .OR.    _MODI="K"  .OR.    _MODI="1"  )
       &&TNSTP=READ_AN(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
       _GET_STP=1
       DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
	  R_C=ARR_REC_NAME[_GET_STP]
	  T_C=ARR_TYPE[_GET_STP]
	  _D_TYPE=TYPE("&R_C")
	  C_L=LEN(ARR_TYPE[_GET_STP])
	  SET COLOR TO	&12 /&11
	  IF VALTYPE(&R_C)="N"  .AND. &R_C -INT(&R_C) >0
	    *@ N_YN,ARR_DSPN[_GET_STP]	SAY SUBSTR(LTRIM(STR(&R_C,10,2))+SPACE(10) ,1,LEN(T_C))
	    @ N_YN,ARR_DSPN[_GET_STP]  SAY SUBSTR(LTRIM(STR(&R_C))+SPACE(10) ,1,LEN(T_C))
	  ELSE
	    @ N_YN,ARR_DSPN[_GET_STP]  SAY &R_C   PICT "&T_C"
	  ENDIF
	  GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
	  p_func=P_FUNC&GET_STPC
	  X_GETSTP=_GET_STP
	  set  colo  to b  /w
	  _REC_DSP(N_YN,"W")
	  xisdatachg=0
	 _GET_STP=READ_AN(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC",@xisdatachg,Nb_SELE)
	 if  xisdatachg=1
	   isDataChg=1
	 endif


	 IF _GET_STP=99

	   _LOOP_BR=0
	 ENDIF
	 IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	   _ACT_PX=UPPER(_ACT_PX)
	 ELSE
	   &&IF  T_C="9" .AND.  (_ACT_PX >INT(VAL(ARR3[X_GETSTP])) )
	   &&  _ACT_PX =INT(VAL(ARR3[X_GETSTP]))
	   &&ENDIF
	 ENDIF
	 T_C=ARR_TYPE[X_GETSTP]
	 @ N_YN,ARR_DSPN[X_GETSTP]   SAY  _ACT_PX  PICT "&T_C"
	 SELE &Nb_SELE
	 REPL  &R_C  WITH _ACT_PX
	 IF  EMPTY(ARR_PCS[X_GETSTP]) =.F.
	   PCS_CF(N_YN,&R_C,X_GETSTP,RECNO())
	 ENDIF
       ENDDO
       set  colo to  gr + /w
       SELE &Nb_SELE
       GOTO NS_RECNO
       _REC_DSP(N_YN,"W")
       _DATA_MODIFY=1
       IF (_GET_STP !=98)
	 if t=13  .and. (tit_n <> item_max)
	   t=K_CTRL_LEFT
	 else
	   T=0
	 endif
       ENDIF
     CASE T=5
       IF  (_MODI <> "1")
	 UP_DSP1()
       ENDIF
       T=-992
     CASE T=24
       IF  (_MODI <> "1")
       IF  _MODI="Y"    .AND. (_MODI <> "1")
	 SKIP
	 IF  EOF()
	   SKIP -1
	   FOR	X =1 TO TIT_N
	     R_C=ARR_REC_NAME[X]
	     IF EMPTY(&R_C)=.F.
	       APPE BLANK
	       EXIT
	     ENDIF
	   NEXT
	   SKIP
	 ENDIF
	 SKIP -1
       ENDIF
       DOWN_DSP1()
       ENDIF
       T=-992
     CASE T=7 .and.  DELREC=.T.
       isDataChg=1
       DELE
       PACK
       IF  EOF()
	 SKIP -1
	 IF  EOF()
	   APPE BLANK
	 ENDIF
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       GOTO N_REC
       _REC_DSP(N_YN,"W+")
       _DATA_MODIFY =1
       T=0
     CASE T=18	 .AND.	MDYPAGE=.T.
       SKIP -(YL_N +(N_YN-Y1_N))
       IF BOF()
	 GOTO TOP
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       GOTO N_REC
       _REC_DSP(N_YN,"W+")
       T=0
     CASE T=3	 .AND.	MDYPAGE=.T.
       SKIP ((Y1_N+YL_N-N_YN))
       IF EOF()
	 GOTO BOTT
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       GOTO N_REC
       SET COLOR TO GR+ / W+
       _REC_DSP(N_YN,"W+")
       T=0
     CASE T=13
       X=1
       DO WHILE  X <=TIT_N
	 R_C=ARR_REC_NAME[X]
	 XK=ALLTRIM(STR(X,2,0))
	 RET_X&XK=&R_C
	 RET_A[X]=&R_C
	 X=X+1
       ENDDO
       _LOOP_BR=0
       T=0
     CASE T=23 .OR. T=27
       _LOOP_BR=0
       T=0
     otherwise
       T=0
     ENDCASE
   ENDDO
   T=0
   SET COLO TO &XCOR
   MODI_PAGE= .T.
   RESTSCREEN(Y1_N-1,0,Y1_N+YL_N,79,X_G_B)
   RETU


#endif

#ifdef	dfRaten_2Page

   &&-----------------------------------------------------------------------------
	FUNCTION READ_AN
   PARAMETERS  RDY1,RDX1,PX,D_TYPE,LONG,N_DASH,TNSTP,C_FUNC,Rischg,Nb_SELE    && Y,X,DATA,DATA_TYPE<C/N>,DATA LONG,小數位數TNSTP
   &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"D_MATE")
   && RETU TNSTP
   static  xp_read
   Rischg =0
   && if typE(item_max)="U"
   &&	 item_max=0
   && ENDIF
   && if typE(item_max)="U"
   &&	 item_ofsa=0
   && ENDIF
   && if empty(item_ofsa)
   &&	 item_max=0
   && endif
   && if empty(item_ofsa)
   &&	 item_ofsa=0
   && endif
   last_key=0
   XPX=pX
   RDX1=RDX1
   SET COLOR TO 0/7+
   DO CASE
   CASE   D_TYPE="N"
     IF ((N_DASH=0 )  .AND. (XPX -INT(XPX) <>0) )
       CHRN=LTRIM(STR(XPX,LONG+3,2))
       XLN1=LEN(CHRN)
       IF XLN1 < LONG
	 CHRN=SUBSTR("       ",1,LONG-XLN1) + CHRN
       ELSE
	 CHRN=SUBSTR(CHRN,1,LONG)
       ENDIF
     ELSE
       *CHRN=STR(XPX,LONG,N_DASH)
       IF XPX -INT(XPX)=0
	 CHRN=ALLTRIM(STR(INT(XPX)))
       ELSE
	 DO CASE
	 CASE  XPX *10 -INT(XPX *10)=0
	   CHRN=ALLTRIM(STR(XPX,10,1))
	 CASE XPX *100 -INT(XPX *100)=0
	   CHRN=ALLTRIM(STR(XPX,10,2))
	 OTHERWISE
	   CHRN=ALLTRIM(STR(XPX))
	 ENDCASE
       ENDIF
       IF LEN(CHRN) < LONG
	 CHRN=SUBSTR(SPACE(10) +CHRN,-LONG,LONG)
       ENDIF
     ENDIF
   CASE   D_TYPE="C"
     CHRN=SUBSTR(XPX,1,LONG)
   CASE   D_TYPE="D"
     CHRN=DTOC(XPX)
     LONG=10
   ENDCASE
   SET COLOR TO 0 + /7
   @ RDY1,RDX1	SAY CHRN
   xp_read=0
   t=0
   SET COLOR TO W+  / R
   @ RDY1,(RDX1+xp_read)  SAY SUBSTR(CHRN,xp_read+1,1)
   SET COLOR TO 7/0
   XX1=RDX1+xp_read
   YY1=RDY1
   T1=0
   TN1=0
   DO WHILE T1<>233
     T=0
     SELE &LUDBF
     DO WHILE  T=0
       IF (T0A <>0) .AND. (DSP_SCALL=1) .AND. (LUSTP_EN=1)
	 T=T0A
	 T0A=0
       ELSE
	 T=INKEY()
       ENDIF
       IF (DLA_DSP=1)  .AND.  (DSP_SCALL=1)
	 DO DSP2
       ENDIF
       IF (T0A=0   ) .AND. (LUSTP_EN=1)
	  DO LUSTP
       ENDIF
     ENDDO
     SELE &LUDBF
     _LASTKEY=T
     last_key=t
     DO CASE
     CASE T=K_F5
       IF  EMPTY(F5_FUNC) =.F.
	 F5_ACT=1
	 IF F5_FUNC <>"0"
	   DO &F5_FUNC
	 ELSE
	   T1=233
	   TNSTP=99
	 ENDIF
	 F5_ACT=0
       ENDIF
     CASE T=K_F7
       IF  EMPTY(F7_FUNC) =.F.
	 F7_ACT=1
	 IF F7_FUNC <>"0"
	   DO &F7_FUNC with  Nb_SELE,K_F7
	 ELSE
	   T1=233
	   TNSTP=99
	 ENDIF
	 F7_ACT=0
       ENDIF
     CASE T=K_F8
       IF  EMPTY(F8_FUNC) =.F.
	 F7_ACT=0
	 IF F8_FUNC <>"0"
	   DO &F8_FUNC with  Nb_SELE,K_F8
	 ELSE
	   T1=233
	   TNSTP=99
	 ENDIF
       ENDIF
     && CASE T=K_F9
     &&   IF  EMPTY(F9_FUNC) =.F.
     &&     F7_ACT=0
     &&     IF F9_FUNC <>"0"
     &&       RET_DNX ={0,0,0} && {T1,TNSTP,T}
     &&       DO &F9_FUNC  with  Nb_SELE,K_F9,@RET_DNX
     &&       && T1=233
     &&       && TNSTP=99
     &&       && IF RET_DNX[3] <>0
     &&       &&   T=RET_DNX[3]
     &&       &&   TNSTP=98
     &&       && ENDIF
     &&     ELSE
     &&       T1=233
     &&       TNSTP=99
     &&     ENDIF
     &&   ENDIF
     &&

     CASE  T=K_F1 .AND. ( C_FUNC <> " ")
       DO &C_FUNC
       T=0
       xp_read=0
       SET COLOR TO 0/7 +
       @ RDY1,RDX1  SAY CHRN
       SET COLOR TO &C1 +/ 7 +
       @ RDY1,RDX1  SAY CHRN
       SET COLOR TO W+	/ R
       @ RDY1,(RDX1+xp_read)  SAY SUBSTR(CHRN,xp_read+1,1)
     case  T=K_DEL
	 Rischg=1
	 DO CASE
	 CASE  D_TYPE <> "D"
	   CHRN=SUBSTR(CHRN,1,xp_read) +SUBSTR(CHRN,xp_read+2,LONG-xp_read-1) + " "
	 ENDCASE
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
      CASE T=-9 .and. _modi="YY"
	Rischg=1
	SELE &N_SELE
	DELE
	PACK
	GOTO N_REC
	IF  EOF()
	  SKIP -1
	  N_YN=N_YN  -1
	  IF N_YN < Y1_N
	    N_YN=Y1_N
	  ENDIF
	ENDIF
	IF  BOF()
	  GOTO 1
	  N_YN=Y1_N
	ENDIF
	IF  EOF()
	  APPE BLANK
	  N_YN=Y1_N
	ENDIF
	N_YNO=N_YN
	N_REC=RECNO()
	N_RECO=N_REC
	SKIP - (N_YN -Y1_N  )
	SET COLOR TO W+ / BL
	DO _DSP_ALL
	SET COLOR TO b / W+
	N_REC=N_RECO
	GOTO N_REC
	N_YN=N_YNO
	_REC_DSP(N_YN,"W+")
	N_REC=N_RECO
	N_YN=N_YNO
	GOTO N_REC
	_DATA_MODIFY =1
	&&TNSTP=1
	&&T1=233
	&&xp_read=1
	R_CB=ARR_REC_NAME[tnstp]
	xPX = &R_CB
	DO CASE
	CASE   D_TYPE="N"
	  CHRN=STR(XPX,LONG,N_DASH)
	CASE   D_TYPE="C"
	  CHRN=SUBSTR(XPX,1,LONG)
	CASE   D_TYPE="D"
	  CHRN=DTOC(XPX)
	  LONG=10
	ENDCASE
	px=chrn
	T=0
	rdy1=n_yn
     case  T=K_LEFT
       IF xp_read>=1
	 xp_read=xp_read-1
	 DO CASE
	 CASE  D_TYPE="D"
	   IF xp_read=2 .OR.  xp_read=5
	     xp_read=xp_read-1
	   ENDIF
	 ENDCASE
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ENDIF
     CASE  T=K_RIGHT
       IF xp_read<=LONG-2
	 xp_read=xp_read+1
	 DO CASE
	 CASE  D_TYPE="D"
	   IF xp_read=2 .OR.  xp_read=5
	     xp_read=xp_read+1
	   ENDIF
	 ENDCASE
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO &C1 +/ 7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ENDIF
     CASE   T>=32
	Rischg=1
       xp_read=xp_read+1
       IF TN1=0 .AND. xp_read=1
	 TN1=1
	 DO CASE
	 CASE  D_TYPE <> "D"
	   CHRN=SPACE(LONG)
	 ENDCASE
       ENDIF
       IF xp_read<LONG
	 CHRN=SUBSTR(CHRN,1,xp_read-1)+CHR(T)+SUBSTR(CHRN,xp_read+1,LONG-xp_read)
	 DO CASE
	 CASE  D_TYPE="D"
	   IF xp_read=2 .OR.  xp_read=5
	     xp_read=xp_read+1
	   ENDIF
	 ENDCASE
	 SET COLOR TO 0/7  +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO 7/0
	 *CURSER0(XX1,YY1)
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ELSE
	 CHRN=SUBSTR(CHRN,1,xp_read-1)+CHR(T)
	 SET COLOR TO 0/7+
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO 7/0
	 xp_read=xp_read-1
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 *CURSER2(RDX1,RDY1,xp_read)
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ENDIF
     CASE T=13	 .OR. T=23 .OR. T=5 .OR. T=24.or. t=2 .OR. T=3 .OR. T=18  .OR. T=K_CTRL_RIGHT  .OR. T=K_CTRL_LEFT
       IF  T=28 .AND. ( C_FUNC <> " ")
	 DO &C_FUNC
	 T=13
       ENDIF
       T1=233
       DO CASE
       CASE   D_TYPE="N"
	 xPX=VAL(CHRN)
       CASE   D_TYPE="C"
	 XPX=CHRN
       CASE   D_TYPE="D"
	 XPX=CTOD(CHRN)
       ENDCASE

       PX=XPX
       SET COLOR TO 0/7+
       @  RDY1,RDX1  SAY  CHRN
       *SELE 5
       *CHNO=LTRIM(STR(TNSTP))
       *REPL PA&CHNO WITH PX
       DO CASE
       CASE T=5
	 IF TNSTP=1
	   T1=233
	   TNSTP=99
	 ENDIF
	 IF TNSTP>1
	   if tnstp=item_max +1
	     TNSTP=1
	   else
	     TNSTP=TNSTP-1
	   endif
	   LAST_PRESS=5
	 ENDIF
       CASE T=3
	 T1=233
	   TNSTP=98
       CASE T=18
	 T1=233
	   TNSTP=98
       CASE T=24
	 T1=233
	 TNSTP=98
       CASE T=13
	 if item_ofsa=0
	   TNSTP=TNSTP+1
	   if tnstp >item_max
	     TNSTP=tit_n+1
	   endif
	 else
	   if tnstp=1
	     TNSTP=item_max+1
	   else
	     TNSTP=TNSTP+1
	   endif
	 endif
       CASE T=K_CTRL_RIGHT  .OR. T=K_CTRL_LEFT
	 T1=233
	 TNSTP=98
       ENDCASE
       IF T=23
	 TNSTP=99
       ENDIF
     CASE T=27
       SET COLOR TO 0/7 +
       @ RDY1,RDX1  SAY  CHRN
       XPX=PX
       DO CASE
       CASE   D_TYPE="N"
	 XPX=VAL(CHRN)
       CASE   D_TYPE="C"
	 XPX=CHRN
       CASE   D_TYPE="D"
	 XPX=CTOD(CHRN)
       ENDCASE
       PX=XPX
       SET COLOR TO 7/0
       xp_read=0
       t=0
       XX1=RDX1+xp_read
       YY1=RDY1
       T1=233
       TNSTP=99
     ENDCASE
   ENDDO
   _act_px=PX
   RETU   TNSTP


#endif

#ifdef	dfRaten_2Page
   **-----------------------------------------------------------------------------
   FUNCTION   _REC_DSP
   PARAMETERS  YD_N,XBCOR
   xLOP3=1
   show_last=ITEM_MAX
   *DO WHILE  xLOP3 <=TIT_N
   IF  F3_RUN=-1   .OR.  F3_RUN=-18
      IF MIXSEC >0
	IF XBCOR="W"
	 && SET COLOR TO GR  / W
	ELSE
	 && SET COLOR TO GR  / B
	ENDIF


	 && XCOLOR=SETCOLOR()
	 && IF "W" $ SUBSTR(XCOLOR,-2,2)
	 &&   SET COLOR TO GR  / W
	 && ELSE
	 && ENDIF
      ENDIF
   ENDIF
   DO WHILE  xLOP3 <=show_last
     R_CB=ARR_REC_NAME[xLOP3]
     T_CB=ARR_TYPE[xLOP3]
     _XN1=&R_CB
     IF (VALTYPE(_XN1)="N")
       xdec=fget_dec(t_cb)
       IF F3_RUN=-29
	  IF XDEC=0
	     XTMP3=ABS(_XN1 -INT(_XN1))
	     IF XTMP3 <>0
		XTMP3=ALLTRIM(STR(XTMP3,3,2))
		XDEC=LEN(XTMP3)-2
	     ENDIF
	  ENDIF
       ENDIF
       *@ YD_N,ARR_DSPN[xLOP3]	SAY &R_CB   PICT "&T_CB"
       X_L=LEN(T_CB)
       IF &R_CB -INT(&R_CB) =0
	 X_D=FSUBSTR(INT(&R_CB),-X_L," ",0)
       ELSE
	 IF &R_CB *10  -INT(&R_CB *10) =0
	   X_D=FSUBSTR(&R_CB,-X_L," ",xdec)
	 ELSE
	   X_D=FSUBSTR(&R_CB,-X_L," ",2)
	 ENDIF
       ENDIF
       @ YD_N,ARR_DSPN[xLOP3]  SAY x_d
     ELSEIF (VALTYPE(_XN1)="C")
       X_L=LEN(T_CB)
       *X_D=FSUBSTR(&R_CB,X_L," ",0)
       X_D=SUBSTR(&R_CB,1,X_L)
       @ YD_N,ARR_DSPN[xLOP3]  SAY x_d	 PICT "&T_CB"
     ELSE
       X_L=LEN(T_CB)
       X_D=&R_CB
       @ YD_N,ARR_DSPN[xLOP3]  SAY x_d


     ENDIF
     IF  EMPTY(ARR_PCS[xLOP3]) =.F.
       PCS_CF(YD_N,&R_CB,xLOP3,RECNO())
     ENDIF
     xLOP3=xLOP3+1
     if item_ofsa >0
	if xlop3=2
	   xlop3=item_ofsa +1
	   show_last=TIT_N
	endif
     endif
   ENDDO
   IF  F3_RUN=-1   .OR.  F3_RUN=-18
       SET COLOR TO W+	/ B
   ENDIF
   RETU

   &&-----------------------------------------------------------------------------
   PROCEDURE	_DSP_ALL
   PARAMETERS  P1,P2,P3
   XAL=1
   Y_X=Y1_N
   @ Y1_N,X1_N	CLEA TO Y1_N+YL_N-1,X1_N + DC_L-1
   IF .NOT. BOF()
     DO WHILE  (XAL <=YL_N)  .AND. (.NOT. EOF())
       _REC_DSP(Y_X,"B")
       SKIP
       Y_X=Y_X+1
       XAL=XAL+1
     ENDDO
     SKIP -1
     N_YN=Y_X -1
   ENDIF
   N_REC=RECNO()
   RETU
   &&-----------------------------------------------------------------------------
   FUNCTION   UP_DSP1
   PARAMETERS  X
   SET COLOR TO W+ / BL
   _REC_DSP(N_YN,"BL")
   SKIP -1
   if fist_rec=0
     IF BOF()
       GOTO TOP
     ELSE
       N_YN=N_YN -1
       IF N_YN < Y1_N
	 N_YN=Y1_N
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,-1)
       ENDIF
     ENDIF
   else
     IF recno() < FIST_REC
       SKIP
     ELSE
       N_YN=N_YN -1
       IF N_YN < Y1_N
	 N_YN=Y1_N
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,-1)
       ENDIF
     ENDIF
   endif
   SET COLOR TO bl  / W+
   _REC_DSP(N_YN,"W+")
   N_REC=RECNO()
   RETU
   &&-----------------------------------------------------------------------------
   FUNCTION   DOWN_DSP1
   PARAMETERS  X
   SET COLOR TO W+ / BL
   _REC_DSP(N_YN,"BL")
   SKIP
   IF LAST_REC=0
     IF .NOT. EOF()
       N_YN=N_YN +1
       IF N_YN > Y1_N + YL_N-1
	 N_YN=Y1_N +YL_N-1
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,1)
       ENDIF
     ELSE
       GOTO N_REC
     ENDIF
   ELSE
     IF RECNO()<=LAST_REC
       N_YN=N_YN +1
       IF N_YN > Y1_N + YL_N-1
	 N_YN=Y1_N +YL_N-1
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,1)
       ENDIF
     ELSE
       SKIP -1
     ENDIF
   ENDIF
   SET COLOR TO bl  / W+
   _REC_DSP(N_YN,"W+")
   N_REC=RECNO()
   RETU
   &&-----------------------------------------------------------------------------

#endif


#ifdef	dfRaten_2Page
PROCEDURE  DSP_TOTW
PARAMETERS  P1,P2,P3
c_color=SETCOLOr()
SET COLOR TO GR+ / BL
*@ Y_POSI,33  SAY  (M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) PICT "9999"
XTOT=0
FOR I=1 TO gs_tot + uwc_tot
*FOR I=1 TO ITEM_MAX
  IX_C=ALLTRIM(STR(I,2,0))
  XTOT=XTOT +  M&IX_C
  IF UCHTYPE=16 .AND.  I>=9
    EXIT
  ENDIF
NEXT
*@ Y_POSI,TW_DSPX  SAY XTOT  PICT "9999"
@ Y_POSI,ARR_DSPN[2]-6	SAY XTOT  PICT "9999"
SET COLOR TO &c_color
retu
&&-----------------------------------------------------------------------------
#endif

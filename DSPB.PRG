

FUNCTION   DEL_SaRec
PARAMETERS  YD_N,XD_N
  IF  ENGL=0
    D_C1="出車資料刪除(Y/N) ?"
    D_C2="確定按 Y 鍵"
    D_C3="取消按 N 或 Esc 鍵"
  ELSE
    D_C1="Delete Delivery Sheet(Y/N) ?"
    D_C2="Press Y to Exection"
    D_C3="Press N OR Esc to Exit"
  ENDIF
  dl_ok=0
  DL_OK=OK_ECHO(10,30,D_C1,D_C2,D_C3)
  if  dl_ok=1
     if eof()=.f.
       xd_wno=fSelectNo()
       xd_ludate=ludate
       xd_lagno1=lagno1
       dele
       pack
       sele 1
       dele  for (ludate=xd_ludate)  .and.  (lagno1=xd_lagno1)
       pack
       sele  7
       dele  for (ludate=xd_ludate)  .and.  (lagno1=xd_lagno1)
       pack
       COMMIT
       sele &xd_wno

       SET COLOR TO W+ / BL
       DO _DSP_ALL
       N_REC=RECNO()
       SET COLOR TO GR+ / W+
       _REC_DSP(N_YN)
       _LOOP_BR=1
     endif
  endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION   INS_SaRec
PARAMETERS  YD_N,XD_N
  *IF  ENGL=0
  *  D_C1="出車資料新增(Y/N) ?"
  *  D_C2="確定按 Y 鍵"
  *  D_C3="取消按 N 或 Esc 鍵"
  *ELSE
  *  D_C1="Delete Delivery Sheet(Y/N) ?"
  *  D_C2="Press Y to Exection"
  *  D_C3="Press N OR Esc to Exit"
  *ENDIF
  dl_ok=1
  *DL_OK=OK_ECHO(10,30,D_C1,D_C2,D_C3)
  if  dl_ok=1
     D_YS=1
     D_YE=24
     Xsa_ER=SAVESCREEN(1,0,24,79)
     INSERT_SA(date(),time())
     RESTSCREEN(1,0,24,79,Xsa_ER)
     RESET_SA()
  ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION   Take_SaRec
PARAMETERS  YD_N,XD_N
  xtake_wno=fSelectNo()
  sele 9
  ascano=scano
  ACARNO =CARNO     &&車號	      ACARNO
  ARATNO =RATNO     &&配比NO	      ARATNO
  ASTRO=s_STRO
  AVUSE  =0	 &&米數 	   AVUSE
  ATANDO =TANDO     &&坍度	      ATANDO
  AUS2	 =US2	    &&客戶NO	      AUS2
  ACARDRV=CARDRV    &&DRIVER NAME     ACARDRV
  AUS2_1=US2_1	    &&客戶名稱	      AUS2_1
  A_ADDR_NO=p1701     &&送貨地址NO
  APOSITION =P1701
  sele &xtake_wno
&&-----------------------------------------------------------------------------
FUNCTION   RESET_Sa
PARAMETERS  YD_N,XD_N
   F7_FUNC="PNT_TOTDATA"
   F8_FUNC="PNT_CARDATA"
   DEL_FUNC="DEL_SAREC"
   F3_FUNC="INS_SAREC"
   SELE 7
   DELE FILE  C:\TEST1.DBF
   COPY TO  C:\TEST1   FOR   (LUDATE >= SDATE ) .AND. (LUDATE <= EDATE )
   SELE 9
   USE
   USE	C:\TOT
   ZAP
   commit
   APPE  FROM  C:\TEST1
   DELE FILE  C:\TEST1.DBF
   SORT ON  LUDATE, lutime    TO  TEST1
   ZAP
   APPE  FROM  \TEST1

   SET COLOR TO W+ / BL
   goto  top
   DO _DSP_ALL
   N_REC=RECNO()
   SET COLOR TO GR+ / W+
   _REC_DSP(N_YN)
   _LOOP_BR=1
   SET COLOR TO W+ / BL

RETU

&&-----------------------------------------------------------------------------
PROCEDURE  RATENB
PARAMETERS  xwaste,P2,P3
c_top2=""
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*ARR1 :={"NO. ","石１","石２","石３","砂１","砂２"," 總重 清水","冰水","水泥1","水泥2","水泥3","藥劑１","藥劑２"}
*pppK	 01234567890123456789012345678901234567890123456789012345678901234567890123456789
ARRTIT0="                                              水泥 水泥水泥水泥 藥劑  藥劑 藥劑 "
ARRTIT1="  NO. 石１ 石２ 砂１ 砂２ 石３ 總重  水1 水2   １   ２　３  ４　 １    ２   ３  "
ARR1 :=ARRAY(kind+4)
ARR2 :=ARRAY(kind+4)
ARR3 :=ARRAY(kind+4)
ARR4 :=ARRAY(kind+4)
ARRWID :={0,5,10,15,20,25,35,40,45,50,54,58,63,69,75,79}
IF LCHTYPE=77
   ARRTIT0=""
   ARRTIT1=""
   ARRWID [2]=0
ENDIF
ARR1[1]="配比NO."
*ARR1[2]="  強 度  "
*ARR1[3]="拌合時間"
ARR1[2]=" 總重 "
XN_TITL=0
KIND_S=2
FOR I=1 TO gs_tot +uwc_tot
    ARR1[I+KIND_S] :=A_M_NAME[I,17]
    IF EMPTY(A_M_NAME[I,17]) <> .T.
      XN_TITL=XN_TITL+1
    ENDIF
    IF (LEN(ARR1[I+KIND_S]) < LEN(A_M_NAME[I,3]) )
	 ARR1[I+KIND_S]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+KIND_S]))+ARR1[I+KIND_S]
    ENDIF
NEXT
ARR2 :={"RATNO","0","M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11","M12","M13","M14","M15","M16"}
*ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","999","999","999","999","999","99.99","99.99","99.99"}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2,2}
ARR3[1]="!!!!!!!"
*ARR3[2]="!!!!!!!!!!"
*ARR3[3]="999"
ARR3[2]="9999"
ARR4[1]=0
ARR4[2]=0
ARR4[3]=0
ARR4[4]=0
FOR I=1 TO  gs_tot +uwc_tot
  ARR3[I+KIND_S] :=A_M_NAME[I,3]
  if (mod(val(ARR3[I+KIND_S]),1)>0 )
      ARR4[I+KIND_S]=2
  ELSE
      ARR4[I+KIND_S]=0
  ENDIF
NEXT
TW_DSPX=2
FOR I=1  TO  GS_TOT +1
  TW_DSPX=TW_DSPX + 1 + LEN(ARR1[I])
NEXT
ARR_PCS :={"dSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW" }
RET_X1=SPACE(4)
C_TOP1="F7-列印 F8-列印本筆 "
F7_FUNC="PNT_RATEN"
C_TOP2=""
F8_FUNC="PNT_RATEN"
if SECR[2]=1
  F3_FUNC="GET_SECRE"
C_TOP1="F7-列印 F8-列印本筆 F3-"
ENDIF
F1_FUNC=" "
F10_FUNC=" "
xd_wno=fSelectNo()
sele 2
goto top
if  BOF()
  APPE BLANK
  ENDIF
n_rec=recno()
*DO RST_FUNC
P_FUNC0="dspV_totw"
DLA_DSP=0
IF  STAR=0
  IF SECR[2]=0
    *_GET_BROW(4,0,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
    _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
  ELSE
    *_GET_BROW(4,0,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
     _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
    *_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+2,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",0)
  ENDIF
ELSE
  DLA_DSP=1
  IF SECR[2]=0
    *_GET_BROW(14,0,8,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","Y",.T.,.T.)
    _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
  ELSE
    *_GET_BROW(14,0,8,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
     _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
  ENDIF
ENDIF
DLA_DSP=1
DO RST_FUNC


sele &xd_wno
SET COLOR TO &C7 +/ &C1
retu
&&-----------------------------------------------------------------------------
FUNCTION _GET_VBROW
PARAMETERS  Y1_N,X1_N,XW_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI,MDYPAGE,DELREC
YL_N=INT(80/XW_N) -1
IF _MODI="Y"
  STOR 0 TO FIST_REC,LAST_REC
ENDIF
_DATA_MODIFY =0
X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+TIT_N+1,79)
XCOR=SETCOLOR()
XXP=LEN(C_TOP2)+1
IF EMPTY(C_TOP2)=.T.
  XXP=0
ENDIF
ARR_DSPN=ARRAY(1)
XX=X1_N+XXP +1+LEN(ARR_TITLE[1])
ARR_DSPN[1] :=XX -1-LEN(ARR3[1])
X=2
*XX=X1_N+XXP
D_C=ALLTRIM(C_TOP2) +" "
D_C=D_C +ARR_TITLE[1]+" "
DO WHILE  X <=	TIT_N
  *XX=XX+1+LEN(ARR_TITLE[X])
  xp=1
  xspace=" "
  if ( LEN(ARR_TITLE[X]) > len(arr_type[x]))  .and. x <> gs_tot+2
    xp=0
  xspace=""
  endif
  XX=XX+xp+LEN(ARR_TITLE[X])
  AADD(ARR_DSPN,XX -LEN(ARR3[X])-1)
  *X=X+1
  D_C=D_C +ARR_TITLE[X]
  X=X+1
  IF X <= TIT_N
    D_C=D_C +xspace
  ENDIF
ENDDO
*X=1
*D_C=ALLTRIM(C_TOP2) +" "
*DO WHILE  X <=  TIT_N
*  D_C=D_C +ARR_TITLE[X]
*  X=X+1
*  IF X <= TIT_N
*    D_C=D_C +" "
*  ENDIF
*ENDDO
DC_L=LEN(D_C)
SET DEVI TO SCRE
X_C2=" Pg-Wown Up上下頁 Enter選擇 "
IF  (_MODI="Y") .OR. (_MODI="K")
  X_C1="↑↓上下筆 F10-刪除 Esc跳離"
ELSE
  X_C1="↑↓上下筆          Esc跳離 "
ENDIF
IF (FIST_REC<>0).AND. (FIST_REC=LAST_REC)
  X_C1=" ↑↓-修改  Esc跳離 "
  X_C2=""
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
@ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+TIT_N+1,X1_N + DC_L +2 +XX
BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+TIT_N+1,X1_N + DC_L+XX)
SET COLOR TO GR+ / R

FOR  X =1 TO   TIT_N
  XBLK=""
  BLKN=xw_n-1-LEN(ARR_TITLE[X])
  IF BLKN>0
     XBLK=SUBSTR("        ",1,BLKN)
  ENDIF
  @ Y1_N+X-1,X1_N  SAY	XBLK +	ARR_TITLE[X]
NEXT
*@ Y1_N-1,X1_N	SAY   D_C
*@ Y1_N+YL_N,X1_N  SAY	 SPACE(DC_L)
IF  DC_L>LEN(X_C1)+LEN(X_C2)+1
  X=LEN(X_C1)+LEN(X_C2)
  @ Y1_N+TIT_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2+" "+X_C1
ELSE
  @ Y1_N+TIT_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY	 X_C1
  @ Y1_N+TIT_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2
ENDIF
IF EMPTY(C_TOP1)= .F.
  @ Y1_N+TIT_N+1,X1_N	SAY   C_TOP1
ENDIF
SELE &N_SELE
N_YN=Y1_N
N_COL=1
N_REC=1
*GOTO TOP
SET COLOR TO W+ / BL
DO _DSPV_ALL
N_REC=RECNO()
*N_YN=Y1_N
*GOTO TOP
SET COLOR TO GR+ / W+
*_REC_DSP(N_YN)
MDY_X=X1_N+XW_N
_REC_DSPV(Y1_N,MDY_X)
_LOOP_BR=1
T=0
DO WHILE _LOOP_BR =1
  IF _MODI="P"   && only modify data start
    T=-992
    _MODI="Y"
  ENDIF
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
  SELE &N_SELE
  DO CASE
  CASE T=K_F3
    IF	EMPTY(F3_FUNC) =.F.
      DO &F3_FUNC
    ENDIF
    T=0
  CASE T=K_F7
    F7_ACT=1
    IF	EMPTY(F7_FUNC) =.F.
      F7_ACT=1
      DO &F7_FUNC
    ENDIF
    T=0
  CASE T=K_F8
    IF	EMPTY(F8_FUNC) =.F.
      DO &F8_FUNC
    ENDIF
    T=0
  CASE T=-992	.AND. (_MODI="Y"  .OR.    _MODI="K"  .OR.    _MODI="1"  )
    &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
    _GET_STP=1
    DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
       R_C=ARR_REC_NAME[_GET_STP]
       T_C=ARR_TYPE[_GET_STP]
       _D_TYPE=TYPE("&R_C")
       C_L=LEN(ARR_TYPE[_GET_STP])
       SET COLOR TO  &12 /&11
       xplus0=XW_N -len(T_C)
       @ N_YN+_GET_STP-1,X1_N +N_COL*XW_N+xplus0  SAY &R_C   PICT "&T_C"
       GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
       *p_func=P_FUNC&GET_STPC
       p_func=" "
       X_GETSTP=_GET_STP
       set  colo  to gr + /w
       _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
      *_GET_STP=READ_A(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC")
      LAST_PRESS=0
      _GET_STP=READ_A(N_YN+_GET_STP-1,X1_N+N_COL*XW_N+xplus0,&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC")
      IF _GET_STP=99
	_LOOP_BR=0
      ENDIF
      IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	_ACT_PX=UPPER(_ACT_PX)
      ELSE
	IF  T_C="9" .AND.  (_ACT_PX >INT(VAL(ARR3[X_GETSTP])) )
	  _ACT_PX =INT(VAL(ARR3[X_GETSTP]))
	ENDIF
      ENDIF
      T_C=ARR_TYPE[X_GETSTP]
      *IF _GET_STP <20
      *  @ N_YN+_GET_STP-1,X1_N+N_COL*XW_N+xplus0   SAY  _ACT_PX  PICT "&T_C"
      *ENDIF
      SELE &N_SELE
      IF SUBSTR(T_C,1,1)<>"9"
	  _ACT_PX=ALLTRIM(_ACT_PX)
      ENDIF
      REPL  &R_C  WITH _ACT_PX
      IF  (EMPTY(ARR_PCS[X_GETSTP]) =.F.)  .AND.  (_GET_STP<20)
	PCSV_CF(N_YN+1,X1_N+(N_COL*XW_N)+(xw_n-4),&R_C,_GET_STP,RECNO())
      ENDIF
      IF   (_GET_STP<20)
	IF ARR_REC_NAME[_GET_STP] ="0"
	    IF LAST_PRESS=5
	      _GET_STP =_GET_STP-1
	    ELSE
	      _GET_STP =_GET_STP+1
	    ENDIF
	ENDIF
      ENDIF
    ENDDO
    set  colo to  gr + /w
    *_REC_DSP(N_YN)
     _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    _DATA_MODIFY=1
    IF (_GET_STP !=98)
      T=0
    ENDIF
  CASE T=5
    IF	(_MODI <> "1")
      UPV_DSP1(-1,xw_n)
    ENDIF
    T=-992
  CASE T=24
    IF	(_MODI <> "1")
      UPV_DSP1(1,xw_n)
    ENDIF
    T=-992
  CASE T=7 .and.  DELREC=.T.
    DELE
    PACK
    IF	EOF()
      SKIP -1
      IF  EOF()
	APPE BLANK
      ENDIF
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    SET COLOR TO W+ / BL
    DO _DSPV_ALL
    SET COLOR TO GR+ / W+
    GOTO N_REC
    *_REC_DSP(N_YN)
    * _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    _DATA_MODIFY =1
    T=0
  CASE T=18   .AND.  MDYPAGE=.T.
    SKIP -(YL_N +(N_YN-Y1_N))
    IF BOF()
      GOTO TOP
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    n_col=1
    SET COLOR TO W+ / BL
    DO _DSPV_ALL
    SET COLOR TO GR+ / W+
    GOTO N_REC
   * _REC_DSP(N_YN)
    _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    T=0
  CASE T=3    .AND.  MDYPAGE=.T.
    SKIP ((Y1_N+YL_N-N_YN))
    IF EOF()
      GOTO BOTT
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    n_col=1
    SET COLOR TO W+ / BL
    DO _DSPV_ALL
    GOTO N_REC
    SET COLOR TO GR+ / W+
    *_REC_DSP(N_YN)
     _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
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
RESTSCREEN(Y1_N-1,0,Y1_N+YL_N+1,79,X_G_B)
RETU

**-----------------------------------------------------------------------------
PROCEDURE  SETPARN1
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
ARR1 :={"NO. ","PA1 ","PA2 ","PA3 ","PA4 ","PA5 ","PA6 ","PA7 ","PA8 ","PA9 ","PA10   ","PA11   ","PA12   "}
ARR2 :={"PARNO","PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
ARR3 :={"99","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX"}
ARR4 :={0,0,0,0,0,0,0,0,0,0,2,2,2}
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
xd_wno=fSelectNo()
sele 5
SELE  PAR1
goto top
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
DO RST_FUNC
P_FUNC2="FIND_1102"
DLA_DSP=0
_GET_BROW(1,3,18,13,ARR1,ARR2,ARR3,"_DMAKE1","5","Y",.T.,.F.)
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
sele 5
SELE  PAR
sele &xd_wno
retu

PROCEDURE  DSPTT
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" 日期 "," 米數 ","  石１","  石２","  石３","  砂１","  砂２","  清水","  冰水","水泥１","水泥２","水泥３","藥劑１","藥劑２"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)

ARR1[1]=" 日期 "
ARR1[2]=" 米數 "
FOR I=1 TO kind
  ARR1[I+2] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
NEXT
*ARR2 :={"LUDATE","TOTVUSE","TOTM1","TOTM2","TOTM3","TOTM4","TOTM5","TOTM6","TOTM7","TOTM8","TOTM9","TOTM10","TOTM11","TOTM12","TOTM13","TOTM14"}
*ARR3 :={"XXXXXXXXXX","999999.9","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999.99","99999.99","99999.99","99999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2}
ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)

ARR2[1]:="LUDATE"
ARR2[2]:="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="9999999.9"
ARR4[1]:=0
ARR4[2]:=0
FOR I=1 TO  gs_tot +uwc_tot
  CI=ALLTRIM(STR(I,2))
  ARR2[I+2] ="TOTM"  +CI
  if (mod(val(ARR3[I+1]),1)>0 )
      ARR3[I+2]="999999.99"
      ARR4[I+2] =2
  ELSE
      ARR3[I+2]="999999999"
      ARR4[I+2] =2
  ENDIF
NEXT

sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
XPLUSTIT=2
IF  EMPTY( ARR1[kind ])=.F.
  && XPLUSTIT=0
ENDIF

_DSP_VBROW(4,10,11,gs_tot+uwc_tot+XPLUSTIT ,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",0)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-------------------------------------------------------------------------------------------------------------------------------------------------------------------
**-------------------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTION   _REC_VDSP
PARAMETERS  YD_N
X=1
X_TTW=0
DO WHILE  X <=TIT_N
  R_CB=ARR_REC_NAME[X]
  T_CB=ARR_TYPE[X]
  IF  LSK=1  .AND.  X =2
    @ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[X]-1  SAY &R_CB   PICT "&T_CB"
  ELSE
    @ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[X]  SAY &R_CB	PICT "&T_CB"
  ENDIF
  A_PRINT[X,X_COL] := &R_CB
  X=X+1
ENDDO
  X_W=0
  FOR	XG=1  TO  GS_TOT+UWC_TOT
   c_xg=alltrim(str(xg,2,0))
   x_w=x_w +totm&c_xg
  next
  A_PRINT[TIT_N+1,X_COL] := x_w
  IF  EMPTY(ARR_PCS[1]) =.F.
    PCS_CF(YD_N,&R_CB,1,RECNO())
  ENDIF
RETU
&&-----------------------------------------------------------------------------
PROCEDURE  DSP_TOTWV
PARAMETERS  P1,P2,P3
c_color=SETCOLOr()
SET COLOR TO GR+ / BL
X_W=0
FOR   XG=1  TO	GS_TOT+UWC_TOT
 c_xg=alltrim(str(xg,2,0))
 x_w=x_w +totm&c_xg
next
&&@ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[1]+2  SAY  x_w  PICT "99999999"
@ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[1]-1  SAY  x_w  PICT "99999999.99"
SET COLOR TO &c_color
retu
&&-----------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  DSPTV
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" 日期 "," 配比 "," 米數 ","  石１","  石２","  石３","  砂１","  砂２","  清水","  冰水","水泥１","水泥２","水泥３","藥劑１","藥劑２"}
*pppK
ARR1 :=ARRAY(kind+4)
ARR2 :=ARRAY(kind+4)
ARR3 :=ARRAY(kind+4)
ARR4 :=ARRAY(kind+4)

ARR1[1]=" 日期 "
ARR1[2]=" 配比 "
ARR1[3]=" 米數 "
FOR I=1 TO kind
  ARR1[I+3] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
NEXT
*ARR2 :={"LUDATE","RATNO","TOTVUSE","TOTM1","TOTM2","TOTM3","TOTM4","TOTM5","TOTM6","TOTM7","TOTM8","TOTM9","TOTM10","TOTM11","TOTM12","TOTM13","TOTM14"}
*ARR3 :={"XXXXXXXXXX","99999999","999999.9","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999.99","99999.99","99999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2}
ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
ARR2[1]:="LUDATE"
ARR2[2]:="RATNO"
ARR2[3]:="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="XXXXXXXXX"
ARR3[3]:="9999999.9"
ARR4[1]:=0
ARR4[2]:=0
ARR4[3]:=1
FOR I=1 TO  gs_tot +uwc_tot
  CI=ALLTRIM(STR(I,2))
  ARR2[I+3] ="TOTM"  +CI
  if (mod(val(A_M_NAME[I,3]),1)>0 )
      ARR3[I+3]="999999.99"
      ARR4[I+3] =2
  ELSE
      ARR3[I+3]="999999999"
      ARR4[I+3] =2
  ENDIF
NEXT



sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+3,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",0)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  DSPTTP
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" 日期 "," 米數 ","  石１","  石２","  石３","  砂１","  砂２","  清水","  冰水","水泥１","水泥２","水泥３","藥劑１","藥劑２"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)
ARR1[1]=" 日期 "
ARR1[2]=" 米數 "
FOR I=1 TO kind
  ARR1[I+2] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
NEXT
*ARR2 :={"LUDATE","TOTVUSE","TOTM1","TOTM2","TOTM3","TOTM4","TOTM5","TOTM6","TOTM7","TOTM8","TOTM9","TOTM10","TOTM11","TOTM12","TOTM13","TOTM14"}
*ARR3 :={"XXXXXXXXXX","999999.9","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999.99","99999.99","99999.99","99999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2}
ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
ARR2[1]:="LUDATE"
ARR2[2]:="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="9999999.9"
ARR4[1]:=0
ARR4[2]:=0
FOR I=1 TO  gs_tot +uwc_tot
  CI=ALLTRIM(STR(I,2))
  ARR2[I+2] ="TOTM"  +CI
  if (mod(val(A_M_NAME[I,3]),1)>0 )
      ARR3[I+2]="999999.99"
      ARR4[I+2] =2
  ELSE
      ARR3[I+2]="999999999"
      ARR4[I+2] =2
  ENDIF
NEXT
sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+2,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",1)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-------------------------------------------------------------------------------------------------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  DSPTVP
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" 日期 "," 配比 "," 米數 ","  石１","  石２","  石３","  砂１","  砂２","  清水","  冰水","水泥１","水泥２","水泥３","藥劑１","藥劑２"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)
ARR1[1]=" 日期 "
ARR1[2]=" 配比 "
ARR1[3]=" 米數 "
ARR2[1] :="LUDATE"
ARR2[2] :="RATNO"
ARR2[3] :="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="XXXXXXXXX"
ARR3[3]:="999999.9"
ARR4[1]:=0
ARR4[2]:=0
ARR4[3]:=0
FOR I=1 TO kind
  IC=ALLTRIM(STR(I,2,0))
  ARR1[I+3] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
  ARR2[I+3] :="TOTM" +IC
  if (mod(val(A_M_NAME[I,3]),1)>0 )
      ARR3[I+3]="999999.99"
      ARR4[I+3] =2
  ELSE
      ARR3[I+3]="999999999"
      ARR4[I+3] =2
  ENDIF
NEXT


ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+3,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",1)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  PNT_RATENA
PARAMETERS  P1,P2,P3
x= RDLPT(val(aport)-1)
if     (x= 128 )  .or. (x= 144 ) .or. (x= pnt_redy_code )
  SETETSP(APORT)
  SetPntWx("7")
  &&@  PROW(),0  SAY  "~L15;"
  @ PROW()+3,3	SAY "日期:"
  @ PROW(),8  SAY DATE()
  *@ PROW()+1,1 SAY "NO.  石１ 石２ 石３ 砂１ 砂２  總重 清水 冰水 水泥1 水泥2 水泥3 藥劑１ 藥劑２"
  *ppp
  XTIT="NO.  "
  ARR1 :=ARRAY(kind+2)
  ARR2 :=ARRAY(kind+2)
  ARR1[1]="NO. "
  XN_TITL=0
  ARR2[1]=1
  FOR I=1 TO gs_tot +uwc_tot
    IF EMPTY(A_M_NAME[I,3]) =  .F.
      ARR1[I+1] = A_M_NAME[I,17]
      IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
	ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
      ENDIF
      ARR2[I+1]=ARR2[I] + LEN(ARR1[I+1]) +1
      IF  I=GS_TOT  +1
	ARR2[kind+1]=ARR2[I+1]
	ARR1[I+1] :=" 總重 " + ARR1[I+1]
	ARR2[I+1]=ARR2[I+1] +6
      ENDIF
      XTIT=XTIT +" " + ARR1[I+1]
    ENDIF
  NEXT

  @ PROW()+1,1 SAY  XTIT
  @ PROW()+1,1	SAY "----------------------------------------------------------------------------------------------"
  xd_wno=fSelectNo()
  SELE 2
  REC_OLD=RECNO()
  if F7_ACT=1
    GOTO TOP
  endif
  DO WHILE .NOT. EOF()
    XN_TOTW=0
    XCNR="1"
    @ PROW()+1,1 SAY RATNO
    @ PROW(),ARR2[2] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[3] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[4] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[5] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[6] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[7] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[7,3]
    @ PROW(),ARR2[8] SAY M&XCNR  PICT  "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    XMC_F=A_M_NAME[8,3]
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[9] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[9,3]
    @ PROW(),ARR2[10] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    IF EMPTY(ARR2[11]) =.F.
      XMC_F=A_M_NAME[10,3]
      @ PROW(),ARR2[11] SAY M&XCNR  PICT "&XMC_F"
	XN_TOTW=XN_TOTW + M&XCNR
    endif
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    IF EMPTY(ARR2[12]) =.F.
      XMC_F=A_M_NAME[11,3]
      @ PROW(),ARR2[12] SAY M&XCNR  PICT "&XMC_F"
      XN_TOTW=XN_TOTW + M&XCNR
    ENDIF
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    IF EMPTY(ARR2[13]) =.F.
      XMC_F=A_M_NAME[12,3]
      @ PROW(),ARR2[13] SAY M&XCNR  PICT "&XMC_F"
      XN_TOTW=XN_TOTW + M&XCNR
    ENDIF

    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[13,3]
    @ PROW(),ARR2[14] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR

    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[14,3]
    @ PROW(),ARR2[15] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR

    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[15,3]
    @ PROW(),ARR2[16] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    @ PROW(),ARR2[kind+1] SAY XN_TOTW  PICT "99999"
    @ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------"
    if F7_ACT=1
      SKIP
    else
      exit
    endif
  ENDDO
  *@ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------"
  @ PROW()+1,1	SAY " "
  @ PROW()+1,1	SAY " "
  SET DEVI TO SCRE
  GOTO	REC_OLD
  SET CONS ON
  F7_ACT=0
  sele &xd_wno
ENDIF
RETU

**-----------------------------------------------------------------------------

PROCEDURE  DSP3
PARAMETERS  RECNO_MDY,C_TOP2,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*C_TOP2="落差修正"
*ARR1 :={"石１","石２","石３","砂１","砂２","清水","冰水","水泥1","水泥2","水泥3","藥劑１","藥劑２"}
ARR1 :=ARRAY(16)
ARR2 :=ARRAY(kind+1)
ARR3 :=ARRAY(kind+1)
ARR4 :=ARRAY(kind+1)
XN_TITL=0
SELE 5
USE
USE PAR1
XN_TITL=0
FOR I=1 TO kind
  IX_C=ALLTRIM(STR(I,2,0))
  IS_LAST=0
    XN_TITL=XN_TITL+1
    GOTO 16
    ARR1[I] :=RTRIM(PA&IX_C)
    ARR2[I] :="PA" + IX_C
    GOTO 17
    ARR3[I] :=ALLTRIM(PA&IX_C)
NEXT
SELE 5
USE
USE PAR
*ARR1 :={"S1","S2","G1","G2","水泥１","水泥２３","藥劑１","藥劑２"}
*ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
*ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,2,2}
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,3]) <> .T.
    XX_DE:=A_M_NAME[I,3]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I] :=0
    ELSE
      ARR4[I] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto RECNO_MDY
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
*DO RST_FUNC
P_FUNC0=" "
DLA_DSP=1
stor  1  to  fist_rec,last_rec
&& _GET_BROW(20,2,1,gs_tot+uwc_tot,ARR1,ARR2,ARR3,"_DMAKE1","5","1",.F.,.F.)
   &&_GET_BROW(20,2,1,gs_tot+uwc_tot,ARR1,ARR2,ARR3,"_DMAKE1","5","P",.F.,.F.)  && DON'T PRESS UP/DN KEY TO ENTER MODI FUNTION
   _GET_BROW(20,2,1,gs_tot+uwc_tot,ARR1,ARR2,ARR3,"_DMAKE1","5","1",.F.,.F.)  && DON'T PRESS UP/DN KEY TO ENTER MODI FUNTION
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
COMMIT
retu
**-----------------------------------------------------------------------------
PROCEDURE  DSP1
PARAMETERS  RECNO_MDY,C_TOP2,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*C_TOP2="零點修正"
ARR1 :={"石123 ","砂１２","清,冰水","水泥１","水泥２３","藥劑１","藥劑２"}
*ppp
*ARR2 :={"PA1","PA4","PA6","PA8","PA9","PA11","PA12"}
*ARR3 :={"9999","9999","9999","9999","9999","999.99","999.99",}
*ARR4 :={0,0,0,0,0,2,2}

ARR1 :=ARRAY(16)
ARR2 :=ARRAY(kind+1)
ARR3 :=ARRAY(kind+1)
ARR4 :=ARRAY(kind+1)
XN_TITL=0
SELE 5
USE
USE PAR1
XN_TITL=0

&&  mdy f6零點存取位置修正
INDEX1=1
FOR I=1 TO KLCHN +KUCHN
  && IX_C=ALLTRIM(STR(INDEX1,2,0))
  IX_C=ALLTRIM(STR(I,2,0))
  ARR2[I] :="PA" + IX_C
  && INDEX1=WSCALE_type[I] +INDEX1
NEXT


FOR I=1 TO kind
  IX_C=ALLTRIM(STR(I,2,0))
  IS_LAST=0
  DO CASE
  CASE	I<kind
    IF (A_M_NAME[I,8]<>A_M_NAME[I+1,8] )
      IS_LAST=1
    ENDIF
  OTHERWISE
      IS_LAST=1
  ENDCASE
  IF IS_LAST=1
    XN_TITL=XN_TITL+1
    GOTO 16
    ARR1[XN_TITL] :=RTRIM(PA&IX_C)
    &&ARR2[XN_TITL] :="PA" + IX_C
    GOTO 17
    ARR3[XN_TITL] :=ALLTRIM(PA&IX_C)
  ENDIF
NEXT
SELE 5
USE
USE PAR
*ARR1 :={"S1","S2","G1","G2","水泥１","水泥２３","藥劑１","藥劑２"}
*ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
*ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,2,2}
FOR I=1 TO XN_TITL
  IF EMPTY(ARR3[I]) <> .T.
    XX_DE:=ARR3[I]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I] :=0
    ELSE
      ARR4[I] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO RECNO_MDY
n_rec=recno()
*DO RST_FUNC
P_FUNC0=" "
DLA_DSP=1
stor  2  to  fist_rec,last_rec
_GET_BROW(20,3,1,klchn+kuchn,ARR1,ARR2,ARR3,"_DMAKE1","5","P",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
COMMIT
retu
**-----------------------------------------------------------------------------
PROCEDURE  W_IN   && 含水率 ADJ.
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2="含水率修正 ％"
*ARR1 :={"石１ ","石２ ","砂１ ","砂２ "}
ARR1 :=ARRAY(kind)
ARR2 :=ARRAY(kind)
ARR3 :=ARRAY(kind)
ARR4 :=ARRAY(kind)
XN_TITL=GS_TOT
FOR I=1 TO GS_TOT
  ARR1[I] :=rtrim(A_M_NAME[I,1])
  IF (LEN(ARR1[I]) < LEN(A_M_NAME[I,3]) )
    ARR1[I]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I]))+ARR1[I]
  ENDIF
NEXT
*ARR2 :={"PA1","PA2","PA3","PA4"}
FOR I=1 TO GS_TOT
  T_C=ALLTRIM(STR(I,2,0))
  ARR2[I] :="PA" + T_C
NEXT
*ARR3 :={"99.9","99.9","99.9","99.9"}
FOR I=1 TO GS_TOT
  ARR3[I] :="99.9"
NEXT
*ARR4 :={1,1,1,1}
FOR I=1 TO GS_TOT
  ARR4[I] :=1
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
xrec=33
GOTO 33
if pa14=42
  GOTO 42
  xrec=42
endif
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=1
stor  xrec to  fist_rec,last_rec
*_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","K")
_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","P",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-----------------------------------------------------------------------------
PROCEDURE  DSP4
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" 小入料 "
*ARR1 :={"石１","石２","石３","砂１","砂２"," 清水","冰水","水泥１","水泥２","水泥３","藥劑１","藥劑２"}
*pppK
ARR1 :=ARRAY(17)
XN_TITL=0
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,1]) <> .T.
    XN_TITL=XN_TITL+1
  ENDIF
  ARR1[I] :=A_M_NAME[I,1]
  IF (LEN(ARR1[I]) < LEN(A_M_NAME[I,3]) )
    ARR1[I]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I]))+ARR1[I]
  ENDIF
NEXT
ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12","PA13","PA14"}
ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99","999.99",}
FOR I=1 TO kind
  ARR3[I] :=A_M_NAME[I,3]
NEXT
ARR4 :={0,0,0,0,0,0,0,0,0,0,0,2,2,2}
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,3]) <> .T.
    XX_DE:=A_M_NAME[I,3]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I] :=0
    ELSE
      ARR4[I] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 3
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
stor  3  to  fist_rec,last_rec
_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","K",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
sele 5
goto 3
ERKG1=PA1
ERKG2=PA2
ERKG3=PA3
ERKG4=PA4
ERKG5=PA5
ERKG6=PA6
ERKG7=PA7
ERKG8=PA8
ERKG9 =PA9
ERKG10=PA10
ERKG11=PA11
ERKG12=PA12
ERKG13=PA13
ERKG14=PA14
retu


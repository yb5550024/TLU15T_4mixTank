


&&-----------------------------------------------------------------------------

FUNCTION _GET_BROW
PARAMETERS  Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI  &&
_DATA_MODIFY =0
X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+YL_N+1,79)
XCOR=SETCOLOR()
ARR_DSPN :={X1_N}
X=1
XX=X1_N
DO WHILE  X <=	TIT_N -1
  XX=XX+1+LEN(ARR_TITLE[X])
  AADD(ARR_DSPN,XX)
  X=X+1
ENDDO
X=1
D_C=""
DO WHILE  X <=	TIT_N
  D_C=D_C +ARR_TITLE[X]
  X=X+1
  IF X <= TIT_N
    D_C=D_C +" "
  ENDIF
ENDDO
DC_L=LEN(D_C)
SET DEVI TO SCRE
IF  _MODI="Y"
  X_C1="↑↓上下筆 F3-修改  Esc跳離 "
ELSE
  X_C1="↑↓上下筆          Esc跳離 "
ENDIF
X_C2=" Pg-Wown Up上下頁 Enter選擇 "
X=LEN(X_C1)
IF X>DC_L
  XX=INT((X-DC_L)/2)
ELSE
  XX=0
ENDIF
SET COLOR TO GR+ / BL
@ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+YL_N+1,X1_N + DC_L +2 +XX
BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N+1,X1_N + DC_L+2+XX)
SET COLOR TO GR+ / R
@ Y1_N-1,X1_N  SAY   D_C
*@ Y1_N+YL_N,X1_N  SAY	 SPACE(DC_L)
@ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C1
@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY	X_C2
SELE &N_SELE
N_YN=Y1_N
N_REC=1
*GOTO TOP
SET COLOR TO W+ / BL
DO _DSP_ALL
N_REC=RECNO()
*N_YN=Y1_N
*GOTO TOP
SET COLOR TO GR+ / W+
_REC_DSP(N_YN)
_LOOP_BR=1
DO WHILE _LOOP_BR =1
  T=0
  DO WHILE T=0
    T=INKEY()
    IF DLA_DSP=1
      DO DSP2
    ENDIF
    DO LUSTP
  ENDDO
  SELE &N_SELE
  DO CASE
  CASE T=K_F7
    IF	EMPTY(F7_FUNC) =.F.
      DO &F7_FUNC
    ENDIF
  CASE T=K_F8
    IF	EMPTY(F8_FUNC) =.F.
      DO &F8_FUNC
    ENDIF
  CASE T=-2   .AND. _MODI="Y"
    &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
    _GET_STP=1
    DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
       R_C=ARR_REC_NAME[_GET_STP]
       T_C=ARR_TYPE[_GET_STP]
       _D_TYPE=TYPE("&R_C")
       C_L=LEN(ARR_TYPE[_GET_STP])
       SET COLOR TO  &12 /&11
       @ N_YN,ARR_DSPN[_GET_STP]  SAY &R_C   PICT "&T_C"
       GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
       p_func=P_FUNC&GET_STPC
       X_GETSTP=_GET_STP
      _GET_STP=READ_A(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,0,_GET_STP,"&P_FUNC")
      IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	_ACT_PX=UPPER(_ACT_PX)
      ENDIF
      SELE &N_SELE
      REPL  &R_C  WITH _ACT_PX
      IF  EMPTY(ARR_PCS[X_GETSTP]) =.F.
	PCS_CF(N_YN,&R_C,X_GETSTP,RECNO())
      ENDIF
    ENDDO
    _REC_DSP(N_YN)
    T=0
    _DATA_MODIFY=1
  CASE T=5
    UP_DSP1()
  CASE T=24
    IF	_MODI="Y"
      SKIP
      IF  EOF()
	APPE BLANK
      ENDIF
      SKIP -1
    ENDIF
    DOWN_DSP1()
  CASE T=7 .and. _modi="Y"
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
    DO _DSP_ALL
    SET COLOR TO GR+ / W+
    GOTO N_REC
    _REC_DSP(N_YN)
    _DATA_MODIFY =1
  CASE T=18
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
    _REC_DSP(N_YN)
  CASE T=3
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
    _REC_DSP(N_YN)
  CASE T=13
    X=1
    DO WHILE  X <=TIT_N
      R_C=ARR_REC_NAME[X]
      XK=STR(X,1,0)
      RET_X&XK=&R_C
      RET_A[X]=&R_C
      X=X+1
    ENDDO
    _LOOP_BR=0
  CASE T=23 .OR. T=27
    _LOOP_BR=0
  ENDCASE
ENDDO
T=0
SET COLO TO &XCOR
RESTSCREEN(Y1_N-1,0,Y1_N+YL_N+1,79,X_G_B)
RETU
&&-----------------------------------------------------------------------------

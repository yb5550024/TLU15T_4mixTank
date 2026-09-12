
#INCLUDE "t15_com.h"
clea
sele 5
goto 19
PUBLIC _DIGIT_A :=ARRAY(10) && 位數
_DIGIT_A[1] :=9999
_DIGIT_A[2] :=9999
_DIGIT_A[3] :=9999
GOTO 21
PUBLIC _TITLE_A :=ARRAY(10) && TITLE NAME
STOR 0 TO XDATA1,XDATA2,XDATA3,XDATA4,XDATA5,XDATA6,XDATA7,XDATA8,XDATA9,XDATA_A
ADJNO=1
XXTY=1
TT1=0
ADJNO_8=-1  &&稱NO. 0,1,2,3,4,5,6,7,8  XDATA_A 稱AVER
ADJNO_9=0
XFAZ=0
XLOOP3=1
DO WHILE XLOOP3=1
  SET COLOR TO &C2 +/ &C1
  if  engl=0
    @ 0,2 SAY " 日期 :    年    月    日                                                   "
    @ 1,2  SAY "                                                                           "
    @ 2,2 SAY "┌────────────────────────────────────┐"
    @ 3,2  SAY "│                                                                        │"
    @ 4,2  SAY "│                                                                        │"
    @ 5,2 SAY "│                                                                        │"
    @ 6,2 SAY "│             (1)  電腦螢幕磅稱數值歸零                                  │"
    @ 7,2 SAY "│                                                                        │"
    @ 8,2 SAY "│             (2)  磅稱校正(校正磅稱值與電腦顯示值同步)                  │"
    @ 9,2 SAY "│                                                                        │"
    @ 10,2 SAY "│             (3)  磅稱顯示精度修正                                      │"
    @ 11,2 SAY "│                                                                        │"
    @ 12,2 SAY "│             (4)  結束,回上主畫面                                       │"
    @ 13,2 SAY "│                                                                        │"
    @ 14,2 SAY "│                  輸入選擇項號碼                                        │"
    @ 15,2 SAY "│                                                                        │"
    @ 16,2 SAY "│                                                                        │"
    @ 17,2 SAY "│                                                                        │"
    @ 18,2 SAY "│                                                                        │"
    @ 19,2 SAY "│                                                                        │"
    @ 20,2 SAY "│                                                                        │"
    @ 21,2 SAY "└────────────────────────────────────┘"
    @ 0,8  SAY	SUBSTR(DTOC(DATE()),7,4)
    @ 0,17 SAY	SUBSTR(DTOC(DATE()),1,2)
    @ 0,23 SAY	SUBSTR(DTOC(DATE()),4,2)
  else
    @ 0,2 SAY " Date :                     Time :                                          "
    @ 1,2  SAY "                                                                           "
    @ 2,2 SAY "┌────────────────────────────────────┐"
    @ 3,2  SAY "│                                                                        │"
    @ 4,2  SAY "│                                                                        │"
    @ 5,2 SAY "│                                                                        │"
    @ 6,2 SAY "│             (1)  Set Scale Volume  To Zero                             │"
    @ 7,2 SAY "│                                                                        │"
    @ 8,2 SAY "│             (2)  Scale Correction (Sync. With Computer Display)        │"
    @ 9,2 SAY "│                                                                        │"
    @ 10,2 SAY "│             　　　　　　　　　　　　　                                 │"
    @ 11,2 SAY "│                                                                        │"
    @ 12,2 SAY "│             (3)  Exit                                                  │"
    @ 13,2 SAY "│                                                                        │"
    @ 14,2 SAY "│                  Input Select No. １～３                               │"
    @ 15,2 SAY "│                                                                        │"
    @ 16,2 SAY "│                                                                        │"
    @ 17,2 SAY "│                                                                        │"
    @ 18,2 SAY "│                                                                        │"
    @ 19,2 SAY "│                                                                        │"
    @ 20,2 SAY "│                                                                        │"
    @ 21,2 SAY "└────────────────────────────────────┘"
    SET COLOR TO &C7 +/ &C1
    @ 0,8  SAY	DATE()
    @ 0,37 SAY	TIME()
  endif

  SET COLOR TO &C7 +/ &C1
  SET COLOR TO &C6 / &C1
  SET COLOR TO &C2 +/ &C1,w+ /r
  if engl=0
    T2=4
    else
    T2=3
  endif


  SET CURS ON
  @  14,18 GET T2 PICT "9"  RANG 1,4
  READ
  IF  ENGL <>0	.AND. T2 >=3
    T2=4
  ENDIF
  SET CURS OFF
  @ 3,4 CLEA TO  20,76
  DO CASE
  CASE T2=1
    XXTY=1
    if	engl=0
      @ 2,2 SAY  "┌────────────────────────────────────┐"
      @ 3,2  SAY "│                                                                        │"
      @ 4,2  SAY "│                        電腦螢幕磅稱數值歸零                            │"
      @ 5,2 SAY  "├────────────────────────────────────┤"
      @ 6,2 SAY  "│                                                                        │"
      @ 7,2 SAY  "│                             ┌────┐                               │"
      @ 8,2 SAY  "│                     磅稱種類│        │                               │"
      @ 9,2 SAY  "│                             ├────┤          ┌────┐         │"
      @ 10,2 SAY "│                     磅稱現值│        │  設定重量│        │         │"
      @ 11,2 SAY "│                             └────┘          └────┘         │"
      @ 12,2 SAY "│                                                                        │"
      @ 13,2 SAY "│                    磅稱數值歸零操作順序說明:                           │"
      @ 14,2 SAY "│                                                                        │"
      @ 15,2 SAY "│ (1) 按方向鍵 ← → 選擇需要歸零之磅稱種類,如石,沙,水 ... 等。          │"
      @ 16,2 SAY "│ (2) 確認該磅稱上沒有任何原料,如有請清除。                              │"
      @ 17,2 SAY "│ (3) 上述兩項確認正確後 按 [F1] 鍵歸零,重覆 1 ～3 項,其它磅稱歸零。     │"
      @ 18,2 SAY "│                        按 [F2] 鍵設定基準重量值。                      │"
      @ 19,2 SAY "│                        按 [Esc]  鍵結束回上一畫面。                    │"
      @ 20,2 SAY "│                                                                        │"
      @ 21,2 SAY "└────────────────────────────────────┘"
      SET COLOR TO &C6 + / &C1
      @ 15,18 SAY "← →"
      @ 17,32 SAY "F1"
      @ 18,32 SAY "F2"
      @ 19,32 SAY "Esc"
    else
      @ 2,2 SAY "┌────────────────────────────────────┐"
      @ 3,2  SAY "│                                                                        │"
      @ 4,2  SAY "│                        Set Scale Volume  To Zero                       │"
      @ 5,2 SAY "├────────────────────────────────────┤"
      @ 6,2 SAY "│                                                                        │"
      @ 7,2 SAY "│                             ┌───┐                                 │"
      @ 8,2 SAY "│                         Kind│      │                                 │"
      @ 9,2 SAY "│                             ├───┤            ┌────┐         │"
      @ 10,2 SAY "│                             │      │  Set Weight│        │         │"
      @ 11,2 SAY "│                             └───┘            └────┘         │"
      @ 12,2 SAY "│                                                                        │"
      @ 13,2 SAY "│                    Zeroing Operation Procedure:                        │"
      @ 14,2 SAY "│                                                                        │"
      @ 15,2 SAY "│ (1) Press← →Key Select The Aggregate Sush As G，W，AG...With Need    │"
      @ 16,2 SAY "│ (2) Make Sure To Clean It Up If There Is Any Aggr.  Left On Scale Plate│"
      @ 17,2 SAY "│ (3) Press  [F1] Key  To Zeroing, Repeat Step 1 ～3 For Others          │"
      @ 18,2 SAY "│     Press  [Esc] Key To Exit                                           │"
      @ 19,2 SAY "│                                                                        │"
      @ 20,2 SAY "│                                                                        │"
      @ 21,2 SAY "└────────────────────────────────────┘"
      SET COLOR TO &C6 + / &C1
      @ 15,14 SAY "← →"
      @ 17,17 SAY "F1"
      @ 18,17 SAY "Esc"
    endif
    SET COLOR TO &C7 +/ &C1
    DO CHADJ
    TT1_0=1
    DO WHILE TT1_0 =1
      TT1=0
      BANNO_1 =0
      DO WHILE TT1<>27 .AND. TT1<>28 .AND. TT1<>4  .AND. TT1<>19 .AND. TT1<>-1
	TT1=INKEY()
	DO DSPADJ
      ENDDO
      inkey(0.2)
      DO CASE
      CASE TT1=27
	TT1_0 =0
      CASE TT1=28
	DO  SETZADJ
      CASE TT1=-1
	BNO_W=0
	SET CURS ON
	@ 10,57  GET BNO_W  PICT "99999.9"
	READ
	SET CURS off
	if bno_w >0
	  BNO_W= BNO_W +1
	else
	  BNO_W= BNO_W -1
	endif
	IF  ADJNO_8 +1 <> BNODATA4
	  XDATA1=INT (((WDATA(ADJNO_8)-2048)*ADJNO_9)/204.8)/10  - BNO_W
	ELSE
	  XDATA1=INT (((WDATA(ADJNO_8)-2048)*ADJNO_9)/20.48)/100 - BNO_W
	ENDIF
	XDATA2=WDATA(ADJNO_8)-2048  - (BNO_W * 2048 /ADJNO_9 )
	SELE 5
	GOTO 15
	IF ADJNO_8  < KLCHN
	  CCJ=ALLTRIM(STR(INT(ADJNO_8 +1+1)))
	ELSE
	  CCJ=ALLTRIM(STR(INT(ADJNO_8 - KLCHN +5 )))
	ENDIF
	XDATA1 = XDATA1 + PA&CCJ
	XDATA2=( PA&CCJ * 2048 / ADJNO_9 ) + XDATA2
	REPLA PA&CCJ WITH XDATA1
	SETLZA(ADJNO_8,XDATA2)
      CASE TT1= 4  .OR. TT1=19
	@ 10,57  SAY  "       "
	DO CHADJ
      ENDCASE
    ENDDO
  CASE	T2=2
    *t=ser_ok()
    if ( douin=1   .OR.  SECR[3] =1 )
      t=ser_ok_boss()
    else
      t=1
    endif
    if	t <> 1
      exit
    endif
    ADJNO_8=-1
    XXTY=2
    IF ENGL=0
      @ 2,2 SAY  "┌────────────────────────────────────┐"
      @ 3,2  SAY "│                                                                        │"
      @ 4,2  SAY "│               磅稱校正(校正磅稱值與電腦顯示值同步)                     │"
      @ 5,2 SAY  "├────────────────────────────────────┤"
      @ 6,2 SAY  "│                                                                        │"
      @ 7,2 SAY  "│                             ┌────┐                               │"
      @ 8,2 SAY  "│      輸入磅稱值     磅稱種類│        │      磅稱負載比   最大稱重    │"
      @ 9,2 SAY  "│      ┌───┐             ├────┤     ┌───┐  ┌────┐  │"
      @ 10,2 SAY "│      │      │KG 電腦顯示值│        │KG   │      │％│        │KG│"
      @ 11,2 SAY "│      └───┘             └────┘     └───┘  └────┘  │"
      @ 12,2 SAY "│                                                                        │"
      @ 13,2 SAY "│         磅稱校正(校正磅稱值與電腦顯示值同步)操作順序說明:              │"
      @ 14,2 SAY "│                                                                        │"
      @ 15,2 SAY "│ (1) 按方向鍵 ← → 選擇需要校正之磅稱種類,如石,沙,水 ... 等。          │"
      @ 16,2 SAY "│ (2) 確認該磅稱上沒有任何原料,如有請清除。                              │"
      @ 17,2 SAY "│ (3) 將磅稱指針固定於 0 點,按 [F2] 鍵設定 0  點。                       │"
      @ 18,2 SAY "│ (4) 將砝碼放入磅稱上,其總重量約磅稱負載比99.5 ％以上,但不得超過99.9 ％ │"
      @ 19,2 SAY "│ (5) 按 [F3] 鍵設定滿點,輸入校正砝碼重量,重復 1 ～5 項,其它磅稱校正。   │"
      @ 20,2 SAY "│     按 [Esc]  鍵結束回上一畫面。                                       │"
      @ 21,2 SAY "└────────────────────────────────────┘"
      SET COLOR TO &C7 + / &C1
      @ 15,18 SAY "← →"
      @ 17,35 SAY "F2"
      @ 19,13 SAY "F3"
      @ 20,12 SAY "[Esc]  鍵結束回上一畫面"
    ELSE
      @ 2,2 SAY "┌────────────────────────────────────┐"
      @ 3,2  SAY "│                                                                        │"
      @ 4,2  SAY "│           Scale Correction (Sync. With Computer Display)               │"
      @ 5,2 SAY "├────────────────────────────────────┤"
      @ 6,2 SAY "│                                                                        │"
      @ 7,2 SAY "│                             ┌───┐                                 │"
      @ 8,2 SAY "│  Input Scale Volume     Kind│      │       Weight Ratio   Max.Weight │"
      @ 9,2 SAY "│      ┌───┐             ├───┤       ┌───┐    ┌───┐  │"
      @ 10,2 SAY "│      │      │KG           │      │KG     │      │％  │      │KG│"
      @ 11,2 SAY "│      └───┘             └───┘       └───┘    └───┘  │"
      @ 12,2 SAY "│                        Operation Procedure :                           │"
      @ 13,2 SAY "│                                                                        │"
      @ 14,2 SAY "│ (1) Press← →Key,Select The Aggregate Sush As G，W，AG...With Need    │"
      @ 15,2 SAY "│ (2) Make Sure To Clean It Up If There Is Any Aggr.  Left On Scale Plate│"
      @ 16,2 SAY "│ (3) Set Scale To Zero Point(Press [F2] For Zero Setting)               │"
      @ 17,2 SAY "│ (4) Putting The Poise Weight On Scale Plate,The Total Weight Can Be    │"
      @ 18,2 SAY "│     Above 99.5 ％ Of Load Ratio,But Not Allow To Execess 99.9 ％       │"
      @ 19,2 SAY "│ (5) Press [F3] For Setting Maximum Point,Input The Corrected Weight,   │"
      @ 20,2 SAY "│     Repeat 1 ～5 To Correct Rest Scale。[Esc] TO Exit                  │"
      @ 21,2 SAY "└────────────────────────────────────┘"
      SET COLOR TO &C7 + / &C1
      @ 14,14 SAY "← →"
      @ 16,40 SAY "F2"
      @ 19,16 SAY "F3"
      @ 20,45 SAY "[Esc] TO Exit"
    ENDIF
    SET COLOR TO &C7 +/ &C1
    DO CHADJ
    DO CHADJ_1
    TT1_0=1
    DO WHILE TT1_0 =1
      SET COLOR TO &C6 / &C1
      @ 22,0 CLEA TO 24,79
      SET COLOR TO &C7 +/ &C1
      TT1=0
      BANNO_1 =0
      @ 10,12 SAY     "      "
      DO WHILE TT1<>27 .AND. TT1<>-1 .AND. TT1<>4  .AND. TT1<>19
	TT1=INKEY()
	DO DSPADJ
	DO CHADJ_1
      ENDDO
      inkey(0.2)
      DO CASE
      CASE TT1=27
	TT1_0 =0
      CASE TT1=-1
	DO SETZADJ


	SELE 5
	SET COLOR TO &C6 / &C1
	@ 22,0 CLEA TO 24,79
	if  engl=0
	  @ 23,0 SAY "                  0 點已設定,請執行步驟 4  與步驟 5 "
	  @ 24,0 SAY "                  按 [Esc]  鍵結束回上一畫面        "
	else
	  @ 23,0 SAY " Zero Point Already Setting,Execute Step 4 And Step  5 "
	  @ 24,0 SAY " Press [Esc] Key To Exit                               "
	endif
	SET COLOR TO &C7 +/ &C1
	SET CONS ON
	IF XFAZ >= 99.9
	  ? CHR(7)
	  SET COLOR TO &C6 / &C1
	  @ 22,0 CLEA TO 24,79
	  if engl=0
	    @ 23,0 SAY "                  砝碼過重,請減輕重量,修正後按任一鍵繼續"
	  else
	    @ 23,0 SAY "Poise Weight Too Heavy,Press Any Key To  Continue       "
	  endif
	  SET COLOR TO &C7 +/ &C1
	  INKEY(0)
	ENDIF
	SET CONS OFF
	SET COLOR TO &C6 / &C1
	@ 22,0 CLEA TO 24,79
	if engl=0
	  @ 23,0 SAY "                  0 點已設定,請執行步驟 4  與步驟 5 "
	  @ 24,0 SAY "                  按 [Esc]  鍵結束回上一畫面        "
	else
	  @ 23,0 SAY " Zero Point Already Setting,Execute Step 4 And Step  5 "
	  @ 24,0 SAY " Press [Esc] Key To Exit                               "
	endif
	SET COLOR TO &C7 +/ &C1
	TT1=0
	XDATA2=ADJNO_9
	DO WHILE TT1 <>27  .AND. TT1 <> -2
	  TT1=INKEY()
	  DO DSPADJ
	  DO CHADJ_1
	ENDDO
	INKEY(0.2)
	DO CASE
	CASE TT1=27
	  TT1_0 =0
	CASE TT1=-2
	  SET CURS ON
	  x="9"+A_M_NAME[ADJNO,5]
	  @ 10,12 GET	 XDATA2  PICT "&x"
	  READ
	  SET CURS OFF
	  XDATA3=WDATA(ADJNO-1)-2048
	  XDATA4=2048*XDATA2/XDATA3
	  IF  XDATA4=0
	    XDATA4=VAL(A_M_NAME[ADJNO,5])
	  ENDIF
	  A_M_NAME[ADJNO,6] :=XDATA4
	  SELE 5
	  GOTO 12
	  IXC=ALLTRIM(STR(ADJNO,2,0))
	  REPL PA&IXC WITH XDATA4
	  FOR I=1 TO kind
	    IF (A_M_NAME[I,8] +1)=ADJNO
	      A_M_NAME[I,9] :=XDATA4
	      A_M_NAME[I,10] :=XDATA4
	      IXC=ALLTRIM(STR(I,2,0))
	      GOTO 9
	      REPL PA&IXC WITH XDATA4
	    ENDIF
	  NEXT
	ENDCASE
      CASE TT1= 4  .OR. TT1=19
	DO CHADJ
      ENDCASE
    ENDDO
  CASE T2=3 .and. (engl=0)
    ADJNO_8=-1
    SELE 4
    XXTY=3

    @ 2,2 SAY "┌────────────────────────────────────┐"
    @ 3,2  SAY "│                                                                        │"
    @ 4,2  SAY "│                           磅稱顯示精度修正                             │"
    @ 5,2 SAY "├────────────────────────────────────┤"
    @ 6,2 SAY "│                                                                        │"
    @ 7,2 SAY "│                             ┌───┐                                 │"
    @ 8,2 SAY "│      輸入磅稱值     磅稱種類│      │        磅稱負載比               │"
    @ 9,2 SAY "│      ┌───┐             ├───┤       ┌───┐                │"
    @ 10,2 SAY "│      │      │KG 電腦顯示值│      │KG     │      │％              │"
    @ 11,2 SAY "│      └───┘             └───┘       └───┘                │"
    @ 12,2 SAY "│                                                                        │"
    @ 13,2 SAY "│                磅稱顯示精度修正操作順序說明:                           │"
    @ 14,2 SAY "│                                                                        │"
    @ 15,2 SAY "│ (1) 按方向鍵 ← → 選擇需要校正之磅稱種類,如石,沙,水 ... 等。          │"
    @ 16,2 SAY "│ (2) 確認該磅稱上沒有任何原料,如有請清除。                              │"
    @ 17,2 SAY "│ (3) 將磅稱指針固定於 0 點,按 [F2] 鍵設定 0  點。 [F10]設定資料清除     │"
    @ 18,2 SAY "│ (4) 依次將砝碼放入磅稱上,其總重量不可超過磅稱負載比99.9 ％以上         │"
    @ 19,2 SAY "│ (5) 按 [F4] 鍵設定各點重量,輸入校正砝碼重量,重復1 ～5 項,其它磅稱校正。│"
    @ 20,2 SAY "│     按 [Esc]  鍵結束回上一畫面。                                       │"
    @ 21,2 SAY "└────────────────────────────────────┘"
    SET COLOR TO &C7 + / &C1
    @ 15,18 SAY "← →"
    @ 17,35 SAY "F2"
    @ 17,55 SAY "F10"
    @ 19,13 SAY "F4"
    @ 20,12 SAY "[Esc]  鍵結束回上一畫面"
    SET COLOR TO &C7 +/ &C1
    DO CHADJ
    DO CHADJ_1
    sele 4
    TT1_0=1
    DO WHILE TT1_0 =1
      SET COLOR TO &C6 / &C1
      @ 22,0 CLEA TO 24,79
      SET COLOR TO &C7 +/ &C1
      TT1=0
      BANNO_1 =0
      @ 10,12 SAY     "      "
      DO WHILE TT1<>27 .AND. TT1<>-1 .AND. TT1<>4  .AND. TT1<>19  .AND. TT1<>-3 .AND. TT1<>-9
	TT1=INKEY()
	DO DSPADJ_1
	DO CHADJ_1
      ENDDO
      inkey(0.2)
      DO CASE
      CASE TT1=27
	TT1_0 =0
      CASE TT1=-9
	SELE 4
	DELE FOR  (D_T=ADJNO_8 ) .AND.	D_N <> 4096  .AND. D_W <> 0
	PACK
      CASE TT1=-1
	XDATA1=ABSAD( ADJNO_8 )
	SELE 4
	LOCA FOR D_T=ADJNO_8 .AND. D_W=0
	IF  .NOT. EOF()
	  REPL D_N WITH XDATA1
	ELSE
	  APPE BLANK
	  REPL D_T WITH ADJNO_8,D_N WITH XDATA1,D_W WITH 0
	ENDIF
      CASE TT1=-3
	TT1=0
	XDATA2=ADJNO_9

	IF ADJNO_8 +1 <> BNODATA4
	  SET CURS ON
	  x="9999"
	  IF ADJNO_8 +2 = BNODATA4
	    X=INT(LOG(9999/_DIGIT_A[ADJNO_8+1])/LOG(10))
	    X=ALLTRIM(STR(_DIGIT_A[ADJNO_8+1],7,X))
	    X=SUBSTR(X,-4,4)
	  ENDIF
	  @ 10,12 GET	 XDATA2  PICT "9"+ "&X"
	  READ
	  SET CURS OFF
	ELSE
	  SET CURS ON
	  @ 10,12 GET	XDATA2	PICT "99.99"
	  READ
	  SET CURS OFF
	ENDIF
	XDATA3=ABSAD( ADJNO_8 )
	SELE 4
	LOCA FOR D_T=ADJNO_8 .AND. D_W=XDATA2
	IF  .NOT. EOF()
	  REPL D_N WITH XDATA3
	ELSE
	  APPE BLANK
	  REPL D_T WITH ADJNO_8,D_N WITH XDATA3,D_W WITH XDATA2
	ENDIF
      CASE TT1= 4  .OR. TT1=19
	DO CHADJ
      ENDCASE
    ENDDO

    SELE 5
  CASE T2=4
    XLOOP3=0
  ENDCASE

ENDDO

SET CONS ON


PROCEDURE  CHADJ
PARAMETERS  P1,P2,P3
sele 5
IF TT1=4
  ADJNO=ADJNO+1
  IF ADJNO > KLCHN+KUCHN
    ADJNO=1
  ENDIF
ELSEIF TT1=19
  ADJNO=ADJNO-1
  IF ADJNO <1
    ADJNO=KLCHN+KUCHN
  ENDIF
ENDIF
XCCTYPE=A_M_NAME[ADJNO,4]
@ 8,35	SAY XCCTYPE
IF XXTY=2
  @  10,66  SAY  XDATA1 PICT "999.99"
ENDIF
RETURN


PROCEDURE  DSPADJ
PARAMETERS  P1,P2,P3
XC1="99999999"+A_M_NAME[ADJNO,5]
XC1=SUBSTR(XC1,-8,8)
@ 10,35  SAY  (((WDATA(ADJNO-1)-2048)*A_M_NAME[ADJNO,6])/2048)	 PICT  "&XC1"
RETURN
&&-----------------------------------------------------------------------------
PROCEDURE  SVADJ
PARAMETERS  P1,P2,P3
RETURN

PROCEDURE  DSPADJ_1
PARAMETERS  P1,P2,P3
SELE 4
XX=ABSAD(ADJNO_8)
LOCA FOR D_T=ADJNO_8 .AND. D_N > XX
IF .NOT. EOF()
  N_L=D_N
  W_L=D_W
  SKIP -1
  IF ( .NOT. BOF())  .AND. D_T = ADJNO_8
     N_S=D_N
     W_S=D_W
     IF  ADJNO_8 +1 <>	BNODATA4
     @ 10,40  SAY " "
     XX=INT( W_L- ( N_L - XX )* ( (W_L-W_S) / (N_L-N_S) ) )
     x="9999"
     IF ADJNO_8 +2 = BNODATA4
       X=INT(LOG(9999/_DIGIT_A[ADJNO_8+1])/LOG(10))
       X=ALLTRIM(STR(_DIGIT_A[ADJNO_8+1],7,X))
       X=SUBSTR(X,-4,4)
     ENDIF
     @ 10,35  SAY XX	       PICT "9" +  "&X"
     ELSE
     XX= INT(100 * (W_L- (N_L-XX )*((W_L-W_S)/(N_L-N_S))) ) /100
     @ 10,35  SAY XX	PICT "99.99"
     ENDIF
  ELSE
     IF  ADJNO_8 +1 <>	BNODATA4
     *@ 10,40  SAY " "
       x="9999"
       IF ADJNO_8 +2 = BNODATA4
	 X=INT(LOG(9999/_DIGIT_A[ADJNO_8+1])/LOG(10))
	 X=ALLTRIM(STR(_DIGIT_A[ADJNO_8+1],7,X))
       ENDIF
     @ 10,35  SAY INT( W_L- (N_L-XX )*XDATA_A ) 	  PICT "9"+"&X"
     ELSE
     @ 10,35  SAY INT(100 * (W_L- (N_L-XX ) * XDATA_A) ) /100	   PICT "99.99"
     ENDIF
  ENDIF
ENDIF

RETURN


PROCEDURE  CHADJ_1
PARAMETERS  P1,P2,P3
XFAZ=( ABSAD( ADJNO-1 ) -2048 ) / 20.47
@ 10,52  SAY  XFAZ PICT "999.99"
XMAXL=(2048-A_M_NAME[ADJNO,7]) * A_M_NAME[ADJNO,6]/2048
@ 10,64  SAY  XMAXL PICT "99999.99"
RETURN
&&-----------------------------------------------------------------------------
PROCEDURE  SETZADJ
PARAMETERS  P1,P2,P3
XDATA1=INT (((WDATA(ADJNO-1)-2048)*A_M_NAME[ADJNO,6])/2048)
XDATA2=WDATA(ADJNO-1)-2048
SELE 5
XDATA1 =  A_M_NAME[ADJNO,7]
XDATA2=XDATA1 + XDATA2
SETLZA(ADJNO-1,XDATA2)
XDATA1=XDATA2
A_M_NAME[ADJNO,7] :=XDATA1
GOTO 15
ADJNOC=ALLTRIM(STR(ADJNO,2,0))
REPL  PA&ADJNOC WITH XDATA1
RETURN
&&-----------------------------------------------------------------------------

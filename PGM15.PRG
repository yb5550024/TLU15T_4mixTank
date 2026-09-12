
C13="R+"
C14="W+"
SET CONF OFF
SET EXAC OFF
sele 11
SET INDE  TO
SET COLOR TO w +  / b	 , &C14 / &C13
@ 1,0 SAY  " Date:                                                                          "
@ 2,0 SAY  " ╔═════════════════════════════════════╗ "
@ 3,0 SAY  " ║                                                                          ║ "
@ 4,0 SAY  " ║                               往來廠商資料                               ║ "
@ 5,0 SAY  " ╠═════════════════════════════════════╣ "
@  6,0 SAY " ║ 1.廠商代號:              2.廠商名稱:                                     ║ "
@  7,0 SAY " ║             ▔▔▔▔                 ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔      ║ "
@  8,0 SAY " ║ 3.聯絡電話:              4.聯絡電話:            5.Ｆ Ａ Ｘ:              ║ "
@  9,0 SAY " ║             ▔▔▔▔▔               ▔▔▔▔▔             ▔▔▔▔▔   ║ "
@ 10,0 SAY " ║ 6.送貨地址:                                                              ║ "
@ 11,0 SAY " ║             ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔           ║ "
@ 12,0 SAY " ║ 7.負 責 人:              8.聯 絡 人:            9.職    位:              ║ "
@ 13,0 SAY " ║             ▔▔▔▔                 ▔▔▔▔               ▔▔▔       ║ "
@ 14,0 SAY " ║10.發票號碼:                                                              ║ "
@ 15,0 SAY " ║             ▔▔▔▔                                                     ║ "
@ 16,0 SAY " ║11.發票地址:                                                              ║ "
@ 17,0 SAY " ║             ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔           ║ "
@ 18,0 SAY " ║12.其    它:                                                              ║ "
@ 19,0 SAY " ╚═════════════════════════════════════╝ "
save scre to pgm16
TLOOP=1
DO WHILE TLOOP=1
  SET COLOR TO &C17 / &C15
  @ 20,0 SAY "                                                                                "
  @ 21,0 SAY "   [Esc] 回主畫面   [F1] 查詢     [F2] 新增資料   [F3] 修改或刪除               "
  @ 22,0 SAY "                    [F7] 依名稱筆劃順序列印       [F8] 依代號順序列印           "
  SET COLOR TO &C16 / &C15
  @ 21,4 SAY "Esc"
  @ 21,21 SAY "F1"
  @ 21,35 SAY "F2"
  @ 21,51 SAY "F3"
  @ 22,21 SAY "F7"
  @ 22,51 SAY "F8"
  SET COLOR TO w +  / b    , &C14 / &C13
  @ 1,7  SAY  DATE()
  T=0
  T1=0
  set curs off
  DO WHILE T<>27 .AND. T<>28 .AND. T<>-1 .AND. T<>-2   .AND. T<>-6 .AND. T<>-7
    T=INKEY()
  ENDDO
  set curs on
  DO CASE
  CASE T=27
    TLOOP=0
    T=0
    RETU
  CASE T=-6  .OR.  T= -7
    SELE 11
    IF	T=-6
      IF CDSK=0
	INDE ON P1502 TO C:\DX1502
      ELSE
	INDE ON P1502 TO D:\DX1502
      ENDIF
    ELSE
      IF CDSK=0
	INDE ON P1501 TO C:\DX1501
      ELSE
	INDE ON P1501 TO D:\DX1501
      ENDIF
    ENDIF
    SET COLOR TO   N / &C5
    @ 20,0 clea to 22,79
    @ 21,0 SAY "           NO.1 列表機列印,裝入90行報表紙                 "
    SET COLOR TO &C2 / &C1 , &C4 / &C3
    PRT=1
    XNO=1
    pageno=0
    SELE 11
    GOTO TOP
    DO WHILE PRT <= 1  .AND.  ( .NOT. EOF() )
      IF RDLPT(0)<>144
	SET COLOR TO  N  / &C5
	@ 20,0 clea to 22,79
	@ 21,0 SAY "   [Esc] 列表機 1.  不正常, 按裝正確後,按任一鍵繼續"
	@ 22,0 SAY "         NO.1 列表機列印,裝入90行報表紙           "
	SET COLOR TO R	 / &C5
	@ 21,4 SAY "Esc"
	SET COLOR TO &C2 / &C1 , &C4 / &C3
	inkey(0)
	@ 20,0 clea to 22,79
      endif
      IF RDLPT(0)=144
	IF PRT=1
	  PRT=0
	  SET CONS ON
	  ? CHR(27) + "SP1;"
	  SET PRINT TO Lpt1
	  SET DEVI TO PRINT
	  @ 0,1 say "~I;"
	  @ 0,1 say "~y3" + chr(27) + chr(67) + chr(65) + ";"
	  @ 0,10 say "~t24w1z1d2g2;"
	  * @ 1,8   say "                有限公司"
	  @ 3,8  say  "      客戶明細表"
	  @ 3,60 say "~d0L20;"
	  pageno=pageno +1
	  @ 4,0  say "列表日期:"
	  @ 4,9  say  DATE()
	  IF T=-6
	    @ 4,20 say	"依名稱筆劃順序"
	  ELSE
	    @ 4,20 say	"依代號順序"
	  ENDIF
	  @ 4,70 say "Page:"
	  @ 4,75  say  pageno  pict "99"
	  @ 5,0 say "代號 客戶名稱            　　　　　  送貨地址" && ｔｅｌ ＦＡＸ      連絡人
	  @ 6,0 SAY "────────────────────────────────────────"
	  xy=7
	ENDIF
	*  @ XY,0 SAY  XNO PICT "999"
	@ XY,0	SAY  P1501
	@ XY,5	SAY  P1502
	@ XY,37 SAY  substr(P1506,1,42)
	*   @ XY,47 SAY  P1503
	*  @ XY,58 SAY	P1505
	*  @ XY,70 SAY	P1508
	XY=XY+1
	XNO=XNO+1
	SKIP
	IF EOF()
	  @ XY,0 SAY "────────────────────────────────────────"
	  @ XY,1 say "~I;"
	EJEC
	  SET DEVI TO scre
	  exit
	ENDIF
	IF XY=40
	  @ XY,1 say "~I;"
	  EJEC
	  PRT=1
	ENDIF
      else
	SET DEVI TO scre
	exit
      endif
    ENDDO
    SET DEVI TO scre
    SET INDE TO
    rest scre from pgm16
    IF CDSK=0
      set inde to C:\dx1501
    ELSE
      set inde to D:\dx1501
    ENDIF
  CASE T=28
    @ 4,6  say "[查詢]"
    SET COLOR TO &C17 / &C15
    @ 20,0 clea to 22,79
    @ 21,0 SAY "   請輸入相關資料"
    SET COLOR TO w +  / b    , &C14 / &C13
    X1=space(8)
    X2=space(30)
    X3=SPACE(11)
    set key 28 to FIND_1501
    @ 6,16 get x1  PICT "@!"
    read
    @ 6,16 say x1
    ? chr(27)+"IN;"
    ? chr(27)+"Ic;"
    @ 6,41 get x2
    read
    @ 6,41 say x2
    ? chr(27)+"IN;"
    @ 8,16 get x3  PICT "@!"
    read
    @ 8,16 say x3
    SET EXAC OFF
    SET FILT TO ((x1=space(8)) .or. (allTRIM(X1) $ P1501)).AND.((x2=SPACE(30)).OR.(allTRIM(X2) $ P1502)).AND.((x3=SPACE(11)).OR.(allTRIM(X3) $ P1503))
    GOTO TOP
    BN=1
    DO WHILE .NOT. EOF()
      @  4,12 SAY "第   筆資料"
      @  4,14 SAY BN   PICT "999"
      @  6,16 SAY P1501
      @  6,41 SAY P1502
      @  8,16 SAY P1503
      @  8,41 SAY P1504
      @  8,64 SAY P1505
      @ 10,16 SAY P1506
      @ 12,16 SAY P1507
      @ 12,41 SAY P1508
      @ 12,64 SAY P1509
      @ 14,16 SAY P1510 PICT "99999999"
      @ 16,16 SAY P1511
      @ 18,16 SAY P1512
      SET CURS ON
      T=0
      SET COLOR TO &C17 / &C15
      @ 21,0 SAY "   [Esc] 結束查詢   [↑]上一筆    [↓]上一筆"
      SET COLOR TO &C16 / &C15
      @ 21,4 SAY "Esc"
      @ 21,21 SAY "↑"
      @ 21,35 SAY "↓"
      SET COLOR TO &C17 / &C15
      @ 21,0 SAY " "
      SET COLOR TO w +	/ b    , &C14 / &C13
      DO WHILE T<>5 .AND. T<>24.AND. T<>27
	T=INKEY()
      ENDDO
      DO CASE
      CASE T=27
	EXIT
      CASE T=5
	SKIP (-1)
	BN=BN-1
	IF  BOF()
	  GOTO TOP
	  BN=BN+1
	ENDIF
      CASE T=24
	SKIP
	BN=BN+1
      ENDCASE
    ENDDO
    rest scre from pgm16
    SET FILT TO
    @ 4,6  say "                    "
  CASE T=-1
    SET CONF ON
    SET KEY 28 TO FIND_1501
    SET KEY 27 TO OUT_01
    @ 4,6  say "[新增]"
    SET COLOR TO &C17 / &C15
    @ 20,0 clea to 22,79
    @ 21,0 SAY "   [Esc] 結束新增   [F1] 查詢 "
    SET COLOR TO &C16 / &C15
    @ 21,4 SAY "Esc"
    @ 21,21 SAY "F1"
    SET COLOR TO w +  / b    , &C14 / &C13
    X1=space(8)
    X2=space(30)
    X3=SPACE(11)
    X4=SPACE(11)
    X5=space(11)
    X6=SPACE(50)
    X7=space(8)
    X8=SPACE(8)
    X9=SPACE(6)
    X10=VAL(SPACE(8))
    X11=SPACE(50)
    X12=SPACE(10)
    TREAD=1
    TLOOP1=1
    SET CURS ON
    DO WHILE TLOOP1=1
      @ 6,16 get x1  PICT "@!"
      read
      LOCA FOR P1501=X1
      IF .NOT. EOF().OR. X1="    "
	@ 4,13 SAY "廠商代號重複"
      ELSE
	TLOOP1=0
      ENDIF
    ENDDO
    @ 6,16 SAY x1
    @ 4,13 SAY "            "
    SET KEY 28 TO
    DO RDDATA_01
    ? chr(27)+"IN;"
    T=0
    SET COLOR TO &C17 / &C15
    @ 21,0 SAY "   [Esc] 放棄       [Enter]存檔             "
    SET COLOR TO &C16 / &C15
    @ 21,4 SAY "Esc"
    @ 21,21 SAY "Enter"
    SET COLOR TO &C17 / &C15
    @ 21,0 SAY " "
    SET COLOR TO w +  / b    , &C14 / &C13
    DO WHILE T<>13.AND. T<>27
      T=INKEY()
    ENDDO
    DO CASE
    CASE T=27
    CASE T=13 .AND. (X1<>space(8))
      SELE  11
      APPE BLAN
      REPL P1501 WITH LTRIM(X1),P1502 WITH X2,P1503 WITH X3,P1504 WITH X4,P1505 WITH X5,P1506 WITH X6,P1507 WITH X7,P1508 WITH X8
      REPL P1509 WITH X9,P1510 WITH X10,P1511 WITH X11,P1512 WITH X12
      IF CDSK=0
	INDE ON P1502 TO C:\DX1502
	INDE ON P1501 TO C:\DX1501
      ELSE
	INDE ON P1502 TO D:\DX1502
	INDE ON P1501 TO D:\DX1501
      ENDIF
    ENDCASE
    rest scre from pgm16
    @ 4,6  say "                    "
    SET CONF OFF
  CASE T=-2
    DATAFD=0
    SET CONF ON
    SET KEY 28 TO FIND_1501
    SET KEY 27 TO OUT_01
    @ 4,6  say "[修改]"
    SET COLOR TO &C17 / &C15
    @ 20,0 clea to 22,79
    @ 21,0 SAY "   [Esc] 放棄修改   [F1] 查詢 "
    SET COLOR TO &C16 / &C15
    @ 21,4 SAY "Esc"
    @ 21,21 SAY "F1"
    SET COLOR TO w +  / b    , &C14 / &C13
    X1=space(8)
    X2=space(30)
    X3=SPACE(11)
    X4=SPACE(11)
    X5=space(11)
    X6=SPACE(50)
    X7=space(8)
    X8=SPACE(8)
    X9=SPACE(6)
    X10=VAL(SPACE(8))
    X11=SPACE(50)
    X12=SPACE(10)
    TLOOP1=1
    TREAD=1
    SET CURS ON
    DO WHILE TLOOP1=1
      @ 6,16 get x1  PICT "@! xxxxxxxx"
      read
      SELE 11
      LOCA FOR P1501=X1
      IF  EOF()
	@ 4,13 SAY "無此廠商代號"
      ELSE
	TLOOP1=0
	DATAFD=1
      ENDIF
    ENDDO
    @ 6,16 SAY x1
    @ 4,13 SAY "            "
    IF DATAFD=1
      SET KEY 28 TO
      SET COLOR TO &C17 / &C15
      @ 20,0 clea to 22,79
      @ 21,0 SAY "   請輸入相關資料"
      SET COLOR TO w +	/ b    , &C14 / &C13
      X2=P1502
      X3=P1503
      X4=P1504
      X5=P1505
      X6=P1506
      X7=P1507
      X8=P1508
      X9=P1509
      X10=P1510
      X11=P1511
      X12=P1512
      @ 6,16 SAY x1
      @ 6,41 SAY x2
      @ 8,16 SAY x3
      @ 8,41 SAY x4
      @ 8,64 SAY x5
      @ 10,16 SAY X6
      @ 12,16 SAY X7
      @ 12,41 SAY X8
      @ 12,64 SAY X9
      @ 14,16 SAY X10  PICT "99999999"
      @ 16,16 SAY X11
      @ 18,16 SAY X12
      DO  RDDATA_01
      ? chr(27)+"IN;"
      T=0
      SET COLOR TO &C17 / &C15
      @ 21,0 SAY "   [Esc] 放棄修改   [Enter]存檔  [F10]刪除  "
      SET COLOR TO &C16 / &C15
      @ 21,4 SAY "Esc"
      @ 21,21 SAY "Enter"
      @ 21,34 SAY "F10"
      SET COLOR TO &C17 / &C15
      @ 21,0 SAY " "
      SET COLOR TO w +	/ b    , &C14 / &C13
      DO WHILE T<>13.AND. T<>27.AND. T<>-9  .AND. DATAFD=1
	T=INKEY()
      ENDDO
      DO CASE
      CASE T=27
      CASE T=13
	SELE  11
	IF .NOT. EOF() .AND. DATAFD=1
	  REPL P1501 WITH LTRIM(X1),P1502 WITH X2,P1503 WITH X3,P1504 WITH X4,P1505 WITH X5,P1506 WITH X6,P1507 WITH X7,P1508 WITH X8
	  REPL P1509 WITH X9,P1510 WITH X10,P1511 WITH X11,P1512 WITH X12
	ENDIF
      CASE T=-9
	SELE 11
	IF .NOT. EOF() .AND. DATAFD=1
	  DELE
	  PACK
	ENDIF
      ENDCASE
      @ 4,6  say "                    "
      SET CONF OFF
    ENDIF
  ENDCASE
  rest scre from pgm16
ENDDO TLOOP=1
PROCEDURE  FIND_1501
PARAMETERS  P1,P2,P3
SAVE SCRE
SET KEY 28 TO
SET COLOR TO w +  / b	 , &C14 / &C13
@ 0,0 CLEA
SELE 11
SET FILT TO    (P1501=RTRIM(LTRIM(X1))) .or.(RTRIM(LTRIM(X1)) $ P1501 )
GOTO TOP
IF .NOT. EOF()
  @ 1,0  SAY   " NO.│廠商代號│ 電   話  │  廠 商 名 稱"
  @ 2,0  SAY   "──┴────┴─────┴───────────────"
ENDIF
TNO=1
TY=3
DO WHILE .NOT. EOF()
  @ TY,0  SAY  TNO  PICT  "999"
  @ TY,7    SAY  P1501
  @ TY,16 SAY  P1503
  @ TY,28 SAY  P1502
  IF  TY=20
    TY=3
    TNO=TNO+1
    INKEY(0)
  ELSE
    TNO=TNO+1
    TY=TY+1
  ENDIF
  SKIP
ENDDO
INKEY(0)
REST SCRE
SET KEY 28 TO  FIND_1501
RETURN

PROCEDURE   RDDATA_01
PARAMETERS  P1,P2,P3
set cons on
IF TREAD=1
  set key 5  to upread_01
  set key 24 to dnread_01
  SET KEY 28 TO
  SET COLOR TO &C17 / &C15
  @ 20,0 clea to 22,79
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 21,0 SAY "  [Ctrl-空白鍵]中文←→英文互換     請輸入相關資料"
  SET COLOR TO &C16 / &C15
  @ 21,3 SAY "Ctrl-空白鍵"
  SET COLOR TO w +  / b    , &C14 / &C13
  tloop1=1
  readno=2
   do while  tloop1=1  .and. readno<=12
DO CASE
CASE  READNO=1
  READNO=1
  DATAFD=0
  XLOOP=1
  DO WHILE XLOOP=1
    ? chr(27)+"IN;"
    @ 6,16 get x1  PICT "@!"
    read
    IF TREAD=1
      xrecno=recno()
      set filt to recno()<>xrecno
      LOCA FOR P1501=X1
      IF .NOT. EOF().OR. X1=space(8)
	datafd=0
	@ 4,13 SAY "廠商代號重複"
      ELSE
	XLOOP=0
	DATAFD=1
      ENDIF
      SET FILT	TO
      GOTO XRECNO
    ENDIF
  ENDDO
  @ 4,13 SAY "            "
  @ 6,16 SAY x1
  READNO=READNO+1
CASE   READNO=2
  READNO=2
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 6,41 get x2
  read
  READNO=READNO+1
  @ 6,41 SAY x2
CASE  READNO=3
  ? chr(27)+"IN;"
  @ 8,16 GET x3
  READ
  @ 8,16 SAY x3
  READNO=READNO+1
CASE  READNO=4
  ? chr(27)+"IN;"
  @ 8,41 GET x4
  READ
  @ 8,41 SAY x4
  READNO=READNO+1
CASE  READNO=5
  ? chr(27)+"IN;"
  @ 8,64 GET x5
  READ
  READNO=READNO+1
  @ 8,64 SAY x5
CASE  READNO=6
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 10,16 GET X6
  READ
  @ 10,16 SAY X6
  READNO=READNO+1
CASE  READNO=7
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 12,16 GET X7
  READ
  @ 12,16 SAY X7
  READNO=READNO+1
CASE  READNO=8
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 12,41 GET X8
  READ
  @ 12,41 SAY X8
  READNO=READNO+1
CASE  READNO=9
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 12,64 GET X9
  READ
  @ 12,64 SAY X9
  READNO=READNO+1
CASE  READNO=10
  ? chr(27)+"IN;"
  @ 14,16 GET X10
  READ
  READNO=READNO+1
  @ 14,16 SAY X10  PICT "99999999"
CASE  READNO=11
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 16,16 GET X11
  READ
  @ 16,16 SAY X11
  READNO=READNO+1
CASE  READNO=12
  ? chr(27)+"IN;"
  ? chr(27)+"Ic;"
  @ 18,16 GET X12
  READ
  READNO=READNO+1
  @ 18,16 SAY X12
ENDCASE
enddo
set key 5  to
set key 24 to
ENDIF
RETU


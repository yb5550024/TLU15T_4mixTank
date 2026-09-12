

  SET CONF OFF
  SET EXAC OFF
  set cons on
   sele 12
SET COLOR TO w+   / b	 , &C14 / &C13
   @ 1,0 SAY " Date:                                                                          "
   @ 2,0 SAY " ╔═════════════════════════════════════╗ "
   @ 3,0 SAY " ║                                                                          ║ "
   @ 4,0 SAY " ║                               員工個人資料                               ║ "
   @ 5,0 SAY " ╠═════════════════════════════════════╣ "
  @  6,0 SAY " ║ 1.員工代號:              2.姓    名:            3.出生日期:   年  月  日 ║ "
  @  7,0 SAY " ║             ▔▔                     ▔▔▔▔               ▔  ▔  ▔   ║ "
  @  8,0 SAY " ║ 4.聯絡電話:              5.工作單位:            6.薪 資 別:     計酬     ║ "
  @  9,0 SAY " ║             ▔▔▔▔▔              ▔                     ▔▔▔▔      ║ "
  @ 10,0 SAY " ║ 7.職 務 別:              8.日    薪:       元   9.月    薪:       元     ║ "
  @ 11,0 SAY " ║             ▔▔▔▔▔               ▔▔▔                 ▔▔▔       ║ "
  @ 12,0 SAY " ║10.出勤獎金:       元    11.職務津貼:       元  12.伙食津貼:       元     ║ "
  @ 13,0 SAY " ║             ▔▔▔                   ▔▔▔                 ▔▔▔       ║ "
  @ 14,0 SAY " ║13.代扣稅捐:       元    14.代扣勞保:       元  15.入廠日期:              ║ "
  @ 15,0 SAY " ║             ▔▔▔                   ▔▔▔                 ▔▔▔▔     ║ "
  @ 16,0 SAY " ║16.戶 籍 地:                                                              ║ "
  @ 17,0 SAY " ║             ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔           ║ "
  @ 18,0 SAY " ║17.聯絡地址:                                                              ║ "
  @ 19,0 SAY " ╚═════════════════════════════════════╝ "
  save scre to pgm16
  TLOOP=1
  DO WHILE TLOOP=1
SET COLOR TO &c17 / &c15
  @ 20,0 SAY "                                                                                "
  @ 21,0 SAY "   [Esc] 回主畫面   [F1] 查詢     [F2] 新增資料   [F3] 修改或刪除               "
  @ 22,0 SAY "                                                                                "
SET COLOR TO &c16 / &c15
  @ 21,4 SAY "Esc"
  @ 21,21 SAY "F1"
  @ 21,35 SAY "F2"
  @ 21,51 SAY "F3"
SET COLOR TO w+   / b	 , &C14 / &C13
  @ 1,7  SAY  DATE()
  T=0
  T1=0
  set curs off
  DO WHILE T<>27 .AND. T<>28 .AND. T<>-1 .AND. T<>-2
  T=INKEY()
  ENDDO
  set curs on
  DO CASE
  CASE T=27
      TLOOP=0
      T=0
  CASE T=28
  set cons on
	 @ 4,6	say "[查詢]"
       SET COLOR TO &c17 / &c15
	 @ 20,0 clea to 22,79
	 @ 21,0 SAY "   請輸入相關資料"
SET COLOR TO w+   / b	 , &C14 / &C13
       X1=space(4)
       X2=space(8)
       X301=SPACE(2)
       X302=SPACE(2)
       X303=SPACE(2)
       @ 6,16 get x1  PICT "@!"
       read
       @ 6,16 say x1
       ? chr(27)+"IN;"
       ? chr(27)+"Ic;"
       @ 6,40 get x2
       read
       @ 6,40 say x2
       XLOOP=1
       DO WHILE  XLOOP=1
       ? chr(27)+"IN;"
       @ 6,64 get x301	PICT "99"
       @ 6,68 get x302	PICT "99"
       @ 6,72 get x303	PICT "99"
       read
       IF VAL(X302)<=12  .AND. VAL(X303)<=31
	  XLOOP=0
       ELSE
       IF VAL(X302)>12
	 X302="  "
       ENDIF
       IF VAL(X303)>31
	 X303="  "
       ENDIF
       ENDIF
       ENDDO
       IF LEN(ALLTRIM(X301))=1
       X301="0"+ALLTRIM(X301)
       ENDIF
       IF LEN(ALLTRIM(X302))=1
       X302="0"+ALLTRIM(X302)
       ENDIF
       IF LEN(ALLTRIM(X303))=1
       X303="0"+ALLTRIM(X303)
       ENDIF
       @ 6,64 say x301	PICT "99"
       @ 6,68 say x302	PICT "99"
       @ 6,72 say x303	PICT "99"
  SET EXAC OFF

SET FILT TO ((x1="    ").or.(allTRIM(X1) $ P1601)).AND.((x2="        ").OR.(allTRIM(X2) $ P1602)).AND.(SUBSTR(DTOC(P1603),7,2))=allTRIM(X301) .AND.(SUBSTR(DTOC(P1603),1,2))=allTRIM(X302).AND.(SUBSTR(DTOC(P1603),4,2))=allTRIM(X303)

     GOTO TOP
       BN=1
     DO WHILE .NOT. EOF()
       @  4,12 SAY "第   筆資料"
       @  4,14 SAY BN	PICT "999"
       @  6,16 SAY P1601
       @  6,40 SAY P1602
       @  6,64 SAY SUBSTR(DTOC(P1603),7,2)
       @  6,68 SAY SUBSTR(DTOC(P1603),1,2)
       @  6,72 SAY SUBSTR(DTOC(P1603),4,2)
       @  8,16 SAY P1604
     *	@  8,40 SAY P1605
     *	XDATE=P1605
     *	LOCA FOR  P5301=XDATE
     *	@ 8,44 SAY P5302
       SELE 12
       @  8,63 SAY P1606
       X6=P1606
SET COLOR TO w+   / b	 , &C14 / &C13
       DO CASE
	  CASE	X6="1"
       @  8,63 SAY X6
	       @ 8,64 SAY  "按件計酬"
	  CASE	X6="2"
       @  8,63 SAY X6
	       @ 8,64 SAY  "按日計酬"
	  CASE	X6="3"
       @  8,63 SAY X6
	       @ 8,64 SAY  "按月計酬"
       ENDCASE
       @ 10,16 SAY P1607
       @ 10,40 SAY P1608  PICT "999999"
       @ 10,64 SAY P1609  PICT "999999"
       @ 12,16 SAY P1610 PICT "999999"
       @ 12,40 SAY P1611 PICT "999999"
       @ 12,64 SAY P1612 PICT "999999"
       @ 14,16 SAY P1613 PICT "999999"
       @ 14,40 SAY P1614 PICT "999999"
       @ 14,64 SAY P1615 PICT "999999"
       @ 16,16 SAY P1616
       @ 18,16 SAY P1617
       SET CURS ON
       T=0
       SET COLOR TO &c17 / &c15
	 @ 21,0 SAY "   [Esc] 結束查詢   [↑]上一筆    [↓]上一筆"
       SET COLOR TO &c16 / &c15
	 @ 21,4 SAY "Esc"
	 @ 21,21 SAY "↑"
	 @ 21,35 SAY "↓"
       SET COLOR TO &c17 / &c15
       @ 21,0 SAY " "
SET COLOR TO w+   / b	 , &C14 / &C13
       DO WHILE T<>5 .AND. T<>24.AND. T<>27
       T=INKEY()
       ENDDO
       DO CASE
       CASE T=27
	   EXIT
       CASE T=5
	    SKIP (-1)
	    BN=BN-1
	    IF	BOF()
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
	 @ 4,6	say "                    "
  CASE T=-1
	      SET CONF ON
	      SET KEY 28 TO FIND_01
	       SET KEY 27 TO OUT_01
	       @ 4,6  say "[新增]"
	     SET COLOR TO &c17 / &c15
	       @ 20,0 clea to 22,79
	       @ 21,0 SAY "   [Esc] 結束新增   [F1] 查詢 "
	     SET COLOR TO &c16 / &c15
	       @ 21,4 SAY "Esc"
	       @ 21,21 SAY "F1"
SET COLOR TO w+   / b	 , &C14 / &C13
	     X1=space(4)
	     X2=space(8)
	     X301=SPACE(2)
	     X302=SPACE(2)
	     X303=SPACE(2)
	     X4=SPACE(9)
	     X5=space(2)
	     X6="1"
	     X7=space(10)
	     X8=0
	     X9=0
	     X10=0
	     X11=0
	     X12=0
	     X13=0
	     X14=0
	     X15=CTOD(SUBSTR(DTOC(DATE()),1,6)+SUBSTR(LTRIM(STR(YEAR(DATE()))),3,2))
	     X16=SPACE(50)
	     X17=SPACE(50)
	     TREAD=1
	     TLOOP1=1
	     SET CURS ON
	     DO WHILE TLOOP1=1
	       @ 6,16 get x1  PICT "@!"
	       read
	       sele 12
	       LOCA FOR P1601=X1
	       IF .NOT. EOF() .OR. X1="    "
		  @ 4,13 SAY "員工代號重複"
		  X1="    "
	       ELSE
		  TLOOP1=0
	       ENDIF
	     ENDDO
	     @ 6,16 SAY x1
	     @ 4,13 SAY "            "
	     SET KEY 28 TO
	     DO RDDATA_1601
	     T=0
	     SET COLOR TO &c17 / &c15
	       @ 21,0 SAY "   [Esc] 放棄       [Enter]存檔             "
	     SET COLOR TO &c16 / &c15
	       @ 21,4 SAY "Esc"
	       @ 21,21 SAY "Enter"
	     SET COLOR TO &c17 / &c15
	     @ 21,0 SAY " "
SET COLOR TO w+   / b	 , &C14 / &C13
	     DO WHILE T<>13.AND. T<>27
	     T=INKEY()
	     ENDDO
	     DO CASE
	     CASE T=27
	     CASE T=13 .AND. (X1<>"    ")
	   SELE  12
		  APPE BLAN
       REPL P1601 WITH LTRIM(X1),P1602 WITH X2,P1603 WITH CTOD(X302+"/"+X303+"/"+X301),P1604 WITH X4,P1605 WITH X5,P1606 WITH X6,P1607 WITH X7,P1608 WITH X8
REPL P1609 WITH X9,P1610 WITH X10,P1611 WITH X11,P1612 WITH X12,P1613 WITH X13,P1614 WITH X14,P1615 WITH X15,P1616 WITH X16,P1617 WITH X17
	     ENDCASE
    rest scre from pgm16
	       @ 4,6  say "                    "
	      SET CONF OFF
  CASE T=-2
	      SET CONF ON
	      DATAFD=0
	      SET KEY 28 TO FIND_01
	      SET KEY 27 TO OUT_01
	      @ 4,6  say "[修改]"
	      SET COLOR TO &c17 / &c15
	      @ 20,0 clea to 22,79
	      @ 21,0 SAY "   [Esc] 放棄修改   [F1] 查詢 "
	      SET COLOR TO &c16 / &c15
	      @ 21,4 SAY "Esc"
	      @ 21,21 SAY "F1"
SET COLOR TO w+   / b	 , &C14 / &C13
	      X1=space(4)
	      X2=space(8)
	      X301=SPACE(2)
	      X302=SPACE(2)
	      X303=SPACE(2)
	      X4=SPACE(9)
	      X5=space(2)
	      X6=space(1)
	      X7=space(10)
	      X8=0
	      X9=0
	      X10=0
	      X11=0
	      X12=0
	      X13=0
	      X14=0
	      X15=CTOD(SUBSTR(DTOC(DATE()),1,6)+SUBSTR(LTRIM(STR(YEAR(DATE()))),3,2))
	      X16=SPACE(50)
	      X17=SPACE(50)
	      TLOOP1=1
	      TREAD=1
	      SET CURS ON
	      DO WHILE TLOOP1=1
		 @ 6,16 get x1	PICT "@!"
		 read
		 SELE 12
		 LOCA FOR P1601=X1
		 IF  EOF()
		       @ 4,13 SAY "無此員工代號"
		       X1="    "
		 ELSE
		       TLOOP1=0
		       DATAFD=1
		 ENDIF
	      ENDDO
	      @ 6,16 SAY x1
	      @ 4,13 SAY "            "
	      IF DATAFD=1
	      SET KEY 28 TO
	      SET COLOR TO &c17 / &c15
	      @ 20,0 clea to 22,79
	      @ 21,0 SAY "   請輸入相關資料"
SET COLOR TO w+   / b	 , &C14 / &C13
	      X2=P1602
	      X301=SUBSTR(DTOC(P1603),7,2)
	      X302=SUBSTR(DTOC(P1603),1,2)
	      X303=SUBSTR(DTOC(P1603),4,2)
	      X4=P1604
	      X5=P1605
	      X6=P1606
	      X7=P1607
	      X8=P1608
	      X9=P1609
	      X10=P1610
	      X11=P1611
	      X12=P1612
	      X13=P1613
	      X14=P1614
	      X15=P1615
	      X16=P1616
	      X17=P1617
	      @ 6,64 SAY x301  PICT "99"
	      @ 6,68 SAY x302  PICT "99"
	      @ 6,72 SAY x303  PICT "99"
	      @  8,16 SAY X4
	    *  @  8,40 SAY X5
	    *  LOCA FOR  P5301=X5
	    *  @ 8,44 SAY P5302
	      SELE 12
	      @  8,63 SAY X6
SET COLOR TO w+   / b	 , &C14 / &C13
	      DO CASE
	      CASE  X6="1"
		  @  8,63 SAY X6
		  @ 8,64 SAY  "按件計酬"
	      CASE  X6="2"
		  @  8,63 SAY X6
		  @ 8,64 SAY  "按日計酬"
	      CASE  X6="3"
		  @  8,63 SAY X6
		  @ 8,64 SAY  "按月計酬"
	      ENDCASE
	      @ 10,16 SAY X7
	      @ 10,40 SAY X8  PICT "999999"
	      @ 10,64 SAY X9  PICT "999999"
	      @ 12,16 SAY X10 PICT "999999"
	      @ 12,40 SAY X11 PICT "999999"
	      @ 12,64 SAY X12 PICT "999999"
	      @ 14,16 SAY X13 PICT "999999"
	      @ 14,40 SAY X14 PICT "999999"
	      @ 14,64 SAY X15 PICT "999999"
	      @ 16,16 SAY X16
	      @ 18,16 SAY X17
	      SET KEY 28 TO
	      ? chr(27)+"IN;"
	      ? chr(27)+"Ic;"
	      DO RDDATA_1601
	      T=0
	      SET COLOR TO &c17 / &c15
	      @ 21,0 SAY "   [Esc] 放棄修改   [Enter]存檔  [F10]刪除  "
	      SET COLOR TO &c16 / &c15
	      @ 21,4 SAY "Esc"
	      @ 21,21 SAY "Enter"
	      @ 21,34 SAY "F10"
	      SET COLOR TO &c17 / &c15
	      @ 21,0 SAY " "
SET COLOR TO w+   / b	 , &C14 / &C13
	      DO WHILE T<>13.AND. T<>27.AND. T<>-9 .AND. DATAFD=1
		 T=INKEY()
	      ENDDO
	      DO CASE
	      CASE T=27
	      CASE T=13
		   SELE  12
		   IF .NOT. EOF()  .AND. DATAFD=1
		      REPL P1601 WITH LTRIM(X1),P1602 WITH X2,P1603 WITH CTOD(X302+"/"+X303+"/"+X301),P1604 WITH X4,P1605 WITH X5,P1606 WITH X6,P1607 WITH X7,P1608 WITH X8
		      REPL P1609 WITH X9,P1610 WITH X10,P1611 WITH X11,P1612 WITH X12,P1613 WITH X13,P1614 WITH X14,P1615 WITH X15,P1616 WITH X16,P1617 WITH X17
		   ENDIF
	      CASE T=-9
		  SELE 12
		  IF .NOT. EOF()  .AND. DATAFD=1
		    DELE
		    PACK
		  ENDIF
	       ENDCASE
	       @ 4,6  say "                    "
	       SET CONF OFF
	       ENDIF
	       rest scre from pgm16
	   ENDCASE
	   ENDDO

PROCEDURE  FIND_01
PARAMETERS  P1,P2,P3
set key 5  to
set key 24 to
SAVE SCRE
SET KEY 28 TO
SET COLOR TO w+   / b	 , &C14 / &C13
@ 0,0 CLEA
SELE 12
SET FILT TO    (P1601=RTRIM(LTRIM(X1))) .or.(RTRIM(LTRIM(X1)) $ P1601 )
GOTO TOP
IF .NOT. EOF()
@ 1,0  SAY   " NO. 員工代號   姓    名│NO. 員工代號   姓    名 │NO. 員工代號   姓    名     "
@ 2,0  SAY   "────────────┴────────────┴──────────────"
ENDIF
TNO=1
TY=3
TX=0
DO WHILE .NOT. EOF()
@ TY,TX SAY  TNO  PICT	"999"
@ TY,7+TX SAY  P1601
@ TY,16+TX SAY	P1602
  IF  TY=20
      TY=3
       IF  TX=52
	   TX=0
	   tno=1
	   WAIT
       ELSE
	   TNO=TNO+1
	   TX=TX+26
       ENDIF
  ELSE
  TNO=TNO+1
  TY=TY+1
  ENDIF
 SKIP
ENDDO
wait
REST SCRE
SET KEY 28 TO  FIND_01
set key 5  to upread_01
set key 24 to dnread_01
RETURN


PROCEDURE  TXT_02
PARAMETERS  P1,P2,P3
SET KEY 28 TO
	SET COLOR  TO	&c14 / &c13
DO CASE
   CASE  x6="1"
	X6="2"
	@ 8,64 SAY  "按日計酬"
   CASE  x6="2"
	X6="3"
	@ 8,64 SAY  "按月計酬"
   CASE  x6="3"
	X6="1"
	@ 8,64 SAY  "按件計酬"
   OTHERWISE
       X6="1"
       @ 8,64 SAY  "按件計酬"
ENDCASE
SET COLOR TO w+   / b	 , &C14 / &C13
SET KEY 28 TO	txt_02
RETURN

    PROCEDURE	RDDATA_1601
    PARAMETERS	P1,P2,P3
    IF TREAD=1
    set key 27	to out_01
    set key 5  to upread_01
    set key 24 to dnread_01
    TLOOP1=1
    READNO=2
    DO WHILE  TLOOP1=1	 .AND. READNO<=19
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
     LOCA FOR P1601=X1
       IF .NOT. EOF().OR. X1="    "
       datafd=0
       @ 4,13 SAY "員工代號重複"
       ELSE
       XLOOP=0
       DATAFD=1
       ENDIF
       SET FILT  TO
       GOTO XRECNO
     ENDIF
     ENDDO
       @ 4,13 SAY "            "
     @ 6,16 SAY x1
     READNO=READNO+1
CASE  READNO=2
      readno=2
   ? chr(27)+"IN;"
   ? chr(27)+"Ic;"
    @ 6,40 get x2
    read
    @ 6,40 SAY x2
     READNO=READNO+1
CASE  READNO=3
   ? chr(27)+"IN;"
    @ 6,64 get x301  PICT "99"
    READ
    IF LEN(ALLTRIM(X301))=1
    X301="0"+ALLTRIM(X301)
    ENDIF
    @ 6,64 SAY x301  PICT "99"
     READNO=READNO+1
CASE  READNO=4
     XLOOP=1
   DO WHILE XLOOP=1
   ? chr(27)+"IN;"
    @ 6,68 get x302  PICT "99"
    READ
    IF VAL(X302)<=12
    XLOOP=0
    ELSE
    IF VAL(X302)>12
    X302="  "
    READNO=4
    ENDIF
   ENDIF
   ENDDO
   IF LEN(ALLTRIM(X302))=1
   X302="0"+ALLTRIM(X302)
   ENDIF
    @ 6,68 SAY x302
     READNO=READNO+1
CASE  READNO=5
      XLOOP=1
    DO WHILE XLOOP=1
    ? chr(27)+"IN;"
    @ 6,72 get x303  PICT "99"
    READ
     IF VAL(X303)<=31
     XLOOP=0
     ELSE
     IF VAL(X303)>31
     X303="  "
    READNO=5
     ENDIF
    ENDIF
    ENDDO
    IF LEN(ALLTRIM(X303))=1
    X303="0"+ALLTRIM(X303)
    ENDIF
    @ 6,72 SAY x303
     READNO=READNO+1
CASE  READNO=6
   ? chr(27)+"IN;"
    @  8,16 GET X4
    READ
    @  8,16 SAY X4
     READNO=READNO+1
CASE  READNO=7
 *  ? chr(27)+"IN;"
 *  SET COLOR TO &c17 / &c15
 *  @ 20,0 clea to 22,79
 *  @ 21,0 SAY "   [Esc] 結束新增   [F1] 查詢 [Enter]  輸入 "
 *  SET COLOR TO &c16 / &c15
 *  @ 21,4 SAY "Esc"
 *  @ 21,21 SAY "F1"
 *  @ 21,31 SAY "Enter"
 *  XLOOP=1
 *  DO WHIL XLOOP=1
 *   @	8,40 GET X5
 *   READ
 *   SET EXACT ON
 *   LOCA FOR  P5301=X5
 *   IF .NOT. EOF()
 *   @ 8,44 SAY P5302
 *   XLOOP=0
 *   ELSE
 *   X5=SPACE(2)
 *   ENDIF
 *   SET EXACT OFF
 *   ENDDO
 *   @	8,40 SAY X5
     READNO=READNO+1
 *   SET KEY 28  TO
CASE  READNO=8
   ? chr(27)+"IN;"
   SET KEY 28 TO TXT_02
   SET COLOR TO &c17 / &c15
   @ 20,0 clea to 22,79
   @ 21,0 SAY "   [Esc] 結束新增   [F1] 查詢 [Enter]  輸入 "
   SET COLOR TO &c16 / &c15
   @ 21,4 SAY "Esc"
   @ 21,21 SAY "F1"
SET COLOR TO w+   / b	 , &C14 / &C13
    @  8,63 GET X6
    READ
SET COLOR TO w+   / b	 , &C14 / &C13
    DO CASE
    CASE  X6="1"
    @  8,63 SAY X6
    @ 8,64 SAY	"按件計酬"
    CASE  X6="2"
    @  8,63 SAY X6
    @ 8,64 SAY	"按日計酬"
    CASE  X6="3"
    @  8,63 SAY X6
    @ 8,64 SAY	"按月計酬"
    OTHERWISE
    X6="1"
    @  8,63 SAY X6
    @ 8,64 SAY	"按件計酬"
    ENDCASE
     READNO=READNO+1
    SET KEY 28	TO
CASE  READNO=9
   ? chr(27)+"IN;"
   ? chr(27)+"Ic;"
   SET COLOR TO &c17 / &c15
   @ 20,0 clea to 22,79
   @ 21,0 SAY "  [Ctrl-空白鍵]中文←→英文互換     請輸入相關資料"
   SET COLOR TO &c16 / &c15
   @ 21,3 SAY "Ctrl-空白鍵"
SET COLOR TO w+   / b	 , &C14 / &C13
    @ 10,16 GET X7
    READ
    @ 10,16 SAY X7
     READNO=READNO+1
CASE  READNO=10
   ? chr(27)+"IN;"
    @ 10,40 GET X8  PICT "999999"
    READ
    @ 10,40 SAY X8  PICT "999999"
     READNO=READNO+1
CASE  READNO=11
   ? chr(27)+"IN;"
    @ 10,64 GET X9  PICT "999999"
    READ
    @ 10,64 SAY X9  PICT "999999"
     READNO=READNO+1
CASE  READNO=12
   ? chr(27)+"IN;"
    @ 12,16 GET X10 PICT "999999"
    READ
    @ 12,16 SAY X10 PICT "999999"
     READNO=READNO+1
CASE  READNO=13
   ? chr(27)+"IN;"
	@ 12,40 GET X11 PICT "999999"
     READ
	@ 12,40 SAY X11 PICT "999999"
     READNO=READNO+1
CASE  READNO=14
   ? chr(27)+"IN;"
    @ 12,64 GET X12 PICT "999999"
    READ
    @ 12,64 SAY X12 PICT "999999"
     READNO=READNO+1
CASE  READNO=15
   ? chr(27)+"IN;"
    @ 14,16 GET X13 PICT "999999"
    READ
    @ 14,16 SAY X13 PICT "999999"
     READNO=READNO+1
CASE  READNO=16
   ? chr(27)+"IN;"
    @ 14,40 GET X14 PICT "999999"
    READ
    @ 14,40 SAY X14 PICT "999999"
     READNO=READNO+1
CASE  READNO=17
   ? chr(27)+"IN;"
    @ 14,64 GET X15 PICT "999999"
    READ
    @ 14,64 SAY X15 PICT "999999"
     READNO=READNO+1
CASE  READNO=18
   ? chr(27)+"IN;"
   ? chr(27)+"Ic;"
    @ 16,16 GET X16
    READ
    @ 16,16 SAY X16
     READNO=READNO+1
CASE  READNO=19
   ? chr(27)+"IN;"
   ? chr(27)+"Ic;"
    @ 18,16 GET X17
    READ
    @ 18,16 SAY X17
     READNO=READNO+1
ENDCASE
ENDDO
   ? chr(27)+"In;"
ENDIF
set key 5  to
set key 24 to
    RETU


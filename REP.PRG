
selec 2
use w1
REIN
    SET COLOR TO &C7 +/ &C1
  @ 1,2  SAY "                    ******** 配比資料查詢 ********                         "
   SET COLOR TO &C5 +/ &C1
   @ 2,2 SAY "┌────────────────────────────────────┐"
  @ 3,2  SAY "│       ＮＯ． 沙1   沙2   石1   石2    水  水泥1  水泥2  水泥3  藥劑    │"
  @ 4,2  SAY "├────────────────────────────────────┤"
    SET COLOR TO &C7 +/ &C1
  @ 0,10 SAY  SUBSTR(DTOC(DATE()),7,2)
  @ 0,17 SAY  SUBSTR(DTOC(DATE()),1,2)
  @ 0,23 SAY  SUBSTR(DTOC(DATE()),4,2)
  @ 0,37 SAY  TIME()
  LSK=0
      GOTO TOP
      SCRNO1=5
  DO WHILE  RAR1<>27
     @ 5,4 CLEA  TO 20,75
     DO WHILE .NOT. EOF()   .AND.  SCRNO1 <21
     @ SCRNO1,8   SAY RATNO
     @ SCRNO1,17  SAY SAD1
     @ SCRNO1,23  SAY SAD2
     @ SCRNO1,29  SAY ST1
     @ SCRNO1,35  SAY ST2
     @ SCRNO1,41  SAY WA
     @ SCRNO1,48  SAY CO1
     @ SCRNO1,55  SAY CO2
     @ SCRNO1,61  SAY CO3
     @ SCRNO1,68  SAY ME
     SKIP
     SCRNO1=SCRNO1+1
     ENDDO
     XGET=1
     SKIP(-1)
     SCRNO1=SCRNO1-1
     IF LSK=24	.OR. LSK=3 .OR. LSK=13
     SKIP -(SCRNO1-5)
      SCRNO1=5
     ENDIF
 DO WHILE XGET=1
	SET COLOR TO &C6 / &C1
  @ 22,1 SAY "    Pg-Up上一頁,        Pg-Dn下一頁              Esc- 查詢結束                 "
	SET COLOR TO  gr +/ &C1
	  @ 22,5  SAY "Pg-Up"
	  @ 22,25 SAY "Pg-Dn"
	  @ 22,50 SAY "Esc"
    SET COLOR TO &C7 +/ &C1
     lsk=0
     do while  LSK<>13 .AND. LSK<>24 .AND. LSK<>5  .AND. LSK<>18 .and. LSK<>3  .and. LSK<>27 .and. LSK<>23
     LSK=INKEY()
     ENDDO
     DO CASE
	CASE LSK=13 .OR. LSK=24
	     SKIP
	     SCRNO1=SCRNO1+1
	     IF EOF()
	     APPEN  BLAN
	     ENDIF
	     IF SCRNO1>20
		SCRNO1=5
		XGET=0
	     ENDIF
	CASE LSK=5
	     IF SCRNO1=5
		SKIP (-15)
		IF  BOF()
	       * SKIP
		ENDIF
		XGET=0
	     ELSE
	      SCRNO1=SCRNO1-1
	      SKIP (-1)
	     ENDIF
	 CASE  LSK=18
	     SKIP (-(SCRNO1+10))
	     SCRNO1=5
	     XGET=0
	 CASE LSK=3
	     SKIP  (20-SCRNO1)
	     SCRNO1=5
	     XGET=0
	  CASE	LSK=27
	    CLEA
	     RETU

     ENDCASE
  ENDDO XGET=1

  ENDDO RAR1<>27


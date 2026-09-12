selec 3
SET COLO TO &C7 +/ &C1
LUDBF="3"
SET CURS OFF
SET Cons  on
GOTO TOP
XX1=6
SCRCC=1
YY1=21
@ 20,2 CLEA TO	22,77
@ 24,2 CLEA TO	24,77
SCRNO=21
Y1=SCRNO
STAR_X=2
STAR_Y=21
END_X=77
END_Y=22

     SET COLOR TO &C6 / &C1
 @ 20,0 SAY "∥    ＮＯ.    車   號    配比代號     執行米數    　坍度                     ∥"
 @ 24,0 SAY "∥<<排程輸入>> F1-全畫面編輯  F9-插入 F10-刪除 ↑↓上下筆  Ctl-End結束        ∥"
 SET COLOR TO  gr +/ &C1
 @ 24,4  SAY "排程輸入"
 @ 24,15 SAY "F1"
 @ 24,30 SAY "F9"
 @ 24,38 SAY "F10"
 @ 24,47 SAY "↑↓"
 @ 24,59 SAY "Ctl-End"
 SET COLOR TO &C7 +/ &C1
 GOTO BOTT
SKIP (-1)
@ SCRNO,6   SAY SCANO	 PICT "9999"
@ SCRNO,16  SAY CARNO
@ SCRNO,28  SAY RATNO	 PICT RATNO_PAT
@ SCRNO,42  SAY VUSE	 PICT "99.9"
@ SCRNO,53  SAY TANDO	 PICT "9999"
IF  VUSE=0
SCRNO=SCRNO-1
ENDIF
SKIP
T2=1
IF EOF()
APPE BLANK
ENDIF
SCRNO=SCRNO+1
Y1=SCRNO
IF SCRNO >END_Y
SCRNO = END_Y
SCROLL(STAR_Y,STAR_X,END_Y,END_X,1)
ENDIF
DO WHILE  T2<>0
XSCANO=SCANO
XCARNO=CARNO
XRATNO=RATNO
XVUSE=VUSE
XTANDO=TANDO
SET COLO TO &C1 / &C7 +
@ SCRNO,6   SAY xSCANO	  PICT "9999"
@ SCRNO,16  SAY XCARNO
@ SCRNO,28  SAY XRATNO	  PICT RATNO_PAT
@ SCRNO,42  SAY XVUSE	  PICT "99.9"
@ SCRNO,53  SAY XTANDO	  PICT "9999"
SET COLO TO &C7 +/ &C1
     CHRN=STR(XSCANO,4)
     ph_xn=6
     XP=0
     FGETNO=1
       Y1=SCRNO
       YY1=Y1
       GETNO=1
   DO WHILE   GETNO<=5
       t=0
       *CURSER2(ph_xn,Y1,XP)
       set colo to &c1	/&c7 +
       @ y1,ph_xn say  chrn
       set colo to gr + * /bl
       @ y1,ph_xn say  substr(chrn,XP+1,1)
	 set colo to &c7 + /&c1
       XX1=ph_xn+XP
       YY1=Y1
       T1=0
       TN1=0
       DO WHILE T1<>233
       T=0
       LURECNO=RECNO()
       INFUNC=1
       DO WHILE T=0
	 IF SCRCC=1
	   DO DSP2
	 ENDIF
	 DO LUSTP
	 T=INKEY( )
	 IF T0A <>0
	   T=T0A
	   T0A=0
	 ENDIF
       ENDDO
       SELE &LUDBF
       GOTO LURECNO
       DO CASE
	  case	T=19
		IF XP>=1
		XP=XP-1
		*CURSER0(XX1,YY1)
		*CURSER2(ph_xn,Y1,XP)
		set colo to &c1  /&c7 +
		@ y1,ph_xn say	chrn
		set colo to gr + * /bl
		@ y1,ph_xn+xp say  substr(chrn,xp+1,1)
		set colo to &c7 + /&c1
		XX1=ph_xn+XP
		YY1=Y1
		ENDIF
	  CASE	T=4
		IF GETNO=2
		LANPA=5
		ELSE
		LANPA=2
		ENDIF
		IF XP<=LANPA
		XP=XP+1
		*CURSER0(XX1,YY1)
		*CURSER2(ph_xn,Y1,XP)
		set colo to &c1  /&c7 +
		@ y1,ph_xn say	chrn
		set colo to gr + * /bl
		@ y1,ph_xn+xp say  substr(chrn,xp+1,1)
		set colo to &c7 + /&c1
		XX1=ph_xn+XP
		YY1=Y1
		ENDIF
	  CASE	 (t>=45  .and. T<=90 .AND. GETNO=2)  .OR. (T=32 .AND. GETNO=2) .OR. (T>=97  .AND. T<=122 .AND. GETNO=2)
	    XP=XP+1
	    IF TN1=0 .AND. XP=1
	      TN1=1
	      CHRN="    "
	    ENDIF
	    IF XP<7
	      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,4-XP)
	      SET COLO TO &C1 / &C7 +
	      @ SCRNO,ph_xn  SAY CHRN
	      SET COLO TO &C7 +/ &C1
	      *CURSER0(XX1,YY1)
	      *CURSER2(ph_xn,Y1,XP)
	      set colo to &c1  /&c7 +
	      @ y1,ph_xn say  chrn
	      set colo to gr + * /bl
	      @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	      set colo to &c7 + /&c1
	      XX1=ph_xn+XP
	      YY1=Y1
	      ELSE
	      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
	      SET COLO TO &C1 / &C7 +
	      @ SCRNO,ph_xn  SAY CHRN
	      SET COLO TO &C7 +/ &C1
	      XP=XP-1
	      *CURSER2(ph_xn,Y1,XP)
	      set colo to &c1  /&c7 +
	      @ y1,ph_xn say  chrn
	      set colo to gr + * /bl
	      @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	      set colo to &c7 + /&c1
	      XP=6
	      XX1=ph_xn+XP
	      YY1=Y1
	    ENDIF
	  CASE	 T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
	    XP=XP+1
	    IF TN1=0 .AND. XP=1
	      TN1=1
	      CHRN="    "
	    ENDIF
	    IF XP<4
	      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,4-XP)
	      SET COLO TO &C1 / &C7 +
	      @ SCRNO,ph_xn  SAY CHRN
	      SET COLO TO &C7 +/ &C1
	      *CURSER0(XX1,YY1)
	      *CURSER2(ph_xn,Y1,XP)
	      set colo to &c1  /&c7 +
	      @ y1,ph_xn say  chrn
	      set colo to gr + * /bl
	      @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	      set colo to &c7 + /&c1
	      XX1=ph_xn+XP
	      YY1=Y1
	    ELSE
	      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
	      SET COLO TO &C1 / &C7 +
	      @ SCRNO,ph_xn  SAY CHRN
	      SET COLO TO &C7 +/ &C1
	      XP=XP-1
	      *CURSER2(ph_xn,Y1,XP)
	      set colo to &c1  /&c7 +
	      @ y1,ph_xn say  chrn
	      set colo to gr + * /bl
	      @ y1,ph_xn+xp say  substr(chrn,xp+1,1)
	      set colo to &c7 + /&c1
	      XP=3
	      XX1=ph_xn+XP
	      YY1=Y1
	    ENDIF
	  CASE T=13
	     FGETNO=GETNO+1
	       T1=233
	       INFUNC=0
	  CASE T=5
		IF GETNO>1
		FGETNO=GETNO-1
		T1=233
		ELSE
		FGETNO=6
		T1=233
		ENDIF
	       INFUNC=0
	  CASE T=27
	     T1=233
	     GETNO=6
	       INFUNC=0
	  CASE T=23
	     T1=233
	     T2=0
	    FGETNO=6
	       INFUNC=0
	  CASE T=27
	  T1=233
	  CASE T=24
	    T1=233
	    FGETNO=6
	       INFUNC=0
	  case T=3 .AND. SCRCC=0
	       T1=233
	    FGETNO=6
	       INFUNC=0
	  case T=18 .AND. SCRCC=0
	       T1=233
	    FGETNO=6
	       INFUNC=0
	  case T=-8 .or. T=-9
	    T1=233
	    FGETNO=6
	       INFUNC=0
	  CASE T=28  .AND. STAR=0
	    IF SCRCC=1
	      SAVE SCREE TO SCRRA1
	      @ 0,0 CLEA TO 22,79
	      SET COLOR TO &C6 / &C1
	      @ 0,0 SAY "      ＮＯ.    車   號    配比代號     執行米數    　坍度                       "
	      SET COLOR TO &C7 +/ &C1
	      XX1=RECNO()
	      SKIP -10
	      XX=1
	      DO   WHILE ( .NOT. EOF()	)   .AND. XX <= END_Y
		@ XX,6	 SAY  SCANO    PICT "9999"
		@ XX,16  SAY  CARNO
		@ XX,28  SAY  RATNO    PICT RATNO_PAT
		@ XX,42  SAY  VUSE     PICT "99.9"
		@ XX,53  SAY TANDO    PICT "9999"
		IF  XX1=RECNO()
		  SCRNO=XX
		  Y1=SCRNO
		ENDIF
		SKIP
		XX=XX+1
	      ENDDO
	      GOTO XX1
	      SET COLO TO &C1 / &C7 +
	      @ SCRNO,6   SAY xSCANO	PICT "9999"
	      @ SCRNO,16  SAY XCARNO
	      @ SCRNO,28  SAY XRATNO	PICT RATNO_PAT
	      @ SCRNO,42  SAY XVUSE	PICT "99.9"
	      @ SCRNO,53  SAY XTANDO	PICT "9999"
	      SET COLO TO &C7 +/ &C1
	      SET COLOR TO &C6 / &C1
	      @ 24,0 SAY "∥<<排程輸入>> F1-全畫面編輯  F9-插入 F10-刪除 ↑↓上下筆  Ctl-End結束        ∥"
	      SET COLOR TO  gr +/ &C1
	      @ 24,4  SAY "排程輸入"
	      @ 24,15 SAY "F1"
	      @ 24,30 SAY "F9"
	      @ 24,38 SAY "F10"
	      @ 24,47 SAY "↑↓"
	      @ 24,59 SAY "Ctl-End"
	      SET COLOR TO &C7 +/ &C1
	      SCRCC=0
	      STAR_X=2
	      STAR_Y=1
	      END_X=77
	      END_Y=21
	      T1=233
	      GETNO=10
	       INFUNC=0
	    ELSE
	      SCRCC=1
	      SCRNO=21
	      Y1=SCRNO
	      STAR_X=2
	      STAR_Y=21
	      END_X=77
	      END_Y=22
	      REST SCRE FROM SCRRA1
	      SET COLOR TO &C6 / &C1
	      @ 22,0 SAY "∥                                                                            ∥"
	      @ 24,0 SAY "∥<<排程輸入>> F1-全畫面編輯  F9-插入 F10-刪除 ↑↓上下筆  Ctl-End結束        ∥"
	      SET COLOR TO  gr +/ &C1
	      @ 24,4  SAY "排程輸入"
	      @ 24,15 SAY "F1"
	      @ 24,30 SAY "F9"
	      @ 24,38 SAY "F10"
	      @ 24,47 SAY "↑↓"
	      @ 24,59 SAY "Ctl-End"
	      SET COLOR TO &C7 +/ &C1
	      SCRNO=21
	      Y1=SCRNO
	      SET COLO TO &C1 / &C7 +
	      @ SCRNO,6   SAY xSCANO	PICT "9999"
	      @ SCRNO,16  SAY XCARNO
	      @ SCRNO,28  SAY XRATNO	PICT RATNO_PAT
	      @ SCRNO,42  SAY XVUSE	PICT "99.9"
	      @ SCRNO,53  SAY XTANDO	PICT "9999"
	      SET COLO TO &C7 +/ &C1
	      T1=233
	      GETNO=10
	       INFUNC=0
	    ENDIF
	  ENDCASE
       ENDDO   t1 <>233
SET COLO TO &C1 / &C7 +
       DO CASE
       CASE GETNO=1
	    XSCANO=INT(VAL(CHRN))
       @ SCRNO,6   SAY XSCANO	 PICT "9999"
       CASE GETNO=2
	   XCARNO=UPPER(CHRN)
       @ SCRNO,16  SAY XCARNO
       CASE GETNO=3
	   XRATNO=INT(VAL(CHRN))
       @ SCRNO,28  SAY XRATNO	 PICT RATNO_PAT
       CASE GETNO=4
	    SET DECIM TO 1
	   XVUSE=VAL(CHRN)
	     IF XVUSE>=100
	     XVUSE=0
	       FGETNO=4
	     ENDIF
       @ SCRNO,42  SAY XVUSE	 PICT "99.9"
	    SET DECIM TO 3
       CASE GETNO=5
	    XTANDO=INT(VAL(CHRN))
       @ SCRNO,53  SAY XTANDO	 PICT "9999"
       ENDCASE

SET COLO TO &C7 +/ &C1
       DO CASE
	  CASE FGETNO=1
	       CHRN=STR(XSCANO,4)
	       ph_xn=6
	       XP=0
	       FGETNO=0
	       GETNO=1
	  CASE FGETNO=2
	       GETNO=2
	       CHRN=XCARNO
	       ph_xn=16
	       XP=0
	       FGETNO=0
	  CASE FGETNO=3
	       GETNO=3
	       CHRN=STR(XRATNO,RATNO_WID)
	       ph_xn=28
	       XP=0
	       FGETNO=0
	  CASE FGETNO=4
	       GETNO=4
	       CHRN=STR(XVUSE,4,1)
	       ph_xn=42
	       XP=0
	       FGETNO=0
	  CASE FGETNO=5
	       GETNO=5
	       CHRN=STR(XTANDO,4)
	       ph_xn=53
	       XP=0
	       FGETNO=0
	  CASE FGETNO=6
	    SELE 2
	    LOCA FOR RATNO=XRATNO
	    IF .NOT. EOF() .AND. XVUSE<>0
	      SELEC 3
	      REPL SCANO  WITH XSCANO,CARNO WITH XCARNO,RATNO WITH XRATNO,VUSE WITH XVUSE,TANDO WITH XTANDO
	    ENDIF
	    SELEC 3
	    FGETNO=0
	    GETNO=6
	    @ SCRNO,6	SAY SCANO    PICT "9999"
	    @ SCRNO,16	SAY CARNO
	    @ SCRNO,28	SAY RATNO    PICT RATNO_PAT
	    @ SCRNO,42	SAY VUSE     PICT "99.9"
	    @ SCRNO,53	SAY TANDO    PICT "9999"
	  ENDCASE

       ENDDO	 getno <=5
       DO CASE
       CASE  T=13 .OR. T=24
	 XP=0
	   SKIP
	   IF EOF()
	     APPE BLANK
	   ENDIF
	   SCRNO=SCRNO+1
	   Y1=SCRNO
	   IF SCRNO >END_Y
	     SCRNO = END_Y
	     SCROLL(STAR_Y,STAR_X,END_Y,END_X,1)
	   ENDIF
       CASE T=3 .AND. SCRCC=0
	     SKPN=20
	     DO WHILE  .NOT. EOF() .AND. SKPN>0
	     SKIP
	     SKPN=SKPN-1
	     XP=0
	     IF  .NOT. EOF()
	     SCRNO=SCRNO+1
Y1=SCRNO
	     IF SCRNO>END_Y
	      SCROLL(STAR_Y,STAR_X,END_Y,END_X,1)
	      SCRNO=END_Y
Y1=SCRNO
	     ENDIF
	     ENDIF
	     @ SCRNO,6	 SAY  SCANO    PICT "9999"
	     @ SCRNO,16  SAY  CARNO
	     @ SCRNO,28  SAY  RATNO    PICT RATNO_PAT
	     @ SCRNO,42  SAY  VUSE     PICT "99.9"
	      @ SCRNO,53  SAY TANDO    PICT "9999"
	     ENDDO

       CASE T=5
	 SKIP (-1)
	 XP=0
	 IF  .NOT. BOF()
	   SCRNO=SCRNO-1
	   Y1=SCRNO
	   IF SCRNO<STAR_Y
	     SCROLL(STAR_Y,STAR_X,END_Y,END_X,-1)
	     SCRNO=STAR_Y
	     Y1=SCRNO
	   ENDIF
	 ENDIF
       CASE T=-8    &&INSERT  RECORD
	 XX1=RECNO()
	 XX2=SCRNO
	 GOTO BOTT
	 APPE  BLANK
	 XX=RECNO()
	 DO  WHILE XX > XX1
	  SKIP -1
	  XSCANO=SCANO
	  XCARNO=CARNO
	  XRATNO=RATNO
	  XVUSE=VUSE
	  XTANDO=TANDO
	  REPL SCANO  WITH 0   ,CARNO WITH "       ",RATNO WITH 0,VUSE WITH 0,TANDO WITH 0
	  SKIP
	  REPL SCANO  WITH XSCANO,CARNO WITH XCARNO,RATNO WITH XRATNO,VUSE WITH XVUSE,TANDO WITH XTANDO
	  SKIP -1
	  XX=RECNO()
	 ENDDO
	 GOTO XX1
	 XSCANO=SCANO
	 XCARNO=CARNO
	 XRATNO=RATNO
	 XVUSE=VUSE
	 XTANDO=TANDO
	 SCROLL(XX2,STAR_X,END_Y,END_X,-1)
       CASE T=-9    &&INSERT  RECORD
	 XX1=RECNO()
	 XX2=SCRNO
	 XX=XX2
	 DELE
	 PACK
	 SCROLL(XX2,STAR_X,END_Y,END_X,1)
	 GOTO  XX1
	 DO   WHILE ( .NOT. EOF()  )   .AND. XX <= END_Y
	   @ XX,6   SAY  SCANO	  PICT "9999"
	   @ XX,16  SAY  CARNO
	   @ XX,28  SAY  RATNO	  PICT "9999"
	   @ XX,42  SAY  VUSE	  PICT "99.9"
	   @ XX,53  SAY TANDO	 PICT "9999"
	   SKIP
	   XX=XX+1
	 ENDDO
	 GOTO XX1
       CASE T=18 .AND. SCRCC=0
	   SKPN=20
	   DO WHILE  .NOT. BOF() .AND. SKPN>0
	   SKIP (-1)
	   SKPN=SKPN-1
	   XP=0
	   IF  .NOT. BOF()
	   SCRNO=SCRNO-1
Y1=SCRNO
	   IF SCRNO<STAR_Y
	    SCROLL(STAR_Y,STAR_X,END_Y,END_X,-1)
	    SCRNO=STAR_Y
Y1=SCRNO
	   ENDIF
	   ENDIF
	   @ SCRNO,6   SAY  SCANO    PICT "9999"
	   @ SCRNO,16  SAY  CARNO
	   @ SCRNO,28  SAY  RATNO    PICT "9999"
	   @ SCRNO,42  SAY  VUSE     PICT "99.9"
	       @ SCRNO,53  SAY TANDO	PICT "9999"
	   ENDDO

       CASE T=23
	   T=0
	   goto top
	   DO WHILE .not. eof()
	      IF VUSE=0
	      DELE
	      ENDIF
	      SKIP
	   ENDDO
	   PACK
	   if scrcc=0
	   scrcc=1
		      REST SCRE FROM SCRRA1
	   endif
	   RETU
       ENDCASE
       @ SCRNO,6   SAY	SCANO	 PICT "9999"
       @ SCRNO,16  SAY	CARNO
       @ SCRNO,28  SAY	RATNO	 PICT "9999"
       @ SCRNO,42  SAY	VUSE	 PICT "99.9"
	       @ SCRNO,53  SAY TANDO	PICT "9999"
     ENDDO



     T=0


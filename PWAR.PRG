Sele  5
GOTO TOP
XX1=6
YY1=16
       SET COLOR TO &C6 / &C1
 @ 24,0 SAY "∥     <<  含水修正 >>    Esc- 恢復原值,  Enter- 輸入,    Ctl-End  結束       ∥"
       SET COLOR TO  gr +/ &C1
	 @ 24,11 SAY "含水修正"
	 @ 24,26 SAY "Esc"
	 @ 24,42 SAY "Enter"
	 @ 24,58 SAY "Ctl-End"
   SET COLOR TO &C7 +/ &C1
 GOTO 4
XPwater=pa6
SET COLOR TO 0/7
   SET COLOR TO &C1 / &C7 +
@ 16,71  SAY XPWATER   PICT "9999"
   SET COLOR TO &C7 +/ &C1
     CHRN=STR(INT(XPWATER),4)
     X1=72
     XP=0
       t=0
       CURSER2(X1,Y1,XP)
       XX1=X1+XP
       YY1=Y1
       T1=0
       TN1=0
       DO WHILE T1<>233
       T=0
       DO WHILE  T=0
       T=INKEY( )
       DO DSP2
       ENDDO

       DO CASE
	  case	T=19
		IF XP>=1
		XP=XP-1
		CURSER0(XX1,YY1)
		CURSER2(X1,Y1,XP)
		XX1=X1+XP
		YY1=Y1
		ENDIF
	  CASE	T=4
		IF XP<=2
		XP=XP+1
		CURSER0(XX1,YY1)
		CURSER2(X1,Y1,XP)
		XX1=X1+XP
		YY1=Y1
		ENDIF
	  CASE	 T=43 .OR.T=45 .OR.T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
	     XP=XP+1
	     IF TN1=0 .AND. XP=1
	     TN1=1
	     CHRN="    "
	     ENDIF
	     IF XP<4
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,4-XP)
   SET COLOR TO &C1 / &C7 +
	     IF  VAL(CHRN)>=1000
	     CHRN="    "
	     ENDIF
	     @ 16,71  SAY CHRN
   SET COLOR TO &C7 +/ &C1
	     CURSER0(XX1,YY1)
	     CURSER2(X1,Y1,XP)
	     XX1=X1+XP
	     YY1=Y1
	     ELSE
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
   SET COLOR TO &C1 / &C7 +
	     IF  VAL(CHRN)>=1000
	     CHRN="    "
	     ENDIF
	     @ 16,71  SAY CHRN
   SET COLOR TO &C7 +/ &C1
	     XP=XP-1
	     CURSER2(X1,Y1,XP)
	     XP=5
	     XX1=X1+XP
	     YY1=Y1
	     ENDIF
	  CASE T=13   .OR. T=23
	       T1=233
	     SELEC 5
	     GOTO 4
	  XPWATER =INT(VAL(CHRN))
	    REPL   PA6 WITH XPWATER
	    PWATER=XPWATER

@ 16,71  SAY  PWATER   PICT "9999"
	  CASE T=27
	     T1=233
@ 16,71  SAY  PWATER   PICT "9999"
       ENDCASE
       ENDDO


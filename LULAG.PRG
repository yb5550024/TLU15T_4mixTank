

*@20,2 CLEA TO	22,77
SCRNO=0
y1=0
yy1=0
*    SET COLOR TO &C6 / &C1
* @ 20,0 SAY "∥<<累計修正>>            累計車次     累計米數    　                         ∥"
 SET COLOR TO &C7 +/ &C1
*@ SCRNO,28  SAY LAGNO	  PICT "999999"
@ SCRNO,26  SAY LAGW	 PICT "9999.9"
*XLAGNO=LAGNO
XLAGW=LAGW
SET COLO TO &C1 / &C7 +
*@ SCRNO,28  SAY XLAGNO    PICT "999999"
@ SCRNO,26  SAY XLAGW	  PICT "9999.9"
SET COLO TO &C7 +/ &C1
     GETNO=2
     CHRN=STR(XLAGW,6,1)
     X1=26
     XP=0
     FGETNO=0
   DO WHILE   GETNO<=2
       t=0
       *CURSER2(X1,Y1,XP)
       XX1=X1+XP
       YY1=Y1
       T1=0
       TN1=0
       SET COLOR TO &C1 / &C7 +
       @ y1,x1 say  chrn
       set colo to gr + * /bl
       @ y1,x1+xp say  substr(chrn,XP+1,1)
       SET COLOR TO &C1 / &C7 +
       DO WHILE T1<>233
       T=0
       DO WHILE T=0
       T=INKEY( )
       DO DSP2
       DO LUSTP
       ENDDO
       DO CASE
	  case	T=19
		IF XP>=1
		XP=XP-1
		*CURSER0(XX1,YY1)
		*CURSER2(X1,Y1,XP)
		XX1=X1+XP
		YY1=Y1
		ENDIF
		SET COLOR TO &C1 / &C7 +
		@ y1,x1 say  chrn
		set colo to gr + * /bl
		@ y1,x1+xp say	substr(chrn,XP+1,1)
		SET COLOR TO &C1 / &C7 +
	  CASE	T=4
		IF GETNO=2
		LANPA=5
		ELSE
		LANPA=2
		ENDIF
		IF XP<=LANPA
		XP=XP+1
		*CURSER0(XX1,YY1)
		*CURSER2(X1,Y1,XP)
		XX1=X1+XP
		YY1=Y1
		ENDIF
		SET COLOR TO &C1 / &C7 +
		@ y1,x1 say  chrn
		set colo to gr + * /bl
		@ y1,x1+xp say	substr(chrn,XP+1,1)
		SET COLOR TO &C1 / &C7 +
	  CASE	 T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
	     XP=XP+1
	     IF TN1=0 .AND. XP=1
	     TN1=1
	     CHRN="      "
	     ENDIF
	     IF XP<6
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,6-XP)
SET COLO TO &C1 / &C7 +
	     @ SCRNO,X1  SAY CHRN
SET COLO TO &C7 +/ &C1
	     *CURSER0(XX1,YY1)
	     *CURSER2(X1,Y1,XP)
	     XX1=X1+XP
	     YY1=Y1
	     ELSE
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
SET COLO TO &C1 / &C7 +
	     @ SCRNO,X1  SAY CHRN
SET COLO TO &C7 +/ &C1
	     XP=XP-1
	     *CURSER2(X1,Y1,XP)
	     XP=5
	     XX1=X1+XP
	    yY1=Y1
	     ENDIF
	     SET COLOR TO &C1 / &C7 +
	     @ y1,x1 say  chrn
	     set colo to gr + * /bl
	     @ y1,x1+xp say  substr(chrn,XP+1,1)
	     SET COLOR TO &C1 / &C7 +
	  CASE T=13
	     FGETNO=GETNO+1
	       T1=233
	  CASE T=5
		IF GETNO>1
		FGETNO=GETNO+1
		T1=233
		ELSE
		FGETNO=3
		T1=233
		ENDIF
	  CASE T=27
	     T1=233
	     GETNO=6
	  CASE T=23
	     T1=233
	     T2=0
	    FGETNO=3
	  CASE T=27
	  T1=233
	  CASE T=24
	    T1=233
	    FGETNO=3
       *  case T=3 .AND. SCRCC=0
       *       T1=233
       *    FGETNO=3
       *  case T=18 .AND. SCRCC=0
       *       T1=233
       *    FGETNO=3
       ENDCASE
       ENDDO
SET COLO TO &C1 / &C7 +
       DO CASE
       CASE GETNO=1
      *     XLAGNO=INT(VAL(CHRN))
      * @ SCRNO,28  SAY XLAGNO	  PICT "999999"
       @ SCRNO,26  SAY XLAGW	 PICT "9999.9"
       CASE GETNO=2
	    SET DECIM TO 1
	    XLAGW=VAL(CHRN)
	    IF XLAGW>=10000
	      XLAGW=0
	      FGETNO=2
	    ENDIF
       @ SCRNO,26  SAY XLAGW	 PICT "9999.9"
       ENDCASE

       SET COLO TO &C7 +/ &C1
       DO CASE
	  CASE FGETNO=1
	   *   CHRN=STR(XLAGNO,4)
	       X1=28
	       XP=0
	       FGETNO=0
	       GETNO=1
	  CASE FGETNO=2
	       GETNO=2
	       CHRN=STR(XLAGW,6,1)
	       X1=42
	       XP=0
	       FGETNO=0
	  CASE FGETNO=3
	      LAGW=XLAGW
	   *  LAGNO=XLAGNO
	      SAVE TO LAGDATA9	ALL LIKE  LAG*
	      T1=233
	      GETNO=3
	      T=23
       ENDCASE

       ENDDO
       DO CASE

       CASE T=23
	   T=0
	   RETU
       ENDCASE



     T=0


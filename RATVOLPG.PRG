SET CURS OFF
sele 5
goto 4
  @ 0,10 SAY RATVOL  PICT "99"
  SET COLOR TO &C1 / &C7 +
 @ 0,10  SAY xyratvol  PICT  "99"
     CHRN=STR(xyratvol,2)
     X1=10
     XP=0
     FGETNO=1
       Y1=0
       YY1=Y1
       GETNO=1
   DO WHILE   GETNO =1
       t=0
       CURSER2(X1,Y1,XP)
       XX1=X1+XP
       YY1=Y1
       T1=0
       TN1=0
       DO WHILE T1<>233
       T=0
       DO WHILE T=0
       T=INKEY( )
*      DO DSP2
*      DO LUSTP
       ENDDO
  SET COLOR TO &C1 / &C7 +
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
		IF XP<=0
		XP=XP+1
		CURSER0(XX1,YY1)
		CURSER2(X1,Y1,XP)
		XX1=X1+XP
		YY1=Y1
		ENDIF
	  CASE	 ( T>=48  .AND. T<=57) .OR. (T=32 .AND. XP=0)
		XP=XP+1
		 IF TN1=0 .AND. XP=1
		 TN1=1
		 CHRN="   "
		 ENDIF
		IF XP<2
		CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,2-XP)
		@ Y1,X1  SAY CHRN
		CURSER0(XX1,YY1)
		CURSER2(X1,Y1,XP)
		XX1=X1+XP
		YY1=Y1
		ELSE
		CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
		@ Y1,X1  SAY CHRN
		XP=XP-1
		CURSER2(X1,Y1,XP)
		XP=1
		XX1=X1+XP
		YY1=Y1
		ENDIF

	  CASE T=13
	     GETNO=2
	       T1=233
	  CASE T=27
	       CHRN="  "
		 @ 0,10  SAY  CHRN
		CURSER2(X1,Y1,XP)
       ENDCASE
       ENDDO

       ENDDO
	    xyratvol=INT(VAL(CHRN))
	 if xyratvol>=2
	 xyratvol=2
	 elseif xyratvol<=1
	 xyratvol=1
	 endif
       @ 0,10 SAY xyratvol  PICT "99"
     T=0
      SET COLOR TO &C7 +/ &C1
		 @ 0,10  SAY  xyratvol	PICT  "99"
	    repl pa3 with xyratvol

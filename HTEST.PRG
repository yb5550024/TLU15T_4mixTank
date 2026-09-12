CLEAOUT()
X_PORT_C="2"
X_DI=0
DO  CASE
CASE X_DI=0
  DI_ADS=HEXTODEC("226")
CASE X_DI=1
  DI_ADS=HEXTODEC("2A0")
CASE X_DI=2
  DI_ADS=HEXTODEC("2A2")
ENDCASE
SET CURS OFF
SET COLOR TO &C7 +/ &C1
@  1,0 SAY "שÝשששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששß"
@  2,0 SAY "שרPORT 1 NO.     0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15שר"
if  engl=0
  @  3,0 SAY "שר       ¿י¥X    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
else
  @  3,0 SAY "שר     Output    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
endif
@  4,0 SAY "שרPORT 2 NO.     0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15שר"
if  engl=0
  @  5,0 SAY "שר       ¿י¥X    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
else
  @  5,0 SAY "שר     Output    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
endif
@  6,0 SAY "שרPORT 1 NO.     0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15שר"
if  engl=0
  @  7,0 SAY "שר       ¿י₪J                                                                 שר"
  @  8,0 SAY "שר¦C×ם¾ק  1   <<      >>       ¦C×ם¾ק  2   <<      >>                         שר"
else
 @  7,0 SAY "שר     Input                                                                  שר"
 @  8,0 SAY "שרPrinter 1   <<        >>     Printer 2   <<         >>                      שר"
endif
@  9,0 SAY "שדשששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששו"
@ 6,7 SAY X_DI+1  PICT "9"
SET COLOR TO &C6 / &C1
@ 23,0 SAY "¡ü                                                                            ¡ü"
if  engl=0
  @ 24,0 SAY "¡ü<<µwÊ^´ת¸ױ>> ¡פ¡ץ¡צ ¡קF8  PORT ¿ן¾Ü  ,  «צ '1' ON  '0' OFF , Ctrl-End.¡קµ²§פ¡ü"
  SET COLOR TO	gr +/ &C1
  @ 24,4  SAY "µwÊ^´ת¸ױ"
  @ 24,15 SAY "¡פ¡ץ¡צ ¡קF8"
  @ 24,46 SAY "1"
  @ 24,54 SAY "0"
  @ 24,63 SAY "Ctrl-End.¡ק"
else
  @ 23,0 SAY "¡ü<<Hardware Test>>¡פ¡ץ¡צ ¡ק F8 Port Select,  Press '1' ON  '0' OFF           ¡ü"
  @ 24,0 SAY "¡ü                 Ctrl-End.¡קExit                                            ¡ü"
  SET COLOR TO	gr +/ &C1
  @ 23,4  SAY "Hardware Test"
  @ 23,21 SAY "¡פ¡ץ¡צ ¡ק F8"
  @ 24,53 SAY "1"
  @ 24,61 SAY "0"
  @ 24,19 SAY "Ctrl-End.¡ק"
endif
SET COLOR TO &C7 +/ &C1
HPORT=2
PBIT=0
PTEST=1
SET COLOR TO &C1 / &C7 +
@ 2,16	SAY  PBIT  PICT "99"
SET COLOR TO &C7 +/ &C1
T=0
DO WHILE PTEST=1
  DO WHILE  T<>23 .AND. T<>4 .AND. T<>19.AND. T<>5 .AND. T<>24.AND. T<>48.AND. T<>49 .AND. T<>2 .AND. T<>-7
    DO DSP2
    FOR XI=0 TO 15
      @ 7,17+4*XI  SAY	DIX(DI_ADS,XI)	PICT "9"
    NEXT
    IF RDLPT(0)=144    .or.  RDLPT(0)=pnt_redy_code
      if  engl=0
	@ 8,17 SAY "¥¿±`"
      else
	@ 8,17 SAY "Normal"
      endif
    ELSE
      SET COLOR TO     R/ &C1
      if  engl=0
	@ 8,17 SAY "¿ש»~"
      else
	@ 8,17 SAY "Error "
      endif
      SET COLOR TO &C7 +/ &C1
    ENDIF
    IF RDLPT(1)=144 .or.  RDLPT(1)=pnt_redy_code
      if  engl=0
	@ 8,46 SAY "¥¿±`"
      else
	@ 8,46 SAY "Normal"
      endif
    ELSE
      SET COLOR TO     R/ &C1
      if  engl=0
	@ 8,46 SAY "¿ש»~"
      else
	@ 8,46 SAY "Error "
      endif
      SET COLOR TO &C7 +/ &C1
    ENDIF
    T=INKEY()
  ENDDO
  DO CASE
  case	T=-7
    X_DI=MOD(X_DI+1,3)
    IF X_PORT_C="2"
      SET COLOR TO &C7 +/ &C1
      @  3,17 SAY "0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
      @  4,0 SAY "שרPORT 3 NO.     0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15שר"
      @  5,17 SAY "0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
      @  6,0 SAY "שרPORT  "
      X_PORT_C="3"
      CLEAOUT()
    ELSE
      SET COLOR TO &C7 +/ &C1
      @  3,17 SAY "0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
      @  4,0 SAY "שרPORT 2 NO.     0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15שר"
      @  5,17 SAY "0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0שר"
      @  6,0 SAY "שרPORT  "
      X_PORT_C="2"
      CLEAOUT()
    ENDIF

    @ 6,7 SAY X_DI+1  PICT "9"
    t=0
  case	T=19
    SET COLOR TO &C7 +/ &C1
    @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
    SET COLOR TO &C1 / &C7 +
    PBIT=PBIT-1
    IF PBIT<0
      PBIT=15
    ENDIF
    SET COLOR TO &C1 / &C7 +
    @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
    SET COLOR TO &C7 +/ &C1
    T=0
  CASE	T=4
    SET COLOR TO &C7 +/ &C1
    @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
    SET COLOR TO &C1 / &C7 +
    PBIT=PBIT+1
    IF PBIT>15
      PBIT=0
    ENDIF
    SET COLOR TO &C1 / &C7 +
    @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
    SET COLOR TO &C7 +/ &C1
    T=0
  CASE T=5 .OR. T=24
    IF HPORT= 2
      SET COLOR TO &C7 +/ &C1
      @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
      SET COLOR TO &C1 / &C7 +
      HPORT=4
      SET COLOR TO &C1 / &C7 +
      @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
      SET COLOR TO &C7 +/ &C1
    ELSE
      SET COLOR TO &C7 +/ &C1
      @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
      SET COLOR TO &C1 / &C7 +
      HPORT=2
      SET COLOR TO &C1 / &C7 +
      @ HPORT,(16+4*PBIT)   SAY  PBIT PICT "99"
      SET COLOR TO &C7 +/ &C1
    ENDIF
    T=0
  CASE T=23 .OR. T=2
    PTEST=0
    CLEAOUT()
  CASE	T=48 .OR. T=49
    IF HPORT=2
      HDATA=VAL(CHR(T))
      DOUT(PBIT,HDATA)
      @ (HPORT+1),(17+4*PBIT)  SAY  HDATA   PICT "9"
    ELSE
      HDATA=VAL(CHR(T))
      IF  X_PORT_C="2"
	DOUT2(PBIT,HDATA)
      ELSE
	DOUT3(PBIT,HDATA)
      ENDIF
      @ (HPORT+1),(17+4*PBIT)  SAY  HDATA   PICT "9"
    ENDIF
    T=0
  ENDCASE
  DO  CASE
  CASE X_DI=0
    DI_ADS=HEXTODEC("226")
  CASE X_DI=1
    DI_ADS=HEXTODEC("2A0")
  CASE X_DI=2
    DI_ADS=HEXTODEC("2A2")
  ENDCASE
  inkey(.2)
ENDDO

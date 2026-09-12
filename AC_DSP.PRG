for x=1 to (klchn +kuchn)
SETLZA(x-1,A_M_NAME[x,7])
next

public send_txt1
PUBLIC SECR :={0,0,0}
&& [1] :=0   PARAME  SECRITE
&& SECR[2] :=0	  RATIO  SECRITE
&& SECR[3] :=0	  WEIGHT SECRITE
send_txt1 =chr(96) +chr(32) +chr(5) +chr(6) + chr(2)
UPTANK[5,1]=30
IF KOT=0
  DO  CASE
  CASE LCHTYPE=2
    SET COLOR TO &C4 / &C1
    SET COLOR TO &C4 / &C1
    UPTANK[5,1]=44
    @  2,UPTANK[5,1]-6	SAY "  «Ý©Õ¼Ñ"
    @  3,UPTANK[5,1]-6	SAY "¢z¢s¢w¢w¢{"
    @  4,UPTANK[5,1]-6	SAY "¢x¢x    ¢x"
    @  5,UPTANK[5,1]-6	SAY "¢x¢u¢w¢w¢}"
    @  6,UPTANK[5,1]-6	SAY "úUúV¢z¢w¢{"
    @  7,UPTANK[5,1]-6	SAY "¢x¢x¢x  ¢x"
    @  8,UPTANK[5,1]-6	SAY "¢x¢x¢u¢w¢t"
    @  9,UPTANK[5,1]-6	SAY "¢x¢x¢x  ¢x"
    @ 10,UPTANK[5,1]-6	SAY "¢x¢x¢u¢w¢t"
@ 11,UPTANK[5,1]-6  SAY "úUúV¢x  ¢x"
    @ 12,UPTANK[5,1]-6	SAY "¢x¢x¢u¢w¢t"
    @ 13,UPTANK[5,1]-6	SAY "    úG--úH"
    @ 13,UPTANK[5,1]-38  SAY "¢z¢w¢wúR¢w¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢q¢t"
    @ 14,UPTANK[5,1]-38  SAY "¢|¢w¢wúQ¢w¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢r¢}"
    *@ 12,0 SAY "      ¢z¢w¢wúR¢w¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢{"
    *@ 13,0 SAY "      ¢|¢w¢wúQ¢w¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢}"
    SET COLOR TO W+/&C1
    @  4,UPTANK[5,1]   say  UPTANK[4,1]  PICT "99"
    @  7,UPTANK[5,1]   say  UPTANK[1,1]   PICT "99"
    @  9,UPTANK[5,1]   say  UPTANK[2,1]    PICT "99"
    @ 11,UPTANK[5,1]   say  UPTANK[3,1]   PICT "99"
case UCHTYPE=16   .or.	UCHTYPE=17   .or.  UCHTYPE=19
      w0_en=1
      UPTANK[5,1]=31
    @  2,UPTANK[5,1]-4	SAY "  «Ý©Õ¼Ñ"
    @  3,UPTANK[5,1]-4	SAY "¢z¢s¢w¢{"
    @  4,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @  5,UPTANK[5,1]-4	SAY "¢x¢u¢w¢}"
    @  6,UPTANK[5,1]-4	SAY "úUúV¢w¢{"
    @  7,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @  8,UPTANK[5,1]-4	SAY "¢x¢u¢w¢t"
    @  9,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @ 10,UPTANK[5,1]-4	SAY "¢x¢u¢w¢t"
    @ 11,UPTANK[5,1]-4	SAY "úUúV  ¢x"
    @ 12,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @ 13,UPTANK[5,1]-4	SAY "  úG--úH"
    *@ 13,UPTANK[5,1]-33  SAY " ¢z¢wúR¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢qûÓ--úH"
    @ 13,UPTANK[5,1]-31  SAY " ¢z¢wúR¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢qúG--úH"
    @ 14,UPTANK[5,1]-31  SAY " ¢|¢wúQ¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢r¢}"
    *LINE(280+pflor1,90+pflor2,280+pflor1,165+pflor3,7)
    *LINE(281+pflor1,90+pflor2,281+pflor1,165+pflor3,7)
    *@ 12,0 SAY "      ¢z¢w¢wúR¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢{"
    *@ 13,0 SAY "      ¢|¢w¢wúQ¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢}"
    SET COLOR TO W+/&C1
    @  4,UPTANK[5,1]   say  UPTANK[4,1]  PICT "99"
    @  7,UPTANK[5,1]   say  UPTANK[1,1]   PICT "99"
    @  9,UPTANK[5,1]   say  UPTANK[2,1]    PICT "99"
    @ 11,UPTANK[5,1]   say  UPTANK[3,1]   PICT "99"
case	UCHTYPE=22
      w0_en=1
      UPTANK[5,1]=30
    @  2,UPTANK[5,1]-4	SAY "  «Ý©Õ¼Ñ"
    @  3,UPTANK[5,1]-4	SAY "¢z¢s¢w¢{"
    @  4,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @  5,UPTANK[5,1]-4	SAY "¢x¢u¢w¢}"
    @  6,UPTANK[5,1]-4	SAY "úUúV¢w¢{"
    @  7,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @  8,UPTANK[5,1]-4	SAY "¢x¢u¢w¢t"
    @  9,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @ 10,UPTANK[5,1]-4	SAY "¢x¢u¢w¢t"
    @ 11,UPTANK[5,1]-4	SAY "úUúV  ¢x"
    @ 12,UPTANK[5,1]-4	SAY "¢x¢x  ¢x"
    @ 13,UPTANK[5,1]-4	SAY "  úG--úH"
    @ 13,UPTANK[5,1]-30  SAY "¢z¢wúR¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢qúG--úH"
    @ 14,UPTANK[5,1]-30  SAY "¢|¢wúQ¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢r¢}"
    *LINE(280+pflor1,90+pflor2,280+pflor1,165+pflor3,7)
    *LINE(281+pflor1,90+pflor2,281+pflor1,165+pflor3,7)
    *@ 12,0 SAY "      ¢z¢w¢wúR¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢{"
    *@ 13,0 SAY "      ¢|¢w¢wúQ¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢}"
    SET COLOR TO W+/&C1
    @  4,UPTANK[5,1]   say  UPTANK[4,1]  PICT "99"
    @  7,UPTANK[5,1]   say  UPTANK[1,1]   PICT "99"
    @  9,UPTANK[5,1]   say  UPTANK[2,1]    PICT "99"
    @ 11,UPTANK[5,1]   say  UPTANK[3,1]   PICT "99"
  CASE LCHTYPE >=5
    SET COLOR TO &C4 / &C1
    SET COLOR TO &C4 / &C1
    do	case
    case LCHTYPE=5    .or. LCHTYPE=8   .or. LCHTYPE=30	  .or. LCHTYPE=9    .or. LCHTYPE=10
      UPTANK[5,1]=35
    case LCHTYPE=6  .or.  LCHTYPE=12
      if uchtype=18
	UPTANK[5,1]=40
	cnvrst=1
	uchtype_n=618
	W0DBF=0
      else
	UPTANK[5,1]=35
      endif
    case LCHTYPE=7  .or.  LCHTYPE=13   .or.    LCHTYPE=14  .or.    LCHTYPE=15  .or.    LCHTYPE=25
      w0_en=1
      UPTANK[5,1]=40
    case LCHTYPE=11
      UPTANK[5,1]=37
    case LCHTYPE=21
      UPTANK[5,1]=47
    case LCHTYPE=26    .or.  LCHTYPE=32
      UPTANK[5,1]=40
    endcase
    @  2,UPTANK[5,1]-6	SAY "  «Ý©Õ¼Ñ"
    @  3,UPTANK[5,1]-6	SAY "¢z¢s¢w¢w¢{"
    @  4,UPTANK[5,1]-6	SAY "¢x¢x    ¢x"
    @  5,UPTANK[5,1]-6	SAY "¢x¢u¢w¢w¢}"
    @  6,UPTANK[5,1]-6	SAY "úUúV¢z¢w¢{"
    @  7,UPTANK[5,1]-6	SAY "¢x¢x¢x  ¢x"
    @  8,UPTANK[5,1]-6	SAY "¢x¢x¢u¢w¢t"
    @  9,UPTANK[5,1]-6	SAY "¢x¢x¢x  ¢x"
    @ 10,UPTANK[5,1]-6	SAY "¢x¢x¢u¢w¢t"
    @ 11,UPTANK[5,1]-6	SAY "úUúV¢x  ¢x"
    @ 12,UPTANK[5,1]-6	SAY "¢x¢x¢u¢w¢t"
    @ 13,UPTANK[5,1]-6	SAY "    úG--úH"
    @ 13,UPTANK[5,1]-35  SAY " ¢z¢wúR¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢q¢t"
    @ 14,UPTANK[5,1]-35  SAY " ¢|¢wúQ¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢r¢}"
    *@ 12,0 SAY "      ¢z¢w¢wúR¢w¢w¢w¢w¢w¢w¢wúR¢w¢w¢w¢w¢{"
    *@ 13,0 SAY "      ¢|¢w¢wúQ¢w¢w¢w¢w¢w¢w¢wúQ¢w¢w¢w¢w¢}"
    SET COLOR TO W+/&C1
    @  4,UPTANK[5,1]   say  UPTANK[4,1]  PICT "99"
    @  7,UPTANK[5,1]   say  UPTANK[1,1]   PICT "99"
    @  9,UPTANK[5,1]   say  UPTANK[2,1]    PICT "99"
    @ 11,UPTANK[5,1]   say  UPTANK[3,1]   PICT "99"
  ENDCASE
ENDIF
SET COLOR TO &C2 / &C1
*@ 0,0	CLEA TO 22,79
SET COLOR TO &C5 +/ &C1
@ 0,0 SAY "°t¤ñ®e¶q:        ²Ö­p¦Ì¼Æ:             ¤é´Á:     ¦~   ¤ë   ¤é ¡@  ®É¶¡:         "
@ 1,0 SAY "                                                                                "
*@ 2,0 SAY "       ¥Û¢° ¥Û¢± ¥Û¢² ¬â¢° ¬â¢± ¡@¡@²M¤ô ¦B¤ô ¤ôªd¢° ¤ôªd¢± ¤ôªd¢² ÃÄ¾¯¢° ÃÄ¾¯¢±"
FOR  I=1  TO 12
  IF EMPTY(A_M_NAME[I,1]) <> .T.
    @ 2,A_M_NAME[I,2]  SAY  A_M_NAME[I,1]
  ENDIF
NEXT
SET COLOR TO &C2 / &C1
SELE 5
SET COLOR TO &C2 / &C1
@ 3,0 SAY "¡@                    "
M_SETN :=ARRAY(12,3)
M_SETN :={{4,7,"9999"},{4,12,"9999"},{4,17,"9999"},{4,22,"9999"},{4,27,"9999"},{4,36,"9999"},{4,41,"9999"},{4,47,"9999"},{4,54,"9999"},{4,61,"9999"},{4,67,"99.99"},{4,74,"99.99"}}
MACT_SETN :=ARRAY(12,3)
MACT_SETN :={{8,7,"9999"},{8,12,"9999"},{8,17,"9999"},{8,22,"9999"},{8,27,"9999"},{8,36,"9999"},{8,41,"9999"},{8,47,"9999"},{8,54,"9999"},{8,61,"9999"},{8,67,"99.99"},{8,74,"99.99"}}
goto 31
PUBLIC S_PORT,S2_PORT
S_PORT=int(pa2)
S2_PORT=int(pa6)
PCL745=99
SIO1_FAULT=1
SIO2_FAULT=1
if lchtype=6  .or. lchtype=16  .or.   (LCHTYPE=17)
   repl  PA3 WITH  10 ,PA4 WITH 3
   &&repl  PA1 WITH 745,PA3 WITH  10 ,PA4 WITH 3
endif
IF  (PA1=745)
  PCL745=SIO_IOCTL(S_PORT,PA3,PA4) && com1 9600 n 8 1	 pa1-pa6= 745,0,12,3
  IF PCL745=0
    PCL745=SIO_OPEN(PA2)
    s_port=int(pa2)
  ENDIF
  SIO1_FAULT=PCL745

  IF PCL745=0
  ELSE
    SET COLO  TO    GR+ /&C1
    @ 2,1  SAY	"!!! RS232¬É­± ¿ù»~ !!!"
    INKEY(5)
    SET COLO  TO    &C2 /&C1
  ENDIF
ENDIF
IF  (PA5=745)
  IF (PA5=745)
    PCL745=SIO_IOCTL(S2_PORT,PA7,PA8) && com1 9600 n 8 1    pa1-pa6= 745,0,12,3
    IF PCL745=0
      PCL745=SIO_OPEN(S2_PORT)
    ENDIF
    SIO2_FAULT=PCL745
  ENDIF

  IF PCL745=0
  ELSE
    SET COLO  TO    GR+ /&C1
    @ 2,1  SAY	"!!! RS232¬É­± ¿ù»~ !!!"
    INKEY(5)
    SET COLO  TO    &C2 /&C1
  ENDIF
ENDIF
GOTO 53
public DSP_DIV
DSP_DIV :=ARRAY(12)
FOR XDIV=1 TO 12
  CXD=ltrim(STR(XDIV,2,0))
  DSP_DIV[XDIV] := PA&CXD
  IF DSP_DIV[XDIV] <=0
    DSP_DIV[XDIV] := 1
    DO	CASE
    CASE UCHTYPE=7
      IF XDIV >=10
	DSP_DIV[XDIV] := 0.01
      ENDIF
    CASE UCHTYPE=8
      IF XDIV >=6
	DSP_DIV[XDIV] := 0.01
      ENDIF
    ENDCASE
  ENDIF
NEXT
GOTO 52
LED_IO =int(PA1)
IF PA1=512
  _OUT(LED_IO+3,128) && SET PPI 8255 PA PB PC OUT
  _OUT(LED_IO+0,0) && SET PPI 8255 PA PB PC OUT
  _OUT(LED_IO+1,255) && SET PPI 8255 PA PB PC OUT
  _OUT(LED_IO+2,0) && SET PPI 8255 PA PB PC OUT
  _OUT(576+3,128) && SET PPI 8255 PA PB PC OUT
  _OUT(576   +0,0) && SET PPI 8255 PA PB PC OUT
  _OUT(576   +1,255) && SET PPI 8255 PA PB PC OUT
  _OUT(576   +2,0) && SET PPI 8255 PA PB PC OUT
ENDIF
GOTO 50
x_plus1=int(pa1)
x_plus2=int(pa2)
x_plus3=int(pa3)
x_plus4=int(pa4)
x_plus5=int(pa5)
x_plus6=int(pa6)
x_plus7=int(pa7)
x_plus8=int(pa8)
x_plus9=int(pa9)
x_plus10=int(pa10)
x_plus11=int(pa11)
x_plus12=int(pa12)
GOTO 35
MTX1=PA1
MTY1=PA2
MTX2=PA3
MTY2=PA4
MCOLO=PA5
x_plus=PA6
h_MTB=PA7
X_MTB=PA8
GOTO 36
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,x_plus9,H_MTB,X_MTB)
IF PA10 <> 0
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA10,x_plus10,H_MTB,X_MTB)
endif
IF PA11 <> 0
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA11,x_plus11,H_MTB,X_MTB)
ENDIF
IF PA12 <>0
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA12,x_plus12,H_MTB,X_MTB)
ENDIF
DO CASE
CASE LCHTYPE=1
CASE LCHTYPE=2
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  IF PA8 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,X_PLUS8,H_MTB,X_MTB)
    LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA9 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,X_PLUS9,H_MTB,X_MTB)
    LINE((MTX1+PA9),(MTY1+MTY2)/2,(MTX2+PA9+x_plus9),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA10 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA10,X_PLUS10,H_MTB,X_MTB)
    LINE((MTX1+PA10),(MTY1+MTY2)/2,(MTX2+PA10+x_plus10),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA11 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA11,X_PLUS11,H_MTB,X_MTB)
    LINE((MTX1+PA11),(MTY1+MTY2)/2,(MTX2+PA11+x_plus11),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA12 <>0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA12,X_PLUS12,H_MTB,X_MTB)
    LINE((MTX1+PA12),(MTY1+MTY2)/2,(MTX2+PA12+x_plus12),(MTY1+MTY2)/2,MCOLO)
  ENDIF


  SET COLOR TO &C4 / &C1
CASE LCHTYPE=3
CASE LCHTYPE=4
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 60
  repl	pa1  with  3, pa2  with  2, pa3  with  2, pa4  with  1 , pa5  with  2, pa6  with  1 , pa7  with  1
  GOTO 36
  repl	pa4  with  122, pa5  with  162
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,X_W1,H_MTB,X_MTB)
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,X_W2,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+X_W1),(MTY1+MTY2)/2,MCOLO)
  LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
  LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)

  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+X_W2),(MTY1+MTY2)/2,MCOLO)
  LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1
CASE LCHTYPE=5
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE1
  LINE(PA1 + MTX1 +(MTX2-MTX1+x_plus1)/4,MTY1,PA1 + MTX1 +(MTX2+x_plus1-MTX1)/4,(MTY2+MTY1)/2,MCOLO)
  *VERTICAL LINE2
  LINE(PA1+(MTX1+MTX2+x_plus1)/2,MTY1,PA1+(MTX1+x_plus1+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  *VERTICAL LINE3
  LINE(PA1 + MTX1 +(MTX2-MTX1+x_plus1)*3/4,MTY1,PA1 + MTX1 +(MTX2+x_plus1-MTX1)*3/4,(MTY2+MTY1)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA5+(MTX1+MTX2+x_plus5)/2,MTY1,PA5+(MTX1+x_plus5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)

  IF PA8 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,X_PLUS8,H_MTB,X_MTB)
    LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA9 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,X_PLUS9,H_MTB,X_MTB)
    LINE((MTX1+PA9),(MTY1+MTY2)/2,(MTX2+PA9+x_plus9),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA10 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA10,X_PLUS10,H_MTB,X_MTB)
    LINE((MTX1+PA10),(MTY1+MTY2)/2,(MTX2+PA10+x_plus10),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA11 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA11,X_PLUS11,H_MTB,X_MTB)
    LINE((MTX1+PA11),(MTY1+MTY2)/2,(MTX2+PA11+x_plus11),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA12 <>0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA12,X_PLUS12,H_MTB,X_MTB)
    LINE((MTX1+PA12),(MTY1+MTY2)/2,(MTX2+PA12+x_plus12),(MTY1+MTY2)/2,MCOLO)
  ENDIF


  SET COLOR TO &C4 / &C1

CASE LCHTYPE=6
  IF UCHTYPE=6
    SECR[1] :=1
    SECR[2] :=1
    SECR[3] :=1
  ENDIF
  GOTO 60
  if uchtype=18
     * WATER_INPUT=0
  else
      *WATER_INPUT=1
  ENDIF
  IF PA1=0
    if uchtype=18
      REPL PA1 WITH 1,PA2 WITH 1,PA3 WITH 1,PA4 WITH 1,PA5 WITH 1,PA6 WITH 3,PA7 WITH 1
    else
      REPL PA1 WITH 1,PA2 WITH 1,PA3 WITH 1,PA4 WITH 1,PA5 WITH 2,PA6 WITH 1,PA7 WITH 2,PA8 WITH 1,PA9 WITH 1,PA10 WITH 1
    endif
  ENDIF
  *DO  LU12_DSP6
CASE LCHTYPE=7
  DO  LU12_DSP7
CASE LCHTYPE=8
  DO  LU12_DSP8
CASE LCHTYPE=9
  LED_IO=256
  WATER_INPUT=1
  DO  LU12_DSP9
CASE LCHTYPE=10
  LED_IO=256
* WATER_INPUT=1     modify
  *DO  LU12_DSP10
CASE LCHTYPE=11
  LED_IO=256
  WATER_INPUT=1  &&§t¤ô²vFUNCTION
  DO  LU12_DSP11
CASE LCHTYPE=12
  LED_IO=256
  WATER_INPUT=1  &&§t¤ô²vFUNCTION
  DO  LU12_DSP12
CASE LCHTYPE=13
  LED_IO=256
  WATER_INPUT=0  &&§t¤ô²vFUNCTION
  DO  LU12_DSP13
CASE LCHTYPE=14
  LED_IO=256
  WATER_INPUT=0  &&§t¤ô²vFUNCTION
  sele 5
  goto 33
  WATER_INPUT=pa8 &&§t¤ô²vFUNCTION
  *DO  LU12_DSP14
CASE LCHTYPE=15
  LED_IO=256
  WATER_INPUT=0  &&§t¤ô²vFUNCTION
  DO  LU12_DSP15

CASE LCHTYPE=16 .or.   (LCHTYPE=17)
  WATER_INPUT=0  &&§t¤ô²vFUNCTION
  IF LCHTYPE=16
    WATER_INPUT=1  &&§t¤ô²vFUNCTION
  ENDIF
  *DO  LU12_DSP16
CASE LCHTYPE=21
  LED_IO=256
  WATER_INPUT=1  &&§t¤ô²vFUNCTION
  *DO  LU12_DSP21
ENDCASE

DO CASE
CASE UCHTYPE=1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,X_W3,H_MTB,X_MTB)
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,X_W4,H_MTB,X_MTB)
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,X_W5,H_MTB,X_MTB)
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,X_W6,H_MTB,X_MTB)
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,X_w7,H_MTB,X_MTB)

  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+X_W3),(MTY1+MTY2)/2,MCOLO)
  LINE(PA3+(MTX1+X_W3+MTX2)/2,MTY1,PA3+(MTX1+X_W3+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+X_W4),(MTY1+MTY2)/2,MCOLO)

  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+X_W5),(MTY1+MTY2)/2,MCOLO)
  LINE(PA5+(MTX1+X_W5+MTX2)/2,MTY1,PA5+(MTX1+X_W5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+X_W6),(MTY1+MTY2)/2,MCOLO)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+X_W7),(MTY1+MTY2)/2,MCOLO)
  SET COLOR TO &C2 / &C1
CASE UCHTYPE=2
CASE UCHTYPE=3
ENDCASE
WEI_TANK()


SET COLOR TO &C5 +/ &C1
@ 14,52 SAY "²V¦X   ²V¦X   ¶}ªù   §t¤ô"
@ 15,0 SAY "1.³]©w°t¤ñ:              "
@ 16,0 SAY "2.³]©w¦Ì¼Æ:              "
@ 17,0 SAY "3.°õ¦æ¦Ì¼Æ:              "
@ 18,0 SAY "4.ºÏºÐ®e¶q:      ,000    "
X=_Tot_d_a[20,4] +2
*IF ACT_V  >0

if ( _Tot_d_a[10,X] <>	NIL )
  if ( _Tot_d_a[10,X] > 0)  .and.  star=1
    set colo to  w+ /n
    @ 15,12 say _Tot_d_a[18,X]	PICT  "9999"
    @ 16,12 say _Tot_d_a[10,X]	PICT  "99.9"
    @ 17,12 SAY  ACT_V	PICT  "99.9"
  ENDIF
ENDIF
SET COLOR TO &C2 / &C1
if  lchtype=21
  @ 13,51			      SAY "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{"
else
 *@ 13,47			  SAY "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{"
endif
@ 14,45 		      SAY "      ²V¦X   ²V¦X   ¶}ªù   §t¤ô ¢x"
@ 15,23 SAY "¢z¢w¢w¢{¢z¢w¢w¢{¢x          ®É¶¡   ¹q¬y   ®É¶¡   ­×¥¿ ¢x"
@ 16,23 SAY "¢x°_°Ê¢x¢x¤¤¤î¢x¢x  ³]©w­È                            ¢x"
@ 17,23 SAY "¢u¢w¢w¢t¢u¢w¢w¢t¢x  ¹ê»Ú­È     ¬í     ¢Ï     ¬í     KG¢x"
@ 18,23 SAY "¢|¢w¢w¢}¢|¢w¢w¢} úLúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúO "
if star=1
  SET COLOR TO R+/ &C1
  @ 15,23 SAY "¢z¢w¢w¢{"
  @ 16,23 SAY "¢x    ¢x"
  @ 17,23 SAY "¢uúTúW¢t"
  @ 18,23 SAY "¢|úSúX¢}"
  SET COLOR TO w+  / &C1
  @ 16,25 SAY "°_°Ê"
else
  SET COLOR TO &C2 / &C1
  @ 15,23 SAY "¢z¢w¢w¢{¢z¢w¢w¢{"
  @ 16,23 SAY "¢x°_°Ê¢x¢x¤¤¤î¢x"
  @ 17,23 SAY "¢u¢w¢w¢t¢uúTúW¢t"
  @ 18,23 SAY "¢|¢w¢w¢}¢|úSúX¢}"
endif
SET COLOR TO &C5 +/ &C1
@ 14,44 SAY  "       ²V¦X   ²V¦X   ¶}ªù   §t¤ô"
@ 15,44 SAY  "       ®É¶¡   ¹q¬y   ®É¶¡   ­×¥¿"
@ 16,43 SAY "³]©w­È                           "
@ 17,43 SAY "¹ê»Ú­È     ¬í     ¢Ï     ¬í     KG"
@ 19,0 SAY "¡ü                                                                            ¡ü"
*@ 20,0 SAY  "¡ü     ¥Û¢° ¥Û¢± ¥Û¢² ¬â¢° ¬â¢± ¡@²M¤ô ¦B¤ô ¤ôªd¢° ¤ôªd¢± ¤ôªd¢² ÃÄ¾¯¢° ÃÄ¾¯¢±¡ü"
*pppK
XPH=7
XPH0=0
FOR  I=1  TO 12
  IF EMPTY(A_M_NAME[I,1]) <> .T.
    @ 20,A_M_NAME[I,2]	SAY  A_M_NAME[I,1]
  ENDIF
NEXT
DO DSP_SPACIAL
XPH=7
XPH0=0


@ 21,0 SAY "¡ü¹sÂI                                                                        ¡ü"
@ 22,0 SAY "¡ü¸¨®t                                                                        ¡ü"
SET COLOR TO &C6 / &C1
&& 11/6/2002 @ 23,0 SAY "¡ü¤U¦¸§Ç¸¹:           ¨®¸¹:           °t¤ñ¥N¸¹:        °õ¦æ¦Ì¼Æ:     §~«×:    ¡ü"
@ 23,0 SAY "¡ü¤U¦¸§Ç¸¹:           ¨®¸¹:           °t¤ñ¥N¸¹:        °õ¦æ¦Ì¼Æ:     §~«×:    ¡ü"
@ 23,0 SAY   "¡ü¤U¦¸§Ç¸¹:        ¨®¸¹:        °t¤ñ¥N¸¹:      ¦Ì¼Æ:    §~«×:     ³sÄò¦¸¼Æ:  ¡ü"
SET COLOR TO W+  / &CF
@ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦¥\¯à«ü¥Ü F1-§t¤ô²v   F2-°t¤ñ F3-¥X¨®      F4-°Ñ¼Æ F5-³øªí¦C¦L      ¡ü"
SET COLOR TO  gr +/ &CF
@ 24,2	SAY "¡ô¡õ"
@ 24,20 SAY "F1"
@ 24,32 SAY "F2"
@ 24,40 SAY "F3"
@ 24,53 SAY "F4"
@ 24,61 SAY "F5"
SET COLOR TO &C7 +/ &C1
@ 0,26 say  lagw  pict "9999.9"
@ 0,45 SAY  SUBSTR(DTOC(DATE()),7,4)
@ 0,52 SAY  SUBSTR(DTOC(DATE()),1,2)
@ 0,57 SAY  SUBSTR(DTOC(DATE()),4,2)
@ 0,71 SAY  TIME()
IF W0_EN=1
  SET COLOR TO R / &C1
ENDIF
@ 0,10 SAY RATVOL  PICT "9.9"
SET COLOR TO &C7 +/ &C1
@ 16,52 SAY  PMIXTM PICT "99"
@ 16,58 SAY  PMIXA  PICT "999"
@ 16,65 SAY  PMIXOP PICT "99"
sele 5
goto 2
goto 2
FOR I=1 TO 12
  IF EMPTY(A_M_NAME[I,1]) <> .T.
    IX_C=ALLTRIM(STR(I,2,0))
    XX_N=PA&IX_C
    T_C=ALLTRIM(A_M_NAME[I,3])
    IF XX_N <>0
      @ 21,A_M_NAME[I,2]   SAY	XX_N   PICT "&T_C"
    ENDIF
  ENDIF
NEXT
goto 1
FOR I=1 TO 12
  IF EMPTY(A_M_NAME[I,1]) <> .T.
    IX_C=ALLTRIM(STR(I,2,0))
    XX_N=PA&IX_C
    T_C=ALLTRIM(A_M_NAME[I,3])
    IF XX_N <>0
      @ 22,A_M_NAME[I,2]   SAY	XX_N   PICT "&T_C"
    ENDIF
  ENDIF
NEXT
x=INT(DISKSPACE( DAA )/1024)
X_0=STR(X,4,0)
X_1="K"
IF X>9999
  X=X/1024
  X_1="M"
  X_0=STR(X,4,0)
  IF X>9999
    X=X*10/1024
    X_0=STR(X,4,1)
    X_1="G"
  ENDIF
ENDIF
@ 18,11  SAY x_0
@ 18,15  SAY x_1
@ 23,13 SAY ASCANO  PICT "99999"
@ 23,25 SAY ACARNO
@ 23,42 SAY ARATNO  PICT "9999"
@ 23,52 SAY AVUSE   PICT "99.9"
@ 23,61 SAY ATANDO  PICT "9999"
set dele off
*RETU
IF PLOT_E=1
  IF (TANKSTP >0 )   .AND.  (TANKSTP <5)
    DO PLOT_MIXAS
  ENDIF
ENDIF
































&&-----------------------------------------------------------------------------
&&PROCEDURE   LU12_DSP6
&&PARAMETERS  P1,P2,P3
&&  SET COLOR TO &C2 / &C1
&&  @ 10,0 SAY "½S¯¯­È"
&&  SET COLOR TO &C5 +/ &C1
&&  @  8,0 SAY "¹ê»Ú­È"
&&  @ 10,0 SAY "½S¯¯­È"
&&  GOTO 37
&&  MTX1=PA1
&&  MTY1=PA2
&&  MTX2=PA3
&&  MTY2=PA4
&&  MCOLO=PA5
&&  x_plus=PA6
&&  h_MTB=PA7
&&  X_MTB=PA8
&&  GOTO 39
&&  X_W1=PA1
&&  X_W2=PA2
&&  X_W3=PA3
&&  X_W4=PA4
&&  X_W5=PA5
&&  X_W6=PA6
&&  X_W7=PA7
&&  X_W8=PA8
&&  X_W9=PA9
&&  X_W10=PA10
&&  X_W11=PA11
&&  GOTO 51
&&  x_plus1=int(pa1)
&&  x_plus2=int(pa2)
&&  x_plus3=int(pa3)
&&  x_plus4=int(pa4)
&&  x_plus5=int(pa5)
&&  x_plus6=int(pa6)
&&  x_plus7=int(pa7)
&&  x_plus8=int(pa8)
&&  x_plus9=int(pa9)
&&  x_plus10=int(pa10)
&&  x_plus11=int(pa11)
&&  x_plus12=int(pa12)
&&  GOTO 38
&& *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
&& *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
&& *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
&&  SET COLOR TO &C4 / &C1
&&
&&  GOTO 37
&&  MTX1=PA1
&&  MTY1=PA2
&&  MTX2=PA3
&&  MTY2=PA4
&&  MCOLO=PA5
&&  x_plus=PA6
&&  h_MTB=PA7
&&  X_MTB=PA8
&&  GOTO 38
&&  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
&&  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)
&&
&&  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
&&  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)
&&
&&  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
&&  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)
&&
&&  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
&&  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
&&  *VERTICAL LINE
&&  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
&&  if uchtype=18
&&    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus2,H_MTB,X_MTB)
&&    LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
&&    *c1c2c3
&&    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
&&    LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)
&&    *VERTICAL LINE
&&    LINE(PA6 + MTX1 +(MTX2-MTX1+x_plus6)/3,MTY1,PA6 + MTX1 +(MTX2+x_plus6-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
&&    LINE(PA6 + MTX1 +(MTX2-MTX1+x_plus6)*2/3,MTY1,PA6 + MTX1 +(MTX2+x_plus6-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
&&    *ag
&&    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
&&    LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
&&  else
&&    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
&&    LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
&&    *VERTICAL LINE
&&    LINE(PA5+(MTX1+MTX2+x_plus5)/2,MTY1,PA5+(MTX1+x_plus5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
&&
&&    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
&&    LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)
&&
&&    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
&&    LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
&&    *VERTICAL LINE
&&    LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
&&
&&    IF PA8 <> 0
&&	M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,X_PLUS8,H_MTB,X_MTB)
&&	LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
&&    ENDIF
&&    IF PA9 <> 0
&&	M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,X_PLUS9,H_MTB,X_MTB)
&&	LINE((MTX1+PA9),(MTY1+MTY2)/2,(MTX2+PA9+x_plus9),(MTY1+MTY2)/2,MCOLO)
&&    ENDIF
&&    IF PA10 <> 0
&&	M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA10,X_PLUS10,H_MTB,X_MTB)
&&	LINE((MTX1+PA10),(MTY1+MTY2)/2,(MTX2+PA10+x_plus10),(MTY1+MTY2)/2,MCOLO)
&&    ENDIF
&&    IF PA11 <> 0
&&	M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA11,X_PLUS11,H_MTB,X_MTB)
&&	LINE((MTX1+PA11),(MTY1+MTY2)/2,(MTX2+PA11+x_plus11),(MTY1+MTY2)/2,MCOLO)
&&    ENDIF
&&    IF PA12 <>0
&&	M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA12,X_PLUS12,H_MTB,X_MTB)
&&	LINE((MTX1+PA12),(MTY1+MTY2)/2,(MTX2+PA12+x_plus12),(MTY1+MTY2)/2,MCOLO)
&&    ENDIF
&&  ENDIF
&&
&&
&&  SET COLOR TO &C4 / &C1
&&RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP7
PARAMETERS  P1,P2,P3


  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  &&G1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  &&G2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  &&G3
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  &&S1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  &&S2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA5+(MTX1+MTX2+x_plus5)/2,MTY1,PA5+(MTX1+x_plus5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  &&W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)

  &&C1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  &&C2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,X_PLUS8,H_MTB,X_MTB)
  LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)

  &&C3
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,X_PLUS9,H_MTB,X_MTB)
  LINE((MTX1+PA9),(MTY1+MTY2)/2,(MTX2+PA9+x_plus9),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA9+(MTX1+MTX2+x_plus9)/2,MTY1,PA9+(MTX1+x_plus9+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  &&AE
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA10,X_PLUS10,H_MTB,X_MTB)
  LINE((MTX1+PA10),(MTY1+MTY2)/2,(MTX2+PA10+x_plus10),(MTY1+MTY2)/2,MCOLO)

  IF PA11 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA11,X_PLUS11,H_MTB,X_MTB)
    LINE((MTX1+PA11),(MTY1+MTY2)/2,(MTX2+PA11+x_plus11),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA12 <>0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA12,X_PLUS12,H_MTB,X_MTB)
    LINE((MTX1+PA12),(MTY1+MTY2)/2,(MTX2+PA12+x_plus12),(MTY1+MTY2)/2,MCOLO)
  ENDIF


  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   D_REMOTE
PARAMETERS  P1,P2,P3
@ 21,78   SAY REMOTE[11] PICT "99"
DO WHILE  T=0
  T=INKEY( )
  if t >0
    DO	CASE
    CASE T=23
      EXIT
    CASE T=4
      REMOTE[11]=REMOTE[11]+1
      IF REMOTE[11] >10
	REMOTE[11]=1
      ENDIF
      @ 21,78	SAY REMOTE[11] PICT "99"
    CASE T=19
      REMOTE[11]=REMOTE[11]-1
      IF REMOTE[11] <1
	REMOTE[11]=10
      ENDIF
      @ 21,78	SAY REMOTE[11] PICT "99"
    CASE T=27
	x=REMOTE[11]
	REMOTE[x]=0
    OTHERWISE
      EXIT
    ENDCASE
  endif
  x= din(14)
  if x <> remote[12]
    remote[12]=x
    if x=1
       x=remote[11]
       remote[x]=remote[x] + 1
    endif
  endif
  x= din(11)
  if x <> remote[13]
    remote[13]=x
    if x=1
       x=remote[11]
       remote[x]=remote[x] - 1
    endif
  endif
  DO DSP2
  T=0
ENDDO
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP8
PARAMETERS  P1,P2,P3
  led_io=512
  _OUT(LED_IO+3,128) && SET PPI 8255 PA PB PC OUT
  _OUT(LED_IO+0,0) && SET PPI 8255 PA PB PC OUT
  _OUT(LED_IO+1,255) && SET PPI 8255 PA PB PC OUT
  _OUT(LED_IO+2,0) && SET PPI 8255 PA PB PC OUT
  _OUT(576+3,128) && SET PPI 8255 PA PB PC OUT
  _OUT(576   +0,0) && SET PPI 8255 PA PB PC OUT
  _OUT(576   +1,255) && SET PPI 8255 PA PB PC OUT
  _OUT(576   +2,0) && SET PPI 8255 PA PB PC OUT



  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  *G1G2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE1
  LINE(PA1 + MTX1 +(MTX2-MTX1+x_plus1)/2,MTY1,PA1 + MTX1 +(MTX2+x_plus1-MTX1)/2,(MTY2+MTY1)/2,MCOLO)


  *VERTICAL LINE3

  *S1S2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE2
  LINE(PA2+(MTX1+MTX2+x_plus2)/2,MTY1,PA2+(MTX1+x_plus2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)



  *W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  IF  UCHTYPE=8
    * C1C2
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
    LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
    *VERTICAL LINE
    LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
    *C3C4
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
    LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
    *VERTICAL LINE
    LINE(PA5+(MTX1+MTX2+x_plus5)/2,MTY1,PA5+(MTX1+x_plus5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

    *AG1
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
    LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)

    *AG2
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
    LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)

  ELSE
    *C1
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
    LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)

    *C2
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
    LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
    *VERTICAL LINE
    *LINE(PA4+(MTX1+MTX2+x_plus6)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
    *C3C4
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
    LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)
    *VERTICAL LINE
    LINE(PA6+(MTX1+MTX2+x_plus6)/2,MTY1,PA6+(MTX1+x_plus6+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

    *AG1
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
    LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)

    *AG2
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
    LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  ENDIF


  SET COLOR TO &C4 / &C1


RETU
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP91
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)

  *c1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)



  *c2c3
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *ag1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
  LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)

  *ag2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,x_plus9,H_MTB,X_MTB)
  LINE((MTX1+PA9),(MTY1+MTY2)/2,(MTX2+PA9+x_plus9),(MTY1+MTY2)/2,MCOLO)


  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP9
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)

  *c1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)



  *c2c3
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *ag1.ag2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
  LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA8+(MTX1+MTX2+x_plus8)/2,MTY1,PA8+(MTX1+x_plus8+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP10
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)

    * C1C2
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
    LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)
    *VERTICAL LINE
    LINE(PA6+(MTX1+MTX2+x_plus6)/2,MTY1,PA6+(MTX1+x_plus6+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
    *C3C4
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
    LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
    *VERTICAL LINE
    LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

    *AG1
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
    LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP11
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA5+(MTX1+MTX2+x_plus5)/2,MTY1,PA5+(MTX1+x_plus5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  IF PA8 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,X_PLUS8,H_MTB,X_MTB)
    LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA9 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA9,X_PLUS9,H_MTB,X_MTB)
    LINE((MTX1+PA9),(MTY1+MTY2)/2,(MTX2+PA9+x_plus9),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA10 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA10,X_PLUS10,H_MTB,X_MTB)
    LINE((MTX1+PA10),(MTY1+MTY2)/2,(MTX2+PA10+x_plus10),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA11 <> 0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA11,X_PLUS11,H_MTB,X_MTB)
    LINE((MTX1+PA11),(MTY1+MTY2)/2,(MTX2+PA11+x_plus11),(MTY1+MTY2)/2,MCOLO)
  ENDIF
  IF PA12 <>0
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA12,X_PLUS12,H_MTB,X_MTB)
    LINE((MTX1+PA12),(MTY1+MTY2)/2,(MTX2+PA12+x_plus12),(MTY1+MTY2)/2,MCOLO)
  ENDIF


  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP12
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11
  GOTO 51
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38
  ****G1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  ****G2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  ****S1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  ****S2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  ****W12
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA5+(MTX1+MTX2+x_plus5)/2,MTY1,PA5+(MTX1+x_plus5+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  ****C1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)

  ****C23
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *ag1.ag2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
  LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA8+(MTX1+MTX2+x_plus8)/2,MTY1,PA8+(MTX1+x_plus8+MTX2)/2,(MTY2+MTY1)/2,MCOLO)


  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP13
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11

GOTO 51
x_plus1=int(pa1)
x_plus2=int(pa2)
x_plus3=int(pa3)
x_plus4=int(pa4)
x_plus5=int(pa5)
x_plus6=int(pa6)
x_plus7=int(pa7)
x_plus8=int(pa8)
x_plus9=int(pa9)


  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  *LINE(PA4+(MTX1+MTX2+x_plus4)/2,MTY1,PA4+(MTX1+x_plus4+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)

  *c1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA6,x_plus6,H_MTB,X_MTB)
  LINE((MTX1+PA6),(MTY1+MTY2)/2,(MTX2+PA6+x_plus6),(MTY1+MTY2)/2,MCOLO)



  *c2c3
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA7,x_plus7,H_MTB,X_MTB)
  LINE((MTX1+PA7),(MTY1+MTY2)/2,(MTX2+PA7+x_plus7),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA7+(MTX1+MTX2+x_plus7)/2,MTY1,PA7+(MTX1+x_plus7+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *ag
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA8,x_plus8,H_MTB,X_MTB)
  LINE((MTX1+PA8),(MTY1+MTY2)/2,(MTX2+PA8+x_plus8),(MTY1+MTY2)/2,MCOLO)
  SET COLOR TO &C4 / &C1
RETU
&&-----------------------------------------------------------------------------
PROCEDURE   LU12_DSP15
PARAMETERS  P1,P2,P3
  SET COLOR TO &C2 / &C1
  @ 10,0 SAY "½S¯¯­È"
  SET COLOR TO &C5 +/ &C1
  @ 4,0 SAY "³]©w­È"
  @  8,0 SAY "¹ê»Ú­È"
  @ 10,0 SAY "½S¯¯­È"
  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 39
  X_W1=PA1
  X_W2=PA2
  X_W3=PA3
  X_W4=PA4
  X_W5=PA5
  X_W6=PA6
  X_W7=PA7
  X_W8=PA8
  X_W9=PA9
  X_W10=PA10
  X_W11=PA11

GOTO 51
x_plus1=int(pa1)
x_plus2=int(pa2)
x_plus3=int(pa3)
x_plus4=int(pa4)
x_plus5=int(pa5)
x_plus6=int(pa6)
x_plus7=int(pa7)
x_plus8=int(pa8)
x_plus9=int(pa9)


  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  GOTO 38
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,MTY1,MTX1+PA1+(X_W1+MTX2-MTX1)*2/3,(MTY2+MTY1)/2,MCOLO)
 *LINE(PA2+(MTX1+X_W2+MTX2)/2,MTY1,PA2+(MTX1+X_W2+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  SET COLOR TO &C4 / &C1

  GOTO 37
  MTX1=PA1
  MTY1=PA2
  MTX2=PA3
  MTY2=PA4
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 38

  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA1,x_plus1,H_MTB,X_MTB)
  LINE((MTX1+PA1),(MTY1+MTY2)/2,(MTX2+PA1+x_plus1),(MTY1+MTY2)/2,MCOLO)

  *VERTICAL LINE1
  LINE(PA1 + MTX1 +(MTX2-MTX1+x_plus1)/4,MTY1,PA1 + MTX1 +(MTX2+x_plus1-MTX1)/4,(MTY2+MTY1)/2,MCOLO)
  *VERTICAL LINE2
  LINE(PA1+(MTX1+MTX2+x_plus1)/2,MTY1,PA1+(MTX1+x_plus1+MTX2)/2,(MTY2+MTY1)/2,MCOLO)
  *VERTICAL LINE3
  LINE(PA1 + MTX1 +(MTX2-MTX1+x_plus1)*3/4,MTY1,PA1 + MTX1 +(MTX2+x_plus1-MTX1)*3/4,(MTY2+MTY1)/2,MCOLO)



  *W
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA2,x_plus2,H_MTB,X_MTB)
  LINE((MTX1+PA2),(MTY1+MTY2)/2,(MTX2+PA2+x_plus2),(MTY1+MTY2)/2,MCOLO)

  *c1c2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA3,x_plus3,H_MTB,X_MTB)
  LINE((MTX1+PA3),(MTY1+MTY2)/2,(MTX2+PA3+x_plus3),(MTY1+MTY2)/2,MCOLO)
  *VERTICAL LINE
  LINE(PA3+(MTX1+MTX2+x_plus3)/2,MTY1,PA3+(MTX1+x_plus3+MTX2)/2,(MTY2+MTY1)/2,MCOLO)

  *ag1
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA4,x_plus4,H_MTB,X_MTB)
  LINE((MTX1+PA4),(MTY1+MTY2)/2,(MTX2+PA4+x_plus4),(MTY1+MTY2)/2,MCOLO)

  *ag2
  M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA5,x_plus5,H_MTB,X_MTB)
  LINE((MTX1+PA5),(MTY1+MTY2)/2,(MTX2+PA5+x_plus5),(MTY1+MTY2)/2,MCOLO)
  SET COLOR TO &C4 / &C1
RETU
* -----------------------------------------------------------------------------
  FUNCTION WEI_TANK
  PARAMETERS  WEICH0,WEICH1
  divn :=ARRAY(12)
  GOTO 60
  FOR I=1 TO  12
    IX_C=ALLTRIM(STR(I,2,0))
    DIVN[I] :=PA&IX_C
    IF DIVN[I] <=0
      DIVN[I] :=1
    ENDIF
  NEXT
  GOTO 35
  SET COLOR TO &C2 / &C1
  IF PA1 >40
    @ 10,0 SAY "½S¯¯­È"
  ELSE
    @ 10,0 SAY "½S¯¯"
  ENDIF
  SET COLOR TO &C5 +/ &C1
  IF PA1 >40
    @ 4,0 SAY "³]©w­È"
    @  8,0 SAY "¹ê»Ú­È"
    @ 10,0 SAY "½S¯¯­È"
  ELSE
    @ 4,0 SAY "³]©w"
    @  8,0 SAY "¹ê»Ú"
    @ 10,0 SAY "½S¯¯"
  ENDIF
  MTX1=PA1
  MTX2=PA3
  MCOLO=PA5
  x_plus=PA6
  h_MTB=PA7
  X_MTB=PA8
  GOTO 37
  MTY1=PA2
  MTY2=PA4
  GOTO 50
  x_plus1=int(pa1)
  x_plus2=int(pa2)
  x_plus3=int(pa3)
  x_plus4=int(pa4)
  x_plus5=int(pa5)
  x_plus6=int(pa6)
  x_plus7=int(pa7)
  x_plus8=int(pa8)
  x_plus9=int(pa9)
  x_plus10=int(pa10)
  x_plus11=int(pa11)
  x_plus12=int(pa12)
  SET COLOR TO &C4 / &C1
  GOTO 38
  XRST=PA1
  GOTO 36
  Y=0
  FOR I=1 TO  KLCHN+KUCHN
    IX_E=ALLTRIM(STR(I,2,0))
    IX_C=ALLTRIM(STR(I+Y,2,0))
    Y=Y+DIVN[I]-1
    IX_D=ALLTRIM(STR(I+Y,2,0))
    X_PLUS=PA&IX_D -PA&IX_C + X_PLUS&IX_D
    M_TANK(MTX1,MTY1,MTX2,MTY2,MCOLO,PA&IX_C,x_plus,H_MTB,X_MTB)
    LINE((MTX1+PA&IX_C),(MTY1+MTY2)/2,(MTX2+PA&IX_C+x_plus),(MTY1+MTY2)/2,MCOLO)

    IF (XRST <= 0)
      X_N1=PA&IX_C
      GOTO 38
      REPL PA&IX_E  WITH  X_N1
      GOTO 51
      REPL PA&IX_E  WITH  X_PLUS
      GOTO 36
    ENDIF
  *VERTICAL LINE
    IF DIVN[I] >1
      XP= +(MTX2-MTX1+x_plus)/DIVN[I]
      XP0=PA&IX_C + MTX1
      FOR J=1 TO  (DIVN[I]-1)
	LINE(XP * J + XP0 ,MTY1,XP * J + XP0,(MTY2+MTY1)/2,MCOLO)
      NEXT
    ENDIF
  NEXT
  SET COLOR TO &C4 / &C1
RETU
* -----------------------------------------------------------------------------

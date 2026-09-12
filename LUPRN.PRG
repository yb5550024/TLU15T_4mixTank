#INCLUDE "T15_COM.H"
#INCLUDE "\clip52e\INCLUDE\INKEY.CH"
CLEA
RAR1=0
SET TALK OFF
set  cons on
SET CURS ON
SET ESCA ON
SET CONF OFF
SELEC 4
use
USE adtprn
GOTO TOP
DO WHILE   .NOT. EOF()
if empty(alltrim(RATNO))=.t. .or.  COUNT=0
  DELE
ENDIF
SKIP
ENDDO
IF RECCOUNT() =0
  APPEN BLANK
ENDIF
PACK
SELEC 2
use
USE W1
SELEC 4
addnew=0
xtime0=TIME()
XMIXSEC0=PMIXTM
xscano=SPACE(9)
   SET COLOR TO &C5 +/ &C1
   d_pos:=array(10)
   d_pos:={4,15,23,34,37,40,43,49,62,68}
   &&d_TYPE:=array(10)
   d_TYPE={"XXXXXXXXX" ,"!XXXXXXXXX","","99","99","99","9999",FSUBSTR("XXXX",RATNO_WID,"X",0) ,"99.9","999"}
   A_FIELD={"SCANO","TANDO","CARNO","CDATE","CHOUR","CMIN","CSEC","RATNO","COUNT","MIXSEC"}
   &&A_XFIELD={"XSCANO","XTANDO","XCARNO","XCDATE","XCHOUR","XCMIN","XCSEC","XRATNO","XCOUNT","XMIXSEC"}
   AREDNAME={"XscaNO","XCARNO","XCDATE","XCHOUR","XCMIN","XCSEC","XTANDO","XRATNO","XCOUNT","XMIXSEC"}
   @ 0,2 SAY " 日期 :    年    月    日   時間 :                     程式設計>>>威匠科技  "
  @ 1,2  SAY " 含水修正                    <<  各車資料輸入  >>                           "
   @ 2,2 SAY "┌────────────────────────────────────┐"
  @ 3,2  SAY "│ 序號      車 號   月/日/年   時 分 秒 坍度  配比號碼  執行米數 拌合秒數│"
  @ 4,2  SAY "├                                                                        ┤"
   @ 5,2 SAY "│                                                                        │"
   @ 6,2 SAY "│                                                                        │"
   @ 7,2 SAY "│                                                                        │"
   @ 8,2 SAY "│                                                                        │"
   @ 9,2 SAY "│                                                                        │"
  @ 10,2 SAY "│                                                                        │"
  @ 11,2 SAY "│                                                                        │"
  @ 12,2 SAY "│                                                                        │"
  @ 13,2 SAY "│                                                                        │"
  @ 14,2 SAY "│                                                                        │"
  @ 15,2 SAY "│                                                                        │"
  @ 16,2 SAY "│                                                                        │"
  @ 17,2 SAY "│                                                                        │"
  @ 18,2 SAY "│                                                                        │"
  @ 19,2 SAY "│                                                                        │"
  @ 20,2 SAY "│                                                                        │"
  @ 21,2 SAY "└────────────────────────────────────┘"
   SET COLOR TO &C7 +/ &C1
  @ 0,10 SAY  SUBSTR(DTOC(DATE()),7,2)
  @ 0,17 SAY  SUBSTR(DTOC(DATE()),1,2)
  @ 0,23 SAY  SUBSTR(DTOC(DATE()),4,2)
  @ 0,37 SAY  TIME()
  LSK=0
      GOTO TOP
      SCRNO=5
  DO WHILE  RAR1<>23
      @ 5,4 CLEA  TO 20,75
     DO WHILE .NOT. EOF()   .AND.  SCRNO <21
       @ SCRNO,d_pos[1]   SAY scaNO   PICT "XXXXXXXXX"
       @ SCRNO,d_pos[2]  SAY CARNO
       @ SCRNO,d_pos[3]  SAY CDATE
       @ SCRNO,d_pos[4]  SAY CHOUR
       @ SCRNO,d_pos[5]  SAY CMIN
       @ SCRNO,d_pos[6]  SAY CSEC
       @ SCRNO,d_pos[7]  SAY TANDO
       @ SCRNO,d_pos[8]  SAY RATNO
       @ SCRNO,d_pos[9]  SAY COUNT
       D_T=D_TYPE[10]
       @ SCRNO,d_pos[10] SAY MIXSEC  PICT  "&D_T"
       xtime0=fctoTime(chour,cmin,csec)
       IF MIXSEC >0
	 XMIXSEC0=MIXSEC
       ENDIF
       SKIP
       SCRNO=SCRNO+1
    ENDDO
     XGET=1
     SKIP(-1)
     SCRNO=SCRNO-1
     IF LSK=24	.OR. LSK=3 .OR. LSK=13
       SKIP -(SCRNO-5)
       SCRNO=5
     ENDIF
     x_inpn=1
 DO WHILE XGET=1
     XCARNO=CARNO
     xscano=SCANO
     IF ADDNEW<>1
       XCDATE=CDATE
       XCHOUR=CHOUR
       XCMIN=CMIN
       XCSEC=CSEC
       ADDNEW=0
     ELSE
       ADDNEW=2
       xtime0=TIME()
       SKIP (-1)
       IF .NOT. BOF()
	 XCDATE=CDATE
	 XSCANO=ALLTRIM(SCANO)
	 IF LEN(XSCANO)>4
	   XSCANO_1=SUBSTR(XSCANO,1,LEN(XSCANO)-3)
	   XSCANO_2=SUBSTR("000" +ALLTRIM(STR(VAL(SUBSTR(XSCANO,-3,3))+1)),-3,3)
	   XSCANO=XSCANO_1 +XSCANO_2
	 ENDIF
	 xtime0=fctoTime(chour,cmin,csec)
	 IF  (nTimeSUB(Time(),xTIME0) > ((COUNT/RATVOL) *MIXSEC))
	    XTIME0=TIME()
	 ELSE
	   xtime0=fctoTime(chour,cmin,csec)
	   &&FUNCTION  TimeAdd(xTime,xSecAdd,ch,cm,cs)
	   XSN=(INT(COUNT/RATVOL) +1 )*MIXSEC
	   XSN=XSN + MOD(RAND() * SECONDS(),15)
	   CH="  "
	   CM="  "
	   CS="  "
	   xtime0= TimeAdd(xTime0,xSN,ch,cm,cs)

	 ENDIF
	 SKIP
       ELSE
	 XCDATE=DATE()
	 XCDATE=CDATE
	 XCHOUR=CHOUR
       ENDIF
       &&FUNCTION  nTimeSUB(xTime1,xTIME2)
       XCHOUR=VAL(SUBSTR(XTIME0,1,2))
       XCMIN=VAL(SUBSTR(XTIME0,4,2))
       XCSEC=VAL(SUBSTR(XTIME0,7,2))
     ENDIF
     XRATNO=RATNO
     XCOUNT=COUNT
     XTANDO=TANDO
     XMIXSEC=MIXSEC
     &&xtime1=fctoTime(ch,cm,cs)
     if xmixsec=0
       XMIXSEC=pmixtm
     endif
   SET COLOR TO &C6 / &C1
  &&@ 22,1 SAY "  Esc- 查詢或其它選折擇                                             "
  @ 22,1 SAY "Esc- 查詢或其它選折擇,↑↓上下筆                                    "
	SET COLOR TO  gr +/ &C1
  @ 22,1 SAY "  Esc"
  IF EMPTY(SUBSTR(DTOC(XCDATE),1,2))
    XCDATE=DATE()
  ENDIF
  IF  XCHOUR=0
    XCHOUR=VAL(SUBSTR(TIME(),1,2))
  ENDIF
  IF  XCMIN=0
    XCMIN=VAL(SUBSTR(TIME(),4,2))
  ENDIF
  IF  XCSEC=0
    XCSEC=VAL(SUBSTR(TIME(),7,2))
  ENDIF
  SET  COLO  TO  GR+  / &C1
  PWATER=INT((WDATA(15)-2048)*WATER_ADJ/2048)
  IF  WATER_INPUT=0
    @ 1,11 SAY	PWATER	PICT "9999"
  ENDIF
  set  cons  on
  SET CURS ON
   SET COLOR TO &C7 +/ &C1, gr+ /r
    IF EMPTY(XSCANO)=.T.
      XscaNO = fgetserno(9,x_inpn)
      &&FUNCTION  TimeAdd(xTime,xSecAdd,ch,cm,cs)
      &&xtime1=fctoTime(ch,cm,cs)
      *xtime1=TimeAdd(xTime0,xmixsec0,xchour,xcmin,XCSEC)
    ENDIF
    &&d_TYPE={"XXXXXXXXX" ," "," ","99","99","99","9999"," ","99.9","999"}
     &&@ SCRNO,d_pos[1] GET XscaNO    PICT "XXXXXXXXX"
     &&@ SCRNO,d_pos[2] GET XCARNO
     &&@ SCRNO,d_pos[3] GET XCDATE
     &&@ SCRNO,d_pos[4] GET XCHOUR	PICT "99"
     &&@ SCRNO,d_pos[5] GET XCMIN	PICT "99"
     &&@ SCRNO,d_pos[6] GET XCSEC	PICT "99"
     &&@ SCRNO,d_pos[7] GET XTANDO	PICT "9999"
     &&@ SCRNO,d_pos[8] GET XRATNO
     &&@ SCRNO,d_pos[9] GET XCOUNT	PICT "99.9"
     &&@ SCRNO,d_pos[10] GET XMIXSEC	  PICT "&D_T"
     SET KEY K_UP TO P_KUP
     SET KEY K_DOWN  TO P_KUP
     SET KEY K_ESC  TO P_KUP
     DSP_DATA(SCRNO,D_POS,AREDNAME,D_TYPE)
     FOR READ_N=1  TO	10
	C_R=AREDNAME[READ_N]
	D_T=D_TYPE[READ_N]
	@ SCRNO,d_pos[READ_N] GET  &C_R PICT "&D_T"
       D_T=D_TYPE[READ_N]
       READ
       @ SCRNO,d_pos[READ_N] SAY   &C_R PICT "&D_T"
       do case
       case  read_n=8 .AND. (UPDATED()=.T. .OR.  ADDNEW<>0)
	 X_RET=0
	 fseek_C(2,"RATNO",XRATNO,"MIXSEC",@X_RET)
	 IF  X_RET>0
	    XMIXSEC=X_RET
	    C_R=AREDNAME[10]
	    D_T=D_TYPE[10]
	    @ SCRNO,d_pos[10] SAY   &C_R PICT "&D_T"
	 ENDIF
	 ADDNEW=0
       endcase
       LSK=LASTKEY()
       DO  CASE
       CASE  LSK=K_UP
	 IF READ_N=1
	   EXIT
	 ELSE
	    READ_N=READ_N-2
	 ENDIF
       CASE  LSK=K_DOWN
	  EXIT
       CASE   LSK=K_ESC
	  LSK=0
	  EXIT
       OTHERWISE
	  LSK=0
       ENDCASE
     NEXT
     SET KEY K_UP TO
     selec 2
     XRATNO=FSUBSTR(XRATNO,RATNO_WID," ",0)
     XRATNO=upper(XRATNO)
     IF EMPTY(ALLTRIM(XRATNO))=.F.
       LOCA FOR  ALLTRIM(RATNO)==ALLTRIM(XRATNO)
     ELSE
       GOTO BOTT
       SKIP
     ENDIF
     IF EOF()
       SET COLOR TO &C6 / &C1
       @ 22,1 SAY "      >>>>>>無此配比,請重新輸入<<<<<<<<<按任一鍵開始                        "
       SET COLOR TO &C7 +/ &C1
       AWAIT=" "
       @ 22,1 GET AWAIT
       READ
     ELSE
	 REPL  MIXSEC  WITH XMIXSEC
     ENDIF
     SELEC 4
     &&lsk=0
	SET COLOR TO &C6 / &C1
  @ 22,1 SAY "Pg-Up上頁,  Pg-Dn下頁, ↑↓上下筆,  Esc- 查詢配比,  Ｆ１列印,  Ctl-End  結束 "
	SET COLOR TO  gr +/ &C1
	  @ 22,1  SAY "Pg-Up"
	  @ 22,13 SAY "Pg-Dn"
	  @ 22,24 SAY "↑↓"
	  @ 22,37 SAY "Esc"
	  @ 22,53 SAY "Ｆ１"
	  @ 22,64 SAY "Ctl-End"
    SET COLOR TO &C7 +/ &C1
    PWDSPN=SECONDS()
     do while  LSK<>13 .AND. LSK<>24 .AND. LSK<>5  .AND. LSK<>18 .and. LSK<>3  .and. LSK<>27 .and. LSK<>23 .AND. LSK<>28
       LSK=INKEY()
       SET  COLO  TO  GR+  / &C1
       iF  (WATER_INPUT=0) .AND. (SECONDS()- PWDSPN > 0.5)
	 @ 1,11 SAY  PWATER  PICT "9999"
	 PWATER=INT((WDATA(15)-2048)*WATER_ADJ/2048)
	 PWDSPN=SECONDS()
       ENDIF
     ENDDO
    SET COLOR TO &C7 +/ &C1
     DO CASE
	CASE LSK=13 .OR. LSK=24
	  x_inpn=val(substr(xscano,-3,3)) +1
	   SELE 2
	   IF .NOT. EOF()
	   SELE 4
	     SAVE_DATE(A_FIELD,{XSCANO,XTANDO,XCARNO, XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC })
	     &&REPL SCANO WITH XSCANO,TANDO WITH XTANDO,CARNO  WITH XCARNO,CDATE WITH XCDATE,CHOUR WITH XCHOUR,CMIN WITH XCMIN,CSEC WITH XCSEC,RATNO WITH  XRATNO,COUNT WITH XCOUNT,MIXSEC WITH XMIXSEC
	     @ SCRNO,d_pos[1]  SAY scaNO  PICT "XXXXXXXXX"
	     @ SCRNO,d_pos[2]  SAY CARNO
	     @ SCRNO,d_pos[3]  SAY CDATE
	     @ SCRNO,d_pos[4]  SAY CHOUR
	     @ SCRNO,d_pos[5]  SAY CMIN
	     @ SCRNO,d_pos[6]  SAY CSEC
	     @ SCRNO,d_pos[7]  SAY TANDO
	     @ SCRNO,d_pos[8]  SAY RATNO
	     @ SCRNO,d_pos[9]  SAY COUNT
	     @ SCRNO,d_pos[10]	SAY MIXSEC
	     SKIP
	     SCRNO=SCRNO+1
	     IF EOF()
	       APPEN  BLAN
	       addnew=1
	     ENDIF
	     IF SCRNO>20
		SCRNO=5
		XGET=0
	     ENDIF
	   ENDIF
	   SELE 4
	CASE LSK=5
	     SAVE_DATE(A_FIELD,{XSCANO,XTANDO,XCARNO, XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC })
	     &&REPL SCANO WITH XSCANO,TANDO WITH XTANDO,CARNO  WITH XCARNO,CDATE WITH XCDATE,CHOUR WITH XCHOUR,CMIN WITH XCMIN,CSEC WITH XCSEC,RATNO WITH  XRATNO,COUNT WITH XCOUNT,MIXSEC WITH XMIXSEC
	     @ SCRNO,d_pos[1]  SAY scaNO  PICT "XXXXXXXXX"
	     @ SCRNO,d_pos[2]  SAY CARNO
	     @ SCRNO,d_pos[3]  SAY CDATE
	     @ SCRNO,d_pos[4]  SAY CHOUR
	     @ SCRNO,d_pos[5]  SAY CMIN
	     @ SCRNO,d_pos[6]  SAY CSEC
	     @ SCRNO,d_pos[7]  SAY TANDO
	     @ SCRNO,d_pos[8]  SAY RATNO
	     @ SCRNO,d_pos[9]  SAY COUNT
	     @ SCRNO,d_pos[10]	SAY MIXSEC
	     IF SCRNO=5
		SKIP (-15)
		IF  BOF()
	       * SKIP
		ENDIF
		XGET=0
	     ELSE
	      SCRNO=SCRNO-1
	      SKIP (-1)
	     ENDIF
	 CASE  LSK=18
      @ 5,4 CLEA  TO 20,75




	    SAVE_DATE(A_FIELD,{XSCANO,XTANDO,XCARNO,XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC })
	    &&& REPL  SCANO WITH XSCANO,TANDO WITH XTANDO,CARNO  WITH XCARNO,CDATE WITH XCDATE,CHOUR WITH XCHOUR,CMIN WITH XCMIN,CSEC WITH XCSEC,RATNO WITH  XRATNO,COUNT WITH XCOUNT,
	     @ SCRNO,d_pos[1]  SAY scaNO  PICT "XXXXXXXXX"
	     @ SCRNO,d_pos[2]  SAY CARNO
	     @ SCRNO,d_pos[3]  SAY CDATE
	     @ SCRNO,d_pos[4]  SAY CHOUR
	     @ SCRNO,d_pos[5]  SAY CMIN
	     @ SCRNO,d_pos[6]  SAY CSEC
	     @ SCRNO,d_pos[7]  SAY TANDO
	     @ SCRNO,d_pos[8]  SAY RATNO
	     @ SCRNO,d_pos[9]  SAY COUNT
	     SKIP (-(SCRNO+10))
	     SCRNO=5
	     XGET=0
	 CASE LSK=3
      @ 5,4 CLEA  TO 20,75
	     SAVE_DATE(A_FIELD,{XSCANO,XTANDO,XCARNO,XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC })
	     &&REPL  SCANO WITH XSCANO,TANDO WITH XTANDO,CARNO	WITH XCARNO,CDATE WITH XCDATE,CHOUR WITH XCHOUR,CMIN WITH XCMIN,CSEC WITH XCSEC,RATNO WITH  XRATNO,COUNT WITH XCOUNT
	     @ SCRNO,d_pos[1]  SAY scaNO  PICT "XXXXXXXXX"
	     @ SCRNO,d_pos[2]  SAY CARNO
	     @ SCRNO,d_pos[3]  SAY CDATE
	     @ SCRNO,d_pos[4]  SAY CHOUR
	     @ SCRNO,d_pos[5]  SAY CMIN
	     @ SCRNO,d_pos[6]  SAY CSEC
	     @ SCRNO,d_pos[7]  SAY TANDO
	     @ SCRNO,d_pos[8]  SAY RATNO
	     @ SCRNO,d_pos[9]  SAY COUNT
	     SKIP  (20-SCRNO)
	     SCRNO=5
	     XGET=0
	  CASE	LSK=23
	     SAVE_DATE(A_FIELD,{XSCANO,XTANDO,XCARNO,XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC })
	     &&REPL SCANO WITH XSCANO,CARNO  WITH XCARNO,CDATE WITH XCDATE,CHOUR WITH XCHOUR,CMIN WITH XCMIN,CSEC WITH XCSEC,RATNO WITH  XRATNO,COUNT WITH XCOUNT
	     @ SCRNO,d_pos[1]  SAY scaNO  PICT "XXXXXXXXX"
	     @ SCRNO,d_pos[2]  SAY CARNO
	     @ SCRNO,d_pos[3]  SAY CDATE
	     @ SCRNO,d_pos[4]  SAY CHOUR
	     @ SCRNO,d_pos[5]  SAY CMIN
	     @ SCRNO,d_pos[6]  SAY CSEC
	     @ SCRNO,d_pos[7]  SAY TANDO
	     @ SCRNO,d_pos[8]  SAY RATNO
	     @ SCRNO,d_pos[9]  SAY COUNT
	    CLEA
	     RETU
	  CASE LSK=27
	    SAVE SCRE TO SCRMA1
	    set curs off
	    prnrec=recno()
	    do RATEN
	    *DO REP
	    SELEC 4
	    use
	    USE adtprn
	    SELEC 2
	    use
	    USE W1
	    sele 4
	    goto prnrec
	    set curs on
	    REST SCRE FROM SCRMA1
	  case	 LSK=28
	     SAVE_DATE(A_FIELD,{XSCANO,XTANDO,XCARNO,XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC })
	     &&REPL  SCANO WITH XSCANO,TANDO WITH XTANDO,CARNO	WITH XCARNO,CDATE WITH XCDATE,CHOUR WITH XCHOUR,CMIN WITH XCMIN,CSEC WITH XCSEC,RATNO WITH  XRATNO,COUNT WITH XCOUNT
	     SAVE SCRE TO SCRMA1
	     x_inpn=val(substr(xscano,-3,3)) +1
	     *set curs off
	     prnrec=recno()
	     SET COLOR TO &C5 4 &C1
	     @ 22,1 SAY " 車次      資料列印中      <車次 = 0  者不列印,列印後資料自動取消>       "
	     SET COLOR TO &C7 +/ &C1
	     DO LUPRN1
	     SELEC 4
	     use
	     USE adtprn
	     PACK
	     SELEC 2
	     use
	     USE W1
	     sele 4
	     goto prnrec
	     set curs on
	     REST SCRE FROM SCRMA1
	     *set curs off
	     RETU
	   ENDCASE
	 ENDDO XGET=1

  ENDDO RAR1<>23
&&----------------------------------
PROCEDURE  SAVE_DATE
PARAMETERS  A_FIELD,A_DATA
 A_DATA2 :=ARRAY(10)
 A_DATA2 :={XSCANO,XTANDO,XCARNO,XCDATE,XCHOUR,XCMIN,XCSEC,XRATNO,XCOUNT,XMIXSEC}
 FOR X=1 TO LEN(A_FIELD)
    C_F=A_FIELD[X]
    REPL  &C_F	WITH  A_DATA2[X]
 NEXT
RETURN
&&----------------------------------
PROCEDURE  P_KUP(CPROC,NLINE,CVAR)
  CLEA GETS


RETURN
&&----------------------------------
PROCEDURE  DSP_DATA(XPOSIY,A_POSX,A_VAR,A_TYPE)
  FOR XN=1  TO	 LEN(A_VAR)
    C_R=A_VAR[XN]
    D_T=A_TYPE[XN]
    @ XPOSIY,A_posX[XN] SAY   &C_R PICT "&D_T"
  NEXT
RETURN
&&----------------------------------
FUNCTION  TimeAdd(xTime,xSecAdd,ch,cm,cs)
  totsec=val(substr(Xtime,1,2))* 3600
  totsec=totsec+val(substr(Xtime,4,2))* 60
  totsec=totsec+val(substr(Xtime,7,2))
  totsec=totsec+xsecadd
  nx=int(totsec/3600)
  ch=str(nx)
  totsec=totsec-nx *3600
  nx=int(totsec/60)
  cm=str(nx)
  nx=mod(totsec,60)
  cs=str(nx)
  time=fctoTime(ch,cm,cs)
return time
&&----------------------------------
FUNCTION  nTimeSUB(xTime1,xTIME2)
  totsec=val(substr(Xtime1,1,2))* 3600
  totsec=totsec+val(substr(Xtime1,4,2))* 60
  totsec=totsec+val(substr(Xtime1,7,2))

  totsec2=val(substr(Xtime2,1,2))* 3600
  totsec2=totsec2+val(substr(Xtime2,4,2))* 60
  totsec2=totsec2+val(substr(Xtime2,7,2))
  NTIME=totsec-totsec2

return Ntime

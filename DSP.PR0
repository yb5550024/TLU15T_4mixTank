&& 2019/11/8 _wnoreset ¬â¥Û­p¶q¶¶Äò§ó§ï
&& par.80.pa5	 WNORESET="32415"  ­p¶q¶¶§Ç  G1-G2-S1-S2-S3

&& 2019/10/6  ¸¨®t§Y®É§@¥Î

&&  MDY_Cout220151024	¤ôªdoutput  double

&&  alu16->tlu15
&&  lu12  l=4 u=1   all  uppper   G1.G2.G3  S1.S2  W.Ice  C1. C2.C3  AE1 AE2
&&-----------------------------------------------------------------------------
&&   copy  from  \alu15
&&   FUNCTION  DspSetData



*SELE 1 Y   LUW1
*SELE 2 Y    W1.DBF
*SELE 3 Y    SCA.DBF
*SELE 4 Y   ADTPRN.DBF
*SELE 5 Y   PAR.DBF
*SELE 6 Y   MNI_OUT
*SELE 7 Y   SA.DBF
*SELE 8 Y    MLDSP.DBF
*SELE 9 Y    ¼È¥ÎÀÉ
*SELE 10   DBF12_1.DBF	 car data
*SELE 11   DBF15.DBF	 COMPANY
*SELE 12   DBF16.DBF	 EMPLYEE
*SELE 13   DBF17.DBF	 ADDRESS
*SELE 14   DBF_LAG.DBF
*SELE 15   CHK_BILL
*SELE 16   DISCO
*SELE 17   W0.DBF
*SELE 18   SA1.DBF
*SELE 19   LUW0.DBF


&&#define  dfRaten_2Page
&&#define  dfTLU15
&&#define  dfTLU16






SET CENT ON
set deci  to 3
#INCLUDE "SIO_TXT.CH"
#INCLUDE "\clip52e\INCLUDE\INKEY.CH"
*#INCLUDE "\CLIPLIB\MY_FUNC2.PRG"
#INCLUDE "\CLIPLIB\KEYBJ.CH"

REST FROM indata_a  ADDITIVE
store	21 to	 dima_len
&& #define   TLU15S    && ONE I/O CARD	dio=16

#INCLUDE "T15_COM.H"


&& #define	MarkVer "TLU15_190715"  && 2-2 U   S2¤£¥¿±`­p¶q¤¤¤î MDY LUSTP
#ifdef	dfTLU16
  #define      MarkVer "TLU16A_191006"  && 2-2 U   S2¤£¥¿±`­p¶q¤¤¤î MDY LUSTP
  STOR "TLU16A"  TO VERSION
#else
  #define      MarkVer "TLU15A_191006"  && 2-2 U   S2¤£¥¿±`­p¶q¤¤¤î MDY LUSTP
  STOR "TLU15A"  TO VERSION
#endif



#ifdef	TLU15S
   #INCLUDE "P998.h"  && ONE I/O CARD
   #INCLUDE   "io_P02.h"   && P02
   #define	DIO16	16
   && dio=  16

#else
  #ifdef  TLU15S03
    VERSION = "VER:TLU15_S03_170409"
    #INCLUDE   "ioS_P03.h"   && ¦Á¤î ¤j¦r¹õ
    #define	 DIO16	 16
    &&dio=  16

  #else
    #ifdef  TLU15S05
      #INCLUDE	 "ioS_P05.h"   && ¦Á¤î©|©û ¤j¦r¹õ  NO41      2017/04/09
      #define	   DIO16   16
      &&dio=  16
      VERSION = "VER:TLU15_S05_170409"
      COM_E=0
    #else
      #ifdef  TLU15S06
	VERSION = "VER:TLU15_S06_190715"
	#INCLUDE   "ioS_P06.h"   && NO.63
	#define      DIO16   16
	&&dio=	16
      #else  && 2 IO CARD
	*#ifdef  TLU15A
	#INCLUDE "alu16.h"
	#INCLUDE   "io_NOR.h"   &&p01
	#define      DIO48  48
      #endif
    #endif
  #endif
#endif


&& #ifdef  TLU15S
&&   #INCLUDE "P998.h"  && ONE I/O CARD
&&   #INCLUDE	"io_P02.h"   && P02
&&   #define	  dio	16
&& #else
&&   #ifdef  TLU15S03
&&     #INCLUDE   "ioS_P03.h"   && ¦Á¤î ¤j¦r¹õ
&&     #define	    dio   16
&&   #else     && 2 IO CARD
&&     *#ifdef	TLU15A
&&     #INCLUDE "alu16.h"
&&     #INCLUDE   "io_NOR.h"   &&p01
&&     #define	    dio  48
&&   #endif
&& #endif


#define  _WnoReset




x=kind

x=rdnB_data(100)
x=rdn_data(100)
*d1/first=272 +2n(n=0 to 12)
*d2/lastt=304 +2n(n=0 to 12)
*d2/lastt=304 +2n(n=0 to 12)
tot_data :=array(17)
digitout :=array(2,16)
   digitout[1,1]= doa00
   digitout[1,2]= doa01
   digitout[1,3]= doa02
   digitout[1,4]= doa03
   digitout[1,5]= doa04
   digitout[1,6]= doa05
   digitout[1,7]= doa06
   digitout[1,8]= doa07
   digitout[1,9]= doa08
   digitout[1,10]=doa09
   digitout[1,11]=doa10
   digitout[1,12]=doa11
   digitout[1,13]=doa12
   digitout[1,14]=doa13
   digitout[1,15]=doa14
   digitout[1,16]=doa15

   digitout[2,1]= dob00
   digitout[2,2]= dob01
   digitout[2,3]= dob02
   digitout[2,4]= dob03
   digitout[2,5]= dob04
   digitout[2,6]= dob05
   digitout[2,7]= dob06
   digitout[2,8]= dob07
   digitout[2,9]= dob08
   digitout[2,10]=dob09
   digitout[2,11]=dob10
   digitout[2,12]=dob11
   digitout[2,13]=dob12
   digitout[2,14]=dob13
   digitout[2,15]=dob14
   digitout[2,16]=dob15
&& REST FROM indata_a  ADDITIVE

PARDO=1
isnew=1
DO WHILE PARDO=1
  do  ini_data
  do  ini_data1
  *clea memory
  DO  GET_DATA1
  *REST FROM indata_a  ADDITIVE


  sele 5
  USE
  USE PAR

  GOTO 22
  RAM_DISK=SUBSTR("ABCDEFG",PA1,1) +":"
  ROM_N=PA4

  #ifndef  TLU15S05
  if rom_n=1   .and. isnew=1
      IF FILE("C:\W0.DBF")=.F.
	COPY FILE W0.DBF   TO c:\W0.DBF
      ENDIF
      IF FILE("C:\DISCO.DBF")=.F.
	COPY FILE DISCO.DBF   TO c:\DISCO.DBF
      ENDIF
    IF FILE("c:\SA.DBF")=.f.
      copy file sa.dbf	to  c:\sa.dbf
    ENDIF
    IF FILE("c:\SA1.DBF")=.f.
      COPY FILE SA1.DBF   TO c:\SA1.DBF
    ENDIF
    IF FILE("c:\LUW1.DBF")=.f.
      COPY FILE LUW1.DBF   TO c:\LUW1.DBF
    ENDIF

    IF FILE("c:\PAR.DBF")=.f.
      COPY FILE PAR.DBF   TO c:\PAR.DBF
    ENDIF
    IF FILE("c:\W1.DBF")=.f.
      COPY FILE W1.DBF	 TO C:\W1.DBF
    ENDIF
    IF FILE("c:\ADTPRN.DBF")=.f.
      COPY FILE ADTPRN.DBF   TO C:\ADTPRN.DBF
    ENDIF
    IF FILE("c:\SCA.DBF")=.f.
      COPY FILE SCA.DBF   TO C:\SCA.DBF
    ENDIF
    IF FILE("c:\LAGDATA9.MEM")=.f.
      COPY FILE LAGDATA9.MEM TO C:\LAGDATA9.MEM
    ENDIF
    IF FILE("c:\INDATA_A.MEM")=.f.
      COPY FILE INDATA_A.MEM TO C:\INDATA_A.MEM
    ENDIF
    IF FILE("c:\TOT.DBF")=.f.
      COPY FILE tot.DBF   TO C:\TOT.DBF
    ENDIF
    IF FILE("c:\DSP.DBF")=.f.
      COPY FILE DSP.DBF   TO C:\DSP.DBF
    ENDIF
    IF FILE("c:\MLDSP.DBF")=.f.
      COPY FILE MLDSP.DBF   TO C:\MLDSP.DBF
    ENDIF
    IF FILE("c:\MNI_OUT.DBF")=.f.
      COPY FILE MNI_OUT.DBF   TO C:\MNI_OUT.DBF
    ENDIF
    IF FILE("c:\PAR1.DBF")=.f.
      COPY FILE PAR1.DBF   TO C:\PAR1.DBF
    ENDIF
    IF	PA2=1
      COM_E=1
      IF FILE("C:\dbf15.dbf")=.f.
	COPY FILE dbf15.dbf  TO C:\dbf15.dbf
      ENDIF
      IF FILE("c:\dbf16.dbf")=.f.
	COPY FILE dbf16.dbf TO C:\dbf16.dbf
      ENDIF
      IF FILE("c:\dbf17.dbf")=.f.
	COPY FILE dbf17.dbf TO C:\dbf17.dbf
      ENDIF
      IF FILE("c:\dbf_LAG.dbf")=.f.
	COPY FILE dbf_LAG.dbf TO C:\dbf_LAG.dbf
      ENDIF
      IF FILE("c:\dbf12_1.dbf")=.f.
	COPY FILE dbf12_1.dbf TO C:\dbf12_1.dbf
      ENDIF
    ELSE
      COM_E=0
    ENDIF
    GOTO 29
    IF PA1=66
      IF FILE("c:\CHK_BILL.dbf")=.f.
	COPY FILE CHK_BILL.dbf TO C:\CHK_BILL.dbf
      ENDIF
    ENDIF
  endif
  #endif



  isnew =0
  IF ROM_N=1
    CLOS ALL

    #ifndef  TLU15S05
    set defa  to c:\
    #endif
    set defa  to c:\
    sele 5
    USE
    USE PAR
    REST FROM LAGDATA9	ADDITIVE
    IF LAGDATE<>DATE()
      LAGW=0
      LAGDATE=DATE()
      IF ( repno_cont=0 )
	LAG_REPNO1=fgetserno(9,1)
	LAG_REPNO=fgetserno(9,1)
      endif
    ENDIF
    *LAG_REPNO1="1"
    *LAG_REPNO="1"
    ASCANO=FSUBSTR(LAG_REPNO1,-9," ",0)
    SAVE TO LAGDATA9 ALL LIKE LAG*
  ENDIF
  for i=1 to   kind
    ix=alltrim(str(i,2,0))
    STPN&IX=1
  next
  STORE  1 TO	A_PRESS,U_PRESS,L_PRESS,E_STORE,last_pcs

  STOR	0 TO  UPOV,DNOV,UPOVSTP,TANKSTP,MIXTM,PAUSE_TM,MIXTM_S,DROPTM_S,DROPTM,uchtype_n,dspch1_nor,dspch2_nor,F3_RUN
  STORE  0 TO	NEXTOK,NEXTOK1,NEXTOK2,LAST_PRESS,WATER_CHG,dspadjaw,pnt_CName
  STOR	0 TO   CNVSTP,UPTKSTP,W0DBF,DSPD_NOR,MODY_D1,WATER_off,WATER_OUT_N,WATER_REST,ACT_V,DISC2_s3,BEEP,mixamp,STORAB,STORAB_D,DISCVOL,DISCPER,INFUNC,T0A
  STOR	0  TO IO_8255,spacial,spacial_0,spacial_1,MNGSTP,LED_IO,water_input,s1_water,s2_water,g1_water,g2_water,FAUL_PNT,PLOT_E,PLOT_ACT,SIO1_FAULT,SIO2_FAULT,GS_CHG,tstn,tw_dspx,cnvrst,wadj5,repno_contk,storb_e,TOTTXP
  STOR	0  TO  SAVE_FILE,water_tot,c_tot,ae_tot,WADJ_ACT,TMPDATA,ph_xn,STORE_TYPE,pnt_mod,pnt_mode,actshow5
  STOR	space(10) TO APOSITION
  STOR	 1  TO W0_EN,PNT0_EN,dspe_mixamp,wadj_cn,bpnt_plus,NS_RECNO,pnttype
  STOR	 "N"   TO USAVE
  STOR	"6"  TO  WATER_OUT_CN,DISKVOL,N_SELE
  stor 0 to Vern
  stor -7 to  woff_code
  MDY_RCPB =ARRAY(5)
  RST_MDY_RCPB(@MDY_RCPB,0)
  datatype :={"9","X","X","9","9","X"}
  werr_COLOR :=ARRAY(kind)
  UPTANK :=ARRAY(5,2)
  PZER :=ARRAY(kind)
  PZER_W_A :=ARRAY(kind)
  WSCALE_TYPE :=ARRAY(kind)
  STP_A :=ARRAY(kind)
  AE_LAST_CH :=ARRAY(5)
  FOR I=1 TO kind
    STP_A[I] :=0
  next
  ACTWEIT_A :=ARRAY(kind)
  FOR I=1 TO kind
    ACTWEIT_A[i] :=0
  next
  FOR I=0 TO kind +1
    IX_C=ALLTRIM(STR(I,2,0))
    stor " "  to  P_FUNC&IX_C
  next


  WnoReset ="12345"
  aWnoReset :=array(5)


  GS_ADJ :=ARRAY(6)
  GS_ADJ[1] :=0
  GS_ADJ[2] :=0
  GS_ADJ[3] :=0
  GS_ADJ[4] :=0
  MODI_PAGE =.T.


  DSPDATA_A := ARRAY(kind)
  AFILL(DSPDATA_A,1)
  DI_ADS2=HEXTODEC("2A0")
  DI_ADS3=HEXTODEC("2A2")
  REMOTE :=ARRAY(13)
  AFILL(REMOTE,0)
  REMOTE[11]=1
  &&SIMBOUT :=ARRAY(8,2)
  &&FILL_A_D2(SIMBOUT,1,8,2,0)
  RDDELAY :=ARRAY(kind,3)
  RDDATA_ERR :=ARRAY(kind)
  AFILL(RDDATA_ERR,3)
  FILL_A_D2(RDDELAY,1,kind,3,0)
  WTANK_F :=ARRAY(kind,3)
  FILL_A_D2(WTANK_F,1,kind,3,0)
  A_PRESS_N0 :=ARRAY(4,21,kind+1,PRESS_LEN4)  &&=11
  *A_PRESS_N0 :=ARRAY(4,21,kind+1,PRESS_LEN4)  &&=11
  A_PRESS_N1 :=ARRAY(2,18)


  FILL_A_D4(A_PRESS_N0,1,1,21,kind+1,PRESS_LEN4,0)
  FILL_A_D4(A_PRESS_N0,2,1,21,kind+1,PRESS_LEN4,0)
  FILL_A_D4(A_PRESS_N0,3,1,21,kind+1,PRESS_LEN4,0)
  FILL_A_D4(A_PRESS_N0,4,1,21,kind+1,PRESS_LEN4,0)
  FILL_A_D2(A_PRESS_N1,1,2,18,0)




  A_M_NAME :=ARRAY(kind,23)
  SELE 5
  USE
  USE  PAR1
  GOTO 24
  DO WHILE EOF()=.T.
    APPE BLANK
    GOTO 24
  ENDDO
  GOTO 21
  public  PNTW
  PNTW=ALLTRIM(PA17)
  IF EMPTY(PNTW)
    PNTW="15"
  ENDIF

  GOTO 15
  DBF0SX=ALLTRIM(PA17)

  IF EMPTY(DBF0SX)=.T.
     DBF0SX="91233"
  ENDIF
  GOTO	TOP   &&  NAME OF MATI
  WATER_OUT=99
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,1] :=RTRIM(PA&IX_C)
    IF WATER_OUT=99
      IF  ALLTRIM(A_M_NAME[I,1])="¤ô"  .OR. ALLTRIM(A_M_NAME[I,1])="²M¤ô"
	WATER_OUT_CN=IX_C
	WATER_OUT=0
      ENDIF
    ENDIF
  NEXT
  WATER_OUT=0
  GOTO 19
  ratno_wid=val(pa17)
  if ((ratno_wid <4) .or. (ratno_wid >10))
      ratno_wid=10
  endif
  ratno_pat=""
  for i=1   to ratno_wid
    ratno_pat=ratno_pat +"X"
  next
  GOTO 20   &&	 change  to  par.57
  PLOT_PN=ARRAY(kind)
  BMP_PN=ARRAY(kind,2)
  BMP_PN[1,1]=0
  BMP_PN[1,2]=0
  BMP_SN=ARRAY(2)
  BMP_SN[1]=0
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    PLOT_PN[I] :=VAL(PA&IX_C)
  NEXT

  GOTO 14
  IF EOF()
    APPE  BLANK
    REPL PARNO WITH 14
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      REPL PA&IX_C   WITH  A_M_NAME[I,1]
      A_M_NAME[I,17] :=  RTRIM(PA&IX_C)
    NEXT
  ELSE
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      A_M_NAME[I,17] :=  RTRIM(PA&IX_C)
    NEXT
  ENDIF


  GOTO	2
  BIGLCD=ALLTRIM(PA2)	&&¦X¥Í¤j¦r¹õGUE-170 ="E g"

  Vern=val(PA17)



  goto 15
  A_M_NAME[1,18]=VAL(PA1)

  GOTO	3    && LENGHT ON  DISPAY
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,3] :=ALLTRIM(PA&IX_C)
  NEXT
  tot_deci=val(PA16)
  MAKER_SN=VAL(PA17)
  GOTO	4    && NAME  OF   WEIGHT
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,4] :=PA&IX_C
  NEXT
  GOTO	5    && LENGHT ON  WEIGHT
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,5] :=ALLTRIM(PA&IX_C)
  NEXT
  GOTO	13   && LENGHT ON  WEIGHT
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    *A_M_NAME[I,13] :=VAL(PA&IX_C)
  NEXT
  GOTO	6    && LENGHT ON  WEIGHT
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,14] :=VAL(PA&IX_C)
  NEXT
  GOTO	7    && LENGHT ON  WEIGHT
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,15] :=VAL(PA&IX_C)
  NEXT
  GOTO	8    && POSITION ON WEIGHT
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    *A_M_NAME[I,16] :=VAL(PA&IX_C)
  NEXT

  SELE 5
  USE
  USE PAR
  GOTO BOTT
  && 76 77:¤â°ÊPrint report par.67»~®t²v¬° 0~0.0xx 2:+/- 0.0xx
  DO  WHILE RECNO() <81
    APPE BLANK
    REPL   PARNO WITH RECNO()
  ENDDO

  GOTO 80
  if pa1 >999  .and. pa1 < 1000000
   &&  DBF0SX=ALLTRIM(PA17) par1.pa17
   &&  IF EMPTY(DBF0SX)=.T.
   &&	  DBF0SX="91233"
   &&  ENDIF
    xtmp=int(pa1)
   DBF0SX=alltrim(str(xtmp))
  endif
  public  code_act
  code_act ="91230"
  if pa2 >999  .and. pa2 < 1000000
    xtmp=int(pa2)
    code_act=alltrim(str(xtmp))
  endif




  GOTO 49
  MAX_PNT=PA1
  *CKS()
  SAVE TO LAGDATA9 ALL LIKE LAG*
  goto 35
  A_M_NAME[5,18]=PA8
  A_M_NAME[6,18]=PA5
  XX_=PA1
  xx_W=INT((PA3-pa1)/2)
  xx_W0=PA3-pa1
  A_M_NAME[3,18]=PA4+PA7 -1 && Y POSION ARROW  ­p¶q
  A_M_NAME[2,18]=PA7 -2

  goto 71
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    WERR_COLOR[I] :=PA&IX_C
  NEXT
  goto 60
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    WSCALE_type[I] :=PA&IX_C
  NEXT
  goto 64
  AE_TYPE=PA1  && 89=8,9 =AE
    AE_LAST_CH[5] :=PA5
  FOR I=1 TO 4
    IX_C=ALLTRIM(STR(I,2,0))
    AE_LAST_CH[I] :=PA&IX_C
  NEXT
  UPTANK[5,1]=30
  IF (PA8>10)
    UPTANK[5,1]=PA8
  ENDIF
  waste=pa9
  waste_ACT=0
  *waste=0
  if (waste!=1)
    waste=0
  endif
  if pa12=1
     actshow5=1 &&¹ê»Ú­È show	chang by din(5)=0   act data
  endif
  goto 63
  weigHT_type :=ARRAY(kind)
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    weigHT_type[I] :=PA&IX_C
  NEXT
  *GOTO 36
  *FOR I=1 TO kind
  *  GOTO 50
  *  IX_C=ALLTRIM(STR(I,2,0))
  *  XX_PLUS=PA&IX_C /2
  *  A_M_NAME[I,21] :=PA&IX_C+XX_W0
  *  GOTO 36
  *  if EMPTY(A_M_NAME[I,1]) =.F.
  *    A_M_NAME[I,2] :=INT((PA&IX_C+xx_+XX_W+4)/8)-int(len(alltrim(A_M_NAME[I,1]))/2)
  *    A_M_NAME[I,13] :=int((INT(((PA&IX_C+xx_+XX_W+XX_PLUS+4))-(len(alltrim(A_M_NAME[I,3]))*4))/8))
  *    A_M_NAME[I,19] :=PA&IX_C+xx_+XX_W +XX_PLUS
  *  ELSE
  *    A_M_NAME[I,2] :=0
  *    A_M_NAME[I,13] :=0
  *    A_M_NAME[I,19] :=0
  *  ENDIF
  *NEXT
 * IF (WASTE=1)
 *     A_M_NAME[GS_TOT+UWC_TOT+1,2]= A_M_NAME[GS_TOT+UWC_TOT,2] +3
  *ENDIF


  GOTO 80
  XTMP=INT(PA5)
  if WSCALE_type[1]=5
    bOnly=1
    IF XTMP>12000 .AND. XTMP <54000
       CTMP=str(xtmp,5,0)
       FOR IX1=1 TO 5
	 xc1=SUBSTR(CTMP,IX1,1)
	 FOR IX2=1 TO 5
	    xc2=SUBSTR(CTMP,IX2,1)
	    if xc1=xc2 .and. ix1<> ix2
	      bOnly=0
	      ix1=10
	      ix2=10
	    endif
	 next
       next
       if bonly=1
	 wnoreset=CTMP
	 FOR IX1=1 TO 5
	   XINDEX=VAL(SUBSTR(WNORESET,IX1,1))
	   weigHT_type[XINDEX] :=10 + IX1 -1
	 NEXT
       endif
    ENDIF
  endif


  FOR IX1=1 TO 5
    XINDEX=VAL(SUBSTR(WNORESET,IX1,1))
    aWnoreset[Ix1] :=xindex
  NEXT


  goto 37
  XX_=PA1
  xx_W=INT((PA3-pa1)/2)
  xx_W0=PA3-pa1
  A_M_NAME[4,18]=PA4+PA7-1
  GOTO 38
  *FOR I=1 TO kind
  *  GOTO 51
  *  IX_C=ALLTRIM(STR(I,2,0))
  *  XX_PLUS=PA&IX_C/2
  *  A_M_NAME[I,22] :=PA&IX_C+XX_W0
  *  GOTO 38
  *  if EMPTY(A_M_NAME[I,4]) =.F.
  *    A_M_NAME[I,16] :=INT(((PA&IX_C+xx_+XX_W+XX_PLUS+4))-(len(alltrim(A_M_NAME[I,5]))*4))/8
  *    A_M_NAME[I,20] :=PA&IX_C+xx_+XX_W +XX_PLUS
  *  ELSE
  *    A_M_NAME[I,16] :=0
  *    A_M_NAME[I,20] :=0
  *  ENDIF
  *NEXT


  GOTO 22
  RAM_DISK=SUBSTR("ABCDEFG",PA1,1) +":"
  IF  (ROM_N=1 ) .AND.	(RAM_DISK="A:" )
    RAM_DISK="C:"
  ENDIF
  ACARNO=SPACE(7)
  ACARDRV =SPACE(8)
  ACARW=0
  ARATNO =space(ratno_wid)
  AVUSE  =0
  ATANDO =0
  AUS2=SPACE(4)
  AUS3=0
  ATOT_CAR=0
  AUS2_1=SPACE(30)
  A_ADDR_NO=SPACE(4)
  Aus2_2=space(30)
  if  com_e=1 .AND. (FILE("C:\DBF16.DBF")=.T.) .AND. (FILE("C:\DBF15.DBF")=.T.) .AND. (FILE("C:\DBF12_1.DBF")=.T.)


    SELE 10
    USE c:\DBF12_1
    SELE 11
    USE c:\DBF15
    INDE ON P1501 TO &RAM_DISK\DX1501
    SELE 12
    USE c:\DBF16
    INDE ON P1601 TO &RAM_DISK\DX1601
    SELE 13
    USE c:\DBF17
    *INDE ON P1701 TO &RAM_DISK\DX1701
    SELE 14
    USE c:\DBF_LAG
    DELE FOR LAG_DATE<>DATE()
    PACK
  ELSE
    COM_E=0
  endif
  IF FILE("W0.DBF")=.T.
    SELE 17
    USE  C:\W0
    W0DBF=1
  ENDIF
  IF FILE("DISCO.DBF")=.T.
    SELE 16
    USE  DISCO
    DELE  FOR  DSDATE<>DATE()
    PACK
    F_DISPROC=2
  ENDIF
  SELE 5
  GOTO 21
  IF  PA4=77  .AND.  ( FILE("DEMO_SV1.COM")=.T.)
    ISDEMO=1
  ELSE
    ISDEMO=0
  ENDIF
  demo_n=pa3
  HIREP=PA5
  *IF  HIREP=0
  *  HIREP=2
  *ENDIF
  * Z_AUTO=PA6
   Drop_AUTO=PA6
   gstot_err=0
  dsp_1s=int(pa7)
  if  dsp_1s <=0
    dsp_1s=1
  endif
  pnt_CName=PA15

  AUTOR=PA8

  IF  AUTOR=1
    SELE 8
    USE MLDSP
  ENDIF


  sele 5
  T=0
  DO WHILE  T=0
    GOTO 45
    TIME1 :=ARRAY(kind,2)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      TIME1[I,1] :=PA&IX_C
      TIME1[I,2] :=0
    NEXT
    GOTO 44
    GS_DROP :=ARRAY(kind,2)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      GS_DROP[I,1] :=PA&IX_C
      GS_DROP[I,2] :=0
    NEXT
    GOTO 46
    LS1 :=ARRAY(kind,2)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      LS1[I,1] :=PA&IX_C
      LS1[I,2] :=0
    NEXT
    GOTO 47
    LS2 :=ARRAY(kind,2)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      LS2[I,1] :=PA&IX_C
      LS2[I,2] :=0
    NEXT
    GOTO 48
    STANDW_ERR :=ARRAY(kind)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      STANDW_ERR[I] :=PA&IX_C
    NEXT
    GOTO 58
    STANDW1_ERR :=ARRAY(kind)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      STANDW1_ERR[I] :=PA&IX_C
    NEXT
    GOTO 76
    public  dspadjaw
    dspadjaw=pa1
    dspadjaw=0
    A_Rand_W :=ARRAY(gs_tot +uwc_tot)
    FOR I=1 TO gs_tot +uwc_tot
       A_Rand_W[I]=0
    NEXT

    public  mdirty_no :=array(5)  && 1:no, 2:weight, 3:second std , 4:seconds  start <=0 noaction , 5:¤w°õ¦æ¦¸¼Æ
    mdirty_no[1]=PA6  && 1-GS_TOT  POSI NO.
    mdirty_no[2]=PA7   &&  WEIGHT
    mdirty_no[3]=PA8   &&  SECONDS
    mdirty_no[4]=-1   &&  IDLE
    mdirty_no[5]=0   &&  COUNT
    IF	mdirty_no[1]>GS_TOT .OR. mdirty_no[1]  <0
	 mdirty_no[1]=0
    ENDIF
    IF	mdirty_no[2] < 100  && KG
	 mdirty_no[1]=0
    ENDIF

    IF	mdirty_no[3] > 20  && SECONDS
	 mdirty_no[1]=0
    ENDIF


    GOTO 66
    STANDW2_ERR :=ARRAY(kind)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      STANDW2_ERR[I] := PA&IX_C  /1000
    NEXT
    GOTO 67
    STANDW3_ERR :=ARRAY(kind)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      STANDW3_ERR[I] :=PA&IX_C	/1000
    NEXT
    GOTO 68
    temp_cal :=ARRAY(4,kind)
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      temp_cal[1,I] :=PA&IX_C
    NEXT
    GOTO 56
      MIX_ERR=0
      MIXMAX=PA1
      IF MIXMAX <=100
	 MIXMAX=300
	 REPL PA1 WITH 300
      ENDIF
      PLOT_E=PA5
      IF PLOT_E <> 1
	 PLOT_E=0
      ENDIF
    IF PLOT_E=1
      GOTO 57
      PLOT_PN=ARRAY(kind)
      FOR I=1 TO kind
	IX_C=ALLTRIM(STR(I,2,0))
	PLOT_PN[I] :=INT(PA&IX_C)
      NEXT
      BMP_PN[3,1] := PLOT_PN[1]
      BMP_PN[3,2] := PLOT_PN[4]
      BMP_PN[4,1] := (PLOT_PN[3] - PLOT_PN[1] ) / PLOT_PN[7]
      BMP_PN[4,2] := (PLOT_PN[4] - PLOT_PN[2]-10 ) /   PLOT_PN[6]
      BMP_PN[5,2] := (10 ) / (300 - PLOT_PN[6] )
    ENDIF
    GOTO 55
    SANDCUTW   :=ARRAY(6,2)
    FOR I=1 TO 6
      IX_C=ALLTRIM(STR(I,2,0))
      SANDCUTW[I,1]   :=PA&IX_C
      SANDCUTW[I,2]   :=0
    NEXT
    ALMTM := ARRAY(2,2)
    ALMTM[1,1]	  := PA11   && ALM ON
    ALMTM[2,1]	:=  PA12  && ALM OFF
    IF ALMTM[1,1] =0
       ALMTM[1,1] :=6
    ENDIF
    ALMTM[1,2] := 0
    ALMTM[2,2] := 0
    GOTO 54
    SPACMIXTM  :=ARRAY(3,2)
    FOR I=1 TO 3
      IX_C=ALLTRIM(STR(I,2,0))
      SPACMIXTM[I,1] :=PA&IX_C
    NEXT
    GOTO 32
    errpnt_e=pa9
    GOTO 72
    public watr_er  :=ARRAY(6)
    FOR I=1 TO 6
      IX_C=ALLTRIM(STR(I,2,0))
      watr_er[I] :=PA&IX_C /10
    NEXT
    public watr_chg  :=ARRAY(2)
    watr_chg[1]=pa8
    IF	watr_chg[1]<1
      watr_chg[1]=3
    ENDIF
    watr_chg[2]=-1
    PUBLIC  WATR_act :=ARRAY(6)
    autoin_w=pa16  &&  -1:¦Û°Ê¸É¤ô¨ú®ø


    && GOTO 65
    && GS_TOT=INT(PA1)
    && UWC_TOT=INT(PA4)


    GOTO 33
#ifdef	dfTLU16
    if PA14 <>42
       PA14=42
       PA15=8
    ENDIF
    xlen_max=INT(PA15)
    IF	xlen_max  <6   .OR. xlen_max  >10
      xlen_max=8
      PA15=8
    ENDIF
#else
    xlen_max=6
#endif

    && WATER_INC[1]=PA1
    && WATER_INC[2]=PA2
    && WATER_INC[3]=PA3
    && WATER_INC[4]=PA4
    && WATER_INC[5]=PA5
    && WATER_INC[6]=PA6
    G1_WATER=PA1
    G2_WATER=PA2
    S1_WATER=PA3
    S2_WATER=PA4

    PUBLIC  WATER_INC :=ARRAY(xlen_max)

    && FOR I=1 TO xlen
    &&	 IX_C=ALLTRIM(STR(I,2,0))
    &&	 WATER_INC[1] :=PA&IX_C
    && next

    && function  RW_WAadj  && (xIndex,isRWall,isRead)
    RW_WAadj(1,1,1)  && (xIndex,isRWall,isRead)


    GOTO 33
    pnt_water=pa10
    pnt_func=pa11
    water_input=0  &&§t¤ô¶q
    if pa8=1
      water_input=1  &&§t¤ô²v
    endif

    pnt_redy_code=pa12
    if pnt_redy_code=0
      pnt_redy_code=9991
    endif

    pnt_REMAIN=pa13
    GOTO 30
    IF	EOF()
      APPE BLANK
      REPL  PARNO  WITH INT(RECNO())
      IF RECNO()=30
	REPL PA1 WITH DA_MAX1,PA2 WITH DA_MAX2,PA3 WITH DA_MAX3,PA4 WITH DA_MAX4,PA5 WITH DA_MAX5
      ENDIF
    ELSE
      T=1
      DA_MAX1=PA1
      DA_MAX2=PA2
      DA_MAX3=PA3
      DA_MAX4=PA4
      DA_MAX5=PA5
    ENDIF
  ENDDO
  T=0
  GOTO 4
  LCHTYPE=PA1
    STORAB=1
    STORAB_d=1
    ZERTST=0
    FOR I=1 TO kind
      IX_C=ALLTRIM(STR(I,2,0))
      IF (STANDW_ERR[I] >0)  .or.  (STANDW2_ERR[I] >0)
	ZERTST=1
      ENDIF
    NEXT
    IF ZERTST =0
      STORAB=0
    ENDIF
    IF FILE("c:\SA1.DBF")=.f.
      STORAB=0
      STORAB_d=0
    else
      SELE 18
      use
      USE \SA1
      GOTO TOP
      IF (DATE() -LUDATE ) > 90
	 DELE FOR (DATE()-LUDATE) >60
	 PACK
      ENDIF
      SELE 5
    ENDIF
    IF FILE("c:\LUW0.DBF")=.f.
      STORAB_D=0
    else
      SELE 19
      use
      USE \LUW0
      GOTO TOP
      IF (DATE() -LUDATE ) > 90
	 DELE FOR (DATE()-LUDATE) >60
	 PACK
      ENDIF
      SELE 5
    ENDIF
  UCHTYPE=PA2
  RATVOL=PA3
  RATVOL_S=PA3
  DATA4=PA4
  bnodata4=data4
  INTNO=PA5
  PWATER=0
  C_PRT_REP=SUBSTR(ALLTRIM(STR(pa7,3,0)),-2,2)
  C_MINK=VAL(SUBSTR((STR(pa7,3,0)),-3,1) )
  STOPDAY=PA8
  if  (stopday > 0 ) .and.  (STOPDAY <> 77)
    IF	 (VAL(SUBSTR(DTOC(DATE()),4,2)) + (VAL(SUBSTR(DTOC(DATE()),1,2)) * 100 ) ) >=STOPDAY
      REPL  PA8 WITH 99
      if re_star()=0
	quit
      ELSE
	X=99
	@ 20,1	GET  X
	READ
	REPLA PA8 WITH	X
      endif
    ENDIF
  endif
  GOTO 11
  PZERTM :=ARRAY(kind)
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    PZERTM[I] :=PA&IX_C  * INTNO
    SETZERTM(I-1,INT(PZERTM[I]))
  NEXT
  GOTO 9
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,9] :=PA&IX_C
    A_M_NAME[I,10] :=PA&IX_C
  NEXT
  GOTO 10
  MAIN_AMP=PA1
  UPTANK[4,1]=PA2
  UPTANK[4,2]=PA2
  pconvtm=PA2
  WATER_ADJ=PA3

  &&2019/4/13
  lstanktmp=0
  if PA5=77
    lstanktmp=10
  ENDIF
  on_conveyer=0
  if PA6=72
    on_conveyer=2
  ENDIF


  GOTO TOP
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    PFLOR&IX_C :=PA&IX_C
  NEXT
  GOTO 12
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,6] :=PA&IX_C
    A_M_NAME[I,12] :=PA&IX_C
  NEXT
  GOTO 30
  fps=int(pa7)
  GOTO 29
  RDT_1=PA2
  RDT_2=PA3
  RDT_3=PA4
  Z_RDT_1=PA5
  Z_RDT_2=PA6
  MYS_WATER=PA7   &&  1:´î¤ô +	S1    2: ´î¤ô + S2    0:´î¤ô + 1/2   S1  1/2 S2
  IF MYS_WATER >=3
    MYS_WATER=0
  ENDIF
  del_key=pa8
  X_MONI=INT(PA8)
  LU_COUNT=0
  IF PA1=66
    LU_COUNT=1
    SELE 15
    USE CHK_BILL
  ENDIF
  IF  X_MONI=77
    DO MONI_INI
    SELE 6
    USE   MNI_OUT
  ENDIF

  SELE 5
  GOTO 15
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,7] :=PA&IX_C
  NEXT
  GOTO 2
  *DO	 GETPZER
  *DO	 GET_PZER
  IF  LCHTYPE <> 4 .OR.  UCHTYPE  <> 1
    *EXIT
  ENDIF
  ERROR_LINK=1
  C_READ=""
  GOTO 3
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    ERKG&IX_C := PA&IX_C
  NEXT
  GOTO 5
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    A_M_NAME[I,8] :=INT( PA&IX_C )
    SETWANO(I-1,A_M_NAME[I,8] )
  NEXT
  GOTO 6
  DATA1=PA1
  DATA2=PA2
  DATA3=PA3
  DATA4=PA4
  DATA5=PA5
  DATA6=PA6
  DATA7=PA7
  DATA8=PA8
  DATA9=PA9
  DATA10=PA10
  DATA11=PA11
  DATA12=PA12
  DATA13=PA13
  DATA14=PA14
  DATA15=PA14
  SETOUTIME(0,INT(DATA1*INTNO))
  SETOUTIME(1,INT(DATA2*INTNO))
  SETOUTIME(2,INT(DATA3*INTNO))
  SETOUTIME(3,INT(DATA4*INTNO))
  SETOUTIME(4,INT(DATA5*INTNO))
  SETOUTIME(5,INT(DATA6*INTNO))
  SETOUTIME(6,INT(DATA7*INTNO))
  SETOUTIME(7,INT(DATA8*INTNO))
  SETOUTIME(8,INT(DATA9*INTNO))
  SETOUTIME(9,INT(DATA10*INTNO))
  SETOUTIME(10,INT(DATA11*INTNO))
  SETOUTIME(11,INT(DATA12*INTNO))
  SETOUTIME(12,INT(DATA13*INTNO))
  SETOUTIME(13,INT(DATA14*INTNO))
  SETOUTIME(14,INT(DATA15*INTNO))
  GOTO 7
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    RDDELAY[I,1] :=PA&IX_C
    SETRDTIME(I-1,INT(RDDELAY[I,1] *INTNO))
  NEXT
  GOTO 8
  UPTANK[1,1]=PA1
  UPTANK[1,2]=PA1
  UPTANK[2,1]=PA2
  UPTANK[2,2]=PA2
  UPTANK[3,1]=PA3
  UPTANK[3,2]=PA3

  pdrOP1=PA1
  PDRCL =PA2
  PDROP2=PA3
  PMIXTM=PA4
  PMIXA =PA5
  PMIXOP=PA6
  PMIXTM_O=PMIXTM
  SETMEM(HEXTODEC("284"),INT(PDROP1*INTNO))
  SETMEM(HEXTODEC("286"),INT(PDRCL*INTNO))
  SETMEM(HEXTODEC("288"),INT(PDROP2*INTNO))
  SETMEM(HEXTODEC("28A"),INT(PMIXTM*INTNO))
  SETMEM(HEXTODEC("28C"),INT(PMIXA*2048/MAIN_AMP)+2048)
  SETMEM(HEXTODEC("28E"),INT(PMIXOP*INTNO))
  aport=str(pa7,1,0)
  if aport="0"
    aport="1"
  endif
  bport=str(pa8,1,0)
  if bport="0"
    bport="2"
  endif
  if aport=bport
    if aport="1"
      bport="2"
    else
      bport="1"
    endif
  endif
  bpnt_plus=pa9
  if (bpnt_plus >4)   .or. (bpnt_plus<0 )
     bpnt_plus=0
  endif
  pnt_mixt=pa11
  pmixt_plus =pa10
  IF PMIXT_PLUS<3
    pmixt_plus =3
  ENDIF
  GOTO 13
  STOPDR1 =PA1
  STOPDR2 =PA2
  STOPDR3 =PA3
  STOPDR4 =PA4
  STOPDR5 =PA5
  STOPDR6 =PA6
  STOPDR7 =PA7
  STOPDR8 =PA8
  STOPDR9 =PA9
  STOPDR10=PA10
  STOPDR11=PA11
  STOPDR12=PA12
  STOPDR13=PA13
  STOPDR14=PA14



  GOTO 19
  STOPLC=PA3
  STOPLD=PA4
  STOPLF=PA6
  STOPlG=PA7
  COLOR="  N  B  G BG  RRBGR W"
  COLOR="  N  B  G BG  R RB GR  WB+ G+ BG+R+ RB+GR+W+ "
  GOTO 14
  STORE_TYPE=PA12

  c1=SUBSTR(COLOR,MOD(INT(PA1),16)*3+1,3)
  C2=SUBSTR(COLOR,MOD(INT(PA2),16)*3+1,3)
  C3=SUBSTR(COLOR,MOD(INT(PA3),16)*3+1,3)
  C4=SUBSTR(COLOR,MOD(INT(PA4),16)*3+1,3)
  C5=SUBSTR(COLOR,MOD(INT(PA5),16)*3+1,3)
  C6=SUBSTR(COLOR,MOD(INT(PA6),16)*3+1,3)
  C7=SUBSTR(COLOR,MOD(INT(PA7),16)*3+1,3)
  COLOR="B  G  BG R  RB GR W  B+ G+ BG+R+ RB+GR+W+ "

  public gs_pre
  gs_pre=pa13  &&=1 «Ý¤æ²Ä¤G¬q gs¥ý¤U
  GOTO 20
  c8=SUBSTR(COLOR,MOD(INT(PA1),16)*3+1,3)
  C9=SUBSTR(COLOR,MOD(INT(PA2),16)*3+1,3)
  C10=SUBSTR(COLOR,MOD(INT(PA3),16)*3+1,3)
  C11=SUBSTR(COLOR,MOD(INT(PA4),16)*3+1,3)
  C12=SUBSTR(COLOR,MOD(INT(PA5),16)*3+1,3)
  C13=SUBSTR(COLOR,MOD(INT(PA6),16)*3+1,3)
  C14=SUBSTR(COLOR,MOD(INT(PA7),16)*3+1,3)
  IF PA1=0
    C8=C2
  ENDIF
  IF PA2=0
    C9=C2
  ENDIF
  IF PA3=0
    C10=C2
  ENDIF
  IF PA4=0
    C11=C2
  ENDIF

  PUBLIC  DAct_Sw
  DAct_Sw=PA15






  GOTO 15
  ZA=PA1
  ZB=PA2
  ZC=PA3
  ZD=PA4
  ZE=PA5
  ZF=PA6
  ZG=PA7
  ZI=PA7
  ZH=PA8

  GOTO 16
  TOTDR=0
  IF PA1=1
    TOTDR=TOTDR+1
  ENDIF
  IF PA2=1
    TOTDR=TOTDR+1
  ENDIF
  IF PA3=1
    TOTDR=TOTDR+1
  ENDIF
  IF PA4=1
    TOTDR=TOTDR+1
  ENDIF
  TOTDR1=TOTDR
  DRSTA=PA1
  DRSTB=PA2
  DRSTC=PA3
  DRSTD=PA4
  XX=STR(PA1,1,0)
  DRST_Z&XX="SWA1"
  XX=STR(PA2,1,0)
  DRST_Z&XX="SWB1"
  XX=STR(PA3,1,0)
  DRST_Z&XX="SWC1"
  XX=STR(PA4,1,0)
  DRST_Z&XX="SWD1"
  DRSTA_o=PA1
  DRSTB_o=PA2
  DRSTC_o=PA3
  DRSTD_o=PA4
  DELAYW=PA5
  DELAYCO1=PA6
  DELAYCO2=PA7
  DRFME=PA8
  DRNO=1
  GOTO 17
  SDRA=PA1
  SDRB=PA2
  SDRC=PA3
  SDRD=PA4
  SDRE=PA5
  SDRF=PA6
  SDRG=PA7
  SDRH=PA8
  GOTO 18
  cancel_key[1]=pa15
  cancel_key[2]=pa16
  KOT=PA4
  IF KOT=1
    && TOTANK0=0    &&NO   UB	TANK ¥þ¤W«¬
  ENDIF
  if PA8=16.8
    douin=1
  endif
  _auto_flor=pa7
  DAA=int(PA2)
  if  (DAA=0)  .or. (daa >=5)
    DAA=3
  endif
  DS=SUBSTR("ABCD",INT(PA3),1)+":"
  CDSK=0
  if pa3>2
    CDSK=1
  ENDIF

  DA=SUBSTR("ABCD",INT(PA2),1)+":"
  SET COLOR TO &C5 +/ &C1
  PUBL NRATNO,NCARNO
  CHRN=0
  FANT=0
  CAS=0
  CAS1=0
  F=0
  X1=0
  XP=0
  Y1=0
  XX1=0
  YY1=0
  IF FILE("c:\LUW1.DBF")=.T.
    HDOK=1
    SELE 1
    use
    USE c:\LUW1
    GOTO TOP
    IF LUDATE<DATE()-750
      DELE FOR LUDATE<DATE()-750
      PACK
    ENDIF
    X= INT(DISKSPACE( 3 )/1024)
    IF X < 350
      X=(650 -X) *10 /2
      Y=(650 -X) *7  /2
      DELE FOR RECNO() < X
      PACK
      SELE 7
      use
      USE c:\SA
      DELE FOR RECNO() < Y
      PACK
      USE
    ENDIF
    SELE 7
    use
    use  c:\sa


    GOTO TOP
    IF LUDATE<DATE()-750
      DELE FOR LUDATE<DATE()-750
      PACK
    ENDIF
  ELSE
    HDOK=0
    @ 1,0 SAY "µwºÐ¬G»Ù"
  ENDIF
  F3_FUNC=" "
  F5_FUNC=" "
  F7_FUNC=" "
  F8_FUNC=" "
  F9_FUNC=" "
  ARR_PCS :=ARRAY(kind+1)
  AFILL(ARR_PCS," ")
  *ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
  RET_A :=ARRAY(kind+4)
  _F3TXT_A :=ARRAY(4) && FUNCTION F3  TITLE
  PUBL	 _F3TXT_A
  SELE 5
  GOTO 21
  PUBLIC P_DEMO,_NOTPER,COM_OK
  COM_OK=0
  c_coMn=MOD(PA2,10)
  c_BAU=INT(PA2/10)   && 5=2400 6=4800 7=9600
  IF ( C_COMN  <=1).and. (c_BAU >= 4)
    *COM_OK=COMINI(C_COMN,C_BAU,1,0,2)
    X=ASC(SUBSTR(COM_STS(C_COMN),1,1))
    COM_OK=X
  ENDIF
  GOTO 7
  xn=ALLTRIM(str((kind+1),2,0))

  _F3TXT_A[1] := "«È¤á¥N¸¹"
  _F3TXT_A[2] := "«È¤á¦WºÙ"
  _F3TXT_A[3] := "¦aÂI¥N¸¹"
  _F3TXT_A[4] := "°e³f¦aÂI                  "


  *IF EMPTY(SUBSTR(PA&xn,1,4))=.T.
  *  _F3TXT_A[1] := "«È¤á¥N¸¹"
  *ELSE
  *  _F3TXT_A[1] := SUBSTR(PA&xn,1,8)
  *ENDIF
  *IF EMPTY(SUBSTR(PA&xn,5,4))=.T.
  *  _F3TXT_A[2] := "«È¤á¦WºÙ"
  *ELSE
  *  _F3TXT_A[2] := SUBSTR(PA&xn,9,8)
  *ENDIF
  *IF EMPTY(SUBSTR(PA&xn,9,4))=.T.
  *  _F3TXT_A[3] := "¦aÂI¥N¸¹"
  *ELSE
  *  _F3TXT_A[3] := SUBSTR(PA&xn,17,8)
  *ENDIF
  *IF EMPTY(SUBSTR(PA&xn,15,4))=.T.
  *  _F3TXT_A[4] := "°e³f¦aÂI                                           "
  *ELSE
  *  _F3TXT_A[4] := SUBSTR(PA&xn,55,8)
  *ENDIF
  _TOT_D_A :=ARRAY(24,5) && PRINT @Y,X,DATA1,DATA2
  _TOT_D_A[20,1] :=99
  _TOT_D_A[20,3] :=0	  && FIST  INPUT
  _TOT_D_A[20,4] :=0	  && FIST  PRINT
  _TOT_D_A[1,5] :="XXXXXXXX"
  _TOT_D_A[2,5] :="999999999"
  _TOT_D_A[3,5] :="XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  _TOT_D_A[4,5] :="XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  _TOT_D_A[5,5] :="999999999"
  _TOT_D_A[6,5] :="999999999"
  _TOT_D_A[7,5] :="999999999"
  _TOT_D_A[8,5] :="XXXXXXXX"
  _TOT_D_A[9,5] :="999999999"    &&¥æ³f¨®¦¸
  _TOT_D_A[10,5] :="9999999.9"
  _TOT_D_A[11,5] :="9999999.9"    &&²Ö­p¦Ì¼Æ
  _TOT_D_A[12,5] :="9999"
  _TOT_D_A[13,5] :="XXXXXXXX"
  _TOT_D_A[14,5] :="9999"
  _TOT_D_A[15,5] :="XXXXXXXXXX"
  _TOT_D_A[17,5] :="99"
  _TOT_D_A[18,5] :="XXXXXXXX"  && °t¤ñno.
  _TOT_D_A[19,5] :="XXXXXXXXXXXXXX"    && ²Ö¶iSNO.
  _TOT_D_A[24,5] :="999999999"    && ¨C¦Ì­«  KG  /¦Ì
  _TOT_D_A[20,2] :=15	 &&¶µ¼Æ
  _TOT_D_A[21,2] :="99999" &&³æ»ù
  _TOT_D_A[21,3] :=0 &&³æ»ù
  _TOT_D_A[21,4] :=0 &&³æ»ù
  _TOT_D_A[22,4] :=""&&¤u¦a
  _TOT_D_A[23,4] :=50 &&²V¦X®É¶¡
  SELE 5
  GOTO 23
  _TOT_D_A[1,1] :=VAL(SUBSTR(STR(PA1,5,0),1,2))
  _TOT_D_A[1,2] :=VAL(SUBSTR(STR(PA1,5,0),3,3))
  _TOT_D_A[2,1] :=VAL(SUBSTR(STR(PA2,5,0),1,2))
  _TOT_D_A[2,2] :=VAL(SUBSTR(STR(PA2,5,0),3,3))
  _TOT_D_A[3,1] :=VAL(SUBSTR(STR(PA3,5,0),1,2))
  _TOT_D_A[3,2] :=VAL(SUBSTR(STR(PA3,5,0),3,3))
  _TOT_D_A[4,1] :=VAL(SUBSTR(STR(PA4,5,0),1,2))
  _TOT_D_A[4,2] :=VAL(SUBSTR(STR(PA4,5,0),3,3))
  _TOT_D_A[5,1] :=VAL(SUBSTR(STR(PA5,5,0),1,2))  &&CAR	TOTAL  WEIGHT
  _TOT_D_A[5,2] :=VAL(SUBSTR(STR(PA5,5,0),3,3))
  _TOT_D_A[6,1] :=VAL(SUBSTR(STR(PA6,5,0),1,2))  && CAR  EMPTY	WEIGHT
  _TOT_D_A[6,2] :=VAL(SUBSTR(STR(PA6,5,0),3,3))
  _TOT_D_A[7,1] :=VAL(SUBSTR(STR(PA7,5,0),1,2))
  _TOT_D_A[7,2] :=VAL(SUBSTR(STR(PA7,5,0),3,3))
  LST_BB=PA8
  GOTO 24
  _TOT_D_A[8,1]  :=VAL(SUBSTR(STR(PA1,5,0),1,2))
  _TOT_D_A[8,2]  :=VAL(SUBSTR(STR(PA1,5,0),3,3))
  _TOT_D_A[9,1]  :=VAL(SUBSTR(STR(PA2,5,0),1,2))
  _TOT_D_A[9,2]  :=VAL(SUBSTR(STR(PA2,5,0),3,3))
  _TOT_D_A[10,1] :=VAL(SUBSTR(STR(PA3,5,0),1,2))
  _TOT_D_A[10,2] :=VAL(SUBSTR(STR(PA3,5,0),3,3))
  _TOT_D_A[11,1] :=VAL(SUBSTR(STR(PA4,5,0),1,2))
  _TOT_D_A[11,2] :=VAL(SUBSTR(STR(PA4,5,0),3,3))
  _TOT_D_A[12,1] :=VAL(SUBSTR(STR(PA5,5,0),1,2))
  _TOT_D_A[12,2] :=VAL(SUBSTR(STR(PA5,5,0),3,3))
  _TOT_D_A[13,1] :=VAL(SUBSTR(STR(PA6,5,0),1,2))
  _TOT_D_A[13,2] :=VAL(SUBSTR(STR(PA6,5,0),3,3))
  _TOT_D_A[14,1] :=VAL(SUBSTR(STR(PA7,5,0),1,2))
  _TOT_D_A[14,2] :=VAL(SUBSTR(STR(PA7,5,0),3,3))

  c_time=PA10
  GOTO 25
  _TOT_D_A[15,1] :=VAL(SUBSTR(STR(PA1,5,0),1,2))
  _TOT_D_A[15,2] :=VAL(SUBSTR(STR(PA1,5,0),3,3))
  _TOT_D_A[17,1] :=VAL(SUBSTR(STR(PA2,5,0),1,2))
  _TOT_D_A[17,2] :=VAL(SUBSTR(STR(PA2,5,0),3,3))
  _TOT_D_A[18,1] :=VAL(SUBSTR(STR(PA3,5,0),1,2))
  _TOT_D_A[18,2] :=VAL(SUBSTR(STR(PA3,5,0),3,3))
  _TOT_D_A[16,1] :=VAL(SUBSTR(STR(PA4,5,0),1,2))
  _TOT_D_A[16,2] :=VAL(SUBSTR(STR(PA4,5,0),3,3))
  LOOP=19
  DO   WHILE  LOOP <24
    _TOT_D_A[LOOP,1] := 0
    _TOT_D_A[LOOP,2] := 0
    LOOP=LOOP+1
  ENDDO
  _TOT_D_A[24,1] :=VAL(SUBSTR(STR(PA6,5,0),1,2))
  _TOT_D_A[24,2] :=VAL(SUBSTR(STR(PA6,5,0),3,3))
  P_LENGTH=INT(PA8)
  REPNO_CONT=PA9
  IF  P_LENGTH=0
    P_LENGTH=33
  ENDIF
  _AUTO_FLOR(1,1,0," ",0)
  SELE 2
  use
  USE W1
  *  INDEX ON RATNO TO RATNODX
  SELE 4
  use
  USE ADTPRN
  SET RELA TO RATNO  INTO W1
  SELE 3
  use
  USE SCA
  CUS=1
  SET CURS OFF
  SET SCOR OFF
  *PERR=1-PER
  cleamem()
  r=0
  F=0
  PCON=0
  CH=""
  do lu_dsp
  sele 5
  use
  use  par1
  goto 24     && MDY_Cout220151024
  if val(PA1)=77
    i1=gs_tot + water_tot
    FOR I=i1+1 TO i1+c_tot
      IX_C=ALLTRIM(STR(I,2,0))
      if val(PA&IX_C) >4
	 SETOUTC2(I-1,val(PA&IX_C))
      ENDIF
    NEXT
  ENDIF
  sele 5
  use
  use  par
  SELE 5
  GOTO 2
  DO	GET_PZER
  do  lu12_dsp1
  *do lu_dsp
  DO  LU12_DSP
  TEST=0
  T=0
  TD1=1
  *IF	RISMOUSE()
  *  RMOUSE=1
  *  RCURSORON()
  *ELSE
  *  RCURSOROFF()
  *ENDIF
  DO WHILE TD1=1
    DO WHILE T=0
      IF  F3_N <> 1
	T=INKEY()
      ENDIF
      DO  DSP2
      do lustp
      *IF  RMOUSE=1
      *  RMT=Rclick()
      *  IF RMT = .t.
      *    DO RMOUSE
      *  ENDIF
      *ENDIF
    ENDDO
    IF	F_DISPROC >=1
       *if dspd_nor=1
       *  DSPD_NOR=0
       *  DspSetData(8)
       *endif
      if t=13
	 FUNC_S=LTRIM(FUNC_S)
	 SN1=SUBSTR(FUNC_S,1,1)

	 SN1=UPPER(SN1)
	 DO CASE
	 CASE  SN1="B"
	   FUNC_S=FUNC_S  + SPACE(10)
	   ISSEEK=-1
	   _ARATNO=ALLTRIM(SUBSTR(FUNC_S,2,6))
	   IF EMPTY(_ARATNO)=.F.
	     X_RET=0
	     ISSEEK= fseek_C(17,"RATNO",_ARATNO,"M1",@X_RET)
	   ENDIF
	   RST_MDY_RCPB(@MDY_RCPB,0)
	   IF ISSEEK>0
	      MDY_RCPB[1]=1
	      MDY_RCPB[2]=_ARATNO
	      MDY_RCPB[4]=-1
	      MDY_RCPB[5]=ISSEEK
	      RST_MDY_RCPB(@MDY_RCPB,1)
	   ENDIF
	 CASE  SN1="M"
	   IF	 MDY_RCPB[1]=1
	     actano=select(dbf())
	     sele 17
	     goto  MDY_RCPB[5]
	     FUNC_S=FUNC_S  + SPACE(10)
	     XN=VAL(SUBSTR(FUNC_S,2,5))
	     IF XN <=kind
		mxn=alltrim(SUBSTR(FUNC_S,1,6))
		mxn=upper(mxn)
		MDY_RCPB[3]=mxn
		MDY_RCPB[4]=&mxn
	     endif
	     sele &actano
	     RST_MDY_RCPB(@MDY_RCPB,1)
	     FUNC_S=SPACE(6)
	   ENDIF
	 CASE  SN1="D"
	   IF	 (MDY_RCPB[1]=1) .and. (MDY_RCPB[4] >=0)
	     actano=select(dbf())
	     sele 17
	     goto  MDY_RCPB[5]
	     FUNC_S=FUNC_S  + SPACE(10)
	     XN=VAL(SUBSTR(FUNC_S,2,5))
	     IF XN >=0
		MDY_RCPB[4]=xn
		mcn=MDY_RCPB[3]
		repl   &mcn  with xn
		COMMIT
	     endif
	     sele &actano
	     RST_MDY_RCPB(@MDY_RCPB,1)
	     FUNC_S=SPACE(6)
	   ENDIF
	 ENDCASE

	 XFU=ALLTRIM(func_s)


	if XFU="Q" .OR. XFU="q"
	  DO  GS_ADJ
	ENDIF
	if func_s="90246"
	  DO0_DSP=1
	ELSE
	  DO0_DSP=0
	ENDIF
	if func_s="dely"  .or. func_s="DELY"
	    SET COLOR TO GR+ +/ &C1
	    SELE 17
	    ZAP
	    PACK
	    SELE 18
	    ZAP
	    PACK
	    SELE   19
	    ZAP
	    COMMIT
	    @  0,0  SAY "°t"


	    SET COLOR TO &C7 +/ &C1
	ENDIF






	if SUBSTR(FUNC_S,4,2)="1Q"  .OR. SUBSTR(FUNC_S,4,2)="1q"
	  IF W0_EN=0
	    W0_EN=1
	    SET  COLO TO
	    SET COLOR TO R  / &C1
	    @ 0,9  SAY ratvol PICT "99.9"
	    SET COLOR TO &C7 +/ &C1
	  ELSE
	    W0_EN=0
	    SET COLOR TO W+ / &C1
	    @ 0,9  SAY ratvol PICT "99.9"
	    SET COLOR TO &C7 +/ &C1
	  ENDIF
	ENDIF
	IF DAct_Sw=9

	  &&IF FUNC_S="91230"
	  XL_CODE=LEN(code_act)
	  XF_TMP=SUBSTR(SPACE(7) +func_s,-XL_CODE)


	  && IF FUNC_S=code_act
	  IF XF_TMP=code_act
	    K_DIN5=1
	    FUNC_S=""
	  ELSE
	    K_DIN5=0
	  ENDIF
	ENDIF

	*if func_s="91230"
	*  DSPD_NOR = 1
	*  DSPD_NOR = 1
	*ELSE
	*  if dspd_nor=1
	*    DSPD_NOR=0
	*  endif
	*ENDIF
	*DspSetData(dspd_nor)
       &&  if (ALLTRIM(func_s)="YB0246")  .OR.  (substr(space(5)+ALLTRIM(func_s),-5,5)=DBF0SX)

	 XL_CODE=LEN(DBF0SX)
	 XF_TMP=SUBSTR(SPACE(7) +func_s,-XL_CODE)
	if (ALLTRIM(func_s)="YB0246")  .OR.  (ALLTRIM(XF_TMP)=DBF0SX)
	  FUNC_S=""
	  IF W0DBF=1
	    *if  star=0
	    DO	SETW0
	    *endif
	  ENDIF
	ENDIF
	if (func_s="12345"   ) .AND. ( STAR=0)
	    FUNC_S=""
	  && DO  CHGDBF0X
	ENDIF
	if ALLTRIM(func_s)="998"
	    FUNC_S=""
	  SET CURS ON
	  @ 13,1  SAY  "³Ì¤j¦C¦L¤è¼Æ: " GET MAX_PNT
	  READ
	  SET CURS OFF
	  @ 13,1 CLEA  TO  13,25
	  SELE 5
	  GOTO 49
	  REPL	PA1  WITH  MAX_PNT
	ENDIF
	if func_s="91234"
	  IF W0DBF <>1
	    do	dis_proc
	  endif
	  func_s="      "
	else
	  func_s="      "
	endif
      elseif t=K_ESC
	RST_MDY_RCPB(@MDY_RCPB,0)
	  func_s=SPACE(6)
      else
	IF  T >0
	  func_s=SUBSTR(FUNC_S+CHR(T),2,6)
	ENDIF
      endif

    endif
    IF T=-29  .and. ( douin=1	.OR. SECR[1]=1 )
      IF  SECR[1]=1
	T=SER_OK_BOSS()
      ELSE
	T=SER_OK()
      ENDIF
      IF T <> 1
	T=0
      ELSE
	T=-29
      ENDIF
    ENDIF
    @ 0,45 SAY	SUBSTR(DTOC(DATE()),7,4)
    @ 0,52 SAY	SUBSTR(DTOC(DATE()),1,2)
    @ 0,57 SAY	SUBSTR(DTOC(DATE()),4,2)
    @ 0,71 SAY	TIME()
    do do_case
    t=0
  ENDDO
ENDDO
clea
clos all
quit





*#INCLUDE "\CLIPLIB\MY_FUNC2.PRG"
* -----------------------------------------------------------------------------
  FUNCTION CURSER2
  PARAMETERS  X1,Y1,XP
  X1=int((X1+XP)*8)
  Y1=INT(Y1*15+15)
  *XP=INT(XP)
   *@ 0,0 SAY ""
   *? CHR(27),"L",X1, ",",Y1-1, ",",X1+7,",",Y1-1,",",0,";"
    *?	CHR(27),"L",X1, ",",Y1-2, ",",X1+7,",",Y1-2,",",0,";"
    *?	CHR(27),"L",X1, ",",Y1-3, ",",X1+7,",",Y1-3,",",0,";"
  RETU
* -----------------------------------------------------------------------------
  FUNCTION CURSER0
  PARAMETERS  XX1,YY1
  XX1=INT(XX1*8)
  YY1=INT(YY1*15+15)
   *@  0,0  SAY ""
  *? CHR(27),"L",XX1, ",",YY1-1, ",",XX1+7,",",YY1-1,";"
  *?  CHR(27),"L",XX1, ",",YY1-2, ",",XX1+7,",",YY1-2,";"
  *?  CHR(27),"L",XX1, ",",YY1-3, ",",XX1+7,",",YY1-3,";"
  RETU
* -----------------------------------------------------------------------------
  FUNCTION HEXTODEC
  PARAMETERS  X
  X=UPPER(X)
  A=SUBSTR(X,1,1)
  B=SUBSTR(X,2,1)
  C=SUBSTR(X,3,1)
  DO CASE
  CASE A="A"
       A=10*256
  CASE A="B"
       A=11*256
  CASE A="C"
       A=12*256
  CASE A="D"
       A=13*256
  CASE A="E"
       A=14*256
  CASE A="F"
       A=15*256
  OTHERWISE
  A=VAL(A)*256
  ENDCASE
  DO CASE
  CASE B="A"
       B=10*16
  CASE B="B"
       B=11*16
  CASE B="C"
       B=12*16
  CASE B="D"
       B=13*16
  CASE B="E"
       B=14*16
  CASE B="F"
       B=15*16
  OTHERWISE
  B=VAL(B) *16
  ENDCASE
  DO CASE
  CASE C="A"
       C=10
  CASE C="B"
       C=11
  CASE C="C"
       C=12
  CASE C="D"
       C=13
  CASE C="E"
       C=14
  CASE C="F"
       C=15
  OTHERWISE
  C=VAL(C)
  ENDCASE
  TDECX=A+B+C
  RETU	TDECX
* -----------------------------------------------------------------------------
FUNCTION  ET3D
PARAMETERS   TROW,TCOL,TGAP,TRX,TRY,STRING
@ 1,0 SAY ""
TROW1=STR(TROW)
TCOL1=STR(TCOL)
TROW2=STR(TROW+1)
TCOL2=STR(TCOL+1)
TROW3=STR(TROW+2)
TCOL3=STR(TCOL+2)
TROW4=STR(TROW+3)
TCOL4=STR(TCOL+3)
TGAP=STR(TGAP)
TRX=STR(TRX)
TRY=STR(TRY)
TRXY=TRX+'/'+TRY
? CHR(27),"T24,&TROW1,&TCOL1,&TGAP,&TRXY,O;&STRING"
? CHR(27),"T24,&TROW2,&TCOL2,&TGAP,&TRXY,O;&STRING"
? CHR(27),"T24,&TROW3,&TCOL3,&TGAP,&TRXY,O;&STRING"
RETURN ""
* -----------------------------------------------------------------------------
PROCEDURE  fun_key
PARAMETERS  P1,P2,P3
F_KEY_LAST=6
LOP_FUNC=1
DO WHILE LOP_FUNC=1
  if t=5
    FDSPA =FDSPA  -1
    If FDSPA  < 0
      FDSPA =F_KEY_LAST
    ENDIF
  else
    FDSPA =FDSPA  +1
    if FDSPA  > F_KEY_LAST
      FDSPA =0
    endif
  endif
  do case
  case FDSPA =0
    LOP_FUNC=0
    SET COLOR TO W+ / &CF
    @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦¥\¯à«ü¥Ü F1-§t¤ô²v   F2-°t¤ñ F3-¥X¨®      F4-°Ñ¼Æ F5-³øªí¦C¦L      ¡ü"
    SET COLOR TO  gr +/ &CF
    @ 24,2  SAY "¡ô¡õ"
    @ 24,20 SAY "F1"
    @ 24,32 SAY "F2"
    @ 24,40 SAY "F3"
    @ 24,53 SAY "F4"
    @ 24,61 SAY "F5"
    SET COLOR TO &C7 +/ &C1
  case FDSPA =1
    LOP_FUNC=0
    SET COLOR TO W+  / &CF
    @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦ F6-¹sÂI F7-¸¨®t F8-¤¤¤î¥[¤ô F9-°_°Ê F10-°_°Ê¤¤¤î  Ctl-End.¡÷µ²§ô  ¡ü"
    SET COLOR TO  gr +/ &CF
    @ 24,2  SAY "¡ô¡õ"
    @ 24,12  say "F6"
    @ 24,20  say "F7"
    @ 24,28  say "F8"
    @ 24,40  say "F9"
    @ 24,48  say "F10"
    @ 24,62  say "Ctl-End.¡÷"
    SET COLOR TO &C7 +/ &C1
  case FDSPA =2
    LOP_FUNC=0
    SET COLOR TO W+  / &CF
    @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦ Ctrl-F4 ½SºÙ®Õ¥¿,Âk¹s Ctrl-F5 ²Ö­p­×¥¿ Ctrl-F8 µwÊ^´ú¸Õ Ctrl-F9   ¡ü"
    SET COLOR TO  gr +/ &CF
    @ 24,2  SAY "¡ô¡õ"
    @ 24,12  say "Ctrl-F4"
    @ 24,34  say "Ctrl-F5"
    @ 24,51  say "Ctrl-F8"
    @ 24,68  say "Ctrl-F9"
    SET COLOR TO &C7 +/ &C1
  case FDSPA =3
    IF	COM_E=1
      SET COLOR TO  W+ / &CF
      @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦ Shift-F1 «È¤á¸ê®Æ¿é¤J Shift-F2 ­û¤u¸ê®Æ¿é¤J Shift-F3  ¨®½ø¸ê®Æ¿é¤J¡ü"
      @ 24,21  SAY  SUBSTR(_F3TXT_A[2],1,4)
      SET COLOR TO  gr +/ &CF
      @ 24,2  SAY "¡ô¡õ"
      @ 24,12  say "Shift-F1"
      @ 24,34  say "Shift-F2"
      @ 24,56  say "Shift-F3"
      SET COLOR TO &C7 +/ &C1
      LOP_FUNC=0
    ENDIF
  case FDSPA =4



    IF	COM_E=1
      SET COLOR TO  W+ / &CF
      &&@ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦                         Shift-F9 °t¤ñ±j«×¿é¤J                        ¡ü"
      && SET COLOR TO  gr +/ &CF

      && @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦ Shift-F4  ¦aÂI¸ê®Æ¿é¤J  Shift-F9 °t¤ñ±j«×¿é¤J                  ¡ü"
      @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦ Shift-F4  °e³f¦aÂI¿é¤J  Shift-F9 °t¤ñ±j«×¿é¤J                  ¡ü"
      && @ 24,21  SAY  ALLTRIM(_F3TXT_A[4])
      SET COLOR TO  gr +/ &CF
      @ 24,2  SAY "¡ô¡õ"
      @ 24,12  say "Shift-F4"
      @ 24,36  say "Shift-F9"
      SET COLOR TO &C7 +/ &C1
      LOP_FUNC=0
    ENDIF



  case FDSPA =5
    LOP_FUNC=0
    SET COLOR TO W+  / &CF
    @ 24,0 SAY	 "¡ü¡ô¡õ-¨ä¥¦ Shift-F5¤é´Á®É¶¡§ó¥¿  Shift-F6 ¾÷±ñ®e¶q­×¥¿ Shift-F7 ¤p¤J®Æ­×¥¿   ¡ü"
    SET COLOR TO  gr +/ &CF
    @ 24,2  SAY "¡ô¡õ"
    @ 24,12  say "Shift-F5"
    @ 24,34  say "Shift-F6"
    @ 24,56  say "Shift-F7"
    SET COLOR TO &C7 +/ &C1
  case FDSPA =6
    IF	_AUTO_FLOR=1
      SET COLOR TO  W+ / &CF
      @ 24,0 SAY "¡ü¡ô¡õ-¨ä¥¦ Shift-F8 ¤@¦¸¦Û°Ê­×¥¿¸¨®t³Ì¤j­«                                   ¡ü"
      SET COLOR TO  gr +/ &CF
      @ 24,2  SAY "¡ô¡õ"
      @ 24,12  say "Shift-F8"
      SET COLOR TO &C7 +/ &C1
      LOP_FUNC=0
    ENDIF
  endcase
ENDDO
RETURN
* -----------------------------------------------------------------------------
FUNCTION NREAD
PARAMETERS  NRY1,NRX1,PPX,LONG,x_func,ndspen
if empty(ndspen)
  ndspen="T"
endif
XPX=PpX
pgm=x_func
SET COLOR TO N/W *
CHRN=XPX
@ NRY1,NRX1  SAY CHRN
SET COLOR TO 7/0
     XP=0
       t=0
       SET COLOR TO W+	/ R
		  @ NRY1,(NRX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
       SET COLOR TO &C7 +/ &C1
       *CURSER2(NRX1,NRY1,XP)
       set colo to gr + * /bl
       @ NRY1,NRX1 say	substr(chrn,XP+1,1)
	 set colo to &c7 + /&c1
       NRXX1=NRX1+XP
       NRYY1=NRY1
       T1=0
       TN1=0
       DO WHILE T1<>233
       T=0
       INFUNC=1
       DO WHILE  T=0
	 if ndspen="T"
	 DO DSP2
	 if T0A=0
	   DO LUSTP
	   ENDIF
	 endif
	 IF T0A <>0
	   T=T0A
	   T0A=0
	 ELSE
	   T=INKEY( )

	 ENDIF

       ENDDO

       DO CASE
	  case	T=19
		IF XP>=1
		XP=XP-1
		*CURSER0(NRXX1,NRYY1)
		SET COLOR TO N/W *
		@ NRY1,NRX1  SAY CHRN
		SET COLOR TO 7/0
		SET COLOR TO W+  / R
		@ NRY1,(NRX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
		SET COLOR TO &C7 +/ &C1
		*CURSER2(NRX1,NRY1,XP)
		NRXX1=NRX1+XP
		NRYY1=NRY1
		ENDIF
	  CASE	T=4
		IF XP<=LONG-2
		XP=XP+1
		*CURSER0(NRXX1,NRYY1)
		SET COLOR TO N/W  *
		@ NRY1,NRX1  SAY CHRN
		SET COLOR TO 7/0
		SET COLOR TO W+  / R
			   @ NRY1,(NRX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
		SET COLOR TO &C7 +/ &C1
		*CURSER2(NRX1,NRY1,XP)
		NRXX1=NRX1+XP
		NRYY1=NRY1
		ENDIF
	  CASE	 T>=32
	     XP=XP+1
	     IF TN1=0 .AND. XP=1
	       TN1=1
	       CHRN=SPACE(LONG)
	     ENDIF
	     IF XP<LONG
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,LONG-XP)
		SET COLOR TO N/W *
	     @ NRY1,NRX1  SAY CHRN
	     SET COLOR TO 7/0
	     *CURSER0(NRXX1,NRYY1)
	     SET COLOR TO W+  / R
			@ NRY1,(NRX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
	     SET COLOR TO &C7 +/ &C1
	     *CURSER2(X1,Y1,XP)
	     NRXX1=NRX1+XP
	     NRYY1=NRY1
	     ELSE
	     CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
		SET COLOR TO N/W *
	     @ NRY1,NRX1  SAY CHRN
	     SET COLOR TO 7/0
	     XP=XP-1
	     SET COLOR TO W+  / R
			@ NRY1,(NRX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
	     SET COLOR TO &C7 +/ &C1
	     *CURSER2(X1,Y1,XP)
	     NRXX1=NRX1+XP
	     NRYY1=NRY1
	     ENDIF
	  CASE T=13   .OR. T=23 .OR. T=5 .OR. T=24 .OR. T=27.OR. T=-4 .OR. T=-6 .OR. T=-9 .OR. T=K_PGUP .OR. T=K_PGDN .OR. T=K_F6
	       T1=233
	      XPX=CHRN
	       TNSTP=T
	       INFUNC=0
	  CASE T=28
	      IF  pgm	  <> " "
	      DO &pgm
	      ENDIF
	       T1=233
	      XPX=CHRN
	       TNSTP=T
	       INFUNC=0
       ENDCASE
       ENDDO
RETU   TNSTP

* -----------------------------------------------------------------------------
FUNCTION SER_OK_o
SER_X=VAL(SUBSTR(DTOC(DATE()),1,1))
SER_X=SER_X +VAL(SUBSTR(DTOC(DATE()),2,1))
SER_X=SER_X +VAL(SUBSTR(DTOC(DATE()),4,1))
SER_X=SER_X +VAL(SUBSTR(DTOC(DATE()),5,1))
SER_X=SER_X +VAL(SUBSTR(DTOC(DATE()),7,1))
SER_X=SER_X +VAL(SUBSTR(DTOC(DATE()),8,1))
SER_X=(SER_X * 2)  +9
SER_XW=DOW(DATE())-1
IF  SER_XW =0
  SER_XW=7
ENDIF
SER_XW=STR(SER_XW,1,0)
IF  SER_X <100
  SER_X=SER_X * 10
  SER_X=STR(SER_X,3,0)
  SER_X=SUBSTR(SER_X,1,1) + SER_XW + SUBSTR(SER_X,2,2)
ELSE
  SER_X=STR(SER_X,3,0)
  SER_X=SUBSTR(SER_X,1,2) + SER_XW + SUBSTR(SER_X,3,1)
ENDIF
SER_STP=1
SER_OK=1
DO WHILE SER_STP <=4
  T_SER=0
  DO  WHILE T_SER=0
    T_SER=INKEY()
   *DO DSP2
  ENDDO
  IF  CHR(T_SER) <> SUBSTR(SER_X,SER_STP,1)
    SER_OK=0
    EXIT
  ENDIF
  SER_STP=SER_STP +1
ENDDO
RETU SER_OK

* -----------------------------------------------------------------------------
FUNCTION CKS
sele 5
GOTO TOP
cks_1=0
DO WHILE .NOT. EOF()
  cks_1=cks_1+PA1+PA2+PA3+PA4+PA5+PA6+PA7+PA8
  SKIP
ENDDO
IF cks_1<> CKS
  if  cks <> 168
  clea
  @ 0,0  SAY "DataBase Not Found !  Press Any Key To Continue"
  T=SER_OK()
  endif
  IF  T= 1 .or. cks =168
    CKS=cks_1
     && 20141123 SAVE TO indata_a
    @ 0,0  SAY "             "
  ELSE
    QUIT
  ENDIF
ENDIF
RETU  ""
* -----------------------------------------------------------------------------
FUNCTION SUBOD
PARAMETERS  X1,Y1
X1=X1-Y1
RETU X1

* -----------------------------------------------------------------------------
FUNCTION DRNO_C
PARAMETERS  X1,Y1
X1_N=X1
DO WHILE  X1_N >1
* DRSTA_N
ENDDO
RETU Y1


&& PROCEDURE  DEMO_INP
&& PARAMETERS  P1,P2,P3
&& IF  STP1=3
&&   XX=WDATA(0)
&&   XX=XX+demo_n
&&   IF  XX <= 4096
&&     SETMEM(HEXTODEC("254"),INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP2=3
&&   XX=WDATA(0)
&&   XX=XX+demo_n
&&   IF  XX <= 4096
&&     SETMEM(HEXTODEC("254"),INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP3=3
&&   XX=WDATA(1)
&&   XX=XX+demo_n
&&   IF  XX <= 4096
&&     SETMEM(HEXTODEC("256"),INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP4=3
&&   XX=WDATA(1)
&&   XX=XX+demo_n
&&   IF  XX <= 4096
&&     SETMEM(HEXTODEC("256"),INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP2=5
&&   XX=WDATA(0)
&&   XX=XX-(demo_n * 2)
&&   IF  XX >= 2048
&&     SETMEM(HEXTODEC("254"),INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP4=5
&&   XX=WDATA(1)
&&   XX=XX-(demo_n * 2)
&&   IF  XX >= 2048
&&     SETMEM(HEXTODEC("256"),INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP5=3
&&   XX=WDATA(KLCHN)
&&   XX=XX+demo_n
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )
&&   IF  XX <= 4048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP6=3
&&   XX=WDATA(KLCHN+1)
&&   XX=XX+demo_n
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )+2
&&   IF  XX <= 4048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP7=3
&&   XX=WDATA(KLCHN+2)
&&   XX=XX+demo_n
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +4
&&   IF  XX <= 4048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP9=3
&&   XX=WDATA(KLCHN+2)
&&   XX=XX+demo_n
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +4
&&   IF  XX <= 4048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP8=3
&&   XX=WDATA(KLCHN+3)
&&   XX=XX+demo_n
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +6
&&   IF  XX <= 4048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP5=5
&&   XX=WDATA(KLCHN)
&&   XX=XX-(demo_n * 2)
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )
&&   IF  XX >= 2048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP6=5
&&   XX=WDATA(KLCHN+1)
&&   XX=XX-(demo_n * 2)
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +2
&&   IF  XX >= 2048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP7=5
&&   XX=WDATA(KLCHN+2)
&&   XX=XX-(demo_n * 2)
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +4
&&   IF  XX >= 2048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP8=5
&&   XX=WDATA(KLCHN+3)
&&   XX=XX-(demo_n * 2)
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +6
&&   IF  XX >= 2048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& IF  STP9=5
&&   XX=WDATA(KLCHN+2)
&&   XX=XX-(demo_n * 2)
&&   X=(2*16*16) + (5 *16) + 4 + (KLCHN * 2 )  +4
&&   IF  XX >= 2048
&&     SETMEM(X,INT(XX))
&&   ENDIF
&& ENDIF
&& RETU

PROCEDURE  DEMO_txt
PARAMETERS  P1,P2,P3
@  7,13  say "³Õ³Ç¬ì§Þ ¢â¢Ó¢Ú¡G¡]¢¯¢¶¡^¢²¢±¢²¢±¢³¢µ¢·¡A¢²¢³¢¶¢°¢°¢±¢³"
xx=300
*save scre to scrma
SCRMA=savescreen(1,0,24,79)
do  while xx >=150
 ? CHR(27),"T16;"
  rest scre from scrma
 x="³Õ³Ç¬ì§Þ"
set colo to gr+ / b
 ET3D(130,xx,13,3,3,x)
 xx=xx-4
enddo
set colo to w/b
RETU
**-----------------------------------------------------------------------------
FUNCTION READ2_s
PARAMETERS  PX,X1,Y1,TNSTP,LONG
XPX=pX
X1=X1-1
SET COLOR TO 0/7 *
IF TNSTP<>9
  SET COLOR TO 0 * /7
  @ Y1,X1  SAY XPX  PICT "9999"
  CHRN=STR(INT(XPX),4)
ELSE
  SET COLOR TO 0 * /7
  @ Y1,X1  SAY XPX  PICT "99.99"
  CHRN=STR(XPX,5,2)
ENDIF
XP=0
t=0
SET COLOR TO W+  / R
@ y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
SET COLOR TO 7/0
*CURSER2(X1,Y1,XP)
XX1=X1+XP
YY1=Y1
T1=0
TN1=0
DO WHILE T1<>233
  T=0
  DO WHILE  T=0
    T=INKEY( )
    DO DSP2
    DO LUSTP
  ENDDO
  DO CASE
  case	T=19
    IF XP>=1
      XP=XP-1
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ENDIF
  CASE	T=4
    IF XP<=LONG-2
      XP=XP+1
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO &C1 */ &C7 +
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ENDIF
  CASE	 T=43 .OR.T=45 .OR.T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
    XP=XP+1
    IF TN1=0 .AND. XP=1
      TN1=1
      IF  TNSTP<>9
	CHRN="    "
      ELSE
	CHRN="     "
      ENDIF
    ENDIF
    IF XP<LONG
      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,LONG-XP)
      SET COLOR TO 0/7	*
      IF  VAL(CHRN)>=1000
	CHRN="    "
      ENDIF
      @ Y1,X1  SAY CHRN
      SET COLOR TO 7/0
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ELSE
      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
      SET COLOR TO 0/7
      IF  TNSTP<>9
	IF  VAL(CHRN)>=1000
	  CHRN="    "
	ENDIF
      ELSE
	IF  VAL(CHRN)>=100
	  CHRN="     "
	ENDIF
      ENDIF

      @ Y1,X1  SAY CHRN
      SET COLOR TO 7/0
      XP=XP-1
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ENDIF
  CASE T=13   .OR. T=23 .OR. T=5 .OR. T=24.or. t=2
    T1=233
    IF TNSTP<>9
      XPX =INT(VAL(CHRN))
      PX=XPX
      @ Y1,X1  SAY  PX	 PICT "9999"
    ELSE
      XPX =INT(VAL(CHRN)*100)/100
      IF XPX > 100
	XPX=1
      ENDIF
      PX=XPX
      @ Y1,X1  SAY  PX	 PICT "99.99"
    ENDIF
    SELE 5
    IF TNSTP=8
      GOTO 22
      REPL PA3 WITH PX
    ELSE
      GOTO 3
      CHNO=LTRIM(STR(TNSTP))
      IF TNSTP=9
	CHNO=STR(8,1,0)
      ENDIF
      REPL PA&CHNO WITH PX
    ENDIF
    DO CASE
    CASE T=5
      IF TNSTP>1
	TNSTP=TNSTP-1
      ENDIF
    CASE T=24  .OR. T=13
      TNSTP=TNSTP+1
    ENDCASE
    IF T=23 .or. t=2
      TNSTP=10
    ENDIF
  CASE T=27
    SET COLOR TO 0/7
    XPX=PX
    IF TNSTP<>9
      @ Y1,X1  SAY XPX	PICT "9999"
      CHRN=STR(INT(XPX),4)
    ELSE
      @ Y1,X1  SAY XPX	PICT "99.99"
      CHRN=STR(XPX,5,2)
    ENDIF
    SET COLOR TO 7/0
    XP=0
    t=0
    *CURSER0(XX1,YY1)
    *CURSER2(X1,Y1,XP)
    XX1=X1+XP
    YY1=Y1
  ENDCASE
ENDDO
RETU   TNSTP
&&-----------------------------------------------------------------------------
FUNCTION dsk_sno
PARAMETERS  dn
#DEFINE F_BLOCK 73
CBUFFER=SPACE(F_BLOCK)
! vol &dn > c:\TEST.TMP
NHANDLE=fopen("c:\TEST.TMP")
FREAD(NHANDLE,@CBUFFER,F_BLOCK)
x=SUBSTR(ALLTRIM(CBUFFER),-11,9)
fCLOSE("c:\TEST.TMP")
delE file   c:\test.tmp
retu x
**-----------------------------------------------------------------------------
FUNCTION SER_AOK   && NO=4809
SER_X="4809"
SER_OK=1
SER_STP=1
DO WHILE SER_STP <=4
  T_SER=0
  DO  WHILE T_SER=0
    T_SER=INKEY()
   *DO DSP2
  ENDDO
  IF  CHR(T_SER) <> SUBSTR(SER_X,SER_STP,1)
    SER_OK=0
    EXIT
  ENDIF
  SER_STP=SER_STP +1
ENDDO
RETU SER_OK
&&-----------------------------------------------------------------------------
PROCEDURE  DSK_KEY
PARAMETERS  P1,P2,P3
CLEA
a_s=space(9)
c_s=space(9)
AN="A:"
CN="C:"
SET CURS ON
@ 5,10 SAY "AN " GET  AN
@ 6,10 SAY "CN " GET  CN
READ
A_s=dsk_sno(AN)
c_s=dsk_sno(CN)
@ 5,10 SAY "AS " GET  A_S
@ 6,10 SAY "CS " GET  C_S
READ
 && 20141123 SAVE TO indata_a
RETU

&&-----------------------------------------------------------------------------
PROCEDURE  lu_dsp
PARAMETERS  P1,P2,P3
CLEAR
SET COLOR TO &C2 / &C1
*@ 0,0 SAY "°t¤ñ®e¶q:        ²Ö­p¦Ì¼Æ:             ¤é´Á:     ¦~   ¤ë   ¤é ¡@  ®É¶¡:         "
*@ 1,0 SAY "                                                                                "
SET COLOR TO &C2 / &C1
SELE 5
*@ 3,0 SAY "¡@¡@                               "
goto 34
DO CASE
   CASE LCHTYPE=99
      goto 65
      GS_TOT=PA1
      if (gs_tot=0)
	 GS_TOT=1
      endif
      KLCHN=PA2
      if (KLCHN=0)
	 KLCHN=1
      endif
      KUCHN=PA3
      if (KUCHN=0)
	 KUCHN=1
      endif
      UWC_TOT=PA4
      if (UWC_TOT=0)
	 UWC_TOT=8
      endif
      water_tot=pa6
      c_tot=pa7
      ae_tot=pa8
      WATER_OUT_NO=ALLTRIM(STR(PA5,2,0))
      if (WATER_OUT_NO="0")
	 WATER_OUT_NO="7"
      endif
      PUBLIC  G_TOT
      G_TOT =PA9
      PUBLIC  STPNOUSE
      STPNOUSE=PA5-PA1-1
      IF  STPNOUSE <0
	 STPNOUSE=0
      ENDIF
      FOR  X=1 TO   (KLCHN + KUCHN  )
	  SETLZA(X-1,A_M_NAME[X,7])
      NEXT
	 woff_code=-7
      if pa12 =32
	 woff_code=int(pa12)
      end
ENDCASE
SETTOTW(KLCHN+KUCHN+1)
IF DRFME=3
  DO CASE
  CASE	UCHTYPE=1
    NNN=LTRIM(STR(KLCHN+3,5,0))
    && TOTANK&NNN=0
  CASE	UCHTYPE=2
    NNN=LTRIM(STR(KLCHN+2,5,0))
    && TOTANK&NNN=0
  ENDCASE
ENDIF
SET COLOR TO &C4 / &C1
CLEAMIX()
DOUT(8,0)
DOUT(9,0)
CLEADROP()
CLEAOUT()

x=INT(DISKSPACE( DAA )/1024)
if  douin=1
  x=1221
endif
*@ 22,70  SAY x   PICT "9999"
sele 3
SET DELE OFF
GOTO TOP
IF .NOT. EOF()
  ASCANO=SCANO
ENDIF
ACARNO=CARNO
ARATNO=RATNO
AVUSE=VUSE
ATANDO=TANDO
*@ 23,13 SAY ASCANO  PICT "99999"
*@ 23,24 SAY ACARNO
*@ 23,37 SAY ARATNO
*@ 23,52 SAY AVUSE   PICT "99.9"
*@ 23,61 SAY ATANDO  PICT "9999"
*IF  WASTE=1
*  @ 23,71 SAY APOSITION
*ENDIF
DELE
set dele off
RETU


&&-----------------------------------------------------------------------------
PROCEDURE  DO_CASE
PARAMETERS  P1,P2,P3
DO CASE
CASE  T=5 .OR. T=24
  DO FUN_KEY
CASE T=-99 .and. star=0
  xyratvol=ratvol
  do ratvolpg
  ratvol=xyratvol
CASE T=-20  && disc 0.5 m 3
  IF DISCH1=0
    DISCVOL=0.5
    DISCH1=1
    DISC1=0
    @ 18,16 SAY "A,"
    if f_disproc>0
      f_discproc=1
    endif
  ELSE
    DISCH1=0
    DISC1=0
    DISCVOL=0
    @ 18,16 SAY " ,"
    if f_disproc>0
      f_discproc=2
    endif
  ENDIF
CASE T=-21  && disc 1 m3
  IF DISC1=0
    DISC1=1
    DISCH1=0
    DISCVOL=1
    @ 18,16 SAY "B,"
  ELSE
    DISC1=0
    DISCVOL=0
    DISCH1=0
    @ 18,16 SAY " ,"
  ENDIF
CASE T=-22  &&disc c1 ? kg
  DO DISC2
  if f_disproc>0
    f_discproc=1
  endif
CASE T=-25  &&disc c2 ? kg
  PGM=" "
  NREAD(18,18,STR(disc2_c2,3,0),3,pgm,"T")
  disc2_c2 =VAL(XPX)
  SET COLOR TO w  / &C1
  @ 18,18  SAY disc2_c2   PICT "999"
  if f_disproc>0
    f_discproc=1
  endif
case (t=K_LEFT ) .OR. (t=K_RIGHT)
     WADJ_CN=CHG_WADJ_CN(WADJ_CN,T,G_TOT+1,GS_TOT)
     *PARAMETERS  INDEX,K_CODE,NMIN,NMAX
case (t=K_PLUS) .OR. (t=K_MINU) .OR. (t=K_EQU) .OR. (t=K_DASH)
     CHG_WATER_INC(WADJ_CN,T,@WATER_INC,-9.9)
     *PARAMETERS  INDEX,K_CODE,_WATER_INC
case t=-23  .and.  star=0
  *save scre to SCRMA
  do setadj
  cks=168
  cks()
  errorlevel(255)
  quit
  *rest scre from scrma
  td1=0
  clea
  PARDO=1
  DO  LU12_DSP
CASE T=28
  SCRRA1=savescreen(19,0,22,79)
  t=0
  IF WATER_INPUT=1
    MODI_PAGE=.F.
    DO W_IN
    SELE 5
    GOTO 33
    if pa14=42
       goto 42
    endif
    G1_WATeR_E=0
    G2_WATeR_E=0
    S1_WATeR_E=0
    S2_WATeR_E=0
    if	star=1
      IF  (G1_WATER<>PA1)
	G1_WATER_F=PA1-G1_WATER
	W_WATER_F=1
	G1_WATeR_E=G1_WATER_F
      ENDIF
      IF  (G2_WATER<>PA2)
	G2_WATER_F=PA2-G2_WATER
	G2_WATER_E=G2_WATER_F
	W_WATER_F=1
      ENDIF
      IF  (S1_WATER<>PA3 )
	S1_WATER_F=PA3-S1_WATER
	S1_WATER_E=S1_WATER_F
	W_WATER_F=1
      ENDIF
      IF  (S2_WATER<>PA4)
	S2_WATER_F=PA4-S2_WATER
	S2_WATER_E=S2_WATER_F
	W_WATER_F=1
      ENDIF
    endif
    G1_WATER=PA1
    G2_WATER=PA2
    S1_WATER=PA3
    S2_WATER=PA4

    && TER_INC[1]=PA1
    && WATER_INC[2]=PA2
    && WATER_INC[3]=PA3
    && WATER_INC[4]=PA4
    && WATER_INC[5]=PA5
    && WATER_INC[6]=PA6

    && function  RW_WAadj  && (xIndex,isRWall,isRead)
    RW_WAadj(1,1,1)  && (xIndex,isRWall,isRead)




  ELSEIF WATER_INPUT=99
   && SCRRA_1=savescreen(19,0,24,79)
   DSPCASE=-2
   IF COM_E  =0
    * DO pah
   ELSE
     *DO  PAH_N
   ENDIF
   T=0
   && restscreen(19,0,24,79,scrRA_1)
   SET COLOR TO &C7 +/ &C1
   @ 23,9  SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-9,9)
   @ 23,28 SAY ACARNO
   @ 23,37 SAY ARATNO
   @ 23,64 SAY AVUSE   PICT "99.9"
   @ 23,74 SAY ATANDO  PICT "9999"
   *IF	WASTE=1
    @ 23,71 SAY substr(space(10)+alltrim(APOSITION),-9,9)
   *ENDIF
  ENDIF
  restscreen(19,0,22,79,scrRA1)
  DSPCASE=0
  FDSPA=0
  DO  LU12_DSP

#ifdef	_dfRaten_2Page




#else
case t=-1
  t=0
  set cons ON
  SCRMA1=savescreen(13,0,24,79)
  xd_wno=fSelectNo()

  && DO RATEN  with  0
  aisdatachg=0
  F3_RUN=-1
  RATEN(0,@aisdatachg,"2")
  F3_RUN=0
  if aisdatachg=1
      SELE 2
      repl   ratno   with  fsubstr(ratno,-ratno_wid," ",0)    for  recno() >0
      DELE FOR	ALLTRIM(RATNO)="0"  .OR.  EMPTY(ALLTRIM(RATNO)) =.T.
      PACK
      dele FILE w2.dbf
      X=MEMORY(2)
      SORT  ON	RATNO	TO W2
      dele FILE w3.dbf
      USE
      use w2
      TOTA ON RATNO   TO  W3
      USE
      IF   ROM_N=1
	IF FILE("W3.DBF")=.T.
	  DELE FILE  \W1.DBF
	  COPY FILE W3.DBF   TO c:\W1.DBF
	  use
	  USE  C:\W1
	ENDIF
      ELSE
	IF FILE("W3.DBF")=.T.
	  DELE FILE  W1.DBF
	  COPY FILE W3.DBF   TO  W1.DBF
	  use
	  USE  W1
	ENDIF
      ENDIF
    endif  && if aisdatachg=1
    sele &xd_wno
    set cons on
    if star=0
      CLEA
      DO  LU12_DSP
    else
      @ 13,0 clea to   24,79
      restscreen(13,0,24,79,scrma1)
      @ 23,9  SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-9,9)
      @ 23,24 SAY ACARNO
      @ 23,37 SAY ARATNO
      @ 23,52 SAY AVUSE   PICT "99.9"
      @ 23,61 SAY ATANDO  PICT "9999"
      SET COLOR TO &C5 +/ &C1
      @ 18,0 SAY "4.ºÏºÐ®e¶q:      ,000 "
      SET COLOR TO w+ / &C1
      @ 18,11	SAY DISKVOL
      X=_Tot_d_a[20,4] +2
      if ( _Tot_d_a[10,X] <>  NIL )
	if ( _Tot_d_a[10,X] > 0)  .and.  star=1
	  set colo to  w+ /n
	  @ 15,12 say _Tot_d_a[18,X]
	  @ 16,12 say _Tot_d_a[10,X]  PICT  "99.9"
	  @ 17,12 SAY  ACT_V  PICT  "99.9"
	ENDIF
      ENDIF
      *IF  WASTE=1
	@ 23,71 SAY substr(space(10)+alltrim(APOSITION),-9,9)
      *ENDIF
    endif
    sele &xd_wno

#endif

Case t=-10 .and.  star=0   .AND.  COM_E=1
  *save scre to SCRMA
  clea
  DO PGM15
  COMMIT
  *rest scre from scrma
  set curs off
  set cons  on
  commit
  *LU12_DSP(LCHTYPE,UCHTYPE)
  SET COLOR TO W+ / &C1
  CLEA
  DO  LU12_DSP
case t=-309	     &&alt_f1
   if DSPD_NOR=0
     DSPD_NOR = 1
     DSPD_NOR = 1
     DspSetData(1)
     SET COLOR TO w +/ &C1
     @ 0,66 SAY "®É¶¡"
   ELSE
     if dspd_nor=1
       DspSetData(8)
       DSPD_NOR=0
       SET COLOR TO &c5 +/ &C1
       @ 0,66 SAY "®É¶¡"
     endif
   ENDIF



case t=-11 .and.  star=0   .AND.  COM_E=1
  *save scre to SCRMA
  clea
  DO PGM16
  COMMIT
  *rest scre from scrma
  set curs off
  set cons  on
  commit
  SET COLOR TO W+ / &C1
  CLEA
  DO  LU12_DSP
case t=-12 .and.  star=0   .AND.  COM_E=1	  &&S-F3 CAR DATA INPUT
  *save scre to SCRMA
  DO  D_CAR_DATA
  COMMIT
  *rest scre from scrma
  set curs off
  set cons  on
  commit
  DO  LU12_DSP
case t=-13 .and.  star=0   .AND.  COM_E=1	  &&S-F4 addr.DATA INPUT
  *save scre to SCRMA
  DO  D_add_DATA
  COMMIT
  *rest scre from scrma
  set curs off
  set cons  on
  commit
  DO  LU12_DSP
case t=-18 .and.  star=0 &&.AND.  COM_E=1	  &&S-F9 STRAIT±j«×    DATA INPUT
  *save scre to SCRMA
  && DO  D_STRO
  D_STRO(19,3,4,"Y")
  COMMIT
  *rest scre from scrma
  set curs off
  set cons  on
  commit
  DO  LU12_DSP
CASE  T=-24
  T=0
  DO LULAG
  SET COLOR TO &C7 +/ &C1
  @ 0,26  say lagw pict  "9999.9"
case t=-2
  F3_RUN=1
  SCRRA1=savescreen(19,0,24,79)
  DSPCASE=-2
  IF COM_E  =0
    IF	STAR=0
      DO   PAH1
      DO FUN_KEY
    ELSE
      DO  NPAH1
    ENDIF
  ELSE
    FAULT_PNT=0
    DO	PAH_N
    restscreen(19,0,24,79,scrRA1)
    IF	FAULT_PNT <> 0
      set curs off
      set cons	on
      DO  LU12_DSP
    ENDIF
    SET COLOR TO &C7 +/ &C1
    @ 23,9  SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-9,9)
    @ 23,24 SAY ACARNO
    @ 23,37 SAY ARATNO
    @ 23,52 SAY AVUSE	PICT "99.9"
    @ 23,61 SAY ATANDO	PICT "9999"
   *IF	WASTE=1
    @ 23,71 SAY substr(space(10)+alltrim(APOSITION),-9,9)
   *ENDIF
  ENDIF
  IF  STAR=0
    S_GET_MIX_DATA ()
  ENDIF
  DSPCASE=0
  FDSPA=0
  T=0
  sele 5
  COLOR="B  G  BG R  RB GR W  B+ G+ BG+R+ RB+GR+W+ "
  GOTO 20
  c8=SUBSTR(COLOR,MOD(INT(PA1),16)*3+1,3)
  C9=SUBSTR(COLOR,MOD(INT(PA2),16)*3+1,3)
  C10=SUBSTR(COLOR,MOD(INT(PA3),16)*3+1,3)
  C11=SUBSTR(COLOR,MOD(INT(PA4),16)*3+1,3)
  C12=SUBSTR(COLOR,MOD(INT(PA5),16)*3+1,3)
  C13=SUBSTR(COLOR,MOD(INT(PA6),16)*3+1,3)
  C14=SUBSTR(COLOR,MOD(INT(PA7),16)*3+1,3)
  PNT0_EN=1
case t=-14 .and.  star=0
  save scre to SCRMA
  set curs oN
  SET COLOR TO W+   / N ,  W+  / R
  clea
  @ 10,20 SAY "Current  Date Is  "
  @ 11,20 SAY "Enter New  Date  (MM-DD-YY):   -  -  "
  @ 10,39 say date()
  D1=YEAR(DATE())
  D2=VAL(SUBSTR(DTOC(DATE()),1,2))
  D3=VAL(SUBSTR(DTOC(DATE()),4,2))
  @ 11,49   GET D2 PICT "99" RANG 1,12
  @ 11,52   GET D3 PICT "99" RANG 1,31
  @ 11,55   GET D1 PICT "9999"
  READ
  IF ( D1 > 2099 )  .OR. (D1 <1980)
    D1=YEAR(DATE())
  ENDIF
  D1=WRITE_DATE(D1,D2,D3)
  @ 14,20 SAY "Current  Time Is  "
  @ 15,20 SAY "Enter New  Time      :  :  "
  @ 14,39 say time()
  D1=VAL(SUBSTR(time(),1,2))
  D2=VAL(SUBSTR(time(),4,2))
  D3=VAL(SUBSTR(time(),7,2))
  @ 15,39   GET D1 PICT "99" RANG 0,23
  @ 15,42   GET D2 PICT "99" RANG 0,59
  @ 15,45   GET D3 PICT "99"  RANG 0,59
  READ
  D1=WRITE_TIME(D1,D2,D3,0)
  rest scre from scrma
  set curs off
  SET COLOR TO &C7 +/ &C1
  IF	ENGL=0
    @ 0,45 SAY	SUBSTR(DTOC(DATE()),7,4)
    @ 0,52 SAY	SUBSTR(DTOC(DATE()),1,2)
    @ 0,57 SAY	SUBSTR(DTOC(DATE()),4,2)
  else
    @ 0,45 say	date()
  endif
  SET COLOR TO &C2 / &C1
  DO  LU12_DSP
CASE  T=-15  .and. star=0
  NREAD(0,9,STR(RATVOL,4,1),4," ","T")
  IF VAL(XPX) <=RATVOL_S
    RATVOL=VAL(XPX)
  ELSE
    RATVOL=RATVOL_S
  ENDIF
  @ 0,9  SAY ratvol PICT "99.9"
  T=0
&& CASE  T=-16	.and. star=0
CASE  T=-16
  MODI_PAGE=.F.
  SCRRA1=savescreen(19,0,22,79)
  *DO DSP4
  DO DSP3  with 3,"¤p¤J®Æ"
  FDSPA=0
  GOTO 3
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    ERKG&IX_C := PA&IX_C
  NEXT
  restscreen(19,0,22,79,scrRA1)
  DO FUN_KEY
  T=0
  DO  LU12_DSP
CASE  T=-17
  IF OP_MODe<>" "
     OP_MODE=" "
     @	19,0  CLEA  TO	22,79
  ELSE
     OP_MODE="S_F8"
  ENDIF
CASE  T=-17  .and. star=0 .and. _auto_flor=1
  SCRRA1=savescreen(21,0,24,79)
  DO _AUTO_MAXIN
  FDSPA=0
  restscreen(21,0,24,79,scrRA1)
  DO FUN_KEY
  T=0
case t=-3
  T=0
  IF  STAR=1
    x=_Tot_d_a[20,4]+2
    IF _Tot_d_a[10,X]>0
      DO  _CHANGE_DATA
    ENDIF
  ENDIF
  IF  STAR=99
    x=_Tot_d_a[20,4]+2
    @ 15,12 say _Tot_d_a[18,X]
    @ 16,12 say _Tot_d_a[10,X]	PICT  "99.9"
    disc_totm=str(_Tot_d_a[10,X],4,1)
    PGM=" "
    if val(disc_totm) >0
      NREAD(16,12,disc_totm,3,pgm,"T")
      disc_totm =VAL(XPX)
      SET COLOR TO w  / &C1
      x=_Tot_d_a[20,4]+2
      if disc_totm <_Tot_d_a[10,X]
	IF disc_totm >= A_PRESS_N0[L_PRESS,STPN1,1,6]
	  XAP1=STPN1
	  XAP0=XAP1
	  SETVN0=A_PRESS_N0[L_PRESS,XAP1,1,6]
	  SETVN1=A_PRESS_N0[L_PRESS,XAP1,1,6]
	  DO WHILE disc_totm >= A_PRESS_N0[L_PRESS,XAP1,1,6]
	    SETVN0=A_PRESS_N0[L_PRESS,XAP1,1,6]
	    XAP1=XAP1+1
	    XAP0=XAP1
	  ENDDO
	  XAP1=XAP0
	  SETVN1=A_PRESS_N0[L_PRESS,XAP1,1,6]
	  for xap2=1  to kind
	    A_PRESS_N0[L_PRESS,XAP1,XAP2,6] :=DISC_TOTM
	    XAP3=(DISC_TOTM-SETVN0)/A_PRESS_N0[L_PRESS,XAP1,XAP2,5]
	    A_PRESS_N0[L_PRESS,XAP1,XAP2,1] :=A_PRESS_N0[L_PRESS,XAP1,XAP2,1] * XAP3
	    A_PRESS_N0[L_PRESS,XAP1,XAP2,3] :=A_PRESS_N0[L_PRESS,XAP1,XAP2,3] * XAP3
	    A_PRESS_N0[L_PRESS,XAP1,XAP2,5] :=DISC_TOTM-SETVN0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,1] :=0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,2] :=0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,3] :=0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,4] :=0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,5] :=0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,6] :=0
	    A_PRESS_N0[L_PRESS,XAP1+1,XAP2,7] :=0
	  NEXT
	  x=_Tot_d_a[20,4]+2
	  _Tot_d_a[10,X]=disc_totm
	ENDIF
      endif
      x=_Tot_d_a[20,4]+2
      @ 16,12  SAY _Tot_d_a[10,X]   PICT "99.9"
    endif
  ENDIF
  DSPCASE=-3
  IF KOT=0
    DO	SETPAR0
  ENDIF
  DO  SETPAR1
  DSPCASE=0
  DO FUN_KEY
  SET COLOR TO &C7 +/ &C1
  FDSPA=0
  IF SPACIAL_0=1    .AND.  STAR=0
    DO	MDYSPATM
  ENDIF
  DO  LU12_DSP
case t=-28  .and.  star=0

  *C_BUFF=SPACE(20)
  *@ 5,5  GET  C_BUFF
  *READ
  *N=0
  *C_BUFF=ALLTRIM(C_BUFF)
  *IF EMPTY(C_BUFF)=.F.
  *   N=SIO_WRITE(0,C_BUFF)
  *   @  6,5  say  n
  *   inkey(3)
  *ENDIF
  *X=SER_NO(8)
  *IF  X="0246"
  *  MNIDSP=1
  *ENDIF
  t=0
  DO  D_REMOTE
case t=-29  .and.  star=0
  *save scre to SCRMA
  do setparN
 *do setparN1
  *rest scre from scrma
  errorlevel(255)
  quit
  td1=0
  clea
  PARDO=1
  X=MEMORY(2)
  DO  LU12_DSP
case t=-4  .and.  star=0
  *save scre to SCRMA
  SET COLOR TO &C2 / &C1
  set cons ON
  do  sa
  SET CURS Off
  CLEA
  *rest scre from SCRMA
  SET COLOR TO &C7 +/ &C1
  set curs off
  set cons on
  _TOT_D_A[20,3] :=0
  _TOT_D_A[20,4] :=0	  && FIST  INPUT
  SELE 9
  USE
  DO  LU12_DSP
case t=-5
  MODI_PAGE=.F.
  SCRRA1=savescreen(19,0,22,79)
  DO DSP1  WITH 2,"¹sÂI"
  restscreen(19,0,22,79,scrRA1)
  GOTO 2
  do  lu12_dsp1 &&  ¹sÂISETTING
  DO FUN_KEY
  FDSPA=0
  DO  LU12_DSP
case t=-6
  SCRRA1=savescreen(19,0,22,79)
  MODI_PAGE=.F.
  DO DSP3   WITH  1,"¸¨®t"
  sele 5
  GOTO TOP
  FOR I=1 TO kind
    IX_C=ALLTRIM(STR(I,2,0))
    if star=1  .and.  i < gs_tot +uwc_tot +1   .and.   PFLOR&IX_C <>PA&IX_C
       if stp_a[i] > 0
	  if A_PRESS_N0[L_PRESS,STPN&IX_C,I,1] > 0
	    W2_X=PFLOR&IX_C
	    W2=PA&IX_C
	    ADJW12(I-1,(W2_X-W2)*2048/A_M_NAME[I,10])
	  endif
       endif
    endif
    PFLOR&IX_C :=PA&IX_C
  NEXT
  restscreen(19,0,22,79,scrRA1)
  DO FUN_KEY
  SET COLOR TO &C7 +/ &C1
  FDSPA=0
  DO  LU12_DSP
case t=-27 .AND. STAR=0
  t=0
  save scre to SCRMA
  DO htest
  rest scre from scrma
  DO FUN_KEY
  SET COLOR TO &C7 +/ &C1
  FDSPA=0
  DO  LU12_DSP
case t=-8  .AND. STAR=0


  #ifndef  TLU15S05
  SET COLOR TO R+/ &C1
  @ 15,23 SAY "¢z¢w¢w¢{"
  @ 16,23 SAY "¢x    ¢x"
  @ 17,23 SAY "¢uúTúW¢t"
  @ 18,23 SAY "¢|úSúX¢}"
  SET COLOR TO w+  / &C1
  @ 16,25 SAY "°_°Ê"
  SET COLOR TO &C2 / &C1
  @ 15,31 SAY "¢z¢w¢w¢{"
  @ 16,31 SAY "¢x¤¤¤î¢x"
  @ 17,31 SAY "¢u¢w¢w¢t"
  @ 18,31 SAY "¢|¢w¢w¢}"
  * SETSTAR(1)
  star=1
  dout3(11,1)
  SET COLOR TO &C7 +/ &C1
  #endif

case t=-9 .AND. STAR=1
  set cons on
  SET COLOR TO &C2 / &C1
  SELE 9
  dout3(11,0)
  * SETSTAR(0)
  @ 15,23 SAY "¢z¢w¢w¢{¢z¢w¢w¢{"
  @ 16,23 SAY "¢x°_°Ê¢x¢x¤¤¤î¢x"
  @ 17,23 SAY "¢u¢w¢w¢t¢uúTúW¢t"
  @ 18,23 SAY "¢|¢w¢w¢}¢|úSúX¢}"
  SET COLOR TO w+  / &C1
  *@ 20,52 SAY "¤¤¤î"
  @ 16,33 SAY "¤¤¤î"
  SET COLOR TO &C7 +/ &C1
  CLEAMIX()
  DOUT(8,0)
  DOUT(9,0)
  CLEADROP()
  CLEAOUT()
  cleamem()
  _TOT_D_A[20,3] :=0
  _TOT_D_A[20,4] :=0	  && FIST  INPUT
  _AUTO_FLOR(1,1,0," ",0)
  @ 0,26 SAY  lagw PICT  "9999.9"
  FOR I=1 TO kind
    GS_DROP[I,2] :=0
    ix=alltrim(str(i,2,0))
    STPN&IX=1
  NEXT
  do  ini_data
  STOR 0 TO STP9,M_MIX
  STOR	 "N"   TO USAVE
  STOR "0" TO    TPCOI
  STOR	0  TO  SW9,WIFOK,WIZOK,TOTWI,TOTWK,SWI0,STOP9,STOPTM9,PZI,PANDIC,PLOT_ACT,dspch1_nor,dspch2_nor
  STOR "0" TO   TPCOA,TPCOB,TPCOC,TPCOD,TPCOE,TPCOF,TPCOG,TPCOH,TPCO,TPCO1,TPCO2,TPCO3
  STOR	0 TO TOTVUSE,DSPCASE,downcalf,NEXTOK,TANKSTP,MODY_D1,ACT_V,F3_RUN

  STOR	1 TO   TOMIX,NEXSTP,DOWNSKP,UPSKP,LURECNO,FNEXOKL,FNEXOKU,PERFLR,last_pcs
  && STOR  0 TO   STP1,STP2,STP3,STP4,STP,STP5,STP6,STP7,STP8,wdsp1,wdsp2,DISC2_C2N,DISC2_C2P
  STOR	0 TO   wdsp1,wdsp2,DISC2_C2N,DISC2_C2P
  STOR 0 TO STAR,DOWNOV,DOWNZER,UPZET ,SWA0,SWB0,SWC0,SWD0,SWE0,SWF0,SWG0,SWH0,DBAI
  stor	0 TO DOWNZTM,NVUSE,PVUSE,PRTNO ,UPOVSTP,PRCEND,PRCEND1,PRCEND1,MVUSE,MIXSTM,PCON
  *STOR 0 TO FWA1,FWA2,FWA3,FWB1,FWB2,FWB3,FWC1,FWC2,FWC3,FWD1,FWD2,FWD3,FWE1,FWE2,FWE3,FWF1,FWF2,FWF3,FWG1,FWG2,FWG3,FWH1,FWH2,FWH3
  *STOR 0 TO RWA1,RWA2,RWA3,RWB1,RWB2,RWB3,RWC1,RWC2,RWC3,RWD1,RWD2,RWD3,RWE1,RWE2,RWE3,RWF1,RWF2,RWF3,RWG1,RWG2,RWG3,RWH1,RWH2,RWH3,DRAF,DRBF,DRCF,DRDF,DREF,DRFF,DRGF,DRHF,DRMF,DRTKF,PCONVTM1,CONSTPF
  STOR 0 TO MIXSTP,disc2_s3,upz_all,water_off,waste_ACT,pnt_mode
  STOR 1 TO WCNT1,WCNT2,WCNT3,WCNT4,WCNT5,WCNT6,WCNT7,WCNT8
  *stor 0 to STOPTML3,STOPTML4,STOPTML6,STOPTML7,STOPL3,STOPL4,STOPL6,STOPL7,MTANDO,NTANDO,WAFOK1 ,WBFOK1 ,WCFOK1 ,WDFOK1,f_nextok1,f_nextok2
  stor 0 to MTANDO,NTANDO,WAFOK1 ,WBFOK1 ,WCFOK1 ,WDFOK1,f_nextok1,f_nextok2
  STOR	1 TO PERSAD1,PERCON,PER,calw_rep,ACALW_REP,XCALW_REP,E_STORE
  STOR 0 TO F_NEXT1,F_NEXT2,CNVSTP,UPTKSTP,DSPD_NOR,GS_CHG,K_DIN5
  STOR 0  TO  SAVE_FILE
  RST_MDY_RCPB(@MDY_RCPB,0)
  MDY_RCPB[2]=99
  GS_ADJW :=ARRAY(4)
  GS_ADJW[1] :=0
  GS_ADJW[2] :=0
  GS_ADJW[3] :=0
  GS_ADJW[4] :=0
  AFILL(DSPDATA_A,1)
  STOR "1"  TO ludbf,n_sele
  IF KOT=1
    && TOTANK0=0
  ENDIF
  mdirty_no[4]=-1   &&	IDLE   MDY180902
  mdirty_no[5]=0   &&  COUNT

 *POVKG0=SPOVKG0
 * POVKG1=SPOVKG1
 * POVKG2=SPOVKG2
 * POVKG3=SPOVKG3
 * POVKG4=SPOVKG4
 * POVKG5=SPOVKG5
 * POVKG6=SPOVKG6
 * POVKG7=SPOVKG7
 * MOVKG0=SMOVKG0
 * MOVKG1=SMOVKG1
 * MOVKG2=SMOVKG2
 * MOVKG3=SMOVKG3
 * MOVKG4=SMOVKG4
 * MOVKG5=SMOVKG5
 * MOVKG6=SMOVKG6
 * MOVKG7=SMOVKG7
  STOR "3" TO DOWNPRT,UPPRT
  TOTDR1=TOTDR
  DRNO=1
  IF DISCH1=0
    @ 15,12 CLEA TO 17,17
    @ 18,16 SAY " ,"
    DISC1=0
  ENDIF
  SET COLOR TO &C5 +/ &C1
  SET COLOR TO &C2 / &C1
  SET COLOR TO &C4 / &C1
  set colo  to &c7 +/ &c1
  * @  9,44 SAY PDRCL  PICT "99"
  SETTOTW(KLCHN+KUCHN+1)
  IF DRFME=3
    DO CASE
    CASE  UCHTYPE=1
      NNN=LTRIM(STR(KLCHN+3,5,0))
      && TOTANK&NNN=0
    CASE  UCHTYPE=2
      NNN=LTRIM(STR(KLCHN+2,5,0))
      && TOTANK&NNN=0
    ENDCASE
  ENDIF


@ 23,9	SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-9,9)
@ 23,24 SAY ACARNO
@ 23,37 SAY ARATNO
@ 23,52 SAY AVUSE   PICT "99.9"
@ 23,61 SAY ATANDO  PICT "9999"
*IF  WASTE=1
    @ 23,71 SAY substr(space(10)+alltrim(APOSITION),-9,9)
*ENDIF
@ 8,2 clea to 8,79
@ 4,2 clea to 4,79
star=0
@  1,2	CLEA  TO  20,79
*@ 11,2  CLEA  TO  11,79
_TOT_D_A[20,3] :=0
_TOT_D_A[20,4] :=0	&& FIST  INPUT
  DO  LU12_DSP
STORE  1 TO   A_PRESS,U_PRESS,L_PRESS
STOR  0 TO  UPOV,DNOV,UPOVSTP,TANKSTP
*STORE	0 TO   NEXTOK,NEXTOK1,NEXTOK2,STOPTM1,STOPTM2,STOPTM3,STOPTM4,STOPTM5,STOPTM6,STOPTM7,STOPTM8,STOPTM9,STOPTM10,STOPTM11,STOPTM12
STORE  0 TO   NEXTOK,NEXTOK1,NEXTOK2
*STORE 0  TO  STP1,STOP1,STOP2,STOP3,STOP4,STOP5,STOP6,STOP7,STOP8,STOP9,STOP10,STOP11,STOP12
*STOR  0 TO   STP1,STP2,STP3,STP4,STP,STP5,STP6,STP7,STP8,STP9,STP10,STP11,STP12
AFILL(RDDATA_ERR,3)
FILL_A_D4(A_PRESS_N0,1,1,21,kind,PRESS_LEN4,0)
FILL_A_D4(A_PRESS_N0,2,1,21,kind,PRESS_LEN4,0)
FILL_A_D4(A_PRESS_B0,1,1,21,kind,PRESS_LEN4,0)
FILL_A_D4(A_PRESS_B0,2,1,21,kind,PRESS_LEN4,0)
FILL_A_D2(A_PRESS_N1,1,2,18,0)
FILL_A_D2(WTANK_F,1,kind,3,0)
FILL_A_D2(RECIP,1,kind,2,0)
FOR I=1 TO kind
  STP_A[I] :=0
next
FOR X=1 TO kind
  TIME1[X,2] :=0
  A_M_NAME[X,10]=A_M_NAME[X,9]
  A_M_NAME[X,12]=A_M_NAME[X,6]
NEXT
case t=23  .AND. STAR=0
  td1=0
  clea
  clos all
  quit
ENDCASE
retu
&&-----------------------------------------------------------------------------
FUNCTION  TXT_ECHO
PARAMETERS   D_YS,D_XS,D_C1,D_C2,D_C3,t_color
D_L_C=LEN(D_C1)
D_YE=D_YS+4
D_XE=D_XS+4+D_L_C
XCOR=SETCOLOR()
* 80 col
SET DEVI TO SCRE
SET COLOR TO &C7 / &C5
SET COLOR TO GR+ / R
@ D_YS,D_XS CLEA TO D_YE,D_XE
BOX_S(D_YS,D_XS,D_YE,D_XE)
@ d_ys +1 ,d_xs+2  clea to  d_ye -1,d_xe-2
do case
case  t_color=1
  SET COLOR TO W+ / bl, b/w+
case  t_color=2
  SET COLOR TO 7+ / 0 , b/w+
case  t_color=3
  SET COLOR TO r  / gr+ , b/w+
case  t_color=4
  SET COLOR TO gr+ / bl , b/w+
endcase


@ D_YS+1,D_XS+2       SAY D_C1
@ D_YS+2,D_XS+2     SAY D_C2
@ D_YS+3,D_XS+2     SAY D_C3
*@ 13,36 SAY		       "Esc"
XT=0
SET COLO TO &XCOR
RETU
&&-----------------------------------------------------------------------------
FUNCTION  BOX_S
PARAMETERS   UPOW,UPCOL,DWNOW,DWNCOL
   IF  MOD((UPCOL - DWNCOL),2) <> 0
      IF  DWNCOL <>78
	DWNCOL=DWNCOL +1
      ELSE
	DWNCOL=DWNCOL -1
      ENDIF
   ENDIF
   X=UPCOL+2
   DO WHILE  X < DWNCOL
     @	UPOW,X SAY "¢w"
     @ DWNOW,X SAY "¢w"
     X=X+2
   ENDDO
   X=UPOW+1
   DO WHILE  X < DWNOW
     @	X,UPCOL SAY "¢x"
     @	X,DWNCOL  SAY "¢x"
     X=X+1
   ENDDO
@  UPOW,UPCOL  SAY "¢z"
@  UPOW,DWNCOL	SAY "¢{"
@  DWNOW,UPCOL	SAY "¢|"
@  DWNOW,DWNCOL  SAY "¢}"
RETU ""
&&-----------------------------------------------------------------------------
FUNCTION  OK_ECHO
PARAMETERS   D_YS,D_XS,D_C1,D_C2,D_C3
D_L_C=LEN(D_C1)
D_YE=D_YS+4
D_XE=D_XS+4+D_L_C
XCOR=SETCOLOR()
* 80 col
X_OK=0
SET DEVI TO SCRE
SET COLOR TO &C7 / &C5
XPNT_ER=SAVESCREEN(D_YS,0,D_YE,79)
SET COLOR TO GR+ / R
@ D_YS,D_XS CLEA TO D_YE,D_XE
BOX_S(D_YS,D_XS,D_YE,D_XE)
SET COLOR TO W+ / R

@ D_YS+1,D_XS+2       SAY D_C1
@ D_YS+2,D_XS+2     SAY D_C2
@ D_YS+3,D_XS+2     SAY D_C3
SET COLOR TO GR+ / R
*@ 13,36 SAY		       "Esc"
set curs off
XT=0

DO WHILE (XT<>78) .AND.(XT<>89)  .AND.(XT<>110) .AND.(XT<>121) .AND.(XT<>27)
  xt=INKEY()
ENDDO
if (XT=89) .or.(XT=121)
  x_OK=1
ELSE
  x_OK=0
endif
set curs oN
RESTSCREEN(D_YS,0,D_YE,79,XPNT_ER)
SET COLO TO &XCOR
RETU X_OK
&&-----------------------------------------------------------------------------
FUNCTION READ2
PARAMETERS  PX,X1,Y1,TNSTP,LONG
XPX=pX
X1=X1
SET COLOR TO 0/7 *
IF TNSTP<>9
  SET COLOR TO 0 * /7
  @ Y1,X1  SAY XPX  PICT "9999"
  CHRN=STR(INT(XPX),4)
ELSE
  SET COLOR TO 0 * /7
  @ Y1,X1  SAY XPX  PICT "99.99"
  CHRN=STR(XPX,5,2)
ENDIF
XP=0
t=0
SET COLOR TO W+  / R
@ y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
SET COLOR TO 7/0
*CURSER2(X1,Y1,XP)
XX1=X1+XP
YY1=Y1
T1=0
TN1=0
DO WHILE T1<>233
  T=0
  DO WHILE  T=0
    T=INKEY( )
    DO DSP2
    DO LUSTP
  ENDDO
  DO CASE
  case	T=19
    IF XP>=1
      XP=XP-1
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ENDIF
  CASE	T=4
    IF XP<=LONG-2
      XP=XP+1
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO &C1 */ &C7 +
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ENDIF
  CASE	 T=43 .OR.T=45 .OR.T=46 .OR.T=32 .OR. T=48 .OR.T=49 .OR.T=50 .OR.T=51 .OR.T=52 .OR.T=53 .OR.T=54 .OR.T=55 .OR.T=56 .OR.T=57
    XP=XP+1
    IF TN1=0 .AND. XP=1
      TN1=1
      IF  TNSTP<>9
	CHRN="    "
      ELSE
	CHRN="     "
      ENDIF
    ENDIF
    IF XP<LONG
      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,LONG-XP)
      SET COLOR TO 0/7	*
      IF  VAL(CHRN)>=1000
	CHRN="    "
      ENDIF
      @ Y1,X1  SAY CHRN
      SET COLOR TO 7/0
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ELSE
      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
      SET COLOR TO 0/7
      IF  TNSTP<>9
	IF  VAL(CHRN)>=1000
	  CHRN="    "
	ENDIF
      ELSE
	IF  VAL(CHRN)>=100
	  CHRN="     "
	ENDIF
      ENDIF
      @ Y1,X1  SAY CHRN
      SET COLOR TO 7/0
      XP=XP-1
      SET COLOR TO 0/7 *
      @ Y1,X1  SAY CHRN
      SET COLOR TO W+  / R
      @ Y1,(X1+XP)  SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(X1,Y1,XP)
      XX1=X1+XP
      YY1=Y1
    ENDIF
  CASE T=13   .OR. T=23 .OR. T=5 .OR. T=24.or. t=2
    T1=233
    IF TNSTP<>9
      XPX =INT(VAL(CHRN))
      PX=XPX
      @ Y1,X1  SAY  PX	 PICT "9999"
    ELSE
      XPX =INT(VAL(CHRN)*100)/100
      IF XPX > 100
	XPX=1
      ENDIF
      PX=XPX
      @ Y1,X1  SAY  PX	 PICT "99.99"
    ENDIF
    SELE 5
    CHNO=LTRIM(STR(TNSTP))
    IF TNSTP=8
      GOTO 18
      REPL PA1 WITH PX
    ELSE
     IF TNSTP=9
       CHNO="8"
     ENDIF
     REPL PA&CHNO WITH PX
    ENDIF
    DO CASE
    CASE T=5
      IF TNSTP>1
	TNSTP=TNSTP-1
      ENDIF
    CASE T=24  .OR. T=13
      TNSTP=TNSTP+1
    ENDCASE
    IF T=23 .or. t=2
      TNSTP=9
    ENDIF
  CASE T=27
    SET COLOR TO 0/7
    XPX=PX
    IF TNSTP<>9
      @ Y1,X1  SAY XPX	PICT "9999"
      CHRN=STR(INT(XPX),4)
    ELSE
      @ Y1,X1  SAY XPX	PICT "99.99"
      CHRN=STR(XPX,5,2)
    ENDIF
    SET COLOR TO 7/0
    XP=0
    t=0
    *CURSER0(XX1,YY1)
    *CURSER2(X1,Y1,XP)
    XX1=X1+XP
    YY1=Y1
  ENDCASE
ENDDO
RETU   TNSTP
**-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
FUNCTION SER_OK_old
SER_X2=VAL(SUBSTR(DTOC(DATE()),4,2))
SER_XW=DOW(DATE())-1
IF  SER_XW =0
  SER_XW=7
ENDIF
SER_XW=SER_XW + SER_X2
SER_X1=VAL(SUBSTR(DTOC(DATE()),1,2)) +SER_XW
SER_X2=VAL(SUBSTR(DTOC(DATE()),4,2)) +SER_XW
SER_X3=VAL(SUBSTR(DTOC(DATE()),7,2)) +SER_XW
SER_Xok1="TV7213"
SER_Xok2="YB0246"
SER_Xok3=ALLTRIM(STR(SER_X1 * SER_X2 * SER_X3,6,0))
XS=1
XN=7
SER_OK=1
SER_STP=1
  T_SER=""

DO WHILE (SER_STP <=7)	.AND. (T <>13)
  T=0
  DO WHILE  T =0
    T=INKEY()
  ENDDO
  IF  T <>13
    T_SER=T_SER +UPPER(CHR(T))
  ENDIF
  SER_STP=SER_STP +1
ENDDO
SER_OK=0
IF (T_SER =SER_XOK1) .OR. (T_SER =SER_XOK2) .OR. (T_SER =SER_XOK3)
  SER_OK=1
ELSE
  SER_OK=0
ENDIF
RETU SER_OK
&&-----------------------------------------------------------------------------
FUNCTION SER_OK_BOSS
SER_X2=VAL(SUBSTR(DTOC(DATE()),4,2))
SER_XW=DOW(DATE())-1
IF  SER_XW =0
  SER_XW=7
ENDIF
SER_XW=SER_XW + SER_X2
SER_X1=VAL(SUBSTR(DTOC(DATE()),1,2)) +SER_XW
SER_X2=VAL(SUBSTR(DTOC(DATE()),4,2)) +SER_XW
SER_X3=VAL(SUBSTR(DTOC(DATE()),7,2)) +SER_XW
SER_Xok1="83479"
SER_Xok3=ALLTRIM(STR(SER_X1 * SER_X2 * SER_X3,6,0))
XS=1
XN=7
SER_OK=1
SER_STP=1
  T_SER=""

DO WHILE (SER_STP <=7)	.AND. (T <>13)	.AND. (T <>18)	.AND. (T <>3)  .AND. (T <>5)   .AND. (T <>24)	.AND. (T <>4)  .AND. (T <>19)
  T=0
  DO WHILE  T =0
    T=INKEY()
  ENDDO
  IF  T <>13
    T_SER=T_SER +UPPER(CHR(T))
  ENDIF
  SER_STP=SER_STP +1
ENDDO
SER_OK=0
IF (T_SER =SER_XOK1) .OR. (T_SER =SER_XOK3)
  SER_OK=1
ELSE
  SER_OK=0
ENDIF
RETU SER_OK
**-----------------------------------------------------------------------------
PROCEDURE  OUT_01
PARAMETERS  P1,P2,P3
CLEA GETS
TREAD=0
TLOOP1=0
XLOOP1=0
XLOOP=0
RETURN
**-----------------------------------------------------------------------------
PROCEDURE   DNREAD_01
PARAMETERS  P1,P2,P3
CLEA GETS
RETURN
**-----------------------------------------------------------------------------
PROCEDURE  upread_01
PARAMETERS  P1,P2,P3
CLEA GETS
IF READNO>1
readno=READNO-2
if readno<0
readno=0
ENDIF
ENDIF
RETURN
&&-----------------------------------------------------------------------------
FUNCTION READ_A
PARAMETERS  RDY1,RDX1,PX,D_TYPE,LONG,N_DASH,TNSTP,C_FUNC,RisDatachg   && Y,X,DATA,DATA_TYPE<C/N>,DATA LONG,¤p¼Æ¦ì¼ÆTNSTP,datais change
&&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"D_MATE")
&& RETU TNSTP
RisDatachg=0
last_key=0
XPX=pX
RDX1=RDX1
SET COLOR TO 0/7+
DO CASE
CASE   D_TYPE="N"
  IF ((N_DASH=0 )  .AND. (XPX -INT(XPX) <>0) )
    CHRN=LTRIM(STR(XPX,LONG+3,2))
    XLN1=LEN(CHRN)
    IF XLN1 < LONG
      CHRN=SUBSTR("       ",1,LONG-XLN1) + CHRN
    ELSE
      CHRN=SUBSTR(CHRN,1,LONG)
    ENDIF
  ELSE
    CHRN=STR(XPX,LONG,N_DASH)
  ENDIF
CASE   D_TYPE="C"
  CHRN=SUBSTR(XPX,1,LONG)
CASE   D_TYPE="D"
  CHRN=DTOC(XPX)
  LONG=10
ENDCASE
SET COLOR TO 0 + /7
@ RDY1,RDX1  SAY CHRN
XP=0
t=0
SET COLOR TO W+  / R
@ RDY1,(RDX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
SET COLOR TO 7/0
XX1=RDX1+XP
YY1=RDY1
T1=0
TN1=0
DO WHILE T1<>233
  T=0
  SELE &LUDBF
  DO WHILE  T=0
    IF (T0A <>0) .AND. (DSP_SCALL=1) .AND. (LUSTP_EN=1)
      T=T0A
      T0A=0
    ELSE
      T=INKEY()
    ENDIF
    IF (DLA_DSP=1)  .AND.  (DSP_SCALL=1)
      DO DSP2
    ENDIF
    IF (T0A=0	) .AND. (LUSTP_EN=1)
       DO LUSTP
    ENDIF
  ENDDO
  SELE &LUDBF
  _LASTKEY=T
  last_key=t
  DO CASE
  CASE T=K_F5
    IF	EMPTY(F5_FUNC) =.F.
      F5_ACT=1
      IF F5_FUNC <>"0"
	DO &F5_FUNC
      ELSE
	T1=233
	TNSTP=99
      ENDIF
      F5_ACT=0
    ENDIF
  CASE T=K_F7
    IF	EMPTY(F7_FUNC) =.F.
      F7_ACT=1
      IF F7_FUNC <>"0"
	DO &F7_FUNC  with  K_F7
      ELSE
	T1=233
	TNSTP=99
      ENDIF
      F7_ACT=0
    ENDIF
  CASE T=K_F8
    IF	EMPTY(F8_FUNC) =.F.
      F7_ACT=0
      IF F8_FUNC <>"0"
	DO &F8_FUNC  with  K_F8
      ELSE
	T1=233
	TNSTP=99
      ENDIF
    ENDIF
  CASE T=K_F9
    IF	EMPTY(F9_FUNC) =.F.
      F7_ACT=0
      IF F9_FUNC <>"0"
	RET_DNX ={0,0,0} && {T1,TNSTP,T}
	DO &F9_FUNC  with  K_F9,@RET_DNX
	T1=233
	TNSTP=99
	IF RET_DNX[3] <>0
	  T=RET_DNX[3]
	  TNSTP=98
	ENDIF
      ELSE
	T1=233
	TNSTP=99
      ENDIF
    ENDIF
  CASE	T=K_F1 .AND. ( C_FUNC <> " ")
    DO &C_FUNC
    T=0
    XP=0
    SET COLOR TO 0/7 +
    @ RDY1,RDX1  SAY CHRN
    SET COLOR TO &C1 +/ 7 +
    @ RDY1,RDX1  SAY CHRN
    SET COLOR TO W+  / R
    @ RDY1,(RDX1+XP)  SAY SUBSTR(CHRN,XP+1,1)
  case	T=K_DEL
    RisDatachg=1
      DO CASE
      CASE  D_TYPE <> "D"
	CHRN=SUBSTR(CHRN,1,XP) +SUBSTR(CHRN,XP+2,LONG-XP-1) + " "
      ENDCASE
      SET COLOR TO 0/7 +
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO W+  / R
      @ RDY1,(RDX1+XP)	SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      XX1=RDX1+XP
      YY1=RDY1
   CASE T=-9 .and. _modi="YY"
    RisDatachg=1
     SELE &N_SELE
     DELE
     PACK
     GOTO N_REC
     IF  EOF()
       SKIP -1
       N_YN=N_YN  -1
       IF N_YN < Y1_N
	 N_YN=Y1_N
       ENDIF
     ENDIF
     IF  BOF()
       GOTO 1
       N_YN=Y1_N
     ENDIF
     IF  EOF()
       APPE BLANK
       N_YN=Y1_N
     ENDIF
     N_YNO=N_YN
     N_REC=RECNO()
     N_RECO=N_REC
     SKIP - (N_YN -Y1_N  )
     SET COLOR TO W+ / BL
     DO _DSP_ALL
     SET COLOR TO b / W+
     N_REC=N_RECO
     GOTO N_REC
     N_YN=N_YNO
     _REC_DSP(N_YN)
     N_REC=N_RECO
     N_YN=N_YNO
     GOTO N_REC
     _DATA_MODIFY =1
     &&TNSTP=1
     &&T1=233
     &&XP=1
     R_CB=ARR_REC_NAME[tnstp]
     XPX = &R_CB
     DO CASE
     CASE   D_TYPE="N"
       CHRN=STR(XPX,LONG,N_DASH)
     CASE   D_TYPE="C"
       CHRN=SUBSTR(XPX,1,LONG)
     CASE   D_TYPE="D"
       CHRN=DTOC(XPX)
       LONG=10
     ENDCASE
     px=chrn
     T=0
     rdy1=n_yn
  case	T=K_LEFT
    IF XP>=1
      XP=XP-1
      DO CASE
      CASE  D_TYPE="D"
	IF XP=2 .OR.  XP=5
	  XP=XP-1
	ENDIF
      ENDCASE
      SET COLOR TO 0/7 +
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO W+  / R
      @ RDY1,(RDX1+XP)	SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      XX1=RDX1+XP
      YY1=RDY1
    ENDIF
  CASE	T=K_RIGHT
    IF XP<=LONG-2
      XP=XP+1
      DO CASE
      CASE  D_TYPE="D"
	IF XP=2 .OR.  XP=5
	  XP=XP+1
	ENDIF
      ENDCASE
      SET COLOR TO 0/7 +
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO &C1 +/ 7 +
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO W+  / R
      @ RDY1,(RDX1+XP)	SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      XX1=RDX1+XP
      YY1=RDY1
    ENDIF
  CASE	 T>=32
    RisDatachg=1
    XP=XP+1
    IF TN1=0 .AND. XP=1
      TN1=1
      DO CASE
      CASE  D_TYPE <> "D"
	CHRN=SPACE(LONG)
      ENDCASE
    ENDIF
    IF XP<LONG
      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)+SUBSTR(CHRN,XP+1,LONG-XP)
      DO CASE
      CASE  D_TYPE="D"
	IF XP=2 .OR.  XP=5
	  XP=XP+1
	ENDIF
      ENDCASE
      SET COLOR TO 0/7	+
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO 7/0
      *CURSER0(XX1,YY1)
      SET COLOR TO 0/7 +
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO W+  / R
      @ RDY1,(RDX1+XP)	SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      XX1=RDX1+XP
      YY1=RDY1
    ELSE
      CHRN=SUBSTR(CHRN,1,XP-1)+CHR(T)
      SET COLOR TO 0/7+
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO 7/0
      XP=XP-1
      SET COLOR TO 0/7 +
      @ RDY1,RDX1  SAY CHRN
      SET COLOR TO W+  / R
      @ RDY1,(RDX1+XP)	SAY SUBSTR(CHRN,XP+1,1)
      SET COLOR TO &C7 +/ &C1
      *CURSER2(RDX1,RDY1,XP)
      XX1=RDX1+XP
      YY1=RDY1
    ENDIF
  CASE T=13   .OR. T=23 .OR. T=5 .OR. T=24.or. t=2   .OR. T=3  .OR. T=18 .OR. T=K_HOME .OR. T=K_END
    IF	T=28 .AND. ( C_FUNC <> " ")
      DO &C_FUNC
      T=13
    ENDIF
    T1=233
    DO CASE
    CASE   D_TYPE="N"
      XPX=VAL(CHRN)
    CASE   D_TYPE="C"
      XPX=CHRN
    CASE   D_TYPE="D"
      XPX=CTOD(CHRN)
    ENDCASE

    PX=XPX
    SET COLOR TO 0/7+
    @  RDY1,RDX1  SAY  CHRN
    *SELE 5
    *CHNO=LTRIM(STR(TNSTP))
    *REPL PA&CHNO WITH PX
    DO CASE
    CASE T=5
      IF TNSTP=1
	T1=233
	TNSTP=99
      ENDIF
      IF TNSTP>1
	TNSTP=TNSTP-1
	LAST_PRESS=5
      ENDIF
    CASE T=3
      T1=233
	TNSTP=98
    CASE T=18	.OR.  T=K_HOME .OR.  T=K_END
      T1=233
	TNSTP=98
    CASE T=24
      T1=233
      TNSTP=98
    CASE T=13
      TNSTP=TNSTP+1

    ENDCASE
    IF T=23 .or. t=2
      TNSTP=99
    ENDIF
  CASE T=27
    SET COLOR TO 0/7 +
    @ RDY1,RDX1  SAY  CHRN
    XPX=PX
    DO CASE
    CASE   D_TYPE="N"
      XPX=VAL(CHRN)
    CASE   D_TYPE="C"
      XPX=CHRN
    CASE   D_TYPE="D"
      XPX=CTOD(CHRN)
    ENDCASE
    PX=XPX
    SET COLOR TO 7/0
    XP=0
    t=0
    XX1=RDX1+XP
    YY1=RDY1
    T1=233
    TNSTP=99
  ENDCASE
ENDDO
_act_px=PX
RETU   TNSTP













































































































































































































































































































































&&---------------------------------------------------------------------------------------------------
PROCEDURE  D_CAR_DATA
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
ARR1 :={" ¨®½ø¥N¸¹ ","  ¨®¸¹ ","¾r¾p©m¦W"," ªÅ­«(Kg)"}
ARR2 :={"P12100","P12101","P12102","p12103"}
ARR3 :={"XXXXXXXXXX","!!!!!!!","XXXXXXXX","999999"}
ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,0}
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 10
goto top
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
&&STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13,P_FUNC13,P_FUNC14,P_FUNC15,P_FUNC16
FOR I=0 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next
P_FUNC2="FIND_1102"
_GET_BROW(18,20,5,4,ARR1,ARR2,ARR3,"_DMAKE1","10","Y",.T.,.F.)
STOR " " TO P_FUNC0
FOR I=1 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next

SET COLOR TO &C7 +/ &C1
retu


#ifndef  dfRaten_2Page


**-----------------------------------------------------------------------------
FUNCTION   _REC_DSP
PARAMETERS  YD_N
x=1
DO WHILE  X <=TIT_N
  R_CB=ARR_REC_NAME[X]
  T_CB=ARR_TYPE[X]
  _XN1=&R_CB
  IF (VALTYPE(_XN1)="N")
    xdec=fget_dec(t_cb)
    *@ YD_N,ARR_DSPN[X]  SAY &R_CB   PICT "&T_CB"
    X_L=LEN(T_CB)
    X_D=FSUBSTR(&R_CB,-X_L," ",xdec)
    @ YD_N,ARR_DSPN[X]	SAY x_d
  ELSEIF (VALTYPE(_XN1)="C")
    X_L=LEN(T_CB)
    *X_D=FSUBSTR(&R_CB,X_L," ",0)
    X_D=SUBSTR(&R_CB,1,X_L)
    @ YD_N,ARR_DSPN[X]	SAY x_d   PICT "&T_CB"
  ELSE
    X_L=LEN(T_CB)
    X_D=&R_CB
    @ YD_N,ARR_DSPN[X]	SAY x_d


  ENDIF
  IF  EMPTY(ARR_PCS[X]) =.F.
    PCS_CF(YD_N,&R_CB,X,RECNO())
  ENDIF
  X=X+1
ENDDO
RETU

#endif
#ifndef  dfRaten_2Page


&&-----------------------------------------------------------------------------
PROCEDURE    _DSP_ALL
PARAMETERS  P1,P2,P3
XAL=1
Y_X=Y1_N
@ Y1_N,X1_N  CLEA TO Y1_N+YL_N-1,X1_N + DC_L-1
IF .NOT. BOF()
  DO WHILE  (XAL <=YL_N)  .AND. (.NOT. EOF())
    _REC_DSP(Y_X)
    SKIP
    Y_X=Y_X+1
    XAL=XAL+1
  ENDDO
  SKIP -1
  N_YN=Y_X -1
ENDIF
N_REC=RECNO()
RETU

#endif
#ifndef  dfRaten_2Page

&&-----------------------------------------------------------------------------
FUNCTION   UP_DSP1
PARAMETERS  X
SET COLOR TO W+ / BL
_REC_DSP(N_YN)
SKIP -1
if fist_rec=0
  IF BOF()
    GOTO TOP
  ELSE
    N_YN=N_YN -1
    IF N_YN < Y1_N
      N_YN=Y1_N
      SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,-1)
    ENDIF
  ENDIF
else
  IF recno() < FIST_REC
    SKIP
  ELSE
    N_YN=N_YN -1
    IF N_YN < Y1_N
      N_YN=Y1_N
      SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,-1)
    ENDIF
  ENDIF
endif
SET COLOR TO GR+ / W+
_REC_DSP(N_YN)
N_REC=RECNO()
RETU

#endif
#ifndef  dfRaten_2Page

&&-----------------------------------------------------------------------------
FUNCTION   DOWN_DSP1
PARAMETERS  X
SET COLOR TO W+ / BL
_REC_DSP(N_YN)
SKIP
IF LAST_REC=0
  IF .NOT. EOF()
    N_YN=N_YN +1
    IF N_YN > Y1_N + YL_N-1
      N_YN=Y1_N +YL_N-1
      SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,1)
    ENDIF
  ELSE
    GOTO N_REC
  ENDIF
ELSE
  IF RECNO()<=LAST_REC
    N_YN=N_YN +1
    IF N_YN > Y1_N + YL_N-1
      N_YN=Y1_N +YL_N-1
      SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,1)
    ENDIF
  ELSE
    SKIP -1
  ENDIF
ENDIF
SET COLOR TO GR+ / W+
_REC_DSP(N_YN)
N_REC=RECNO()
RETU

#endif


&&-----------------------------------------------------------------------------
FUNCTION  PNT1_OK
PARAMETERS   X_OK
XCOR=SETCOLOR()
* 136 col
X_OK=1
x= RDLPT(0)
if (x <>144)   .and.   (x <> pnt_redy_code)
  SET DEVI TO SCRE
  SET COLOR TO &C7 / &C5
  XPNT_ER=SAVESCREEN(10,0,14,79)
  SET COLOR TO GR+ / R
  @ 10,30 CLEA TO 14,54
  BOX_S(10,30,14,54)
  SET COLOR TO W+ / R
  @ 11,32 SAY			" NO. 1  ¦Cªí¾÷¤£¥¿½T"
  @ 12,32 SAY			" «ö¸Ë«á«ö¥ô¤@ÁäÄ~Äò"
  @ 13,32 SAY			" «ö Esc Áä°±¤î¦C¦L "
  SET COLOR TO GR+ / R
  @ 13,36 SAY			"Esc"
  set curs off
  do while (RDLPT(0) <> 144)   .and. (RDLPT(0) <>pnt_redy_code)
    XT=0
    DO WHILE XT=0
      xt=INKEY()
    ENDDO
    if XT=27
      EXIT
      x_OK=0
    endif
  ENDDO
  set curs oN
  SET DEVI TO PRINT
  x= RDLPT(0)
  if (x <>144)	 .and.	 (x <> pnt_redy_code)
      x_OK=0
  ENDIF
  if  x_OK=0
  SET DEVI TO SCRE
  endif
  SET DEVI TO SCRE
  RESTSCREEN(10,0,14,79,XPNT_ER)
endif
SET COLO TO &XCOR
RETU X_OK
&&-----------------------------------------------------------------------------
FUNCTION  PNT2_OK
PARAMETERS   X_masage
XCOR=SETCOLOR()
* 80 col
X_OK=1
x= RDLPT(1)
if (x <>144)   .and.   (x <> pnt_redy_code)
  IF EMPTY(X_MASAGE) = .T.
    SET DEVI TO SCRE
    SET COLOR TO &C7 / &C5
    XPNT_ER=SAVESCREEN(10,0,14,79)
    SET COLOR TO GR+ / R
    @ 10,30 CLEA TO 14,54
    BOX_S(10,30,14,54)
    SET COLOR TO W+ / R

    @ 11,32 SAY 		  " NO. 2  ¦Cªí¾÷¤£¥¿½T"
    @ 12,32 SAY 		  " «ö¸Ë«á«ö¥ô¤@ÁäÄ~Äò"
    @ 13,32 SAY 		  " «ö Esc Áä°±¤î¦C¦L "
    SET COLOR TO GR+ / R
    @ 13,36 SAY 		  "Esc"
    set curs off
    do while (RDLPT(0) <> 144)	 .and. (RDLPT(0) <>pnt_redy_code)
      XT=0
      DO WHILE XT=0
	xt=INKEY()
      ENDDO
      if XT=27
	EXIT
	x_OK=0
      endif
    ENDDO
    set curs oN
    SET DEVI TO PRINT
    x= RDLPT(1)
    if (x <>144)   .and.   (x <> pnt_redy_code)
    X_OK=0
    ENDIF
    if	x_OK=0
    SET DEVI TO SCRE
    endif
    RESTSCREEN(10,0,14,79,XPNT_ER)
  ELSE
    X_OK=0
  ENDIF
ENDIF
SET COLO TO &XCOR
RETU X_OK
&&-----------------------------------------------------------------------------
PROCEDURE  D_add_DATA
PARAMETERS  is_mdy,P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
IF  LU_COUNT=1
  ARR1 :={_F3TXT_A[3],_F3TXT_A[4],"°t¤ñ"," ³æ »ù"}
  ARR2 :={"P1701","P1702","ratno","U_PRICE"}
  ARR3 :={"!!!!","XXXXXXXXXXXXXXXXXXXXXXXXXX","9999","99999"}
  ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0}
  ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
  XN_TIT=4
ELSE
  ARR1 :={_F3TXT_A[3],_F3TXT_A[4]}
  ARR2 :={"P1701","P1702"}
  ARR3 :={"!!!!","XXXXXXXXXXXXXXXXXXXXXXXXXX"}
  ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0}
  ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
  XN_TIT=2
ENDIF
RET_X1=SPACE(4)
sele 13
goto top
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
&&STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13,P_FUNC14,P_FUNC15,P_FUNC16
FOR I=0 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next
P_FUNC2=" "
if empty(is_mdy)=.t.
  is_mdy="Y"
endif
_GET_BROW(18,5,5,XN_TIT,ARR1,ARR2,ARR3,"_DMAKE1","13",IS_MDY,.T.,.F.)
&&STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13,P_FUNC14,P_FUNC15,P_FUNC16
FOR I=0 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next
SET COLOR TO &C7 +/ &C1
IF _DATA_MODIFY =1
  SELE 13
  DELE FILE C:\DBF17_1.DBF
  DELE FOR EMPTY(P1701)=.T.
  PACK
  SORT ON P1701  TO DBF17_1.DBF
  ZAP
  APPE FROM DBF17_1
  DELE FILE C:\DBF17_1.DBF
ENDIF
retu
**-----------------------------------------------------------------------------
FUNCTION _AUTO_FLOR
PARAMETERS _AFR_INIT,_SET_WEI,_ACT_WEI,NO_FLOR,F_ROPPEN
IF _AFR_INIT=1
  PUBLIC  _ATFLOR1
  IF  EMPTY(_ATFLOR1)=.T.
    PUBLIC   _ATFLOR1,_ATFLOR2,_ATFLOR3,_ATFLOR4,_ATFLOR5,_ATFLOR6,_ATFLOR7,_ATFLOR9,_ATFLOR8
    SELE 5
    GOTO 28
    IF EOF()
      APPE BLANK
      REPL PARNO WITH RECNO()
      DO WHILE RECNO() <>28
	APPE BLANK
	REPL PARNO WITH RECNO()
      ENDDO
      GOTO 27
      REPL PA1 WITH 30,PA2 WITH 30,PA3 WITH 30,PA4 WITH 30,PA5 WITH 30
      REPL PA6 WITH 15,PA7 WITH 15,PA8 WITH 0.2
      GOTO 28
      REPL PA1 WITH 15
    ENDIF
    GOTO 27
    _ATFLOR1 =PA1
    _ATFLOR2 =PA2
    _ATFLOR3 =PA3
    _ATFLOR4 =PA4
    _ATFLOR5 =PA5
    _ATFLOR6 =PA6
    _ATFLOR7 =PA7
    _ATFLOR8 =PA8
    GOTO 28
    _ATFLOR9 =PA1
  ENDIF
  PUBLIC   _ATF1,_ATF2,_ATF3,_ATF4,_ATF5,_ATF6,_ATF7,_ATF9,_ATF8
  PUBLIC   _ATFA1,_ATFA2,_ATFA3,_ATFA4,_ATFA5,_ATFA6,_ATFA7,_ATFA9,_ATFA8
  STOR 0  TO  _ATF1,_ATF2,_ATF3,_ATF4,_ATF5,_ATF6,_ATF7,_ATF9,_ATF8
  STOR 0  TO  _ATFA1,_ATFA2,_ATFA3,_ATFA4,_ATFA5,_ATFA6,_ATFA7,_ATFA9,_ATFA8
ELSEIF	_AUTO_FLOR=1
  IF F_ROPPEN=0   &&­p¶q¤@¦¸
    IF	_SET_WEI <> _ACT_WEI
      _XERR=_ACT_WEI -	_SET_WEI
      IF  ABS(_XERR) > _ATFLOR&NO_FLOR
	_XERR=(_XERR/ ABS(_XERR)) * ABS(_ATFLOR&NO_FLOR)
      ENDIF
      PFLOR&NO_FLOR=PFLOR&NO_FLOR +_XERR
      IF PFLOR&NO_FLOR <0
	PFLOR&NO_FLOR=0
      ENDIF
      DO _FLORSAVE
    ENDIF
  ELSE
    PFLOR&NO_FLOR=PFLOR&NO_FLOR-ABS(ERKG&NO_FLOR)  *.5
    IF PFLOR&NO_FLOR  <0
      PFLOR&NO_FLOR=ABS(ERKG&NO_FLOR)
    ENDIF
    DO _FLORSAVE
  ENDIF
ENDIF
STOR 0 TO _ATF&NO_FLOR,_ATFA&NO_FLOR
retu
&&-----------------------------------------------------------------------------
PROCEDURE  _FLORSAVE
PARAMETERS  P1,P2,P3
SELE 5
IF   NO_FLOR="9"
  GOTO 18
  REPL	PA1 WITH  PFLOR&NO_FLOR
ELSE
  GOTO TOP
  REPL	PA&NO_FLOR  WITH    PFLOR&NO_FLOR
ENDIF
XCOR=SETCOLOR()
SET COLOR TO &C7 +/ &C1
@ 22,8	SAY  PFLOR1 PICT "999"
@ 22,16 SAY  PFLOR2 PICT "999"
@ 22,24 SAY  PFLOR3 PICT "999"
@ 22,32 SAY  PFLOR4 PICT "999"
@ 22,42 SAY  PFLOR5 PICT "999"
@ 22,48 SAY  PFLOR6 PICT "999"
@ 22,58 SAY  PFLOR7 PICT "999"
@ 22,66 SAY  PFLOR9 PICT "999"
@ 22,73 SAY  PFLOR8 PICT "99.99"
SET COLO TO &XCOR
RETU
**-----------------------------------------------------------------------------
FUNCTION _FLOR_F
PARAMETERS _NOF
_NOFC=ALLTRIM(STR(_NOF,2,0))
IF  _ATF&_NOFC=0
  IF RD_DO1(_NOF)=0
    _ATF&_NOFC=1
    _ATFA&_NOFC=0
  ENDIF
ELSE
  IF RD_DO1(_NOF)=1
    _ATF&_NOFC=1
    _ATFA&_NOFC=1
  ENDIF
ENDIF
RETU
&&-----------------------------------------------------------------------------
PROCEDURE  _AUTO_MAXIN
PARAMETERS  P1,P2,P3
SET COLOR TO W+ / N
@ 21,0 CLEA TO 23,77
SET COLOR TO W+ / &CF
@ 23,0 SAY    "¡ü<<  ¤@¦¸¦Û°Ê­×¥¿¸¨®t³Ì¤j­«  >>                                             ¡ü"
SET COLOR TO  gr +/ &CF
@ 23,2	SAY "<<"
@ 23,30 SAY ">>"
SET COLOR TO W+ / N
FGET=1
SCRNO=22
XP1 =7
XP2 =15
XP3 =23
XP4 =31
XP5 =42
XP6 =50
XP7 =58
XP8 =66
XP9 =74
XPA1=_ATFLOR1
XPA2=_ATFLOR2
XPA3=_ATFLOR3
XPA4=_ATFLOR4
XPA5=_ATFLOR5
XPA6=_ATFLOR6
XPA7=_ATFLOR7
XPA8=_ATFLOR9
XPA9=_ATFLOR8
SET COLOR TO W+ / N
@ 22,XP1  SAY  _atflor1    PICT "999"
@ 22,XP2  SAY  _atflor2      PICT "999"
@ 22,XP3  SAY  _atflor3      PICT "999"
@ 22,XP4  SAY  _atflor4      PICT "999"
@ 22,XP5  SAY  _atflor5      PICT "999"
@ 22,XP6  SAY  _atflor6      PICT "999"
@ 22,XP7  SAY  _atflor7      PICT "999"
@ 22,XP8  SAY  _atflor9      PICT "999"
@ 22,XP9  SAY  _atflor8      PICT "9.9"
DO WHILE  FGET <=9
  FGETC=ALLTRIM(STR(FGET,1,0))
  IF  FGET=9
    CHRN=STR(XPA&FGETC,3,1)
  ELSE
    CHRN=STR(XPA&FGETC,3)
  ENDIF
  *T_A=NREAD(SCRNO,XP&FGETC,CHRN,6,"")
  TNSTP=READ_A(SCRNO,XP&FGETC,CHRN,"C",3,0,TNSTP," ")
  T_A=_LASTKEY
  XPA&FGETC=VAL(CHRN)
  DO CASE
  CASE	FGETC="8"
    _ATFLOR9=VAL(CHRN)
  CASE	FGETC="9"
    _ATFLOR8=VAL(CHRN)
  OTHERWISE
    _ATFLOR&FGETC=VAL(CHRN)
  ENDCASE
  SET  COLOR TO W+ /N
  x_TY="999"
  IF FGETC="9"
    x_TY="9.9"
  ENDIF
  @ SCRNO,xp&FGETC SAY XPA&FGETC   PICT "&x_ty"
  DO CASE
  CASE	T_A=13
    FGET=FGET+1
  CASE	T_A=5
      FGET=FGET-1
      IF  FGET <=0
	FGET=100
      ENDIF
  CASE T_A=24
      FGET=FGET+1
  CASE T_A=23
    T2=0
    FGET=100
  ENDCASE
ENDDO
SET COLOR TO W+ / N
@ 21,0 CLEA TO 23,77
SELE 5
GOTO 27
REPL PA1 WITH XPA1,PA2 WITH XPA2,PA3 WITH XPA3,PA4 WITH XPA4,PA5 WITH XPA5
REPL PA6 WITH XPA6,PA7 WITH XPA7,PA8 WITH XPA9
GOTO 28
REPL PA1 WITH XPA8
COMMIT
RETU
&&-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
FUNCTION SER_OK
SER_X2=VAL(SUBSTR(DTOC(DATE()),4,2))
SER_XW=DOW(DATE())-1
IF  SER_XW =0
  SER_XW=7
ENDIF
SER_XW=SER_XW + SER_X2
SER_X1=VAL(SUBSTR(DTOC(DATE()),1,2)) +SER_XW
SER_X2=VAL(SUBSTR(DTOC(DATE()),4,2)) +SER_XW
SER_X3=VAL(SUBSTR(DTOC(DATE()),7,2)) +SER_XW
SER_Xok1="TV7213"
SER_Xok2="YB0246"
SER_Xok3=ALLTRIM(STR(SER_X1 * SER_X2 * SER_X3,6,0))
XS=1
XN=7
SER_OK=1
SER_STP=1
  T_SER=""

DO WHILE (SER_STP <=7)	.AND. (T <>13)
  T=0
  DO WHILE  T =0
    T=INKEY()
  ENDDO
  IF  T <>13
    T_SER=T_SER +UPPER(CHR(T))
  ENDIF
  SER_STP=SER_STP +1
ENDDO
SER_OK=0
IF (T_SER =SER_XOK1) .OR. (T_SER =SER_XOK2) .OR. (T_SER =SER_XOK3)
  SER_OK=1
ELSE
  SER_OK=0
ENDIF
RETU SER_OK
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
FUNCTION  PNT_OK1
PARAMETERS   X_OK
XCOR=SETCOLOR()
* 136 col
X_OK=1
x= RDLPT(val(aport)-1)
if (x <>144)   .and.   (x <> pnt_redy_code)
  SET DEVI TO SCRE
  SET COLOR TO &C7 / &C5
  XPNT_ER=SAVESCREEN(10,0,14,79)
  SET COLOR TO GR+ / R
  @ 10,30 CLEA TO 14,54
  BOX_S(10,30,14,54)
  SET COLOR TO W+ / R
  @ 11,32 SAY			" NO. 1  ¦Cªí¾÷¤£¥¿½T"
  @ 12,32 SAY			" «ö¸Ë«á«ö¥ô¤@ÁäÄ~Äò"
  @ 13,32 SAY			" «ö Esc Áä°±¤î¦C¦L "
  SET COLOR TO GR+ / R
  @ 13,36 SAY			"Esc"
  set curs off
  do while (RDLPT(0) <> 144)   .and. (RDLPT(0) <>pnt_redy_code)
    XT=0
    DO WHILE XT=0
      xt=INKEY()
    ENDDO
    if XT=27
      EXIT
      x_OK=0
    endif
  ENDDO
  set curs oN
  SET DEVI TO PRINT
  x= RDLPT(val(aport)-1)
  if (x <>144)	 .and.	 (x <> pnt_redy_code)
      x_OK=0
  ENDIF
  if  x_OK=0
  SET DEVI TO SCRE
  endif
  RESTSCREEN(10,0,14,79,XPNT_ER)
endif
SET COLO TO &XCOR
RETU X_OK
&&-----------------------------------------------------------------------------
FUNCTION  PNT_OK2
PARAMETERS   X_masage
XCOR=SETCOLOR()
* 80 col
X_OK=1
x= RDLPT(VAL(BPORT)-1)
if (x <>144)   .and.   (x <> pnt_redy_code)
  IF EMPTY(X_MASAGE) = .T.
    SET DEVI TO SCRE
    SET COLOR TO &C7 / &C5
    XPNT_ER=SAVESCREEN(10,0,14,79)
    SET COLOR TO GR+ / R
    @ 10,30 CLEA TO 14,54
    BOX_S(10,30,14,54)
    SET COLOR TO W+ / R

    @ 11,32 SAY 		  " NO. 2  ¦Cªí¾÷¤£¥¿½T"
    @ 12,32 SAY 		  " «ö¸Ë«á«ö¥ô¤@ÁäÄ~Äò"
    @ 13,32 SAY 		  " «ö Esc Áä°±¤î¦C¦L "
    SET COLOR TO GR+ / R
    @ 13,36 SAY 		  "Esc"
    set curs off
    do while (RDLPT(0) <> 144)	 .and. (RDLPT(0) <>pnt_redy_code)
      XT=0
      DO WHILE XT=0
	xt=INKEY()
      ENDDO
      if XT=27
	EXIT
	x_OK=0
      endif
    ENDDO
    set curs oN
    SET DEVI TO PRINT
    x= RDLPT(VAL(BPORT)-1)
    if (x <>144)   .and.   (x <> pnt_redy_code)
    X_OK=0
    ENDIF
    if	x_OK=0
    SET DEVI TO SCRE
    endif
    RESTSCREEN(10,0,14,79,XPNT_ER)
  ELSE
    X_OK=0
  ENDIF
ENDIF
SET COLO TO &XCOR
RETU X_OK
&&-----------------------------------------------------------------------------
FUNCTION  _NTO00C
PARAMETERS   NX1,XIN,XDN  &&  N,¾ã¼ÆLONG,¤p¼ÆLONG
NXC=ALLTRIM(STR(NX1,XIN,XDN))
NXC=SUBSTR("0000000"+NXC,-XIN,XIN)
RETU NXC
&&-----------------------------------------------------------------------------
FUNCTION RE_STAR
SER_Xok1="167017"
XS=1
XN=7
SER_OK=1
SER_STP=1
  T_SER=""

DO WHILE (SER_STP <=10)  .AND. (T <>13)
  T=0
  DO WHILE  T =0
    T=INKEY()
  ENDDO
  IF  T <>13
    T_SER=T_SER +UPPER(CHR(T))
  ENDIF
  SER_STP=SER_STP +1
ENDDO
SER_OK=0
IF (T_SER =SER_XOK1)
  SER_OK=1
ELSE
  SER_OK=0
ENDIF
RETU SER_OK
&&-----------------------------------------------------------------------------

&&-----------------------------------------------------------------------------
PROCEDURE  MONI_INI
PARAMETERS  P1,P2,P3
PUBLIC	I00,I01,I02,I03,I04,I05,I06,I07,I08,I09,I010,I011,I012,I013,I014,I015
PUBLIC	ACT_W1,ACT_W2,ACT_W3,ACT_W4,ACT_W5   &&­p¶q¹ê­«
PUBLIC	DB_1,DB_2,DB_3,DB_4,DB_5   &&¹ê­«DISPLAY NO=0 YES=1
PUBLIC	DBTIME_1,DBTIME_2,DBTIME_3,DBTIME_4,DBTIME_5
PUBLIC	ZERTIME_1,ZERTIME_2,ZERTIME_3
PUBLIC	W_ZERO1,W_ZERO2,W_ZERO3,W_ZERO4,W_ZERO5  && ½SºÙZERO
PUBLIC	W_1,W_2,W_3,W_4,W_5  && ½SºÙDATA
PUBLIC	F_IN1,F_IN2,F_IN3,F_IN4,F_IN5
PUBLIC	F_OUT1,F_OUT2,F_OUT3,F_DROW
PUBLIC	FUL_W1,FUL_W2,FUL_W3,FUL_W4,FUL_W5
PUBLIC	ZER_W1,ZER_W2,ZER_W3,CRT_DSP_ALL,MMOVKG1,MMOVKG2,MMOVKG3,MMOVKG4,MNIDSP
STOR 0 TO I00,I01,I02,I03,I04,I05,I06,I07,I08,I09,I010,I011,I012,I013,I014,I015
stor 0 to ACT_W1,ACT_W2,ACT_W3,ACT_W4,ACT_W5   &&­p¶q¹ê­«
stor 0 to DB_1,DB_2,DB_3,DB_4,DB_5   &&¹ê­«DISPLAY NO=0 YES=1
STOR 0 TO DBTIME_1,DBTIME_2,DBTIME_3,DBTIME_4,DBTIME_5
STOR 0 TO ZERTIME_1,ZERTIME_2,ZERTIME_3,MNIDSP
STOR 0 TO W_ZERO1,W_ZERO2,W_ZERO3,W_ZERO4,W_ZERO5  && ½SºÙZERO
STOR 0 TO W_1,W_2,W_3,W_4,W_5  && ½SºÙDATA
STOR 0 TO F_IN1,F_IN2,F_IN3,F_IN4,F_IN5
STOR 0 TO F_OUT1,F_OUT2,F_OUT3,F_DROW
STOR 0 TO FUL_W1,FUL_W2,FUL_W3,FUL_W4,FUL_W5
STOR 0 TO ZER_W1,ZER_W2,ZER_W3,CRT_DSP_ALL
MMOVKG1=SMOVKG5
MMOVKG2=SMOVKG6
MMOVKG3=SMOVKG6
RETU
&&-----------------------------------------------------------------------------
FUNCTION  D_READ
PARAMETERS  XN
XCN=ALLTRIM(STR(INT(XN),1,0))
PN=XN-1
XCP=ALLTRIM(STR(INT(XN-1),1,0))
IF DIN2(PN)=1
  DB_&XCN=1
  F_IN&XCN=1
  XX=STR(INT((XN+1)/2),1,0)
  DBTIME_&XCN=SECONDS()
  IF F_OUT&XX=1
    F_OUT&XX=0
    W_ZERO&XX=W_&XX
  ENDIF
ELSE
  IF DB_&XCN=1
    IF ABS(SECONDS()-DBTIME_&XCN) >=RDT_&XCN
      DBTIME_&XCN=SECONDS()
      _CAL_M&XCN=1
      DB_&XCN=0
      IF XN=3
	  DB_2=0
	  FUL_W2=1
      ENDIF
      FUL_W&XCN=1
    ENDIF
  ELSE
    DBTIME_&XCN=SECONDS()
    DB_&XCN=0
  ENDIF
ENDIF
IF  DB_&XCN=1
  DO CASE
  CASE XN=1
      ACT_W1=W_1 -W_ZERO1
  CASE XN=2
    IF FUL_W2=0
      ACT_W&XCN=W_2-W_ZERO2
    ELSE
      ACT_W2=ACT_W2 +(W_2 -W_ZERO2-ACT_W2-ACT_W3)
    ENDIF
  CASE XN=3
    IF FUL_W3=0
      ACT_W3=W_2 -ACT_W2-W_ZERO2
    ELSE
      ACT_W3=ACT_W3 +(W_2 -W_ZERO2-ACT_W2-ACT_W3)
    ENDIF
  ENDCASE
  IF MNIDSP=1
    DSPB_DATA(XN)
  ENDIF
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION  OUT_READ
PARAMETERS  XN

XCN=ALLTRIM(STR(INT(XN),1,0))
PN=XN-1
XCP=ALLTRIM(STR(INT(XN-1),1,0))
IF DIN2(PN+9)=1
  DO CASE
  CASE	XN=1 .AND. F_IN1=1
    DB_1=0
    IF	F_IN1=1  .AND. (ACT_W1 >=1 )
      IF DIN2(15)=0
	SELE  6
	GOTO BOTT
	IF (TCO1 >0 )  .or. BOF()
	  APPE	BLANK
	  REPLA LUDATE	WITH  DATE(),LUTIME WITH  TIME()
	ENDIF
	IF   (TCO2 =0) .AND. (TCO3 =0)
	  REPLA LUDATE	WITH  DATE(),LUTIME WITH  TIME()
	ENDIF
	REPLA  TCO1 WITH  ACT_W1
	commit
      ENDIF
    ENDIF
    ACT_W1=0
    F_IN1=0
    FUL_W1=0
    IF MNIDSP=1
      DSPB_DATA(1)
    ENDIF
  CASE	XN=2 .AND. (F_IN2=1   .OR. F_IN3=1)
    DB_2=0
    DB_3=0
    IF	F_IN2=1  .AND. (ACT_W2 >=1 )
      IF DIN2(15)=0
	SELE  6
	GOTO BOTT
	IF (TCO2 >0)   .or. BOF()
	  APPE	BLANK
	  REPLA LUDATE	WITH  DATE(),LUTIME WITH  TIME()
	ENDIF
	IF   (TCO1 =0) .AND. (TCO3 =0)
	  REPLA LUDATE	WITH  DATE(),LUTIME WITH  TIME()
	ENDIF
	REPLA  TCO2 WITH  ACT_W2
      ENDIF
    ENDIF
    IF	F_IN3=1  .AND. (ACT_W3 >=1 )
      IF DIN2(15)=0
	SELE  6
	GOTO BOTT
	IF (TCO3 >0)   .or. BOF()
	  APPE	BLANK
	  REPLA LUDATE	WITH  DATE(),LUTIME WITH  TIME()
	ENDIF
	IF   (TCO1 =0) .AND. (TCO2 =0)
	  REPLA LUDATE	WITH  DATE(),LUTIME WITH  TIME()
	ENDIF
	REPLA  TCO3 WITH  ACT_W3
      ENDIF
    ENDIF
      commit
    F_IN2=0
    F_IN3=0
    FUL_W2=0
    FUL_W3=0
    ACT_W2=0
    ACT_W3=0
    IF MNIDSP=1
      DSPB_DATA(2)
      DSPB_DATA(3)
    ENDIF
  ENDCASE
  F_OUT&XCN=1
  ZERTIME_&XCN=SECONDS()
ELSE
  IF F_OUT&XCN=1   .AND. (ABS(SECONDS()-ZERTIME_&XCN)>=Z_RDT_&XCN)
    F_OUT&XCN=0
    W_ZERO&XCN=W_&XCN
  ENDIF
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION  DSPB_DATA
PARAMETERS  XM
XCS=ALLTRIM(STR(INT(XM),1,0))
XN=INT(XM-1)
X=ALLTRIM(STR(INT(XM+4),1,0))
X_DATA=ACT_W&XCS
XC_DATA=STR(X_DATA,5,0)
@ 1,20+9*xm    say  xc_data
SET COLO TO &C7 +/ &C1
RETU X_DATA
&&-----------------------------------------------------------------------------
PROCEDURE  MONI
PARAMETERS  P1,P2,P3
XS=1
FOR XS=1 TO 3	STEP 1
  D_READ(XS)
NEXT
XS=1
FOR XS=1 TO 2	STEP 1
  OUT_READ(XS)
NEXT
IF DIN2(14)=1
  IF  F_DROW=0
    F_DROW=1
    SELE  6
    GOTO BOTT
    IF	(TCO1 <>0) .OR. (TCO2 <>0) .OR. (TCO3 <>0)   .or. BOF()
       APPEND  BLANK
    ENDIF
  ENDIF
ELSE
  F_DROW=0
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION SER_NO
PARAMETERS  XM
T_SER=""
XS=1
XN=7
SER_STP=1
DO WHILE (SER_STP <=XM)  .AND. (T <>13)
  T=0
  DO WHILE  T =0
    T=INKEY()
  ENDDO
  IF  T <>13
    T_SER=T_SER +UPPER(CHR(T))
  ENDIF
  SER_STP=SER_STP +1
ENDDO
RETU T_SER
&&-----------------------------------------------------------------------------
FUNCTION SER_OK_DEL
SER_X1=SUBSTR(DTOC(DATE()),1,2)+SUBSTR(DTOC(DATE()),4,2)
SER_X2="YB0246"
SER_X3="24652268"
SER_OK=0
  SER_C=""
FOR  XN=1 TO  8
  T=0
  DO WHILE T =0
    T=INKEY()
  ENDDO
  IF  T<>13
    SER_C=SER_C+CHR(T)
  ELSE
    XN=99
  ENDIF
NEXT
IF  (ALLTRIM(SER_C)=SER_X1) .OR. (ALLTRIM(SER_C)=SER_X2)   .OR. (ALLTRIM(SER_C)=SER_X3)
  SER_OK=1
ENDIF
RETU SER_OK

&&-----------------------------------------------------------------------------
PROCEDURE  CHK_PNT
PARAMETERS  P1,P2,P3
X_G_A=SAVESCREEN(20,0,23,79)
@  1,2 SAY "¢x¥xºÝ:                                                                   ¢x"
@  2,2 SAY "¢x¹q¸Ü:             µ²±b°_©l¤é:                 µ²±bºI¤î¤é:               ¢x"
@ 1,9 SAY  XMAKER_2
@ 2,9  SAY  XMAKER_3
@ 2,33 SAY  SDATE
@ 2,61 SAY  EDATE
@ 20,2 SAY "¢x                                                                        ¢x"
@ 21,2 SAY "¢x                                                                        ¢x"
@ 22,2 SAY "¢x¹w¦¬ª÷ÃB¦X­p:                                                           ¢x"
@ 23,2 SAY "¢x¤W´Áµ²¤í¦X­p:                ¥»´ÁÀ³¦¬:            À³¦¬¦X­p:             ¢x"
@ 22,17  SAY  XN_PREGET  PICT "99999999"
@ 23,17  SAY  XN_LSTBIL  PICT "99999999"
SET COLOR TO W+ / &CF
@ 24,2 SAY "¡ü F7-¦C¦L¥»ªí³æ          F8-¦C¦L©Ò¦³ªí³æ                                 ¡ü"
SET COLOR TO  gr +/ &CF
@ 24,5	SAY "F7"
@ 28,5	SAY "F9"
SET COLOR TO &C7 +/ &C1



*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
  ARR1 :={"  ¤é  ´Á  ","°t¤ñ","¼Æ¶q","³æ»ù  ª÷  ÃB  "," °e  ³f  ¦a  ÂI        ","°e³f³æ§Ç¸¹"} &&,"¹w¦¬ª÷ÃB","¤W´Áµ²¤í"}
  ARR2 :={"LUDATE","RATNO","TTVUSE","U_PRICE","P1702","LAGNO1"}&&,"PRE_GET","LST_BILL"}
  ARR3 :={"XXXXXXXXXX","9999","9999","9999","XXXXXXXXXXXXXXXXXXXXXX","999999"} &&,"99999999","99999999"}
  ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0}
  ARR_PCS={" "," ","G_TOT","G_TOT "," "," "}
  XN_TIT=6
RET_X1=SPACE(4)

n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
P_FUNC2=" "
_GET_BROW(4,3,14,XN_TIT,ARR1,ARR2,ARR3,"_DMAKE1","7","Y",.T.,.F.)
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
ARR_PCS :={" "," "," "," "," "," "," "," "," "," " }
SET COLOR TO &C7 +/ &C1
RESTSCREEN(20,0,23,79,X_G_A)
retu
**-----------------------------------------------------------------------------
PROCEDURE  CHK_BILL
PARAMETERS  P1,P2,P3
X_G_A=SAVESCREEN(20,0,23,79)

@ 20,2 SAY "¢x                                                                        ¢x"
@ 21,2 SAY "¢x                                                                        ¢x"
@ 22,2 SAY "¢x¹w¦¬ª÷ÃB¦X­p:                                                           ¢x"
@ 23,2 SAY "¢x¤W´Áµ²¤í¦X­p:                                                           ¢x"
SET COLOR TO W+ / &CF
@ 24,2 SAY "¡ü F7-³øªí¦C¦L                                                            ¡ü"
SET COLOR TO  gr +/ &CF
@ 24,5	SAY "F7"
SET COLOR TO &C7 +/ &C1


*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
  ARR1 :={"  ¤é  ´Á  ","«È¤á¥N¸¹  «È¤á¦WºÙ            ","¹w¦¬ª÷ÃB","¤W´Áµ²¤í","¦¬¾Ú³æ¸¹"}
  ARR2 :={"LUDATE","US2","PRE_GET","LST_BILL","NO_BILL"}
  ARR3 :={"XXXXXXXXXX","!!!!","99999999","99999999","XXXXXXXX"}
  ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0}
  ARR_PCS={" ","CHK_FNAME","CHK_GTOT","CHK_GBIL"," "}
  XN_TIT=5
RET_X1=SPACE(4)

n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
P_FUNC2=" "
_GET_BROW(3,3,15,XN_TIT,ARR1,ARR2,ARR3,"_DMAKE1","15","Y",.T.,.F.)
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
SET COLOR TO &C7 +/ &C1
ARR_PCS :={" "," "," "," "," "," "," "," "," "," " }
RESTSCREEN(20,0,23,79,X_G_A)
PACK
dele FILE w2.dbf
SORT  ON  LUDATE  TO W2
USE
IF   ROM_N=1
  DELE FILE  C:\CHK_BILL.DBF
  RENA	C:\W2.DBF TO   C:\CHK_BILL.DBF
  USE  C:\CHK_BILL
ELSE
  DELE FILE  W1.DBF
  RENA	W2.DBF TO   CHK_BILL.DBF
  USE CHK_BILL
ENDIF
retu
&&-----------------------------------------------------------------------------
FUNCTION PCS_CF
PARAMETERS  Y_POSI,X_DATA,XFUNC_NO,XN_RECNO
XDO_F=ARR_PCS[XFUNC_NO]
DO &XDO_F
RETU
**-----------------------------------------------------------------------------
PROCEDURE  CHK_GTOT
PARAMETERS  P1,P2,P3
SUM PRE_GET  TO X_PREGET
@ 22,17  SAY  X_PREGET PICT "99999999"
GOTO  XN_RECNO
retu
**-----------------------------------------------------------------------------
PROCEDURE  CHK_FNAME
PARAMETERS  P1,P2,P3
X_P1501=X_DATA
IF EMPTY(X_P1501)=.F.
  SELE 11
  LOCA	 FOR  alltrim(P1501)==alltrim(X_P1501)
  IF  .NOT.  EOF()
    X_P1502=SUBSTR(LTRIM(P1502),1,22)
  ELSE
    X_P1502="????                  "
  ENDIF
  @ Y_POSI,ARR_DSPN[2]+5  SAY X_P1502
  SELE &N_SELE
ENDIF
retu
**-----------------------------------------------------------------------------
PROCEDURE  CHK_GBIL
PARAMETERS  P1,P2,P3
SUM LST_BILL  TO X_PREGET
@ 23,17  SAY  X_PREGET PICT "99999999"
GOTO  XN_RECNO
retu
**-----------------------------------------------------------------------------
PROCEDURE  FIN_MAKER
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
  ARR1 :={"«È¤á¥N¸¹","«È¤á¦WºÙ                      "}
  ARR2 :={"P1501","P1502"}
  ARR3 :={"!!!!","XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"}
  ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0}
  ARR_PCS={" "," "," "," "," "}
  XN_TIT=2
RET_X1=SPACE(4)
n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
P_FUNC2=" "
_GET_BROW(3,3,15,XN_TIT,ARR1,ARR2,ARR3,"_DMAKE1","11","N",.T.,.F.)
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
SET COLOR TO &C7 +/ &C1
XMAKER=RET_X1
retu
&&-----------------------------------------------------------------------------
PROCEDURE  G_TOT
PARAMETERS  P1,P2,P3
IF  EMPTY(US2)=.T.
  REPL US2 WITH  XMAKER
ENDIF
@ Y_POSI,ARR_DSPN[4]+6	SAY  TTVUSE *U_PRICE  PICT "99999999"
SUM TTVUSE *U_PRICE  TO X_PREGET
@ 23,42  SAY  X_PREGET PICT "99999999"
@ 23,63  SAY  (X_PREGET -XN_PREGET +XN_LSTBIL)	PICT "99999999"
GOTO  XN_RECNO
retu
&&-----------------------------------------------------------------------------
PROCEDURE  CHKBIL_PNT
PARAMETERS  P1,P2,P3
XX="PNT_OK&APORT"+ "()"
XX=&XX
x= RDLPT(VAL(APORT)-1)
IF (x =144)  .or. (x=pnt_redy_code)
  X_CKBN=RECNO()
      SET  CONS  On
  set print to lpt&APORT
  ? chr(27) + "sp&APORT;"
      SET  CONS  ON
  SET DEVI TO PRINT
  @ PROW()+5,5 SAY     " ¤é  ´Á   «È¤á¥N¸¹  «È¤á¦WºÙ            ¹w¦¬ª÷ÃB ¤W´Áµ²¤í  ¦¬¾Ú³æ¸¹"
  @ PROW()+1,5 SAY     "-------------------------------------------------------------------"
  SELE 15
  GOTO TOP
  XN_PRE=0
  XN_LST=0
  DO  WHILE  .NOT. EOF()
    @ PROW()+1,5  SAY LUDATE
    @ PROW(),5	SAY LUDATE
    @ PROW(),18 SAY US2
    XXUS2=US2
    SELE 11
    LOCA   FOR	P1501=XXUS2
    IF	.NOT.  EOF()
      X_P1502=SUBSTR(LTRIM(P1502),1,22)
      @ PROW(),25  SAY X_P1502
    ENDIF
    SELE 15
    @ PROW(),45 SAY PRE_GET    PICT "99999999"
    @ PROW(),54 SAY LST_BILL   PICT "99999999"
    @ PROW(),64 SAY NO_BILL
    XN_PRE=XN_PRE+ PRE_GET
    XN_LST=XN_LST+LST_BILL
    SKIP
  ENDDO
  @ PROW()+1,5 SAY     "-------------------------------------------------------------------"
  @ PROW()+1,45 SAY XN_PRE     PICT "99999999"
  @ PROW(),54 SAY XN_LST     PICT "99999999"
  @ PROW()+3,5 SAY "  "
  @ PROW()+1,5 SAY "  "
  SET DEVI  TO	SCRE
  GOTO X_CKBN
ENDIF
retu
**-----------------------------------------------------------------------------
PROCEDURE  CHKREP_PNT
PARAMETERS  P1,P2,P3
X_CKBN=RECNO()
SELE  7
COUNT  TO XN_FILT
SUM TTVUSE *U_PRICE  TO X_PREGET
IF  XN_FILT  <=0
  XN_FILT  =1
ENDIF
XNA_FILT=1
GOTO   TOP
DO WHILE .NOT.	EOF()
  KK="PNT_OK&BPORT"+ "()"
  KK=&KK
  x= RDLPT(VAL(bPORT)-1)
  IF (x =144)  .or. (x=pnt_redy_code)
      SET  CONS  On
    set print to lpt&BPORT
    ? chr(27) + "sp&BPORT;"
      SET  CONS  ON
    SET DEVI TO PRINT
    SetPntWx("5")
    @ PROW(),2	SAY  CHR(27)+"C"+CHR(33)
    SETPRC(0,PCOL())
    @ 1,5 SAY  XMAKER_2
    @ 2,5  SAY	XMAKER_3
    @ 2,31 SAY	SDATE
    @ 2,52 SAY	EDATE
    @ 2,73 SAY XNA_FILT PICT "999"
    @ 2,76 SAY "/"
    @ 2,77 SAY LTRIM(STR(INT((XN_FILT/10)+0.9),3,0))
    XN_LINE=1
      @ PROW()+2,3  SAY " "
    DO WHILE (.NOT. EOF()) .AND. XN_LINE <=10
      @ PROW()+2,1 SAY SUBSTR(DTOC(LUDATE),1,5)
      @ PROW(),10 SAY INT(RATNO/10)  PICT "9999"
      @ PROW(),19 SAY TTVUSE PICT "99.9"
      @ PROW(),27 SAY U_PRICE PICT "9999"
      @ PROW(),35 SAY TTVUSE *U_PRICE PICT "999999"
      @ PROW(),47 SAY 1  PICT "9"
      @ PROW(),51 SAY SUBSTR(ALLTRIM(P1702),1,20)
      @ PROW(),70 SAY "00" +LTRIM(STR(LAGNO1,6,0))
      SKIP
      XN_LINE=XN_LINE+1
    ENDDO
    @ 26,12  SAY  XN_PREGET  PICT "99999999"
    @ 26,57  SAY  XN_FILT    PICT "999"
    @ 28,12  SAY  XN_LSTBIL  PICT "99999999"
    @ 28,40  SAY  X_PREGET  PICT "99999999"
    @ 28,64  SAY  (X_PREGET -XN_PREGET +XN_LSTBIL)  PICT "99999999"
    EJECT
  ELSE
    EXIT
  ENDIF
ENDDO
SET DEVI  TO  SCRE
GOTO X_CKBN
retu
**-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
PROCEDURE  CHKREPALL_PNT
PARAMETERS  P1,P2,P3
SELE 9
INDE ON US2    TO US2	 UNIQUE
SET INDE TO US2
GOTO  TOP
DO WHILE .NOT.EOF()
  XMAKER=US2
  X_P1501=XMAKER
  IF EMPTY(X_P1501)=.F.
    SELE 11
    LOCA   FOR	alltrim(P1501)==alltrim(X_P1501)
    IF	.NOT.  EOF()
      XMAKER_2=SUBSTR(LTRIM(P1502),1,22)
      XMAKER_3=P1503
    ELSE
      XMAKER_2="                      "
    ENDIF
  ENDIF
  SELE 15
  SUM PRE_GET TO  XN_PREGET  FOR (LUDATE >= SDATE ) .AND. (LUDATE <= EDATE ) .AND. US2=XMAKER
  SUM LST_BILL TO  XN_LSTBIL  FOR (LUDATE >= SDATE ) .AND. (LUDATE <= EDATE ) .AND. US2=XMAKER
  SELE 7
  SET FILT  TO	(LUDATE >= SDATE ) .AND. (LUDATE <= EDATE ) .AND. (US2=XMAKER	)
  GOTO	TOP
  x= RDLPT(VAL(BPORT)-1)
  IF (x =144)  .or. (x=pnt_redy_code)
    DO	CHKREP_PNT
  ELSE
    EXIT
  ENDIF
  SELE 9
  SKIP
ENDDO
SET INDE TO
&&-----------------------------------------------------------------------------
PROCEDURE  DIS_PROC
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
ARR1 :={"°t¤ñ¥N¸¹ ","-¤ôªd¢°","-¤ôªd¢±(Kg/¤è)"}
ARR2 :={"DSRATNO","DSCO1","DSCO2"}
ARR3 :={"9999","999","999"}
ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0}
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 16
goto top
if  BOF()
  APPE BLANK
  REPL	DSDATE	WITH DATE()
ENDIF
n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
P_FUNC2=" "
_GET_BROW(18,5,5,3,ARR1,ARR2,ARR3,"_DMAKE1","16","Y",.T.,.F.)
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
SET COLOR TO &C7 +/ &C1
DELE  FOR  DSRATNO=0
PACK
REPL  DSDATE WITH DATE()  FOR  RECNO()>1
func_s="      "
retu
**-----------------------------------------------------------------------------
FUNCTION M_TANK
PARAMETERS  X_UL,Y_UL,X_DR,Y_DR,N_COLOR,X_OFFSET,X_PLUS,H_MTB,X_MTB
LINE(X_UL+X_OFFSET,Y_UL,X_DR+X_OFFSET+X_PLUS,Y_UL,N_COLOR)
LINE(X_DR+X_OFFSET+X_PLUS,Y_UL,X_DR+X_OFFSET+X_PLUS,Y_DR,N_COLOR)
LINE(X_UL+X_OFFSET,Y_DR,X_DR+X_OFFSET+X_PLUS,Y_DR,N_COLOR)
LINE(X_UL+X_OFFSET,Y_UL,X_UL+X_OFFSET,Y_DR,N_COLOR)
&&  OUT LINE  ¢z¢w¢w¢{
&&	      ¢x    ¢x
&&	      ¢|¢w¢w¢}
&&

LINE(X_UL+1+X_OFFSET,Y_UL+1,X_DR-1+X_OFFSET+X_PLUS,Y_UL+1,N_COLOR)
LINE(X_DR-1+X_OFFSET+X_PLUS,Y_UL+1,X_DR-1+X_OFFSET+X_PLUS,Y_DR-1,N_COLOR)
*LINE(X_UL+1+X_OFFSET,Y_DR-1,X_DR-1+X_OFFSET+X_PLUS,Y_DR-1,N_COLOR)
LINE(X_UL+1+X_OFFSET,Y_UL+1,X_UL+1+X_OFFSET,Y_DR-1,N_COLOR)
&& INSIDE LINE	¢z¢w¢w¢{
&&		¢x    ¢x
&&		¢|¢w¢w¢}
&&

LINE(X_UL+X_OFFSET,Y_DR,X_UL+X_OFFSET+X_MTB,Y_DR+H_MTB,N_COLOR)
LINE(X_UL+X_OFFSET+X_MTB,Y_DR+H_MTB,X_DR+X_OFFSET+X_PLUS-X_MTB,Y_DR+H_MTB,N_COLOR)
LINE(X_DR+X_OFFSET+X_PLUS,Y_DR,X_DR+X_OFFSET+X_PLUS-X_MTB,Y_DR+H_MTB,N_COLOR)
&& BOTTOM LINE
&&	úZúYú[
LINE(X_UL+X_OFFSET+1,Y_DR,X_UL+X_OFFSET+X_MTB,Y_DR+H_MTB-1,N_COLOR)
LINE(X_DR+X_OFFSET+X_PLUS-1,Y_DR,X_DR+X_OFFSET+X_PLUS-X_MTB-1,Y_DR+H_MTB,N_COLOR)



RETU


#ifndef  dfRaten_2Page


**-----------------------------------------------------------------------------
PROCEDURE  DSP_TOTW
PARAMETERS  P1,P2,P3
c_color=SETCOLOr()
SET COLOR TO GR+ / BL
*@ Y_POSI,33  SAY  (M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) PICT "9999"
XTOT=0
FOR I=1 TO gs_tot + uwc_tot
  IX_C=ALLTRIM(STR(I,2,0))
  XTOT=XTOT +  M&IX_C
  IF UCHTYPE=16 .AND.  I>=9
    EXIT
  ENDIF
NEXT
*@ Y_POSI,TW_DSPX  SAY XTOT  PICT "9999"
@ Y_POSI,ARR_DSPN[gs_tot +uwc_tot+2]  SAY XTOT	PICT "9999"
SET COLOR TO &c_color
retu


#endif

&&-----------------------------------------------------------------------------
PROCEDURE  TDO_DWG
PARAMETERS  P1,P2,P3
SELE 5
GOTO 40
FBOX(PA1,PA3,PA4,PA2,0,65535)
LINE(PA1,PA3,PA1,PA2,PA10)
LINE(PA1,PA2,PA4,PA2,PA10)
LINE(PA1,PA2,PA4,PA2,PA10)
X=PA2-(PA2-PA3)*PMIXA/PA5
LINE(PA1,X,PA4,X,PA9)
X=PA1+(PA4-PA1)*PMIXTM/PA6
LINE(X,PA3,X,PA2,PA9)
Y=50
Y1=(PA2-PA3)*50/PA5
Y2=PA2-Y1
DO  WHILE  Y<PA5
  LINE(PA1-4,Y2,PA1,Y2,7)
  Y2=Y2-Y1
  Y=Y+50
ENDDO
Y=INT(PA3/18)
@  Y-1,0  SAY ALLTRIM(STR(PA5,3,0))
@  Y,0	SAY "A"

X=10
X1=(PA4-PA1)*10/PA6
X2=PA1+X1
DO  WHILE  X<PA6
  LINE(X2,PA2,X2,PA2+4,7)
  X2=X2+X1
  X=X+10
ENDDO
Y=INT(PA2/18)
X=INT((PA4+4)/8)
@  Y-1,X-1  SAY ALLTRIM(STR(PA6,3,0))
@  Y,X	SAY "¬í"
@  Y,0	SAY "0"
retu
&&-----------------------------------------------------------------------------
FUNCTION MTANK_mark
PARAMETERS  sm_kind,sm_no,sm_on
if  sm_ON=1
  @ SM_KIND,A_M_NAME[SM_NO,14] SAY "úD"
else
  @ SM_KIND,A_M_NAME[SM_NO,14] SAY "úP"
endif
RETU
**-----------------------------------------------------------------------------
FUNCTION CTANK_mark
PARAMETERS  sm_kind,sm_no,sm_on
SET COLOR TO &C2 / &C1
DO  CASE
CASE sm_ON=0
  @ SM_KIND,A_M_NAME[SM_NO,15] SAY "úP"
CASE sm_ON=1
  @ SM_KIND,A_M_NAME[SM_NO,15] SAY "úY"
CASE sm_ON=2
  @ SM_KIND,A_M_NAME[SM_NO,15] SAY "úD"
ENDCASE
SET COLOR TO &C4 / &C1
RETU
**-----------------------------------------------------------------------------
FUNCTION FILL_A_D4
PARAMETERS  A_N,X1,X2,X3,X4,X5,XN
FOR XAN1=X2 TO	X3
  FOR XAN2=1  TO  X4
    FOR XAN3=1 TO  X5
      A_N[X1,XAN1,XAN2,XAN3] :=XN
    NEXT
  NEXT
NEXT
RETU
**-----------------------------------------------------------------------------
FUNCTION FILL_A_D2
PARAMETERS  A_N,X1,X2,X3,XN
FOR XAN1=X1 TO	X2
  FOR XAN2=1  TO  X3
    A_N[XAN1,XAN2] :=XN
  NEXT
NEXT
RETU
**-----------------------------------------------------------------------------
FUNCTION A_COPY_4
PARAMETERS  A_N,X1,X2
FOR XAN1=1 TO  21
  FOR XAN2=X1  TO  X2
    FOR XAN3=1 TO  PRESS_LEN4
      A_N[2,XAN1,XAN2,XAN3] :=A_N[1,XAN1,XAN2,XAN3]
    NEXT
  NEXT
NEXT
RETU
**-----------------------------------------------------------------------------
FUNCTION A_COPY_5
PARAMETERS  A_N,X1,X2
FOR XAN1=1 TO  20
  FOR XAN2=X1  TO  X2
    FOR XAN3=1 TO  PRESS_LEN4
      A_N[4,XAN1,XAN2,XAN3] :=A_N[1,XAN1,XAN2,XAN3]
    NEXT
  NEXT
NEXT
RETU
**-----------------------------------------------------------------------------


FUNCTION A_STOR_4
PARAMETERS  A_N,X1,X2
FOR XAN1=1 TO  20
  FOR XAN2=X1  TO  X2
    FOR XAN3=1 TO  PRESS_LEN4
      A_N[3,XAN1,XAN2,XAN3] :=A_N[2,XAN1,XAN2,XAN3]
    NEXT
  NEXT
NEXT
RETU
&&>>>------------------------------------------------------------------------------------------------
FUNCTION A_STOR_1
PARAMETERS  A_N,X0,X1,X2
FOR XAN1=X0 TO	20
  FOR XAN2=X1  TO  X2
    FOR XAN3=1 TO  PRESS_LEN4
      A_N[3,XAN1,XAN2,XAN3] :=A_N[2,XAN1,XAN2,XAN3]
    NEXT
  NEXT
NEXT
RETU
&&>>>------------------------------------------------------------------------------------------------
&&>>>------------------------------------------------------------------------------------------------
FUNCTION A_STORn_1
PARAMETERS  A_N,X0,X1,X2,xs,xt
FOR XAN1=X0 TO	20
  FOR XAN2=X1  TO  X2
    FOR XAN3=1 TO  PRESS_LEN4
      A_N[xt,XAN1,XAN2,XAN3] :=A_N[xs,XAN1,XAN2,XAN3]
    NEXT
  NEXT
NEXT
RETU
&&>>>------------------------------------------------------------------------------------------------
FUNCTION _DSP_VBROW
PARAMETERS  Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI,_PRINT  &&
DSP_MH=INT((79-X1_N-YL_N-2)/YL_N)
IF _MODI="Y"
  STOR 0 TO FIST_REC,LAST_REC
ENDIF
_DATA_MODIFY =0
X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+TIT_N+1,79)
XCOR=SETCOLOR()
XXP=LEN(C_TOP2)+1
IF EMPTY(C_TOP2)=.T.
  XXP=0
ENDIF
ARR_DSPN=ARRAY(1)
XX=X1_N+XXP +1+YL_N
ARR_DSPN[1] :=XX -1-LEN(ARR3[1])
X=2
*XX=X1_N+XXP
DO WHILE  X <=	TIT_N
  AADD(ARR_DSPN,XX -LEN(ARR3[X])-1)
  X=X+1
ENDDO
X=1
D_C=ALLTRIM(C_TOP2) +" "
DO WHILE  X <=	TIT_N
  D_C=D_C +ARR_TITLE[X]
  X=X+1
  IF X <= TIT_N
    D_C=D_C +" "
  ENDIF
ENDDO
DC_L=LEN(D_C)
SET DEVI TO SCRE
X_C2="¡ô¡õ¤W¤U­¶ Esc¸õÂ÷"
IF  (_MODI="Y") .OR. (_MODI="K")
  X_C1="¡ô¡õ¤W¤Uµ§ F3-­×§ï  Esc¸õÂ÷ "
ELSE
  X_C1=""
ENDIF
IF (FIST_REC<>0).AND. (FIST_REC=LAST_REC)
  X_C1=" F3-­×§ï  Esc¸õÂ÷ "
  X_C2=""
ENDIF
X=LEN(X_C1)
IF X>DC_L
  XX=INT((X-DC_L)/2)
ELSE
  XX=0
ENDIF
SET COLOR TO GR+ / BL
@ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+TIT_N+2,X1_N + (YL_N*DSP_MH)+1
BOX_S(Y1_N-1,X1_N-2-XX-LEN(ARR_TITLE[1]),Y1_N+TIT_N+1,X1_N + (YL_N*DSP_MH)+1 )
SET COLOR TO GR+ / R
*@ Y1_N+YL_N,X1_N  SAY	 SPACE(DC_L)
IF  DC_L>LEN(X_C1)+LEN(X_C2)+1
  X=LEN(X_C1)+LEN(X_C2)
  @ Y1_N+TIT_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2+" "+X_C1
ELSE
  @ Y1_N+TIT_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY	 X_C1
  @ Y1_N+TIT_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2
ENDIF
IF EMPTY(C_TOP1)= .F.
  @ Y1_N+TIT_N+1,X1_N	SAY   C_TOP1
ENDIF
X=1
DO WHILE  X <=	TIT_N
  @ Y1_N-1+X,X1_N-1-LEN(ARR_TITLE[X])	SAY ARR_TITLE[X]
  X=X+1
ENDDO
SELE &N_SELE
N_YN=Y1_N
N_REC=1
GOTO TOP
SET COLOR TO W+ / BL
S_REC=RECNO()
DO _DSP_VALL
N_REC=RECNO()
*N_YN=Y1_N
*GOTO TOP
_LOOP_BR=1
DO WHILE _LOOP_BR =1
  T=0
  DO WHILE T=0
    T=INKEY()
    IF DLA_DSP=1
      DO DSP2
    ENDIF
    DO LUSTP
    IF _PRINT=1
      T=3
      IF  EOF()
	T=27
      ENDIF
    ENDIF
  ENDDO
  SELE &N_SELE
  DO CASE
  CASE T=K_F7
    IF	EMPTY(F7_FUNC) =.F.
      DO &F7_FUNC
    ENDIF
  CASE T=K_F8
    IF	EMPTY(F8_FUNC) =.F.
      DO &F8_FUNC
    ENDIF
  CASE T=-2   .AND. (_MODI="Y"  .OR.    _MODI="K"  )
    &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
    _GET_STP=1
    DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
       R_C=ARR_REC_NAME[_GET_STP]
       T_C=ARR_TYPE[_GET_STP]
       _D_TYPE=TYPE("&R_C")
       C_L=LEN(ARR_TYPE[_GET_STP])
       SET COLOR TO  &12 /&11
       @ N_YN,ARR_DSPN[_GET_STP]  SAY &R_C   PICT "&T_C"
       GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
       p_func=P_FUNC&GET_STPC
       X_GETSTP=_GET_STP
       set  colo  to gr + /w
       _REC_DSP(N_YN)
      _GET_STP=READ_A(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC")
      IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	_ACT_PX=UPPER(_ACT_PX)
      ELSE
	IF _ACT_PX >INT(VAL(ARR3[X_GETSTP]))
	  _ACT_PX =INT(VAL(ARR3[X_GETSTP]))
	ENDIF
      ENDIF
      T_C=ARR_TYPE[X_GETSTP]
      @ N_YN,ARR_DSPN[X_GETSTP]   SAY  _ACT_PX	PICT "&T_C"
      SELE &N_SELE
      REPL  &R_C  WITH _ACT_PX
      IF  EMPTY(ARR_PCS[X_GETSTP]) =.F.
	PCS_CF(N_YN,&R_C,X_GETSTP,RECNO())
      ENDIF
    ENDDO
    set  colo to  gr + /w
    _REC_DSP(N_YN)
    T=0
    _DATA_MODIFY=1
  CASE T=5   .OR. T=18
    GOTO  S_REC
    SKIP (-DSP_MH)
    S_REC=RECNO()
    IF BOF()
      GOTO  TOP
    ENDIF
    GOTO  S_REC
    DO _DSP_VALL
  CASE T=24 .OR. T=3
    SKIP
    S_REC=RECNO()
    DO _DSP_VALL
    IF	_MODI="Y"
      SKIP
      IF  EOF()
	SKIP -1
	FOR  X =1 TO TIT_N
	  R_C=ARR_REC_NAME[X]
	  IF EMPTY(&R_C)=.F.
	    APPE BLANK
	    EXIT
	  ENDIF
	NEXT
	SKIP
      ENDIF
      SKIP -1
    ENDIF
  CASE T=7 .and. _modi="Y"
    DELE
    PACK
    IF	EOF()
      SKIP -1
      IF  EOF()
	APPE BLANK
      ENDIF
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    SET COLOR TO W+ / BL
    DO _DSP_ALL
    SET COLOR TO GR+ / W+
    GOTO N_REC
    _REC_DSP(N_YN)
    _DATA_MODIFY =1
  CASE T=23 .OR. T=27
    _LOOP_BR=0
  ENDCASE
ENDDO
T=0
SET COLO TO &XCOR
RESTSCREEN(Y1_N-1,0,Y1_N+YL_N+1,79,X_G_B)
RETU
&&>>>------------------------------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
PROCEDURE    _DSP_VALL
PARAMETERS  P1,P2,P3
XAL=1
Y_X=Y1_N
@ Y1_N,X1_N  CLEA TO Y1_N+TIT_N,X1_N + (YL_N *DSP_MH)
A_PRINT =ARRAY(TIT_N+1,6)
IF .NOT. EOF()
  X_COL=1
    DO WHILE  (XAL <=DSP_MH)  .AND. (.NOT. EOF())
      _REC_VDSP(Y_X)
      SKIP
      X_COL=1+X_COL
      XAL=XAL+1
    ENDDO
    IF (_PRINT=1 )  .and. ( pnt1_ok=1)
      SET  CONS  On
      set print to lpt1
      ? chr(27) + "sp1;"
      SET  CONS  ON
      SET  DEVI  TO  PRINT

      FOR P_NY=1 TO TIT_N
	@ PROW()+1,X1_N-1-LEN(ARR_TITLE[P_NY])	 SAY ARR_TITLE[P_NY]
	FOR P_NX=1 TO X_COL-1
	  if  lsk <3  .and. p_ny=2
	    if	! (lsk =1  .and. pnttype=2  )
	      @ PROW(),YL_N *(P_NX-1)+ARR_DSPN[1]+3  SAY A_PRINT[P_NY,P_NX]
	    endif
	  else
	    if	! (lsk =1  .and. pnttype=2 .and. p_ny >0   )
	      @ PROW(),YL_N *(P_NX-1)+ARR_DSPN[1]  SAY A_PRINT[P_NY,P_NX]
	    endif
	  endif
	NEXT
	if  lsk =1  .and. pnttype=2
	  PNT_X=10
	ELSE
	  PNT_X=70
	ENDIF
	@ PROW(),PNT_X	SAY A_TOTW[P_NY]
      NEXT
	@ PROW()+1,0 SAY       "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w"
	@ PROW()+1,0 SAY       " "
      FOR P_NX=1 TO X_COL-1
	if  ! (lsk =1  .and. pnttype=2	 )
	  @ PROW(),YL_N *(P_NX-1)+ARR_DSPN[1]-2  SAY  A_PRINT[TIT_N+1,P_NX]
	endif
      NEXT
      if  lsk =1  .and. pnttype=2
	PNT_X=10
      ELSE
	PNT_X=70
      ENDIF
	if  lsk=1
	  @ PROW(),PNT_X  SAY A_TOTW[kind+3]
	else
	  @ PROW(),PNT_X  SAY A_TOTW[kind+4]
	endif
	@ PROW()+1,70  SAY " "
	@ PROW()+1,70  SAY " "
      SET  DEVI  TO  SCRE
      INKEY(5)
    ENDIF
  SKIP -1
  N_YN=Y_X -1
ENDIF
N_REC=RECNO()
RETU
&&-----------------------------------------------------------------------------
PROCEDURE  GET_DATA1
PARAMETERS  P1,P2,P3
A_M_NAME :={" ¥Û¢° "," ¥Û¢± "," ¥Û¢² "," ¬â¢° "," ¬â¢± ","  ¤ô  ","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²"," ÃÄ¾¯ "}
A_REP_DATA :={{SPACE(4),SPACE(20),SPACE(30),0,SPACE(10),0,0},{SPACE(4),SPACE(20),SPACE(30),0,SPACE(10),0,0}} &&¼t°ÓNO,NAME,ADRESS,¥æ³f²Ö­p,CAR NO.,ªÅ­«
publ	    RET_X1,RET_X2,RET_X3,RET_X4,RET_X5,RET_X6,C_TOP1,C_TOP2,GS_ADJW,pnt_water
STOR " " TO C_TOP1,C_TOP2
FOR I=0 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next
STOR 0 TO COM_OK,KOT,M_MIX,F_DISPROC,fist_rec,last_rec,pnt1_ok,pnt2_ok,ERRPNT_E,WMINX,WMINX5,WMINSF,DOUIN


GS_ADJW :=ARRAY(4)
GS_ADJW[1] :=0
GS_ADJW[2] :=0
GS_ADJW[3] :=0
GS_ADJW[4] :=0
X=" "
cn=""
X=DSK_SNO(CN)
A_S=" "         &&***
C_S=" "         &&***
IF ltrim(A_S) <> ""  .OR.   LTRIM(C_S) <> ""
  IF (A_S <> X )  .AND. (C_S <> X)
    QUIT
  ENDIF
ENDIF
*clea all
DSK_ERR=0
IF FILE("c:\INDATA_A.MEM")=.t.
  set defa to c:\
  DSK_ERR=0
  IF A_S <> "         "
    X=" "
    cn=""
    X=DSK_SNO(CN)
    IF A_S <> X
      DSK_ERR=1
    ENDIF
  ENDIF
  IF C_S <> "         "
    X=" "
    cn="C:"
    X=DSK_SNO(CN)
    IF C_S <> X
      DSK_ERR=1
    ENDIF
  ENDIF
  IF  DSK_ERR=1888
    IF SER_AOK()=1
      DO DSK_KEY
      QUIT
    ELSE
      *  QUIT
    ENDIF
  ENDIF
  set defa to
endif
*clea all
CLEA
SET CURS OFF
douin=0
USE
use par
goto 18
set colo to w/b
@  3,27  SAY "¢ä¢í¢ú¢û¢ñ¢ö¡@¡@¢Ù¢±¡D¢¯¡@"
@  5,13  say "·PÁÂ±z,¨Ï¥Î¥»¤½¥q¶}µo¤§²£«~,¦p¦³¥ô¦óºÃ°Ý½Ð»P¥»¤½¥qÁpµ¸"
if pa8=920   .AND.  ( FILE("DEMO_SV1.COM")=.T.)
  do demo_txt
  ET3D(130,250,13,3,3,"¢Ò¢Ó¢Û¢Ý")
  inkey(1)
else
  IF FILE("\et3\ÿ.ÿ")=.T.
    @  7,13  say "«Â¦K¬ì§Þ ¢â¢Ó¢Ú¡G¡]¢¯¢¶¡^¢µ¢°¢¶¢¯¢±¢¯¢±     "
  ELSEIF FILE("\et3\ÿÿ.ÿ")=.T.
    *ET3D(150,150,13,2,2,"¾É¤Þ¬ì§Þ")
    *? CHR(27),"T16;"
    @ 6,13  say "¾É¤Þ¬ì§Þ ¢â¢Ó¢Ú¡G¡]¢¯¢¶¡^¢µ¢°¢µ¢´¢¶¢´¢²¡A¢²¢µ¢²¢°¢¶¢¶¢¶"
    @ 7,13  say "                   ¢¯¢¸¢²¢µ¢¸¢¶¢¶¢´¢·¢´                "
    INKEY(3)
    *7,13  say "¾É¤Þ¬ì§Þ ¢â¢Ó¢Ú¡G¡]¢¯¢¶¡^¢µ¢°¢µ¢´¢¶¢´¢²¡A¢²¢µ¢²¢°¢¶¢¶¢¶"
    *ET3D(180,150,13,3,3,"«Â¦K¬ì§Þ")
    douin=1
  ENDIF
  @  8,13  say MarkVer
  #ifDEF DIO16
    @  9,13  say "DIO 16"
  #else
    @  9,13  say "DIO 48"
  #endif



   @ 1,1  say	VERSION &&  " VER:TLU15_01190715   "
  INKEY(4)
ENDIF
USE
? CHR(27),"T16;"
IF FILE("\et3\ÿ\tÿ")=.f.
  quit
endif
*SET PATH TO  a:; c:\LU9;
* SETSTAR(0)
STOR 0 TO STP9,DSPTIME,MTANDO,NTANDO
stor space(14)	to  nscano1,nscano2
* STOR	"                   "  TO  cno1,cno2,cno3,cno4,cno5
IF FILE("\et3\ÿ.ÿ")=.T.
  douin=0
ELSEIF FILE("\et3\ÿÿ.ÿ")=.T.
  douin=1
endif
PUBL PX,XPX,_act_px,_lastkey,_DATA_MODIFY
STOR 0 TO F3_N,NPAH1,GETNO,FGETNO,T1,T2,TN1,SCRNO,_DATA_MODIFY	  &&NPAH1.PRG
STOR "0" TO    TPCOI,mcarno
STOR  0  TO  SW9,WIFOK,WIZOK,TOTWI,TOTWK,SWI0,STOP9,STOPTM9,PZI,discl,discl_1,discu,TANKSTP
STOR  1 TO   TOMIX,NEXSTP,DOWNSKP,UPSKP,LURECNO,FNEXOKL,FNEXOKU,PERFLR
STOR 0 TO NEXOK,NEXTOK,NEXTOK1,NEXTOK2,TOTWA,TOTWB,TOTWC,TOTWD,TOTWE,TOTWF,TOTWG,TOTWH,SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8,TOTVUSE,DSPCASE,downcalf
stor  0 TO DOWNZTM,NVUSE,UPOV,PVUSE,PRTNO,UPOVSTP,PRCEND,PRCEND1,MVUSE,MIXSTM,DLYW,DLYCO1,DLYCO2
STOR 0 TO STAR,DOWNOV,DOWNZER,FDSPA,UPZER,SWA0,SWB0,SWC0,SWD0,SWE0,SWF0,SWG0,SWH0,CONF,DRAF,DRBF,DRCF,DRDF,DREF,DRFF,DRGF,DRHF,DRMF,DRTKF,PCONVTM1,CONSTPF
STOR 0 TO PZA,PZB,PZC,PZD,PZE,PZF,PZG,PZH,SVUSE,MRATNO,SETP1,SETP2,SETP3,SETP4,SETP5,SETP6,SETP7,DISC1,DISC2,disc2_c2,DISC2_C2N,DISC2_C2P,DISCH1
STOR  1 TO PERSAD1,PERCON,PER,DISC2_C2Q,calw_rep,ACALW_REP,XCALW_REP
stor 0 to STOPTML3,STOPTML4,STOPTML6,STOPTML7,STOPL3,STOPL4,STOPL6,STOPL7,WAFOK1 ,WBFOK1 ,WCFOK1 ,WDFOK1,F_NEXT1,F_NEXT2
STOR 1 TO WCNT1,WCNT2,WCNT3,WCNT4,WCNT5,WCNT6,WCNT7,WCNT8,cno,DLA_DSP,dis_proc
STOR "3" TO DOWNPRT,UPPRT
&& STOR 0 TO HI1,HI2,HI3,HI4,HI5,HI6,HI7,HI8,HIF1,HIF2,HIF3,HIF4,HIF5,HIF6,HIF7,HIF8
STOR 0 TO HIREP,RMOUSE,RMT,ISDEMO,demno_n,AU_PRICE,M_MIX,f_nextok1,f_nextok2,DO0_DSP,DO0_DSPF,F7_ACT
public	 A_PRESS_B0
  A_PRESS_B0 :=ARRAY(3,21,kind,PRESS_LEN4)
  FILL_A_D4(A_PRESS_B0,1,1,21,kind,PRESS_LEN4,0)
  FILL_A_D4(A_PRESS_B0,2,1,21,kind,PRESS_LEN4,0)
  FILL_A_D4(A_PRESS_B0,3,1,21,kind,PRESS_LEN4,0)
PUBLIC RECIP
RECIP :=ARRAY(kind,2)
FILL_A_D2(RECIP,1,kind,2,0)
stor "     " to func_s
STOR "1"  TO ludbf,R_C,n_sele
STOR "R" TO CF
stor 704  TO IO_726
public da_max1
if  empty(da_max1)=.T.
  DA_MAX1=5000
  DA_MAX2=1000
  DA_MAX3=1200
  DA_MAX4=1500
  DA_MAX5=1500
endif
*stor  1 to lag_pno
xx_1=1
PANDIC=0
REST FROM LAGDATA9  ADDITIVE
IF LAGDATE<>DATE()
  LAGW=0
  LAGDATE=DATE()
  IF ( repno_cont=0 )
    LAG_REPNO1=fgetserno(9,1)
    LAG_REPNO=fgetserno(9,1)
  endif
ENDIF
ASCANO=SUBSTR(LAG_REPNO1,-9,9)
SAVE TO LAGDATA9 ALL LIKE LAG*
*REST FROM PARM  ADDITIVE
* PERCON=T/(T+P)
*DSPCON=ACTCON*PERCON
* PERSAD1 =T/(T-P)
*DSPSAD2=ACTSAD2*PERCON
*PARDO=1
*DO WHILE PARDO=1
PARDO=0
*do dsp_0
  X=MEMORY(2)
    DO DEL_MEM
    SAVE TO INDATA_A
&& 20141123 SAVE TO INDATA_A
RETURN
&&-----------------------------------------------------------------------------
FUNCTION  ARR_DSPA     &&­p¶qRELAY TEST AND DISPLAY ARROW  DIN0 TO 4
PARAMETERS  XN,TYPE
XCN=ALLTRIM(STR(INT(XN)))
XCIO=ALLTRIM(STR(INT(XN-1),2,0))
X=DIN(XN-1)
IF (I0&XCIO <> X ) .and.  (CRT_DSPA=1) .AND. (CRT_DSP_ALL=1)
  I0&XCIO = X
  TYPE=X
  *IF (CRT_DSPA=1) .AND. (CRT_DSP_ALL=1)
    IF	TYPE=1
      X1=(P_XA&XCN+P_XB&XCN)/2
      Y1=DSPB_Y1-100
      DSP_ARROW(X1,Y1,2,1.7,1,1,"12")
    ELSE
      X1=(P_XA&XCN+P_XB&XCN)*.5 -28
      Y1=DSPB_Y1-103
      X2=(P_XA&XCN+P_XB&XCN)*.5 +28
      Y2=DSPB_Y1-47
      FBOX(X1,Y1,X2,Y2,"8","&HFF FF")
    ENDIF
  *ENDIF
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION  DSPA_ARROW
PARAMETERS  N_DSP,DX_TYPE,XCOLO
 &&IF WEIGHT_TYPE[N_DSP]=1 .OR.WEIGHT_TYPE[N_DSP]=3
 IF WEIGHT_TYPE[N_DSP]=1 .OR.WEIGHT_TYPE[N_DSP]=3  .OR.WEIGHT_TYPE[N_DSP]=6 .OR.WEIGHT_TYPE[N_DSP]=8
   if A_M_NAME[N_DSP,23]=A_M_NAME[N_DSP+1,23]
     X_TMP=A_M_NAME[7,18]
   ELSE
     X_TMP=A_M_NAME[3,18]
   ENDIF
 ELSE
  X_TMP=A_M_NAME[7,18]
 ENDIF
DSP_ARROW(A_M_NAME[N_DSP,19],X_TMP,A_M_NAME[1,18],A_M_NAME[2,18],1,DX_TYPE,XCOLO )
RETU
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
FUNCTION  DSPB_ARROW
PARAMETERS  N_DSP,DX_TYPE,XCOLO
XC1=A_M_NAME[N_DSP,20]
YC1=A_M_NAME[4,18]
YH=A_M_NAME[2,18]
XW=A_M_NAME[N_DSP,22]
XX1=XC1-(XW/2)
YY1=YC1
XX2=XC1+(XW/2)
YY2=YC1-YH
FBOX0(XX1,YY1,XX2,YY2,0,"&HFFFF")
XX1=XC1-(XW/2)
YY1=YC1-YH-1
XX2=XX1+A_M_NAME[5,18]
YY2=YC1+1
LINE(XX1,YY1,XX2,YY2,A_M_NAME[6,18])
LINE(XX1+1,YY1,XX2+1,YY2,A_M_NAME[6,18])
XX1=XC1+(XW/2)
YY1=YC1-YH-1
XX2=XX1-A_M_NAME[5,18]
YY2=YC1+1
LINE(XX1,YY1,XX2,YY2,A_M_NAME[6,18])
LINE(XX1-1,YY1,XX2-1,YY2,A_M_NAME[6,18])
DSP_ARROW(A_M_NAME[N_DSP,20],A_M_NAME[4,18],A_M_NAME[1,18],A_M_NAME[2,18],1,DX_TYPE,XCOLO )
RETU
&&-----------------------------------------------------------------------------
FUNCTION  DSPA_FMK
PARAMETERS  N_DSP,X_P_TYPE
IF  X_P_TYPE=1
  FIL_COLOR2(A_M_NAME[N_DSP,19],A_M_NAME[3,18]-3,"C&HFF 00 00 FF/S",)
  @ 0,79 SAY ""
ELSE
  XC1=A_M_NAME[N_DSP,19]
  YC1=A_M_NAME[3,18]
  YH=A_M_NAME[2,18]
  XW=A_M_NAME[N_DSP,21]
  XX1=XC1-(XW/2)
  YY1=YC1
  XX2=XC1+(XW/2)
  YY2=YC1-YH
  FBOX0(XX1,YY1,XX2,YY2,0,"&HFFFF")
  XX1=XC1-(XW/2)
  YY1=YC1-YH-1
  XX2=XX1+A_M_NAME[5,18]
  YY2=YC1+1
  LINE(XX1,YY1,XX2,YY2,A_M_NAME[6,18])
  LINE(XX1+1,YY1,XX2+1,YY2,A_M_NAME[6,18])
  XX1=XC1+(XW/2)
  YY1=YC1-YH-1
  XX2=XX1- A_M_NAME[5,18]
  YY2=YC1+1
  LINE(XX1,YY1,XX2,YY2,A_M_NAME[6,18])
  LINE(XX1-1,YY1,XX2-1,YY2,A_M_NAME[6,18])
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION  DSPB_FMK
PARAMETERS  N_DSP,X_P_TYPE
IF  X_P_TYPE=1
  FIL_COLOR2(A_M_NAME[N_DSP,20],A_M_NAME[4,18]-3,"C&HFF 00 00 FF/S",)
  @ 0,79 SAY ""
ELSE
  XC1=A_M_NAME[N_DSP,20]
  YC1=A_M_NAME[4,18]
  YH=A_M_NAME[2,18]
  XW=A_M_NAME[N_DSP,22]
  XX1=XC1-(XW/2)
  YY1=YC1
  XX2=XC1+(XW/2)
  YY2=YC1-YH
  FBOX0(XX1,YY1,XX2,YY2,0,"&HFFFF")
  XX1=XC1-(XW/2)
  YY1=YC1-YH-1
  XX2=XX1+A_M_NAME[5,18]
  YY2=YC1+1
  LINE(XX1,YY1,XX2,YY2,A_M_NAME[6,18])
  LINE(XX1+1,YY1,XX2+1,YY2,A_M_NAME[6,18])
  XX1=XC1+(XW/2)
  YY1=YC1-YH-1
  XX2=XX1-A_M_NAME[5,18]
  YY2=YC1+1
  LINE(XX1,YY1,XX2,YY2,A_M_NAME[6,18])
  LINE(XX1-1,YY1,XX2-1,YY2,A_M_NAME[6,18])
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION  DSP_ARROW
PARAMETERS  XC1,YC1,X_SCA1,Y_SCA1,XP1,X_P_TYPE,XC_COLOR
*IF XP1=1
  XX1=XC1-(X_SCA1/2)
  YY1=YC1-(Y_SCA1/2)
  XX2=XC1+(X_SCA1/2)
  YY2=YC1 -(Y_SCA1/2)
  ? CHR(27),"SD14,0;"
  LINE(XX1,YY1,XX2,YY2,XC_COLOR)
  XX1= XX2
  YY1=YY2
  XX2=XC1
  YY2=YC1
  LINE(XX1,YY1,XX2,YY2,XC_COLOR)
  XX1= XX2
  YY1=YY2
  XX1=XC1-(X_SCA1/2)
  YY1=YC1-(Y_SCA1/2)
  LINE(XX1,YY1,XX2,YY2,XC_COLOR)
  XX1=XC1-(X_SCA1/4)
  YY1=YC1-Y_SCA1
  XX2=XC1+(X_SCA1/4)
  YY2=YC1-(Y_SCA1/2)
  FBOX(XX1,YY1,XX2,YY2,XC_COLOR,"&HFFFF")
  XX1=XC1-(X_SCA1/2)
  YY1=YC1-Y_SCA1
  XX2=XC1+(X_SCA1/2)
  YY2=YC1-1
  IF  X_P_TYPE=1
    FIL_COLOR2(XC1,YC1-5,"C&H00 FF FF FF/S",)
  ELSE
    YY2=YC1+1
    FBOX(XX1,YY1,XX2,YY2,XC_COLOR,"&HFFFF")
  ENDIF
*DO CASE
*CASE  X_P_TYPE=1
*  FIL_COLOR2(XC1,YC1+5,"C&H00 99 00 99 00 99 00 9900 00 00 00 00 00 00 00/S",)
*CASE  X_P_TYPE=2
*  FIL_COLOR2(XC1,YC1+5,"C&H00 00 99 99 00 00 99 99 00 00 00 00 00 00 00 00/X,")
*CASE  X_P_TYPE=3
*  FIL_COLOR2(XC1,YC1+5,"C&H00 00 99 99 00 00 99 9900 00 00 00 00 00 00 00/X,")
*CASE  X_P_TYPE=4
*  FIL_COLOR2(XC1,YC1+5,"C&H00 99 00 99 00 99 00 9900 00 00 00 00 00 00 00/S,")
*OTHERWISE
*ENDCASE
RETU
&&-----------------------------------------------------------------------------
PROCEDURE  SETW0
PARAMETERS  P1,P2,P3
  xd_wno=fSelectNo()
  SELE 17
   USE W0
  && USE
  && SELE 2
  && USE


  t=0
  SCRMA1=savescreen(13,0,24,79)
  && DO RATEN  with waste
  aisdatachg=0
  && RATEN(waste,@aisdatachg)
  F3_RUN=-1
  &&	&&TEN(waste,@aisdatachg,"17")
  RATEN(0,@aisdatachg,"17")
  F3_RUN=0
  if aisdatachg=1
    && SELE 2
    SELE 17
    repl   ratno   with  fsubstr(ratno,-ratno_wid," ",0)    for  recno() >0
    DELE FOR  ALLTRIM(RATNO)="0"  .OR.  EMPTY(ALLTRIM(RATNO)) =.T.
    PACK
    dele FILE w2.dbf
    SORT  ON  RATNO   TO W2
    USE
    IF	 ROM_N=1
      DELE FILE  C:\W0.DBF
      RENA  C:\W2.DBF TO   C:\W0.DBF
      USE  C:\W0
      TOTA ON RATNO   TO  W2
      USE
      DELE FILE  C:\W0.DBF
      RENA  C:\W2.DBF TO   C:\W0.DBF
    ELSE
      DELE FILE  W0.DBF
      RENA  W2.DBF TO	W0.DBF
      USE W0
      TOTA ON RATNO   TO  W2
      USE
      DELE FILE  W0.DBF
      RENA  W2.DBF TO	W0.DBF
    ENDIF
    && use
    && USE W1
    SELE 17
    use
    USE W0
  else
    && SELE 2
    && use  w1
    &&	SELE 17
    &&	USE W0
  endif && if aisdatachg=1

  sele &xd_wno
  if star=0
    CLEA
    DO	LU12_DSP
  else
    restscreen(13,0,24,79,scrma1)
    set cons on
    @ 23,9  SAY SUBSTR(SPACE(7)+ALLTRIM(ASCANO),-9,9)
    @ 23,24 SAY ACARNO
    @ 23,37 SAY ARATNO
    @ 23,52 SAY AVUSE	PICT "99.9"
    @ 23,61 SAY ATANDO	PICT "9999"
    SET COLOR TO &C5 +/ &C1
    @ 18,0 SAY "4.ºÏºÐ®e¶q:      ,000 "
    SET COLOR TO w+ / &C1
    @ 18,11   SAY DISKVOL
    X=_Tot_d_a[20,4] +2
    if ( _Tot_d_a[10,X] <>  NIL )
      if ( _Tot_d_a[10,X] > 0)	.and.  star=1
	set colo to  w+ /n
	@ 15,12 say _Tot_d_a[18,X]
	@ 16,12 say _Tot_d_a[10,X]  PICT  "99.9"
	@ 17,12 SAY  ACT_V  PICT  "99.9"
      ENDIF
    ENDIF
    *IF  WASTE=1
      @ 23,71 SAY substr(space(10)+alltrim(APOSITION),-9,9)
    *ENDIF
  endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION  GS_DROPOK
PARAMETERS  GS_N
GS_DROK=1
IF GS_DROP[GS_N,1]>1
  XN_D1=mod(GS_DROP[GS_N,1],100)
  FOR I=1  TO  KLCHN
    IF	(GS_DROP[I,1] < XN_D1 ) .AND. (GS_DROP[I,1] <>0)
      IF (GS_DROP[I,2] <> 1) .AND. (GS_DROP[I,2] <> 3)
	GS_DROK=0
	EXIT
      ENDIF
    ENDIF
  NEXT
ENDIF
RETU  GS_DROK
&&-----------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
FUNCTION  GS_DROPRST
PARAMETERS  GS_N
GS_CYL=1
FOR I=1  TO  KLCHN
  IF  GS_DROP[I,2] =0
    GS_CYL=0
    EXIT
  ENDIF
NEXT
IF GS_CYL=1
  FOR I=1  TO  KLCHN
    GS_DROP[I,2] :=0
  NEXT
ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION  SET_PNT
PARAMETERS   N_PNT
IF PNT_OK1()=1
  set  cons  on
  do case
  case aport="1"
    set print to lpt1
    ? chr(27) + "SP1;"
  case aport="2"
    set print to lpt2
    ? chr(27) + "SP2;"
  case aport="3"
    set print to lpt3
    ? chr(27) + "SP3;"
  endcase
  SET CONS On
  SET DEVI  TO	PRINT
    SetPntWx("5")
ENDIF
**-----------------------------------------------------------------------------
PROCEDURE   SPALLDATA
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2="¥X¨®°O¿ý"
ARR1 :={"¤é´Á     ","®É¶¡     ","°t¤ñ ","¦Ì¼Æ  ","¨®¸¹   "}
ARR2 :={"LUDATE","LUTIME","RATNO","TOTVUSE","CARNO"}
ARR3 :={"XXXXXXXXXX","XXXXXXXX","9999","99.9","XXXXXX"}
ARR4 :={0,0,0,2,0}
 ARR_PCS={" "," "," "," "," "}
 XN_TIT=5
RET_X1=SPACE(4)
n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
P_FUNC2=" "
_GET_BROW(3,3,15,XN_TIT,ARR1,ARR2,ARR3,"_DMAKE1","9","N",.T.,.F.)
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
SET COLOR TO &C7 +/ &C1
XMAKER=RET_X1
retu
&&-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
PROCEDURE  PNT_TOTDATA
PARAMETERS  P1,P2,P3
x= RDLPT(VAL(APORT)-1)
IF (x =144)  .or. (x=pnt_redy_code)
  SET CONS On
  do case
  case aport="1"
    set print to lpt1
    ? chr(27) + "sp1;"
  case aport="2"
    set print to lpt2
    ? chr(27) + "sp2;"
  case aport="3"
    set print to lpt3
    ? chr(27) + "sp3;"
  endcase
  SET CONS On
  SET DEVI TO PRINT
    SetPntWx("5")
  @ PROW()+3,3	SAY "¤é´Á:"
  @ PROW(),8  SAY DATE()

  @ PROW()+1,1 SAY  D_C
  @ PROW()+1,1	SAY "-------------------------------------------------------------------------------"
  REC_OLD=RECNO()
  GOTO TOP
  TMPX1=0
  TMPX2=0
  DO WHILE .NOT. EOF()
    @ PROW()+1,1 SAY  " "
    FOR  I=1  TO  6
      C_FIELD=ARR2[I]
      C_TYPE=ARR3[I]
      @ PROW(),ARR_DSPN[I] SAY &C_FIELD  PICT "&C_TYPE"
      IF I=4
	IF  &C_FIELD  > 0
	   TMPX1=TMPX1 +   &C_FIELD
	   TMPX2=TMPX2 +   1
	ENDIF
      ENDIF

    NEXT
    SKIP
  ENDDO
  @ PROW()+1,1	SAY "-------------------------------------------------------------------------------"
  @ PROW()+1,ARR_DSPN[4]-3  SAY TMPX1  PICT "99999.9"
  @ PROW(),ARR_DSPN[6]	  SAY  TMPX2	      PICT "9999"
  @ PROW(),ARR_DSPN[6] +6    SAY  "¨®¦¸"
  @ PROW()+1,1	SAY " "
  @ PROW()+1,1	SAY " "
  SET DEVI TO SCRE
  GOTO	REC_OLD
  SET CONS ON
ENDIF
   RETU
 **-----------------------------------------------------------------------------
 PROCEDURE  PNT_CARDATA
 PARAMETERS  P1,P2,P3
 IF (EOF()   .OR.  BOF() )
   RETU
 ENDIF
 x= RDLPT(VAL(APORT)-1)
 IF (x =144)  .or. (x=pnt_redy_code)
  XDATE5=LUDATE
  XTIME5=LUTIME
  XSNO5 =LAGNO1
  get_tite_d1(@_tot_d_a)
  SELE	(1 +DBFDN)
  LOCA	 FOR ( (LUDATE=XDATE5) .AND.  (LAGNO1=XSNO5) )
  IF EOF()  =.T.
    SELE 9
    RETU
  ENDIF
  L_PRESS=3
  PNT_TITa_p(Xdate5,@_tot_d_a)
  SELE	(1 +DBFDN)
  XNSCANO=lagno1
  XA_STPN=1
  YTOTWACT :=ARRAy(kind)
  for  x8_loop1=1  to  kind
       YTOTWACT[x8_loop1]=0
  next
  DO WHILE  lagno1=XNSCANO .AND. .NOT. EOF()
    X_STORTIME=LUTIME
    X_MIXSEC=MIX_SEC
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    IF PNT_REMAIN=1
      CAL_W2(XA_STPN,@A_PRESS_N0,L_PRESS,@YTOTWACT)
    ELSE
      CAL_W20(XA_STPN,@A_PRESS_N0,L_PRESS,@YTOTWACT)
    ENDIF
    pnt_produce(XA_STPN,X_STORTIME,X_MIXSEC,A_PRESS_N0,0)
    IF PNT_REMAIN=1
      pnt_remains(l_press,xa_stpn,A_PRESS_N0,0,0,YTOTWACT)
      xmixtm=tm16
      Pnt_MixTime(PNT_MIXT,PMIXT_PLUS,xMIXTM,0,0)
    else
      pnt_LASTW(l_press,xa_stpn,A_PRESS_N0,0,0,YTOTWACT)
    endif
    *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    XA_STPN=XA_STPN+1
    SKIP
  ENDDO
  L_PRESS=2
  SET DEVI TO SCRE
  SELE 9
  SET CONS ON
ENDIF


IF   ((VAL(C_PRT_REP) =77) .AND. (COM_E=1) )
  SELE 9
  IF (EOF()   .OR.  BOF() )
       RETU
  ENDIF
  X=PNT_OK2()
  IF X=0
     RETU
  ENDIF


  &&¨®¸¹	    ACARNO
  &&ªÅ­«	    ACARW
  &&°t¤ñNO	    ARATNO
  &&¦Ì¼Æ	    AVUSE
  &&§~«×	    ATANDO
  &&«È¤áNO	    AUS2
  &&DRIVER NAME     ACARDRV
  &&²Ö­p¦Ì¼Æ	    AUS3=XU
  &&²Ö­p¨®¦¸	    ATOT_CAR
  &&«È¤á¦WºÙ	    AUS2_1
  &&°e³f¦a§}	    AUS2_2
  _TOT_D_A[20,4]=1
  X=_TOT_D_A[20,4] +2
  _TOT_D_A[1,X] :=LUDATE
  *IF  C_MINK=0
  *  _TOT_D_A[1,X] :=XDATE
  *ELSE
  *  _TOT_D_A[1,X] := SUBSTR(STR(YEAR(_TOT_D_A[1,X])-1911,4,0),3,2)  +"   "+ SUBSTR(DTOC(_TOT_D_A[1,X]),1,2)+"   " +SUBSTR(DTOC(_TOT_D_A[1,X]),4,2)
  *ENDIF


  _TOT_D_A[2,X] :=SCANO
  _TOT_D_A[16,X] :=US2
  _TOT_D_A[3,X]  :=" "
  IF EMPTY(_TOT_D_A[16,X]) =.F.
    SELE 11
    LOCA  FOR  alltrim(P1501)==alltrim( _TOT_D_A[16,X])
    IF EOF()=.F.
      _TOT_D_A[3,X]  :=P1502
    ENDIF
    SELE 9
  ENDIF
  _TOT_D_A[4,X]  :=P1702
  _TOT_D_A[7,X]  :=TOTW
  _TOT_D_A[13,X] :=CARNO
  _TOT_D_A[6,X]  :=0

  IF EMPTY(_TOT_D_A[13,X]) =.F.
    SELE 10
    LOCA  FOR  (alltrim(P12100)== ALLTRIM(_TOT_D_A[13,X]))  .OR. (alltrim(P12101)== ALLTRIM(_TOT_D_A[13,X]))
    IF EOF()=.F.
      _TOT_D_A[6,X]  :=P12103
    ENDIF
    SELE 9
  ENDIF
  xtotw=0
  for  xloop=1	to  gs_tot+uwc_tot
     icx=alltrim(str(xloop,2,0))
     xtotw=xtotw +totm&icx
  next
  _TOT_D_A[7,X]  :=xTOTW
  _TOT_D_A[5,X]  :=_TOT_D_A[7,X] + _TOT_D_A[6,X]
  _TOT_D_A[8,X]  :=LUTIME
  _TOT_D_A[9,X]  :=CARLAG
  _TOT_D_A[10,X] :=TOTVUSE
  _TOT_D_A[11,X] :=LAGTTW
  _TOT_D_A[12,X] :=0
  _TOT_D_A[17,X] :=0
  _TOT_D_A[18,X] :=RATNO
  IF EMPTY(_TOT_D_A[18,X]) =.F.
    SELE 2
    LOCA  FOR  alltrim(RATNO)==alltrim( _TOT_D_A[18,X])
    IF EOF()=.F.
      _TOT_D_A[12,X]  :=S_STRO
      _TOT_D_A[17,X] :=S_MAX
    ENDIF
    SELE 9
  ENDIF
  _TOT_D_A[14,X] :=TANDO
  _TOT_D_A[15,X] :=CARDRV

    SET CONS On
    FSetToPrinter(bport)
    DO REP_&C_PRT_REP
    *FSetToPrinter(aport)
    SET DEVI TO SCRE
ENDIF
  _TOT_D_A[20,3]=0
  _TOT_D_A[20,4]=0
RETU
**------------------------------------------------------------------------------------------------------------
&&-----------------------------------------------------------------------------
FUNCTION  NTOC
PARAMETERS   PN
PN=ALLTRIM(STR(PN,10,0))
RETU PN
&&-----------------------------------------------------------------------------
FUNCTION S_BCC
PARAMETERS  S_TXT
STN2=LEN(S_TXT)
BCN=0
FOR  STN1=1 TO	STN2
  TXB=ASC(SUBSTR(S_TXT,STN1,1))
  BCN=NXOR(BCN,TXB)
NEXT
BCC=CHR(BCN)
RETU  BCC
&&-----------------------------------------------------------------------------
FUNCTION COM_SEND
PARAMETERS S_COM,S_DATA
TBCC=S_BCC(S_DATA)
HEAD1=SA + VA +ENQ + STX + S_DATA + ETX  + TBCC +EOT
SIO_WRITE(S_COM,HEAD1)
RETU  TBCC

**-----------------------------------------------------------------------------
PROCEDURE  lu12_dsp1
PARAMETERS  P1,P2,P3
DO    GET_PZER
  IF ERROR_LINK=0
    ERROR_LINK=SIO_IOCTL(0,10,3)
    IF ERROR_LINK=0
      ERROR_LINK=SIO_OPEN(0)
    ENDIF
  ENDIF
   STORAB_D=1
   do	setdata1
retu
**-----------------------------------------------------------------------------
PROCEDURE  SETDATA1
PARAMETERS  P1,P2,P3
 Y=1
 FOR I=1  TO  KLCHN  +KUCHN
   xz=(((PZER[I]/A_M_NAME[I,6])*PER*2048)+2048)
   SETZER(I-1,xz)	 && 2015.9.31
 NEXT
retu
**-----------------------------------------------------------------------------
PROCEDURE  MDYSPATM
PARAMETERS  P1,P2,P3
SPAN1=SPACMIXTM[1,1]
SPAN2=SPACMIXTM[2,1]
set  curs on
SET  COLO TO  W+ /&C1,b/w+
@ 13,48  GET  SPAN1  PICT  "99"
@ 14,48  GET  SPAN2  PICT  "99"
READ
SELE 5
GOTO 54
REPL  PA1  WITH  SPAN1,PA2 WITH SPAN2
SPACMIXTM[1,1]=PA1
SPACMIXTM[2,1]=PA2
SET  COLO TO  W+ /&C1
@ 13,48  SAY  SPAN1  PICT  "99"
@ 14,48  SAY  SPAN2  PICT  "99"
SET  COLO TO &C2 /&C1
set  curs off
retu
&&-----------------------------------------------------------------------------
**-----------------------------------------------------------------------------
&& PROCEDURE  D_STRO
&& PARAMETERS  P1,P2,P3
&& *_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
&& ARR1 :={" °t¤ñ¥N¸¹  "," ±j «×     ","§~«×","²É®Æ "," ³Æ   µù                        "}
&& ARR2 :={"RATNO","S_STRO","S_TANDO","S_MAX","DETAIL"}
&& ARR3 :={"!!!!!!!!!","!!!!!!!!!","999","!!!!","##############################"}
&& ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,0}
&& RET_X1=SPACE(4)
&& xd_wno=fSelectNo()
&& sele 2
&& goto top
&& if  BOF()
&&   APPE BLANK
&& ENDIF
&& n_rec=recno()
&& STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
&& P_FUNC2=""
&& ARR_PCS={" "," "," "," "," "," "," "," "," "," "," "," "}
&& _GET_BROW(19,3,4,5,ARR1,ARR2,ARR3,"_DMAKE1","2","Y",.T.,.F.)
&& STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
&& SET COLOR TO &C7 +/ &C1
&& sele &xd_wno
&& retu
**-----------------------------------------------------------------------------
PROCEDURE  PLOT_MIXAS
PARAMETERS  P1,P2,P3
@ 13,38  CLEA  TO  19,79
*ISPBOX(PLOT_PN[1],PLOT_PN[2],PLOT_PN[3],PLOT_PN[4],1,"B/BL")
SET COLOR TO gr+ / bl
*BOX_S(PLOT_PN[1],PLOT_PN[2],PLOT_PN[3],PLOT_PN[4])
LBOX(PLOT_PN[1],PLOT_PN[2],PLOT_PN[3],PLOT_PN[4],0,65535)
*LINE(PLOT_PN[1],PLOT_PN[4] -10,PLOT_PN[3],PLOT_PN[4]-10,2)
LINE(PLOT_PN[1],PLOT_PN[2] +10,PLOT_PN[3],PLOT_PN[2]+10,3)
X=(PLOT_PN[4]- PLOT_PN[2]) /(PLOT_PN[6] -PLOT_PN[5])
X1=PMIXA- PLOT_PN[5]
Y=PLOT_PN[4] - (X * X1)
SET COLOR TO r+ / bl
*LINE(PLOT_PN[1],Y,PLOT_PN[3],Y,14)
*LINE(PLOT_PN[1],Y-1,PLOT_PN[3],Y-1,14)
SET COLOR TO &C7 +/ &C1
BMX= INT(BMP_PN[3,2] - (PMIXA	* BMP_PN[4,2] ))
LINE(PLOT_PN[1],BMX   ,PLOT_PN[3],BMX,14)
@ INT((PLOT_PN[2] +10)/19)+1,PLOT_PN[1]/8 -3 SAY   PLOT_PN[6] PICT "999"
@ INT(BMX/19)+1,PLOT_PN[1]/8 -3 SAY   PMIXA PICT "999"
BMP_PN[1,1] :=PLOT_PN[1]
BMP_PN[1,2] := INT(BMP_PN[3,2] -  (BMP_PN[4,2]	* MIXAMP)  )
BMP_PN[2,1] :=0
BMP_PN[2,2] :=0
BMP_SN[1] :=0
BMP_SN[2] :=SECONDS()
PLOT_ACT=1
retu
**-----------------------------------------------------------------------------
PROCEDURE  PLOT_MIXA
PARAMETERS  P1,P2,P3
BMP_SN[1] :=MOD(BMP_SN[1] +1,2)
BMP_PN[BMP_SN[1]+1,1] := INT(BMP_PN[3,1] + ((SECONDS() - BMP_SN[2] )  * BMP_PN[4,1]  ))
BCX=15
IF MIXAMP > PLOT_PN[6]
  BCX=12
  BMP_PN[BMP_SN[1]+1,2] := INT(PLOT_PN[2] +10	- ((MIXAMP -PLOT_PN[6]	)  * BMP_PN[5,2] ))
ELSE
  IF MIXAMP <= PMIXA
    BCX=11
  ENDIF
  BMP_PN[BMP_SN[1]+1,2] := INT(BMP_PN[3,2] - (MIXAMP   * BMP_PN[4,2] ))
ENDIF
LINE(BMP_PN[1,1],BMP_PN[1,2],BMP_PN[2,1],BMP_PN[2,2],BCX)

retu
**-----------------------------------------------------------------------------
PROCEDURE  TANK_DSP
PARAMETERS  P1,P2,P3
SET COLOR TO &C2 / &C1
@ 13,38  CLEA  TO  20,79
if (lchtype=21)  .OR.	(UCHTYPE=99)
  @ 13,51			      SAY "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{"
else
 *@ 13,47			  SAY "¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{"
endif
@ 14,45 		      SAY "      ²V¦X   ²V¦X   ¶}ªù   §t¤ô ¢x"
@ 15,23 SAY "¢z¢w¢w¢{¢z¢w¢w¢{¢x          ®É¶¡   ¹q¬y   ®É¶¡   ­×¥¿ ¢x"
@ 16,23 SAY "¢x°_°Ê¢x¢x¤¤¤î¢x¢x  ³]©w­È                            ¢x"
@ 17,23 SAY "¢u¢w¢w¢t¢u¢w¢w¢t¢x  ¹ê»Ú­È     ¬í     ¢Ï     ¬í     KG¢x"
@ 18,23 SAY "¢|¢w¢w¢}¢|¢w¢w¢} úLúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúPúO "
IF MODI_PAGE=.T.
  @ 19,0 SAY "¡ü                                                                            ¡ü"
  @ 20,0 SAY "¡ü                                                                            ¡ü"
ENDIF
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
  SET COLOR TO w+  / &C1
  *@ 20,52 SAY "¤¤¤î"
  @ 16,33 SAY "¤¤¤î"
  SET COLOR TO &C7 +/ &C1
endif
@ 16,51 SAY  PMIXTM PICT "999"
@ 16,58 SAY  PMIXA  PICT "999"
@ 16,65 SAY  PMIXOP PICT "99"
PLOT_ACT=0
retu
PROCEDURE  SetFeedZero
PARAMETERS  P1,P2,P3
SET COLOR TO &C2 / &C1
retu
**-----------------------------------------------------------------------------
PROCEDURE  CHGDBF0X
PARAMETERS  P1,P2,P3
SET COLOR TO W+  / BL
@ 12,30  CLEA  TO  19,70
BOX_S(12,30,19,70)
@ 13,35 SAY " <<< ±K½X§ó§ï >>>"
SX0="      "
@ 14,35 SAY "     ¿é¤JÂÂ±K½X: "  GET SX0
READ
IF ALLTRIM(SX0)=DBF0SX
  SX0="      "
  @ 16,35 SAY "     ¿é¤J·s±K½X: "  GET SX0
  READ
  IF EMPTY(ALLTRIM(SX0))=.F.
    SX1="      "
    @ 17,35 SAY "½T»{ ¿é¤J·s±K½X: "  GET SX1
    READ
    IF SX0=SX1
      @ 18,35 SAY " <<< ±K½X§ó§ï OK >>>"
      SX0=ALLTRIM(SX0)
      SELE 5
      USE
      USE  PAR1
      GOTO 15
      REPL  PA17 WITH  SX0
      COMMIT
      USE
      USE PAR
      DBF0SX=SX0
      INKEY(3)
    ENDIF
  ENDIF
ENDIF
SET COLOR TO &C7 +/ &C1
CLEA
DO  LU12_DSP
retu
&&-----------------------------------------------------------------------------
PROCEDURE  GET_SECRE
PARAMETERS  P1,P2,P3
T=0
T=SER_OK_BOSS()
IF T=1
  _MODI  ="Y"
  SECR[2] := 1
  T=0
ENDIF
retu
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  CHK_LASTOUT
RET_OK=0
FOR CKX=1   TO	GS_TOT
  IF WTANK_F[CKX,2] <> 1
     RET_OK =RET_OK +1
  ENDIF
NEXT
retu  RET_OK






**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*FUNCTION   ADJBDATA
*PARAMETERS  P1
*DISCPER=0
*DO CASE
*CASE P1=13  &&ADJ G1-S1
*  @ 5,A_M_NAME[3,13]	 SAY "V"
*  NREAD(5,A_M_NAME[1,13],STR(DISCPER,4,1),4,"")
*  @ 5,A_M_NAME[1,13]	 SAY "    "
*  @ 5,A_M_NAME[3,13]	 SAY " "
*  DISCPER=VAL(XPX)
*  IF DISCPER >5
*    DISCPER=0
*  ENDIF
*  MODIBDATA("M1","M3",1,3,DISCPER)
*CASE P1=14  &&ADJ G1-S1
*  @ 5,A_M_NAME[4,13]	 SAY "V"
*  NREAD(5,A_M_NAME[1,13],STR(DISCPER,4,1),4,"")
*  @ 5,A_M_NAME[1,13]	 SAY "    "
*  @ 5,A_M_NAME[4,13]	 SAY " "
*  DISCPER=VAL(XPX)
*  IF DISCPER >5
*    DISCPER=0
*  ENDIF
*  MODIBDATA("M1","M4",1,4,DISCPER)
*CASE P1=23  &&ADJ G1-S1
*  @ 5,A_M_NAME[3,13]	 SAY "V"
*  NREAD(5,A_M_NAME[2,13],STR(DISCPER,4,1),4,"")
*  @ 5,A_M_NAME[2,13]	 SAY "    "
*  @ 5,A_M_NAME[3,13]	 SAY " "
*  DISCPER=VAL(XPX)
*  IF DISCPER >5
*    DISCPER=0
*  ENDIF
*  MODIBDATA("M2","M3",2,3,DISCPER)
*CASE P1=24  &&ADJ G1-S1
*  @ 5,A_M_NAME[4,13]	 SAY "V"
*  NREAD(5,A_M_NAME[2,13],STR(DISCPER,4,1),4,"")
**  @ 5,A_M_NAME[2,13]	  SAY "    "
**  @ 5,A_M_NAME[4,13]	  SAY " "
**  DISCPER=VAL(XPX)
**  IF DISCPER >5
**    DISCPER=0
**  ENDIF
**  MODIBDATA("M2","M4",2,4,DISCPER)
*ENDCASE
*retu
**-----------------------------------------------------------------------------------------
*FUNCTION   MODIBDATA
*PARAMETERS  P1,P2,NX1,NX2,XPER
*IF (STAR=1)   .AND.  (XPER  <> 0)
*  BDRATNO=A_PRESS_N0[2,21,1,2]
*  IF (W0_EN=1).AND.(BDRATNO>0)
*    SELE 17
*    LOCA  FOR RATNO=BDRATNO
*    IF .NOT. EOF()
*      BDDISN=&P1 * XPER /100
*      REPL  &P1  WITH	(&P1 + BDDISN),&P2 WITH (&P2 -BDDISN)
*      COMMIT
*      FOR XREP=1  TO  20
*	IF  (A_PRESS_N0[2,XREP,1,5] >0)
*	     IF (A_PRESS_N0[2,XREP,NX1,7]=0)
*	       IF (A_PRESS_N0[2,XREP,NX1,1] >0) .AND. (A_PRESS_N0[2,XREP,NX2,1] >0)
*		 BDDISN= A_PRESS_N0[2,XREP,NX1,1]  * XPER /100
*		 A_PRESS_N0[2,XREP,NX1,1] =  A_PRESS_N0[2,XREP,NX1,1] + BDDISN
*		 A_PRESS_N0[2,XREP,NX2,1] =  A_PRESS_N0[2,XREP,NX2,1] - BDDISN
*	       ELSE
*		 EXIT
*	       ENDIF
*	     ENDIF
*	ELSE
*	  EXIT
*	ENDIF
*      NEXT
*      IF (A_PRESS_N0[1,21,1,2]=BDRATNO)
*	  FOR XREP=1  TO  20
*	   IF  (A_PRESS_N0[1,XREP,1,5] >0)
*		IF (A_PRESS_N0[1,XREP,NX1,7]=0)
*		  IF (A_PRESS_N0[1,XREP,NX1,1] >0) .AND. (A_PRESS_N0[1,XREP,NX2,1] >0)
*		    BDDISN= A_PRESS_N0[1,XREP,NX1,1]  * XPER /100
*		    A_PRESS_N0[1,XREP,NX1,1] =	A_PRESS_N0[1,XREP,NX1,1] + BDDISN
*		    A_PRESS_N0[1,XREP,NX2,1] =	A_PRESS_N0[1,XREP,NX2,1] - BDDISN
*		  ELSE
*		    EXIT
*		  ENDIF
*	      ENDIF
**	    ELSE
**	      EXIT
**	    ENDIF
**	   NEXT
**	ENDIF
**    ENDIF
**  ENDIF
*ENDIF
*RETU
**-----------------------------------------------------------------------------
* PROCEDURE  ADJWA0
* PARAMETERS  P1,P2,P3
* IF WATER_INPUT=1
*      *FOR XLOOP5=1  TO  20
*	 IF  INT(A_PRESS_N0[3,STPN&ic_x,1,5]) >0
*	   XPN=0
*	   XP1=INT(A_PRESS_N0[3,STPN&ic_x,1,8]	*  G1_WATER)/100
*	   XP2=INT(A_PRESS_N0[3,STPN&ic_x,2,8]	*  G2_WATER)/100
*	   XP3=INT(A_PRESS_N0[3,STPN&ic_x,3,8]	*  S1_WATER)/100
*	   XP4=INT(A_PRESS_N0[3,STPN&ic_x,4,8]	*  S2_WATER)/100
*	   DO CASE
*	   CASE LCHTYPE=16 .or.   (LCHTYPE=17)
*	     XP5=INT(A_PRESS_N0[3,STPN&ic_x,10,8])
*	     XP6=INT(A_PRESS_N0[3,STPN&ic_x,11,8] )
*	     XP7=INT(A_PRESS_N0[3,STPN&ic_x,12,8])
*	   OTHERWISE
*	     XP5=0
*	     XP6=0
*	     XP7=0
*	   ENDCASE
*	   A_PRESS_N0[3,STPN&ic_x,1,2] =  XP1
*	   A_PRESS_N0[3,STPN&ic_x,2,2] =  XP2
*	   A_PRESS_N0[3,STPN&ic_x,3,2] =  XP3
*	   A_PRESS_N0[3,STPN&ic_x,4,2] =  XP4
*	   xtmpmw=xp1+XP2+XP3+XP4 +XP5 +XP6 +XP7
*	   xtmpw=A_PRESS_N0[3,STPN&ic_x,5,8] +A_PRESS_N0[3,STPN&ic_x,6,8]
*	   IF  XTMPW  > 0
*	     ADJWN=-A_PRESS_N0[3,STPN&ic_x,5,8]  * XTMPMW /XTMPW
*	     A_PRESS_N0[3,STPN&ic_x,5,2] = ADJWN
*	     ADJWN=-A_PRESS_N0[3,STPN&ic_x,6,8]  * XTMPMW /XTMPW
*	     A_PRESS_N0[3,STPN&ic_x,6,2] = ADJWN
*	   ENDIF
*	  ELSE
*	    RETU
*	  ENDIF
*      *NEXT
* ENDIF
* RETU
**------------------------------------------------------------------------------------------------------------
PROCEDURE  ADJWAB0
PARAMETERS  P1,P2,P3
IF WATER_INPUT=1
     *FOR XLOOP5=1  TO	20
       IF  INT(A_PRESS_B0[3,STPN&ic_x,1,5]) >0
	 XPN=0
	 XP1=INT(A_PRESS_B0[3,STPN&ic_x,1,1]  *  G1_WATER)/100
	 XP2=INT(A_PRESS_B0[3,STPN&ic_x,2,1]  *  G2_WATER)/100
	 XP3=INT(A_PRESS_B0[3,STPN&ic_x,3,1]  *  S1_WATER)/100
	 XP4=INT(A_PRESS_B0[3,STPN&ic_x,4,1]  *  S2_WATER)/100
	 DO CASE
	 CASE LCHTYPE=16   .or.   (LCHTYPE=17)
	   XP5=INT(A_PRESS_B0[3,STPN&ic_x,10,1])
	   XP6=INT(A_PRESS_B0[3,STPN&ic_x,11,1] )
	   XP7=INT(A_PRESS_B0[3,STPN&ic_x,12,1])
	 OTHERWISE
	   XP5=0
	   XP6=0
	   XP7=0
	 ENDCASE
	 A_PRESS_B0[3,STPN&ic_x,1,2] =	XP1
	 A_PRESS_B0[3,STPN&ic_x,2,2] =	XP2
	 A_PRESS_B0[3,STPN&ic_x,3,2] =	XP3
	 A_PRESS_B0[3,STPN&ic_x,4,2] =	XP4
	 xtmpmw=xp1+XP2+XP3+XP4 +XP5 +XP6 +XP7
	 xtmpw=A_PRESS_B0[3,STPN&ic_x,5,1] +A_PRESS_B0[3,STPN&ic_x,6,1]
	 IF  XTMPW  > 0
	   ADJWN=-A_PRESS_B0[3,STPN&ic_x,5,1]  * XTMPMW /XTMPW
	   A_PRESS_B0[3,STPN&ic_x,5,2] = ADJWN
	   ADJWN=-A_PRESS_B0[3,STPN&ic_x,6,1]  * XTMPMW /XTMPW
	   A_PRESS_B0[3,STPN&ic_x,6,2] = ADJWN
	 ENDIF
	ELSE
	  RETU
	ENDIF
     *NEXT
ENDIF
RETU
**------------------------------------------------------------------------------------------------------------
PROCEDURE  PRINTERTST
PARAMETERS  P1,P2,P3
PRINTERTST=0
*if lchtype=16	 .or.	(LCHTYPE=17)
  x= RDLPT(val(P1)-1)
  IF (x =144)  .or. (x=pnt_redy_code)
     PRINTERTST=1
  ENDIF
  if val(p1)=1
    if isprinter()=.f.
     PRINTERTST=0
    endif
  endif
*else
*  IF RDLPT(val(P1)-1) >=128
*     PRINTERTST=1
*  ENDIF
*endif
RETU
**-----------------------------------------------------------------------------
FUNCTION  DspSetData
PARAMETERS  _DSP_NOR
IF   _DSP_NOR=1
   P1=1
ELSE  &&=0
   P1=8
ENDIF
SET COLOR TO &C7 +/ &C1
if (star=1)  .and.  (L_PRESS >0)
  FOR XN=1 TO (GS_TOT +UWC_TOT)
    *DSP_RECIP(xn,0)
    STP_FC=alltrim(str(XN,2,0))
    XMC_F=A_M_NAME[xn,3]
    if p1=8
      xadj=11
    else
      xadj=2
    endif
    *@	4,A_M_NAME[XN,13]  SAY	A_PRESS_N0[L_PRESS,STPN&STP_FC,XN,P1] + A_PRESS_N0[L_PRESS,STPN&STP_FC,XN,xadj]  PICT "&XMC_F"
    @  A_M_NAME[xn,23] ,A_M_NAME[xn,13]  SAY  A_PRESS_N0[L_PRESS,STPN&STP_FC,XN,P1] + A_PRESS_N0[L_PRESS,STPN&STP_FC,XN,xadj]  PICT "&XMC_F"
  NEXT
ENDIF
retu
**---------------------------------------
FUNCTION  Set_Temp_cal
PARAMETERS  index,Xfunc,datas
d_retu=0
   do  case
   case Xfunc=0
       temp_cal[1,index] :=0
       temp_cal[2,index] :=seconds()
       temp_cal[3,index] :=0
   case Xfunc=1
     x=seconds()-temp_cal[2,index]
     if (x <0)
       x=86399 +x
     endif
     if x< temp_cal[1,index]
       d_retu=datas  *x/  temp_cal[1,index]
     else
       d_retu=datas
       temp_cal[3,index] :=1
     endif
   endcase
retu d_retu

**-----------------------------------------------------------------------------
FUNCTION  SetDigitOut
PARAMETERS  doport,doch,out   &&(1-2,0-15,0-1 )
chn=digitout[doport,doch+1]    &&  0-15=do1; 16-31=do2
if (chn >= 0)
  if (chn >=16)
     chn=chn-16
     dout2(chn,out)
  else
     dout(chn,out)
  endif
endif
retu
**-----------------------------------------------------------------------------
FUNCTION  ReadDigitOut
PARAMETERS  doport,doch
retux=0
chn=digitout[doport,doch+1]
if (chn >= 0)
  if (chn >=16)
     chn=chn-16
     retux=rd_do2(chn)
  else
     retux=rd_do1(chn)
  endif
endif
retu  retux
**-----------------------------------------------------------------------------
PROCEDURE  GET_PZER  &&¶i®ÆZERO  POINT
PARAMETERS  P1,P2,P3
   GOTO 2
   INDEX1=1
   FOR I=1 TO KLCHN +KUCHN
     IX_C=ALLTRIM(STR(I,2,0))
     PZER[I] := PA&IX_C
   NEXT
RETU
**-----------------------------------------------------------------------------
PROCEDURE  RATENB
PARAMETERS  xwaste,P2,P3
c_top2=""
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*ARR1 :={"NO. ","¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±"," Á`­« ²M¤ô","¦B¤ô","¤ôªd1","¤ôªd2","¤ôªd3","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK	 01234567890123456789012345678901234567890123456789012345678901234567890123456789
ARRTIT0="                                              ¤ôªd ¤ôªd¤ôªd¤ôªd ÃÄ¾¯  ÃÄ¾¯ ÃÄ¾¯ "
ARRTIT1="  NO. ¥Û¢° ¥Û¢± ¬â¢° ¬â¢± ¥Û¢² Á`­«  ¤ô1 ¤ô2   ¢°   ¢±¡@¢²  ¢³¡@ ¢°    ¢±   ¢²  "
ARR1 :=ARRAY(kind+4)
ARR2 :=ARRAY(kind+4)
ARR3 :=ARRAY(kind+4)
ARR4 :=ARRAY(kind+4)
ARRWID :={0,5,10,15,20,25,35,40,45,50,54,58,63,69,75,79}
IF LCHTYPE=77
   ARRTIT0=""
   ARRTIT1=""
   ARRWID [2]=0
ENDIF
ARR1[1]="°t¤ñNO."
*ARR1[2]="  ±j «×  "
*ARR1[3]="©Õ¦X®É¶¡"
ARR1[2]=" Á`­« "
XN_TITL=0
KIND_S=2
FOR I=1 TO gs_tot +uwc_tot
    ARR1[I+KIND_S] :=A_M_NAME[I,17]
    IF EMPTY(A_M_NAME[I,17]) <> .T.
      XN_TITL=XN_TITL+1
    ENDIF
    IF (LEN(ARR1[I+KIND_S]) < LEN(A_M_NAME[I,3]) )
	 ARR1[I+KIND_S]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+KIND_S]))+ARR1[I+KIND_S]
    ENDIF
NEXT
ARR2 :={"RATNO","0","M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11","M12","M13","M14","M15","M16"}
*ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","999","999","999","999","999","99.99","99.99","99.99"}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2,2}
ARR3[1]="!!!!!!!"
*ARR3[2]="!!!!!!!!!!"
*ARR3[3]="999"
ARR3[2]="9999"
ARR4[1]=0
ARR4[2]=0
ARR4[3]=0
ARR4[4]=0
FOR I=1 TO  gs_tot +uwc_tot
  ARR3[I+KIND_S] :=A_M_NAME[I,3]
  if (mod(val(ARR3[I+KIND_S]),1)>0 )
      ARR4[I+KIND_S]=2
  ELSE
      ARR4[I+KIND_S]=0
  ENDIF
NEXT
TW_DSPX=2
FOR I=1  TO  GS_TOT +1
  TW_DSPX=TW_DSPX + 1 + LEN(ARR1[I])
NEXT
ARR_PCS :={"dSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW","DSPV_TOTW" }
RET_X1=SPACE(4)
C_TOP1="F7-¦C¦L F8-¦C¦L¥»µ§ "
F7_FUNC="PNT_RATEN"
C_TOP2=""
F8_FUNC="PNT_RATEN"
if SECR[2]=1
  F3_FUNC="GET_SECRE"
C_TOP1="F7-¦C¦L F8-¦C¦L¥»µ§ F3-"
ENDIF
F1_FUNC=" "
F10_FUNC=" "
xd_wno=fSelectNo()
sele 2
goto top
if  BOF()
  APPE BLANK
  ENDIF
n_rec=recno()
*DO RST_FUNC
P_FUNC0="dspV_totw"
DLA_DSP=0
IF  STAR=0
  IF SECR[2]=0
    *_GET_BROW(4,0,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
    _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
  ELSE
    *_GET_BROW(4,0,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
     _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
    *_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+2,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",0)
  ENDIF
ELSE
  DLA_DSP=1
  IF SECR[2]=0
    *_GET_BROW(14,0,8,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","Y",.T.,.T.)
    _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
  ELSE
    *_GET_BROW(14,0,8,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
     _GET_VBROW(3,0,8,XN_TITL+KIND_S,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
  ENDIF
ENDIF
DLA_DSP=1
DO RST_FUNC


sele &xd_wno
SET COLOR TO &C7 +/ &C1
retu
&&-----------------------------------------------------------------------------
PROCEDURE  DSP3
PARAMETERS  RECNO_MDY,C_TOP2,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*C_TOP2="¸¨®t­×¥¿"
*ARR1 :={"¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±","²M¤ô","¦B¤ô","¤ôªd1","¤ôªd2","¤ôªd3","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
ARR1 :=ARRAY(16)
ARR2 :=ARRAY(kind+1)
ARR3 :=ARRAY(kind+1)
ARR4 :=ARRAY(kind+1)
XN_TITL=0
SELE 5
USE
USE PAR1
XN_TITL=0
FOR I=1 TO kind
  IX_C=ALLTRIM(STR(I,2,0))
  IS_LAST=0
    XN_TITL=XN_TITL+1
    GOTO 16
    ARR1[I] :=RTRIM(PA&IX_C)
    ARR2[I] :="PA" + IX_C
    GOTO 17
    ARR3[I] :=ALLTRIM(PA&IX_C)
NEXT
SELE 5
USE
USE PAR
*ARR1 :={"S1","S2","G1","G2","¤ôªd¢°","¤ôªd¢±¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
*ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,2,2}
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,3]) <> .T.
    XX_DE:=A_M_NAME[I,3]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I] :=0
    ELSE
      ARR4[I] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto RECNO_MDY
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
*DO RST_FUNC
P_FUNC0=" "
DLA_DSP=1
stor  1  to  fist_rec,last_rec
&& _GET_BROW(20,2,1,gs_tot+uwc_tot,ARR1,ARR2,ARR3,"_DMAKE1","5","1",.F.,.F.)
   &&_GET_BROW(20,2,1,gs_tot+uwc_tot,ARR1,ARR2,ARR3,"_DMAKE1","5","P",.F.,.F.)  && DON'T PRESS UP/DN KEY TO ENTER MODI FUNTION
   _GET_BROW(20,2,1,gs_tot+uwc_tot,ARR1,ARR2,ARR3,"_DMAKE1","5","1",.F.,.F.)  && DON'T PRESS UP/DN KEY TO ENTER MODI FUNTION
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
COMMIT
retu
**-----------------------------------------------------------------------------
PROCEDURE  DSP1
PARAMETERS  RECNO_MDY,C_TOP2,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*C_TOP2="¹sÂI­×¥¿"
ARR1 :={"¥Û123 ","¬â¢°¢±","²M,¦B¤ô","¤ôªd¢°","¤ôªd¢±¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*ppp
*ARR2 :={"PA1","PA4","PA6","PA8","PA9","PA11","PA12"}
*ARR3 :={"9999","9999","9999","9999","9999","999.99","999.99",}
*ARR4 :={0,0,0,0,0,2,2}

ARR1 :=ARRAY(16)
ARR2 :=ARRAY(kind+1)
ARR3 :=ARRAY(kind+1)
ARR4 :=ARRAY(kind+1)
XN_TITL=0
SELE 5
USE
USE PAR1
XN_TITL=0

&&  mdy f6¹sÂI¦s¨ú¦ì¸m­×¥¿
INDEX1=1
FOR I=1 TO KLCHN +KUCHN
  && IX_C=ALLTRIM(STR(INDEX1,2,0))
  IX_C=ALLTRIM(STR(I,2,0))
  ARR2[I] :="PA" + IX_C
  && INDEX1=WSCALE_type[I] +INDEX1
NEXT


FOR I=1 TO kind
  IX_C=ALLTRIM(STR(I,2,0))
  IS_LAST=0
  DO CASE
  CASE	I<kind
    IF (A_M_NAME[I,8]<>A_M_NAME[I+1,8] )
      IS_LAST=1
    ENDIF
  OTHERWISE
      IS_LAST=1
  ENDCASE
  IF IS_LAST=1
    XN_TITL=XN_TITL+1
    GOTO 16
    ARR1[XN_TITL] :=RTRIM(PA&IX_C)
    &&ARR2[XN_TITL] :="PA" + IX_C
    GOTO 17
    ARR3[XN_TITL] :=ALLTRIM(PA&IX_C)
  ENDIF
NEXT
SELE 5
USE
USE PAR
*ARR1 :={"S1","S2","G1","G2","¤ôªd¢°","¤ôªd¢±¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
*ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,2,2}
FOR I=1 TO XN_TITL
  IF EMPTY(ARR3[I]) <> .T.
    XX_DE:=ARR3[I]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I] :=0
    ELSE
      ARR4[I] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO RECNO_MDY
n_rec=recno()
*DO RST_FUNC
P_FUNC0=" "
DLA_DSP=1
stor  2  to  fist_rec,last_rec
_GET_BROW(20,3,1,klchn+kuchn,ARR1,ARR2,ARR3,"_DMAKE1","5","P",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
COMMIT
retu
**-----------------------------------------------------------------------------
PROCEDURE  W_IN   && §t¤ô²v ADJ.
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2="§t¤ô²v­×¥¿ ¢H"
*ARR1 :={"¥Û¢° ","¥Û¢± ","¬â¢° ","¬â¢± "}
ARR1 :=ARRAY(kind)
ARR2 :=ARRAY(kind)
ARR3 :=ARRAY(kind)
ARR4 :=ARRAY(kind)
XN_TITL=GS_TOT
FOR I=1 TO GS_TOT
  ARR1[I] :=rtrim(A_M_NAME[I,1])
  IF (LEN(ARR1[I]) < LEN(A_M_NAME[I,3]) )
    ARR1[I]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I]))+ARR1[I]
  ENDIF
NEXT
*ARR2 :={"PA1","PA2","PA3","PA4"}
FOR I=1 TO GS_TOT
  T_C=ALLTRIM(STR(I,2,0))
  ARR2[I] :="PA" + T_C
NEXT
*ARR3 :={"99.9","99.9","99.9","99.9"}
FOR I=1 TO GS_TOT
  ARR3[I] :="99.9"
NEXT
*ARR4 :={1,1,1,1}
FOR I=1 TO GS_TOT
  ARR4[I] :=1
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
xrec=33
GOTO 33
if pa14=42
  GOTO 42
  xrec=42
endif
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=1
stor  xrec to  fist_rec,last_rec
*_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","K")
_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","P",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-----------------------------------------------------------------------------
PROCEDURE  DSP4
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" ¤p¤J®Æ "
*ARR1 :={"¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±"," ²M¤ô","¦B¤ô","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(17)
XN_TITL=0
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,1]) <> .T.
    XN_TITL=XN_TITL+1
  ENDIF
  ARR1[I] :=A_M_NAME[I,1]
  IF (LEN(ARR1[I]) < LEN(A_M_NAME[I,3]) )
    ARR1[I]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I]))+ARR1[I]
  ENDIF
NEXT
ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12","PA13","PA14"}
ARR3 :={"9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99","999.99",}
FOR I=1 TO kind
  ARR3[I] :=A_M_NAME[I,3]
NEXT
ARR4 :={0,0,0,0,0,0,0,0,0,0,0,2,2,2}
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,3]) <> .T.
    XX_DE:=A_M_NAME[I,3]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I] :=0
    ELSE
      ARR4[I] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 3
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
stor  3  to  fist_rec,last_rec
_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","K",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
sele 5
goto 3
ERKG1=PA1
ERKG2=PA2
ERKG3=PA3
ERKG4=PA4
ERKG5=PA5
ERKG6=PA6
ERKG7=PA7
ERKG8=PA8
ERKG9 =PA9
ERKG10=PA10
ERKG11=PA11
ERKG12=PA12
ERKG13=PA13
ERKG14=PA14
retu
**-----------------------------------------------------------------------------
PROCEDURE  SETPARN1
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
ARR1 :={"NO. ","PA1 ","PA2 ","PA3 ","PA4 ","PA5 ","PA6 ","PA7 ","PA8 ","PA9 ","PA10   ","PA11   ","PA12   "}
ARR2 :={"PARNO","PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
ARR3 :={"99","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX","XXXXXX"}
ARR4 :={0,0,0,0,0,0,0,0,0,0,2,2,2}
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
xd_wno=fSelectNo()
sele 5
SELE  PAR1
goto top
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
DO RST_FUNC
P_FUNC2="FIND_1102"
DLA_DSP=0
_GET_BROW(1,3,18,13,ARR1,ARR2,ARR3,"_DMAKE1","5","Y",.T.,.F.)
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
sele 5
SELE  PAR
sele &xd_wno
retu

PROCEDURE  DSPTT
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" ¤é´Á "," ¦Ì¼Æ ","  ¥Û¢°","  ¥Û¢±","  ¥Û¢²","  ¬â¢°","  ¬â¢±","  ²M¤ô","  ¦B¤ô","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)

ARR1[1]=" ¤é´Á "
ARR1[2]=" ¦Ì¼Æ "
FOR I=1 TO kind
  ARR1[I+2] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
NEXT
*ARR2 :={"LUDATE","TOTVUSE","TOTM1","TOTM2","TOTM3","TOTM4","TOTM5","TOTM6","TOTM7","TOTM8","TOTM9","TOTM10","TOTM11","TOTM12","TOTM13","TOTM14"}
*ARR3 :={"XXXXXXXXXX","999999.9","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999.99","99999.99","99999.99","99999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2}
ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)

ARR2[1]:="LUDATE"
ARR2[2]:="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="9999999.9"
ARR4[1]:=0
ARR4[2]:=0
FOR I=1 TO  gs_tot +uwc_tot
  CI=ALLTRIM(STR(I,2))
  ARR2[I+2] ="TOTM"  +CI
  if (mod(val(ARR3[I+1]),1)>0 )
      ARR3[I+2]="999999.99"
      ARR4[I+2] =2
  ELSE
      ARR3[I+2]="999999999"
      ARR4[I+2] =2
  ENDIF
NEXT

sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
XPLUSTIT=2
IF  EMPTY( ARR1[kind ])=.F.
  && XPLUSTIT=0
ENDIF

_DSP_VBROW(4,10,11,gs_tot+uwc_tot+XPLUSTIT ,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",0)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-------------------------------------------------------------------------------------------------------------------------------------------------------------------
**-------------------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTION   _REC_VDSP
PARAMETERS  YD_N
X=1
X_TTW=0
DO WHILE  X <=TIT_N
  R_CB=ARR_REC_NAME[X]
  T_CB=ARR_TYPE[X]
  IF  LSK=1  .AND.  X =2
    @ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[X]-1  SAY &R_CB   PICT "&T_CB"
  ELSE
    @ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[X]  SAY &R_CB	PICT "&T_CB"
  ENDIF
  A_PRINT[X,X_COL] := &R_CB
  X=X+1
ENDDO
  X_W=0
  FOR	XG=1  TO  GS_TOT+UWC_TOT
   c_xg=alltrim(str(xg,2,0))
   x_w=x_w +totm&c_xg
  next
  A_PRINT[TIT_N+1,X_COL] := x_w
  IF  EMPTY(ARR_PCS[1]) =.F.
    PCS_CF(YD_N,&R_CB,1,RECNO())
  ENDIF
RETU
&&-----------------------------------------------------------------------------
PROCEDURE  DSP_TOTWV
PARAMETERS  P1,P2,P3
c_color=SETCOLOr()
SET COLOR TO GR+ / BL
X_W=0
FOR   XG=1  TO	GS_TOT+UWC_TOT
 c_xg=alltrim(str(xg,2,0))
 x_w=x_w +totm&c_xg
next
&&@ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[1]+2  SAY  x_w  PICT "99999999"
@ YD_N-1+X,YL_N *(X_COL-1)+ARR_DSPN[1]-1  SAY  x_w  PICT "99999999.99"
SET COLOR TO &c_color
retu
&&-----------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  DSPTV
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" ¤é´Á "," °t¤ñ "," ¦Ì¼Æ ","  ¥Û¢°","  ¥Û¢±","  ¥Û¢²","  ¬â¢°","  ¬â¢±","  ²M¤ô","  ¦B¤ô","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(kind+4)
ARR2 :=ARRAY(kind+4)
ARR3 :=ARRAY(kind+4)
ARR4 :=ARRAY(kind+4)

ARR1[1]=" ¤é´Á "
ARR1[2]=" °t¤ñ "
ARR1[3]=" ¦Ì¼Æ "
FOR I=1 TO kind
  ARR1[I+3] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
NEXT
*ARR2 :={"LUDATE","RATNO","TOTVUSE","TOTM1","TOTM2","TOTM3","TOTM4","TOTM5","TOTM6","TOTM7","TOTM8","TOTM9","TOTM10","TOTM11","TOTM12","TOTM13","TOTM14"}
*ARR3 :={"XXXXXXXXXX","99999999","999999.9","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999.99","99999.99","99999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2}
ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
ARR2[1]:="LUDATE"
ARR2[2]:="RATNO"
ARR2[3]:="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="XXXXXXXXX"
ARR3[3]:="9999999.9"
ARR4[1]:=0
ARR4[2]:=0
ARR4[3]:=1
FOR I=1 TO  gs_tot +uwc_tot
  CI=ALLTRIM(STR(I,2))
  ARR2[I+3] ="TOTM"  +CI
  if (mod(val(A_M_NAME[I,3]),1)>0 )
      ARR3[I+3]="999999.99"
      ARR4[I+3] =2
  ELSE
      ARR3[I+3]="999999999"
      ARR4[I+3] =2
  ENDIF
NEXT



sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+3,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",0)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  DSPTTP
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" ¤é´Á "," ¦Ì¼Æ ","  ¥Û¢°","  ¥Û¢±","  ¥Û¢²","  ¬â¢°","  ¬â¢±","  ²M¤ô","  ¦B¤ô","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)
ARR1[1]=" ¤é´Á "
ARR1[2]=" ¦Ì¼Æ "
FOR I=1 TO kind
  ARR1[I+2] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
NEXT
*ARR2 :={"LUDATE","TOTVUSE","TOTM1","TOTM2","TOTM3","TOTM4","TOTM5","TOTM6","TOTM7","TOTM8","TOTM9","TOTM10","TOTM11","TOTM12","TOTM13","TOTM14"}
*ARR3 :={"XXXXXXXXXX","999999.9","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999999","99999.99","99999.99","99999.99","99999.99",}
*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2}
ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
ARR2[1]:="LUDATE"
ARR2[2]:="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="9999999.9"
ARR4[1]:=0
ARR4[2]:=0
FOR I=1 TO  gs_tot +uwc_tot
  CI=ALLTRIM(STR(I,2))
  ARR2[I+2] ="TOTM"  +CI
  if (mod(val(A_M_NAME[I,3]),1)>0 )
      ARR3[I+2]="999999.99"
      ARR4[I+2] =2
  ELSE
      ARR3[I+2]="999999999"
      ARR4[I+2] =2
  ENDIF
NEXT
sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+2,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",1)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-------------------------------------------------------------------------------------------------------------------------------------------------------------------
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  DSPTVP
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" "
*ARR1 :={" ¤é´Á "," °t¤ñ "," ¦Ì¼Æ ","  ¥Û¢°","  ¥Û¢±","  ¥Û¢²","  ¬â¢°","  ¬â¢±","  ²M¤ô","  ¦B¤ô","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)
ARR1[1]=" ¤é´Á "
ARR1[2]=" °t¤ñ "
ARR1[3]=" ¦Ì¼Æ "
ARR2[1] :="LUDATE"
ARR2[2] :="RATNO"
ARR2[3] :="TOTVUSE"
ARR3[1]:="XXXXXXXXXX"
ARR3[2]:="XXXXXXXXX"
ARR3[3]:="999999.9"
ARR4[1]:=0
ARR4[2]:=0
ARR4[3]:=0
FOR I=1 TO kind
  IC=ALLTRIM(STR(I,2,0))
  ARR1[I+3] :=SUBSTR("      "+ A_M_NAME[I,1],-6,6)
  ARR2[I+3] :="TOTM" +IC
  if (mod(val(A_M_NAME[I,3]),1)>0 )
      ARR3[I+3]="999999.99"
      ARR4[I+3] =2
  ELSE
      ARR3[I+3]="999999999"
      ARR4[I+3] =2
  ENDIF
NEXT


ARR_PCS :={"DSP_TOTWV"," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
sele 9
goto top
if  BOF()
  APPE BLANK
ENDIF
GOTO 9
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
_DSP_VBROW(4,10,11,GS_TOT+UWC_TOT+3,ARR1,ARR2,ARR3,"_DMAKE1","9"," ",1)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
retu
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE  PNT_RATENA
PARAMETERS  P1,P2,P3
x= RDLPT(val(aport)-1)
if     (x= 128 )  .or. (x= 144 ) .or. (x= pnt_redy_code )
  SETETSP(APORT)
  SetPntWx("7")
  &&@  PROW(),0  SAY  "~L15;"
  @ PROW()+3,3	SAY "¤é´Á:"
  @ PROW(),8  SAY DATE()
  *@ PROW()+1,1 SAY "NO.  ¥Û¢° ¥Û¢± ¥Û¢² ¬â¢° ¬â¢±  Á`­« ²M¤ô ¦B¤ô ¤ôªd1 ¤ôªd2 ¤ôªd3 ÃÄ¾¯¢° ÃÄ¾¯¢±"
  *ppp
  XTIT="NO.  "
  ARR1 :=ARRAY(kind+2)
  ARR2 :=ARRAY(kind+2)
  ARR1[1]="NO. "
  XN_TITL=0
  ARR2[1]=1
  FOR I=1 TO gs_tot +uwc_tot
    IF EMPTY(A_M_NAME[I,3]) =  .F.
      ARR1[I+1] = A_M_NAME[I,17]
      IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
	ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
      ENDIF
      ARR2[I+1]=ARR2[I] + LEN(ARR1[I+1]) +1
      IF  I=GS_TOT  +1
	ARR2[kind+1]=ARR2[I+1]
	ARR1[I+1] :=" Á`­« " + ARR1[I+1]
	ARR2[I+1]=ARR2[I+1] +6
      ENDIF
      XTIT=XTIT +" " + ARR1[I+1]
    ENDIF
  NEXT

  @ PROW()+1,1 SAY  XTIT
  @ PROW()+1,1	SAY "----------------------------------------------------------------------------------------------"
  xd_wno=fSelectNo()
  SELE 2
  REC_OLD=RECNO()
  if F7_ACT=1
    GOTO TOP
  endif
  DO WHILE .NOT. EOF()
    XN_TOTW=0
    XCNR="1"
    @ PROW()+1,1 SAY RATNO
    @ PROW(),ARR2[2] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[3] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[4] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[5] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[6] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[7] SAY M&XCNR  PICT "9999"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[7,3]
    @ PROW(),ARR2[8] SAY M&XCNR  PICT  "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    XMC_F=A_M_NAME[8,3]
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    @ PROW(),ARR2[9] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[9,3]
    @ PROW(),ARR2[10] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    IF EMPTY(ARR2[11]) =.F.
      XMC_F=A_M_NAME[10,3]
      @ PROW(),ARR2[11] SAY M&XCNR  PICT "&XMC_F"
	XN_TOTW=XN_TOTW + M&XCNR
    endif
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    IF EMPTY(ARR2[12]) =.F.
      XMC_F=A_M_NAME[11,3]
      @ PROW(),ARR2[12] SAY M&XCNR  PICT "&XMC_F"
      XN_TOTW=XN_TOTW + M&XCNR
    ENDIF
    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    IF EMPTY(ARR2[13]) =.F.
      XMC_F=A_M_NAME[12,3]
      @ PROW(),ARR2[13] SAY M&XCNR  PICT "&XMC_F"
      XN_TOTW=XN_TOTW + M&XCNR
    ENDIF

    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[13,3]
    @ PROW(),ARR2[14] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR

    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[14,3]
    @ PROW(),ARR2[15] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR

    XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
    XMC_F=A_M_NAME[15,3]
    @ PROW(),ARR2[16] SAY M&XCNR  PICT "&XMC_F"
    XN_TOTW=XN_TOTW + M&XCNR
    @ PROW(),ARR2[kind+1] SAY XN_TOTW  PICT "99999"
    @ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------"
    if F7_ACT=1
      SKIP
    else
      exit
    endif
  ENDDO
  *@ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------"
  @ PROW()+1,1	SAY " "
  @ PROW()+1,1	SAY " "
  SET DEVI TO SCRE
  GOTO	REC_OLD
  SET CONS ON
  F7_ACT=0
  sele &xd_wno
ENDIF
RETU
&&-----------------------------------------------------------------------------
PROCEDURE  _CHANGE_DATA
PARAMETERS  P1,P2,P3
SET COLOR TO W+ / N
MODY_D1=1
ARR1 :=ARRAY(kind+3) && DISPAY	Y POSITION
ARR2 :=ARRAY(kind+3) && DISPAY	X POSITION
ARR3 :=ARRAY(kind+3) && DATA
ARR3_O :=ARRAY(kind+3) && DATA
ARR4 :=ARRAY(kind+3) && LONG
ARR5 :=ARRAY(kind+3) && LONG_DASH
ARR6 :=ARRAY(kind+3) &&  IF A_PRESS_N0[2,STPN1,I,1] =A_PRESS_N0[2,STPN1,I,8] SET 1
ARR1 :={16,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}
ARR2[1] :=12
ARR4[1] :=4
ARR5[1] :=1
FOR  I=1 TO GS_TOT +UWC_TOT
  ARR2[I+1]=A_M_NAME[I,13]
  ARR4[I+1]=LEN(ALLTRIM(A_M_NAME[I,3]))
  X=LEN(ALLTRIM(STR(INT(VAL(A_M_NAME[I,3])),6,0)))
  ARR5[I+1]=ARR4[I+1] -X
  IF ARR5[I+1] >=2
    ARR5[I+1]=ARR5[I+1] -1
  ENDIF
NEXT
x=_Tot_d_a[20,4]+2
@ 15,12 say _Tot_d_a[18,X]
@ 16,12 say _Tot_d_a[10,X]  PICT  "99.9"
ARR3[1] :=_Tot_d_a[10,X]
ARR3_O[1] :=ARR3[1]
FOR  I=1 TO GS_TOT +UWC_TOT
  IF A_PRESS_N0[2,STPN1,I,5]=0
    RETU
  ENDIF
  ARR3[I+1] :=A_PRESS_N0[2,STPN1,I,1]  / A_PRESS_N0[2,STPN1,I,5]
  ARR3_O[I+1] :=ARR3[I+1]
  ARR6[I]=0
  IF A_PRESS_N0[2,STPN1,I,1] = A_PRESS_N0[2,STPN1,I,8]
    ARR6[I]=1
  ENDIF
NEXT
TNSTP=1
TNSTP_O=1
MODY_D1=0
DO WHILE  TNSTP <=GS_TOT +UWC_TOT + 1
  TNSTP_O=TNSTP
  TNSTP=READ_A(ARR1[TNSTP],ARR2[TNSTP],ARR3[TNSTP],"N",ARR4[TNSTP],ARR5[TNSTP],TNSTP," ")
  if  ARR3[TNSTP_O] <>	VAL(CHRN)
    MODY_D1=1
  endif
  ARR3[TNSTP_O]=VAL(CHRN)
ENDDO
DISC_TOTM=ARR3[1]
if disc_totm >0
  SET COLOR TO w  / &C1
  x=_Tot_d_a[20,4]+2
  if (disc_totm <_Tot_d_a[10,X] )  .or. mody_d1=1
    FOR XL1=1 TO GS_TOT
      IC_L1=ALLTRIM(STR(XL1,2,0))
      IF disc_totm < A_PRESS_N0[L_PRESS,STPN&IC_L1,XL1,6]
	disc_totm = A_PRESS_N0[L_PRESS,STPN&IC_L1,XL1,6]
      endif
    NEXT
    IF disc_totm >= A_PRESS_N0[L_PRESS,STPN1,1,6]
      XAP1=STPN1
      XAP0=XAP1
      SETVN0=A_PRESS_N0[L_PRESS,XAP1,1,6]
      SETVN1=A_PRESS_N0[L_PRESS,XAP1,1,6]
      IF (disc_totm = A_PRESS_N0[L_PRESS,XAP1,1,6])
	  XAP1=XAP1+1
      ELSE
	DO WHILE (disc_totm > A_PRESS_N0[L_PRESS,XAP1,1,6])  .and. (A_PRESS_N0[L_PRESS,XAP1,1,6] > 0)
	  SETVN0=A_PRESS_N0[L_PRESS,XAP1,1,6]
	  XAP1=XAP1+1
	  XAP0=XAP1
	ENDDO
	XAP1=XAP0
      ENDIF
      SETVN1=A_PRESS_N0[L_PRESS,XAP1,1,6]
      for xap2=1  to GS_TOT +UWC_TOT
	A_PRESS_N0[L_PRESS,XAP1,XAP2,6] :=DISC_TOTM
	XAP3=(DISC_TOTM-SETVN0)/A_PRESS_N0[L_PRESS,XAP1,XAP2,5]
	A_PRESS_N0[L_PRESS,XAP1,XAP2,1] :=A_PRESS_N0[L_PRESS,XAP1,XAP2,1] * XAP3
	A_PRESS_N0[L_PRESS,XAP1,XAP2,3] :=A_PRESS_N0[L_PRESS,XAP1,XAP2,3] * XAP3
	A_PRESS_N0[L_PRESS,XAP1,XAP2,5] :=DISC_TOTM-SETVN0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,1] :=0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,2] :=0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,3] :=0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,4] :=0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,5] :=0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,6] :=0
	A_PRESS_N0[L_PRESS,XAP1+1,XAP2,7] :=0
	IF ARR6[xap2]=1
	  A_PRESS_N0[L_PRESS,XAP1,XAP2,8] := A_PRESS_N0[L_PRESS,XAP1,XAP2,1]
	ENDIF
      NEXT
      XAP1=STPN1
      DO WHILE A_PRESS_N0[2,XAP1,1,6]>0
	for I=1  to GS_TOT +UWC_TOT
	  IF ARR3[I+1] <> ARR3_O[I+1]
	    && IC_X=ALLTRIM(STR(I,2,0))
	    && IF STPN&IC_X <XAP1
	    &&	 A_PRESS_N0[2,XAP1,I,1]=A_PRESS_N0[2,XAP1,I,5] * ARR3[I+1]
	    &&	 IF ARR6[I]=1
	    &&	   A_PRESS_N0[2,XAP1,I,8]=A_PRESS_N0[2,XAP1,I,1]
	    &&	 ENDIF
	    && ENDIF
	    IC_X=ALLTRIM(STR(I,2,0))
	    IF (STPN&IC_X <XAP1) .or. ((STP_a[I] =3) .and. (stpn&IC_X=XAP1)  )	&&**2015.9.31**
	      IF  ((STP_a[I] =3) .and. (stpn&IC_X=XAP1)  )  &&**2015.9.31**
		XADJW=A_PRESS_N0[2,XAP1,I,1]	&&**2015.9.31**
		A_PRESS_N0[2,XAP1,I,1]=A_PRESS_N0[2,XAP1,I,5] * ARR3[I+1]
		XADJW=A_PRESS_N0[2,XAP1,I,1] -XADJW  &&**2015.9.31**
		AdjSetWeiAd(I,XADJW)	&&**2015.9.31**
		IF ARR6[I]=1
		  A_PRESS_N0[2,XAP1,I,8]=A_PRESS_N0[2,XAP1,I,1]
		ENDIF
		xw1=A_PRESS_N0[2,XAP1,I,8]
		IF DSPADJAW=1
		  A_RAND_W[I]=Get_Rand_w(I,xw1)
		endif
	      ENDIF
	      A_PRESS_N0[2,XAP1,I,1]=A_PRESS_N0[2,XAP1,I,5] * ARR3[I+1]
	      IF ARR6[I]=1
		A_PRESS_N0[2,XAP1,I,8]=A_PRESS_N0[2,XAP1,I,1]
	      ENDIF
	    ENDIF
	  ENDIF
	NEXT
	XAP1=XAP1+1
      ENDDO
      x=_Tot_d_a[20,4]+2
      _Tot_d_a[10,X]=disc_totm
    ENDIF
  endif
  x=_Tot_d_a[20,4]+2
  @ 16,12  SAY _Tot_d_a[10,X]	PICT "99.9"
endif
SET COLOR TO W	/ N
x=_Tot_d_a[20,4]+2
@ 16,12 say _Tot_d_a[10,X]  PICT  "99.9"
SET COLOR TO W+ / N
FOR  I=1 TO GS_TOT +UWC_TOT
  XMC_F=A_M_NAME[I,3]
  IC_X=ALLTRIM(STR(I,2,0))
  @  2,A_M_NAME[I,13]  SAY  A_PRESS_N0[2,STPN&IC_X,I,8] PICT "&XMC_F"
NEXT
SET COLOR TO W+ / N
COMMIT
RETU
**-----------------------------------------------------------------------------
PROCEDURE  DSPALLDATA
PARAMETERS  P1,P2,P3
SELE 9
GOTO  TOP
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*ARR1 :={"NO. ","¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±"," Á`­« ²M¤ô","¦B¤ô","¤ôªd1","¤ôªd2","¤ôªd3","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(16)
ARR2 :=ARRAY(16)
ARR3 :=ARRAY(16)
ARR4 :=ARRAY(16)
ARR1[1]="NO. "
XN_TITL=0
*C_TOP2="¥X¨®°O¿ý"
C_TOP2="¥X¨®"
if (waste=1)
  ARR1 :={"  ¤é´Á   ","   ®É¶¡  ","  °t¤ñ    ","  ¦Ì¼Æ","  ¨®¸¹ ","¤u¦a      ","§Ç¸¹                "}
  ARR2 :={"LUDATE","LUTIME","RATNO","TOTVUSE","CARNO","P1701","SCANO"}
  ARR3 :={"XXXXXXXXXX","XXXXXXXX","XXXXXXXXX","99.9","XXXXXX","XXXXXXXXXX","XXXXXXXXXXXXXXXXXXXX"}
  ARR4 :={0,0,0,1,0,0,0}
  ARR_PCS={" "," "," "," "," "," "," "}
  XN_TITL=7
else
  ARR1 :={"  ¤é´Á      ","   ®É¶¡  ","  °t¤ñ    ","  ¦Ì¼Æ","  ¨®¸¹ ","§Ç¸¹     "}
  ARR2 :={"LUDATE","LUTIME","RATNO","TOTVUSE","CARNO","SCANO"}
  ARR3 :={"XXXXXXXXXX","XXXXXXXX","XXXXXXXXX","99.9","XXXXXX","XXXXXXXXX"}
  ARR4 :={0,0,0,1,0,0}
  ARR_PCS={" "," "," "," "," "," "}
  XN_TITL=6
endif
TW_DSPX=2
RET_X1=SPACE(4)
C_TOP1="F1-         F3-    F7-¦C¦LÂ²­n F8-¦C¦L¦¹µ§¸Ô²Ó"
F7_FUNC="PNT_TOTDATA"
F8_FUNC="PNT_CARDATA"
DEL_FUNC="DEL_SAREC"
*F3_FUNC="INS_SAREC"
F3_FUNC=" "
*F1_FUNC="TAKE_SAREC"
F1_FUNC=" "
n_rec=recno()
&&STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13,P_FUNC14,P_FUNC15,P_FUNC16
FOR I=0 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next

P_FUNC0="dsp_totw"
DLA_DSP=0
_GET_BROW(3,2,18,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","9","N",.T.,.F.)
DLA_DSP=1
&&++++++++++++++++++++++++++++++++++++++++
RST_FUNC()
STOR " "  TO C_TOP1,F7_FUNC
SET COLOR TO &C7 +/ &C1
retu
**-----------------------------------------------------------------------------
PROCEDURE  GS_ADJ
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
C_TOP2=" "
C_TOP1=" ¤p¤J®Æ "
*ARR1 :={"¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±"," ²M¤ô","¦B¤ô","¤ôªd¢°","¤ôªd¢±","¤ôªd¢²","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(16)
ARR1[1] :="¥Û¢°-¬â¢°"
ARR1[2] :="¥Û¢°-¬â¢±"
ARR1[3] :="¥Û¢±-¬â¢°"
ARR1[4] :="¥Û¢±-¬â¢±"
XN_TITL=4
ARR2 :={"PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12"}
ARR3 :={"99.9","99.9","99.9","99.9","9999","9999","9999","9999","9999","9999","999.99","999.99",}
ARR4 :={1,1,1,1,1,0,0,0,0,0,2,2}
ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
xd_wno=fSelectNo()
sele 5
GOTO 59
n_rec=recno()
DO RST_FUNC
P_FUNC0=" "
DLA_DSP=0
stor  3  to  fist_rec,last_rec
_GET_BROW(20,2,1,XN_TITL,ARR1,ARR2,ARR3,"_DMAKE1","5","1",.F.,.F.)
stor  0  to  fist_rec,last_rec
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
sele 5
goto 59
GS_ADJ[1] :=PA1  && G1-S1  ¢H
GS_ADJ[2] :=PA2  && G1-S2
GS_ADJ[3] :=PA3  && G2-S1
GS_ADJ[4] :=PA4  && G2-S2
sele &xd_wno
retu
**-----------------------------------------------------------------------------
PROCEDURE  RST_FUNC
PARAMETERS  P1,P2,P3
&&STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13,P_FUNC14,P_FUNC15,P_FUNC16
FOR I=0 TO kind +1
  IX_C=ALLTRIM(STR(I,2,0))
  stor " "  to  P_FUNC&IX_C
next
STOR " " TO ARRTIT0,ARRTIT1,DEL_FUNC
STOR " "  TO C_TOP1,C_TOP2,F3_FUNC,F5_FUNC,F7_FUNC,F8_FUNC,F9_FUNC
ARRWID :={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
retu
**-----------------------------------------------------------------------------
FUNCTION SETETSP
PARAMETERS  PORT_P
  SET CONS Off
  set print to lpt&PORT_P
  ? chr(27) + "SP&PORT_P;"
  SET CONS On
RETU
**-----------------------------------------------------------------------------
FUNCTION SetPntWx
PARAMETERS  Wx
  SET  CONS  Off
  SET DEVI TO PRINT
  @ PROW(),0 SAY   "~I;"
  @ PROW(),0 SAY   "~X&WX;"
RETU
**-----------------------------------------------------------------------------
PROCEDURE  SETPARN
PARAMETERS  P1,P2,P3
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
* p01-p02 ARR1 :={"NO","PA1 ","PA2 ","PA3 ","PA4 ","PA5 ","PA6 ","PA7 ","PA8 ","PA9 ","PA10","PA11","PA12  ","PA13  ","PA14  "}
* p03 ARR1 :={"NO","PA1  ","PA2  ","PA3  ","PA4  ","PA5  ","PA6  ","PA7  ","PA8 ","PA9 ","PA10","PA11","PA12  ","PA13  ","PA14  "}
ARR1:=ARRAY(kind +1)
ARR2:=ARRAY(kind +1)
ARR3:=ARRAY(kind +1)
ARR4:=ARRAY(kind +1)
ARR_PCS :=ARRAY(kind +1)

ARR1[1]="No"
ARR2[1]="PARNO"
ARR3[1]="99"
ARR4[1]=0
ARR_PCS[1]=" "
FOR I=1 TO kind
  IX_C=ALLTRIM(STR(I,2,0))
  ARR1[I+1] ="PA" + ALLTRIM(IX_C)
  ARR2[I+1] ="PA" + ALLTRIM(IX_C)
  ARR3[I+1] ="9999"
  ARR4[I+1] =0
  ARR_PCS[I+1]=" "

NEXT



&&ARR1 :={"NO","PA1  ","PA2  ","PA3  ","PA4  ","PA5  ","PA6  ","PA7  ","PA8 ","PA9 ","PA10","PA11","PA12  ","PA13  ","PA14  "}
&&ARR2 :={"PARNO","PA1","PA2","PA3","PA4","PA5","PA6","PA7","PA8","PA9","PA10","PA11","PA12","PA13","PA14"}
* p01-p02 ARR3 :={"99","9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","9999","999.99","999.99","999.99"}
* p03  ARR3 :={"99","99999","99999","99999","99999","99999","99999","99999","9999","9999","9999","9999","999.99","999.99","999.99"}
&& ARR3 :={"99","99999","99999","99999","99999","99999","99999","99999","9999","9999","9999","9999","999.99","999.99","999.99"}
&& ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,2,2,2}
&& ARR_PCS :={" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," " }
RET_X1=SPACE(4)
SELE 5
USE  PAR1
GOTO 19
IF  EOF()=.F.
  for xlop=1  to   gs_tot+uwc_tot
    CN=ALLTRIM(STR(XLOP,2,0))
    CX=ALLTRIM(PA&CN)
    XLEN= LEN(CX)
    IF	 XLEN<3
       CX="9999"
    ENDIF
    ARR3[XLOP+1]=CX
    IF VAL(ARR3[XLOP+1])-INT(VAL(ARR3[XLOP+1])) =0
      ARR4[XLOP+1]=0
    ELSE
      ARR4[XLOP+1]=2
    ENDIF
    CX=ARR1[XLOP+1]
    CX=FSUBSTR(CX,XLEN," ",0)
    ARR1[XLOP+1]=CX
  next
ENDIF
USE  PAR
xd_wno=fSelectNo()
sele 5
goto top
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
*DO RST_FUNC
P_FUNC2="FIND_1102"
DLA_DSP=0






_GET_BROW(1,0,18,gs_tot+uwc_tot+1,ARR1,ARR2,ARR3,"_DMAKE1","5","Y",.T.,.F.)
DLA_DSP=1
DO RST_FUNC
SET COLOR TO &C7 +/ &C1
sele &xd_wno
retu
**-----------------------------------------------------------------------------
&&---------------------------------------------------------------------------------------------------
FUNCTION _GET_VBROW
PARAMETERS  Y1_N,X1_N,XW_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI,MDYPAGE,DELREC
YL_N=INT(80/XW_N) -1
IF _MODI="Y"
  STOR 0 TO FIST_REC,LAST_REC
ENDIF
_DATA_MODIFY =0
X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+TIT_N+1,79)
XCOR=SETCOLOR()
XXP=LEN(C_TOP2)+1
IF EMPTY(C_TOP2)=.T.
  XXP=0
ENDIF
ARR_DSPN=ARRAY(1)
XX=X1_N+XXP +1+LEN(ARR_TITLE[1])
ARR_DSPN[1] :=XX -1-LEN(ARR3[1])
X=2
*XX=X1_N+XXP
D_C=ALLTRIM(C_TOP2) +" "
D_C=D_C +ARR_TITLE[1]+" "
DO WHILE  X <=	TIT_N
  *XX=XX+1+LEN(ARR_TITLE[X])
  xp=1
  xspace=" "
  if ( LEN(ARR_TITLE[X]) > len(arr_type[x]))  .and. x <> gs_tot+2
    xp=0
  xspace=""
  endif
  XX=XX+xp+LEN(ARR_TITLE[X])
  AADD(ARR_DSPN,XX -LEN(ARR3[X])-1)
  *X=X+1
  D_C=D_C +ARR_TITLE[X]
  X=X+1
  IF X <= TIT_N
    D_C=D_C +xspace
  ENDIF
ENDDO
*X=1
*D_C=ALLTRIM(C_TOP2) +" "
*DO WHILE  X <=  TIT_N
*  D_C=D_C +ARR_TITLE[X]
*  X=X+1
*  IF X <= TIT_N
*    D_C=D_C +" "
*  ENDIF
*ENDDO
DC_L=LEN(D_C)
SET DEVI TO SCRE
X_C2=" Pg-Wown Up¤W¤U­¶ Enter¿ï¾Ü "
IF  (_MODI="Y") .OR. (_MODI="K")
  X_C1="¡ô¡õ¤W¤Uµ§ F10-§R°£ Esc¸õÂ÷"
ELSE
  X_C1="¡ô¡õ¤W¤Uµ§          Esc¸õÂ÷ "
ENDIF
IF (FIST_REC<>0).AND. (FIST_REC=LAST_REC)
  X_C1=" ¡ô¡õ-­×§ï  Esc¸õÂ÷ "
  X_C2=""
ENDIF
IF EMPTY(C_TOP1)= .F.
  x_c2=c_top1 +x_c2
ENDIF
X=LEN(X_C1)
IF X>DC_L
  XX=INT((X-DC_L)/2)
ELSE
  XX=0
ENDIF
SET COLOR TO GR+ / BL
@ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+TIT_N+1,X1_N + DC_L +2 +XX
BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+TIT_N+1,X1_N + DC_L+XX)
SET COLOR TO GR+ / R

FOR  X =1 TO   TIT_N
  XBLK=""
  BLKN=xw_n-1-LEN(ARR_TITLE[X])
  IF BLKN>0
     XBLK=SUBSTR("        ",1,BLKN)
  ENDIF
  @ Y1_N+X-1,X1_N  SAY	XBLK +	ARR_TITLE[X]
NEXT
*@ Y1_N-1,X1_N	SAY   D_C
*@ Y1_N+YL_N,X1_N  SAY	 SPACE(DC_L)
IF  DC_L>LEN(X_C1)+LEN(X_C2)+1
  X=LEN(X_C1)+LEN(X_C2)
  @ Y1_N+TIT_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2+" "+X_C1
ELSE
  @ Y1_N+TIT_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY	 X_C1
  @ Y1_N+TIT_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2
ENDIF
IF EMPTY(C_TOP1)= .F.
  @ Y1_N+TIT_N+1,X1_N	SAY   C_TOP1
ENDIF
SELE &N_SELE
N_YN=Y1_N
N_COL=1
N_REC=1
*GOTO TOP
SET COLOR TO W+ / BL
DO _DSPV_ALL
N_REC=RECNO()
*N_YN=Y1_N
*GOTO TOP
SET COLOR TO GR+ / W+
*_REC_DSP(N_YN)
MDY_X=X1_N+XW_N
_REC_DSPV(Y1_N,MDY_X)
_LOOP_BR=1
T=0
DO WHILE _LOOP_BR =1
  IF _MODI="P"   && only modify data start
    T=-992
    _MODI="Y"
  ENDIF
  DO WHILE T=0
    IF T0A <>0
      T=T0A
      T0A=0
    ELSE
      T=INKEY()
    ENDIF
    IF DLA_DSP=1
      DO DSP2
    ENDIF
    IF T0A=0
      DO LUSTP
    ENDIF
  ENDDO
  SELE &N_SELE
  DO CASE
  CASE T=K_F3
    IF	EMPTY(F3_FUNC) =.F.
      DO &F3_FUNC
    ENDIF
    T=0
  CASE T=K_F7
    F7_ACT=1
    IF	EMPTY(F7_FUNC) =.F.
      F7_ACT=1
      DO &F7_FUNC
    ENDIF
    T=0
  CASE T=K_F8
    IF	EMPTY(F8_FUNC) =.F.
      DO &F8_FUNC
    ENDIF
    T=0
  CASE T=-992	.AND. (_MODI="Y"  .OR.    _MODI="K"  .OR.    _MODI="1"  )
    &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
    _GET_STP=1
    DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
       R_C=ARR_REC_NAME[_GET_STP]
       T_C=ARR_TYPE[_GET_STP]
       _D_TYPE=TYPE("&R_C")
       C_L=LEN(ARR_TYPE[_GET_STP])
       SET COLOR TO  &12 /&11
       xplus0=XW_N -len(T_C)
       @ N_YN+_GET_STP-1,X1_N +N_COL*XW_N+xplus0  SAY &R_C   PICT "&T_C"
       GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
       *p_func=P_FUNC&GET_STPC
       p_func=" "
       X_GETSTP=_GET_STP
       set  colo  to gr + /w
       _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
      *_GET_STP=READ_A(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC")
      LAST_PRESS=0
      _GET_STP=READ_A(N_YN+_GET_STP-1,X1_N+N_COL*XW_N+xplus0,&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC")
      IF _GET_STP=99
	_LOOP_BR=0
      ENDIF
      IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	_ACT_PX=UPPER(_ACT_PX)
      ELSE
	IF  T_C="9" .AND.  (_ACT_PX >INT(VAL(ARR3[X_GETSTP])) )
	  _ACT_PX =INT(VAL(ARR3[X_GETSTP]))
	ENDIF
      ENDIF
      T_C=ARR_TYPE[X_GETSTP]
      *IF _GET_STP <20
      *  @ N_YN+_GET_STP-1,X1_N+N_COL*XW_N+xplus0   SAY  _ACT_PX  PICT "&T_C"
      *ENDIF
      SELE &N_SELE
      IF SUBSTR(T_C,1,1)<>"9"
	  _ACT_PX=ALLTRIM(_ACT_PX)
      ENDIF
      REPL  &R_C  WITH _ACT_PX
      IF  (EMPTY(ARR_PCS[X_GETSTP]) =.F.)  .AND.  (_GET_STP<20)
	PCSV_CF(N_YN+1,X1_N+(N_COL*XW_N)+(xw_n-4),&R_C,_GET_STP,RECNO())
      ENDIF
      IF   (_GET_STP<20)
	IF ARR_REC_NAME[_GET_STP] ="0"
	    IF LAST_PRESS=5
	      _GET_STP =_GET_STP-1
	    ELSE
	      _GET_STP =_GET_STP+1
	    ENDIF
	ENDIF
      ENDIF
    ENDDO
    set  colo to  gr + /w
    *_REC_DSP(N_YN)
     _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    _DATA_MODIFY=1
    IF (_GET_STP !=98)
      T=0
    ENDIF
  CASE T=5
    IF	(_MODI <> "1")
      UPV_DSP1(-1,xw_n)
    ENDIF
    T=-992
  CASE T=24
    IF	(_MODI <> "1")
      UPV_DSP1(1,xw_n)
    ENDIF
    T=-992
  CASE T=7 .and.  DELREC=.T.
    DELE
    PACK
    IF	EOF()
      SKIP -1
      IF  EOF()
	APPE BLANK
      ENDIF
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    SET COLOR TO W+ / BL
    DO _DSPV_ALL
    SET COLOR TO GR+ / W+
    GOTO N_REC
    *_REC_DSP(N_YN)
    * _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    _DATA_MODIFY =1
    T=0
  CASE T=18   .AND.  MDYPAGE=.T.
    SKIP -(YL_N +(N_YN-Y1_N))
    IF BOF()
      GOTO TOP
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    n_col=1
    SET COLOR TO W+ / BL
    DO _DSPV_ALL
    SET COLOR TO GR+ / W+
    GOTO N_REC
   * _REC_DSP(N_YN)
    _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    T=0
  CASE T=3    .AND.  MDYPAGE=.T.
    SKIP ((Y1_N+YL_N-N_YN))
    IF EOF()
      GOTO BOTT
    ENDIF
    N_REC=RECNO()
    N_YN=Y1_N
    n_col=1
    SET COLOR TO W+ / BL
    DO _DSPV_ALL
    GOTO N_REC
    SET COLOR TO GR+ / W+
    *_REC_DSP(N_YN)
     _REC_DSPV(N_YN,X1_N +N_COL*XW_N)
    T=0
  CASE T=13
    X=1
    DO WHILE  X <=TIT_N
      R_C=ARR_REC_NAME[X]
      XK=ALLTRIM(STR(X,2,0))
      RET_X&XK=&R_C
      RET_A[X]=&R_C
      X=X+1
    ENDDO
    _LOOP_BR=0
    T=0
  CASE T=23 .OR. T=27
    _LOOP_BR=0
    T=0
  otherwise
    T=0
  ENDCASE
ENDDO
T=0
SET COLO TO &XCOR
MODI_PAGE= .T.
RESTSCREEN(Y1_N-1,0,Y1_N+YL_N+1,79,X_G_B)
RETU
&&---------------------------------------------------------------------------------------------------
PROCEDURE    _DSPV_ALL
PARAMETERS  P1,P2,P3
XAL=1
Y_X=Y1_N
X1_N2=X1_N +XW_N
@ Y1_N,X1_N2 CLEA TO Y1_N+TIT_N-1,79
IF .NOT. BOF()
  DO WHILE  (XAL <=YL_N)  .AND. (.NOT. EOF())
    _REC_DSPV(Y_X,X1_N2)
    SKIP
    *Y_X=Y_X+1
    X1_N2=X1_N2 +XW_N
    XAL=XAL+1
  ENDDO
  *SKIP -1
  *N_YN=Y_X -1
ENDIF
goto n_rec
RETU
&&-----------------------------------------------------------------------------
FUNCTION   _REC_DSPV
PARAMETERS  YD_N,XD_N
X=1
YD_N0=YD_N
DO WHILE  X <=TIT_N
  R_CB=ARR_REC_NAME[X]
  T_CB=ARR_TYPE[X]
  XPLUS=XW_N-LEN(T_CB)
  _XN1=&R_CB
  IF (VALTYPE(_XN1)="N") .AND. ( T_CB="9999")
     IF ( _XN1-INT(_XN1) <>0 )
       _XN1=LTRIM(STR(_XN1,7,2))
       XLEN=LEN(_XN1)
       IF XLEN <4
	 _XN1=SUBSTR("    ",1,4-XLEN) + _XN1
       ELSE
	 _XN1=SUBSTR(_XN1,1,4)
       ENDIF
       @ YD_N,XD_N+XPLUS  SAY _XN1
     ELSE
       @ YD_N,XD_N+XPLUS   SAY &R_CB   PICT "&T_CB"
     ENDIF
  ELSE
    @ YD_N,XD_N+XPLUS	SAY &R_CB   PICT "&T_CB"
  ENDIF
  IF  (x=tit_n) .and. (EMPTY(ARR_PCS[X]) =.F.)
    PCSV_CF(YD_N0+1,XD_N+XW_N-4,&R_CB,X,RECNO())
  ENDIF
  YD_N=YD_N +1
  X=X+1
ENDDO
RETU
&&-----------------------------------------------------------------------------
FUNCTION PCSV_CF
PARAMETERS  Y_POSI,X_POS,X_DATA,XFUNC_NO,XN_RECNO
XDO_F=ARR_PCS[XFUNC_NO]
DO &XDO_F    WITH  X_POS
RETU
**-----------------------------------------------------------------------------
PROCEDURE  DSPV_TOTW
PARAMETERS  P1,P2,P3
c_color=SETCOLOr()
SET COLOR TO GR+ / BL
*@ Y_POSI,33  SAY  (M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) PICT "9999"
XTOT=0
FOR I=1 TO gs_tot + uwc_tot
  IX_C=ALLTRIM(STR(I,2,0))
  XTOT=XTOT +  M&IX_C
NEXT
*@ Y_POSI,TW_DSPX-2  SAY XTOT  PICT "9999"
@ Y_POSI,P1  SAY XTOT  PICT "9999"
SET COLOR TO &c_color
retu
&&-----------------------------------------------------------------------------
FUNCTION   UPV_DSP1
PARAMETERS  DIREC,w_col
REFRESH=0
SET COLOR TO W+ / BL
_REC_DSPV(Y1_N,X1_N +N_COL*w_col)
SKIP   DIREC
IF (DIREC >0)
   IF EOF()
      GOTO BOTT
     IF  _MODI="Y"    .AND. (_MODI <> "1")
	 append  blank
     endif
     GOTO BOTT
   ENDIF
    IF N_COL =YL_N
      REFRESH=1
    ELSE
       N_COL=N_COL+1
    ENDIF
ELSE
   IF N_COL =1
      REFRESH=1
     IF BOF()
	GOTO TOP
     ENDIF
   ELSE
       N_COL=N_COL-1
   ENDIF
ENDIF
N_REC=RECNO()
IF REFRESH=1
    SKIP  -(N_COL-1)
    DO _DSPV_ALL
ENDIF
GOTO N_REC


SET COLOR TO GR+ / W+
_REC_DSPV(Y1_N,X1_N +N_COL*w_col)
N_REC=RECNO()
RETU
&&---------------------------------------------------------------------------------------------------
PROCEDURE    ini_data
PARAMETERS  P1,P2,P3
public	KLCHN,KUCHN,GS_TOT,UWC_TOT,DOSIGN,trans_e

STOR  0  TO  DOSIGN,trans_e

RETU
&&-----------------------------------------------------------------------------
PROCEDURE    ini_data1
PARAMETERS  P1,P2,P3
public	R_BUF,O_BUF,o_buf0,O_SEC,REQ_N,engl,r_free,R_SEC,R_ISNEW,R_CNT,OP_MODE,TRANS_ERR,PMIXTM_O
public	cancel_key,off_time,ASTRO,DEL_FUNC,DSP_SCALL,LUSTP_EN,Last_key
PUBLIC	O_RCPS,totwact,stortime,pn_xn,waterlow,w_lowLEVEL,K_DIN5
waterlow :=array(2)
w_lowLEVEL :=array(2)
w_lowLEVEL[1]=0
w_lowLEVEL[2]=0

totwact :=ARRAY(kind +3)
cancel_key :=array(2)
O_RCPS	:=ARRAY(3)
O_RCPS[1]=" "  &&SCANO
O_RCPS[2]=" "  && RATNO
O_RCPS[3]=0    &&  VUSE

off_time=seconds()
STOR 50  TO  TRANS_ERR
STOR 0 TO O_SEC,REQ_N,engl,r_free,R_SEC,R0_SEC,R_ISNEW,R_CNT,last_key,pn_xn,K_DIN5
STOR "" TO R_BUF,O_BUF,OP_MODE,o_buf0,DEL_FUNC
STOR " " TO OP_MODE
STOR  1  TO  DSP_SCALL,LUSTP_EN
*STOR "1" TO lag_sno
astro =space(10)

RETU
&&-----------------------------------------------------------------------------
FUNCTION   DEL_SaRec
PARAMETERS  YD_N,XD_N
  IF  ENGL=0
    D_C1="¥X¨®¸ê®Æ§R°£(Y/N) ?"
    D_C2="½T©w«ö Y Áä"
    D_C3="¨ú®ø«ö N ©Î Esc Áä"
  ELSE
    D_C1="Delete Delivery Sheet(Y/N) ?"
    D_C2="Press Y to Exection"
    D_C3="Press N OR Esc to Exit"
  ENDIF
  dl_ok=0
  DL_OK=OK_ECHO(10,30,D_C1,D_C2,D_C3)
  if  dl_ok=1
     if eof()=.f.
       xd_wno=fSelectNo()
       xd_ludate=ludate
       xd_lagno1=lagno1
       dele
       pack
       sele 1
       dele  for (ludate=xd_ludate)  .and.  (lagno1=xd_lagno1)
       pack
       sele  7
       dele  for (ludate=xd_ludate)  .and.  (lagno1=xd_lagno1)
       pack
       COMMIT
       sele &xd_wno

       SET COLOR TO W+ / BL
       DO _DSP_ALL
       N_REC=RECNO()
       SET COLOR TO GR+ / W+
       _REC_DSP(N_YN)
       _LOOP_BR=1
     endif
  endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION   INS_SaRec
PARAMETERS  YD_N,XD_N
  *IF  ENGL=0
  *  D_C1="¥X¨®¸ê®Æ·s¼W(Y/N) ?"
  *  D_C2="½T©w«ö Y Áä"
  *  D_C3="¨ú®ø«ö N ©Î Esc Áä"
  *ELSE
  *  D_C1="Delete Delivery Sheet(Y/N) ?"
  *  D_C2="Press Y to Exection"
  *  D_C3="Press N OR Esc to Exit"
  *ENDIF
  dl_ok=1
  *DL_OK=OK_ECHO(10,30,D_C1,D_C2,D_C3)
  if  dl_ok=1
     D_YS=1
     D_YE=24
     Xsa_ER=SAVESCREEN(1,0,24,79)
     INSERT_SA(date(),time())
     RESTSCREEN(1,0,24,79,Xsa_ER)
     RESET_SA()
  ENDIF
RETU
&&-----------------------------------------------------------------------------
FUNCTION   Take_SaRec
PARAMETERS  YD_N,XD_N
  xtake_wno=fSelectNo()
  sele 9
  ascano=scano
  ACARNO =CARNO     &&¨®¸¹	      ACARNO
  ARATNO =RATNO     &&°t¤ñNO	      ARATNO
  ASTRO=s_STRO
  AVUSE  =0	 &&¦Ì¼Æ 	   AVUSE
  ATANDO =TANDO     &&§~«×	      ATANDO
  AUS2	 =US2	    &&«È¤áNO	      AUS2
  ACARDRV=CARDRV    &&DRIVER NAME     ACARDRV
  AUS2_1=US2_1	    &&«È¤á¦WºÙ	      AUS2_1
  A_ADDR_NO=p1701     &&°e³f¦a§}NO
  APOSITION =P1701
  sele &xtake_wno
&&-----------------------------------------------------------------------------
FUNCTION   RESET_Sa
PARAMETERS  YD_N,XD_N
   F7_FUNC="PNT_TOTDATA"
   F8_FUNC="PNT_CARDATA"
   DEL_FUNC="DEL_SAREC"
   F3_FUNC="INS_SAREC"
   SELE 7
   DELE FILE  C:\TEST1.DBF
   COPY TO  C:\TEST1   FOR   (LUDATE >= SDATE ) .AND. (LUDATE <= EDATE )
   SELE 9
   USE
   USE	C:\TOT
   ZAP
   commit
   APPE  FROM  C:\TEST1
   DELE FILE  C:\TEST1.DBF
   SORT ON  LUDATE, lutime    TO  TEST1
   ZAP
   APPE  FROM  \TEST1

   SET COLOR TO W+ / BL
   goto  top
   DO _DSP_ALL
   N_REC=RECNO()
   SET COLOR TO GR+ / W+
   _REC_DSP(N_YN)
   _LOOP_BR=1
   SET COLOR TO W+ / BL

RETU



#ifdef	dfRaten_2Page
   &&-----------------------------------------------------------------------------
   PROCEDURE  PNT_RATEN
   && PARAMETERS  P1,P2,P3
   && PARAMETERS  KEY_NO,xRET_DNX ,P3
   PARAMETERS  xActNo,KEY_NO,xRET_DNX ,P3
   IF EMPTY(xActNo)=.T.
     xActNo="2"
   ENDIF
     ActNo_N =VAL(xActNo)
   x= RDLPT(val(aport)-1)
   if	  (x= 128 )  .or. (x= 144 ) .or. (x= pnt_redy_code )
     SETETSP(APORT)
     SetPntWx("3")
     @	PROW(),0  SAY  "~L12;"
     @ PROW()+3,3  SAY "¤é´Á:"
     @ PROW(),8  SAY DATE()
     *@ PROW()+1,1 SAY "NO.  ¥Û¢° ¥Û¢± ¥Û¢² ¬â¢° ¬â¢±  Á`­« ²M¤ô ¦B¤ô ¤ôªd1 ¤ôªd2 ¤ôªd3 ÃÄ¾¯¢° ÃÄ¾¯¢±"
     *ppp
     &&XTIT="NO.      "
     XTIT=fsubstr("°t¤ñ¥N¸¹  ",-ratno_wid," ",0)
     ARR1 :=ARRAY(kind+3)
     ARR2 :=ARRAY(kind+3)
     ARR1[1]="NO.      "
     XN_TITL=0
     ARR2[1]=1
     FOR I=1 TO gs_tot + uwc_tot
       IF EMPTY(A_M_NAME[I,3]) =  .F.
	 ARR1[I+1] = A_M_NAME[I,17]
	 IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
	   ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
	 ENDIF
	 ARR2[I+1]=ARR2[I] + LEN(ARR1[I]) +1
	 IF  I=GS_TOT
	   ARR1[I+1] :=ARR1[I+1] + " Á`­« "
	 ENDIF

	 IF  I=GS_TOT  +1
	   ARR2[kind+2]=ARR2[I+1]-7  &&-5
	   *ARR1[I+1] :=" Á`­« " + ARR1[I+1]
	   *ARR2[I+1]=ARR2[I+1] +6
	 ENDIF
	 XTIT=XTIT +" " + ARR1[I+1]
       ENDIF
     NEXT
     titlen=len( XTIT)
     @ PROW()+1,1 SAY  XTIT
     @ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------------"
     && SELE 2
     sele &ActNO_N
     REC_OLD=RECNO()
     if F7_ACT=1
       GOTO TOP
     endif
     DO WHILE .NOT. EOF()
       XN_TOTW=0
       XCNR="1"
       @ PROW()+1,1 SAY RATNO  pict "XXXXXXXXXX"
       for i=1	to    gs_tot +uwc_tot
	 XMC_F=A_M_NAME[I,3]
	 xcnr=alltrim(str(I,0))
	 @ PROW(),ARR2[I+1] SAY M&XCNR	PICT  "&XMC_F"
	 XN_TOTW=XN_TOTW + M&XCNR
       next
       @ PROW(),ARR2[kind+2] SAY XN_TOTW  PICT "99999"
       @ PROW()+1,1  SAY "--------------------------------------------------------------------------------------------------"

       *@ PROW(),ARR2[2] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[3] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[4] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[5] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[6] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[7] SAY M&XCNR  PICT "9999"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *XMC_F=A_M_NAME[7,3]
       *@ PROW(),ARR2[8] SAY M&XCNR  PICT  "&XMC_F"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XMC_F=A_M_NAME[8,3]
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *@ PROW(),ARR2[9] SAY M&XCNR  PICT "&XMC_F"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *XMC_F=A_M_NAME[9,3]
       *@ PROW(),ARR2[10] SAY M&XCNR  PICT "&XMC_F"
       *XN_TOTW=XN_TOTW + M&XCNR
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *IF EMPTY(ARR2[11]) =.F.
       *  XMC_F=A_M_NAME[10,3]
       *  @ PROW(),ARR2[11] SAY M&XCNR	PICT "&XMC_F"
       *    XN_TOTW=XN_TOTW + M&XCNR
       *endif
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *IF EMPTY(ARR2[12]) =.F.
       *  XMC_F=A_M_NAME[11,3]
       *  @ PROW(),ARR2[12] SAY M&XCNR	PICT "&XMC_F"
       *  XN_TOTW=XN_TOTW + M&XCNR
       *ENDIF
       *XCNR=ALLTRIM(STR(VAL(XCNR)+1,2,0))
       *IF EMPTY(ARR2[13]) =.F.
       *  XMC_F=A_M_NAME[12,3]
       *  @ PROW(),ARR2[13] SAY M&XCNR	PICT "&XMC_F"
       *  XN_TOTW=XN_TOTW + M&XCNR
       *ENDIF
       *
       *@ PROW(),ARR2[kind+2] SAY XN_TOTW  PICT "99999"
       if F7_ACT=1
	 SKIP
       else
	 exit
       endif
     ENDDO
     *@ PROW()+1,1  SAY "-------------------------------------------------------------------------------"
     *@ PROW()+1,1  SAY "---------------------------------------------------------------------------------------------------
     @ PROW()+1,1  SAY " "
     @ PROW()+1,1  SAY " "
     SET DEVI TO SCRE
     GOTO  REC_OLD
     SET CONS ON
     F7_ACT=0
   ENDIF
   RETU

#else
**-----------------------------------------------------------------------------
PROCEDURE  PNT_RATEN
PARAMETERS  KEY_NO,xRET_DNX ,P3
&&  static sIndexp:=0	 && move  to _brow
&&  static PNT_RECX[2]
&&  &&xtmp1=space(ratno_wid)
&&  static sRatiox1 :="                 "
&&  static sRatiox2 :="                 "

xretupgm=1
IF KEY_NO =K_F7  .OR.	KEY_NO =K_F8
  xretupgm=0
ENDIF

IF  sIndexp =0	  .OR.	sIndexp >2
   sIndexp=1
   sRatiox1= space(ratno_wid)
   sRatiox2= space(ratno_wid)
ENDIF
xdatamdy=" "
&&  if	empty(PNT_RECX[1])
&&     PNT_RECX[1]=-1
&&  ENDIF
&&  If	empty(PNT_RECX[2])
&&     PNT_RECX[2]=-1
&&  ENDIF
&&  if	empty(sRatiox1)
&&     sRatiox1= space(ratno_wid)
&&  endif
&&  if	empty(sRatiox2)
&&     sRatiox2= space(ratno_wid)
&&  endif
IF KEY_NO=K_F9	.AND.	STAR=0
  xd_wno=fSelectNo()
   SELE 2
   REC_OLD=RECNO()
   if .NOT.  EOF()
     ixc=str(sIndexp,1,0)
     sRatiox&ixc=SUBSTR(SPACE(ratno_wid)+ALLTRIM(RATNO),-ratno_wid,ratno_wid)
     if sIndexp=1
       sRatiox1=SUBSTR(SPACE(ratno_wid)+ALLTRIM(RATNO),-ratno_wid,ratno_wid)
     else
       sRatiox2=SUBSTR(SPACE(ratno_wid)+ALLTRIM(RATNO),-ratno_wid,ratno_wid)
     endif
   ENDIF
    SET COLOR TO W+ / &C1
   @ 21,0 CLEA TO 22,79
   @ 22,2 SAY "¦C¦L³¡¥÷:±q°t¤ñ< " + sRatiox1  +" > ¦Ü°t¤ñ< " +sRatiox2 + " >¤î(§t) "
   xxloop=1
   while xxloop=1
     SET COLOR TO GR+ / &C1
     IF PNT_RECX[1]>0  .AND. PNT_RECX[2]>0
       @ 21,12 SAY "F6-¦C¦L  ESC-¨ú®ø"
     ELSE
       @ 21,12 SAY "         ESC-¨ú®ø"
     ENDIF
     SET COLOR TO &C7/ &C1
     ixc=str(sIndexp,1,0)
     if sIndexp=1
	xpos1=19
       xdatamdy =sRatiox1
     else
	xpos1=35
       xdatamdy =sRatiox2
     endif
     xnstp1=NREAD(22,xpos1,xdatamdy,ratno_wid," ","F")
     xdatamdy=substr(space(12) +alltrim(CHRN),-ratno_wid,ratno_wid)
     PNT_RECX[sIndexp]=-1
     IF  EMPTY(ALLTRIM(xdatamdy))=.F.
       SELE 2
       LOCA  FOR ALLTRIM(RATNO)==ALLTRIM(xdatamdy)
       IF EOF()
	 xdatamdy =SPACE(ratno_wid)
       ELSE
	 PNT_RECX[sIndexp]=RECNO()
       ENDIF
     ENDIF
     if sIndexp=1
       sRatiox1 =xdatamdy
     else
       sRatiox2 =xdatamdy
     endif
     do case
     case  xnstp1=13
       sIndexp =sIndexp +1
       if sIndexp >2
	  sIndexp =1
       endif
       @ 22,xpos1  say	xdatamdy
     case xnstp1=23  .OR. xnstp1=K_ESC
       xxloop=0
       sIndexp=0
       xRET_DNX[3]=xnstp1
       @ 22,xpos1  say	xdatamdy
     case xnstp1=5 .or. xnstp1=24 .or.xnstp1=18 .or. xnstp1=3
       xxloop=0
       xRET_DNX[3]=xnstp1
       SET COLOR TO GR+ / &C1
       @ 21,12 SAY "F9-¿ï¾Ü¦C¦L³¡¥÷°t¤ñ  ESC-¨ú®ø"
       SET COLOR TO &C7 / &C1
     case  xnstp1=K_F6
       xxloop=0
       IF PNT_RECX[1]>0  .AND. PNT_RECX[2]>0
	 xretupgm=0
	 sIndexp=0
	 KEY_NO =K_F6
	 IF PNT_RECX[1] > PNT_RECX[2]
	    xtmp=PNT_RECX[1]
	    PNT_RECX[1] =PNT_RECX[2]
	    PNT_RECX[2] =xtmp
	 endif
       endif
     endcase
   end while
   if  xretupgm=1
     goto  REC_OLD
     sele &xd_wno
   ENDIF
ENDIF
if  xretupgm=1
  RETU
ENDIF



x= RDLPT(val(aport)-1)
xd_wno=fSelectNo()
if     (x= 128 )  .or. (x= 144 ) .or. (x= pnt_redy_code )
  SETETSP(APORT)
  SetPntWx("7")
  &&@  PROW(),0  SAY  "~L15;"
  @ PROW()+3,3	SAY "¤é´Á:"
  @ PROW(),8  SAY DATE()
  *@ PROW()+1,1 SAY "NO.  ¥Û¢° ¥Û¢± ¥Û¢² ¬â¢° ¬â¢±  Á`­« ²M¤ô ¦B¤ô ¤ôªd1 ¤ôªd2 ¤ôªd3 ÃÄ¾¯¢° ÃÄ¾¯¢±"
  *ppp
  &&XTIT="°t¤ñ¥N¸¹  "
  ARR1 :=ARRAY(kind+2)
  ARR2 :=ARRAY(kind+2)
  if ratno_wid >8
    ARR1[1]=substr("°t¤ñ¥N¸¹         ",1,ratno_wid)
  else
    ARR1[1]="°t¤ñ¥N¸¹"
  endif
  XTIT=ARR1[1]
  XN_TITL=0
  ARR2[1]=1
  FOR I=1 TO gs_tot +uwc_tot
    IF EMPTY(A_M_NAME[I,3]) =  .F.
      ARR1[I+1] = A_M_NAME[I,17]
      IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
	ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
      ENDIF
      &&ARR2[I+1]=ARR2[I] + LEN(ARR1[I]) +1
      ARR2[I+1]=ARR2[I] + LEN(ARR1[I]) +1
      IF  I=GS_TOT  +1
	ARR2[kind+1]=ARR2[I+1]
	*ARR1[I+1] :=" Á`­« " + ARR1[I+1]
	XTIT=XTIT +" Á`­« "
	ARR2[I+1]=ARR2[I+1] +6
      ENDIF
      XTIT=XTIT +" " + ARR1[I+1]
    ENDIF
  NEXT

  @ PROW()+1,1 SAY  XTIT
  @ PROW()+1,1	SAY "----------------------------------------------------------------------------------------------"

  SELE 2
  REC_OLD=RECNO()
  if KEY_NO=K_F7
    GOTO TOP
  elseif KEY_NO=K_F6
    GOTO PNT_RECX[1]
  endif
  DO WHILE .NOT. EOF()
    XN_TOTW=0
    XCNR="1"
    @ PROW()+1,1 SAY RATNO
    FOR  CNR=1	TO  GS_TOT+UWC_TOT
      XCNR=ALLTRIM(STR(CNR,3,0))
      T_CB=ARR_TYPE[CNR+1]
      *@ PROW(),ARR_DSPN[CNR+1] SAY M&XCNR  PICT "&T_CB"
      @ PROW(),ARR2[CNR+1] SAY M&XCNR  PICT "&T_CB"
      XN_TOTW=XN_TOTW + M&XCNR
    NEXT
    *@ PROW(),ARR_DSPN[GS_TOT+UWC_TOT+2] SAY XN_TOTW  PICT "99999"
    @ PROW(),ARR2[GS_TOT+1]+4 SAY XN_TOTW  PICT "99999"
    @ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------"
    if KEY_NO=K_F7
      SKIP
    elseif KEY_NO=K_F8
      exit
    elseif KEY_NO=K_F6
      SKIP
      IF RECNO()>  PNT_RECX[2]
	exit
      ENDIF
    endif
  ENDDO
  *@ PROW()+1,1  SAY "----------------------------------------------------------------------------------------------"
  @ PROW()+1,1	SAY " "
  @ PROW()+1,1	SAY " "
  SET DEVI TO SCRE
  GOTO	REC_OLD
  SET CONS ON
  F7_ACT=0
ENDIF
sele &xd_wno
sIndexp=0
RETU

#endif


&&-----------------------------------------------------------------------------

FUNCTION   CHG_WADJ_CN
PARAMETERS  INDEX,K_CODE,NMIN,NMAX
  INDEX_S=INDEX
  WAdjCur(water_input,INDEX,0)
  IF K_CODE=K_LEFT
     INDEX=INDEX -1
     IF INDEX <  NMIN
       INDEX=NMAX
     ENDIF
  ELSEIF K_CODE=K_RIGHT
     INDEX=INDEX +1
     IF INDEX >  NMAX
       INDEX=NMIN
     ENDIF
  ENDIF
  IF  INDEX_S <>  INDEX
    xd_wno=fSelectNo()
    SELE  5
    goto 33
    IF PA14=42
      GOTO 42
    ENDIF
    icx=alltrim(str(gs_tot+1,2,0))
    REPL pa&icx  WITH INDEX
    COMMIT
    sele &xd_wno
  ENDIF
  WAdjCur(water_input,INDEX,14)
  SET COLOR TO W+ / &C1
   #ifdef  dfTLU16
     @	1,UPTANK[5,1]-2  SAY WATER_INC[INDEX]  PICT "99.9"
     @	1,UPTANK[5,1]+2  SAY "%"
   #else
     @	4,A_M_NAME[INDEX,13]   SAY    WATER_INC[INDEX]	PICT "99.9"
   #endif
  SET COLOR TO &C2 / &C1
RETU   INDEX
&&--------------------------------- --------------------------------------------
FUNCTION   CHG_WATER_INC
PARAMETERS  INDEX,K_CODE,_WATER_INC,Min
   if water_input =0
       return
   endif
   DO  CASE
   CASE  K_CODE= K_PLUS
	 _WATER_INC[INDEX] = _WATER_INC[INDEX] +  0.1
   CASE  K_CODE= K_MINU
	 _WATER_INC[INDEX] = _WATER_INC[INDEX] -  0.1
   CASE  K_CODE= K_EQU
	 _WATER_INC[INDEX] = _WATER_INC[INDEX] +  0.1
   CASE  K_CODE= K_DASH
	 _WATER_INC[INDEX] = _WATER_INC[INDEX] -  0.1
   ENDCASE
   IF	  _WATER_INC[INDEX] < Min && 0
     _WATER_INC[INDEX] = Min && 0
   ELSEIF    _WATER_INC[INDEX] >30
     _WATER_INC[INDEX] = 30
   ENDIF
   xd_wno=fSelectNo()
   SELE  5
   goto 33
   IF PA14=42
     GOTO 42
   ENDIF
   icx=alltrim(str(INDEX,2,0))
   REPL pa&icx	WITH _WATER_INC[INDEX]
   COMMIT
   sele &xd_wno
   SET COLOR TO W+ / &C1
   #ifdef  dfTLU16
     && @  4,A_M_NAME[INDEX,13]   SAY	 _WATER_INC[INDEX]  PICT "99.9"
     @	1,UPTANK[5,1]-2  SAY _WATER_INC[INDEX]	PICT "99.9"
     @	1,UPTANK[5,1]+2  SAY "%"
   #else
     @	4,A_M_NAME[INDEX,13]   SAY    _WATER_INC[INDEX]  PICT "99.9"
   #endif
   SET COLOR TO &C2 / &C1
   SHOW_W_ADJ(INDEX,_WATER_INC )
RETURN
&&--------------------------------- --------------------------------------------
FUNCTION   SHOW_W_ADJ
PARAMETERS  INDEX_sw,sw_WATER_INC
  if star=1
    sw_stp=stp_a[INDEX_sw]
    _chc=alltrim(str(index_sw,2,0))
    IF	(A_PRESS_N0[L_PRESS,STPN&_chc,index_sw,8] >0)
      w11=int(A_PRESS_N0[L_PRESS,STPN&_chc,index_sw,8] * sw_WATER_INC[INDEX_sw]/100)
      XMC_F=A_M_NAME[index_sw,3]
      SET COLOR TO w / &C1
      @  A_M_NAME[INDEX_sw,23],A_M_NAME[INDEX_sw,13]  SAY  A_PRESS_N0[L_PRESS,STPN&_chc,index_sw,8] +W11   PICT "&XMC_F"
      SET COLOR TO &C2 / &C1
      WATER_CHG=1
    ENDIF


  endif
RETURN
&&--------------------------------- --------------------------------------------
FUNCTION   S_GET_MIX_DATA
PARAMETERS  P1
   mix_data :=ARRAY(gs_tot + uwc_tot + 1)
   XOK= GET_MIX_DATA(ARATNO,AVUSE,@mix_data )
   *PARAMETERS	_ARATNO,_AVUSE,STOR_A
   if xok>0
      xok=1
      for xloop=1   to	 gs_tot +uwc_tot
	 if (stp_a[xloop])>0
	    xok=0
	    exit
	 endif
      next
      if xok=1
	 set  color   to  gr+ /   &c1
	 for xloop=1   to   gs_tot +uwc_tot
	   XN2=A_M_NAME[xloop,3]
	   @  A_M_NAME[xloop,23],A_M_NAME[xloop,13]   SAY    mix_data[xloop]  PICT   "&xn2"
	 next
	 set  color   to  &c2  /   &c1
      endif
   endif
RETURN
&&--------------------------------- --------------------------------------------
FUNCTION   change_tot_d
PARAMETERS  A_N,DIMS,DIMT
FOR XAN1=1 TO  19
  A_N[XAN1,DIMT] :=A_N[XAN1,DIMS]
NEXT
  A_N[21,DIMT] :=A_N[21,DIMS]
  A_N[22,DIMT] :=A_N[22,DIMS]
RETURN
&&--------------------------------- --------------------------------------------
PROCEDURE  RST_MDY_RCPB
PARAMETERS  A_RCPB,_RST
  IF _RST=0
    A_RCPB[1]=0
  ENDIF
  IF A_RCPB[1]=0
    A_RCPB[1]=0
    A_RCPB[2]=SPACE(10)   &&RATNO
    A_RCPB[3]="M1"
    A_RCPB[4]=-1  &&°t¤ñ­«
    @ 18,11   SAY DISKVOL
    @ 18,18   SAY "000  "
  ELSE
    XC=SPACE(10)+ALLTRIM(A_RCPB[2])
    @ 18,11   SAY SUBSTR(XC,-6,6)
    if	 A_RCPB[4]-int(A_RCPB[4]) =0
      @ 18,18	SAY A_RCPB[4]  PICT "     "
      @ 18,18	SAY A_RCPB[4]  PICT "9999"
    else
      @ 18,18	SAY A_RCPB[4]  PICT "99.99"
    endif
  ENDIF
RETURN

PROCEDURE  INI_PNTER
PARAMETERS  C_PORT,x_plus
x_plus=0
x=rdnB_data(HEXTODEC("6A6"))
IF CHR(X) <>"R"
  SET_DB(HEXTODEC("6A6"),ASC("R"))
  x_plus=bpnt_plus
ENDIF
RETURN
&&-----------------------------------------------------------------------------
PROCEDURE  DEL_MEM
PARAMETERS  P1,P2,P3
RELEASE   PZA,PZB,PZC,PZD,PZE,PZF,PG,PZH,PZI
RELEASE   ZA,ZB,ZC,ZD,ZE,ZF,ZG,ZH,ZI
RELEASE ALL LIKE  POVKG*
RELEASE ALL LIKE  SPOVKG*
RELEASE ALL LIKE  MOVKG*
RELEASE ALL LIKE  SMOVKG*
RELEASE ALL LIKE  fwa*
RELEASE ALL LIKE  fwb*
RELEASE ALL LIKE  fwb*
RELEASE ALL LIKE  fwd*
RELEASE ALL LIKE  fwe*
RELEASE ALL LIKE  fwf*
RELEASE ALL LIKE  fwg*
RELEASE ALL LIKE  fwh*
RELEASE ALL LIKE  rwa*
RELEASE ALL LIKE  rwb*
RELEASE ALL LIKE  rwb*
RELEASE ALL LIKE  rwd*
RELEASE ALL LIKE  rwe*
RELEASE ALL LIKE  rwf*
RELEASE ALL LIKE  rwg*
RELEASE ALL LIKE  rwh*
RELEASE  SDRA,SDRB,SDRC,SDRD,SDE,SDRF,SDRG,SDRH
RELEASE  _tot_d_a
release  PWATER1,PWATERs1,PWATERs2,PWATER0,totank,totank1,totank2,totank3,totank4,totank5,totank6,totank7,totank0
release    STP1,STP2,STP3,STP4,STP,STP5,STP6,STP7,STP8
release gs_adj ,gs_adjw
RELEASE  draf,drbf,DRCF,DRDF,DREF,DRFF,DRGF,DRHF,DFMF,DRTKF
RELEASE  HIF1,HIF2,HIF3,HIF4,HIF5,HIF6,HIF7,HIF8,HI1,HI2,HI3,HI4,HI5,HI6,HI7,HI8




RETURN
&&-----------------------------------------------------------------------------
PROCEDURE  Read_dbf
PARAMETERS  xselno,xrdrec,xfield
  xrd_wno=fSelectNo()
  xrd_recno=recno()
  sele	&xselno
  goto xrdrec
  xrtn=&xfield
  sele &xrd_wno
  goto xrd_recno
RETURN xrtn
&&-----------------------------------------------------------------------------
FUNCTION   D_STRO
PARAMETERS Y1_N,X1_N,YL_N,XTYPE
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
ARR1 :={" °t¤ñ¥N¸¹   "," ±j «×     ","§~«×","²É®Æ "," ³Æ   µù                        "}
ARR2 :={"RATNO","S_STRO","S_TANDO","S_MAX","DETAIL"}
XC3=FSUBSTR("!!!!!!!!!",-ratno_wid,"!",0)
*ARR3 :={"!!!!!!!!!","!!!!!!!!!","999","!!!!","##############################"}
ARR3 :={XC3,"!!!!!!!!!","999","!!!!","##############################"}
ARR4 :={0,0,0,0,0,0,0,0,0,0,0,0,0}
RET_X1=SPACE(4)
xd_wno=fSelectNo()
sele 2
goto top
if  BOF()
  APPE BLANK
ENDIF
n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
P_FUNC2=""
ARR_PCS={" "," "," "," "," "," "," "," "," "," "," "," "}
*_GET_BROW(19,3,4,5,ARR1,ARR2,ARR3,"_DMAKE1","2","Y",.T.,.F.)
_GET_BROW(Y1_N,X1_N,YL_N,5,ARR1,ARR2,ARR3,"_DMAKE1","2",XTYPE,.T.,.F.)
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9
SET COLOR TO &C7 +/ &C1
sele &xd_wno
retu
&&-----------------------------------------------------------------------------
FUNCTION AdjSetWeiAd	&& ­p¶q­«¶q­×§ï  &&**2015.9.31**
PARAMETERS  xSTP_FN,xWadjkG
IF  (STP_a[xSTP_FN] =3)
  xSTP_FC=LTRIM(STR(xSTP_FN,2,0))
  xad=xWadjkG * 2048/A_M_NAME[xSTP_FN,10]
  ADJW12(xSTP_FN-1,xad)
endif
RETU
&&-----------------------------------------------------------------------------
FUNCTION  Get_Rand_w
PARAMETERS  XIndex,xw_source
  wret=-1
  if standw2_err[xindex]>0
     if xw_source>0
       &&err_maxw=2* xw_source	* standw2_err[xindex]
       &&XEN=Get_RAND_ERR(w_std,XERR,"999")
       xdeci=a_m_name[xindex,3]
       xerr=standw2_err[xindex]
       wret=Get_RAND_ERR(xw_source,XERR,xdeci)
       wret=wret +xw_source
     else
       wret=0
     endif
  endif
RETU	wret
&&--------------------------------------------
FUNCTION   RW_WAadj  && (xIndex,isRWall,isRead)
PARAMETERS  xIndex,isRWall,isRead

  xlen=6
  goto 33
  if PA14=42
    XLEN=INT(PA15)
    GOTO 42
  ENDIF

  if isRWall =1
    xs=1
    xend=xlen
  else
    xs=xIndex
    xend=xIndex
  ENDIF
  FOR Iw=xs TO xend
    IX_C=ALLTRIM(STR(Iw,2,0))
    if isRead=1
      WATER_INC[Iw] :=PA&IX_C
    else
      PA&IX_C=WATER_INC[Iw]
    endif
  next
  IF isRead=0
     commit
  endif
RETU

**-----------------------------------------------------------------------------
&& .prg last








#ifdef	dfRaten_2Page



&&----raten_pr-----------------------------------------------------------------
PROCEDURE  RATEN
PARAMETERS  P1,BisDataChg,ActNo,P4
&&RAMETERS  P1,P2,P3
   IF EMPTY(ActNo)=.T.
     ActNo="2"
   ENDIF
     ActNo_N =VAL(ActNo)
dspe_mixamp=0
c_top2=""
*_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
*ARR1 :={" NO. ","¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±"," Á`­« ²M¤ô","¦B¤ô","¤ôªd1","¤ôªd2","¤ôªd3","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
*pppK
ARR1 :=ARRAY(kind+3)
ARR2 :=ARRAY(kind+3)
ARR3 :=ARRAY(kind+3)
ARR4 :=ARRAY(kind+3)
ARR_PCS :=ARRAY(kind+3)
if ratno_wid <9
  ARR1[1]="°t¤ñ" +  space(ratno_wid-4)

else
  ARR1[1]="°t¤ñ¥N¸¹" +space(ratno_wid-7)

endif
ARR1[1]=ARR1[1] + " Á`­« "
ARR1[gs_tot +uwc_tot+ 2]="°®©Õ¬í¼Æ"
&&ARR1[gs_tot +uwc_tot+ 2]=""

XN_TITL=0
FOR I=1 TO  gs_tot +uwc_tot
  IF EMPTY(A_M_NAME[I,17]) <> .T.
    XN_TITL=XN_TITL+1
  ENDIF
  ARR1[I+1] :=A_M_NAME[I,17]
  IF (LEN(ARR1[I+1]) < LEN(A_M_NAME[I,3]) )
    ARR1[I+1]=SPACE(LEN(A_M_NAME[I,3])-LEN(ARR1[I+1]))+ARR1[I+1]
  ENDIF
     *IF  I=GS_TOT  +1
     *	ARR1[I+1] :="Á`­« " + ARR1[I+1]
     *ENDIF
NEXT
&& ARR2 :={"RATNO","M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11","M12","M13","M14","M15"}
ARR2[1] :="RATNO"
ARR2[gs_tot +uwc_tot+2] :="MIXSEC"
xcx=""
for _xcnt=1   to  ratno_wid
xcx=xcx+"!"
next
&&ARR3 :={xcx,"9999","9999","9999","9999","9999","9999","999","999","999","999","999","999",,"99.99","99.99","99.99"}
ARR3[1] :=XCX
ARR3[gs_tot +uwc_tot+ 2] :="99"
ARR_PCS[1] :="dSP_TOTW"
FOR I=1 TO  gs_tot +uwc_tot
  ARR2[I+1] :="M" + ALLTRIM(STR(I))
  ARR3[I+1] :=A_M_NAME[I,3]
  ARR_PCS[I+1] :="dSP_TOTW"
NEXT

SELE 5
USE
USE PAR1
FOR I=1 TO GS_TOT +UWC_TOT
  IX_C=ALLTRIM(STR(I,2,0))
  GOTO 20
  ARR3[I+1] :=ALLTRIM(PA&IX_C)
NEXT
USE
USE PAR

*ARR4 :={0,0,0,0,0,0,0,0,0,0,0,2,2}
ARR4[gs_tot +uwc_tot+ 2]=0
FOR I=1 TO kind
  IF EMPTY(A_M_NAME[I,3]) <> .T.
    XX_DE:=A_M_NAME[I,3]
    XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
    IF XX_DE=0
      ARR4[I+1] :=0
    ELSE
      ARR4[I+1] :=XX_DE-1
    ENDIF
  ENDIF
NEXT
    &&TW_DSPX=2
    &&FOR I=1  TO  GS_TOT +1
    &&	TW_DSPX=TW_DSPX + 1 + LEN(ARR1[I])
    &&NEXT
TW_DSPX= LEN(ARR1[1])-5

&& ARR_PCS :={"dSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW" }
RET_X1=SPACE(4)
C_TOP1="F7-¦C¦L F8-¦C¦L¥»µ§ "
F7_FUNC="PNT_RATEN"
C_TOP2=""
F8_FUNC="PNT_RATEN"
if SECR[2]=1
  F3_FUNC="GET_SECRE"
C_TOP1="F7-¦C¦L F8-¦C¦L¥»µ§ F3-"
ENDIF
xd_wno=fSelectNo()
//sele 2

IF EMPTY(ActNo)=.T.
    ActNo="2"
ENDIF
    ActNo_N =VAL(ActNo)
   sele &ActNO_N


goto top
if  BOF()
  APPE BLANK
  ENDIF
n_rec=recno()
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13
P_FUNC0="dsp_totw"
DLA_DSP=0
xposn=3
&&if  kind >=14
if  kind >=13
  xposn=0
endif
IF  STAR=0
  IF SECR[2]=0
    &&_GET_BROW(3,xposn,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
    &&_GET_BROW(3,xposn,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.)
    _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"P",.T.,.T.,@BisDataChg)
  ELSE
    &&_GET_BROW(3,xposn,18,XN_TITL+2,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.)
    _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"N",.T.,.T.,@BisDataChg)
  ENDIF
ELSE
  DLA_DSP=1
  IF SECR[2]=0
    _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"Y",.T.,.T.,@BisDataChg)
  ELSE
    _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"N",.T.,.T.,@BisDataChg)
  ENDIF
ENDIF
DLA_DSP=1
STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13
STOR " "  TO C_TOP1,F3_FUNC,F7_FUNC,F8_FUNC
SET COLOR TO &C7 +/ &C1
dspe_mixamp=1
sele &xd_wno
retu
&&-----------------------------------------------------------------------------


#else

   &&-----------------------------------------------------------------------------
   && PROCEDURE  RATEN
   FUNCTION   RATEN
   PARAMETERS  P1,BisDataChg,ActNo,P4
   IF EMPTY(ActNo)=.T.
     ActNo="2"
   ENDIF
     ActNo_N =VAL(ActNo)
   BisDataChg =0
   dspe_mixamp=0
   c_top2=""
   *_GET_BROW(Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,N_SELE,_MODI)
   *ARR1 :={" NO. ","¥Û¢°","¥Û¢±","¥Û¢²","¬â¢°","¬â¢±"," Á`­« ²M¤ô","¦B¤ô","¤ôªd1","¤ôªd2","¤ôªd3","ÃÄ¾¯¢°","ÃÄ¾¯¢±"}
   *pppK
   ARR1 :=ARRAY(kind+3)
   ARR2 :=ARRAY(kind+3)
   ARR3 :=ARRAY(kind+3)
   ARR4 :=ARRAY(kind+3)
   && ARR1[1]="°t¤ñ" +  space(ratno_wid-4)
   ARR1[1]="°t¤ñ"
   && ARR1[GS_TOT +UWC_TOT +2]=" Á`­«"
   XN_TITL=0
   XN_TITL=GS_TOT+UWC_TOT
   ARR2 :={"RATNO","M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11","M12","M13","M14","M15"}
   xcx=""
   for _xcnt=1	 to  ratno_wid
     xcx=xcx+"!"
   next
   ARR3 :={xcx,"9999","9999","9999","9999","9999","9999","999","999","999","999","999","999",,"99.99","99.99","99.99"}
   ARR3[GS_TOT +UWC_TOT +2]=9999
   SELE 5
   USE
   USE PAR1
   FOR I=1 TO GS_TOT +UWC_TOT
     IX_C=ALLTRIM(STR(I,2,0))
     GOTO 20
     ARR3[I+1] :=ALLTRIM(PA&IX_C)
     GOTO 16
     XC=RTRIM(PA&IX_C)
     IF I=GS_TOT +1
       XLEN=LEN(XC)
       XLEN1=LEN(ARR3[I+1])+1
       IF XLEN<XLEN1
	 XC=SPACE(XLEN1-XLEN) +XC
       ENDIF
       ARR1[I+1] :=" Á`­«"+XC
     ELSE
       ARR1[I+1] :=XC
     ENDIF
   NEXT
   SELE 5
   USE
   USE PAR
   *ARR4 :={0,0,0,0,0,0,0,0,0,0,0,2,2}
   FOR I=1 TO kind
     IF EMPTY(A_M_NAME[I,3]) <> .T.
       XX_DE:=A_M_NAME[I,3]
       XX_DE=LEN(XX_DE)- LEN(ALLTRIM(STR(INT(VAL(XX_DE)),8,0)))
       IF XX_DE=0
	 ARR4[I+1] :=0
       ELSE
	 ARR4[I+1] :=XX_DE-1
       ENDIF
     ENDIF
   NEXT
   TW_DSPX=2
   FOR I=1  TO	GS_TOT +1
     TW_DSPX=TW_DSPX + 1 + LEN(ARR1[I])
   NEXT
   ARR_PCS :={"dSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW","DSP_TOTW" }
   RET_X1=SPACE(4)
   C_TOP1="F7-¦C¦L¥þ³¡ F8-¦C¦L¥»µ§ F9-¦C¦L³¡¤À"
   F7_FUNC="PNT_RATEN"
   C_TOP2=""
   F8_FUNC="PNT_RATEN"
   if SECR[2]=1
     F3_FUNC="GET_SECRE"
     C_TOP1="F7-¦C¦L¥þ³¡ F8-¦C¦L¥»µ§ F9-¦C¦L³¡¤À F3-"
   ENDIF
   xd_wno=fSelectNo()
   && sele 2
   sele &ActNO_N
   goto top
   if  BOF()
     APPE BLANK
     ENDIF
   n_rec=recno()
   STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13
   P_FUNC0="dsp_totw"
   DLA_DSP=0
   xposn=3
   if  kind >=14
     xposn=0
   endif
   F9_FUNC="PNT_RATEN"
   && BisDataChg=0
   IF  STAR=0
     IF SECR[2]=0
      &&  _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","P",.T.,.T.,@BisDataChg)
       _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"P",.T.,.T.,@BisDataChg)

     ELSE
      &&  _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.,@BisDataChg)
       _GET_BROW(3,xposn,18,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"N",.T.,.T.,@BisDataChg)
     ENDIF
   ELSE
     DLA_DSP=1
     IF SECR[2]=0
       && _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","Y",.T.,.T.,@BisDataChg)
       _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"Y",.T.,.T.,@BisDataChg)
     ELSE
       && _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1","2","N",.T.,.T.,@BisDataChg)
       _GET_BROW(14,xposn,10,XN_TITL+1,ARR1,ARR2,ARR3,"_DMAKE1",ActNo,"N",.T.,.T.,@BisDataChg)
     ENDIF
   ENDIF
   DLA_DSP=1
   STOR " " TO P_FUNC0,P_FUNC1,P_FUNC2,P_FUNC3,P_FUNC4,P_FUNC5,P_FUNC6,P_FUNC7,P_FUNC8,P_FUNC9,P_FUNC10,P_FUNC11,P_FUNC12,P_FUNC13
   STOR " "  TO C_TOP1,F3_FUNC,F7_FUNC,F8_FUNC
   SET COLOR TO &C7 +/ &C1
   dspe_mixamp=1
   sele &xd_wno
   retu


#endif

#ifdef	dfRaten_2Page


   &&---------------------------------------------------------------------------------------------------
   FUNCTION _GET_BROW
   PARAMETERS  Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,Nb_SELE,_MODI,MDYPAGE,DELREC,isDataChg
   IF _MODI="Y"
     STOR 0 TO FIST_REC,LAST_REC
   ENDIF
   item_max=0
   item_ofsa=0
   _DATA_MODIFY =0
   X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+YL_N,79)
   XCOR=SETCOLOR()
   XXP=LEN(C_TOP2)+1
   IF EMPTY(C_TOP2)=.T.
   XXP=0
   ENDIF
   PUBLIC   ARR_DSPN
   ARR_DSPN=ARRAY(kind +3)
   AFILL(ARR_DSPN,0)
   stor 0 to   sIndexp
   XX=X1_N+XXP +1+LEN(ARR_TITLE[1])
   if f3_run=-1
       ARR_DSPN[1] :=0
   else
       ARR_DSPN[1] :=XX -1-LEN(ARR3[1])
   endif
   X=2
   *XX=X1_N+XXP
   if x1_n >1
     D_C=ALLTRIM(C_TOP2) +" "
   else
     d_c=""
   endif
   D_C=D_C +ARR_TITLE[1]+" "
   DO WHILE  X <=  TIT_N
     *XX=XX+1+LEN(ARR_TITLE[X])
     xp=1
     xspace=" "
     if ( LEN(ARR_TITLE[X]) > len(arr_type[x]))  .and. x <> gs_tot+2
       xp=0
     xspace=""
     endif
     XX=XX+xp+LEN(ARR_TITLE[X])
     *AADD(ARR_DSPN,XX -LEN(ARR3[X])-1)
      ARR_DSPN[x]=XX -LEN(ARR3[X])-1
      if ARR_DSPN[X] + LEN(ARR_TYPE[X]) >79
	 IF ITEM_MAX=0
	    ITEM_MAX=X-1
	    ARR_DSPN[x]= ARR_DSPN[2]
	    XX=ARR_DSPN[x] +xp +LEN(ARR_TITLE[X])
	 ENDIF

      ENDIF
     *X=X+1
     D_C=D_C +ARR_TITLE[X]
     X=X+1
     IF X <= TIT_N
       D_C=D_C +xspace
     ENDIF
   ENDDO
   IF item_max=0
      item_max=TIT_N
   ENDIF
   *ARR_DSPN[gs_tot+uwc_tot+3]=0
   *IF EMPTY(ARR_DSPN[gs_tot+1])=.F.  .AND.  EMPTY(ARR3[gs_tot])=.F.
   *  ARR_DSPN[gs_tot+uwc_tot+2]=ARR_DSPN[gs_tot+1]+LEN(ARR3[gs_tot])+1
   *ENDIF
   *X=1
   *D_C=ALLTRIM(C_TOP2) +" "
   *DO WHILE  X <=  TIT_N
   *  D_C=D_C +ARR_TITLE[X]
   *  X=X+1
   *  IF X <= TIT_N
   *	D_C=D_C +" "
   *  ENDIF
   *ENDDO
   DC_L=LEN(D_C)
   SET DEVI TO SCRE
   X_C2=" Pg-Wown Up¤W¤U­¶ Enter¿ï¾Ü "
   IF  (_MODI="Y") .OR. (_MODI="K")
     X_C1="¡ô¡õ¤W¤Uµ§ F10-§R°£ Esc¸õÂ÷"
   ELSE
     X_C1="¡ô¡õ¤W¤Uµ§ Esc¸õÂ÷ "
   ENDIF
   IF (FIST_REC<>0).AND. (FIST_REC=LAST_REC)
     X_C1=" ¡ô¡õ-­×§ï Esc¸õÂ÷ "
     X_C2=""
   ENDIF
   IF ITEM_MAX <> TIT_N
      X_C2= "Ctrl¡÷¥k­¶ Ctrl¡ö¥ª­¶"
   ENDIF
   IF EMPTY(C_TOP1)= .F.
     x_c2=c_top1 +x_c2
   ENDIF
   X=LEN(X_C1)
   IF X>DC_L
     XX=INT((X-DC_L)/2)
   ELSE
     XX=0
   ENDIF
   SET COLOR TO GR+ / BL
   *@ Y1_N-1,X1_N-2-XX	CLEA TO Y1_N+YL_N+1,X1_N + DC_L +2 +XX
   @ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+YL_N+1,X1_N + DC_L +1 +XX
   *BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N+1,X1_N + DC_L+XX)
   BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N,X1_N + DC_L+XX)
   SET COLOR TO GR+ / R
   @ Y1_N-1,X1_N  SAY	D_C
   *@ Y1_N+YL_N,X1_N  SAY   SPACE(DC_L)
   IF  DC_L>LEN(X_C1)+LEN(X_C2)+1
     X=LEN(X_C1)+LEN(X_C2)
     *@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C2+" "+X_C1
     @ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2+" "+X_C1
   ELSE
     *@ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C1
     *@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C2
     @ Y1_N+YL_N-1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C1
     @ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2
   ENDIF
   *IF EMPTY(C_TOP1)= .F.
   *  @ Y1_N+YL_N+1,X1_N   SAY	 C_TOP1
   *ENDIF
   SELE &Nb_SELE
   N_YN=Y1_N
   N_REC=1
   *GOTO TOP
   SET COLOR TO W+ / BL
   DO _DSP_ALL
   N_REC=RECNO()
   *N_YN=Y1_N
   *GOTO TOP
   SET COLOR TO B / W+
   _REC_DSP(N_YN,"W+")
   _LOOP_BR=1
   T=0
   DO WHILE _LOOP_BR =1
     IF _MODI="P"
       T=-992
       _MODI="Y"
     ENDIF
     SELE &Nb_SELE
     NS_RECNO=RECNO()
     DO WHILE T=0
       IF T0A <>0
	 T=T0A
	 T0A=0
       ELSE
	 T=INKEY()
       ENDIF
       IF DLA_DSP=1
	 DO DSP2
       ENDIF
       IF T0A=0
	 DO LUSTP
       ENDIF
     ENDDO
     SELE &Nb_SELE
     GOTO NS_RECNO
     DO CASE
     CASE T=K_CTRL_RIGHT  .OR. T=K_CTRL_LEFT
       IF ITEM_MAX <> TIT_N
	 SET COLOR TO GR+ / R
	  if item_ofsa=0
	     item_ofsa=item_max
	     @ Y1_N-1,ARR_DSPN[2]  SAY	 SPACE(80-ARR_DSPN[2])
	     FOR XLOOP3=ITEM_MAX +1 TO TIT_N
	       @ Y1_N-1,ARR_DSPN[XLOOP3]  SAY	ARR_TITLE[XLOOP3]
	     NEXT
	  else
	     item_ofsa=0
	     @ Y1_N-1,X1_N  SAY   D_C
	  endif
       endif
       xN_REC=RECNO()
       xN_YN=N_YN
       SKIP -(N_YN-Y1_N)
       IF BOF()
	 GOTO TOP
       ENDIF
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       N_REC=XN_REC
       N_YN=XN_YN
       GOTO N_REC
       _REC_DSP(N_YN,"W+")
       TNSTP=1
       T=-992
     CASE T=K_F1
       IF  EMPTY(F3_FUNC) =.F.
	 DO &F1_FUNC
       ENDIF
       T=0
     CASE T=K_F3
       IF  EMPTY(F3_FUNC) =.F.
	 DO &F3_FUNC
       ENDIF
       T=0
     CASE T=K_F7
       F7_ACT=1
       IF  EMPTY(F7_FUNC) =.F.
	 F7_ACT=1
	 DO &F7_FUNC with  Nb_SELE
       ENDIF
       T=0
     CASE T=K_F8
       IF  EMPTY(F8_FUNC) =.F.
	 DO &F8_FUNC with  Nb_SELE
       ENDIF
       T=0
     CASE T=K_DEL
       isDataChg=1
       IF  EMPTY(DEL_FUNC) =.F.
	 DO &DEL_FUNC
       ENDIF
       T=0
     CASE T=-992   .AND. (_MODI="Y"  .OR.    _MODI="K"  .OR.    _MODI="1"  )
       &&TNSTP=READ_AN(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
       _GET_STP=1
       DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
	  R_C=ARR_REC_NAME[_GET_STP]
	  T_C=ARR_TYPE[_GET_STP]
	  _D_TYPE=TYPE("&R_C")
	  C_L=LEN(ARR_TYPE[_GET_STP])
	  SET COLOR TO	&12 /&11
	  IF VALTYPE(&R_C)="N"  .AND. &R_C -INT(&R_C) >0
	    *@ N_YN,ARR_DSPN[_GET_STP]	SAY SUBSTR(LTRIM(STR(&R_C,10,2))+SPACE(10) ,1,LEN(T_C))
	    @ N_YN,ARR_DSPN[_GET_STP]  SAY SUBSTR(LTRIM(STR(&R_C))+SPACE(10) ,1,LEN(T_C))
	  ELSE
	    @ N_YN,ARR_DSPN[_GET_STP]  SAY &R_C   PICT "&T_C"
	  ENDIF
	  GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
	  p_func=P_FUNC&GET_STPC
	  X_GETSTP=_GET_STP
	  set  colo  to b  /w
	  _REC_DSP(N_YN,"W")
	  xisdatachg=0
	 _GET_STP=READ_AN(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC",@xisdatachg,Nb_SELE)
	 if  xisdatachg=1
	   isDataChg=1
	 endif


	 IF _GET_STP=99

	   _LOOP_BR=0
	 ENDIF
	 IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	   _ACT_PX=UPPER(_ACT_PX)
	 ELSE
	   &&IF  T_C="9" .AND.  (_ACT_PX >INT(VAL(ARR3[X_GETSTP])) )
	   &&  _ACT_PX =INT(VAL(ARR3[X_GETSTP]))
	   &&ENDIF
	 ENDIF
	 T_C=ARR_TYPE[X_GETSTP]
	 @ N_YN,ARR_DSPN[X_GETSTP]   SAY  _ACT_PX  PICT "&T_C"
	 SELE &Nb_SELE
	 REPL  &R_C  WITH _ACT_PX
	 IF  EMPTY(ARR_PCS[X_GETSTP]) =.F.
	   PCS_CF(N_YN,&R_C,X_GETSTP,RECNO())
	 ENDIF
       ENDDO
       set  colo to  gr + /w
       SELE &Nb_SELE
       GOTO NS_RECNO
       _REC_DSP(N_YN,"W")
       _DATA_MODIFY=1
       IF (_GET_STP !=98)
	 if t=13  .and. (tit_n <> item_max)
	   t=K_CTRL_LEFT
	 else
	   T=0
	 endif
       ENDIF
     CASE T=5
       IF  (_MODI <> "1")
	 UP_DSP1()
       ENDIF
       T=-992
     CASE T=24
       IF  (_MODI <> "1")
       IF  _MODI="Y"    .AND. (_MODI <> "1")
	 SKIP
	 IF  EOF()
	   SKIP -1
	   FOR	X =1 TO TIT_N
	     R_C=ARR_REC_NAME[X]
	     IF EMPTY(&R_C)=.F.
	       APPE BLANK
	       EXIT
	     ENDIF
	   NEXT
	   SKIP
	 ENDIF
	 SKIP -1
       ENDIF
       DOWN_DSP1()
       ENDIF
       T=-992
     CASE T=7 .and.  DELREC=.T.
       isDataChg=1
       DELE
       PACK
       IF  EOF()
	 SKIP -1
	 IF  EOF()
	   APPE BLANK
	 ENDIF
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       GOTO N_REC
       _REC_DSP(N_YN,"W+")
       _DATA_MODIFY =1
       T=0
     CASE T=18	 .AND.	MDYPAGE=.T.
       SKIP -(YL_N +(N_YN-Y1_N))
       IF BOF()
	 GOTO TOP
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       GOTO N_REC
       _REC_DSP(N_YN,"W+")
       T=0
     CASE T=3	 .AND.	MDYPAGE=.T.
       SKIP ((Y1_N+YL_N-N_YN))
       IF EOF()
	 GOTO BOTT
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       GOTO N_REC
       SET COLOR TO GR+ / W+
       _REC_DSP(N_YN,"W+")
       T=0
     CASE T=13
       X=1
       DO WHILE  X <=TIT_N
	 R_C=ARR_REC_NAME[X]
	 XK=ALLTRIM(STR(X,2,0))
	 RET_X&XK=&R_C
	 RET_A[X]=&R_C
	 X=X+1
       ENDDO
       _LOOP_BR=0
       T=0
     CASE T=23 .OR. T=27
       _LOOP_BR=0
       T=0
     otherwise
       T=0
     ENDCASE
   ENDDO
   T=0
   SET COLO TO &XCOR
   MODI_PAGE= .T.
   RESTSCREEN(Y1_N-1,0,Y1_N+YL_N,79,X_G_B)
   RETU


#else
   &&---------------------------------------------------------------------------------------------------
   FUNCTION _GET_BROW
   PARAMETERS  Y1_N,X1_N,YL_N,TIT_N,ARR_TITLE,ARR_REC_NAME,ARR_TYPE,P_FUNC,Nb_SELE,_MODI,MDYPAGE,DELREC,isDataChg
   isDataChg=0
   IF _MODI="Y"
     STOR 0 TO FIST_REC,LAST_REC
   ENDIF
   _DATA_MODIFY =0
   X_G_B=SAVESCREEN(Y1_N-1,0,Y1_N+YL_N,79)
   XCOR=SETCOLOR()
   XXP=LEN(C_TOP2)+1
   IF EMPTY(C_TOP2)=.T.
     XXP=0
   ENDIF
   PUBLIC   ARR_DSPN
   ARR_DSPN=ARRAY(kind +3)
   AFILL(ARR_DSPN,0)

   && mdy_20151114 fot pnt_ratio
   stor 0 to   sIndexp
   && PNT_RECX :=array(2)
   PNT_RECX :={-1,-1}
   store space(ratno_wid) to  sRatiox1,sRatiox2
   RET_DNX ={0,0,0} && {T1,TNSTP,T}
   &&-------------------



   && XX=X1_N+XXP +1+LEN(ARR_TITLE[1])
   && ARR_DSPN[1] :=XX -1-LEN(ARR_TYPE[1])
   && X=2
   && *XX=X1_N+XXP
   if x1_n >1
     D_C=ALLTRIM(C_TOP2) +" "
   else
     d_c=""
   endif
   && D_C=D_C +ARR_TITLE[1]+" "
   && ARR_DSPN[1] :=LEN(D_C)-LEN(ARR_TYPE[1])
   FOR XLOOP=1 TO TIT_N
    XLEN=LEN(ARR_TITLE[XLOOP])
    IF XLOOP >1
      XLEN1=LEN(ARR_TYPE[XLOOP])+1
    ELSE
      XLEN1=LEN(ARR_TYPE[XLOOP])
    ENDIF
    IF XLEN < XLEN1
       ARR_TITLE[XLOOP]=SPACE(XLEN1-XLEN) +ARR_TITLE[XLOOP]
       XLEN=XLEN1
    ENDIF
    IF XLOOP >1
      ARR_DSPN[xLOOP]=ARR_DSPN[xLOOP-1]+LEN(ARR_TYPE[XLOOP-1]) +XLEN -LEN(ARR_TYPE[XLOOP])
    ELSE
      ARR_DSPN[xLOOP]=X1_N + LEN(D_C)+XLEN -LEN(ARR_TYPE[XLOOP])
    ENDIF
    D_C=D_C +ARR_TITLE[XLOOP]
   NEXT


   ARR_DSPN[gs_tot+uwc_tot+2]=0
   IF EMPTY(ARR_DSPN[gs_tot+1])=.F.  .AND.  EMPTY(ARR3[gs_tot])=.F.
     ARR_DSPN[gs_tot+uwc_tot+2]=ARR_DSPN[gs_tot+1]+LEN(ARR3[gs_tot])+1
   ENDIF
   *X=1
   *D_C=ALLTRIM(C_TOP2) +" "
   *DO WHILE  X <=  TIT_N
   *  D_C=D_C +ARR_TITLE[X]
   *  X=X+1
   *  IF X <= TIT_N
   *	D_C=D_C +" "
   *  ENDIF
   *ENDDO
   DC_L=LEN(D_C)
   SET DEVI TO SCRE
   X_C2=" Pg-Down Up¤W¤U­¶ Enter¿ï¾Ü Home²Ä¤@µ§ End³Ì«á¤@µ§  "
   IF  (_MODI="Y") .OR. (_MODI="K")
     X_C1="¡ô¡õ¤W¤Uµ§ F10-§R°£ Esc¸õÂ÷"
   ELSE
     X_C1="¡ô¡õ¤W¤Uµ§ Esc¸õÂ÷ "
   ENDIF
   IF (FIST_REC<>0).AND. (FIST_REC=LAST_REC)
     X_C1=" ¡ô¡õ-­×§ï Esc¸õÂ÷ "
     X_C2=""
   ENDIF
   IF EMPTY(C_TOP1)= .F.
     x_c2=c_top1 +x_c2
   ENDIF
   X=LEN(X_C1)
   IF X>DC_L
     XX=INT((X-DC_L)/2)
   ELSE
     XX=0
   ENDIF
   SET COLOR TO GR+ / BL
   *@ Y1_N-1,X1_N-2-XX	CLEA TO Y1_N+YL_N+1,X1_N + DC_L +2 +XX
   @ Y1_N-1,X1_N-2-XX  CLEA TO Y1_N+YL_N+1,X1_N + DC_L +1 +XX
   *BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N+1,X1_N + DC_L+XX)
   BOX_S(Y1_N-1,X1_N-2-XX,Y1_N+YL_N,X1_N + DC_L+XX)
   SET COLOR TO GR+ / R
   @ Y1_N-1,X1_N  SAY	D_C
   *@ Y1_N+YL_N,X1_N  SAY   SPACE(DC_L)
   IF  DC_L>LEN(X_C1)+LEN(X_C2)+1
     X=LEN(X_C1)+LEN(X_C2)
     *@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C2+" "+X_C1
     @ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C2+" "+X_C1
   ELSE
     *@ Y1_N+YL_N,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C1
     *@ Y1_N+YL_N+1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1	SAY   X_C2
     @ Y1_N+YL_N-1,(X1_N +INT((DC_L*0.5) -(X *.5)))-1  SAY   X_C1
     X_POS=(INT((DC_L*0.5) -(LEN(X_C2)/2)))-1
     IF X_POS <0
	X_POS=0
     ENDIF
     @ Y1_N+YL_N,X1_N + X_POS SAY   X_C2
   ENDIF
   *IF EMPTY(C_TOP1)= .F.
   *  @ Y1_N+YL_N+1,X1_N   SAY	 C_TOP1
   *ENDIF
   SELE &Nb_SELE
   N_YN=Y1_N
   N_REC=1
   *GOTO TOP
   SET COLOR TO W+ / BL
   DO _DSP_ALL
   N_REC=RECNO()
   *N_YN=Y1_N
   *GOTO TOP
   SET COLOR TO B / W+
   _REC_DSP(N_YN)
   _LOOP_BR=1
   T=0
   DO WHILE _LOOP_BR =1
     IF _MODI="P"
       T=-992
       _MODI="Y"
     ENDIF
     SELE &Nb_SELE
     NS_RECNO=RECNO()
     SELE 9
     DO WHILE T=0
       IF T0A <>0
	 T=T0A
	 T0A=0
       ELSE
	 T=INKEY()
       ENDIF
       IF DLA_DSP=1
	 DO DSP2
       ENDIF
       IF T0A=0
	 DO LUSTP
       ENDIF
     ENDDO
     SELE &Nb_SELE
     GOTO NS_RECNO
     DO CASE
     CASE T=K_F1
       IF  EMPTY(F3_FUNC) =.F.
	 DO &F1_FUNC
       ENDIF
       T=0
     CASE T=K_F3
       IF  EMPTY(F3_FUNC) =.F.
	 DO &F3_FUNC
       ENDIF
       T=0
     CASE T=K_F7
       F7_ACT=1
       IF  EMPTY(F7_FUNC) =.F.
	 F7_ACT=1
	 DO &F7_FUNC   with K_F7
       ENDIF
       T=0
     CASE T=K_F8
       IF  EMPTY(F8_FUNC) =.F.
	 DO &F8_FUNC  with K_F8
       ENDIF
       T=0
     CASE T=K_F9
       IF  EMPTY(F9_FUNC) =.F.
	   RET_DNX ={0,0,0} && {T1,TNSTP,T}
	   DO &F9_FUNC	with  K_F9,@RET_DNX
       ENDIF
       T=0
     CASE T=K_DEL
       isDataChg=1
       IF  EMPTY(DEL_FUNC) =.F.
	 DO &DEL_FUNC
       ENDIF
       T=0
     CASE T=-992   .AND. (_MODI="Y"  .OR.    _MODI="K"  .OR.    _MODI="1"  )
       &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"P_FUNC&GET_STPC")
       _GET_STP=1
       DO WHILE ( _GET_STP >=0 )  .AND. ( _GET_STP <=TIT_N )
	  R_C=ARR_REC_NAME[_GET_STP]
	  T_C=ARR_TYPE[_GET_STP]
	  _D_TYPE=TYPE("&R_C")
	  C_L=LEN(ARR_TYPE[_GET_STP])
	  SET COLOR TO	&12 /&11
	  @ N_YN,ARR_DSPN[_GET_STP]  SAY &R_C	PICT "&T_C"
	  GET_STPC=ALLTRIM(STR(_GET_STP,2,0))
	  p_func=P_FUNC&GET_STPC
	  X_GETSTP=_GET_STP
	  set  colo  to b  /w
	  _REC_DSP(N_YN)
	  xisdatachg=0
	 _GET_STP=READ_A(N_YN,ARR_DSPN[_GET_STP],&R_C,"&_D_TYPE",C_L,ARR4[_GET_STP],_GET_STP,"&P_FUNC",@xisdatachg )
	 if  xisdatachg=1
	   isDataChg=1
	 endif
	 IF _GET_STP=99
	   _LOOP_BR=0
	 ENDIF
	 IF T_C="!" .AND. (VALTYPE(_ACT_PX)="C")
	   _ACT_PX=UPPER(_ACT_PX)
	 ELSE
	   IF  T_C="9" .AND.  (_ACT_PX >INT(VAL(ARR3[X_GETSTP])) )
	     _ACT_PX =INT(VAL(ARR3[X_GETSTP]))
	   ENDIF
	 ENDIF
	 T_C=ARR_TYPE[X_GETSTP]
	 @ N_YN,ARR_DSPN[X_GETSTP]   SAY  _ACT_PX  PICT "&T_C"
	 SELE &Nb_SELE
	 REPL  &R_C  WITH _ACT_PX
	 IF  EMPTY(ARR_PCS[X_GETSTP]) =.F.
	   PCS_CF(N_YN,&R_C,X_GETSTP,RECNO())
	 ENDIF
       ENDDO
       set  colo to  gr + /w
       SELE &Nb_SELE
       GOTO NS_RECNO
       _REC_DSP(N_YN)
       _DATA_MODIFY=1
       IF (_GET_STP !=98)
	 T=0
       ENDIF
     CASE T=K_UP
       IF  (_MODI <> "1")
	 UP_DSP1()
       ENDIF
       T=-992
     CASE T=K_DOWN
       IF  (_MODI <> "1")
       IF  _MODI="Y"    .AND. (_MODI <> "1")
	 SKIP
	 IF  EOF()
	   SKIP -1
	   FOR	X =1 TO TIT_N
	     R_C=ARR_REC_NAME[X]
	     IF EMPTY(&R_C)=.F.
	       APPE BLANK
	       EXIT
	     ENDIF
	   NEXT
	   SKIP
	 ENDIF
	 SKIP -1
       ENDIF
       DOWN_DSP1()
       ENDIF
       T=-992
     CASE T=K_DEL  .and.  DELREC=.T.
       isDataChg=1
       DELE
       PACK
       IF  EOF()
	 SKIP -1
	 IF  EOF()
	   APPE BLANK
	 ENDIF
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       GOTO N_REC
       _REC_DSP(N_YN)
       _DATA_MODIFY =1
       T=0
     CASE (T=K_PGUP .or.  T=K_HOME   ) .AND.  MDYPAGE=.T.    &&=18
       SKIP -(YL_N +(N_YN-Y1_N))
       IF (BOF() .OR. T=K_HOME	)
	 GOTO TOP
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       SET COLOR TO GR+ / W+
       GOTO N_REC
       IF  T=K_HOME
	  GOTO	TOP
	  N_YN=Y1_N
       ENDIF
       _REC_DSP(N_YN)
       T=0
     CASE (T=K_PGDN .OR. T=K_END )  .AND.  MDYPAGE=.T.	 &&=3
       SKIP ((Y1_N+YL_N-N_YN))
       IF (EOF()  .OR.	T=K_END  )
	 GOTO BOTT
       ENDIF
       N_REC=RECNO()
       N_YN=Y1_N
       SET COLOR TO W+ / BL
       DO _DSP_ALL
       GOTO N_REC
       SET COLOR TO GR+ / W+
       _REC_DSP(N_YN)
       T=0
     CASE T=13
       X=1
       DO WHILE  X <=TIT_N
	 R_C=ARR_REC_NAME[X]
	 XK=ALLTRIM(STR(X,2,0))
	 RET_X&XK=&R_C
	 RET_A[X]=&R_C
	 X=X+1
       ENDDO
       _LOOP_BR=0
       T=0
     CASE T=23 .OR. T=27
       _LOOP_BR=0
       T=0
     otherwise
       T=0
     ENDCASE
   ENDDO
   T=0
   SET COLO TO &XCOR
   MODI_PAGE= .T.
   RESTSCREEN(Y1_N-1,0,Y1_N+YL_N,79,X_G_B)
   RETU

#endif


#ifdef	dfRaten_2Page

   &&-----------------------------------------------------------------------------
	FUNCTION READ_AN
   PARAMETERS  RDY1,RDX1,PX,D_TYPE,LONG,N_DASH,TNSTP,C_FUNC,Rischg,Nb_SELE    && Y,X,DATA,DATA_TYPE<C/N>,DATA LONG,¤p¼Æ¦ì¼ÆTNSTP
   &&TNSTP=READ_A(S_Y,S_X1,XPA1,"C",8,0,TNSTP,"D_MATE")
   && RETU TNSTP
   static  xp_read
   Rischg =0
   && if typE(item_max)="U"
   &&	 item_max=0
   && ENDIF
   && if typE(item_max)="U"
   &&	 item_ofsa=0
   && ENDIF
   && if empty(item_ofsa)
   &&	 item_max=0
   && endif
   && if empty(item_ofsa)
   &&	 item_ofsa=0
   && endif
   last_key=0
   XPX=pX
   RDX1=RDX1
   SET COLOR TO 0/7+
   DO CASE
   CASE   D_TYPE="N"
     IF ((N_DASH=0 )  .AND. (XPX -INT(XPX) <>0) )
       CHRN=LTRIM(STR(XPX,LONG+3,2))
       XLN1=LEN(CHRN)
       IF XLN1 < LONG
	 CHRN=SUBSTR("       ",1,LONG-XLN1) + CHRN
       ELSE
	 CHRN=SUBSTR(CHRN,1,LONG)
       ENDIF
     ELSE
       *CHRN=STR(XPX,LONG,N_DASH)
       IF XPX -INT(XPX)=0
	 CHRN=ALLTRIM(STR(INT(XPX)))
       ELSE
	 DO CASE
	 CASE  XPX *10 -INT(XPX *10)=0
	   CHRN=ALLTRIM(STR(XPX,10,1))
	 CASE XPX *100 -INT(XPX *100)=0
	   CHRN=ALLTRIM(STR(XPX,10,2))
	 OTHERWISE
	   CHRN=ALLTRIM(STR(XPX))
	 ENDCASE
       ENDIF
       IF LEN(CHRN) < LONG
	 CHRN=SUBSTR(SPACE(10) +CHRN,-LONG,LONG)
       ENDIF
     ENDIF
   CASE   D_TYPE="C"
     CHRN=SUBSTR(XPX,1,LONG)
   CASE   D_TYPE="D"
     CHRN=DTOC(XPX)
     LONG=10
   ENDCASE
   SET COLOR TO 0 + /7
   @ RDY1,RDX1	SAY CHRN
   xp_read=0
   t=0
   SET COLOR TO W+  / R
   @ RDY1,(RDX1+xp_read)  SAY SUBSTR(CHRN,xp_read+1,1)
   SET COLOR TO 7/0
   XX1=RDX1+xp_read
   YY1=RDY1
   T1=0
   TN1=0
   DO WHILE T1<>233
     T=0
     SELE &LUDBF
     DO WHILE  T=0
       IF (T0A <>0) .AND. (DSP_SCALL=1) .AND. (LUSTP_EN=1)
	 T=T0A
	 T0A=0
       ELSE
	 T=INKEY()
       ENDIF
       IF (DLA_DSP=1)  .AND.  (DSP_SCALL=1)
	 DO DSP2
       ENDIF
       IF (T0A=0   ) .AND. (LUSTP_EN=1)
	  DO LUSTP
       ENDIF
     ENDDO
     SELE &LUDBF
     _LASTKEY=T
     last_key=t
     DO CASE
     CASE T=K_F5
       IF  EMPTY(F5_FUNC) =.F.
	 F5_ACT=1
	 IF F5_FUNC <>"0"
	   DO &F5_FUNC
	 ELSE
	   T1=233
	   TNSTP=99
	 ENDIF
	 F5_ACT=0
       ENDIF
     CASE T=K_F7
       IF  EMPTY(F7_FUNC) =.F.
	 F7_ACT=1
	 IF F7_FUNC <>"0"
	   DO &F7_FUNC with  Nb_SELE
	 ELSE
	   T1=233
	   TNSTP=99
	 ENDIF
	 F7_ACT=0
       ENDIF
     CASE T=K_F8
       IF  EMPTY(F8_FUNC) =.F.
	 F7_ACT=0
	 IF F8_FUNC <>"0"
	   DO &F8_FUNC with  Nb_SELE
	 ELSE
	   T1=233
	   TNSTP=99
	 ENDIF
       ENDIF
     CASE  T=K_F1 .AND. ( C_FUNC <> " ")
       DO &C_FUNC
       T=0
       xp_read=0
       SET COLOR TO 0/7 +
       @ RDY1,RDX1  SAY CHRN
       SET COLOR TO &C1 +/ 7 +
       @ RDY1,RDX1  SAY CHRN
       SET COLOR TO W+	/ R
       @ RDY1,(RDX1+xp_read)  SAY SUBSTR(CHRN,xp_read+1,1)
     case  T=K_DEL
	 Rischg=1
	 DO CASE
	 CASE  D_TYPE <> "D"
	   CHRN=SUBSTR(CHRN,1,xp_read) +SUBSTR(CHRN,xp_read+2,LONG-xp_read-1) + " "
	 ENDCASE
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
      CASE T=-9 .and. _modi="YY"
	Rischg=1
	SELE &N_SELE
	DELE
	PACK
	GOTO N_REC
	IF  EOF()
	  SKIP -1
	  N_YN=N_YN  -1
	  IF N_YN < Y1_N
	    N_YN=Y1_N
	  ENDIF
	ENDIF
	IF  BOF()
	  GOTO 1
	  N_YN=Y1_N
	ENDIF
	IF  EOF()
	  APPE BLANK
	  N_YN=Y1_N
	ENDIF
	N_YNO=N_YN
	N_REC=RECNO()
	N_RECO=N_REC
	SKIP - (N_YN -Y1_N  )
	SET COLOR TO W+ / BL
	DO _DSP_ALL
	SET COLOR TO b / W+
	N_REC=N_RECO
	GOTO N_REC
	N_YN=N_YNO
	_REC_DSP(N_YN,"W+")
	N_REC=N_RECO
	N_YN=N_YNO
	GOTO N_REC
	_DATA_MODIFY =1
	&&TNSTP=1
	&&T1=233
	&&xp_read=1
	R_CB=ARR_REC_NAME[tnstp]
	xPX = &R_CB
	DO CASE
	CASE   D_TYPE="N"
	  CHRN=STR(XPX,LONG,N_DASH)
	CASE   D_TYPE="C"
	  CHRN=SUBSTR(XPX,1,LONG)
	CASE   D_TYPE="D"
	  CHRN=DTOC(XPX)
	  LONG=10
	ENDCASE
	px=chrn
	T=0
	rdy1=n_yn
     case  T=K_LEFT
       IF xp_read>=1
	 xp_read=xp_read-1
	 DO CASE
	 CASE  D_TYPE="D"
	   IF xp_read=2 .OR.  xp_read=5
	     xp_read=xp_read-1
	   ENDIF
	 ENDCASE
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ENDIF
     CASE  T=K_RIGHT
       IF xp_read<=LONG-2
	 xp_read=xp_read+1
	 DO CASE
	 CASE  D_TYPE="D"
	   IF xp_read=2 .OR.  xp_read=5
	     xp_read=xp_read+1
	   ENDIF
	 ENDCASE
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO &C1 +/ 7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ENDIF
     CASE   T>=32
	Rischg=1
       xp_read=xp_read+1
       IF TN1=0 .AND. xp_read=1
	 TN1=1
	 DO CASE
	 CASE  D_TYPE <> "D"
	   CHRN=SPACE(LONG)
	 ENDCASE
       ENDIF
       IF xp_read<LONG
	 CHRN=SUBSTR(CHRN,1,xp_read-1)+CHR(T)+SUBSTR(CHRN,xp_read+1,LONG-xp_read)
	 DO CASE
	 CASE  D_TYPE="D"
	   IF xp_read=2 .OR.  xp_read=5
	     xp_read=xp_read+1
	   ENDIF
	 ENDCASE
	 SET COLOR TO 0/7  +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO 7/0
	 *CURSER0(XX1,YY1)
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ELSE
	 CHRN=SUBSTR(CHRN,1,xp_read-1)+CHR(T)
	 SET COLOR TO 0/7+
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO 7/0
	 xp_read=xp_read-1
	 SET COLOR TO 0/7 +
	 @ RDY1,RDX1  SAY CHRN
	 SET COLOR TO W+  / R
	 @ RDY1,(RDX1+xp_read)	SAY SUBSTR(CHRN,xp_read+1,1)
	 SET COLOR TO &C7 +/ &C1
	 *CURSER2(RDX1,RDY1,xp_read)
	 XX1=RDX1+xp_read
	 YY1=RDY1
       ENDIF
     CASE T=13	 .OR. T=23 .OR. T=5 .OR. T=24.or. t=2 .OR. T=3 .OR. T=18  .OR. T=K_CTRL_RIGHT  .OR. T=K_CTRL_LEFT
       IF  T=28 .AND. ( C_FUNC <> " ")
	 DO &C_FUNC
	 T=13
       ENDIF
       T1=233
       DO CASE
       CASE   D_TYPE="N"
	 xPX=VAL(CHRN)
       CASE   D_TYPE="C"
	 XPX=CHRN
       CASE   D_TYPE="D"
	 XPX=CTOD(CHRN)
       ENDCASE

       PX=XPX
       SET COLOR TO 0/7+
       @  RDY1,RDX1  SAY  CHRN
       *SELE 5
       *CHNO=LTRIM(STR(TNSTP))
       *REPL PA&CHNO WITH PX
       DO CASE
       CASE T=5
	 IF TNSTP=1
	   T1=233
	   TNSTP=99
	 ENDIF
	 IF TNSTP>1
	   if tnstp=item_max +1
	     TNSTP=1
	   else
	     TNSTP=TNSTP-1
	   endif
	   LAST_PRESS=5
	 ENDIF
       CASE T=3
	 T1=233
	   TNSTP=98
       CASE T=18
	 T1=233
	   TNSTP=98
       CASE T=24
	 T1=233
	 TNSTP=98
       CASE T=13
	 if item_ofsa=0
	   TNSTP=TNSTP+1
	   if tnstp >item_max
	     TNSTP=tit_n+1
	   endif
	 else
	   if tnstp=1
	     TNSTP=item_max+1
	   else
	     TNSTP=TNSTP+1
	   endif
	 endif
       CASE T=K_CTRL_RIGHT  .OR. T=K_CTRL_LEFT
	 T1=233
	 TNSTP=98
       ENDCASE
       IF T=23
	 TNSTP=99
       ENDIF
     CASE T=27
       SET COLOR TO 0/7 +
       @ RDY1,RDX1  SAY  CHRN
       XPX=PX
       DO CASE
       CASE   D_TYPE="N"
	 XPX=VAL(CHRN)
       CASE   D_TYPE="C"
	 XPX=CHRN
       CASE   D_TYPE="D"
	 XPX=CTOD(CHRN)
       ENDCASE
       PX=XPX
       SET COLOR TO 7/0
       xp_read=0
       t=0
       XX1=RDX1+xp_read
       YY1=RDY1
       T1=233
       TNSTP=99
     ENDCASE
   ENDDO
   _act_px=PX
   RETU   TNSTP


#endif

#ifdef	dfRaten_2Page
   **-----------------------------------------------------------------------------
   FUNCTION   _REC_DSP
   PARAMETERS  YD_N,XBCOR
   xLOP3=1
   show_last=ITEM_MAX
   *DO WHILE  xLOP3 <=TIT_N
   IF  F3_RUN=-1   .OR.  F3_RUN=-18
      IF MIXSEC >0
	IF XBCOR="W"
	 && SET COLOR TO GR  / W
	ELSE
	 && SET COLOR TO GR  / B
	ENDIF


	 && XCOLOR=SETCOLOR()
	 && IF "W" $ SUBSTR(XCOLOR,-2,2)
	 &&   SET COLOR TO GR  / W
	 && ELSE
	 && ENDIF
      ENDIF
   ENDIF
   DO WHILE  xLOP3 <=show_last
     R_CB=ARR_REC_NAME[xLOP3]
     T_CB=ARR_TYPE[xLOP3]
     _XN1=&R_CB
     IF (VALTYPE(_XN1)="N")
       xdec=fget_dec(t_cb)
       IF F3_RUN=-29
	  IF XDEC=0
	     XTMP3=ABS(_XN1 -INT(_XN1))
	     IF XTMP3 <>0
		XTMP3=ALLTRIM(STR(XTMP3,3,2))
		XDEC=LEN(XTMP3)-2
	     ENDIF
	  ENDIF
       ENDIF
       *@ YD_N,ARR_DSPN[xLOP3]	SAY &R_CB   PICT "&T_CB"
       X_L=LEN(T_CB)
       IF &R_CB -INT(&R_CB) =0
	 X_D=FSUBSTR(INT(&R_CB),-X_L," ",0)
       ELSE
	 IF &R_CB *10  -INT(&R_CB *10) =0
	   X_D=FSUBSTR(&R_CB,-X_L," ",xdec)
	 ELSE
	   X_D=FSUBSTR(&R_CB,-X_L," ",2)
	 ENDIF
       ENDIF
       @ YD_N,ARR_DSPN[xLOP3]  SAY x_d
     ELSEIF (VALTYPE(_XN1)="C")
       X_L=LEN(T_CB)
       *X_D=FSUBSTR(&R_CB,X_L," ",0)
       X_D=SUBSTR(&R_CB,1,X_L)
       @ YD_N,ARR_DSPN[xLOP3]  SAY x_d	 PICT "&T_CB"
     ELSE
       X_L=LEN(T_CB)
       X_D=&R_CB
       @ YD_N,ARR_DSPN[xLOP3]  SAY x_d


     ENDIF
     IF  EMPTY(ARR_PCS[xLOP3]) =.F.
       PCS_CF(YD_N,&R_CB,xLOP3,RECNO())
     ENDIF
     xLOP3=xLOP3+1
     if item_ofsa >0
	if xlop3=2
	   xlop3=item_ofsa +1
	   show_last=TIT_N
	endif
     endif
   ENDDO
   IF  F3_RUN=-1   .OR.  F3_RUN=-18
       SET COLOR TO W+	/ B
   ENDIF
   RETU

   &&-----------------------------------------------------------------------------
   PROCEDURE	_DSP_ALL
   PARAMETERS  P1,P2,P3
   XAL=1
   Y_X=Y1_N
   @ Y1_N,X1_N	CLEA TO Y1_N+YL_N-1,X1_N + DC_L-1
   IF .NOT. BOF()
     DO WHILE  (XAL <=YL_N)  .AND. (.NOT. EOF())
       _REC_DSP(Y_X,"B")
       SKIP
       Y_X=Y_X+1
       XAL=XAL+1
     ENDDO
     SKIP -1
     N_YN=Y_X -1
   ENDIF
   N_REC=RECNO()
   RETU
   &&-----------------------------------------------------------------------------
   FUNCTION   UP_DSP1
   PARAMETERS  X
   SET COLOR TO W+ / BL
   _REC_DSP(N_YN,"BL")
   SKIP -1
   if fist_rec=0
     IF BOF()
       GOTO TOP
     ELSE
       N_YN=N_YN -1
       IF N_YN < Y1_N
	 N_YN=Y1_N
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,-1)
       ENDIF
     ENDIF
   else
     IF recno() < FIST_REC
       SKIP
     ELSE
       N_YN=N_YN -1
       IF N_YN < Y1_N
	 N_YN=Y1_N
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,-1)
       ENDIF
     ENDIF
   endif
   SET COLOR TO bl  / W+
   _REC_DSP(N_YN,"W+")
   N_REC=RECNO()
   RETU
   &&-----------------------------------------------------------------------------
   FUNCTION   DOWN_DSP1
   PARAMETERS  X
   SET COLOR TO W+ / BL
   _REC_DSP(N_YN,"BL")
   SKIP
   IF LAST_REC=0
     IF .NOT. EOF()
       N_YN=N_YN +1
       IF N_YN > Y1_N + YL_N-1
	 N_YN=Y1_N +YL_N-1
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,1)
       ENDIF
     ELSE
       GOTO N_REC
     ENDIF
   ELSE
     IF RECNO()<=LAST_REC
       N_YN=N_YN +1
       IF N_YN > Y1_N + YL_N-1
	 N_YN=Y1_N +YL_N-1
	 SCROLL(Y1_N,X1_N,Y1_N+YL_N-1,X1_N+DC_L,1)
       ENDIF
     ELSE
       SKIP -1
     ENDIF
   ENDIF
   SET COLOR TO bl  / W+
   _REC_DSP(N_YN,"W+")
   N_REC=RECNO()
   RETU
   &&-----------------------------------------------------------------------------

#endif


#ifdef	dfRaten_2Page
PROCEDURE  DSP_TOTW
PARAMETERS  P1,P2,P3
c_color=SETCOLOr()
SET COLOR TO GR+ / BL
*@ Y_POSI,33  SAY  (M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) PICT "9999"
XTOT=0
FOR I=1 TO gs_tot + uwc_tot
*FOR I=1 TO ITEM_MAX
  IX_C=ALLTRIM(STR(I,2,0))
  XTOT=XTOT +  M&IX_C
  IF UCHTYPE=16 .AND.  I>=9
    EXIT
  ENDIF
NEXT
*@ Y_POSI,TW_DSPX  SAY XTOT  PICT "9999"
@ Y_POSI,ARR_DSPN[2]-6	SAY XTOT  PICT "9999"
SET COLOR TO &c_color
retu
&&-----------------------------------------------------------------------------
#endif

&&-----------------------------------------------------------------------------
&& function  WAdjCur
&& PARAMETERS  xwADJ,_WADJ_CN,_COLOR
&&   if xwadj=0
&&     retu
&&   endif
&&   &&  FUNCTION fCursor    &&(charY,charX,curL,curColor )
&&   fCursor(2,A_M_NAME[_wadj_cn,2],4,_COLOR) &&  charY,charX,curL,curColor
&& return

**-----------------------------------------------------------------------------
function  WAdjCur
PARAMETERS  xwADJ,_WADJ_CN,_COLOR
  if xwadj=0
    retu
  endif
  fCursor(A_M_NAME[_wadj_cn,23],A_M_NAME[_wadj_cn,2],4,_COLOR) &&  charY,charX,curL,curColor
  && fCursor(20,gs_dspx[_wadj_cn]+7,4,_COLOR) &&  charY,charX,curL,curColor
return
&&-----------------------------------------------------------------------------

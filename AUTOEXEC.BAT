
prompt $p$g
cls
@ECHO OFF
path=\et3;\dos;c:\dos;c:\;C:\CEDIT
*APPEND=\et3
SET CLIPPER=//F:35 //E:4095 //DYNF:25 //SWAPPATH:f:\ //TEMPPATH:f:\  //INFO
 gen-drv
*lh sv1
*lh sv10_2
*lh sv12
*lh AC12
*lh sv14
*lh sv16DB2
*lh sv16_SG2
*lh sUCH17_2
 lh sv16_2
*lh sv16N  ;OUT DOUBLE C2 OUT NO.33
*lh svtest
cd \et3
 ET16v-16 /L16:100/B16:100/u16:100/L:50,50,50/B:50
 ETCTL /C:IG
 ETINMD /PN=PHONETIC.TAB,XUSRPN.TBL
PR24D/P10
cd \
del  c:\*.










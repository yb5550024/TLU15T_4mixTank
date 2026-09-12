CLEA
 REST FROM indata_a  ADDITIVE
a_s=space(9)
c_s=space(9)
AN="A:"
CN="C:"
@ 5,10 SAY "AN " GET  AN
@ 6,10 SAY "CN " GET  CN
READ
A_s=dsk_sno(AN)
c_s=dsk_sno(CN)
@ 5,10 SAY "AS " GET  A_S
@ 6,10 SAY "CS " GET  C_S
READ
SAVE TO indata_a
**-----------------------------------------------------------------------------
FUNCTION dsk_sno
PARAMETERS  dn
#DEFINE F_BLOCK 73
CBUFFER=SPACE(F_BLOCK)
! vol &dn > test.tmp
NHANDLE=fopen("TEST.TMP")
FREAD(NHANDLE,@CBUFFER,F_BLOCK)
x=SUBSTR(ALLTRIM(CBUFFER),-11,9)
fCLOSE("TEST.TMP")
delE file   test.tmp
retu x






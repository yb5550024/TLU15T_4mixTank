

#define    dimb_len    21

&& #ifdef  dfTLU15T
&&   #define	lastBuzzer   1,13
&&   #define	StorerOpen   1,14
&&   #define	MixerOpen    1,15
&& #else
  #define    lastBuzzer   2,13
  #define    StorerOpen   2,14
  #define    MixerOpen	  2,15
&& #endif
&& #define    dfTLU16  && CP16	XX  RL16
#ifdef	dfTLU16
  #define    pcs_max   16
  #define    kind   16
#else
  #define    pcs_max   999
  #define    kind   15
#endif

#define    pntw   "~IX5;"
#define    TransMax    5
#define    TransDlyS   10
#define    Len_ratno_dbf   10
#define    wide_page   97
#define    PRESS_LEN4  12
#define    MCNO  "2"
#define    SELPAR  5

#ifdef	dfLNK_EN
  #define      SCANO_LEN 15
  #define      PX_SCANO 3
#ELSE
  #ifdef  dfTLU15T
    #define	 SCANO_LEN 9
  #else
    #define	 SCANO_LEN 7
  #endif

  #define      PX_SCANO 9
#ENDIF
#define      PX_CARNO 24
#define      PX_RATNO 36
#define      PX_VUSE 51
#define      PX_TANDO 62
#define      PX_REP   76













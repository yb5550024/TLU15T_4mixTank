/***
*
*  Box.ch
*
*  Standard definitions for Clipper box drawing commands
*
*  Copyright (c) 1990-1993, Computer Associates International, Inc.
*  All rights reserved.
*
*/
// Ú Ä ¿ ³ Ù Ä À ³
// 
// Single-line box
#define B_SINGLE                ( CHR(201) + CHR(208) + CHR(203) + CHR(220) + ;
                          CHR(202) + CHR(204) + CHR(200) + CHR(186)   )


// Double-line box   É Í » º ¼ Í È º 
//#define B_DOUBLE                ( CHR(201) + CHR(205) + CHR(187) + CHR(186) + ;
//                       CHR(188) + CHR(205) + CHR(200) + CHR(186)   )

#define B_DOUBLE                ( CHR(201) + CHR(208) + CHR(203) + CHR(220) + ;
                          CHR(202) + CHR(204) + CHR(200) + CHR(186)   )
                          
// Single-line top, double-line sides Ö Ä · º ½ Ä Ó º 
//#define B_SINGLE_DOUBLE ( CHR(214) + CHR(196) + CHR(183) + CHR(186) + ;
//                          CHR(189) + CHR(196) + CHR(211) + CHR(186)   )
#define B_SINGLE_DOUBLE                ( CHR(201) + CHR(208) + CHR(203) + CHR(220) + ;
                          CHR(202) + CHR(204) + CHR(200) + CHR(186)   )

// Double-line top, single-line sides Õ Í ¸ ³ ¾ Í Ô ³ 
//#define B_DOUBLE_SINGLE ( CHR(213) + CHR(205) + CHR(184) + CHR(179) + ;
//                             CHR(190) + CHR(205) + CHR(212) + CHR(179)   )
#define B_DOUBLE_SINGLE                ( CHR(201) + CHR(208) + CHR(203) + CHR(220) + ;
                          CHR(202) + CHR(204) + CHR(200) + CHR(186)   )


#define _BOX_CH


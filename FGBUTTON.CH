/***
*
* FGBUTTON.CH
* The defines for the standard buttons, used with LoadButtons(), which is
* included in FGLTools.Prg
*
* Copyright (c) 1994-1996, Ferns Paanakker.
* All rights reserved.
*
***/
#ifndef FGBUTTON_INCLUDE
#define FGBUTTON_INCLUDE

#define FGL_UBTNUP      1
#define FGL_UBTNDOWN    2
#define FGL_UBTNLEFT    3
#define FGL_UBTNRIGHT   4
#define FGL_UBTN        5
#define FGL_DBTNUP      6
#define FGL_DBTNDOWN    7
#define FGL_DBTNLEFT    8
#define FGL_DBTNRIGHT   9
#define FGL_DBTN        10

/***
 A simple way to use the standard buttons.
 Only works when LoadButtons() is called in the current graphic mode.
***/
#define UBtnUp()     GetButton(FGL_UBTNUP)
#define UBtnDown()   GetButton(FGL_UBTNDOWN)
#define UBtnLeft()   GetButton(FGL_UBTNLEFT)
#define UBtnRight()  GetButton(FGL_UBTNRIGHT)
#define UBtn()       GetButton(FGL_UBTN)
#define DBtnUp()     GetButton(FGL_DBTNUP)
#define DBtnDown()   GetButton(FGL_DBTNDOWN)
#define DBtnLeft()   GetButton(FGL_DBTNLEFT)
#define DBtnRight()  GetButton(FGL_DBTNRIGHT)
#define DBtn()       GetButton(FGL_DBTN)

#endif

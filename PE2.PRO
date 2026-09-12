def up = [up]
def down = [down]
def left = [left]
def right = [right]
def pgup = [page up]
def pgdn = [page down]
def home = [begin line]
def end = [end line]
def ins = [insert toggle]
def del = [delete char]
def enter = [il][bw][bl][fn][down]
def backspace = [rubout]
def esc = [command toggle]
def tab = [unmark][BL][BW][el][MB][BL][COPY MARK][UNMARK][MB][FN][LEFT 1][MB][END LINE][TW][BL][COPY MARK][UNMARK][BW][FN][LEFT 1][MB][DELETE MARK][DOWN][MB][TW][FN][LEFT 1][MB][DELETE MARK][DOWN][FN]
def f1 = [confirm change] [execute]
def f2 =[cursor command] [begin line] [erase end line] [save] [execute]
def f3 =[cursor command] [begin line] [erase end line] 'LINE  '
def f4 = [cursor command] [begin line] [erase end line] 'quit' [execute]
def f5 = [RIGHT 39]
def f6 = [erase end line]
def f7 = [cursor command] [begin line] [erase end line] 'print'
def f8 = [cursor command] [begin line] [erase end line] 'e' [execute]
def f9 = [insert line]
def f10 = [delete line]
def c-left = [left 40]
def c-right = [right 40]
def c-pgup = [top edge]
def c-pgdn = [bottom edge]
def c-home = [top]
def c-end = [bottom]
def c-enter = [il][BW][UP][END LINE][TAB WORD][down][right 4]
def c-backspace = [delete line]
def c-f1 = [BL][MB][TW][LEFT 1][MB][DELETE MARK][BW][BL][MB][TW][LEFT 1][MB][DOWN][BL][COPY MARK][UM][DOWN][TW]
def c-f2 =
def c-f3 =
def c-f4 =
def c-f5 =
def c-f6 = [tab]
def c-f7 =
def c-f8 =
def c-f9 =
def c-f10 =[DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL][DL]
def c-p =[cursor command] [begin line] [erase end line] 'print mark  '
def c-L =[cursor command] [begin line] [erase end line] 'scrollleft  '
def c-R =[cursor command] [begin line] [erase end line] 'scrollright  '
def c-U =[cursor command] [begin line] [erase end line] 'scrollUP    '
def c-D =[cursor command] [begin line] [erase end line] 'scrollDOWN   '
def c-C = [cl]
def s-tab = [unmark][BL][BW][el][MB][BL][COPY MARK][UNMARK][MB][FN][LEFT 1][MB][END LINE][TW][BL][COPY MARK][UNMARK][BW][FN][LEFT 1][MB][DELETE MARK][DOWN][MB][TW][FN][LEFT 1][MB][DELETE MARK][bl][MB][RIGHT][MB][DELETE MARK][UNMARK][DOWN][FN]
def C-Q = [unmark][BL][BW][el][MB][BL][COPY MARK][UNMARK][MB][FN][LEFT 1][MB][END LINE][TW][BL][COPY MARK][UNMARK][BW][FN][LEFT 1][MB][DELETE MARK][DOWN][MB][TW][FN][LEFT 1][MB][DELETE MARK][El][RIGHT][MB][RIGHT][MB][BL][COPY MARK][UNMARK][DOWN][FN]
def s-f1 =[iL]'
'[Down 60][il]'
'[down 60][il]'








'[down 60][il]'
'[down 60][il]'








'[down 60][il]'
'[down 60][il]'








'[down 60][il]'
'[down 60][il]'








'[down 60][il]'
'[down 60][il]'






'[execute]
def s-f2 = [page up] [top edge] [up] [up] [cursor command]
def s-f3 = [reflow]
def s-f4 = [undo]
def s-f5 =
def s-f6 =
def s-f7 = [shift left]
def s-f8 = [shift right]
def s-f9 = [cursor command] [begin line] [erase end line] 'dir a:' [execute]
def s-f10 = [cursor command] [begin line] [erase end line] 'dir b:' [execute]
def a-a =[FN]
def a-b = [mark block]
def a-c = [mark char]
def a-d = [delete mark]
def a-e = [end mark]
def a-f = [fill mark]
def a-g =
def a-h =
def a-i =
def a-j = [join]
def a-k =
def a-l =[UNMARK][mark line]
def a-m = [move mark]
def a-n =
def a-o = [overlay block]
def a-p = [cursor data] [unmark] [mark line] [find blank line] [up] [mark line] [reflow] [end mark] [down] [down] [unmark]
def a-q =
def a-r = [redraw]
def a-s = [split][DOWN][END LINE][JOIN][UP][END LINE][DOWN]
def a-t =
def a-u = [unmark]
def a-v =
def a-w =
def a-x = [escape]
def a-y = [begin mark]
def a-z = [copy mark]
def a-f1 = [cursor command] [begin line] [erase end line] 'set margins '
def a-f2 = [cursor command] [begin line] [erase end line] 'def a-f10 = " "'
def a-f3 = [execute]
def a-f4 = [mark line] [begin line] [bottom] [copy mark] [begin mark] [delete mark]
def a-f5 = [confirm change]
def a-f6 =
def a-f7 = [center line]
def a-f8 =
def a-f9 = [cursor command] [begin line] [erase end line] '8 key '
def a-f10 =
def a-0 = '¢w'
def a-1 ='¢|'
def a-2 = '¢r'
def a-3 = '¢}'
def a-4 = '¢u'
def a-5 = '¢q'[left 2][down]
def a-6 = '¢t'[left 2][down]
def a-7 = '¢z'
def a-8 = '¢s'[left 2][down]
def a-9 = '¢{'[left 2][down]
def a-v = '¢x'[left 2][down]
def s-ins = 'ùù'
def s-end ='ùã'
def s-down = 'ùä'
def s-pgdn = 'ùå'
def s-left = 'ùà'
def s-pad5 = 'ùá'[left 2][down]
def s-right = 'ùâ'[left 2][down]
def s-home = 'ùÝ'
def s-up = 'ùÞ'[left 2][down]
def s-pgup = 'ùß'[left 2][down]
def s-del = 'ùø'[left 2][down]

#!/bin/bash

TMPBG=~/Images/lockscreen.png

scrot $TMPBG
#convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG -blur 0x6 $TMPBG
i3lock -e -t -p win -i $TMPBG

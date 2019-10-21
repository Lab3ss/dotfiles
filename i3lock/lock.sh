#!/usr/bin/env bash

# set the icon and a temporary location for the screenshot to be stored
icon=~/Development/dotfiles/i3lock/scarheadwhite.png
tmpbg=~/Development/dotfiles/i3lock/screen.png
# 
# take a screenshot
scrot "$tmpbg"
# 
# blur the screenshot
convert "$tmpbg" -blur 0x7 "$tmpbg"
# 
# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"
# 
# # lock the screen with the blurred screenshot
# ~/Apps/i3lock-color/build/i3lock -t --ringvercolor=FF000000 -i "$tmpbg"


#!/bin/sh

B='#00000000'  # blank
C='#ffffffAA'  # clear ish
C2='#ffffff18'  # clear ish
D='#ff00ffcc'  # default
W='#880000bb'  # wrong
M='#00AA88ee'  # main color

~/Apps/i3lock-color/build/i3lock \
	-i $tmpbg \
--insidevercolor=$C2   \
--ringvercolor=$M     \
\
--insidewrongcolor=$C2 \
--ringwrongcolor=$M   \
\
--insidecolor=$B      \
--ringcolor=$C2        \
--linecolor=$B        \
--separatorcolor=$M   \
\
--verifcolor=$M        \
--wrongcolor=$M        \
--timecolor=$M        \
--datecolor=$M       \
--layoutcolor=$M      \
--keyhlcolor=$M       \
--bshlcolor=$M        \
\
--screen 1            \
--force-clock               \
--indicator           \
\ # --greetertext="There’s no need to call me ‘sir,’ Professor."           \
--greetertext="The ministry has fallen. Scrimgeour is dead. They are coming"           \
--greetercolor='#FFFFFF88'           \
--greetersize=24			\
--greeterpos="w/2:3*(h/4)"					\
--timestr="%H:%M:%S"  \
--timepos="w/2:h/4"					\
--timesize=48			\
--datestr="%A, %m %Y" \
--datepos="w/2:(h/4)+30"					\
--datesize=18				\
--keylayout 2         \
--noinputtext='' 		\
--wrongtext='' 		\
--veriftext=''   \
--radius=120    \
--ring-width=28

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc

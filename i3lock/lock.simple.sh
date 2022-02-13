#!/usr/bin/env bash
xset -dpms s off

tmpbg=~/Development/dotfiles/i3lock/screen.png
# 
# take a screenshot
scrot -o "$tmpbg"
# 
# blur the screenshot
convert "$tmpbg" -blur 0x5 "$tmpbg"

B='#00000000'  # blank
C='#ffffffAA'  # clear ish
C2='#ffffff18'  # clear ish
D='#ff00ffcc'  # default
W='#880000bb'  # wrong
M='#283c63ee'  # main color

~/Apps/i3lock-color/build/i3lock \
	-i $tmpbg \
--insidever-color=$C2   \
--ringver-color=$M     \
\
--insidewrong-color=$C2 \
--ringwrong-color=$M   \
\
--inside-color=$B      \
--ring-color=$C2        \
--line-color=$B        \
--separator-color=$M   \
\
--verif-color=$M        \
--wrong-color=$M        \
--time-color='#FFFFFF88'        \
--date-color='#FFFFFF88'       \
--layout-color='#FFFFFF88'      \
--keyhl-color=$M       \
--bshl-color=$M        \
\
--screen 1            \
--force-clock               \
--indicator           \
--keylayout 2         \
--noinput-text='' 		\
--wrong-text='' 		\
--verif-text=''   \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --text-size=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc

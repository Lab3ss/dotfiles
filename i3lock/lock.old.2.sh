#!/usr/bin/env bash

# set the icon and a temporary location for the screenshot to be stored
icon=~/Development/dotfiles/i3lock/scarheadwhite.png
tmpbg=~/Development/dotfiles/i3lock/screen.png
# 
# take a screenshot
scrot -o "$tmpbg"
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
--time-color=$M        \
--date-color=$M       \
--layout-color=$M      \
--keyhl-color=$M       \
--bshl-color=$M        \
\
--screen 1            \
--force-clock               \
--indicator           \
\ # --greeter-text="There’s no need to call me ‘sir,’ Professor."           \
--greeter-text="The ministry has fallen. Scrimgeour is dead. They are coming"           \
--greeter-color='#FFFFFF88'           \
--greeter-size=24			\
--greeter-pos="w/2:3*(h/4)"					\
--time-str="%H:%M:%S"  \
--time-pos="w/2:h/4"					\
--time-size=48			\
--date-str="%A, %m %Y" \
--date-pos="w/2:(h/4)+30"					\
--date-size=18				\
--keylayout 2         \
--noinput-text='' 		\
--wrong-text='' 		\
--verif-text=''   \
--radius=120    \
--ring-width=28

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --text-size=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc

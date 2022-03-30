#!/usr/bin/env bash
xset -dpms s off

# set the icon and a temporary location for the screenshot to be stored
icon=~/Development/dotfiles/i3lock/lock.png
tmpbg=~/Development/dotfiles/i3lock/screen.png
# 
# take a screenshot
scrot -o "$tmpbg"
# 
# blur the screenshot
convert "$tmpbg" -blur 0x4 "$tmpbg"

# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

#!/bin/sh

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
\ # --greeter-text="There’s no need to call me ‘sir,’ Professor."           \
--greeter-text="The computer was born to solve problems that did not exist before."           \
--greeter-color='#FFFFFF88'           \
--greeter-size=24			\
--greeter-pos="w/2:3*(h/4)"					\
--time-str="%H:%M:%S"  \
--time-pos="w/2:h/4"					\
--time-size=64			\
--date-str="%A, %m %Y" \
--date-pos="w/2:(h/4)+50"					\
--date-size=26				\
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

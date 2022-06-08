#!/bin/bash

TMPBG=~/Pictures/lockscreen2.png
#TROLLFACE=~/Pictures/trollface.png

#MOUSE_ID=`xinput |  grep "Logitech Wireless Mouse M560" | cut -d= -f2 | cut -f1 -d '	'` 
MOUSE_ID_1=`xinput |  grep "Logitech MX Anywhere 2S" | head -n 1 | cut -d= -f2 | cut -f1 -d '	'` 
MOUSE_ID_2=`xinput |  grep "DELL08AF:00 06CB:76AF Mouse" | head -n 1 | cut -d= -f2 | cut -f1 -d '	'` 
MOUSE_ID_3=`xinput |  grep "DELL08AF:00 06CB:76AF Touchpad" | head -n 1 | cut -d= -f2 | cut -f1 -d '	'` 

scrot -o $TMPBG
i3lock -u -p win -i $TMPBG -t
xset -dpms s off

AUTH_SUCCESS=false
BLASTER_SCREWED=false

MOUSE_1_STATE1=$(xinput --query-state $MOUSE_ID_2 | grep 'button\[1\]')
MOUSE_2_STATE1=$(xinput --query-state $MOUSE_ID_3 | grep 'button\[1\]')
MOUSE_3_STATE1=$(xinput --query-state $MOUSE_ID_1 | grep 'button\[1\]')

while ! $AUTH_SUCCESS; do
	if ! $BLASTER_SCREWED; then
		MOUSE_1_STATE2=$(xinput --query-state $MOUSE_ID_2 | grep 'button\[1\]')
    MOUSE_2_STATE2=$(xinput --query-state $MOUSE_ID_3 | grep 'button\[1\]')
    MOUSE_3_STATE2=$(xinput --query-state $MOUSE_ID_1 | grep 'button\[1\]')
		if [ "$MOUSE_1_STATE1" != "$MOUSE_1_STATE2" ] || [ "$MOUSE_2_STATE1" != "$MOUSE_2_STATE2" ] || [ "$MOUSE_3_STATE1" != "$MOUSE_3_STATE2" ]; then
			pkill i3lock
			sleep 0.5;
			i3lock -u -p win -u -c ffffff
			#fswebcam -q -r 1280x720 --png -1  --underlay $TROLLFACE --scale 1920x1080 --banner-colour "#FF000000" --line-colour "#FF000000" --text-colour "#ffffff" --font "courier new:28" --title "Screwed up Dude..."  $TMPBG
			fswebcam -q -r 1280x720 --png -1 --scale 1920x1080 --banner-colour "#FF000000" --line-colour "#FF000000" --text-colour "#ffffff" --font "courier new:28" --title "Cramé poussin.."  $TMPBG
			pkill i3lock
			sleep 0.5;
			i3lock -u -p win -u -c 222222 -i $TMPBG
			BLASTER_SCREWED=true
		fi
		sleep 0.05
	else
		sleep 1
	fi
	if ! [[ `ps -aux | grep i3lock` =~ 'i3lock -u -p win' ]]; then
		AUTH_SUCCESS=true
	fi
done
xset s on

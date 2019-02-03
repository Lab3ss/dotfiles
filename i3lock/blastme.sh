
TMPBG=~/Images/lockscreen2.png
TROLLFACE=~/Images/fuck.png
MOUSE_ID=`xinput |  grep "Logitech Wireless Mouse M560" | cut -d= -f2 | cut -f1 -d '	'` 

scrot $TMPBG
i3lock -u -p win -i $TMPBG -t
xset s off

AUTH_SUCCESS=false
BLASTER_SCREWED=false

MOUSE_STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[1\]')

while ! $AUTH_SUCCESS; do
	if ! $BLASTER_SCREWED; then
		MOUSE_STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[1\]')
		if [ "$MOUSE_STATE1" != "$MOUSE_STATE2" ]; then
			pkill -f i3lock
			i3lock -u -p win -u -c ffffff
			fswebcam -q -r 1280x720 --png -1  --underlay $TROLLFACE --scale 1920x1080 --banner-colour "#FF000000" --line-colour "#FF000000" --text-colour "#001ec503" --font "courier new:22" --title "Screwed up" --subtitle "I'm looking your face on my phone right now :p" $TMPBG
			pkill -f i3lock
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

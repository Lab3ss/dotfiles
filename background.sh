while true; do

  TIME="$(date +"%H:%M")"
  DATE="$(date +"%a, %e %b")"

  echo $TIME
  echo $DAY
  echo $DATE
  convert -font "Chilanka-Regular" -gravity Center -fill "#ffffff30" -pointsize 260 -draw "text -940,-640 '$TIME'" /home/alexis/Pictures/background/main.png /home/alexis/Pictures/background/generated.png
  convert -font "Chilanka-Regular" -gravity Center -fill "#ffffff30" -pointsize 60 -draw "text -940,-490 '$DATE'" /home/alexis/Pictures/background/generated.png /home/alexis/Pictures/background/generated.png

  feh --bg-fill /home/alexis/Pictures/background/generated.png;
  sleep 1m
done

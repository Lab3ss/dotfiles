#!/bin/bash

pscircle \
    --output=./pscircle.jpg \
    --output-width=4096 \
    --output-height=2160 \
		--background-color=191d26 \
		--link-color-min=F97F8F \
		--link-color-max=F97F8F \
		--dot-color-min=F85F73 \
		--dot-color-max=F85F73 \
    --tree-font-size=18 \
		--tree-font-color=c5bfc5 \
    --tree-font-face="DejaVu Sans Mono" \
    --toplists-row-height=35 \
    --toplists-font-size=24 \
		--toplists-font-color=c5bfc5 \
		--toplists-pid-font-color=F85F73 \
    --toplists-font-face="DejaVu Sans Mono" \
    --toplists-bar-height=7 \
    --toplists-bar-background=c5bfc5 \
    --toplists-bar-color=F85F73;

TIME="$(date +"%H:%M")"
DAY="$(date +"%b")"
DATE="$(date +"%A, %e %B")"
convert -font "DejaVu-Sans-ExtraLight" -fill "#c5bfc5" -pointsize 180 -draw "text 3020,600 '$TIME'" pscircle.jpg pscircle.jpg
convert -font "DejaVu-Sans-ExtraLight" -fill "#c5bfc5" -pointsize 56 -draw "text 3050,710 '$DATE'" pscircle.jpg pscircle.jpg

feh --bg-fill ./pscircle.jpg;

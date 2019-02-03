#!/bin/bash

while true; do
	pscircle \
		--output=/home/alexis/Images/wallpapers/pscircle.png \
		--background-color=1d1d1d \
		--link-color-min=433751a0 \
		--link-color-max=433751 \
		--dot-color-min=3465A4 \
		--dot-color-max=3465A4 \
		--tree-font-size=18 \
		--tree-font-color=c5bfc5 \
		--tree-font-face="Noto Sans" \
		--toplists-row-height=35 \
		--toplists-font-size=24 \
		--toplists-font-color=c5bfc5 \
		--toplists-pid-font-color=4874ad \
		--toplists-font-face="Liberation Sans" \
		--toplists-bar-height=7 \
		--toplists-bar-background=444444 \
		--toplists-bar-color=6E4C6F;

	feh --bg-fill ~/Images/wallpapers/pscircle.png;
	sleep 10;
done

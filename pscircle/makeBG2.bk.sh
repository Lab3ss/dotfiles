#!/bin/bash

while true; do
	pscircle \
		--output=./pscircle.jpg \
		--background-color=191d26 \
		--link-color-min=00F85F73 \
		--link-color-max=00F85F73 \
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
		--toplists-bar-background=444444 \
		--toplists-bar-color=F85F73;

	# feh --bg-fill ~/Pictures/wallpapers/pscircle.jpg;
	sleep 10;
done

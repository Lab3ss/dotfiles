#!/bin/bash

while true; do
	pscircle \
		--output=./pscircle.jpg \
		--background-color=1d1d1d \
		--link-color-min=00AA8830 \
		--link-color-max=00AA8870 \
		--dot-color-min=00AA88 \
		--dot-color-max=00AA88 \
		--tree-font-size=18 \
		--tree-font-color=c5bfc5 \
		--tree-font-face="DejaVu Sans Mono" \
		--toplists-row-height=35 \
		--toplists-font-size=24 \
		--toplists-font-color=c5bfc5 \
		--toplists-pid-font-color=00AA88 \
		--toplists-font-face="DejaVu Sans Mono" \
		--toplists-bar-height=7 \
		--toplists-bar-background=444444 \
		--toplists-bar-color=00AA88;

	# feh --bg-fill ~/Pictures/wallpapers/pscircle.jpg;
	sleep 10;
done

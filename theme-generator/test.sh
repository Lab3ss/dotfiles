#!/bin/bash

color1Avr=190

color2Avr=92

color3Avr=203

color4Avr=29

darker=''
lighter=''
primary=''
secondary=''

assign_colors () {
    local averages=($color1Avr $color2Avr $color3Avr $color4Avr)
    local sorted=($(echo ${averages[*]}| tr " " "\n" | sort -n))
    darker=`echo ${sorted[0]}`
    lighter=`echo ${sorted[3]}`
        diff1=$((${sorted[1]} - 128))
        diff2=$((${sorted[2]} - 128))
        abs1=${diff1#-}
        abs2=${diff2#-}
        if ((abs1 <= abs2)); then
            primary=${sorted[1]}
            secondary=${sorted[2]}
        else
            primary=${sorted[2]}
            secondary=${sorted[1]}
        fi
}

assign_colors

echo $darker
echo $lighter
echo $primary
echo $secondary

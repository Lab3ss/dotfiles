#!/bin/bash

colorAvg=''

darker=''
lighter=''
primary=''
secondary=''

get_color_hunt_palettes () {
    res=`wget -qO- --no-check-certificate --method POST --body-data 'sort=popular&step=0&timeframe=4000' 'https://colorhunt.co/php/feed.php'`
}

get_color_average () {
    local colorRHex="`echo $1 | cut -c2-3`"
    local colorGHex="`echo $1 | cut -c4-5`"
    local colorBHex="`echo $1 | cut -c6-7`"
    local colorRDec="`echo $((16#$colorRHex))`"
    local colorGDec="`echo $((16#$colorGHex))`"
    local colorBDec="`echo $((16#$colorBHex))`"

    colorAvr=$((($colorRDec + $colorGDec + $colorBDec) / 3 ))
}

assign_colors () {
    local averages=($color1Avr $color2Avr $color3Avr $color4Avr)
    local sorted=($(echo ${averages[*]}| tr " " "\n" | sort -n))

    if [[ "${sorted[0]}" == "${averages[0]}" ]]; then
        darker=$color1
    fi
    if [[ "${sorted[0]}" == "${averages[1]}" ]]; then
        darker=$color2
    fi
    if [[ "${sorted[0]}" == "${averages[2]}" ]]; then
        darker=$color3
    fi
    if [[ "${sorted[0]}" == "${averages[3]}" ]]; then
        darker=$color4
    fi

    if [[ "${sorted[3]}" == "${averages[0]}" ]]; then
        lighter=$color1
    fi
    if [[ "${sorted[3]}" == "${averages[1]}" ]]; then
        lighter=$color2
    fi
    if [[ "${sorted[3]}" == "${averages[2]}" ]]; then
        lighter=$color3
    fi
    if [[ "${sorted[3]}" == "${averages[3]}" ]]; then
        lighter=$color4
    fi
        diff1=$((${sorted[1]} - 128))
        diff2=$((${sorted[2]} - 128))
        abs1=${diff1#-}
        abs2=${diff2#-}
        if ((abs1 <= abs2)); then
            if [[ "${sorted[1]}" == "${averages[0]}" ]]; then
                primary=$color1
            fi
            if [[ "${sorted[1]}" == "${averages[1]}" ]]; then
                primary=$color2
            fi
            if [[ "${sorted[1]}" == "${averages[2]}" ]]; then
                primary=$color3
            fi
            if [[ "${sorted[1]}" == "${averages[3]}" ]]; then
                primary=$color4
            fi

            if [[ "${sorted[2]}" == "${averages[0]}" ]]; then
                secondary=$color1
            fi
            if [[ "${sorted[2]}" == "${averages[1]}" ]]; then
                secondary=$color2
            fi
            if [[ "${sorted[2]}" == "${averages[2]}" ]]; then
                secondary=$color3
            fi
            if [[ "${sorted[2]}" == "${averages[3]}" ]]; then
                secondary=$color4
            fi
        else
            if [[ "${sorted[2]}" == "${averages[0]}" ]]; then
                primary=$color1
            fi
            if [[ "${sorted[2]}" == "${averages[1]}" ]]; then
                primary=$color2
            fi
            if [[ "${sorted[2]}" == "${averages[2]}" ]]; then
                primary=$color3
            fi
            if [[ "${sorted[2]}" == "${averages[3]}" ]]; then
                primary=$color4
            fi

            if [[ "${sorted[1]}" == "${averages[0]}" ]]; then
                secondary=$color1
            fi
            if [[ "${sorted[1]}" == "${averages[1]}" ]]; then
                secondary=$color2
            fi
            if [[ "${sorted[1]}" == "${averages[2]}" ]]; then
                secondary=$color3
            fi
            if [[ "${sorted[1]}" == "${averages[3]}" ]]; then
                secondary=$color4
            fi
        fi
}


res=''
get_color_hunt_palettes

palettes="`echo $res | sed 's/\"/\n/g' | grep '[a-z0-9]\{24\}'`"
qty="`echo $palettes | wc -w`"
random=$((1 + $RANDOM % $qty))

palette="`echo $palettes | cut -d " " -f $random`"
color1="#`echo $palette | cut -c1-6`"
color2="#`echo $palette | cut -c7-12`"
color3="#`echo $palette | cut -c13-18`"
color4="#`echo $palette | cut -c19-24`"

echo '--- BASE ---' 
echo $color1
echo $color2
echo $color3
echo $color4

get_color_average $color1
color1Avr=$colorAvr

get_color_average $color2
color2Avr=$colorAvr

get_color_average $color3
color3Avr=$colorAvr

get_color_average $color4
color4Avr=$colorAvr

echo '--- Averages ---' 
echo $color1Avr
echo $color2Avr
echo $color3Avr
echo $color4Avr

assign_colors


echo "Darker : $darker"
echo "Lighter : $lighter"
echo "Primary : $primary"
echo "Secondary : $secondary"

~/.nvm/versions/node/v14.8.0/bin/node ~/Development/dotfiles/theme-generator/index.js $darker $primary $secondary $lighter
feh --bg-fill ~/.backgrounds/trianglify.png

#i3_rofi_template=`cat ~/Development/dotfiles/polybar/config`

#echo "$i3_rofi_template" |
#	sed -e "s/primary = #[a-zA-Z0-9]*$/primary = $color1/g" > ~/Development/dotfiles/polybar/config

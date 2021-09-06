#!/bin/bash

~/.nvm/versions/node/v14.8.0/bin/node ~/Development/dotfiles/theme-generator/index.js > ~/Development/dotfiles/theme-generator/output.txt
feh --bg-fill ~/Development/dotfiles/theme-generator/trianglify.png

primary=$(head -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 1)
secondary=$(head -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 2)
lighter=$(head -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 3)
darker=$(head -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 4)
term=$(head -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 5)

color0=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 1)
color1=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 2)
color2=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 3)
color3=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 4)
color4=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 5)
color5=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 6)
color6=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 7)
color7=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 8)
color8=$(tail -n 1 ~/Development/dotfiles/theme-generator/scheme | cut -d ' ' -f 9)

polybar_config_template=`cat ~/Development/dotfiles/polybar/config`
echo "$polybar_config_template" | sed -e "s/secondary = #[a-zA-Z0-9]*$/secondary = $primary/g" -e "s/primary = #[a-zA-Z0-9]*$/primary = $lighter/g" > ~/Development/dotfiles/polybar/config

rofi_config_template=`cat ~/Development/dotfiles/rofi/dark.theme.template`
echo "$rofi_config_template" | sed -e "s/@PRIMARY/$primary/g" -e "s/@DARKER/$darker/g" > ~/Development/dotfiles/rofi/dark.theme

alacritty_config_template=`cat ~/Development/dotfiles/alacritty/alacritty.template.yml`
echo "$alacritty_config_template" | sed -e 's/^    background: "#[a-zA-Z0-9]\{6\}"$/    background: "'"$term"'"/g' -e 's/^    black:   "#[a-zA-Z0-9]\{6\}"$/    black:   "'"$color0"'"/g' -e 's/^    red:     "#[a-zA-Z0-9]\{6\}"$/    red:     "'"$color1"'"/g' -e 's/^    green:   "#[a-zA-Z0-9]\{6\}"$/    green:   "'"$color2"'"/g' -e 's/^    yellow:  "#[a-zA-Z0-9]\{6\}"$/    yellow:  "'"$color3"'"/g' -e 's/^    blue:    "#[a-zA-Z0-9]\{6\}"$/    blue:    "'"$color4"'"/g' -e 's/^    magenta: "#[a-zA-Z0-9]\{6\}"$/    magenta: "'"$color5"'"/g' -e 's/^    cyan:    "#[a-zA-Z0-9]\{6\}"$/    cyan:    "'"$color6"'"/g' -e 's/^    white:   "#[a-zA-Z0-9]\{6\}"$/    white:   "'"$color7"'"/g' > ~/Development/dotfiles/alacritty/alacritty.yml

echo "Primary : $primary"
echo "Secondary : $secondary"
echo "Lighter : $lighter"
echo "Darker : $darker"
echo "Term : $term"

echo "Color0: $color0"
echo "Color1: $color1"
echo "Color2: $color2"
echo "Color3: $color3"
echo "Color4: $color4"
echo "Color5: $color5"
echo "Color6: $color6"
echo "Color7: $color7"

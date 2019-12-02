#!/bin/bash 
DEFAULT='#00AA88';

COLOR=$1

if [ -z "$COLOR" ]
then
      COLOR=$DEFAULT
fi

HEXA_CODE=`echo $COLOR | sed -e "s/#\([0-9a-fA-F]*\)/\1/g"`

echo $HEXA_CODE

i3_config_template=`cat ./i3/config`
 
echo "$i3_config_template" | sed -e "s/set \$main_color .*$/set \$main_color #$HEXA_CODE/g" > './i3/config'
 
i3_pscircle_template=`cat ./pscircle/makeBG.sh`

echo "$i3_pscircle_template" |
	sed -e "s/dot-color-min=[0-9a-fA-F]*/dot-color-min=$HEXA_CODE/g" |
	sed -e "s/dot-color-max=[0-9a-fA-F]*/dot-color-max=$HEXA_CODE/g" |
	sed -e "s/link-color-min=[0-9a-fA-F]*/link-color-min=${HEXA_CODE}30/g" |
	sed -e "s/link-color-max=[0-9a-fA-F]*/link-color-max=${HEXA_CODE}70/g" |
	sed -e "s/toplists-bar-color=[0-9a-fA-F]*/toplists-bar-color=$HEXA_CODE/g" |
	sed -e "s/toplists-pid-font-color=[0-9a-fA-F]*/toplists-pid-font-color=$HEXA_CODE/g" > './pscircle/makeBG.sh'

i3_rofi_template=`cat ./rofi/dark.theme`

echo "$i3_rofi_template" |
	sed -e "s/cyan:[\s\t ]*#[0-9a-fA-F]*/cyan: #$HEXA_CODE/g" |
  sed -e "s/highlight: bold #[0-9a-fA-F]*/highlight: bold #$HEXA_CODE/g" > './rofi/dark.theme'

i3_lockscreen_template=`cat ./i3lock/lock.sh`

echo "$i3_lockscreen_template" |
	sed -e "s/M='#[0-9a-fA-F]*/M='#${HEXA_CODE}ee/g" > './i3lock/lock.sh'

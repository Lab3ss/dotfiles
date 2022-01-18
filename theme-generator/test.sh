#!/bin/bash

primary='#333290'
secondary='#AA0066'
lighter='#9922AA'
darker='#330044'

pscircle_config=`cat ~/Development/dotfiles/pscircle/makeBG.sh`
echo "$pscircle_config" | sed \
    -e 's/background-color=[a-zA-Z0-9]\{6\}/background-color='"$darker"'/g' \
    -e 's/link-color-min=[a-zA-Z0-9]\{8\}/link-color-min='"$primary"'30/g' \
    -e 's/link-color-max=[a-zA-Z0-9]\{8\}/link-color-max='"$primary"'70/g' \
    -e 's/dot-color-min=[a-zA-Z0-9]\{6\}/dot-color-min='"$primary"'/g' \
    -e 's/dot-color-max=[a-zA-Z0-9]\{6\}/dot-color-max='"$primary"'/g' \
    -e 's/tree-font-color=[a-zA-Z0-9]\{6\}/tree-font-color='"$lighter"'/g' \
    -e 's/toplists-font-color=[a-zA-Z0-9]\{6\}/toplists-font-color='"$lighter"'/g' \
    -e 's/toplists-pid-font-color=[a-zA-Z0-9]\{6\}/toplists-pid-font-color='"$primary"'/g' \
    -e 's/toplists-bar-color=[a-zA-Z0-9]\{6\}/toplists-bar-color='"$primary"'/g' | sed -e 's/=#/=/g' > ~/Development/dotfiles/pscircle/makeBG.sh


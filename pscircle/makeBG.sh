#!/bin/bash

pscircle \
    --output=./pscircle.jpg \
    --background-color=928A97 \
    --link-color-min=283C6350 \
    --link-color-max=283C6370 \
    --dot-color-min=283C63 \
    --dot-color-max=283C63 \
    --tree-font-size=18 \
    --tree-font-color=FBE8D3 \
    --tree-font-face="DejaVu Sans Mono" \
    --toplists-row-height=35 \
    --toplists-font-size=24 \
    --toplists-font-color=FBE8D3 \
    --toplists-pid-font-color=283C63 \
    --toplists-font-face="DejaVu Sans Mono" \
    --toplists-bar-height=7 \
    --toplists-bar-background=F85F73 \
    --toplists-bar-color=283C63;

feh --bg-fill ./pscircle.jpg;

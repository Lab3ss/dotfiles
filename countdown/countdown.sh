#!/bin/bash

for i in {1..10}
  do
    modulo=$((i%2))
    if [ $modulo -eq 0 ]
    then
       termdown 1200 -c 30 -b -f big -t BREAK -q 10
    else
       termdown 300 -c 30 -b -f big -t CODE -q 10
    fi
  done

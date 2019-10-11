#!/bin/bash

sleep 3
MOUSE_STATE1=$(xinput --query-state 4)
MOUSE_STATE2=$(xinput --query-state 10)
MOUSE_STATE3=$(xinput --query-state 13)
MOUSE_STATE4=$(xinput --query-state 18)
echo $MOUSE_STATE1
echo $MOUSE_STATE2
echo $MOUSE_STATE3
echo $MOUSE_STATE4


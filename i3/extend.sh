#!/bin/bash

# External = HDMI-1-0
# Internal = eDP-1
# Extend mode: HDMI to the right, 144Hz
xrandr --output eDP-1 --auto --primary \
       --output HDMI-1-0 --auto --right-of eDP-1 --rate 144.00


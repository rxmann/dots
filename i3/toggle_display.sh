#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-1-0"

# Check if both are active
if xrandr | grep "$INTERNAL connected" | grep -q '+' && \
   xrandr | grep "$EXTERNAL connected" | grep -q '+'; then
    # Switch to external only
    xrandr --output "$INTERNAL" --off \
           --output "$EXTERNAL" --auto --primary --rate 144.00
elif xrandr | grep "$EXTERNAL connected" | grep -q '+'; then
    # Switch to internal only
    xrandr --output "$EXTERNAL" --off \
           --output "$INTERNAL" --auto --primary
else
    # Fallback: extend
    ~/.config/i3/extend.sh
fi


#!/bin/bash
# volume.sh — prints a Nerd Font volume icon based on current sink state

volume=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null \
    | grep -oP '\d+(?=%)' | head -1)
muted=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null \
    | grep -oP '(?<=Mute: )\w+')

if [ "$muted" = "yes" ] || [ -z "$volume" ]; then
    echo "󰸈"
elif [ "$volume" -eq 0 ]; then
    echo "󰕿"
elif [ "$volume" -le 33 ]; then
    echo "󰕿"
elif [ "$volume" -le 66 ]; then
    echo "󰖀"
else
    echo "󰕾"
fi
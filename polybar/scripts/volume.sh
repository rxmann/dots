#!/bin/bash

# Get volume percentage
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1 | sed 's/%//')

# Get mute status
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')

# Define volume icons (similar to waybar)
if [ "$muted" = "yes" ]; then
    icon="󰸈"
    echo "$icon"
elif [ "$volume" -eq 0 ]; then
    icon="󰕿"
    echo "$icon"
elif [ "$volume" -le 33 ]; then
    icon="󰕿"
    echo "$icon"
elif [ "$volume" -le 66 ]; then
    icon="󰖀"
    echo "$icon"
else
    icon="󰕾"
    echo "$icon"
fi 
#!/bin/bash
# volume.sh - event-driven volume module (PulseAudio / PipeWire-pulse), plain white
print_volume() {
    local mute vol icon
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+(?=%)' | head -1)
    vol=${vol:-0}
    if [ "$mute" = "yes" ] || [ "$vol" -eq 0 ]; then
        icon="󰝟"
    elif [ "$vol" -lt 34 ]; then
        icon="󰕿"
    elif [ "$vol" -lt 67 ]; then
        icon="󰖀"
    else icon="󰕾"; fi
    echo "$icon ${vol}%"
}
print_volume
pactl subscribe 2>/dev/null | while read -r event; do
    case "$event" in
    *"'change' on sink "* | *"'change' on server"*) print_volume ;;
    esac
done

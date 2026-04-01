#!/bin/bash
# battery.sh — dynamic icon + warning/critical colors matching waybar states

BAT=$(ls /sys/class/power_supply/ 2>/dev/null | grep -i bat | head -1)
[ -z "$BAT" ] && echo "󰁹" && exit 0

capacity=$(cat /sys/class/power_supply/$BAT/capacity 2>/dev/null || echo 100)
status=$(cat /sys/class/power_supply/$BAT/status 2>/dev/null || echo "Unknown")

# Charging / plugged in
if [ "$status" = "Charging" ] || [ "$status" = "Full" ]; then
    echo "%{F#60a5fa}󰂄%{F-}"
    exit 0
fi

# Pick icon (5 steps, matches waybar format-icons array)
if   [ "$capacity" -ge 90 ]; then icon="󰁹"
elif [ "$capacity" -ge 70 ]; then icon="󰂁"
elif [ "$capacity" -ge 50 ]; then icon="󰁾"
elif [ "$capacity" -ge 25 ]; then icon="󰁻"
else                               icon="󰁺"
fi

# Color based on waybar thresholds (critical=15, warning=61)
if   [ "$capacity" -le 15 ]; then color="#f87171"
elif [ "$capacity" -le 61 ]; then color="#fbbf24"
else                               color="#ffffff"
fi

echo "%{F$color}$icon%{F-}"
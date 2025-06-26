#!/bin/bash
# ~/scripts/rofi-volume.sh
current_vol=$(pamixer --get-volume)
is_muted=$(pamixer --get-mute)

options="🔊 Increase\n🔉 Decrease\n🔇 Mute/Unmute ($is_muted)\n🔁 Toggle Sink"

chosen=$(echo -e "$options" | rofi -dmenu -p "Volume: $current_vol%")

case "$chosen" in
  "🔊 Increase") pamixer -i 5 ;;
  "🔉 Decrease") pamixer -d 5 ;;
  "🔇 Mute/Unmute (*)") pamixer -t ;;
  "🔁 Toggle Sink") pamixer --default-sink $(pamixer --list-sinks | rofi -dmenu -p "Sink") ;;
esac


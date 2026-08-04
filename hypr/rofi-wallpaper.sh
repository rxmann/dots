#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

selected_image=$(for wp in $WALLPAPERS; do
    echo -en "$(basename "$wp")\0icon\x1f$wp\n"
done | rofi -dmenu -p "Select Wallpaper" -theme-str '
element-icon { size: 50px; }
window { width: 400px; }
listView { lines: 8; }
')

if [ -n "$selected_image" ]; then
    FULL_PATH=$(find "$WALLPAPER_DIR" -type f -name "$selected_image" | head -n 1)

    if [ -f "$FULL_PATH" ]; then
        # 1. Preload the image into memory first
        hyprctl hyprpaper preload "$FULL_PATH"

        # 2. Set the wallpaper for your monitor and fallback
        hyprctl hyprpaper wallpaper "HDMI-A-1, $FULL_PATH"
        hyprctl hyprpaper wallpaper ", $FULL_PATH"

        # 3. Optional: Clean up old cached wallpapers to free memory
        hyprctl hyprpaper unload unused

        notify-send "Wallpaper Changed" "$selected_image"
    fi
fi

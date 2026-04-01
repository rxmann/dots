#!/bin/bash
# power_menu.sh — rofi power menu (replaces waybar GTK XML power_menu.xml)

chosen=$(printf "󰐥 Shutdown\n󰑓 Reboot\n󰍃 Logout\n󰤄 Suspend" \
    | rofi -dmenu -i -p "Power")

case "$chosen" in
    *Shutdown*) shutdown now ;;
    *Reboot*)   reboot ;;
    *Logout*)   i3-msg exit ;;
    *Suspend*)  systemctl suspend ;;
esac
#!/bin/bash
# ~/.config/waybar/rofi-power-menu.sh

# Options with icons (using Nerd Font / FontAwesome)
options=(
  "  Lock"
  "  Suspend"
  "  Reboot"
  "  Shutdown"
  "  Log Out"
)

# Convert array to newline-separated string
choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Power" -theme-str '
window {
  width: 600px;
}
listview {
  layout: horizontal;
  spacing: 20px;
}
element {
  padding: 10px;
  text-align: center;
}
')

case "$choice" in
  *Lock*)     lockscreen ;;  # Replace with your actual locker, like hyprlock
  *Suspend*)  systemctl suspend-then-hibernate ;;
  *Reboot*)   reboot ;;
  *Shutdown*) poweroff ;;
  *Log\ Out*) hyprctl dispatch exit ;;
  *) exit 1 ;;
esac


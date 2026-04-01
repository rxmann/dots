#!/bin/bash
show_icon() {
    current=$(powerprofilesctl get 2>/dev/null)
    case "$current" in
    performance) echo "󰓅" ;;
    balanced) echo "󰾆" ;;
    power-saver) echo "󱟡" ;;
    *) echo "⚡" ;;
    esac
}

show_menu() {
    chosen=$(printf "󰓅 Performance\n󰾆 Balanced\n󱟡 Power Saver" |
        rofi -dmenu -i -p "Power Profile")
    case "$chosen" in
    *Performance*) powerprofilesctl set performance ;;
    *Balanced*) powerprofilesctl set balanced ;;
    *"Power Saver"*) powerprofilesctl set power-saver ;;
    esac
}

case "$1" in
menu) show_menu ;;
*) show_icon ;;
esac


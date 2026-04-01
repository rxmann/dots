#!/bin/bash
# idle_inhibitor.sh — toggle idle inhibition, print status icon
# Usage: idle_inhibitor.sh status | toggle

PIDFILE="/tmp/polybar-idle-inhibitor.pid"

status() {
    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        echo "%{F#4ade80}󰌵%{F-}"   # activated
    else
        echo "%{F#cccccc}󰌶%{F-}"   # deactivated
    fi
}

toggle() {
    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        kill "$(cat "$PIDFILE")" 2>/dev/null
        rm -f "$PIDFILE"
    else
        (
            while true; do
                xdg-screensaver reset 2>/dev/null
                sleep 30
            done
        ) &
        echo $! > "$PIDFILE"
    fi
}

case "$1" in
    toggle) toggle ;;
    status|*) status ;;
esac
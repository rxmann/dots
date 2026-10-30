#!/bin/bash
# launch.sh - one identical bar on every connected monitor
# i3: exec_always --no-startup-id ~/projects/dots/polybar/launch.sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

CONFIG="$HOME/projects/dots/polybar/config.ini"
PRIMARY=$(xrandr --query | awk '/ connected primary/ {print $1; exit}')
[ -z "$PRIMARY" ] && PRIMARY=$(xrandr --query | awk '/ connected/ {print $1; exit}')

for m in $(xrandr --query | awk '/ connected/ {print $1}'); do
    if [ "$m" = "$PRIMARY" ]; then BAR=main; else BAR=secondary; fi
    MONITOR=$m polybar "$BAR" --config="$CONFIG" 2>&1 | tee -a "/tmp/polybar-$m.log" &
    disown
done

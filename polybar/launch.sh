#!/bin/bash
# launch.sh — kill any running polybar, then start fresh
# Source this from your i3 config:
#   exec_always --no-startup-id ~/projects/dots/polybar/launch.sh

# Kill existing instances
killall -q polybar

# Wait for them to die
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

# Launch bar (config must have [bar/main])
polybar main --config="$HOME/projects/dots/polybar/config.ini" 2>&1 \
    | tee -a /tmp/polybar.log & disown

INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"
WORKSPACES_TO_MOVE=(1 2 3 4 5 6 7 8 9 10 11)

#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"
WORKSPACES_TO_MOVE=(1 2 3 4 5 6 7 8 9 10 11)

move_all_workspaces() {
  local target_monitor="$1"
  for workspace in "${WORKSPACES_TO_MOVE[@]}"; do
    hyprctl dispatch moveworkspacetomonitor "$workspace" "$target_monitor"
  done
}

if hyprctl monitors | grep -q "^Monitor $INTERNAL"; then
  # Switch to external only
  hyprctl keyword monitor "$INTERNAL,disable"
  hyprctl keyword monitor "$EXTERNAL,1920x1080@120,auto,1"
  sleep 1  # Allow monitor to initialize
  move_all_workspaces "$EXTERNAL"
else
  # Switch to internal only
  hyprctl keyword monitor "$EXTERNAL,disable"
  hyprctl keyword monitor "$INTERNAL,1920x1080@60,auto,1"
  sleep 1  # Allow monitor to initialize
  move_all_workspaces "$INTERNAL"
fi


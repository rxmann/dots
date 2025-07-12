#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

# Show icon based on current profile
case "$current" in
    "performance")
        echo "󰓅"
        ;;
    "balanced")
        echo "󰾆"
        ;;
    "power-saver")
        echo "󱟡"
        ;;
    *)
        echo "⚡"
        ;;
esac 
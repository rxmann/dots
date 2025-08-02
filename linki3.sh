#!/bin/bash

DOTS=~/projects/dots
CONFIG=~/.config

echo "Linking i3..."
ln -sf "$DOTS/i3" "$CONFIG/i3"

echo "Linking polybar..."
ln -sf "$DOTS/polybar" "$CONFIG/polybar"

echo "Linking rofi..."
ln -sf "$DOTS/rofi" "$CONFIG/rofi"


echo "Linking picom..."
ln -sf "$DOTS/picom" "$CONFIG/picom"

echo "All symlinks created ✅"


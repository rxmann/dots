#!/bin/bash
# symlink_hypr_configs.sh

SRC_DIR="/home/rxman/projects/dots/omarchy-customs"
DEST_DIR="$HOME/.config/hypr"

mkdir -p "$DEST_DIR"

ln -sf "$SRC_DIR/customs.conf" "$DEST_DIR/customs.conf"
ln -sf "$SRC_DIR/input.conf" "$DEST_DIR/input.conf"

echo "Symlinks created:"
ls -l "$DEST_DIR" | grep -E "customs.conf|input.conf"


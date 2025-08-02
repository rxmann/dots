#!/bin/bash
set -e

DOTS=~/projects/dots
CONFIG=~/.config

link() {
    local src=$1
    local dst=$2

    echo "Linking $dst → $src"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        rm -rf "$dst"
    fi

    ln -s "$src" "$dst"
}

link "$DOTS/i3" "$CONFIG/i3"
link "$DOTS/polybar" "$CONFIG/polybar"
link "$DOTS/rofi" "$CONFIG/rofi"
link "$DOTS/tmux/.tmux.conf" ~/.tmux.conf
link "$DOTS/nvim" "$CONFIG/nvim"


echo "Linking picom..."
ln -sf "$DOTS/picom" "$CONFIG/picom"

echo "All symlinks created ✅"


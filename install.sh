#!/usr/bin/env bash

set -e -E

if [ "$#" -ne "1" ]; then
    echo "Usage: install.sh \$HOME" >&2
    exit 1
fi

HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="$1"

cd "$HERE"

projects=(
  #i3
  #i3status
  #git
  #rofi
  #alacritty
  tmux
  nvim
  zsh
)

echo "Symlinking files..."
S="$HERE/symlink.sh"
for project in "${projects[@]}"; do
    echo "($project)"
    HEREP="$HERE/$project"
    . "$HEREP/install.sh"
done

echo "Pulling submodules..."
git submodule --quiet init
git submodule --quiet update

#!/usr/bin/env bash
# install.sh — symlink dotfiles into place
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "  backing up $dst → $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

echo "==> tmux"
link ".tmux.conf" "$HOME/.tmux.conf"

echo "==> yabai"
link ".yabairc" "$HOME/.yabairc"

echo "==> nvim"
link "nvim/init.lua" "$HOME/.config/nvim/init.lua"
for f in nvim/lua/*.lua; do
  link "$f" "$HOME/.config/nvim/lua/$(basename "$f")"
done

echo "✓ Done"

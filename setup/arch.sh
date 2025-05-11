#!/bin/bash

function setup_yay {
  local old_dir
  old_dir=$(pwd)

  cd /tmp || exit
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si

  cd "$old_dir"
}


pacman_packages=(
  # Dotfiles managed using stow.
  stow
  # Emojis don't display correctly otherwise.
  noto-fonts
  noto-fonts-emoji
  # System Utils.
  networkmanager
  blueman
  bluez
  bluez-utils
  brightnessctl
  pavucontrol
  waybar
  man-db
  # Dev tooling.
  base-devel
  ghostty
  neovim
  git
  lazygit
  zsh
  tmux
  starship
  fzf
  go
  nodejs
  npm
)
sudo pacman -S --needed "${pacman_packages[@]}"

# Check if yay is installed and setup if needed.
if ! command -v yay &>/dev/null; then
  echo "Setting up yay..."
  setup_yay
fi

# Now install AUR packages.
yay_packages=(
  brave-bin
  qogir-gtk-theme
)
yay -S --needed "${yay_packages[@]}"


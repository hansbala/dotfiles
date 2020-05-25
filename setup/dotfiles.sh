#!/bin/sh

# Author: Hans Bala
# Purpose: Wrapper around essentially a stow command
#          that symlinks all application related config files
#          according to the path in the parent directory name
#   Ex: ~/.config/alacritty -> $DOTFILES/alacritty/.config/alacritty/
# Date Created: Tue May 26 01:10:26 IST 2020
# Date Modified: Tue May 26 01:10:38 IST 2020


# Script to setup dotfiles in the home directory
# Meant for Mac OS. Not tested on Linux

# Change into the parent dotfiles directory
cd ..
# Stow everything except setup scripts and the .stowrc file
stow alacritty git iterm2 npm nvim tmux wall xorg zsh --target=$HOME

echo 'Stowed all dotfiles into' $HOME 

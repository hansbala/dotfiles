#!/bin/sh

# Author: Hans Bala
# Purpose: Bootstraps the whole machine by installing all packages,
#          installs all dotfiles, and updates all settings
# Date Created: Tue May 26 01:19:12 IST 2020
# Date Modified: Tue May 26 01:19:23 IST 2020

DOTFILES_LOC='$HOME/Development/dotfiles'
DOTFILES_GITHUB='https://github.com/hansbala/dotfiles.git'

# Make sure the repo is installed in $DOTFILES_LOC
# git comes preinstalled with OS X so we don't have to worry about it
[ ! -d $DOTFILES_LOC ] && mkdir $DOTFILES_LOC && git clone $DOTFILES_GITHUB $DOTFILES_LOC

# Install homebrew and all required packages
sh ./brew.sh

# Setup mac settings
sh ./mac_settings.sh

# Sym link all dotfiles
sh ./dotfiles.sh

# Setup (n)vim
sh ./vim_setup.sh

# Finally, cleanup
./cleanup.sh

clear
echo 'ALL DONE!'


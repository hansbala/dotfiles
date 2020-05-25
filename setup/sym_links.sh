#!/bin/sh

# Create Vim symbolic links
ln -s -f ~/.dotfiles/vim/vimrc ~/.vimrc

# Create Z-shell symbolic links
ln -s -f ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s -f ~/.dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -s -f ~/.dotfiles/zsh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh

# Make a sym link to sublime text in /usr/local/bin
ln -s -f "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Remove unnecessary files if present in the home directory
[ -f ~/.bash_history ] && rm ~/.bash_history
[ -f ~/.bash_functions ] && rm ~/.bash_functions
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.zsh_history ] && rm ~/.zsh_history
[ -f ~/.viminfo ] && rm ~/.viminfo
[ -f ~/.zcompdump* ] && ~/.zcompdump*
[ -f ~/.vim_history ] && rm ~/.vim_history
[ -f ~/.DS_Store ] && rm ~/.DS_Store

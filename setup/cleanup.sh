#!/bin/sh

# Author: Hans Bala
# Purpose: Cleanup commonly created files that I do not need from $HOME
# Date Created: Tue May 26 01:10:26 IST 2020
# Date Modified: Tue May 26 01:10:38 IST 2020

# Remove unnecessary files if present in the home directory
[ -f ~/.bash_history ] && rm ~/.bash_history
[ -f ~/.bash_functions ] && rm ~/.bash_functions
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.zsh_history ] && rm ~/.zsh_history
[ -f ~/.viminfo ] && rm ~/.viminfo
[ -f ~/.zcompdump* ] && ~/.zcompdump*
[ -f ~/.vim_history ] && rm ~/.vim_history
[ -f ~/.DS_Store ] && rm ~/.DS_Store


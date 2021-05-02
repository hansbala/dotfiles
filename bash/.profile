#!/bin/sh

# This profile sources all that is necessary for bash
# This file sources my .bashrc which in turn
# sources all my aliases, custom defined functions 
# and such

# Silence the depracation warning for OS X bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# EDITOR / BROWSER config
export EDITOR=nvim
# Use the default web browser set by Darwin
if [[ $(uname -s) == "Darwin" ]]; then
  export BROWSER=open
fi

# Set the TERM variable to screen-256color so that colors
# appear sugary sweet in tmux and vim
export TERM=screen-256color

# Change the umask when on Linux machines
if [[ $(uname -s) == "Linux" ]]; then
  umask 077
fi

# Environmental related stuff goes in here
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES_LOCATION="$HOME/Development/dotfiles"
if [[ $(uname -s) == "Linux" ]]; then
  export DOTFILES_LOCATION="$HOME/dox/dotfiles"
fi

# Define environmental variables to change the path of the default config files
export XAUTHORITY="$HOME/.config/Xauthority"
export LESSHISTFILE="-"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ZDOTDIR="$HOME/.config/zsh"
export ZPLUG_HOME="$HOME/.config/zsh/.zplug"
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases

# FZF settings
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,__pycache__/*,python*/*}"'

# Change location of history file for bash
export HISTFILE="$XDG_CACHE_HOME/.bash_history":~/.cache/.bash_history

# Source the config file from ~/.config
[ -f "$XDG_CONFIG_HOME/bash/.bashrc" ] && source "$XDG_CONFIG_HOME/bash/.bashrc"

# Setting PATH for Python 3.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

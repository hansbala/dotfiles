#!/bin/sh

# EDITOR / BROWSER config
export EDITOR=nvim
# Use the default web browser set by Darwin
if [[ $(uname -s) == "Darwin" ]]; then
  export BROWSER=open
fi

# Change the umask when on Brown CIT machines
if [[ $(uname -s) == "Linux" ]]; then
  umask 077
fi

# Environmental related stuff goes in here
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES_LOCATION="$HOME/Development/dotfiles"
if [[ $(uname -s) == "Linux" ]]; then
export DOTFILES_LOCATION="$HOME/dev/dotfiles"
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

# BitWarden Session Key (you can try to copy this and try to decrypt my passwords, 
# but I already changed a few characters knowing your evil intentions 😉)
export BW_SESSION="di6ADvARt1QXuUecYmWWL1NCuoxTtExEshDT81xDd7Q+Zp+NJieDYVL90vJQ6gtwW1UIhpHKWLcn4x6YebU4+A=="

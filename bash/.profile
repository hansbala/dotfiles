#!/usr/bin/env bash

# Environment Variables
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES_LOC="$HOME/Development/dotfiles"
export XAUTHORITY="$HOME/.config/Xauthority"
export LESSHISTFILE="-"
export FZF_COMPLETION_TRIGGER="**"
export HISTFILE="$XDG_CACHE_HOME/.bash_history":~/.cache/.bash_history

# Better bash options
shopt -s autocd cdspell checkwinsize dirspell expand_aliases complete_fullquote\
         nocasematch promptvars progcomp histappend cmdhist lithist
set +o monitor -o braceexpand -o histexpand -o vi
bind 'set completion-ignore-case on'

# Check if starship is installed
if ! command -v starship &> /dev/null
then
 sh -c "$(curl -fsSL https://starship.rs/install.sh)" 
fi

# Import all user aliases
if test -f "$XDG_CONFIG_HOME/bash/aliases.bash"; then
  source "$XDG_CONFIG_HOME/bash/aliases.bash"
fi
# Import all user functions
if test -f "$XDG_CONFIG_HOME/bash/functions.bash"; then
  source "$XDG_CONFIG_HOME/bash/functions.bash"
fi
# Source the git aliases
if test -f "$XDG_CONFIG_HOME/bash/git-aliases.bash"; then
  source "$XDG_CONFIG_HOME/bash/git-aliases.bash"
fi
# Source the git aliases
if test -f "$XDG_CONFIG_HOME/bash/git-completion.bash"; then
  source "$XDG_CONFIG_HOME/bash/git-completion.bash"
fi

# Activate the starship prompt
eval "$(starship init bash)"

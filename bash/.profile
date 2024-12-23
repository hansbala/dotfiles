#!/usr/bin/env bash

# Environment Variables
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES_LOC="$HOME/workspace/dotfiles"
export XAUTHORITY="$HOME/.config/Xauthority"
export LESSHISTFILE="-"
export FZF_COMPLETION_TRIGGER="**"
export HISTFILE="$XDG_CACHE_HOME/.bash_history"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export PNPM_HOME="/Users/hans/.local/share/pnpm"
export PATH=$HOME/bin:~/go/bin:/opt/homebrew/bin:$PNPM_HOME:$PATH
export BASH_SILENCE_DEPRECATION_WARNING=1

# Better bash options
shopt -s cdspell nocasematch
bind 'set completion-ignore-case on'

# Import all aliases and functions
for f in $XDG_CONFIG_HOME/bash/*.nix.bash; do
  source $f
done
# Import some extra aliases and functions which are Mac specific
if [[ $(uname -s) == "Darwin" ]]; then
  for f in $XDG_CONFIG_HOME/bash/*.darwin.bash; do
    source $f
  done
fi

# PS1='\u \W$(__git_ps1 " (%s)")\$ '

# Activate the starship prompt
eval "$(starship init bash)"
. "$HOME/.cargo/env"

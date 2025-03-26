# Environment Variables
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES_LOCATION="$HOME/workspace/dotfiles"
export XAUTHORITY="$HOME/.config/Xauthority"
export LESSHISTFILE="-"
export FZF_COMPLETION_TRIGGER="**"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export PNPM_HOME="/Users/hans/.local/share/pnpm"
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/bin:~/go/bin:/opt/homebrew/bin:$PNPM_HOME:$PATH

# History Stuff
export HISTFILE="$XDG_CONFIG_HOME/zsh/history.zsh_history"
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups

# Import all aliases and functions
for f in $XDG_CONFIG_HOME/zsh/*.nix.zsh; do
  source $f
done
# Import some extra aliases and functions which are Mac specific
if [[ $(uname -s) == "Darwin" ]]; then
  for f in $XDG_CONFIG_HOME/zsh/*.darwin.zsh; do
    source $f
  done
fi

# Linux
if [[ $(uname -s) == "Linux" ]]; then
  for f in $XDG_CONFIG_HOME/zsh/*.linux.zsh; do
    source $f
  done
fi

# Activate the starship prompt
eval "$(starship init zsh)"

# source some private environement Variables
source "$HOME/.environment_variables"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

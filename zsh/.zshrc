# Environment Variables
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES_LOCATION="$HOME/workspace/dotfiles"
export XAUTHORITY="$HOME/.config/Xauthority"
export LESSHISTFILE="-"
export FZF_COMPLETION_TRIGGER="**"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export PNPM_HOME="/Users/hans/.local/share/pnpm"
export PATH=$HOME/bin:~/go/bin:/opt/homebrew/bin:$PNPM_HOME:$PATH
export HISTFILE="$XDG_CONFIG_HOME/zsh/history.zsh_history"

# vim style editing for zsh
bindkey -v

# share history across all terminals
setopt share_history

# fpath for zsh
fpath=($XDG_CONFIG_HOME/zsh/f, $fpath)

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

# Activate the starship prompt
eval "$(starship init zsh)"

# rust stuff
source "$HOME/.cargo/env"

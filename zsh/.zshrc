# Nix shell integration.
# macOS restores the OS-owned /etc/zshrc on major upgrades, which drops the
# PATH hook the Nix installer adds. Source it from a user-owned file instead.
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Cross-platform exports
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR='nvim'
export DOTFILES_LOCATION="$HOME/workspace/dotfiles"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export BUNDLE_USER_HOME="$XDG_CONFIG_HOME/bundle"
export GEM_HOME="$XDG_DATA_HOME/gem"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export OLLAMA_HOME="$XDG_DATA_HOME/ollama"
export PUB_CACHE="$XDG_DATA_HOME/pub-cache"
export CP_HOME_DIR="$XDG_CONFIG_HOME/cocoapods"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export LESSHISTFILE="-"
export FZF_COMPLETION_TRIGGER="**"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export PATH="$CARGO_HOME/bin:$GOPATH/bin:$PNPM_HOME:$HOME/.local/bin:$HOME/bin:$PATH"
export HISTFILE="$XDG_CONFIG_HOME/zsh/history.zsh_history"
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
# macOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
  export XAUTHORITY="$XDG_CONFIG_HOME/Xauthority"
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
  export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

  # Colima's Homebrew LaunchAgent starts without XDG_CONFIG_HOME, so it always
  # uses ~/.colima (the macOS default). Keep the shell on that same directory
  # and cache; otherwise Docker points at a socket the daemon never creates and
  # colima warns about the ~/.colima vs $XDG_CONFIG_HOME mismatch.
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
  colima() { XDG_CONFIG_HOME= XDG_CACHE_HOME= command colima "$@"; }
fi

setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups

bindkey -v
export KEYTIMEOUT=1
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^W' backward-kill-word

# Cursor: solid block in normal mode, blinking block in insert mode
function zle-keymap-select zle-line-init {
  case "${KEYMAP}" in
    vicmd)      printf '\e[2 q' ;;
    viins|main) printf '\e[1 q' ;;
  esac
}
function zle-line-finish { printf '\e[1 q' }
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

for f in $XDG_CONFIG_HOME/zsh/*.nix.zsh; do
  source $f
done

if [[ -f "$XDG_CONFIG_HOME/.environment_variables" ]]; then
  source "$XDG_CONFIG_HOME/.environment_variables"
fi

eval "$(starship init zsh)"

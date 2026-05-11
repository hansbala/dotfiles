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

export XAUTHORITY="$XDG_CONFIG_HOME/Xauthority"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
export FZF_COMPLETION_TRIGGER="**"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export DOCKER_HOST="unix://${XDG_CONFIG_HOME}/colima/default/docker.sock"

export PATH="$GOPATH/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
export PATH="$CARGO_HOME/bin:$GOPATH/bin:$PNPM_HOME:$HOME/.local/bin:$HOME/bin:$PATH"

export HISTFILE="$XDG_CONFIG_HOME/zsh/history.zsh_history"
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
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

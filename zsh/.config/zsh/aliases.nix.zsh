alias cl='clear'
alias reload='source ~/.zshrc'
alias tmux='tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias l='ls -l --color'
alias ll='ls -alh --color'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" --show-progress'
alias lg='lazygit'
alias nv='cd $HOME/.config/nvim && nvim'
alias dotfiles='cd $DOTFILES_LOCATION'

if [[ "$(uname -s)" == "Darwin" ]]; then
  alias l='eza --long --header --git --ignore-glob .DS_Store --icons'
  alias ll='l --all'
  alias treev='eza --tree --header --git --ignore-glob .DS_Store --icons --all'
  alias lg='lazygit'
  alias x='open &>/dev/null'
  alias speed_test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
  alias tmux-copy="pbcopy"
fi

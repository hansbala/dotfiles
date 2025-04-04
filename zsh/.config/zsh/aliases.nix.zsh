# This file holds all my other user defined aliases
# Usually it is a good practice to place aliases in
# a separate file. So that is what I am doing here :')

alias cl='clear'
alias lc='clear'
alias reload='source ~/.zshrc'
alias tmux='tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias lock='xlock'
alias x='xdg-open &>/dev/null'
alias l='ls -l --color'
alias ll='ls -alh --color'
alias py='python3'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias cs1951a_venv='source ~/Development/datascience/cs1951a_venv/bin/activate'
alias sq='sqlite3'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" --show-progress'
alias lg='lazygit'
alias tmux-copy="wl-copy"
alias nv='cd $HOME/.config/nvim && nvim'

# Access common config files and directories
alias dotfiles='cd $DOTFILES_LOCATION'
alias vimrc='$EDITOR $XDG_CONFIG_HOME/nvim/init.vim'
alias profile='$EDITOR ~/.profile'
alias functions='$EDITOR ~/.config/zsh/functions.nix.zsh'
alias aliases='$EDITOR ~/.config/zsh/aliases.nix.zsh'
alias tmux_conf='$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf'

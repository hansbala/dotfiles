# This file holds all my other user defined aliases
# Usually it is a good practice to place aliases in
# a separate file. So that is what I am doing here :')

alias cl='clear'
alias lc='clear'
alias reload='source ~/.profile'
alias tmux='tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias cs141='cd course/cs1410/'
alias lock='xlock'
alias coolflip='bash /local/projects/twist/bin/coolflip'
alias x='xdg-open &>/dev/null'
alias l='ls -l --color'
alias ll='ls -alh --color'
alias py='python3'
alias v='nvim'
alias vim='nvim'
alias cs1951a_venv='source ~/Development/datascience/cs1951a_venv/bin/activate'
alias sq='sqlite3'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" --show-progress'

# Access common config files and directories
alias dotfiles='cd $DOTFILES_LOCATION'
alias vimrc='$EDITOR $XDG_CONFIG_HOME/nvim/init.vim'
alias profile='$EDITOR ~/.profile'
alias functions='$EDITOR ~/.config/bash/functions.nix.bash'
alias aliases='$EDITOR ~/.config/bash/aliases.nix.bash'
alias tmux_conf='$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf'

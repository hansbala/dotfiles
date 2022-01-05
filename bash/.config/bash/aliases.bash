# This file holds all my other user defined aliases
# Usually it is a good practice to place aliases in
# a separate file. So that is what I am doing here :')

alias cl='clear'
alias lc='clear'
alias reload='source ~/.profile'
alias tmux='tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias cs141='cd course/cs1410/'
alias aienv='source /course/cs1410/venv/bin/activate'
alias lock='xlock'
alias coolflip='bash /local/projects/twist/bin/coolflip'
alias cformat='cs0330_reformat'
alias x='xdg-open &>/dev/null'
alias l='ls -l --color'
alias ll='ls -alh --color'
alias py='python3'
alias v='nvim'
alias vim='nvim'

# Access common config files and directories
alias dotfiles='cd $DOTFILES_LOCATION'
alias vimrc='$EDITOR $XDG_CONFIG_HOME/nvim/init.vim'
alias profile='$EDITOR ~/.profile'
alias tmux_conf='$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf'

# Add mac related aliases only after this
if [[ $(uname -s) == "Darwin" ]]; then
  source "$XDG_CONFIG_HOME/bash/mac-aliases.bash"
fi

#!/usr/bin/env zsh

# All Mac related aliases / aliases I want only on mac machines
# are stored in here

# better options
alias l='eza --long --header --git --ignore-glob .DS_Store --icons'
alias ll='l --all'
alias treev='eza --tree --header --git --ignore-glob .DS_Store --icons --all'
alias lg='lazygit'

# shortcuts + utilities
alias x='open &>/dev/null'
alias ext='extract'
alias fixvpn='sudo ifconfig lo0 -alias 192.0.2.2'
alias beast_mode='caffeinate'
alias locip='ipconfig getifaddr en0'
alias extip='curl ipecho.net/plain; echo'
alias trash='rm -rf $HOME/.Trash/*'
alias reset_audio='sudo killall coreaudiod && sudo launchctl start com.apple.coreaudiod'
alias finder='open .'
alias speed_test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias tmux-copy="pbcopy"

# locations
alias down='cd $HOME/Downloads'
alias docs='cd $HOME/Documents'
alias shots='cd $HOME/Pictures/Screenshots'
alias dev='cd $HOME/Development'
alias mnt='cd $HOME/Documents/local_mnt'
alias conf='cd $XDG_CONFIG_HOME'

# code whisperer aliases
alias ai='cw ai'

alias ctags="`brew --prefix`/bin/ctags"


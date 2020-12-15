# This file holds all my other user defined aliases
# Usually it is a good practice to place aliases in
# a separate file. So that is what I am doing here :')

# Darwin: better commands
alias l='exa --long --header --git --ignore-glob .DS_Store --icons'
alias ll='l --all'
alias treev='exa --tree --header --git --ignore-glob .DS_Store --icons --all'
alias x='open &>/dev/null'
alias ext='extract'
alias cl='clear'
alias lc='clear'
alias reload='source ~/.profile'
alias tmux='tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

# Development aliases
alias py='python3'
alias v='nvim'
alias vim='nvim'
alias weenix='cd ~/Development/weenix'
alias weenixssh='cd ~/Development/weenix && vagrant up && vagrant ssh -- -Y'
alias 132aws='ssh -i "hbala-mbp.pem" ec2-user@ec2-34-205-78-216.compute-1.amazonaws.com'

# Access common config files and directories
alias dotfiles='cd $DOTFILES_LOCATION'
alias vimrc='$EDITOR $XDG_CONFIG_HOME/nvim/init.vim'
# alias zshrc='$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc'
alias bashrc='$EDITOR $XDG_CONFIG_HOME/bash/.bashrc'
alias profile='$EDITOR ~/.profile'
# alias zshenv='$EDITOR $HOME/.zshenv'
alias aliases='$EDITOR $XDG_CONFIG_HOME/bash/aliases.bash'
alias funcs='$EDITOR $XDG_CONFIG_HOME/bash/functions_general.bash'
alias tmux_conf='$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf'

# Darwin: Helpful aliases
alias quit='killall iTerm2'
alias beast_mode='caffeinate'
alias local_ip='ipconfig getifaddr en0'
alias external_ip='curl ipecho.net/plain; echo'
alias trash='rm -rf $HOME/.Trash/*'
alias air='BluetoothConnector --connect 60-8c-4a-43-b3-8b && echo "successfully paired with airpods"'
alias marshall='BluetoothConnector --connect 10-d0-7a-b6-b8-96'
alias reset_audio='sudo killall coreaudiod && sudo launchctl start com.apple.coreaudiod'
alias speed_test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# Darwin: commonly visited directories
alias gd='cd /Users/hansbala/Google/'
alias down='cd $HOME/Downloads'
alias docs='cd $HOME/Documents'
alias shots='cd $HOME/Pictures/Screenshots'
alias dev='cd $HOME/Development'
alias mnt='cd $HOME/Documents/local_mnt'
alias conf='cd $XDG_CONFIG_HOME'

# Only import platform specific aliases 
# (for compatibility between OS X and linux)
if [[ $(uname -s) == "Linux" ]]; then
  # Brown CIT Directories
  alias cs141='cd course/cs1410/'
  alias aienv='source /course/cs1410/venv/bin/activate'
  #Global Brown CIT aliases
  alias lock='xlock'
  alias coolflip='bash /local/projects/twist/bin/coolflip'
  alias cformat='cs0330_reformat'
  alias x='xdg-open &>/dev/null'
  # Update ls related aliases that do not have exa installed to use standard ls with colors
  alias l='ls -l --color'
  alias ll='ls -alh --color'
fi

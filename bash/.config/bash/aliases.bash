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
alias fixvpn='sudo ifconfig lo0 -alias 192.0.2.2'

# Access common config files and directories
alias dotfiles='cd $DOTFILES_LOCATION'
alias vimrc='$EDITOR $XDG_CONFIG_HOME/nvim/init.vim'
alias bashrc='$EDITOR $XDG_CONFIG_HOME/bash/.bashrc'
alias profile='$EDITOR ~/.profile'
alias aliases='$EDITOR $XDG_CONFIG_HOME/bash/aliases.bash'
alias funcs='$EDITOR $XDG_CONFIG_HOME/bash/functions_general.bash'
alias tmux_conf='$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf'

# Darwin: Helpful aliases
alias beast_mode='caffeinate'
alias locip='ipconfig getifaddr en0'
alias extip='curl ipecho.net/plain; echo'
alias trash='rm -rf $HOME/.Trash/*'
alias reset_audio='sudo killall coreaudiod && sudo launchctl start com.apple.coreaudiod'
alias speed_test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias finder='open .'

# Darwin: commonly visited directories
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

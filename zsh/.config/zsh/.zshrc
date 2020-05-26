# Manually set environment language
export LANG=en_US.UTF-8

# Allow colors in ZSH
autoload colors && colors
setopt prompt_subst
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in completion menu
_comp_options+=(globdots)

# Faster key timeout for vi-mode in zsh
export KEYTIMEOUT=1

# Plugin stuff
# Check if the zplug exists; if not, download and source it
if [ ! -f $ZPLUG_HOME/init.zsh ]; then
  mkdir -p $ZPLUG_HOME
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh
# Output commands on the top of the shell (since I find myself 
# clearing the screen often)
#zplug "Valiev/almostontop"
# Change rm so that it goes to trash instead of unlinking the file
zplug "mattmc3/zsh-safe-rm"
# Add support to directly go up n directories
zplug "peterhurford/up.zsh"
# Useful git aliases
zplug "mdumitru/git-aliases"
# Robby Russell zsh theme
zplug "themes/robbyrussell", from:oh-my-zsh
# Better command syntax highlighting (defer:2 to load after compinit)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# Check if the plugins have been installed; install otherwise
zplug check || zplug install > /dev/null
# Load the plugins
zplug load

# Add some directories if on a Linux machine
if [[ $(uname -s) == "Linux" ]]; then
  export PATH=/course/cs1670/bin:$PATH
  export PATH=/course/cs0330/bin:$PATH
  export PATH=/course/cs1320/bin:$PATH
  export PATH=/course/cs1320/bin/node-v12.14.1-linux-x64/bin:$PATH
fi

# Set default username so zsh can properly format in the shell prompt
DEFAULT_USER=hansbala

# Modify path to include some custom ../bin directories
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Treats - and _ as equivalent whilst auto-completing commands
HYPHEN_INSENSITIVE="true"

# Enable red dots whilst waiting for program completion
COMPLETION_WAITING_DOTS="true"

# Source all necessary files
[ -f "$ZDOTDIR"/aliases.zsh ] && source "$ZDOTDIR"/aliases.zsh
[ -f "$ZDOTDIR"/functions.zsh ] && source "$ZDOTDIR"/functions.zsh
[ -f "$ZDOTDIR"/fzf.zsh ] && source "$ZDOTDIR"/fzf.zsh
[ -f "$ZDOTDIR"/keybindings.zsh ] && source "$ZDOTDIR"/keybindings.zsh

# Clear the terminal screen to remove the annoying 'last login' and zplug stuff
if [[ $(uname -s) == "Darwin" ]]; then
  clear
fi

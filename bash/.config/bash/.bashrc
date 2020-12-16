#!/bin/sh

# Enable case-insensitive tab completion for bash
bind 'set completion-ignore-case on'

# Source all Bash related modules
[ -f "$XDG_CONFIG_HOME/bash/prompt.bash" ] && . "$XDG_CONFIG_HOME/bash/prompt.bash"
[ -f "$XDG_CONFIG_HOME/bash/aliases.bash" ] && . "$XDG_CONFIG_HOME/bash/aliases.bash"
[ -f "$XDG_CONFIG_HOME/bash/functions_general.bash" ] && . "$XDG_CONFIG_HOME/bash/functions_general.bash"
[ -f "$XDG_CONFIG_HOME/bash/functions_brown.bash" ] && . "$XDG_CONFIG_HOME/bash/functions_brown.bash"
[ -f "$XDG_CONFIG_HOME/bash/keybindings.bash" ] && . "$XDG_CONFIG_HOME/bash/keybindings.bash"
[ -f "$XDG_CONFIG_HOME/fzf/fzf.bash" ] && . "$XDG_CONFIG_HOME/fzf/fzf.bash"
[ -f "$XDG_CONFIG_HOME/bash/git-completion.bash" ] && . "$XDG_CONFIG_HOME/bash/git-completion.bash"
[ -f "$XDG_CONFIG_HOME/bash/git-aliases.bash" ] && . "$XDG_CONFIG_HOME/bash/git-aliases.bash"

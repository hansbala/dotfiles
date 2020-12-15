#!/bin/sh

# Source all Bash related modules
[ -f "$XDG_CONFIG_HOME/bash/prompt.bash" ] && . "$XDG_CONFIG_HOME/bash/prompt.bash"
[ -f "$XDG_CONFIG_HOME/bash/aliases.bash" ] && . "$XDG_CONFIG_HOME/bash/aliases.bash"
[ -f "$XDG_CONFIG_HOME/bash/functions_general.bash" ] && . "$XDG_CONFIG_HOME/bash/functions_general.bash"
[ -f "$XDG_CONFIG_HOME/bash/functions_brown.bash" ] && . "$XDG_CONFIG_HOME/bash/functions_brown.bash"
[ -f "$XDG_CONFIG_HOME/bash/keybindings.bash" ] && . "$XDG_CONFIG_HOME/bash/keybindings.bash"
[ -f "$XDG_CONFIG_HOME/fzf/fzf.bash" ] && . "$XDG_CONFIG_HOME/fzf/fzf.bash"

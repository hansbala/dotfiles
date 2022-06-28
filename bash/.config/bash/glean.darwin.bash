# Glean Work related configuration options

export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/workspace/scio
export PATH=$(gcloud --format='value(installation.sdk_root)' info)/bin:$PATH

alias xbrew="arch -x86_64 /usr/local/bin/brew"
alias sc='cd ~/workspace/scio'
alias scenv='source ~/workspace/scio/python_scio/scio_env/bin/activate'
alias bazel="$HOME/workspace/scio/tools/mybazel.sh"

# Source the Scio completion framework
source $HOME/workspace/scio/scio-completion.bash

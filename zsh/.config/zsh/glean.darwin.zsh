# Glean Work related configuration options

export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/workspace/scio
export PATH=$(gcloud --format='value(installation.sdk_root)' info)/bin:$PATH
export GOROOT=/opt/homebrew/Cellar/go@1.17/1.17.13/libexec
export GOBIN=~/go/bin

alias xbrew="arch -x86_64 /usr/local/bin/brew"
alias sc='cd ~/workspace/scio'
alias scenv='source ~/workspace/scio/python_scio/scio_env/bin/activate'
alias bazel="$HOME/workspace/scio/tools/mybazel.sh"

alias yd='yarn dev'

alias local_admin='scio run_local -m admin --cloud_sql --scio_instance=salessavvy2 --forge_admin_auth'
alias local_feqe='scio run_local -m fe qe --cloud_sql --scio_instance=glean-dev'
alias gcpla='git cherry-pick 2e04f1b57d88a806cce69399e8965eed4fbca5f9'

# Source the Scio completion framework
# source $HOME/workspace/scio/scio-completion.bash

function morn() {
    gcloud auth application-default login
}

function openpr() {
  github_url="https://github.com/askscio/scio"
  # github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`;
  branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`;
  pr_url=$github_url"/compare/master..."$branch_name
  open $pr_url
}

alias ss2_ini='gs://config-glean-salessavvy2/dynamic.ini'

alias bbt='bazel build //typescript/... && bazel test //typescript/...'

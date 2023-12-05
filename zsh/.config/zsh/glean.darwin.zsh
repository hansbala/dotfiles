# Glean Work related configuration options

export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/workspace/scio
export PATH=$(gcloud --format='value(installation.sdk_root)' info)/bin:$PATH
export PATH="/opt/homebrew/opt/go@1.17/bin:$HOME/go/bin${PATH+:$PATH}"``
export CLOUDSDK_PYTHON="/Users/hans/workspace/scio/python_scio/scio_env/bin/python"
export GOROOT=/opt/homebrew/Cellar/go@1.17/1.17.13/libexec
export GOPATH=/Users/hans/go
export GOBIN=~/go/bin
export PATH=$PATH:$GOBIN

alias xbrew="arch -x86_64 /usr/local/bin/brew"
alias sc='cd ~/workspace/scio'
alias scenv='source ~/workspace/scio/python_scio/scio_env/bin/activate'
alias bazel="$HOME/workspace/scio/tools/mybazel.sh"

alias p='pnpm'
alias pp='p i && p dev'
alias local_admin='scio run_local -m admin --cloud_sql --scio_instance=salessavvy2 --forge_admin_auth'
alias local_feqe='scio run_local -m fe qe --cloud_sql --scio_instance=glean-dev'
alias gcpla='git cherry-pick 2e04f1b57d88a806cce69399e8965eed4fbca5f9'

alias gpass='bw_get_password_glean_google'

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

# Runs an upgrade op on glean-dev for testing purposes
# Example usage: migrate 20230512 YourOperationName
function migrate() {
  bazel run //python_scio/deployment:upgrade -- --force_rerun dev-sandbox-334901 release_"$1"."$2";
}

alias ss2_ini='gs://config-glean-salessavvy2/dynamic.ini'

alias bbt='bazel build //typescript/... && bazel test //typescript/...'

# Gcloud utilities

# Used for switching between gcloud projects
function switch_me() {
	gcloud config configurations activate default
	gcloud config set account hans.bala@glean.com;
	if [ -z "$1" ]
	then
		PROJECT_ID=scio-apps
	else
		PROJECT_ID=$1
	fi
	echo "Set project to: [$PROJECT_ID]"
	gcloud config set project $PROJECT_ID;
	unset GOOGLE_CLOUD_PROJECT
	unset GOOGLE_APPLICATION_CREDENTIALS
}

# Used for switching between customer projects
function switch_customer() {
	gcloud auth activate-service-account --key-file="$1";
	PROJECT_ID=`cat "$1" | jq -j .project_id`
	echo "Set project to: [$PROJECT_ID]"
	gcloud config set project -q $PROJECT_ID;
	export GOOGLE_CLOUD_PROJECT=$PROJECT_ID
	export GOOGLE_APPLICATION_CREDENTIALS=$1
}

function gare {
  CURR_BRANCH=`git rev-parse --abbrev-ref HEAD`
  git checkout master
  git pull
  git switch -
  git rebase master --interactive
}

function greb {
  CURR_BRANCH=`git rev-parse --abbrev-ref HEAD`
  SELECTED_BRANCH=$(git branch | fzf)
  git checkout $SELECTED_BRANCH
  git pull
  git switch -
  git rebase $SELECTED_BRANCH --interactive
}

function get_dropped_stash {
  git log --graph --oneline --decorate $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
}

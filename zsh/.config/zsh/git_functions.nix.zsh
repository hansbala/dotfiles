function gare {
  CURR_BRANCH=`git rev-parse --abbrev-ref HEAD`
  git checkout master
  git pull
  git switch -
  git rebase master --interactive
}

function greb {
  CURR_BRANCH=`git rev-parse --abbrev-ref HEAD`
  SELECTED_BRANCH=$(git branch | fzf | tr -d '[:space:]')
  git checkout $SELECTED_BRANCH
  git pull
  git switch -
  git rebase $SELECTED_BRANCH --interactive
}

function get_dropped_stash {
  git log --graph --oneline --decorate $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
}

function fzf_over_branches_and_maybe_create {
  # given a list of branches, select one with fzf
  # if no branch is selected, create a new one with the given name
  # otherwise, checkout the selected branch
  # usage: fzf_over_branches <branch_name>
  branch_name_with_query=$(git branch | fzf --print-query)
  number_lines=$(echo "$branch_name_with_query" | wc -l)
  # if there is only one line, then the query is the branch name
  if [ "$number_lines" -eq "1" ]; then
    branch_name=$(echo "$branch_name_with_query" | tr -d '[:space:]')
  else
    # create a new branch with the second line of branch_name_with_query
    branch_name=$(echo "$branch_name_with_query" | sed -n 2p | tr -d '[:space:]' | tr -d '*')
  fi

  # try to checkout the branch, if it doesn't exist, create it
  git checkout "$branch_name" 2>/dev/null || git checkout -b "$branch_name"
}


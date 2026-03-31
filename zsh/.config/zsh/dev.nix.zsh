alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force'
alias gpfn='git push --force --no-verify'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-verify'
alias gco='git checkout $(git branch | fzf)'
alias gpo='git push -u origin HEAD'
alias grsi='git restore --staged $(fzf -m)'

function greb {
  CURR_BRANCH=`git rev-parse --abbrev-ref HEAD`
  SELECTED_BRANCH=$(git branch | fzf | tr -d '[:space:]')
  git checkout $SELECTED_BRANCH
  git pull
  git switch -
  git rebase $SELECTED_BRANCH --interactive
}

function openpr {
  local REPO_URL=$(git remote get-url origin 2>/dev/null | sed 's/\.git$//' | sed 's|git@github.com:|https://github.com/|')
  local BRANCH=$(git branch --show-current)

  if [[ -z "$REPO_URL" ]]; then
    echo "Error: No git remote found."
    return 1
  fi

  if [[ -z "$BRANCH" ]]; then
    echo "Error: Not on a git branch."
    return 1
  fi

  local OPEN_CMD
  if command -v open > /dev/null; then
    OPEN_CMD=open
  else
    OPEN_CMD=xdg-open
  fi

  $OPEN_CMD "$REPO_URL/pull/new/$BRANCH"
}

function gpub {
  # Pushes current HEAD to origin, setting upstream automatically
  git push -u origin HEAD "$@"
}

function nr {
  nix develop --command "$@"
}

function lines {
  local base=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed "s@^refs/remotes/origin/@@")
  [ -z "$base" ] && base=$(git branch -l main master 2>/dev/null | head -1 | tr -d '* ')
  git diff --stat $(git merge-base "$base" HEAD)
}

# commonly used git aliases

alias gs='git status'
alias gai='git add $(fzf -m)'
alias gco='git checkout $(git branch | fzf)'

alias gl='git pull'
alias gp='git push'
alias gpo='git push -u origin HEAD'
alias gpf='git push --force'
alias gpn='git push --force --no-verify'

alias grsi='git restore --staged $(fzf -m)'

alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias grs='git rebase --skip'

alias gb='fzf_over_branches_and_maybe_create'

alias gc='git commit'
alias gcn='git commit --no-verify'

# commonly used git aliases

alias gs='git status'
alias gai='git add $(fzf -m)'
alias gco='git checkout $(git branch | fzf)'

alias gl='git pull'
alias gp='git push'

alias grsi='git restore --staged $(fzf -m)'

alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias grs='git rebase --skip'

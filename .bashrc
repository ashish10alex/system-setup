# will be ~/.zshrc if using zsh shell

# show git diff in fzf
gdiff() {
git status -s | fzf --no-sort --reverse --preview 'git diff --color=always {+2} '
}

# git diff prettier but less info
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


export TERM=screen-256color # to enable vim syntax highlighting in tmux sessions

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias vi='nvim'
alias tattach='tmux attach -t'
alias tnew='tmux new-session -s'

# alias to make life easier
alias lg="ls | grep"
alias lpath='echo $PATH | tr ":" "\n"' # list the PATH separated by new lines
alias cat='bat --paging=never'
alias grep='batgrep'

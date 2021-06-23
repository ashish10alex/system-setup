#show git diff in fzf
gdiff() {
git status -s | fzf --no-sort --reverse --preview 'git diff --color=always {+2} '
}

# git diff pretier but less info
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


eval "$(starship init zsh)"

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit
source ~/.zsh/completion/dj
source ~/.zsh/completion/cobra-cli

gdiff() {
  git status -s | fzf --no-sort --reverse --preview 'git diff --ignore-space-at-eol {+2} | delta' --preview-window 'top' --preview-window '75%'
}

gitlog() {
    git log --graph --pretty=format:'%C(auto)%h%d (%cr) %cn <%aE> %s'

}

# creates a new directory and cds into it
mkcd() {
    mkdir -p -- "$1" && cd "$1"
}

cdataform() {
    dataform compile --json | jq -r '.[]?| values[]?| "\n -- " + .fileName? + "\n  " +.query?' > /tmp/temp.sqlx
}

#bring dune
eval $(opam config env)


alias lg="ls | grep"
alias ta='tmux attach'
alias tls='tmux ls'
alias vi='nvim'
alias tattach='tmux attach -t'
alias tnew='tmux new-session -s'
alias rotageek_env='source $HOME/Documents/virtual_envs/rotageek_env/bin/activate'
alias personal='cd /Users/ashishalex/Documents/personal/repos'
alias prepos='cd /Users/ashishalex/Documents/personal/repos/'
# alias jupy='jupyter notebook --NotebookApp.kernel_manager_class=notebook.services.kernels.kernelmanager.AsyncMappingKernelManager'
alias lg='ls | grep'
alias findcommitbyid='git log | batgrep -C10'

# alias alexmac='ssh alexmac.local -L 8800:127.0.0.1:8800'
# alias alextensorboard='ssh alexmac.local -L 8443:127.0.0.1:8443'
# alias jade="ssh -t alexmac.local -L 8800:127.0.0.1:8800 'ssh -l aaa18-txk47 jade2.hartree.stfc.ac.uk'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export CGO_ENABLED=1
export CXX=clang++


# export GOOGLE_CLOUD_PROJECT_ID=$(gcloud config get-value core/project)
alias ls='ls -lGH'
alias ll="ls -lG"


#my custom scripts are in here
export PATH=$PATH:~/bin


#add golang to path
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/Users/ashishalex/go/bin

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ashishalex/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ashishalex/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ashishalex/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ashishalex/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U select-word-style
select-word-style bash

ZSH_AUTOSUGGEST_HISTORY_IGNORE=*

# opam configuration
# [[ ! -r /Users/ashishalex/.opam/opam-init/init.zsh ]] || source /Users/ashishalex/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Created by `pipx` on 2024-10-16 09:57:38
export PATH="$PATH:/Users/ashishalex/.local/bin"
. "/Users/ashishalex/.deno/env"

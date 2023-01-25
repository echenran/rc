# Set PATH for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Customising prompt
PROMPT='%F{015}%~ $%f '

# Setting editor
export EDITOR=vim

# ===== Aliases =====
# ls with colors
alias ls='ls -G'

# ls all
alias l='ls -lAG'

# ls + sort by file size + display K, M, G, etc.
alias lss='ls -lAGSh'

# ls + sort by last modified with most recent at bottom
alias lm='ls -lAGtr'

# cd to Downloads
alias dow='cd /Users/emmett/Downloads'
# cd to Documents
alias doc='cd /Users/emmett/Documents'
# git status
alias gs='git status | tr "\n" "x9221" | sed "s/Untracked.*$//g" | tr "x9221" "\n"'
#goes back to previous directory
alias back='cd $OLDPWD'
#don't want to type out pbcopy and pbpaste
alias cpy='pbcopy'
alias pst='pbpaste'

#----------tmux----------
alias list='tmux list-sessions'
alias ta='tmux attach -t'
alias tss='tmux switch-client -t'

alias cpy='pbcopy'
alias pst='pbpaste'

# ===== Functions =====
v () {
	vim "${@}"
}

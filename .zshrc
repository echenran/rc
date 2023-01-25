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

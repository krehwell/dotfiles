# ----- BEHAVIOUR -----
alias :q='exit'
alias sex='bash -c \'explorer.exe . || nautilus . &\''
alias cmd=cmd.exe
alias vim=nvim
alias pacman='sudo pacman'
alias tmux='tmux -2'
alias txxx='tmux kill-server'

# --- VAR
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

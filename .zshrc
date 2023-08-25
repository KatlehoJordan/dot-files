# Launch terminal in tmux
# https://www.tecmint.com/tips-for-tmux-terminal-sessions/
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall

# Trying to modify prompt to show current folder location
PS1='In directory %1d> '

## Git shortcuts
# Ending all lines in the Linux style, LF (line feed),
# instead of CRLF (carriage return, line feed)
alias git="git -c core.autocrlf=false"
alias g="git"
alias gb="git branch"
alias gf="git fetch"
alias gcl="git clone"
alias gch="git checkout"
alias gi="git init"
alias gl="git log"
alias gm="git merge"
alias gmm="git merge main"
alias gst="git status"
alias gsw="git switch"
alias ga="git add ."
alias gcm="git commit -m"
alias gacm="git add .; git commit -m"
alias gacmm="git add .; git commit -m 'Resolve merge conflicts'"
alias gpl="git pull"
alias gps="git push"
alias gr="git restore"

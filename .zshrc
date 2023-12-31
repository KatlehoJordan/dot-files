# Launch terminal in tmux
# https://www.tecmint.com/tips-for-tmux-terminal-sessions/
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# Variables
export PROJECTS="~/Desktop/Projects"

## Making code the default code editor
export EDITOR='code'
export VISUAL='code'

## Variables for poetry
### Making poetry (and others) accessible from command line
export PATH="/home/david/.local/bin:$PATH"

### Necessary variable to allow poetry install to work with poetry.lock files
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring poetry install

# Aliases
## Shortcuts to common places
alias ..="cd .."
alias projects="cd $PROJECTS"

## zsh shortcuts
alias q="exit"
alias c="clear"
alias h="history"

## python shortcuts
alias python="python3"

## chrome
alias chrome="google-chrome-stable & disown"

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

## Aliases that only work if relevant files are in wd
alias i="sh scripts/init.sh"
alias gacp="sh scripts/gacp.sh"

## Shortcuts to current projects
### No shortcuts to budget tracker since it is a macro-enabled excel file

### No shortcuts to journal since would require changing some bash syntax
### No shortcuts to poker hands or python playground since those are built
### with docker and that is not used in the Ubuntu setup

alias notes="code $PROJECTS/notes"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# This line was added to help zsh find poetry completions
fpath+=~/.zfunc

# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall

# Modify prompt to show current folder location and git branch
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='
In directory %1d ${vcs_info_msg_0_}
> '

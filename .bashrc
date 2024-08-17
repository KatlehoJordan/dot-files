#!/bin/bash
# Disable a shellcheck rule that I did not figure out how to completely resolve
# shellcheck disable=SC2139

# Variables
LC_CTYPE="C"
PROJECTS="$HOME/Documents/Projects"
BASHRC="$HOME/.bashrc"
WSL_CONFIG="$HOME/.wslconfig"
PROGRAM_FILES="/C/Program\ Files"

# Updating the path
export PATH=$PATH:$HOME/.pyenv/pyenv-win/shims
export PATH=$PATH:$HOME/.pyenv/pyenv-win/bin
export PATH=$PATH:$HOME/AppData/Roaming/Python/Scripts


# Aliases
## Shortcuts to common places
alias ..="cd .."
alias projects="cd $PROJECTS"
alias desktop="cd ~/Desktop"
alias edit-init.lua="code ~/AppData/Local/nvim/init.lua" 
alias edit-bashrc="code $BASHRC"
alias src-bashrc="source $BASHRC"
alias edit-wslconfig="code $WSL_CONFIG"

# Not sure if this is needed or desirable if pyenv is set up correctly...
# alias python="winpty python"

## Shortcuts to always cp and rm recursively
alias cp="cp -r"
alias rm="rm -rf"

## Programs not in the path
# alias code="code-insiders"
alias nvim="$PROGRAM_FILES/Neovim/bin/nvim.exe"
alias 7z="$PROGRAM_FILES/7-Zip/7zFM.exe"

## Bash shortcuts
alias q="exit"
alias c="clear"
alias h="history"

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
THIS_YEAR=$(date +"%Y")
alias budget-tracker="start $PROJECTS/daily-scraping/inputs/budgetTracker$THIS_YEAR.xlsm"


alias debug-daily-scraping="code $PROJECTS/daily-scraping"
alias daily-scraping="
    START_WD=$(pwd)
    echo Move to daily-scraping project
    cd $PROJECTS/daily-scraping
    echo Performing git backup
    gacp
    echo Running daily scraper
    docker run -i --name scraper-container daily-scraping-scraper
    echo Copying outputs from daily-scraper to host machine outputs
    docker cp -a scraper-container:outputs/ .
    echo Removing docker container
    docker rm scraper-container
    echo Move to original directory
    cd $START_WD
    echo Opening budget tracker
    budget-tracker
    "

alias journal="
    START_WD=$(pwd)
    echo Move to journal
    cd $PROJECTS/journal
    echo Performing git backup
    gacp
    echo Opening journal
    code $PROJECTS/journal
    echo Initializing journal for the day
    i
    echo Move to original directory
    cd $START_WD
    "

alias debug-holdem-simulator="code $PROJECTS/holdem_simulator"
alias holdem-simulator="
    START_WD=$(pwd)
    echo Move to holdem_simulator
    cd $PROJECTS/holdem_simulator
    echo Start holdem_simulator - use q to quit
    poetry run python main.py
    echo Move to original directory
    cd $START_WD
    "

alias notes="code $PROJECTS/notes"

# Customizing the prompt
parse_git_branch() {
    local branch_name
    branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch_name ]]; then
        echo " on branch $(tput setaf 4)$branch_name$(tput sgr0)"
    fi
}

PS1="
In directory \[\033[33m\]\$(basename \"\$PWD\")\[\033[0m\]\$(parse_git_branch)
>"

# Enable colorized output for ls and add details to ls outputs
alias ls='ls --color=auto -alGp'

# Enable Neovim-style key bindings
set -o vi

# Function for math in bash command line
math() {
    echo $(($@))
}

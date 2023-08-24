#!/bin/bash
# Disable a shellcheck rule that I did not figure out how to completely resolve
# shellcheck disable=SC2139

# Variables
LC_CTYPE="C"
PROJECTS="/D/Projects"
BASHRC="$HOME/.bashrc"
WSL_CONFIG="$HOME/.wslconfig"
PROGRAM_FILES="/C/Program\ Files"

# Aliases
## Shortcuts to common places
alias ..="cd .."
alias projects="cd $PROJECTS"
alias edit-init.lua="code /C/Users/D/AppData/Local/nvim/init.lua" 
alias edit-bashrc="code $BASHRC"
alias src-bashrc="source $BASHRC"
alias edit-wslconfig="code $WSL_CONFIG"

## Shortcuts to always cp and rm recursively
alias cp="cp -r"
alias rm="rm -rf"

## Programs not in the path
# alias code="code-insiders"
alias nvim="$PROGRAM_FILES/nvim-win64/bin/nvim.exe"
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
alias budget-tracker="start $PROJECTS/daily-scraping/inputs/budgetTracker2023.xlsm"

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

alias debug-poker-hands="code $PROJECTS/poker-hands"
alias poker-hands="docker run --rm -i --name poker-trainer poker-hands-training"
alias python-playground="code $PROJECTS/ds-playground/python"
alias ipython="docker run --rm -i --name python-playground python-playground"

alias notes="code $PROJECTS/notes"

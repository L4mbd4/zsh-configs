# set nano as default editor
export EDITOR=nano

# aliases for common git commands
alias gaa='git add -A'
alias gs='git status'
alias gc='git commit'
alias gca='git add -A && git commit'

# function to branch from current branch
function gb () {
    if (( ARGC != 1 )); then
        printf 'usage: gb <new branch name>\n'
        return 1;
    fi
    command git checkout -b "$1"
}

# alias for cd back one level
alias b='cd ..'

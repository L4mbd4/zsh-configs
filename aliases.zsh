# set nano as default editor
export EDITOR=nano

# aliases for common git commands
alias gaa='git add -A'
alias gs='git status'
alias gc='git commit'
alias gcs='git commit -S'
alias gca='git add -A && git commit'
alias gcas='git add -A && git commit -S'
alias gr='git clean -df && git checkout -- .'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

## aliases for yay
alias sysupdate='yay -Syu'

# function to branch from current branch
function gb () {
    if (( ARGC != 1 )); then
        printf 'usage: gb <new branch name>\n'
        return 1;
    fi
    command git checkout -b "$1"
}

# function to checkout branch
function gcb () {
	if (( ARGC != 1 )); then
        printf 'usage: gb <new branch name>\n'
        return 1;
    fi
    command git checkout "$1"
}

# function for creating a gitignore file from gitignore.io
function gengi() {
 (curl -L -s https://www.gitignore.io/api/"$@") >> .gitignore ;
}

# alias for cd back one or more levels
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'

# function to remove a directory even if not empty
function rd () {
	if (( ARGC != 1 )); then
        printf 'usage: rd <directoy path>\n'
        return 1;
    fi
    
    rm -rf "$1"
}

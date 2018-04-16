# Shortcut 2x Esc to put sudo in front of current line

sudo-command-line() {
    if [[ "$BUFFER" != su(do|)\ * ]]; then
      BUFFER="sudo $BUFFER"
      (( CURSOR += 5 ))
    fi
}
zle -N sudo-command-line

# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line

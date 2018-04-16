#!/bin/sh

# This script will copy all .zsh files in the script directory to
# ~/.zsh (and create that directory if it does not exist) and will
# source the files in the ~/.zshrc

echo "Installing custom config"

# create a directory for config files
echo "Creating directory ~/.zsh..."
mkdir -p ~/.zsh

# directory this script is executed in
scriptdir=$(dirname "$0")

# remove old source entries in .zshrc
sed -i '/~\/.zsh/d' ~/.zshrc

# add a source entry for each file to .zshrc
for file in $scriptdir/*.zsh; do
	# copy file to ~/.zsh
	cp $file ~/.zsh
	name=$(basename "$file")
	
	# source file in .zshrc
	echo "[ -f ~/.zsh/$name ] && source ~/.zsh/$name" >> ~/.zshrc
done

echo "Custom configs installed"

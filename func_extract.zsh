#!/bin/zsh

# alias function for even less typing
alias x=extract

# extracts an archive into directory
function extract () {
	# check if one argument is passed
	if (( ARGC != 1 )); then
		printf 'usage: extract <filename>\n'
		return 1;
	fi

	# check if file in $1 exists and is normal file (no directory symlink etc.)
	if [[ ! -f "$1" ]]; then
		echo "File '$1' does not exist!"
		return 1
	fi

	# basename of the file e.g. archive.tar.gz => archive
	name=${1%%.*}

	# extension of the file e.g. archive.tar.gz => tar.gz
	ext=${1#*.}

	# create directory to extract files into
	mkdir -p "$name"

	# extract depending on type
	case "$ext" in
		"tar.gz")
			# extract tar.gz file
			tar xvzC "$name" -f "$1"
			;;
		"tar.bz2")
			# extract tar.bz2 file
			tar xvjC "$name" -f "$1"
			;;
		"tar")
			# extract tar file
			tar xvf "$1"
			;;
		"zip")
			# extract zip file
			unzip "$1" -d "$name"
			;;
		*)
			# every other extension => not supported
			echo "Type not supported!"
			rmdir "$name"
			return 1
			;;
	esac	
}

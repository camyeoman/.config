#!/bin/bash

PREVIUS_PATH=$(pwd)
CHANGES_MADE='false'
PUSH_CHANGES='false'

# Check for command flags

for arg in "$@"; do
    case $arg in
        -p|--push)
        PUSH_CHANGES="true"
        shift # Remove flag from args array
        ;;
    esac
done

cd ~/.config

apps_str="(alacritty|tmux|yabai|skhd|bash|scripts|nvim/(modules|init)).*"
result=$(rg --files --hidden ~/.config | rg '^.*\.config/('$apps_str')' -r '$1' | fzf)

# Check for early termination

if [[ $result == '' ]]; then
	exit
fi

nvim ~/.config/$result

sleep 0.1

# Check if changes were made to file

if [[ $PUSH_CHANGES == 'true' && ! $(git status $result) =~ 'nothing to commit' ]]; then
	CHANGES_MADE="true"
fi

# if needed push changes

if [[ $PUSH_CHANGES == 'true' ]]; then
	if [[ $CHANGES_MADE == 'true' ]]; then
		git add $result && git commit $result && git push
	else
		echo "No changes to push"
	fi
fi

# return to previous path

cd $PREVIUS_PATH

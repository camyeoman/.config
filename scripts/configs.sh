#!/bin/bash

previus_path=$(pwd)

cd ~/.config

programs="(alacritty|tmux|yabai|skhd|bash|scripts|nvim/(modules|init)).*"
file=$(rg --files --hidden ~/.config | rg '^.*\.config/('$programs')' -r '$1' | fzf)

nvim ~/.config/$file

sleep 0.2

if [[ ! $(git status $file) =~ 'nothing to commit' ]]; then
	git add $file && git commit $file && git push
fi

cd $previus_path

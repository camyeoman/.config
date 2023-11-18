#!/bin/bash

case $1 in
  latex)
    cd ~/Markup/LaTeX
    cd `fd -t d -E latexout | fzf`;;
  ''|code)
    cd ~/Code/
    cd `fd -t d -E Notes -E node_modules -E env -E app -E bin -E build | fzf`;;
esac

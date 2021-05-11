#!/bin/bash

function open_colour() {
	case $1 in
		black)   echo -n "`tput setaf 0`";;
		red)     echo -n "`tput setaf 1`";;
		green)   echo -n "`tput setaf 2`";;
		yellow)  echo -n "`tput setaf 3`";;
		blue)    echo -n "`tput setaf 4`";;
		magenta) echo -n "`tput setaf 5`";;
		cyan)    echo -n "`tput setaf 6`";;
		white)   echo -n "`tput setaf 7`";;
	esac
}

function close_colour() {
	echo -n "`tput op`"
}

#for arg in $@; do
	#colour=$(echo $arg | rg -Po '(?<=:).*')
	#match=$(echo $arg | rg -Po '.*(?=:)')

	#echo -n " -e s/\($match\)/"
	#colour $colour
	#echo -n "\\1`tput op`/g"
#done

#match=$2
echo -n "'s/\($1\)/"
open_colour $2
echo -n "\\1"
close_colour
echo -n "/g'"

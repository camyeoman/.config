#!/bin/bash

program_status=$(brew services list | rg '.*yabai ([A-z]+).*' -r '$1')

clear

for program in {skhd,yabai}
do
	if [[ $program_status = "stopped" ]]
	then
		echo Starting tiling manager
		brew services start $program
	else
		echo stopping tiling manager
		brew services stop $program
	fi
done

clear

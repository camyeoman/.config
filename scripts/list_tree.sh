#!/bin/bash

if (( $(tree | wc -l) > 30 )); then
	for i in {5..2}; do
		if (( $(tree -L $i | wc -l) < 30 )); then
			tree -CL $i
			exit
		fi
	done

	tree -CL 1
else
	tree -C
fi

#!/bin/bash

read string
for i in `seq 1 ${1:-5}`; do
	rg -oP 'real.*\K(\d+\.\d+)' < <( 
		(time eval "$string") 2>&1
	)
done | awk '{sum+=$1} END {print "Average Run Time: ", sum/NR}'

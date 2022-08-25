#!/bin/bash

# execute binary search to find right number of
# files to print out directiory on one screen

lines=53
high=8
low=0

while (( $high > $low )) && (( $low >= 0 )); do
	# find the current number of files
	mid=$(( ($high + $low) / 2 ))
	files=$(tree -L $mid | head -$(($lines * 2)) | wc -l)

	# iterate to other half of range
	(( $mid == $low )) && break
	(( $files >= $lines )) && high=$mid || low=$mid
done

# print tree to fit on screen
tree -CL ${mid:=1}


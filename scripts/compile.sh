#!/bin/bash

# Create temporary file to store errors
touch compilation_error

# currently working with;
# python, java, rust, c
valid_files='\.(py|java|rs|c)$'

# exit program if file is not valid
if [[ ! $1 =~ $valid_files ]]
then
	echo invalid file
	exit
fi

function errors() {
	error_preview=$(echo errorPreview-.$file)
	cat compilation_error | sed 's/-->/⟶ /g' > $error_preview
	bat --theme=Nord --style="changes" $error_preview
	
	echo -n '' > compilation_error
	rm $error_preview
}

function run_python() {
	output_file="programOutput-${file%*.}"
	python3 $1 $2 $3 $4 $5 $6 $7 $8 $9 2> compilation_error > $output_file

	if [ ! -s compilation_error ]; then
		cat $output_file
	else
		errors $1
	fi

	rm $output_file
}

function run_binary() {
	if [ ! -s compilation_error ]; then
		./${1%.*} $2 $3 $4 $5 $6 $7 $8 $9
		rm ./${1%.*}
	else
		errors $1
	fi

}

function run_java() {
	if [ ! -s compilation_error ]; then
		java ${1%.*} $2 $3 $4 $5 $6 $7 $8 $9
		rm ${1%.*}
	else
		errors $1
	fi
}

if [[ ! $2 =~ $valid_files ]]; then
	a1=$2; a2=$3; a3=$4; a4=$5; a5=$6; a6=$7; a7=$8; a8=$9;
else
	a1=''; a2=''; a3=''; a4=''; a5=''; a6=''; a7=''; a8='';
fi

for file in "$@"; do
	# compile
	case ${file#*.} in
		java) javac $file 2> compilation_error;;
		rs)   rustc $file 2> compilation_error;;
		c)    gcc -Wall $file -o ${file%.*} 2> compilation_error;;
	esac

	# run
	case ${file#*.} in
		java) run_java   $file $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8;;
		rs)   run_binary $file $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8;;
		py)   run_python $file $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8;;
		c)    run_binary $file $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8;;
	esac

	# if using args as inputs, break on first iteration
	if [[ $file == $a1 && ! $2 =~ $valid_files ]]; then
		break
	fi
done

rm compilation_error

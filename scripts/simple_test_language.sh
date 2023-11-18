#!/bin/bash

#                       PARSE TEST FILE                         

TOKEN='([A-z]+::)?[^[:space:]]+ *(?>\{(?:[^{}]*|(?R))*\})'

declare -A NAMESPACE
declare -a TESTS
declare -a LINES

# compileFile( <file name> )
function compileFile {
	readarray LINES < <( grep -vP '^\s*(//|#)' $1 )

	parseText scope global < <(
		grep -vP '^\s*(//|#)' $1                      \
			| awk '/^[[:space:]]*\|/ {$0=NR} {print}' \
			| sed -E 's/([A-z]+) *-> *(.*)/\1 {\2}/g' \
			| egrep -v '^[[:space:]]*(#|[/]{2})$'     \
			| tr -s '\n\t' ' '                        \
	)
}

# processToken( <string> )
trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}" # remove leading
    var="${var%"${var##*[![:space:]]}"}" # remove trailing
    printf '%s' "$var"
}

# printDict( <dict> )
function printDict {
	local -n dict=$1
	echo "$1 ["
	for k in "${!dict[@]}"; do
		echo -n "   [$k] = ${dict[$k]}" | rg -o '.*=.{1,120}'
	done | sort | rg '=.*'
	echo ']'
}

# processToken( <type> <parent type> <name> <path> <content> )
processToken() {
	ttype=$1; ptype=$2
	name=$3
	path=$4
	content=$5

	case $ttype in
		program)
			echo "$path->$ttype::$name" | rg '.'
			NAMESPACE["$path->$ttype::$name"]="$path::$name";
			return 0;;
		test) TESTS+=("$path::$name"); return 0;;
		scope|program) return 0;;

		*) case $ttype in
			data) NAMESPACE["$path->$name"]="$content";;
			*) NAMESPACE["$path->$ttype#$name"]="$content";;
		esac; return 1;;
	esac
}

#parseText( <parent type> <token path> )
parseText() {
	EXTRACT_TOK='^([a-z]+::)?([^:[:space:]]+) *\{ *(.*) *\}'

	readarray tokens < <( grep -oP "$TOKEN" )
	for token in "${tokens[@]}"; do
		[[ ! $token =~ $EXTRACT_TOK ]] && return 1

		tok_type=${BASH_REMATCH[1]:-data}; tok_type=${tok_type%::*};
		tok_name=${BASH_REMATCH[2]}
		content=${BASH_REMATCH[3]}

		if processToken $tok_type $1 $tok_name $2 "$content"; then
			parseText $tok_type $path::$tok_name <<< "$content"
		fi
	done
}

#compileTest( <test object> <token path> )
compileTest() {
	local -n object=$1
	readarray -d ' ' path <<< ${2//::/ }
	index=`expr ${#path[@]} - 1`

	while [[ $2 =~ (.*?)(::[^:]+){$index} ]]; do
		prefix=${BASH_REMATCH[1]}
		for attr in "${!NAMESPACE[@]}"; do
			if [[ $attr =~ ^$prefix'->'(.*) ]]; then
				object[${BASH_REMATCH[1]}]=${NAMESPACE[$attr]}
			fi
		done && ((index--))
	done
}

#get( <test object> <attribute> )
function get {
	local -n object=$1
	data="$(echo ${object["$2"]})"

	if [[ $data =~ ^[0-9]+([[:space:]]+[0-9]+)*$ ]]; then
		for n in $data; do
			echo -n "${LINES[`expr $n - 1`]#*\|}"
		done
	elif [[ ! $data =~ ^$ ]]; then
		echo $data
	else cat /dev/null; fi
}


#                     BUILD AND RUN TESTS

# runTest( <test object> <test path> )
evaluateTestOutput() {
	local -n test_attrs=$1

	output_file=$(get test_attrs 'define#output')
	error_file=$(get test_attrs 'define#error')

	readarray out_diff < <( diff "$output_file" - < <( get test_attrs output ) )
	readarray err_diff < <( diff "$error_file" - < <( get test_attrs error ) )

	display=${2#*::}
	if [ ${#out_diff[*]} -gt 0 ] || [ ${#err_diff[*]} -gt 0 ]; then
		if [ ${#out_diff[*]} -gt 0 ]; then
			echo -n "`tput setaf 3`OUTPUT FAILED`tput sgr0`"
			echo " ⟶  ${display#\./*}"
			echo "${out_diff[*]}"
		fi

		if [ ${#err_diff[*]} -gt 0 ]; then
			echo -n "`tput setaf 1`ERROR FAILED`tput sgr0`"
			echo " ⟶  ${display#\./*}"
			echo "${err_diff[*]}"
		fi

		((failed++))
	elif [ $QUIET -eq 0 ]; then
		echo -n "`tput setaf 2`SUCCESS`tput sgr0`"
		echo " ⟶  ${display#\./*}"

		((passed++))
	fi
}

filteredTests() {
	if [ $SEARCH -eq 1 ]; then
		fzf -m --reverse
	elif [ $FILTER -eq 1 ]; then
		fzf -f "$TEST_FILTER"
	else cat; fi < <(tr ' ' '\n' <<< ${TESTS[@]})
}

# runTest( <test path> )
runTest() {
	declare -A attrs
	compileTest attrs $1

	if [ $IGNORE -eq 0 ]; then
		eval "$(get attrs execute)" \
			2> bin/stderr           \
			1> bin/stdout           \
			< <(get attrs stdin)

		evaluateTestOutput attrs $1
	else
		eval "$(get attrs execute)" < <(get attrs stdin)
	fi
}


#          RUN TESTING SCRIPT AND EXECUTE TESTS

# parse script arguments and implement additional options

FILTER=0
IGNORE=0
SEARCH=0
QUIET=0
FILE=''

while [ $# -gt 0 ]; do
	if [[ ! $1 =~ -[a-z]+ ]]; then
		if [ ! -z $FILE ]; then
			echo 'Bad argument' 1>&2
			exit
		else
			FILE=$1
			shift && continue
		fi
	fi

	for ch in $(echo $1 | grep -o '[a-z]'); do
		case $ch in
			f) FILTER=1; TEST_FILTER=${2:-}; break;;
			s) SEARCH=1;;
			q) QUIET=1;;
			i) IGNORE=1;;
		esac
	done;

	[[ $1 =~ -.*f.* ]] && shift
	shift
done

# parse and compile test file and select tests to run

[ ! -d bin ] && mkdir bin

compileFile $FILE

if [[ $FILTER == 1 && $TEST_FILTER =~ ^$ ]]; then
	TEST_FILTER=$(
		echo "${TESTS[@]}"                \
			| tr ' ' '\n'                 \
			| fzf --reverse --print-query \
			| head -n 1                   \
	)
fi

# test execution

for test_name in $(filteredTests); do
	runTest $test_name
done

#!/bin/bash
#(@) Function with positional parameters

function times() {
	if [ -z "$2" ]
	then
		echo $1
	else
		a=$1
		shift
		b=`times $@`
		echo `expr $a \* $b`
	fi
}

# times $*
# echo -e "$# parameters passed to $0 : $*"

RESULT=`times $*`
echo "Result is $RESULT "



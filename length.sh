#!/bin/bash
#(@) Function with positional parameters

function length() {
	if [ -z "$1" ]
	then
		echo 0
	else
		expr `echo "$*" |wc -c` - 1
	fi
}

RESULT=`length $*`
echo $RESULT



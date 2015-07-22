#!/bin/bash
#(@) Function with positional parameters

function length() {
#	if [ -z "$1" ]
#	then
#		echo 0
#	else
		expr `echo "$*" |wc -c` - 1
#	fi
}

# RESULT=`length $*`
# echo "Result is $RESULT "

function longest() {
	LONGEST=0
	for STRING in $*
	do
		THISLEN=`length $STRING`
		[ $THISLEN -gt $LONGEST ] && \
			LONGEST=$THISLEN
	done
	echo $LONGEST
}

# RESULT=`longest $*`
STRINGS="Poland Spain Greece Ireland PIGS"
LONGEST=`longest $STRINGS`
echo LONGEST is $LONGEST


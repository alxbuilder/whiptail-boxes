#!/bin/bash
#(@) Function with positional parameters

function length() {
        expr `echo "$*" |wc -c` - 1 
}

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

function snakecase() {
        echo $* |sed -e s/\ /_/g
}


# RESULT=`longest $*`
STRINGS=
# STRINGS="Poland Spain Greece Ireland PIGS"
LONGEST=`longest $STRINGS`
echo LONGEST is $LONGEST


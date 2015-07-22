#!/bin/bash
#(@) Whiptail inputbox

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

function snake_case() {
	echo $* |sed -e s/\ /_/g
}

function rows() {
	echo `tput cols`
}

function columns() {
	echo `tput lines`
}

function max_width() {
	echo `rows - 6`	# whiptail boxes use 3 chars before & after text
}

function screen_size() {
	ROWS=`tput cols` && COLS=`tput lines` && RESULT="${ROWS}x${COLS}"
	echo $RESULT
}

function too_long() {
	[ `length $*` -gt `max_width` ]
}

function truncate() {
	echo $* |cut -c1-$(expr `rows` - 6)
}

# Try and streamline this stuff
MESSAGE="Enter something, but should this text determine box width? \
  It is probably a better idea to use the title alone to determine this"
TITLE="Some complicated activity that should probably be automated for \
the likes of Jane and other such people"

# if too_long $TITLE
# then
# 	TITLE=`truncate $TITLE`
# fi

[ too_long $TITLE ] && TITLE=`truncate $TITLE`]
LENGTH=`max_width`

LONGEST=$(longest `snake_case $TITLE` `snake_case $MESSAGE`)
# LENGTH=$LONGEST

# Add 3 chars each side to make box look right
# LENGTH=`expr $LENGTH + 6`

SOMETHING=$(whiptail 				\
		--title		"$TITLE"	\
		--inputbox	"$MESSAGE"	\
		8 $LENGTH 3>&1 1>&2 2>&3)
echo You entered \"${SOMETHING}\"

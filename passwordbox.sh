#!/bin/bash
#(@) Whiptail passwordbox

. ./functions

# Sample data to illustrate what problem this solves.
BOXTYPE="--passwordbox"
MESSAGE="This is a longwinded message to the user, to demonstrate \
  that only the '--title' should be used to determine the box size"
TITLE="This title will be shortend if not kept short enough to fit in \
  a dialog box that the screen can display"
DEFAULT_INPUT=""

# Truncate the title if it's too big for the window
[ `too_long "$TITLE"` ] && TITLE=`shorten $TITLE`
LENGTH=`max_width`

USERINPUT=$(whiptail		\
		--title "$TITLE"	\
		$BOXTYPE			\
		"$MESSAGE"			\
		10 $LENGTH 			\
		$DEFAULT_INPUT		\
		3>&2 2>&1 1>&3		\
		)
echo \"${USERINPUT}\"

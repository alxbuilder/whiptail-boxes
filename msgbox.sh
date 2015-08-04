#!/bin/bash
#(@) Whiptail msgbox

. ./functions

# Sample data to illustrate what problem this solves.
BOXTYPE="--msgbox"
MESSAGE="This is a longwinded message to the user, to demonstrate \
  that only the '--title' should be used to determine the box size"
TITLE="This title will be shortend if not kept short enough to fit in \
  a dialog box that the screen can display"

# Truncate the title if it's too big for the window
[ `too_long "$TITLE"` ] && TITLE=`shorten $TITLE`
LENGTH=`max_width`

# Produce our dialog box
# USERINPUT=$(
whiptail 				\
		--title		"$TITLE"	\
		$BOXTYPE	"$MESSAGE"	\
		8 $LENGTH 3>&1 1>&2 2>&3
#		)
# echo You entered \"${USERINPUT}\"

#!/bin/bash
#(@) Whiptail inputbox

. ./functions

# Sample data to illustrate what problem this solves.
MESSAGE="This is a longwinded message to the user, to demonstrate \
  that only the '--title' should be used to determine the box size"
TITLE="This title will be truncated if not kept short enough to fit in \
  a dialog box that the screen can display"

# Truncate the title if it's too big for the window
set -vx
[ too_long $TITLE ] && TITLE=`truncate $TITLE`]
LENGTH=`max_width`
set +vx

# Produce our dialog box
SOMETHING=`inputbox`
echo You entered \"${SOMETHING}\"
exit

SOMETHING=$(whiptail 				\
		--title		"$TITLE"	\
		--inputbox	"$MESSAGE"	\
		8 $LENGTH 3>&1 1>&2 2>&3)
echo You entered \"${SOMETHING}\"

#!/bin/bash
#(@) Whiptail inputbox

. ./functions

# Try and streamline this stuff
MESSAGE="Enter something, but should this text determine box width? \
  It is probably a better idea to use the title alone to determine this"
TITLE="Some complicated activity that should probably be automated for \
the likes of Jane and other such people"

# Truncate the title if it's too big for the window
[ too_long $TITLE ] && TITLE=`truncate $TITLE`]
LENGTH=`max_width`

# Produce our dialog box
SOMETHING=$(whiptail 				\
		--title		"$TITLE"	\
		--inputbox	"$MESSAGE"	\
		8 $LENGTH 3>&1 1>&2 2>&3)
echo You entered \"${SOMETHING}\"

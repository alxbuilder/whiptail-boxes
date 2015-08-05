#!/bin/bash
#(@) Whiptail menu

. ./functions

# Sample data to illustrate what problem this solves.
BOXTYPE="--checklist"
MESSAGE="This is a longwinded message to the user, to demonstrate \
  that only the '--title' should be used to determine the box size"
TITLE="This title will be shortend if not kept short enough to fit in \
  a dialog box that the screen can display"

# Truncate the title if it's too big for the window
[ `too_long "$TITLE"` ] && TITLE=`shorten $TITLE`
LENGTH=`max_width`

# Produce our dialog box
#	--backtitle	"Any explanatory message can be put here"	\
#	--scrolltext	\

whiptail_menu() {
	whiptail 			\
	--title		"$TITLE" \
	$BOXTYPE	"$MESSAGE" \
	$HEIGHT 40 $MENUHEIGHT \
		"1st"	"task 1"	off	\
		"default" "task 2"	on	\
		"3rd"	"task 3"	off	\
		"4th"	"task 4"	off	\
		"5th"	"task 5"	off	\
		"6th"	"task 6"	off	\
		"7th"	"task 7"	off	\
		"8th"	"task 8"	off	\
		"9th"	"task 9"	off	\
		"10th"	"task 10"	off	\
		--default-item	"default"	\
		--fb	\
	3>&1 1>&2 2>&3
}

# WARNING: This figure is the number of lines of THIS FILE containing
# two doublequoted items on a single line, plus either o{n,ff} but NOT
# uppercase 'menu'. It's a bit fragile ):
MENUHEIGHT=$(grep '$BOXTYPE' -A 20 $0 |grep -B 20 '3>&1' \
	|grep "\".*\".*\".*\"" |egrep -e on -e off |grep -v MENU |wc -l )
# echo $MENUHEIGHT
HEIGHT=`expr $MENUHEIGHT + 7`

FULLBUTTON=$(grep '$BOXTYPE' -A 20 $0 |grep -B 20 '3>&1' \
	|grep -v 'FULLBUTTON' |egrep -e '--fb')

# Using FULLBUTTONs adds two lines to the box height
[ -z "$FULLBUTTON" ] || HEIGHT=`expr $HEIGHT + 2`
# echo $MENUHEIGHT $FULLBUTTON $HEIGHT
# exit
MENUCONTENT=$(grep '$BOXTYPE' -A 20 $0 |grep -B 20 '3>&1' \
	|grep "\".*\".*\".*\"" |egrep -e on -e off |grep -v MENU )
	# |grep "\".*\".*\".*\""|grep -v MENU )

TASK=`whiptail_menu`
echo $TASK

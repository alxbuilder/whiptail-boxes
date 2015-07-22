#!/bin/bash

#	Dialog Box Types
#	yesno	-	Question with yes and no buttons
#	msgbox	-	Message with an OK button
#	infobox	-	Message with no button
#	passwordbox
#	textbox	-	Contents of a text file in a  box
#	menu	-	Selected item written to stderr
#	checklist	Multiple selection to stderr
#	radiolist	Single selection
#	guage	-	Progress bar based on info from stdin

# IOSWITCH='3&>1 1>&2 2>&3'

FILENAME=$(whiptail --inputbox		\
	"Enter file or folder name":	\
	8 78 --title "File selection" 3&>1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus != 0 ]
then
	exit 1		# User exit
fi

RECURSIVE=""
if [ -d $FILENAME ]	# Directory selected
then
	if (whiptail --title "Apply to folder?" --yesno	\
		"Apply to all files in $FILENAME?" 8 78)
	then
		echo "Recursive action being applied to $FILENAME"
		RECURSIVE="-R"
	fi
fi

MODES=$(whiptail --title "Select permissions" --checklist \
	"choose permissions" 10 78 4 \
	r Read ON \
	w Write OFF \
	x Execute OFF 3&>1 1>&2 2>&3 |tr -d -c rwx )
exitstatus=$?

if [ $exitstatus != 0 ]
then
	exit 1			# User exit
fi

whiptail --title "Confirmation" --msgbox	\
	"chmod $RECURSIVE u=$MODES $FILENAME" 8 78
	


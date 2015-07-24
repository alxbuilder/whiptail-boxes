#!/bin/bash
#(@) Whiptail menu

. ./functions

#	--backtitle	"Any explanatory message can be put here"	\
whiptail_menu() {
	whiptail 			\
	--title		"Select one of" \
	--checklist	"Checklist Selector" \
	13 40 5 \
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
		--scrolltext	\
	3>&1 1>&2 2>&3
}

TASK=`whiptail_menu`
echo $TASK

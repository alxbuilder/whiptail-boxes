#!/bin/bash
#(@) Whiptail menu

. ./functions

whiptail_menu() {
TASK=$(whiptail 			\
	--title		"Select one of" \
	--menu		"Menu Selector" \
	--backtitle	"Any explanatory message can be put here"	\
	13 40 5 \
		"option 1"	"task 1"	\
		"default"	"task 2"	\
		"option 3"	"task 3"	\
		"option 4"	"task 4"	\
		"option 5"	"task 5"	\
		"option 6"	"task 6"	\
		"option 7"	"task 7"	\
		"option 8"	"task 8"	\
		"option 9"	"task 9"	\
		"option 10"	"task 10"	\
		--default-item	"default"	\
		--scrolltext	\
	3>&1 1>&2 2>&3)
echo $TASK
}



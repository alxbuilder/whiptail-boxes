#!/bin/bash
#(@) Whiptail inputbox

SOMETHING=$(whiptail --inputbox "enter something" 10 20 3>&1 1>&2 2>&3)
echo You entered \"${SOMETHING}\"

whiptail --infobox $SOMETHING 10 20


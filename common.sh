#!/bin/bash

# Common functions used by other scripts

# Text color variables
TXTBLD=$(tput bold)             # Bold
BLDRED=${TXTBLD}$(tput setaf 1) #  red
BLDBLU=${TXTBLD}$(tput setaf 4) #  blue
BLDYLW=${TXTBLD}$(tput setaf 3) #  yellow
BLDGRN=${TXTBLD}$(tput setaf 2) #  green
TXTRST=$(tput sgr0)             # Reset

command_exists () {
    type "$1" &> /dev/null ;
}

print_color() {
	echo -e $@$TXTRST
}

print_blue() {
	print_color $BLDBLU$@
}

print_red() {
	print_color $BLDRED$@
}

print_green() {
	print_color $BLDGRN$@
}

print_bold() {
	print_color $TXTBLD$@
}

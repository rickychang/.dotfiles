#!/bin/bash

# Text color variables
TXTBLD=$(tput bold)             # Bold
BLDRED=${TXTBLD}$(tput setaf 1) #  red
BLDBLU=${TXTBLD}$(tput setaf 4) #  blue
BLDYLW=${TXTBLD}$(tput setaf 3) #  yellow
BLDGRN=${TXTBLD}$(tput setaf 2) #  green
TXTRST=$(tput sgr0)             # Reset

# Git config commands
echo -n "$BLDBLU"
echo "Configuring git global settings."
echo -n "$TXTRST"

echo -n "Enter your git user.name: "
read -e GIT_USERNAME
git config --global user.name "$GIT_USERNAME"
echo -n "Enter your git user.email: "
read -e GIT_USEREMAIL
git config --global user.email "$GIT_USEREMAIL"
echo "Enabling colors for git terminal output"
git config --global color.ui true
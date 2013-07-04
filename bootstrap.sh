#!/bin/bash

# homebrew packages to be installed
HOMEBREW_PACKAGES="git python scala sbt node"



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
	echo $@$TXTRST
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

# checking for gcc and javac
print_blue "Checking for gcc..."


if command_exists gcc ; then
	print_green "gcc is installed"
else
	print_red "gcc is not installed.  Please install XCode and command line dev tools before running this script."
	print_blue "XCode: https://developer.apple.com/xcode/"
	print_blue "Command Line Tools: https://connect.apple.com"
	exit 1
fi

print_blue "Checking for javac..."

if command_exists javac ; then
	print_green "javac is installed"
else
	print_red "javac is not installed.  Please install Oracle JDK before running this script."
	print_blue "http://www.oracle.com/technetwork/java/javase/downloads/index.html"
	exit 1
fi

# homebrew package installation
print_blue "Installing packages via homebrew."

if command_exists brew ; then
	for package in $HOMEBREW_PACKAGES; do
		echo "Installing $package"
		brew install $package
	done
else
	print_red "Homebrew is not installed.  Please install before running this script."
	print_blue "http://mxcl.github.io/homebrew/"
	exit 1
fi

# Git config commands
print_blue "Configuring git global settings."

echo -n "Enter your git user.name: "
read -e GIT_USERNAME
git config --global user.name "$GIT_USERNAME"
echo -n "Enter your git user.email: "
read -e GIT_USEREMAIL
git config --global user.email "$GIT_USEREMAIL"
echo "Enabling colors for git terminal output"
git config --global color.ui true

# Other apps you usually want installed

OTHER_APPS="https://www.google.com/intl/en/chrome/browser/
http://www.irradiatedsoftware.com/sizeup/
https://www.dropbox.com/downloading?src=index
http://lightheadsw.com/caffeine/
http://www.sublimetext.com/2"

print_blue "More apps you probably want to install:"
for package in $OTHER_APPS; do
	print_bold "$package"
done
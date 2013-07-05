#!/bin/bash

source common.sh

PACKAGES_FILE='brew_packages.txt'

# homebrew packages to be installed
IFS=$'\n' read -d '' -r -a HOMEBREW_PACKAGES < $PACKAGES_FILE


# checking for gcc and javac
print_blue "Checking for gcc..."


if command_exists gcc ; then
	print_green "gcc is installed"
else
	print_red "gcc is not installed.  Please install XCode and command line dev tools before running this script."
	print_blue "XCode: https://developer.apple.com/xcode/"
	open https://developer.apple.com/xcode/
	print_blue "Command Line Tools: https://connect.apple.com"
	open https://connect.apple.com
	exit 1
fi

print_blue "Checking for javac..."

if command_exists javac ; then
	print_green "javac is installed"
else
	print_red "javac is not installed.  Please install Oracle JDK before running this script."
	print_blue "http://www.oracle.com/technetwork/java/javase/downloads/index.html"
	open http://www.oracle.com/technetwork/java/javase/downloads/index.html
	exit 1
fi

# homebrew package installation
print_blue "Installing packages via homebrew."

if command_exists brew ; then
	for package in ${HOMEBREW_PACKAGES[@]}; do
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
http://www.sublimetext.com/2
https://agilebits.com/downloads"

print_blue "More apps you probably want to install:"
for app_link in $OTHER_APPS; do
	print_bold "$app_link"
	open $app_link
done
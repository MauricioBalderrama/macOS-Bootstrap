#!/bin/bash

# libs
. ../config.sh
. settings.sh
. functions.sh

# Prevent computer from sleeping
sudo caffeinate &

###############################################################
@ "Xcode" 1
###############################################################

_ "Xcode is ~5.3 Gb."
_ "It is recommended you have it installed and updated."
_ "Xcode can be downloaded from the AppStore or from: https://developer.apple.com/download/more/ "

@@ "Do you want to continue? (Y/n)"
read -r -n 1
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
fi

# ###############################################################
# @ "SSH" 2
# ###############################################################

# # generate ssh key
# _ "Checking for SSH key, generating one if it doesn't exist..."
# [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa

# # copy & paste ssh key to GitHub
# _ "Copying public key to clipboard..."
# _ "Paste it into your Github account..."
# [[ -f ~/.ssh/id_rsa.pub ]] && pbcopy < ~/.ssh/id_rsa.pub
# open https://github.com/account/ssh

# # confirm user has pasted the ssy key to GitHub
# @@ "Have you pasted the ssh key (already in your clipboard) to GitHub? (Y)"
# read -r -n 1

###############################################################
@ "Sudo" 3
###############################################################

@@ "Please enter your admin password"

# Keep-alive sudo time stamp until finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################
@ "Homebrew" 4
###############################################################

_ "Set Hombrew cache location: ${homebrewCache}..."
export HOMEBREW_CACHE=${homebrewCache} # export HOMEBREW_CACHE=/Volumes/Installers/Homebrew

# install/update homebrew
if test ! $(which brew); then
    _ "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    _ "Updating Homebrew..."
    brew update #--debug --verbose
	brew upgrade
	brew prune
fi

_ "Installing Homebrew formulas..."
brew install ${formulas[@]}

_ "Installing Homebrew fonts..."
brew tap caskroom/fonts
brew cask install ${fonts[@]}

_ "Installing Homebrew casks..."
brew cask install ${casks[@]} 
exit 
###############################################################
@ "Update" 5
###############################################################

_ "Running macOS software updates..."
sudo softwareupdate -i -a

###############################################################
@ "System Configuration" 6
###############################################################

_ "Running system configuration for macOS ${macOSName} ${macOSVersion}"
curl -O "https://raw.githubusercontent.com/${gitHubUsername}/.macOS/master/.macos"
source .macos

###############################################################
@ "Reboot" 7
###############################################################

# Stop Caffeinate (allow computer to sleep)
killall caffeinate

_ "macOS Bootstrap installation has completed"

@@ "Do you want to reboot now? (y/n)"

# reboot
`sudo fdesetup isactive`
if [[ $? != 0 ]]; then
	while true; do
	    read -p "" yesOrNo
	    case $yesOrNo in
	        [Yy]* ) _ "System is rebooting..."; sleep 3; reboot; break;;
	        [Nn]* ) _e "System needs to reboot to complete the installation"; exit;;
	        * ) _ "Please answer y or n";;
	    esac
	done
fi

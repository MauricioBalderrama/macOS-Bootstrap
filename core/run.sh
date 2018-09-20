#!/bin/bash

# libs
. ../config.sh
. settings.sh
. functions.sh

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

###############################################################
@ "SSH" 2
###############################################################

# generate ssh key
_ "Checking for SSH key, generating one if it doesn't exist..."
[[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa

# copy & paste ssh key to GitHub
_ "Copying public key to clipboard..."
_ "Paste it into your Github account..."
[[ -f ~/.ssh/id_rsa.pub ]] && pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/account/ssh

# confirm user has pasted the ssy key to GitHub
@@ "Have you pasted the ssh key (already in your clipboard) to GitHub? (Y)"
read -r -n 1

###############################################################
@ "Sudo" 3
###############################################################

@@ "Please enter your admin password"

until sudo --non-interactive true 2> /dev/null; do # if password is wrong, keep asking
    read -s -p '' sudo_password
    echo
    sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null
done

# Keep-alive sudo time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Prevent computer from sleeping
sudo caffeinate &

###############################################################
@ "Homebrew" 4
###############################################################

# install/update homebrew
if test ! $(which brew); then
    _i "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    _i "Updating Homebrew..."
    brew update --debug --verbose
	brew upgrade
	brew prune
fi

_i "Set Hombrew cache location: ${homebrewCache}..."
export HOMEBREW_CACHE=${homebrewCache} # export HOMEBREW_CACHE=/Volumes/Installers/Homebrew

_i "Installing Homebrew formulas..."
brew install ${formulas[@]}

_i "Installing Homebrew fonts..."
brew tap caskroom/fonts
brew cask install ${fonts[@]}

_i "Downloading Homebrew casks..."
for cask in ${casks[@]}; do
    _s "Downloading:  ${cask}"
    brew cask fetch ${cask}
done

_i "Installing Homebrew casks..."
for cask in ${casks[@]}; do
	renew_sudo
    _s "Installing:  ${cask}"
    brew cask install  ${cask}
done

###############################################################
@ "Update" 5
###############################################################

_ "Running macOS software updates..."
renew_sudo
sudo softwareupdate -i -a

###############################################################
@ "System Configuration" 6
###############################################################

_ "Running system configuration (${configurationGitHubRepositoryName}) for macOS ${macOSName} ${macOSVersion}"
bash <(curl -L https://raw.githubusercontent.com/${gitHubUsername}/${configurationGitHubRepositoryName}/master/install)

###############################################################
@ "Dotfiles Configuration" 7
###############################################################

_ "Running dotfiles configuration (${dotfilesGitHubRepositoryName})"
bash <(curl -L https://raw.githubusercontent.com/${gitHubUsername}/${dotfilesGitHubRepositoryName}/master/install)

###############################################################
@ "Oh My Zsh" 8
###############################################################

# Use the zsh that brew installed
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# # Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# # Install Pure theme
# sudo npm install --global pure-prompt --allow-root --unsafe-perm=true

###############################################################
@ "Apps Configuration" 9
###############################################################
exit
_ "Running applications configuration"
source . core/apps

###############################################################
@ "Filesystem Configuration" 10
###############################################################

# Hide unused folders on ~
sudo chflags hidden ~/Pictures
sudo chflags hidden ~/Public
sudo chflags hidden ~/Applications
sudo chflags hidden ~/Movies
sudo chflags hidden ~/Music

# create work folder    ##### this one dos not belong here... #######################################################################
if [ ! -d ~/${workFolder} ]; then
  mkdir -p ~/${workFolder};
fi

###############################################################
@ "Dock Configuration" 11
###############################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Add applications to Dock (including blank spaces)
for app in "${dock[@]}"
do
    if [[ $app = space ]]; then
    	# create blank space to dock
        defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
        else
    	# create dock element
    	defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$app.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    fi
done

# Remove icons cache & kill Dock
sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;
sudo rm -rf /Library/Caches/com.apple.iconservices.store
killall Dock

###############################################################
@ "Reboot" 12
###############################################################

# Stop Caffeinate (allow computer to sleep)
sudo killall caffeinate

_ "macOS Bootstrap installation has completed"

@@ "Do you want to reboot now? (y/n)"
exit
# reboot
`sudo fdesetup isactive`
if [[ $? != 0 ]]; then
	while true; do
	    read -p "" yesOrNo
	    case $yesOrNo in
	        [Yy]* ) _ "System is rebooting..."; sleep 3; sudo reboot; break;;
	        [Nn]* ) _e "System needs to reboot to complete the installation"; exit;;
	        * ) _ "Please answer y or n";;
	    esac
	done
fi

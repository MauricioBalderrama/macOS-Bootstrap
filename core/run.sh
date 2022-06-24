#!/bin/bash

# libs
source ../config.sh
source ./settings.sh
source ./functions.sh

###############################################################
@ "Confirm you want to proceed"
###############################################################

@@ "Do you want to continue? (Y/n)"
read -r -n 1
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
fi

###############################################################
@ "SSH" 1
###############################################################

# generate ssh key
_i "Checking for SSH key, generating one if it doesn't exist..."
[[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''

# copy & paste ssh key to GitHub
_i "Copying public key to clipboard..."
_i "Paste it into your Github account..."
[[ -f ~/.ssh/id_rsa.pub ]] && pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/account/ssh

# confirm user has pasted the ssy key to GitHub
@@ "Have you pasted the ssh key (already in your clipboard) to GitHub? (Y)"
read -r -n 1

###############################################################
@ "Sudo" 2
###############################################################

@@ "Please enter your admin password"

until sudo --non-interactive true 2> /dev/null; do # if password is wrong, keep asking
    read -s -p '' sudo_password
    echo
    sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null
done

_i "Keep-alive sudo time stamp until finished"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

_i "Prevent computer from sleeping (caffeinate)"
sudo caffeinate -d -i -m -s -u &

###############################################################
@ "Homebrew" 3
###############################################################

# install/update homebrew
if test ! $(which brew); then
    _i "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    exit;;
    eval "$(/opt/homebrew/bin/brew shellenv)"    
else
    _i "Updating Homebrew..."
    brew update --verbose
	brew upgrade
	brew cleanup
fi

_i "Set Hombrew cache location: ${homebrewCache}..."
export HOMEBREW_CACHE=${homebrewCache}

_i "Homebrew is set to not update"
export HOMEBREW_NO_AUTO_UPDATE=1

_i "Installing Homebrew formulas..."
brew install ${formulas[@]}

_i "Installing Homebrew fonts..."
brew tap homebrew/cask-fonts
brew install cask ${fonts[@]}

_i "Downloading Homebrew casks..."
for cask in ${casks[@]}; do
    [[ ${cask} == 'spotify' ]] && continue
    [[ ${cask} == 'hyperdock' ]] && continue    
    [[ ${cask} == 'homebrew/cask-versions/google-chrome-canary' ]] && continue
    _s "Downloading:  ${cask}"
    brew fetch --cask ${cask}
done

_i "Installing Homebrew casks..."
for cask in ${casks[@]}; do
	renew_sudo
    _s "Installing:  ${cask}"
    brew install --cask ${cask}
done

_i "Re-install outdated casks"
brew cask reinstall `brew cask outdated`

_i "Removing old versions (cleanup)... "
brew cleanup

###############################################################
@ "Dock Configuration" 4
###############################################################

_i "Wipe all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array

_i "Add applications to Dock (including blank spaces)"
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

_i "Remove icons cache & kill Dock"
sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;
sudo rm -rf /Library/Caches/com.apple.iconservices.store
killall Dock

###############################################################
@ "Update Mac OS" 5
###############################################################

_i "Running macOS software updates..."
renew_sudo
#sudo softwareupdate -i -a

###############################################################
@ "System Configuration" 6
###############################################################

_i "Running system configuration (${configurationGitHubRepositoryName}) for macOS ${macOSName} ${macOSVersion}"
bash <(curl -L https://raw.githubusercontent.com/${gitHubUsername}/${configurationGitHubRepositoryName}/master/install)

###############################################################
@ "Dotfiles Configuration" 7
###############################################################

_i "Running dotfiles configuration (${dotfilesGitHubRepositoryName})"
bash <(curl -L https://raw.githubusercontent.com/${gitHubUsername}/${dotfilesGitHubRepositoryName}/master/install)

###############################################################
@ "Apps Configuration" 8
###############################################################

_i "Running applications configuration"
source ./apps.sh

###############################################################
@ "Composer" 9
###############################################################

_i "Installing composer"
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

_i "Add bin to PATH"
echo 'export PATH="$HOME/.composer/vendor/bin:$PATH" # Composer bin' >> ~/.profile && . ~/.profile

_i "Add Laravel installer"
composer global require "laravel/installer"

###############################################################
#@ "Server Configuration" 10
###############################################################

#_i "Running applications configuration"
#source ./server.sh

###############################################################
@ "Shell upgrade to Fish" 11
###############################################################

_i "Add /usr/local/bin/fish to /etc/shells"
cat /etc/shells|grep /usr/local/bin/fish || sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'

_i "Add /usr/local/bin/fish to /etc/shells"
chsh -s /usr/local/bin/fish

###############################################################
@ "Reboot" 12
###############################################################

_i "Allow computer to sleep (caffeinate)"
killall caffeinate

_ "macOS Bootstrap installation has completed"

@@ "Do you want to reboot now? (y/n)"

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

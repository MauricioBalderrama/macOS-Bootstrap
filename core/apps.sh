#!/bin/bash

###############################################################################
# iTerm 2                                                                     #
###############################################################################

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

#########
# Untested
#########s

# # Install the Solarized Dark theme for iTerm
# #open "${HOME}/init/Solarized Dark.itermcolors"

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Use the system-native print preview dialog
# defaults write com.google.Chrome DisablePrintPreview -bool true
# defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
# defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
# defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

#########
# Untested
#########

# Disable the all too sensitive backswipe on trackpads
#defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
#defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
#defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
#defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false


###############################################################################
# GPGMail 2                                                                   #
###############################################################################

#########
# Untested
#########

# # Disable signing emails by default
# defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false

###############################################################################
# Opera & Opera Developer                                                     #
###############################################################################

#########
# Untested
#########

# # Expand the print dialog by default
# defaults write com.operasoftware.Opera PMPrintingExpandedStateForPrint2 -boolean true
# defaults write com.operasoftware.OperaDeveloper PMPrintingExpandedStateForPrint2 -boolean true

###############################################################################
# Sublime Text                                                                #
###############################################################################

#########
# Untested
#########

# Install Sublime Text settings
#cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

###############################################################################
# Spectacle.app                                                               #
###############################################################################

#########
# Untested
#########

# Set up my preferred keyboard shortcuts
#cp -r init/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

###############################################################################
# Transmission.app                                                            #
###############################################################################

#########
# Untested
#########

# # Use `~/Documents/Torrents` to store incomplete downloads
# defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
# defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# # Use `~/Downloads` to store completed downloads
# defaults write org.m0k.transmission DownloadLocationConstant -bool true

# # Don’t prompt for confirmation before downloading
# defaults write org.m0k.transmission DownloadAsk -bool false
# defaults write org.m0k.transmission MagnetOpenAsk -bool false

# # Don’t prompt for confirmation before removing non-downloading active transfers
# defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# # Trash original torrent files
# defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# # Hide the donate message
# defaults write org.m0k.transmission WarningDonate -bool false
# # Hide the legal disclaimer
# defaults write org.m0k.transmission WarningLegal -bool false

# # IP block list.
# # Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
# defaults write org.m0k.transmission BlocklistNew -bool true
# defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
# defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# # Randomize port on launch
# defaults write org.m0k.transmission RandomPort -bool true

# ###############################################################################
# # Twitter.app                                                                 #
# ###############################################################################

# #########
# # Untested
# #########

# # Disable smart quotes as it’s annoying for code tweets
# defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# # Show the app window when clicking the menu bar icon
# defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# # Enable the hidden ‘Develop’ menu
# defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# # Open links in the background
# defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# # Allow closing the ‘new tweet’ window by pressing `Esc`
# defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# # Show full names rather than Twitter handles
# defaults write com.twitter.twitter-mac ShowFullNames -bool true

# # Hide the app in the background if it’s not the front-most window
# defaults write com.twitter.twitter-mac HideInBackground -bool true

# ###############################################################################
# # Tweetbot.app                                                                #
# ###############################################################################

# #########
# # Untested
# #########

# # Bypass the annoyingly slow t.co URL shortener
# defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true


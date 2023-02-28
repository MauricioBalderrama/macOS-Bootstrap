#!/bin/bash

# Visual Studio Code Settings Gist Code 
# d3df70c8e3492aa86d2bd7b64c37b8c0

# github username
gitHubUsername=MauricioBalderrama

# work folder
workFolder=Workspace

# Set HOMEBREW_CACHE to use a different download and storage location
homebrewCache=~/Installers/Homebrew

# System configuration repository name at GitHub
configurationGitHubRepositoryName=macOS-Hacks

# Dotfiles repository name at GitHub
dotfilesGitHubRepositoryName=macOS-Dotfiles

# formulas
formulas=(
    # shells
    bash # Default shell on mac
    fish # Shell with autosuggestions and autocomplete by default

    cask
    
    curl
    wget

    mackup # Keeps your application settings in sync

    node
    python

    git
    git-ftp
    brotli
    hub
    
    svn # For fonts
)

#fonts
fonts=(
    font-clear-sans
    font-open-sans
    font-noto-sans
    font-roboto 
    font-roboto-mono
    font-roboto-sla
    font-montserrat
    font-lato
    font-fira-code
    font-source-code-pro
    font-source-sans-pro
    font-raleway
    font-oswald
    font-poppins
    font-merriweather
    font-pt-sans
    font-ubuntu
    font-cuprum
    font-oxygen
    font-redhat
    font-space-mono
    font-monoid
    font-milonga
    font-anton
    font-3270
    font-abel
    font-montserrat
    font-playfair-display    
)

# casks
casks=(
    # browsers
    google-chrome
    tor-browser

    # database
    # psequel-pro # PostgreSQL GUI
    sequel-pro # MySQL & MariaDB GUI

    # development related
    visual-studio-code # Source code editor
    sourcetree # Git GUI
    figma # Design and prototyping
    iterm2 # Terminal alternative
    postman # Test REST APIs. Makes HTTP request

    # utilities
    duet # Use a tablet of phone as display
    cyberduck # FTP, SFTP, etc.
    transmission # Torrent GUI
    cakebrew # Homebrew GUI
    google-drive # File storage GUI
    # dropbox

    # chat & collaboration
    whatsapp # Whatsapp desktop app
    anydesk # Remote control
    zoom

    # system hacks
    moom # Arrange windows with keyboard shortcuts
    appcleaner # Uninstall applications completely
    flux # Changes the color temperature of your display adapt to the time of day
    keepingyouawake # Prevents your Mac from entering sleep mode
    symboliclinker # Allows users to make symbolic links in Finder
    
    # players
    iina

    # preview files (space bar preview) for developers https://github.com/sindresorhus/quick-look-plugins
    qlcolorcode 
    qlstephen 
    qlmarkdown 
    quicklook-json 
    qlimagesize 
    suspicious-package 
    quicklookase 
    qlvideo
)

# dock (`space` means a blank space in the dock)
dock=(
    space

    Launchpad
    # Siri
    System\ Preferences
    space

    WhatsApp
    space

    Visual\ Studio\ Code
    iTerm
    Figma
    Sequel\ Pro
    space

    Google\ Chrome
    space

    Cyberduck
    Sourcetree
    Google\ Drive
    # Dropbox
    # Docker
    # Vagrant
    # VirtualBox
    space

    # Spotify
    # VLC
    # qBittorrent    
)

#!/bin/bash

# Visual Studio Code Settings Gist Code 
# d3df70c8e3492aa86d2bd7b64c37b8c0

# github username
gitHubUsername=MauricioBalderrama

# work folder
workFolder=Workspace

# Set HOMEBREW_CACHE to use a different download and storage location
homebrewCache=/Volumes/Installers/Homebrew

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
)

#fonts
fonts=(
    font-fira-code
    font-roboto
    font-clear-sans
)

# casks
casks=(
    # office suite
    libreoffice

    # local server
    # mamp
    
    # virtualization
    virtualbox
    # parallels

    # browsers
    google-chrome
    firefox
    tor-browser

    # database
    psequel # PostgreSQL GUI
    sequel-pro # MySQL & MariaDB GUI

    # code related
    visual-studio-code # Source code editor
    iterm2 # Terminal alternative
    postman # Test REST APIs. Makes HTTP request
    # hyper

    # utilities
    duet # Use a tablet of phone as display
    hyperdock # window previews
    sketchup # 3D modeling
    cyberduck # FTP, SFTP, etc.
    sourcetree # Git GUI
    # qbittorrent # Torrent GUI
    transmission # Torrent GUI
    cakebrew # Homebrew GUI
    # dropbox
    # google-drive

    # chat & collaboration
    whatsapp # Whatsapp desktop app
    teamviewer # Remote control
    skype # Skype desktop app

    # system hacks
    spectacle # Arrange windows with keyboard shortcuts
    appcleaner # Uninstall applications completely
    flux # Changes the color temperature of your display adapt to the time of day
    keepingyouawake # Prevents your Mac from entering sleep mode
    symboliclinker # Allows users to make symbolic links in Finder
    
    # players
    vlc
    # spotify
    # spotifree

    # preview for developers https://github.com/sindresorhus/quick-look-plugins
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
    Siri
    System\ Preferences
    LibreOffice
    # Calendar
    space

    WhatsApp
    # TeamViewer
    # Skype
    space

    Visual\ Studio\ Code
    space

    # Tor\ Browser
    # Firefox
    # Safari
    Google\ Chrome
    space

    iTerm
    space

    SourceTree
    Cyberduck
    # Dropbox
    # Google\ Drive
    # MAMP/MAMP
    # Docker
    # Vagrant
    VirtualBox
    space

    # Spotify
    # VLC
    # qBittorrent    
)

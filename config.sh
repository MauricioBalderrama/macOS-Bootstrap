#!/bin/bash

# github username
gitHubUsername=MauricioBalderrama

# work folder
workFolder=Workspace

# Set HOMEBREW_CACHE to use a different download and storage location
homebrewCache=/Volumes/Installers/Homebrew

# formulas
formulas=(
    bash
    bash-completion

    cask
    
    curl
    wget

    mackup
    
    nodejs
    python

    aws-shell
    awscli
    
    git
    hub
    git-crypt
    colordiff

    coreutils
    findutils
)

#fonts
fonts=(
    font-roboto
    font-clear-sans
)

# casks
casks=(
    #browsers
    google-chrome
    firefox
    tor-browser
    homebrew/cask-versions/google-chrome-canary

    # code related
    visual-studio-code
    hyper
    # sublime-text
    # iterm2

    # utilities
    hyperdock
    sketchup
    # filezilla # fails
    sourcetree
    qbittorrent
    # dropbox
    # google-drive

    # servers & virtualization
    xampp
    # docker
    # vagrant
    # virtualbox

    # chat & collaboration
    whatsapp
    teamviewer
    skype

    # players
    vlc
    spotify

    # system hacks
    appcleaner
    flux
    keepingyouawake
    spotifree
)

# dock (`space` means a blank space in the dock)
dock=(
    Launchpad
    Siri
    System\ Preferences
    App\ Store
    Calendar
    space

    WhatsApp
    TeamViewer
    Skype
    space

    Tor\ Browser
    Firefox
    Safari
    Google\ Chrome\ Canary
    Google\ Chrome
    space

    Visual\ Studio\ Code
    Hyper
    # iTerm
    # Utilities/Terminal
    space

    FileZilla
    SourceTree
    # Dropbox
    # Google\ Drive
    space

    XAMPP/xamppfiles/manager-osx #xampp
    # Docker
    # Vagrant
    # VirtualBox
    space

    Spotify
    VLC
    qBittorrent    
)

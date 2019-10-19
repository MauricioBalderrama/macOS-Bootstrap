#!/bin/bash

# Visual Studio Code Settings Gist Code 
# d3df70c8e3492aa86d2bd7b64c37b8c0

# github username
gitHubUsername=MauricioBalderrama

# work folder
workFolder=Workspace

# Set HOMEBREW_CACHE to use a different download and storage location
homebrewCache=/Volumes/Installers

# Mac configuration repository name at GitHub
configurationGitHubRepositoryName=macOS-Hacks

# Dotfiles repository name at GitHub
dotfilesGitHubRepositoryName=macOS-Dotfiles

# formulas
formulas=(
    bash

    # consider removing zsh
    # zsh
    # zsh-autosuggestions
    # zsh-completions

    cask
    
    curl
    wget

    mackup
    
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
    mamp
    
    # virtualization
    virtualbox
    # parallels

    #browsers
    google-chrome
    firefox
    tor-browser

    # code related
    visual-studio-code
    # hyper

    # utilities
    duet
    hyperdock
    sketchup
    cyberduck
    # transmit
    sourcetree
    qbittorrent
    # dropbox
    # google-drive

    # chat & collaboration
    whatsapp
    teamviewer
    skype

    # system hacks
    spectacle
    appcleaner
    flux
    keepingyouawake
    symboliclinker
    
    # players
    vlc
    # spotify
    # spotifree
)

# dock (`space` means a blank space in the dock)
dock=(
    Launchpad
    Siri
    System\ Preferences
    LibreOffice
    # App\ Store
    # Calendar
    space

    WhatsApp
    # TeamViewer
    # Skype
    space

    # Tor\ Browser
    # Firefox
    # Safari
    Google\ Chrome
    space

    Visual\ Studio\ Code
    # Utilities/Terminal
    # Xcode
    SourceTree
    Cyberduck
    # Dropbox
    # Google\ Drive
    MAMP/MAMP
    # Docker
    # Vagrant
    VirtualBox
    # space

    # Spotify
    # VLC
    # qBittorrent    
)

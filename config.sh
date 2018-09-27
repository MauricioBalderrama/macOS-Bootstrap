#!/bin/bash

# Visual Studio Code Settings Gist Code 
# d3df70c8e3492aa86d2bd7b64c37b8c0

# github username
gitHubUsername=MauricioBalderrama

# work folder
workFolder=Workspace

# Set HOMEBREW_CACHE to use a different download and storage location
homebrewCache=/Volumes/Installers/Homebrew

# Mac configuration repository name at GitHub
configurationGitHubRepositoryName=macOS-Hacks

# Dotfiles repository name at GitHub
dotfilesGitHubRepositoryName=macOS-Dotfiles

# formulas
formulas=(
    bash
    bash-completion

    zsh
    zsh-autosuggestions
    zsh-completions

    cask
    
    curl
    wget

    mackup
    
    node
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
    font-fira-code
    font-roboto
    font-clear-sans
)

# casks
casks=(
    # servers & virtualization
    mamp
    # docker
    # vagrant
    # virtualbox

    #browsers
    google-chrome
    firefox
    tor-browser

    # code related
    visual-studio-code
    hyper

    # utilities
    duet
    hyperdock
    sketchup
    # filezilla # fails
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
    spotifree

    # players
    vlc
    spotify

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
    Google\ Chrome
    space

    Visual\ Studio\ Code
    Hyper
    Utilities/Terminal
    Xcode
    space

    # FileZilla
    SourceTree
    # Dropbox
    # Google\ Drive
    space

    MAMP/MAMP
    # XAMPP/xamppfiles/manager-osx
    # Docker
    # Vagrant
    # VirtualBox
    space

    Spotify
    VLC
    qBittorrent    
)

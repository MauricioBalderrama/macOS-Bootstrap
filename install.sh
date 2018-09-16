#!/bin/bash

# variables
declare cloneFolder=~/macOS-Bootstrap
declare gitHubUsername=MauricioBalderrama
declare gitHubRepository=macOS-Bootstrap

# download repository
if [[ ! -d ${cloneFolder} ]]; then
    # clone
    echo ""
    echo "Downloading OSX Bootstrap..."
    git clone https://github.com/${gitHubUsername}/macOS-Bootstrap.git ${cloneFolder}
else
    # update
    echo ""
    echo "Updating OSX Bootstrap..."
    cd $cloneFolder
    git pull origin master
fi

# update remote to use SSH
cd ${cloneFolder}
git remote rm origin
git remote add origin git@github.com:${gitHubUsername}/${gitHubRepository}
git push --set-upstream origin master

# run
cd ${cloneFolder}/core
source run.sh

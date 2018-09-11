#!/bin/bash

# variables
declare source_dir=~/macOS-Bootstrap

# download repository
if [[ ! -d $source_dir ]]; then
    # clone
    echo ""
    echo "${red}Downloading OSX Bootstrap...${reset} (Step: 1 of 1)"
    git clone https://github.com/MauricioBalderrama/macOS-Bootstrap.git $source_dir
else
    # update
    echo ""
    echo "${red}Updating OSX Bootstrap...${reset} (Step: 1 of 1)"
    cd $source_dir
    git pull origin master
fi

# run
cd $source_dir/core/
source run.sh
#!/bin/bash

# variables
declare source_dir=~/macOS-Bootstrap
declare gitHubUsername=MauricioBalderrama

# download repository
if [[ ! -d ${source_dir} ]]; then
    # clone
    echo ""
    echo "Downloading OSX Bootstrap..."
    git clone https://github.com/${gitHubUsername}/macOS-Bootstrap.git ${source_dir}
else
    # update
    echo ""
    echo "Updating OSX Bootstrap..."
    cd $source_dir
    git pull origin master
fi

# run
cd ${source_dir}/core
source run.sh
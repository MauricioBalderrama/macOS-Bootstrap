#!/bin/bash

@ "Xcode" 1

_ "Xcode is ~5.3 Gb."
_ "It is recommended you have it installed and updated."
_ "Xcode can be downloaded from the AppStore"

@@ "Do you want to continue? (Y/n)"
read -r -n 1
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
fi

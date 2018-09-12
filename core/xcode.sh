#!/bin/bash

@ "Xcode" 1

_ "Xcode is ~4.9 Gb."
_ "It is recommended you have it installed and updated."
_ "Xcode can be downloaded from: https://developer.apple.com/download/more/"

@@ "Do you want to continue? (Y/n)"
read -r -n 1
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
fi

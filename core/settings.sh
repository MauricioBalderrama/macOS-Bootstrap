#!/bin/bash

# macOS name
declare macOSName="Big Sur"

# macOS version
declare macOSVersion="11.6.2"

# number of total steps for this script
declare totalSteps=12

# colors
declare black=$'\033[0;30m'
declare red=$'\033[0;31m'
declare green=$'\033[0;32m'
declare yellow=$'\033[0;33m'
declare blue=$'\033[0;34m'
declare purple=$'\033[0;35m'
declare cyan=$'\033[0;36m'
declare white=$'\033[0;37m'

declare bblack=$'\033[1;30m'
declare bred=$'\033[1;31m'
declare bgreen=$'\033[1;32m'
declare byellow=$'\033[1;33m'
declare bblue=$'\033[1;34m'
declare bpurple=$'\033[1;35m'
declare bcyan=$'\033[1;36m'
declare bwhite=$'\033[1;37m'

declare bold=$(tput bold) # bold
declare dim=$'\033[2m'
declare reset=$'\e[0m' # reset font and color  

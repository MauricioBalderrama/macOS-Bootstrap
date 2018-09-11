#!/bin/bash

# clean screen - http://www.kammerl.de/ascii/AsciiSignature.php - kban font
clean() {
    clear
    echo "${cyan}"
    echo "                             ..|''||    .|'''.|     '||''|.                     .            .                            "
    echo " .. .. ..    ....     ....  .|'    ||   ||..  '      ||   ||    ...     ...   .||.   ....  .||.  ... ..   ....   ... ...  "
    echo "  || || ||  '' .||  .|   '' ||      ||   ''|||.      ||'''|.  .|  '|. .|  '|.  ||   ||. '   ||    ||' '' '' .||   ||'  || "
    echo "  || || ||  .|' ||  ||      '|.     || .     '||     ||    || ||   || ||   ||  ||   . '|..  ||    ||     .|' ||   ||    | "
    echo " .|| || ||. '|..'|'  '|...'  ''|...|'  |'....|'     .||...|'   '|..|'  '|..|'  '|.' |'..|'  '|.' .||.    '|..'|'  ||...'  "
    echo "                                                                                                                  ||      "
    echo "                                                                                                                 ''''     "
    echo "                                                                                            ${cyan}For macOS ${macOSName} v${macOSVersion}+ "
    echo ""
}

# title h1
@() {
    clean

    title=$1
    step=$2
    
    echo ""
    if test -z "$var"; then
        echo "${bcyan}${title}"
    else
        echo "${bcyan}${title} ${dim}(Step: ${step} of ${totalSteps})"
    fi    
    echo ""
}

# title h2
@@() {
    title=$1
    echo ""
    echo "${red}${title} ${reset}"
}

# paragraph p
_() {
    paragraph=$1
    color=$2
    status=$3
    echo ""
    echo "${reset}${color}${status}${paragraph}${reset}"
}

# dimed paragraph p
__() {
    _ "$1" ${dim}
}

# success paragraph p
_s() {
    _ "$1" ${bgreen} "Success: "
}

# warning paragraph p
_w() {
    _ "$1" ${byellow} "Warning: "
}

# error paragraph p
_e() {
    _ "$1" ${bred} "Error: "
}

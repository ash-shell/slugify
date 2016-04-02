#!/bin/bash

#################################################
# This function will convert $1 into a valid
# slug
#
# @param $1: The String to slugify
# @param $2: `--quiet` for no logger prefix
#################################################
Slugify__callable_main(){
    if [[ "$1" = "" ]]; then
        Slugify__callable_help
        return 1
    fi

    if [[ -n "$2" && "$2" = "--quiet" ]]; then
        Logger__disable_prefix
    fi

    Logger__log "$(Slugify__slugify "$1")"
}

#################################################
# Prints out usage of this module
#################################################
Slugify__callable_help(){
    more "$Ash__ACTIVE_MODULE_DIRECTORY/HELP.txt"
}

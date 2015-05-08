#!/bin/bash

#################################################
# This function will convert $1 into a valid
# slug
#
# @param $1: The string to slugify
#################################################
Slugify__slugify() {
    local output="$1"
    output="$(Slugify_alpha_numeric "$output")"
    output="$(Slugify_lowercase "$output")"
    echo "$output"
}

#################################################
# This function will convert $1 to all lowercase
#
# @param $1: The string to lowercase
#################################################
Slugify_lowercase() {
    echo "$(echo $1 | awk '{print tolower($0)}')"
}

#################################################
# This function will convert all non alpha-numeric
# characters to dashes for a string
#
# @param $1: The string to convert
#################################################
Slugify_alpha_numeric(){
    # Determining flag for extended regex
    local sed_flag="-r"
    if [[ "$Ash__active_platform" = "$Ash__PLATFORM_FREEBSD"
        || "$Ash__active_platform" = "$Ash__PLATFORM_DARWIN" ]]; then
        sed_flag="-E"
    fi

    # Replacing all non alpha-numeric chars with a dash
    echo "$(echo "$1" | sed "$sed_flag" 's/[^a-zA-Z0-9\-]+/-/g')"
}

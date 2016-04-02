#!/bin/bash

#################################################
# This function will convert $1 into a valid
# slug
#
# @param $1: The string to slugify
# @returns: The slugified string
#################################################
Slugify__slugify() {
    # Params
    local output="$1"
    local extended_flag=$(Slugify_sed_flag)

    # Convert all chars to lowercase
    output="$(echo "$output" | awk '{print tolower($0)}')"

    # Remove all single quotes
    output=$(echo "$output" | sed "-$extended_flag" "s/\'//g")

    # Convert all non-alpha-numeric to dashes (-)
    output=$(echo "$output" | sed "-$extended_flag" "s/[^a-zA-Z0-9-]+/-/g")

    # Replace multple dash occurances with singles
    output="$(echo "$output" | sed "-$extended_flag" 's/-+/-/g')"

    # Remove trailing dashes
    output="$(echo "$output" | sed "-$extended_flag" 's/^-+|-+$//g')"

    # OK
    echo "$output"
}

#################################################
# Determines the "extended" sed flag, depending
# on the environment
#
# @return: The flag name (without dash)
#################################################
Slugify_sed_flag(){
    local sed_flag="r"
    local platform="$(Ash__get_active_platform)"
    if [[ "$platform" = $Ash__PLATFORM_FREEBSD
        || "$platform" = $Ash__PLATFORM_DARWIN ]]; then
        sed_flag="E"
    fi
    echo "$sed_flag"
}

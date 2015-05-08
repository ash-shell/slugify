#!/bin/bash

#################################################
# This function will convert $1 into a valid
# slug
#
# @param $1: The string to slugify
#################################################
Slugify__slugify() {
    local output="$1"
    output="$(Slugify_space_to_dash "$output")"
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
# This function will convert all spaces to
# dashes for a string
#
# @param $1: The string to convert spaces to
#   dashes
#################################################
Slugify_space_to_dash(){
    echo "${1// /-}"
}

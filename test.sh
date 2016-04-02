#!/bin/bash

#################################################
# This test is intended to verify that trimming
# of spaces is working properly
#################################################
Slugify__test_slugify_spaces(){
    # Space in the middle of a sentence
    Slugify_test_single_slugify "Brandon Romano" "brandon-romano"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Multiple Spaces
    Slugify_test_single_slugify "Radical   Ricky" "radical-ricky"
    if [[ $? -ne 0 ]]; then return 1; fi
}

#################################################
# This test is intended to verify that trailing
# spaces and other characters is working
# properly
#################################################
Slugify__test_trailing() {
    # Trailing spaces before
    Slugify_test_single_slugify "    Unique New York" "unique-new-york"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Trailing spaces after
    Slugify_test_single_slugify "Unique New York    " "unique-new-york"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Trailing spaces before and after
    Slugify_test_single_slugify " Unique New York " "unique-new-york"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Trailing Hyphens
    Slugify_test_single_slugify "---Unique New York---" "unique-new-york"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Trailing Special Chars
    Slugify_test_single_slugify ")()(Unique New York&&%^&@#%" "unique-new-york"
    if [[ $? -ne 0 ]]; then return 1; fi
}

#################################################
# This test is intended to verify that special
# characters are handled appropriately
#################################################
Slugify__test_special_chars() {
    Slugify_test_single_slugify "Hello----World" "hello-world"
    if [[ $? -ne 0 ]]; then return 1; fi

    Slugify_test_single_slugify "Walk---)the -Dog ----  " "walk-the-dog"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Underscores
    Slugify_test_single_slugify "Walk_The_Dog" "walk-the-dog"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Underscores
    Slugify_test_single_slugify "Walk!@#$%^&*()_+-={}[]\|:;<,>.?/'The_Dog" "walk-the-dog"
    if [[ $? -ne 0 ]]; then return 1; fi

    # Apostrophes
    Slugify_test_single_slugify \
        "The last of PS2's online servers shut down today. RIP PS2 (March 4, 2000 - March 31, 2016)" \
        "the-last-of-ps2s-online-servers-shut-down-today-rip-ps2-march-4-2000-march-31-2016"
    if [[ $? -ne 0 ]]; then return 1; fi
}

#################################################
# This is a helper function, and is not run
# directly by our test suite (note the single
# underscore).
#
# @param $1: The input to test on slugify
# @param $2: The expected value of the slugify
# @returns $?: 1 if this test has failed,
#   0 if this test was successful.  Also returns
#   the error message to be returned in our tests.
#################################################
Slugify_test_single_slugify(){
    local input="$1"
    local expected_result="$2"

    local result="$(Slugify__slugify "$input")"
    if [[ "$result" != "$expected_result" ]]; then
        echo "Slugify__slugify should convert '$input' into '$expected_result'"
        echo "Actual Result: '$result'"
        return 1
    else
        return 0
    fi
}

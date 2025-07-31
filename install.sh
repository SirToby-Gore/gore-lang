#!/bin/bash

# exits on error
set -e

source ./vars.sh

declare -A styles=(
    # Foreground colors
    ["black"]="30"
    ["red"]="31"
    ["green"]="32"
    ["yellow"]="33"
    ["blue"]="34"
    ["magenta"]="35"
    ["cyan"]="36"
    ["white"]="37"
    ["default_fg"]="39" # Resets foreground color to default

    # Bright foreground colors (often supported by modern terminals)
    ["bright_black"]="90"
    ["bright_red"]="91"
    ["bright_green"]="92"
    ["bright_yellow"]="93"
    ["bright_blue"]="94"
    ["bright_magenta"]="95"
    ["bright_cyan"]="96"
    ["bright_white"]="97"

    # Background colors
    ["bg_black"]="40"
    ["bg_red"]="41"
    ["bg_green"]="42"
    ["bg_yellow"]="43"
    ["bg_blue"]="44"
    ["bg_magenta"]="45"
    ["bg_cyan"]="46"
    ["bg_white"]="47"
    ["default_bg"]="49" # Resets background color to default

    # Bright background colors (often supported)
    ["bg_bright_black"]="100"
    ["bg_bright_red"]="101"
    ["bg_bright_green"]="102"
    ["bg_bright_yellow"]="103"
    ["bg_bright_blue"]="104"
    ["bg_bright_magenta"]="105"
    ["bg_bright_cyan"]="106"
    ["bg_bright_white"]="107"

    # Text styles
    ["bold"]="1"
    ["dim"]="2" # Faint/decreased intensity
    ["italic"]="3"
    ["underline"]="4"
    ["blink"]="5" # Slow blink
    ["fast_blink"]="6" # Fast blink (less commonly supported)
    ["reverse"]="7" # Inverse (swaps foreground and background colors)
    ["hidden"]="8" # Conceal (invisible text)
    ["strike_through"]="9"

    # Reset codes for individual properties (useful for granular control)
    ["no_bold"]="21"
    ["no_dim"]="22"
    ["no_italic"]="23"
    ["no_underline"]="24"
    ["no_blink"]="25"
    ["no_reverse"]="27"
    ["no_hidden"]="28"
    ["no_strike_through"]="29"

    # General reset code: Resets all attributes to default
    ["reset"]="0"
)

echo-clr() {
    # Check if at least two arguments are provided (message + at least one style)
    if [ "$#" -lt 2 ]; then
        display_usage
    fi

    # The first argument is the message to be printed
    message="$1"
    shift # Remove the message from the argument list, leaving only style/color names

    ansi_codes="" # Initialize an empty string to accumulate ANSI escape codes
    invalid_styles=() # Initialize an array to store any unrecognized style names

    # Iterate over each remaining argument (which are the requested styles/colors)
    for style_name in "$@"; do
        # Convert the style name to lowercase for case-insensitive matching
        style_name_lower=$(echo "$style_name" | tr '[:upper:]' '[:lower:]')

        # Check if the lowercase style name exists as a key in our 'styles' associative array
        if [[ -v styles["$style_name_lower"] ]]; then
            # If valid, append the corresponding ANSI escape code to our accumulator string
            ansi_codes+="\e[${styles[$style_name_lower]}m"
        else
            # If not valid, add it to the list of invalid styles
            invalid_styles+=("$style_name")
        fi
    done

    if [ ${#invalid_styles[@]} -gt 0 ]; then
        # Print an error message to standard error (>&2)
        echo "Error: The following styles were not recognized: ${invalid_styles[*]}" >&2
        echo "Please refer to the usage for available styles." >&2
        display_usage # Show usage and exit if invalid styles were provided
    fi

    echo -e "${ansi_codes}${message}\e[0m"
}

echo-clr "this program requires sudo to:" yellow
echo-clr "  - make the gore lang directory" yellow
echo-clr "  - move item into the directory" yellow
echo-clr "  - change ownership of the directory" yellow
echo-clr "  - to move the binary into the /bin folder" yellow

echo-clr "Starting" green

echo-clr "making the gore lang directory: \"$INSTALL_DIR\"" cyan
sudo mkdir "\"$INSTALL_DIR\"" -p

echo-clr "moving the files into the gore lang directory" cyan
sudo mv ./* "\"$INSTALL_DIR/\""
sudo mv ./.* "\"$INSTALL_DIR/\""

echo-clr "changing to /usr/lib"  cyan
cd /usr/lib

echo-clr "changing ownership to $USER" cyan
sudo chown $USER gore_lang -R

echo-clr "changing back to $INSTALL_DIR" cyan
cd $INSTALL_DIR

echo-clr "going into the packages sub directory" cyan
cd packages

echo-clr "building the packages" cyan
python3 build_packages.py

echo-clr "building the binary" cyan
./build_gore_lang.sh

echo-clr "Done" green

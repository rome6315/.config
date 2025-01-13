#!/bin/bash

# load the current_theme.txt file into a var
current_theme="$HOME/.config/scripts/theme-switcher/current_theme.txt"

# get the current theme. current_theme.txt is written to each time the change_theme.sh script runs.
theme=$(cat $current_theme) 

# set the tooltip for waybar
tooltip="Click to open the theme selection menu"

# json output for waybar
echo "{\"text\": \"Theme: $theme\", \"tooltip\": \"$tooltip\"}"

#!/bin/bash

list_of_themes=$HOME/.config/scripts/theme-switcher/themes.txt #grab the list of themes

selection=$(cat "$list_of_themes" | rofi -dmenu -i -p "Select a theme  ") #output the themes to rofi

#pass the selection variable to the script that actually changes the themes
if [ -n "$selection" ]; then
  $HOME/.config/scripts/theme-switcher/change_theme.sh "$selection"
fi

#!/bin/bash

scripts=$HOME/.config/scripts # set scripts directory

# for each theme, run the necessary scripts and pass the necessary parameter
if [[ "$1" == "Gruvbox Light" ]]; then
  $scripts/wallpaper_theme.sh "gruvbox-anime-sit.jpg"
  $scripts/waybar_theme.sh "gruvbox-light"
  $scripts/hyprland_theme.sh "gruvbox-light"
  $scripts/kitty_theme.sh "Gruvbox Light"
  $scripts/starship_theme.sh "gruvbox-light"
  $scripts/cava_theme.sh "gruvbox-light"
  $scripts/rofi_theme.sh "gruvbox-light"
  $scripts/dunst_theme.sh "gruvbox-light"

elif [[ "$1" == "Peaceful Pond" ]]; then
  $scripts/wallpaper_theme.sh "peaceful_pond.png"
  $scripts/waybar_theme.sh "peaceful_pond"
  $scripts/hyprland_theme.sh "peaceful_pond"
  $scripts/kitty_theme.sh "Peaceful Pond"
  $scripts/starship_theme.sh "peaceful_pond"
  $scripts/cava_theme.sh "peaceful_pond"
  $scripts/rofi_theme.sh "peaceful_pond"
  $scripts/dunst_theme.sh "peaceful_pond"
fi

notify-send -t 3000 "Changed theme to $1" # let user know theme has been changed, erase notification after 3 seconds

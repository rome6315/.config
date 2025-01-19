#!/bin/bash

scripts=$HOME/.config/scripts/theme-switcher # set scripts directory

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

elif [[ "$1" == "Gruvbox Dark" ]]; then
  $scripts/wallpaper_theme.sh "gruvbox-chinatown.png"
  $scripts/waybar_theme.sh "gruvbox-dark"
  $scripts/hyprland_theme.sh "gruvbox-dark"
  $scripts/kitty_theme.sh "Gruvbox Material Dark Soft"
  $scripts/starship_theme.sh "gruvbox-dark"
  $scripts/cava_theme.sh "gruvbox-dark"
  $scripts/rofi_theme.sh "gruvbox-dark"
  $scripts/dunst_theme.sh "gruvbox-dark"

elif [[ "$1" == "Peaceful Pond" ]]; then
  $scripts/wallpaper_theme.sh "peaceful_pond.png"
  $scripts/waybar_theme.sh "peaceful_pond"
  $scripts/hyprland_theme.sh "peaceful_pond"
  $scripts/kitty_theme.sh "Peaceful Pond"
  $scripts/starship_theme.sh "peaceful_pond"
  $scripts/cava_theme.sh "peaceful_pond"
  $scripts/rofi_theme.sh "peaceful_pond"
  $scripts/dunst_theme.sh "peaceful_pond"

elif [[ "$1" == "Purple Abyss" ]]; then
  $scripts/wallpaper_theme.sh "purple-abyss.jpg"
  $scripts/waybar_theme.sh "purple_abyss2" # regular 'purple_abyss' uses the more squared borders
  $scripts/hyprland_theme.sh "purple_abyss"
  $scripts/kitty_theme.sh "Purple Abyss"
  $scripts/starship_theme.sh "purple_abyss"
  $scripts/cava_theme.sh "purple_abyss"
  $scripts/rofi_theme.sh "purple_abyss"
  $scripts/dunst_theme.sh "purple_abyss"

elif [[ "$1" == "Mugetsu" ]]; then
  $scripts/wallpaper_theme.sh "mugetsu.jpg"
  $scripts/waybar_theme.sh "mugetsu2" # regular 'mugetsu' has some corners boxed some rounded
  $scripts/hyprland_theme.sh "mugetsu"
  $scripts/kitty_theme.sh "Mugetsu"
  $scripts/starship_theme.sh "mugetsu"
  $scripts/cava_theme.sh "mugetsu"
  $scripts/rofi_theme.sh "mugetsu"
  $scripts/dunst_theme.sh "mugetsu"

elif [[ "$1" == "Pastel Sky" ]]; then
  $scripts/wallpaper_theme.sh "pastel_sky.png"
  $scripts/waybar_theme.sh "pastel_sky"
  $scripts/hyprland_theme.sh "pastel_sky"
  $scripts/kitty_theme.sh "Pastel Sky"
  $scripts/starship_theme.sh "pastel_sky"
  $scripts/cava_theme.sh "pastel_sky"
  $scripts/rofi_theme.sh "pastel_sky"
  $scripts/dunst_theme.sh "pastel_sky"

elif [[ "$1" == "Pain" ]]; then
  $scripts/wallpaper_theme.sh "pain_tongue.jpg"
  $scripts/waybar_theme.sh "pain"
  $scripts/hyprland_theme.sh "pain"
  $scripts/kitty_theme.sh "Pain"
  $scripts/starship_theme.sh "pain"
  $scripts/cava_theme.sh "pain"
  $scripts/rofi_theme.sh "pain"
  $scripts/dunst_theme.sh "pain"
fi


echo "$1" > $scripts/current_theme.txt # write the current theme to current_theme.txt so it can be used in the waybar theme module

notify-send -t 3000 "Changed theme to $1" # let user know theme has been changed, erase notification after 3 seconds

#!/bin/bash 

# copy the theme to config.rasi so it will switch
echo "@theme 'themes/$1.rasi'" > $HOME/.config/rofi/config.rasi


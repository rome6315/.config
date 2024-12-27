#!/bin/bash

echo "@import 'themes/$1.css';" > $HOME/.config/waybar/theme.css # copy the theme to theme.css which is used to read colors into style.css

# reload waybar
killall waybar
waybar &

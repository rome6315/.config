#!/bin/bash

echo "@import 'themes/$1.css';" > $HOME/.config/waybar/style.css # copy the theme into style.css

# reload waybar
killall waybar
waybar &

#!/bin/bash

echo "source=./themes/$1.conf" > $HOME/.config/hypr/theme.conf #echo the theme conf file to the file hyprland will source

#re-enable the vibrance shader
sleep 2
hyprshade on vibrance

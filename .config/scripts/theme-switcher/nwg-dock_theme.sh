#!/bin/bash 

# echo the themes import to theme.css, which is read in by style.css
echo "@import 'themes/$1.css';" > $HOME/.config/nwg-dock-hyprland/style.css

# restart nwg-dock-hyprland so the new colorscheme loads
killall nwg-dock-hyprland
nwg-dock-hyprland -mb 5 -i 26 -w 6 -d -hd 0

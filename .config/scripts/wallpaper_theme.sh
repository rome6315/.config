#!/bin/bash

swww img -o DP-1  --transition-type wipe --transition-angle 0 --transition-step 70 ~/Pictures/Wallpapers/$1 #set wallpaper 1
swww img -o DP-2  --transition-type wipe --transition-angle 0 --transition-step 70 ~/Pictures/Wallpapers/$1 #set wallpaper 2


# Now echo the same commands into the set_wallpaper.sh file
echo "#!/bin/bash
# this file gets overwritten by wallpaper_theme.sh so that hyprland (using swww) will load the last used wallpaper on restart
swww img -o DP-1 --transition-type wipe --transition-angle 0 --transition-step 70 ~/Pictures/Wallpapers/$1 #set wallpaper 1
swww img -o DP-2 --transition-type wipe --transition-angle 0 --transition-step 70 ~/Pictures/Wallpapers/$1 #set wallpaper 2" > $HOME/.config/hypr/scripts/set_wallpaper.sh


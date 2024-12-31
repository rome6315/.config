#!/bin/bash 


# get aur and pacman updates then add them together 
updates_arch=$(checkupdates 2>/dev/null | wc -l)
updates_aur=$(aura -Qum 2>/dev/null | wc -l)
updates=$((updates_arch + updates_aur))

# get the package list for aur 
aur_packages=$(aura -Qum)

# get the package count for pacman in a different var. I wait a while to update my system so I dont want a whole list of 300+ packages in the tooltip
pacman_packages=$(checkupdates 2>/dev/null | wc -l)

# declare a variable that will show the proper icon unless there's no updates
icon="󰇚"

# want to see whats going to break my system next
if [[ $updates_aur -eq 0 ]]; then
  aur_packages="No AUR updates!"
fi

# checkmark icon if no updates
if [[ $updates -eq 0 ]]; then
  icon=""
fi


echo "{\"text\": \"$icon $updates\", \"tooltip\": \"$aur_packages\"}"

#!/bin/bash 


# get aur and pacman updates then add them together 
updates_arch=$(checkupdates 2>/dev/null | wc -l)
updates_aur=$(aura -Qum 2>/dev/null | wc -l)
updates=$((updates_arch + updates_aur))

# get the package list for aur 
aur_packages=$(aura -Qum)

# get the package count for pacman in a different var. I wait a while to update my system so I dont want a whole list of 300+ packages in the tooltip
pacman_packages=$(checkupdates 2>/dev/null | wc -l)

if [[ $updates_aur -eq 0 ]]; then
  aur_packages="No AUR updates!"
fi


echo "{\"text\": \"$updates\", \"tooltip\": \"$aur_packages\"}"

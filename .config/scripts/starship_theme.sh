#!/bin/bash

# copy the theme to starship.toml
cp $HOME/.config/starship/themes/$1.toml $HOME/.config/starship/starship.toml

# reload starship prompt in all kitty windows
# couldnt get this to work out. may revisit. can have kitty terminals listen on certain sockets defined 
# in kitty.conf. should be able to send the starship init fish | source command to each pid and their 
# unique socket via kitty @ send-text
# FOR NOW, opening a new terminal once the theme is switched will soruce the new theme for all starships running

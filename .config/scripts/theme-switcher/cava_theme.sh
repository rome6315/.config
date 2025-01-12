#!/bin/bash

# if cava is open, pkill it and then copy the new config over, and then restart it
if [[ $(pgrep -x "cava") ]]; then
  killall "cava"
  cp ~/.config/cava/themes/$1.config ~/.config/cava/config
else
  cp ~/.config/cava/themes/$1.config ~/.config/cava/config # if it is not open, just copy the config
fi

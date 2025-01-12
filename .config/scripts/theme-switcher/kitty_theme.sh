#!/bin/bash

# to add your own theme to kitty with pywal, copy the colors from the .cache dir to .config/kitty/themes
# then run kitten themes --reload and choose the theme to copy w/o modifying kitty.config
# then copy the generated file to the themes dir and remove it from the kitty dir

kitten themes --reload-in=all "$1" # tell kitty to reload the theme for all active terminals

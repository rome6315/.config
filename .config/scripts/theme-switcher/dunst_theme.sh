#!/bin/bash

# copy theme to dunstrc
cp $HOME/.config/dunst/themes/$1 $HOME/.config/dunst/dunstrc

# reload dunst
dunstctl reload

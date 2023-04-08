#!/bin/sh

picom -b &
nm-applet &
volumeicon &
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --rate 144.00 --output HDMI-A-1 --mode 1920x1080 --rate 60.00 --right-of DisplayPort-0

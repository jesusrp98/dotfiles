#!/bin/bash

# Launches the specific polybar, depending on the device
killall -q polybar
if [ "$(hostname)" == "LINUX-PC" ]; then
    polybar -r pc -c ~/.dotfiles/polybar/config &
else
    polybar -r xps -c ~/.dotfiles/polybar/config &
fi

#!/bin/bash

if [ "$(hostname)" == "LINUX-PC" ]; then
    exec --no-startup-id sudo colctl -m solidall -c 255,255,255 -c0 233,30,99 -c1 233,30,99 -c2 233,30,99 -c3 233,30,99 -c4 233,30,9 -c5 233,30,99 -c6 233,30,99 -c7 233,30,99 -ps 70
    exec --no-startup-id xrandr --output HDMI-1 --mode 1920x1080 --pos 0x184 --rotate normal --output DP-3 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-2 --off --output DP-1 --off
    i3-msg 'workspace 2; append_layout ~/dotfiles/i3/workspace2.json'
    telegram-desktop
    corebird
    spotify
else
    blueman-applet
fi

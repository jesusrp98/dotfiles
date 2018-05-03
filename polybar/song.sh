#!/bin/bash

# get music status
player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    # metadata="$(playerctl metadata artist) · $(playerctl metadata title)"
    metadata="$(playerctl metadata title)"
fi

# print the info to bar
if [[ $player_status = "Playing" ]]; then
    echo "%{F#FFFFFF}$metadata"
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#9E9E9E}$metadata"
else
    echo "%{F#9E9E9E}NO MUSIC"
fi

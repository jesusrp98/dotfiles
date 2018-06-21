#!/bin/bash

# Get music status
player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata title)"
fi

# Cut the first 32 chars
if [ $(echo $metadata | wc -c) -gt 32 ]; then
    metadata=$(echo $metadata | cut -c1-32)
    metadata=$(echo $metadata...)
fi

# Print the info to bar
if [[ $player_status = "Playing" ]]; then
    echo "%{F#FFFFFF}$metadata"
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#9E9E9E}$metadata"
else
    echo "%{F#9E9E9E}NO MUSIC"
fi

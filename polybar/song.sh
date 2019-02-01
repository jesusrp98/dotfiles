#!/bin/bash

# Get song info
STATUS=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    SONG="$(playerctl metadata title)"
fi

# Cut the first 32 chars
if [ $(echo $SONG | wc -c) -gt 32 ]; then
    SONG=$(echo $SONG | cut -c1-32)
    SONG=$(echo $SONG...)
fi

# Print the info to bar
if [[ $STATUS = "Playing" ]]; then
    echo "%{F#FFFFFF}$SONG"
elif [[ $STATUS = "Paused" ]]; then
    echo "%{F#9E9E9E}$SONG"
else
    echo "%{F#9E9E9E}NO MUSIC"
fi

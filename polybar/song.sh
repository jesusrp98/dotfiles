#!/bin/bash

# Get song info
STATUS=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    SONG=$(echo "$(playerctl metadata title)" | sed -r 's/^(.+) - .+/\1/' | sed -r 's/^(.+) \(.+\)/\1/' | sed -r 's/^(.+) \[.+\]/\1/')
fi

# Cut the first 32 chars
if [ $(echo $SONG | wc -c) -gt 32 ]; then
    SONG=$(echo $SONG | cut -c1-32)
    SONG=$(echo $SONG...)
fi

# Print the info to bar
if [[ $STATUS = "Playing" ]]; then
    echo "%{F#E1E7EA}$SONG"
elif [[ $STATUS = "Paused" ]]; then
    echo "%{F#9CA4A8}$SONG"
else
    echo "%{F#9CA4A8}NO MUSIC"
fi

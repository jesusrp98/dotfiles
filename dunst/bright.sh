#!/bin/bash

# Changes brightness
if [ "$1" == "down" ]; then
    light -U 5
elif [ "$1" == "up" ]; then
    light -A 5
else
    echo "Expecting argument: {up, down}"
    exit 2
fi

# Gets the brightness label
LABEL=$(light -G | cut -d '.' -f 1)

# Shows notification with brightness label
VAR=$(cat ~/.dotfiles/dunst/.brightness)
if [ $VAR -gt 0 ]; then
    dunstify -p -r $VAR "BRIGHTNESS SET TO $LABEL%" > ~/.dotfiles/dunst/.brightness -u low
else
    dunstify -p "BRIGHTNESS SET TO $LABEL%" > ~/.dotfiles/dunst/.brightness -u low
fi

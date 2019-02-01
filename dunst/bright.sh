#!/bin/bash

# Changes brightness by 5
if [ "$1" == "down" ]; then
    light -U 5
elif [ "$1" == "up" ]; then
    light -A 5
else
    echo "Expecting argument: {up, down}"
    exit 2
fi

# Gets the brightness level
LEVEL=$(light -G | cut -d '.' -f 1)

# Shows notification with brightness level
FILE=$(cat ~/.dotfiles/dunst/.brightness)
if [ $FILE -gt 0 ]; then
    dunstify -p -r $FILE "BRIGHTNESS SET TO $LEVEL%" > ~/.dotfiles/dunst/.brightness -u low
else
    dunstify -p "BRIGHTNESS SET TO $LEVEL%" > ~/.dotfiles/dunst/.brightness -u low
fi

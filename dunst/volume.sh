#!/bin/bash

# Changes volume & gets the volume level
if [ "$1" == "down" ]; then
    amixer -D pulse sset Master 1%-
    LEVEL=$(amixer get Master | grep Left | grep % | sed -re 's/^.+\[([0-9]{1,}%)\].+$/\1/')
elif [ "$1" == "up" ]; then
    amixer -D pulse sset Master 1%+
    LEVEL=$(amixer get Master | grep Left | grep % | sed -re 's/^.+\[([0-9]{1,}%)\].+$/\1/')
elif [ "$1" == "mute" ]; then
    amixer -D pulse set Master 1+ toggle
    LEVEL=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
    if [ "$LEVEL" == "on" ]; then
        LEVEL=$(amixer get Master | grep Left | grep % | sed -re 's/^.+\[([0-9]{1,}%)\].+$/\1/')
    else
       LEVEL="MUTED" 
    fi
else
    echo "Expecting argument: {up, down, mute}"
    exit 2
fi

# Shows notification with volume level
FILE=$(cat ~/.dotfiles/dunst/.volume)
if [ $FILE -gt "0" ]; then
    dunstify -p -r $FILE "MASTER VOLUME $LEVEL" > ~/.dotfiles/dunst/.volume -u low
else
    dunstify -p "MASTER VOLUME $LEVEL" > ~/.dotfiles/dunst/.volume -u low
fi

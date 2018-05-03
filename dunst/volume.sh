#!/bin/bash

# Changes volume & gets the volume label
if [ "$1" == "down" ]; then
    amixer -D pulse sset Master 1%-
    VOLUME=$(amixer get Master | grep Left | grep % | sed -re 's/^.+\[([0-9]{1,}%)\].+$/\1/')
elif [ "$1" == "up" ]; then
    amixer -D pulse sset Master 1%+
    VOLUME=$(amixer get Master | grep Left | grep % | sed -re 's/^.+\[([0-9]{1,}%)\].+$/\1/')
elif [ "$1" == "mute" ]; then
    amixer -D pulse set Master 1+ toggle
    VOLUME=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
    if [ "$VOLUME" == "on" ]; then
        VOLUME=$(amixer get Master | grep Left | grep % | sed -re 's/^.+\[([0-9]{1,}%)\].+$/\1/')
    else
       VOLUME="MUTED" 
    fi
else
    echo "Expecting argument: {up, down, mute}"
    exit 2
fi

# Shows notification with volume label
VAR=$(cat $HOME/.config/dunst/.volume)
if [ $VAR -gt "0" ]; then
    dunstify -p -r $VAR "MASTER VOLUME $VOLUME" > ~/dotfiles/dunst/.volume -u low
else
    dunstify -p "MASTER VOLUME $VOLUME" > ~/dotfiles/dunst/.volume -u low
fi

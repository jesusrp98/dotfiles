#!/bin/bash

if [[ $(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g') == on ]]; then
    echo "VOLUME %{F#9E9E9E}$(amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d ']' -f 1)"
else
    echo "%{F#9E9E9E}MUTED"
fi

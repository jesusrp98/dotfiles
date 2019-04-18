#!/bin/bash

# Toggles nm-applet on Polybar
ps cax | grep nm-applet | grep -o '^[ ]*[0-9]*' > /dev/null
if [ $? -eq 1 ]; then
    nm-applet&
else
    pkill nm-applet
fi

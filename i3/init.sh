#!/bin/bash

# Specific LINUX PC stuff
if [ "$(hostname)" == "LINUX-PC" ]; then
    xrandr --output HDMI-1 --mode 1920x1080 --pos 0x184 --rotate normal --output DP-3 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-2 --off --output DP-1 --off
    i3-msg 'workspace 1; append_layout ~/.dotfiles/i3/workspace1.json'
    i3-msg 'workspace 2; append_layout ~/.dotfiles/i3/workspace2.json'
    telegram-desktop&
fi

# Common commands for both PC & XPS
firefox&
redshift -c ~/.dotfiles/redshift/redshift.conf&
compton --config ~/.dotfiles/compton/compton.conf&
hsetroot -solid "#151B1E"&
~/.dotfiles/dunst/launch.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)

# Restart i3 after boot
i3-msg restart

#!/bin/bash

# ===============
#  INITIAL SETUP
# MADE BY CHECHU!
# ===============

# Clear the screen
clear

# Variables for git user account
HOSTNAME=$(cat /etc/hostname)
EMAIL=jesusrope98@outlook.com
USER=jesusrp98

# Add git info to local PC
echo -e "=======ADDING GIT DATA=======\n"
echo -e "\tUsername: $HOSTNAME"
echo -e "\tEmail: $EMAIL"
git config --global user.name $HOSTNAME
git config --global user.email $EMAIL
echo -e "\tUser info added!"

# Add public RSA key to GitHub
echo -e "\n=======CREATING SSH KEY & ADDING IT TO GITHUB======\n"
ssh-keygen -qf "$HOME/.ssh/id_rsa" -t rsa -C "$EMAIL" -N ''
echo -n "Enter GitHub token: "
read TOKEN
curl -H "Authorization: token $TOKEN" -u "$USER" --data "{\"title\":\""$HOSTNAME"\",\"key\":\"`cat $HOME/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys
echo -e "\tSSH key added to GitHub!"

# Clone dotfiles repo from GitHub
echo -e "\n=======CLOING DOTFILES REPO=======\n"
mkdir $HOME/.dotfiles
git clone git@github.com:jesusrp98/dotfiles.git $HOME/.dotfiles
echo -e "\tRepo cloned!"

# Install packages from pacman
echo -e "\n=======INSTALL REGULAR PACKAGES=======\n"
sudo pacman -S --noconfirm i3-gaps adapta-gtk-theme rofi ranger vim compton dunst zsh telegram-desktop lxappearance redshift polkit-gnome gnome-keyring lightdm-gtk-greeter i3lock blueman playerctl pacaur lightdm-gtk-greeter python-pip vlc termite hsetroot light etcher code
echo -e "\tPacman packages installed!"

# Install packages from AUR
echo -e "\n=======INSTALL AUR PACKAGES=======\n"
pacaur -S --noconfirm --noedit polybar spotify oh-my-zsh-git
echo -e "\tAUR packages installed!"

# Change default shell
echo -e "\n=======CHANGING DEFAULT SHELL=======\n"
chsh -s /bin/zsh
echo -e "\tShell changed!"

# Create links
echo -e "\n=======CREATING SOFT LINKS=======\n"
mkdir $HOME/.fonts
mkdir $HOME/.config/termite
cp $HOME/.dotfiles/fonts/* $HOME/.fonts
ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/termite/config $HOME/.config/termite/config
rm $HOME/.config/i3/config
ln -s $HOME/.dotfiles/i3/config $HOME/.config/i3/config
echo -e "\tLinks created!"

# Update lightdm config file
echo -e "\n=======CHANGING LIGHTDM CONFIG=======\n"
sudo sed -i 's/^greeter-session=.*/greeter-session=lightdm-gtk-greeter/' /etc/lightdm/lightdm.conf
echo -e "\tLightdm config changed!"

# Update grub2 config file
echo -e "\n=======CHANGING GRUB CONFIG=======\n"
sudo sed -i '/^GRUB_TIMEOUT=.*/c\GRUB_TIMEOUT=0' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo -e "\tGrub2 config changed!"

# TODO improve
# Update sudo config file
# echo -e "\n=======CHANGING SUDO CONFIG=======\n"
# sudo echo "jesus ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer
# echo -e "\tSudo config changed!"

#!/bin/bash

# Print commands and exit on errors
set -xe

apt-get update

useradd -m -d /home/selector -s /bin/bash selector
echo "selector:selector" | chpasswd
echo "selector ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99_selector
chmod 440 /etc/sudoers.d/99_selector
usermod -aG vboxsf selector

# Disable screensaver
apt-get -y remove light-locker

# Automatically log into the P4 user
cat << EOF | tee -a /etc/lightdm/lightdm.conf.d/10-lightdm.conf
[SeatDefaults]
autologin-user=selector
autologin-user-timeout=0
user-session=Lubuntu
EOF

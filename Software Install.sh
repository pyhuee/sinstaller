#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit
   else 
   echo "Welcome to the software installer. "
   sleep 2
   echo "Step 1: Downloading dependencies"
   apt update
   apt install curl -y
   apt install git -y
   wget -qO - https://mirror.mwt.me/ghd/gpgkey
   tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null
   sh -c 'echo "deb [arch=amd64] https://mirror.mwt.me/ghd/deb/ any main" > /etc/apt/sources.list.d/packagecloud-shiftkey-desktop.list'
   apt update
   sleep 2
   echo "Step 2: Downloading files"
   curl --location --output discord.deb "https://discord.com/api/download?platform=linux&format=deb"
   curl --location --output mullvad.deb "https://mullvad.net/download/app/deb/latest/"
   curl --location --output steam.deb  "https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb"
   curl --output minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb"
   curl --output msedge.deb "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_101.0.1210.53-1_amd64.deb"
   add-apt-repository ppa:lutris-team/lutris -y
   apt update
  sleep 2
  echo ""Step 3: Moving Files""
  mv discord.deb $HOME
  mv mullvad.deb $HOME
  mv steam.deb $HOME
  mv minecraft.deb $HOME
  mv msedge.deb $HOME
  sleep 2
  echo "Step 4: Installing files"
  snap install spotify
  snap install telegram-desktop
  snap install code --classic
  apt install github-desktop -y
  apt install lutris -y
  apt install '$HOME\discord.deb' -y
  apt install '$HOME\mullvad.deb' -y
  apt install '$HOME\steam.deb' -y
  apt install '$HOME\minecraft.deb' -y
  apt install '$HOME\msedge.deb' -y
  sleep 10
  echo "Step 5: Removing and Rebooting"
  rm $HOME\discord.deb
  rm $HOME\mullvad.deb
  rm $HOME\steam.deb
  rm $HOME\minecraft.deb
  rm $HOME\msedge.deb
  reboot
fi
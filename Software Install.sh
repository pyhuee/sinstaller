#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit
   else 
   echo "Welcome to the unattended software installer. "
   sleep 2
   echo "Step 1: Downloading dependencies"
   apt install curl -y
   sleep 2
   echo "Step 2: Downloading files"
   curl --location --output discord.deb https://discord.com/api/download?platform=linux&format=deb
   curl --location --output mullvad.deb https://mullvad.net/download/app/deb/latest/
   curl --location --output steam.deb  https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
   curl --output minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
   curl --output msedge.deb https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_101.0.1210.53-1_amd64.deb
   add-apt-repository ppa:lutris-team/lutris
   apt update
  sleep 2
  echo "Step 3: Installing files"
  snap install spotify
  snap install telegram-desktop
  snap install code --classic
  apt install lutris -y
  apt install discord.deb -y
  apt install mullvad.deb -y
  apt install steam.deb -y
  apt install minecraft.deb -y
  apt install msedge.deb -y
  sleep 10
  echo "Step 4: Removing and Rebooting"
  rm discord.deb
  rm mullvad.deb
  rm steam.deb
  rm minecraft.deb
  rm msedge.deb
  
fi
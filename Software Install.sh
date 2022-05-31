#!/bin/bash
# Welcome to the installer! Basically, I don't care what you do to it, go ahead, release it, sell my crappy coding, I don't really care
# 
if [[ $EUID -ne 0 ]]; then # checks if ran as root
   echo "This script must be run as root" #if the script isn't ran as root (sudo), it will say "This script must be ran as root"
   exit # closes out the script and allows you to type again in the terminal
   else # if ran as root, code below will run
   echo "Welcome to the software installer. " # says Welcome to the software installer
   sleep 2 #waits 2 seconds
   echo "Step 1: Downloading dependencies"
   apt update # updates package lists
   apt install curl -y #installs cURL (dowloading tool)
   apt install git -y #installs git (downloads things from github/other git providers.)
   wget -qO - https://mirror.mwt.me/ghd/gpgkey | sudo tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null # some dark magic code for github desktop
   sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftkey-desktop.list' # some dark magic code for github desktop
   apt update # updates package lists
   sleep 2 #waits 2 seconds
   echo "Step 2: Downloading files" # says Step 2: Downloading Files
   curl --location --output discord.deb "https://discord.com/api/download?platform=linux&format=deb" #cURL goes to the URL, follows the redirect, download's the file then renames it to discord.deb
   curl --location --output mullvad.deb "https://mullvad.net/download/app/deb/latest/" #cURL goes to the URL, follows the redirect, download's the file then renames it to mullvad.deb
   curl --location --output steam.deb  "https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb" #cURL goes to the URL, follows the redirect, download's the file then renames it to steam.deb
   curl --output minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb" #cURL goes to the URL, download's the file then renames it to minecraft.deb
   curl --output msedge.deb "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_101.0.1210.53-1_amd64.deb" #cURL goes to the URL, downloads the file, then renames it to msedge.deb
   add-apt-repository ppa:lutris-team/lutris -y # adds the repository for Lutris
   apt update # updates the package lists
  sleep 2 #waits 2 seconds
  echo "Step 3: Moving Files"
  mv discord.deb $HOME #moves the files to the Home directory
  mv mullvad.deb $HOME #moves the files to the Home directory
  mv steam.deb $HOME #moves the files to the Home directory
  mv minecraft.deb $HOME #moves the files to the Home directory
  mv msedge.deb $HOME #moves the files to the Home directory
  sleep 2 #waits 2 seconds
  echo "Step 4: Installing files" # says Step 4: Installing FIles
  snap install spotify # installs Spotify
  snap install telegram-desktop # installs Telegram
  snap install code --classic # Installs VS Code
  apt install github-desktop -qq -y # Installs Github Desktop
  apt install lutris -qq -y # Installs Lutris
  apt install ./discord.deb -qq -y # Installs Discord
  apt install ./mullvad.deb -qq -y # Installs Mullvad
  apt install ./steam.deb -qq -y # Installs Steam
  apt install ./minecraft.deb -qq -y # Installs Minecraft
  apt install ./msedge.deb -y -qq # Installs Microsoft Edge
  sleep 10 #waits 10 seconds
  echo "Step 5: Removing and Rebooting"
  rm ./discord.deb # deletes no longer needed  files 
  rm ./mullvad.deb # deletes no longer needed  files 
  rm ./steam.deb # deletes no longer needed  files 
  rm ./minecraft.deb # deletes no longer needed  files 
  rm ./msedge.deb # deletes no longer needed  files 
  reboot
fi

#!/bin/bash
# Hi there, uh, rewriting the installer. I don't want to ruin the regular one, and I'm too lazy to make a new branch on GitHub. So goddammit let me write in peace on this stupid file#
# Attempts to install all the programs, but maybe functional. #

if [ "$EUID" -ne 0 ] # Stolen from https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script, because I suck at coding
  then echo "Please run as root"
  exit
  else 
    echo "Welcome to my Beta Software Installer (doesn't install beta software)"
    sleep 5
    echo "This should install the following programs
    1. Discord
    2. Microsoft Edge
    3. Mullvad VPN
    4. Steam
    5, Minecraft
    6. Lutris
    7. Telegram
    8. Spotify "
    sleep 15
    echo "Installing Needed Programs"
    sleep 2
    apt install git -y -q
    echo "Installed Git"
    sleep 2
    apt install curl -y -qq
    echo "Installed cURL"
    sleep 2
    echo "Adding and dealing with keys and Repos"
    wget -qO - https://mirror.mwt.me/ghd/gpgkey | sudo tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null
    sudo sh -c 'echo "deb [arch=amd64] https://mirror.mwt.me/ghd/deb/ any main" > /etc/apt/sources.list.d/packagecloud-shiftkey-desktop.list'
    add-apt-repository ppa:appimagelauncher-team/stable -y
    add-apt-repository ppa:lutris-team/lutris
    sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/edge/ stable main" >> /etc/apt/sources.list.d/microsoft_edge.list'
    apt update  
    sleep 2
    echo "Downloading .deb Files"
    curl --location --output discord.deb "https://discord.com/api/download?platform=linux&format=deb"
    curl --location --output steam.deb "https://cdn.akamai.steamstatic.com/client/installer/steam.deb"
    curl --location --output mullvad.deb "https://mullvad.net/download/app/deb/latest/"
    curl --location --output minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb"
    curl --location --output chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    sleep 2
    echo "Installing/Downloading Software"
    apt install appimagelauncher -y -qq
    echo "Installed App Image Launcher"
    apt install github-desktop -y -qq
    echo "Installed Github Desktop"
    apt install lutris -y -qq
    echo "Installed Lutris"
    apt install discord.deb
    echo "Installed Discord"
    apt install steam.deb
    echo "Installed Steam"
    apt install mullvad.deb
    echo "Installed Mullvad"
    apt install minecraft.deb 
    echo "Installed Minecraft Launcher"
    apt install chrome.deb
    echo "Installed Google Chrome"
  exit
fi
#!/bin/bash
# Hi there, uh, rewriting the installer. I don't want to ruin the regular one, and I'm too lazy to make a new branch on GitHub. So goddammit let me write in peace on this stupid file#
# Attempts to install all the programs, but maybe functional. #

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
  else 
  echo "Hello World"
  exit
fi
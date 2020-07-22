#!/bin/bash

#Script to update and upgrade the system, and once complete remove all un-neccessary files

#Set Colour Variables
GREEN="\033[1;32m"
YELLOW='\e[0;33m'
RED="\033[1;31m"
RESET='\e[0m'


#Check to see if script is running as root, if not exit and print message - "This script must be run as root"
if [[ $EUID -ne 0 ]]; then
    echo -e $RED
   	echo "This script must be run as root" 
    echo -e $RESET
   	exit 1

fi

#Update system packages
apt-get update
echo -e $YELLOW
echo 'APT update finished...'
echo -e $RESET


#Update repositories
apt-get upgrade
echo -e $YELLOW
echo 'APT upgrade finished...'
echo -e $RESET


#Upgrade the distro
apt-get dist-upgrade
echo -e $YELLOW
echo 'APT distributive upgrade finished...'
echo -e $RESET

#Remove all un required files
apt-get autoremove
echo -e $YELLOW
echo 'APT auto remove finished...'
echo -e $RESET


#Check to see if resart is required
if [ -f /var/run/reboot-required ]; then
    echo -e $RED
    echo 'Reboot required'
    echo -e $RESET
fi

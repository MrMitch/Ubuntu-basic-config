#!/bin/bash

# This is a script typically made to be run after a fresh install of (X)Ubuntu to get most of the softwares listed in this reposiroty.
# It adds the necessary repositories and sources to the system so that all packages can be installed with no trouble.
# Eventually, it installs the softwares using the 'apt-get' command.

# VLC
apt-add-repository ppa:videolan/stable-daily
# Handbrake
apt-add-repository ppa:stebbins/handbrake-releases
# Oracle-jdk7-installer
apt-add-repository ppa:webupd8team/java
# 0 A.D.
apt-add-repository ppa:wfg/0ad
#UbuntuTweak
apt-add-repository ppa:tualatrix/ppa
#SublimeText 2
apt-add-repository ppa:webupd8team/sublime-text-2
#Gradiator
apt-get-repository ppa:cooperjona/gradiator

# Direct entries in the /etc/apt/sources.list file
echo "# Custom" >> /etc/apt/sources.list

# Virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
# Hedgewars
echo "deb http://archive.getdeb.net/ubuntu precise-getdeb games" >> /etc/apt/sources.list

apt-get update

apt-get upgrade

apt-get autoremove

apt-get install -y vim htop git apache2 phpmyadmin php5 mysql-server tilda kupfer conky-all compizconfig-settings-manager gparted oracle-java7-installer pdfshuffler qbittorrent filezilla gcolor2 gradiator virtualbox-4.1 hedgewars ubuntu-tweak sublime-text-dev

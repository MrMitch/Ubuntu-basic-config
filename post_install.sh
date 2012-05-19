#!/bin/bash

# This is a script typically made to be run after a fresh install of (X)Ubuntu to get most of the softwares listed in this reposiroty.
# It adds the necessary repositories and sources to the system so that all packages can be installed with no trouble.
# Eventually, it installs the softwares using the 'apt-get' command.

if [ `whoami` = "root" ]; then
	echo "Adding some PPAs..."
	echo ""

	# VLC
	apt-add-repository ppa:videolan/stable-daily
	# Handbrake
	#apt-add-repository ppa:stebbins/handbrake-releases
	# Oracle-jdk7-installer
	apt-add-repository ppa:webupd8team/java
	# 0 A.D.
	apt-add-repository ppa:wfg/0ad
	# UbuntuTweak
	apt-add-repository ppa:tualatrix/ppa
	# SublimeText 2
	apt-add-repository ppa:webupd8team/sublime-text-2
	# Gradiator
	apt-get-repository ppa:cooperjona/gradiator
	# Pidgin
	apt-add-repository ppa:pidgin-developers/ppa
	# MovGrab
	add-apt-repository ppa:nilarimogard/webupd8

	# Direct entries in the /etc/apt/sources.list file
	echo "# Custom" >> /etc/apt/sources.list

	# Virtualbox
	echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list
	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
	# Hedgewars
	#echo "deb http://archive.getdeb.net/ubuntu precise-getdeb games" >> /etc/apt/sources.list
	# Google-Chrome
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
	# MongoDB
	apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
	echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list

	apt-get update

	echo "Performing package update"
	echo ""
	apt-get dist-upgrade

	echo "Removing unused packages"
	echo ""
	apt-get autoremove --purge

	# Remove useless packages
	apt-get autoremove --purge mahjongg gnomine aisleriot gnome-sudoku empathy* totem onboard gnome-orca 

	echo "Installing yummi stuff"
	echo ""
	apt-get install -y vim vlc movgrab htop git git-svn apache2 phpmyadmin php5 mysql-server php5-xdebug tilda\
	kupfer conky-all compizconfig-settings-manager gparted oracle-java7-installer pdfshuffler qbittorrent\
	filezilla gcolor2 virtualbox-4.1 ubuntu-tweak sublime-text-2 google-chrome-stable pidgin unrar tree

	apt-get autoremove --purge

	update-grub

	echo "Configuring Apache"
	echo ""
	# Apache config
	a2enmod rewrite
	echo "ServerName localhost" >> /etc/apache2/httpd.conf
	rm -rf /var/www
	ln -s /home/mickael/www /var/www

	service apache2 restart

	echo ""
	echo "Done!"
else
    echo "This script must be executed as root!"
fi

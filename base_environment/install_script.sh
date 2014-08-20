#!/bin/bash

#
# Sandbox environment setup script
# 	- Written for a Ubuntu 14.04 server
#

CONTINUE="false"
if [ -e /etc/lsb-release ]; then
	DISTRO=`grep DISTRIB_ID /etc/lsb-release`
	RELEASE=`grep DISTRIB_RELEASE /etc/lsb-release`
	echo "Detected: $DISTRO $RELEASE"
	if [ "$DISTRO" = "DISTRIB_ID=Ubuntu" ]; then
		echo "Script expects Ubuntu 14.04, found $RELEASE"
		CONTINUE="true"
		if [ "$RELEASE" = "DISTRIB_RELEASE=14.04" ]; then
			echo "Continuing..."
		else
			echo "Continuing anyway..."
		fi
	fi
fi
echo $CONTINUE
if [ "$CONTINUE" = "false" ]; then
	echo "Script expects a Ubuntu 14.04 environment"
	echo "Exiting without making any changes"
	exit 1
fi


# initial build tools
sudo apt-get install git build-essential cmake

# general utilities and libraries
sudo apt-get install tree

# build dependencies for awesome wm
sudo apt-get build-dep awesome
sudo apt-get install libxcb-cursor-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-dev lua-lgi-dev
sudo apt-get build-dep lua-lgi-dev

# x environment
sudo apt-get install xorg xserver-xorg xserver-xorg-video-vesa xinit
sudo apt-get install dbus dbus-x11

#
# Download my sandbox_env repo and set up the usual environment
#

cd ~/downloads/git_clones/
git clone http://github.com/shermanyo/sandbox_env

cd sandbox_env/



cd


#
# Download awesome and build from source
#

mkdir -p ~/downloads/git_clones/awesome
cd ~/downloads/git_clones/
git clone git://git.naquadah.org/awesome.git

cd awesome/
make
sudo make install

# create user config directories
mkdir -p ~/.config/awesome/themes/default

# copy example config
cp awesomerc.lua.in ~/.config/awesome/rc.lua 

# copy example theme - default
find . -name theme.lua |grep default |xargs cp -t ~/.config/awesome/themes/default/
sed -i 's/@AWESOME_THEMES_PATH@/~\/.config\/awesome\/themes/g ~/.config/awesome/rc.lua'



cd


#
# script finished successfully
#

echo
echo "script finished successfully"
echo
echo "Done."
echo


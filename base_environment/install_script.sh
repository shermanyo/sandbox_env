#!/bin/bash

USAGE="Usage: install_script.sh [-desktop]"


#
# Process command line args
#

INSTALL_SET="base"
if [ "$1" = "-h" ]; then
    echo "$USAGE"
	exit 1
elif [ "$1" = "--help" ]; then
    echo "$USAGE"
	exit 1
elif [ "$1" = "-desktop" ]; then
	INSTALL_SET="desktop"
fi




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
			echo "Ubuntu, so continuing anyway..."
		fi
	fi
fi

if [ "$CONTINUE" = "false" ]; then
	echo "Script expects a standard Ubuntu 14.04 environment"
	echo "Exiting without making any changes"
	exit 1
fi







#
# Download my sandbox_env repo and set up the usual environment
#

mkdir ~/git_clones/
cd ~/git_clones/
git clone http://github.com/shermanyo/sandbox_env

echo 'export SANDBOX_ENV_ROOT="~/downloads/git_clones/sandbox_env"' >> ~/.profile
source ~/.profile




#
# install the environment components
#

# Load sandbox aliases
source $SANDBOX_ENV_ROOT/shell/sandbox_aliases




#
# Setup my default sandbox environment:
#   - shell extensions and config
#   - vim settings and plugins
#   - 
#
# If run with -desktop :
#   - awesome window manager
#


#
# Install base packages
#

# initial build tools
sudo apt-get install git build-essential cmake

# general utilities and libraries
sudo apt-get install rxvt-unicode tree 


#
# use sbenv_install alias to setup my other packages
#

sbenv_install shell
sbenv_install vim

# install desktop packages
if [ "$INSTALL_SET" = "desktop" ]; then

	sbenv_install awesome

fi



sbenv_setup shell
sbenv_setup vim
sbenv_setup perl
sbenv_setup awesome




#
# script finished successfully
#

echo
echo "script finished successfully"
echo
echo "Done."
echo


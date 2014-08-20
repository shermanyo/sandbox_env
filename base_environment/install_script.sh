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
			echo "Ubuntu, so continuing anyway..."
		fi
	fi
fi

if [ "$CONTINUE" = "false" ]; then
	echo "Script expects a standard Ubuntu 14.04 environment"
	echo "Exiting without making any changes"
	exit 1
fi


# initial build tools
sudo apt-get install git build-essential cmake

# general utilities and libraries
sudo apt-get install tree

#
# Download my sandbox_env repo and set up the usual environment
#

cd ~/downloads/git_clones/
git clone http://github.com/shermanyo/sandbox_env

export SANDBOX_ENV_ROOT="~/downloads/git_clones/sandbox_env"
echo 'export SANDBOX_ENV_ROOT="~/downloads/git_clones/sandbox_env"' >> ~/.profile

cd $SANDBOX_ENV_ROOT


#
# script finished successfully
#

echo
echo "script finished successfully"
echo
echo "Done."
echo


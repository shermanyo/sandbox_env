#!/bin/bash

# initial build tools
sudo apt-get install git build-essential cmake

# build dependencies for awesome wm
sudo apt-get build-dep awesome
sudo apt-get install libxcb-cursor-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-dev lua-lgi-dev
sudo apt-get build-dep lua-lgi-dev

# x environment
sudo apt-get install xorg xserver-xorg xserver-xorg-video-vesa xinit
sudo apt-get install dbus dbus-x11

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


#
# Download my sandbox_env repo and set up the usual environment
#

cd ~/downloads/git_clones/
git clone http://github.com/shermanyo/sandbox_env

cd sandbox_env/



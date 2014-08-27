#!/bin/bash


# keep track of the current directory
pushd .


#
# Setup prerequisite libs and packages
#

# build dependencies for awesome wm
sudo apt-get build-dep awesome
sudo apt-get install libxcb-cursor-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-dev lua-lgi-dev
sudo apt-get build-dep lua-lgi-dev
sudo apt-get install dbus dbus-x11

# x environment
sudo apt-get install xorg xserver-xorg xserver-xorg-video-vesa xinit


#
# Download awesome and build from source
#

# download the latest source to a new directory
rm -rf ~/downloads/git_clones/awesome
mkdir -p ~/downloads/git_clones/awesome
cd ~/downloads/git_clones/
git clone git://git.naquadah.org/awesome.git
cd awesome/

# build and install awesome
make
sudo make install

# create user config directories
mkdir -p ~/.config/awesome/themes/default

# copy example config
cp awesomerc.lua.in ~/.config/awesome/rc.lua 


# copy example theme - default
find . -name theme.lua |grep default |xargs cp -t ~/.config/awesome/themes/default/
# set the theme path in the awesome config
sed -i 's/@AWESOME_THEMES_PATH@/~\/.config\/awesome\/themes/g' ~/.config/awesome/rc.lua

# create a new xinitrc that just starts awesome
mv ~/.xinitrc ~/.xinitrc.OLD
echo 'exec awesome' > ~/.xinitrc



# return to the initial directory
popd



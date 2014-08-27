#!/bin/bash


# keep track of the current directory
pushd .


#
# Setup prerequisite libs and packages
#

# build dependencies for awesome wm
sudo apt-get -y build-dep awesome
sudo apt-get -y install libxcb-cursor-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-dev lua-lgi-dev
sudo apt-get -y build-dep lua-lgi-dev
sudo apt-get -y install dbus dbus-x11

# x environment
sudo apt-get -y install xorg xserver-xorg xserver-xorg-video-all xinit

# desktop apps
sudo apt-get -y install firefox libreoffice-writer libreoffice-impress


#
# Download awesome and build from source
#

# download the latest source to a new directory
rm -rf $GIT_CLONES_ROOT/awesome
mkdir -p $GIT_CLONES_ROOT/awesome
cd $GIT_CLONES_ROOT
git clone git://git.naquadah.org/awesome.git
cd awesome/

# build and install awesome
make
sudo make install

# create user config directories
rm -rf ~/.config/awesome_OLD
mv ~/.config/awesome/ ~/.config/awesome_OLD
mkdir -p ~/.config/awesome/themes/default

# copy example config
cp awesomerc.lua.in ~/.config/awesome/rc.lua 


# copy example theme - default
find . -name theme.lua |grep default |xargs cp -t ~/.config/awesome/themes/default/
# set the theme path in the awesome config
sed -i 's/@AWESOME_THEMES_PATH@/~\/.config\/awesome\/themes/g' ~/.config/awesome/rc.lua
sed -i 's/xterm/rxvt-unicode/g' ~/.config/awesome/rc.lua

# create a new xinitrc that just starts awesome
mv ~/.xinitrc ~/.xinitrc.OLD
echo 'exec awesome' > ~/.xinitrc



# return to the initial directory
popd



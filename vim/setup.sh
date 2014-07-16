#!/bin/bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mv ~/.vimrc ~/.vimrc.ORIG
cp ./vimrc ~/.vimrc

echo "Open vim and run:"
echo ":PluginInstall!"

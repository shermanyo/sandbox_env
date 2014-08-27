#!/bin/bash

sudo apt-get install ctags

mv ~/.vimrc ~/.vimrc.ORIG
mv ~/.vim/ ~/.vimORIG
cp ./vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall


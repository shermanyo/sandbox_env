#!/bin/bash

sudo apt-get -y install ctags

mv ~/.vimrc ~/.vimrc.ORIG
mv ~/.vim/ ~/.vimORIG
cp $SANDBOX_ENV_ROOT/vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall


#!/bin/bash

sudo apt-get -y install perlbrew

perlbrew init
echo "source ~/perl5/perlbrew/etc/bashrc"  >> ~/.profile 
source ~/perl5/perlbrew/etc/bashrc

perlbrew install perl-5.18.2
perlbrew use perl-5.18.2

perlbrew install-cpanm
perlbrew install-patchperl

cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

cpanm JSON::PP



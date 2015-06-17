#!/bin/bash -ev

sudo apt-get update -qq
sudo apt-get install -y git

# Prompt user to add ssh-key to github account. This is needed for code-base cloning

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    cat /dev/zero | ssh-keygen -q -N ""

    echo "Add this ssh key to your github account!"
    cat ~/.ssh/id_rsa.pub
    echo "Press [Enter] to continue..." && read
fi


mkdir $HOME/code
cd $HOME/code

git clone git@github.com:rranelli/linuxsetup.git
cd linuxsetup

make
make all

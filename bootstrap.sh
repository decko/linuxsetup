#!/bin/bash -ev

sudo apt-add-repository ppa:ansible/ansible --yes
sudo apt-get update -qq

sudo apt-get install -y git ansible

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    cat /dev/zero | ssh-keygen -q -N ""

    echo "Add this ssh key to your github account!"
    cat ~/.ssh/id_rsa.pub
    echo "Press [Enter] to continue..." && read
fi

mkdir -p ~/code/linuxsetup && cd ~/code/linuxsetup
git clone git@github.com:rranelli/linuxsetup.git .

ansible-playbook --ask-become-pass \
                 --ask-vault-pass \
                 -i desktop/ansible/hosts \
                 desktop/ansible/desktop.yml
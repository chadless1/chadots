#!/usr/bin/env bash
#
# BY: chadless1
#
# Description:
# install additional packages
# install configs

# check if packages can be installed
clear
echo
echo "install packages needed for configs"
echo  "(y/n)"
read USER_INPUT
if [[ $USER_INPUT == y ]];
then 
        ## install packages ##
        sudo apt install htop neofetch cmatrix tmux lsd vim python3-venv python3-dev g++ stow ranger cmake curl unzip dialog fzf
else
        true
fi

clear
echo
echo you need to backup your .bashrc in order to stow
echo back up .bashrc
echo  "(y/n)"
read USER_INPUT
if [[ $USER_INPUT == y ]];
then 
        ## install packages ##
        mv ~/.bashrc ~/.bashrc.bk
else
        true
fi
#############################

## stow files ##
bash mystow.sh

echo
echo " Chadots have been deployed"
echo
echo " relaunch the terminal or source ~/.bashrc to load configs"
echo
echo " *some programs need additional steps for full features. see README"
echo

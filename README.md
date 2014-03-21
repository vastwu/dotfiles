dotfiles
========

my zsh &amp; vim config

## install vim74 on linux

we have to add a third-party PPA. Do this for a successful installation

    sudo add-apt-repository ppa:fcwu-tw/ppa
    sudo apt-get update
    sudo apt-get install vim

## install zsh

    sudo apt-get install zsh

## install oh-my-zsh

download

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

set zsh as default shell

    chsh -s /bin/zsh

## install vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

## install all vim plugin

    vim
    :BundleInstall

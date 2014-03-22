dotfiles
========

my zsh &amp; vim config

## BASE

### install vim74 on linux

we have to add a third-party PPA. Do this for a successful installation

    sudo add-apt-repository ppa:fcwu-tw/ppa
    sudo apt-get update
    sudo apt-get install vim

### install zsh

    sudo apt-get install zsh

### install oh-my-zsh

download

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

set zsh as default shell

    chsh -s /bin/zsh

### install vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

### install all vim plugin

    vim
    :BundleInstall

> all finished, have fun

## EXTENSION

### autojump

use `j dir` fast and auto jump to the path, the path must be visit before

    //linux
    sudo-apt install autojump

    //mac
    brew autojump

    //install by source
    git clone git://github.com/joelthelion/autojump.git
    cd autojump
    ./install.py

then restart shell

example:

* i visit path for `/home/vast/code/git/dotfiles` before
* now i am in `~/` dir
* i can input `j dot` to the currect path
* maybe same name dir name, i can use like that `j code dot`


### come command for my vim plugin
    
    <c-p>: open ctrlp file search
    <F2>: open nerdtree 

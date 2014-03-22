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
    sudo apt-get install autojump

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

### tmux

    sudo apt-get install tmux
    
[a helpful blog about how to use tmux](http://foocoder.com/blog/zhong-duan-huan-jing-zhi-tmux.html/)

all tmux command must press `<C-b>` first

when on shell, 

`tmux` create a tmux session
`tmux ls` display all session
`tmux attach [-t sessionname]` back to prev session or enter another session by sessionname
`tmux kill-session [-t sessionname]` kill session

#### session
    `?` display bind-key
    `d` deattch session
    `<c-z>` sleep session, `fg` wake up session
    `$` rename session

#### window

    `c` create new window
    `b` rename current window
    `&` close current window
    `w` display all windows number, change
    `f` window search

#### pane

    `s` split for create pane
    `v` vertical split for create pane
    `h,j,k,l` change pane like vim
    `x` close current pano (need confirm)





### come command for my vim plugin
    
    <c-p>: open ctrlp file search
    <F2>: open nerdtree 

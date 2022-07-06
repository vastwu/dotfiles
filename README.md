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

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


set zsh as default shell

    chsh -s /bin/zsh

### install vim-plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

https://github.com/junegunn/vim-plug

### install all vim plugin

    vim
    :PlugInstall

> all finished, have fun

## EXTENSION

### YouCompleteMe + tern

#### download plugins by vundle

add that in `.vimrc`
```
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
...
:setlocal omnifunc=tern#Complete
call tern#Enable()
:runtime after/ftplugin/javascript_tern.vim
```
run `BundleInstall`

> `youcompleteme` needs cmake for compile（sudo brew install CMake）

#### configure
* [http://blog.jobbole.com/58978/](http://blog.jobbole.com/58978/)
* [http://efe.baidu.com/blog/vim-javascript-completion/](http://efe.baidu.com/blog/vim-javascript-completion/)

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

* `?` display bind-key
* `d` deattch session
* `<c-z>` sleep session, `fg` wake up session
* `$` rename session

#### window

* `t` create new window
* `d` close current window
* `b` rename current window
* `w` display all windows number, change
* `f` window search

#### pane
* `c` close current pane
* `s` split for new pane
* `v` vertical split for new pane
* `h,j,k,l` select pane like vim

### Ag
A plugin for vim search like vimgrep [Ag on github](https://github.com/rking/ag.vim)

first must install [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) by brew

and load ag.vim by vundle

finilly can use :Ag [options] key-word [dir] in vim

it is fast than vimgrep

### slate

A app for mac, it can define some fast-key for some operate [slate on github](https://github.com/jigish/slate)

quick install

    cd /Applications && curl http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz | tar -xz

link `slate` to `~/.slate`

### some command for my vim plugin
    
    <c-p>: open ctrlp file search
    <F2>: open nerdtree 

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

### install rg

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep
```
到这里下载编译后的文件：https://github.com/BurntSushi/ripgrep/releases

### install nvm
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

## EXTENSION

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

#### plugins
* 安装
```bash
# 下载 tqm 到~/.tmux/plugins
# tqm是tmux插件管理工具
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 进入相应位置
cd ~/.tmux/plugins
# 下载插件
git clone https://github.com/tmux-plugins/tmux-resurrect.git # 保存tmux会话到disk
git clone https://github.com/tmux-plugins/tmux-continuum.git # 定时保存，自动加载
```

* 在~/.tmux.conf中配置:
```bash
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
​
# 自动备份时间间隔60min, 默认15min
set -g @continuum-save-interval '60'
set -g @continuum-restore 'on'
set -g @resurrect-capture-pane-contents 'on'
​
# Other config ...
​
run -b '~/.tmux/plugins/tpm/tpm'
```
* 重载配置
```bash
tmux source-file ~/.tmux.conf
```
* 指令
    * 保存会话 `CTRL + b` + `CTRL + s`
    * 加载会话 `CTRL + b` + `CTRL + r`



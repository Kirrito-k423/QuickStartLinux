#!/bin/bash

set -v
set -e

# build file
mkdir shaojiemike
cd shaojiemike
export HOME=$PWD
mkdir -p $HOME/.local
mkdir Download
mkdir Install
mkdir github
cd Install
mkdir lib
mkdir zsh
mkdir autoconf-2.71
mkdir tmux
mkdir tree

# wget autoconfig / zsh
cd ../Download
wget http://home.ustc.edu.cn/~huangyeqi/resources/zsh.tar
wget https://github.com/zsh-users/zsh/archive/refs/tags/zsh-5.8.tar.gz
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.gz
wget https://codeload.github.com/tmux/tmux/tar.gz/refs/tags/3.2a
wget https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz

tar xvf zsh.tar -C $HOME
tar zxvf zsh-zsh-5.8.tar.gz -C $HOME/Download
tar zxvf autoconf-2.71.tar.gz -C $HOME/Download
tar zxvf tmux-3.2a.tar.gz -C $HOME/Download
tar zxvf libevent-2.0.19-stable.tar.gz -C $HOME/Download
tar zxvf ncurses-5.9.tar.gz -C $HOME/Download

cd autoconf-2.71
./configure --prefix=$HOME/Install/autoconf2.71
make -j8
make install
export PATH=$HOME/Install/autoconf-2.71/bin:$PATH

cd ../zsh-zsh-5.8/
autoheader
autoconf -i
./configure --prefix=$HOME/Install/zsh
make -j8
make install

# install libevent for tmux
cd ../libevent-2.0.19-stable
./configure --prefix=$HOME/.local --disable-shared
make -j8
make install

# install ncurses for tmux
cd ../ncurses-5.9
./configure --prefix=$HOME/.local
make -j8
make install

# install tmux without sudo
cd ../tmux-3.2a
sh autogen.sh 
#./configure --prefix=$HOME/Install/tmux # error: "libevent not found"

# sudo apt-get install libevent-dev      #如果成功安装就跳去第6步, 如果提示安装冲突(xxxx冲突  libevent-2.0-5 xxxxx), 就执行如下步骤:
# sudo dpkg --purge --force-depends  libevent-2.0-5    # 这里的 libevent-2.0-5 按照自己系统提示是什么冲突, 就改成什么
# sudo apt-get install  libevent-dev      #如果成功安装就跳去第6步, 失败就执行如下步骤
# sudo apt-get install -f               # 自动修复依赖关系     
# sudo apt-get install  libevent-dev    #  到这里应该就可以顺利安装libevent库了

# configure: error: “curses not found”
# sudo apt-get install  ncurses-dev
./configure CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/.local/include"

CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib" make

# add tmux bin to path
cp tmux $HOME/.local/bin

# vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# 没网 gitee
# cd
# wget https://gitee.com/shaojiemike/vimrc/repository/blazearchive/master.zip?Expires=1629203607&Signature=q3F3A6aXR7%2F%2Fj7ALAabQqSKMr8CcV1XtzPBnFQ1fbyU%3D
# unzip vimrc-master.zip -d ~/.vim_runtime
# cd .vim_runtime
# mv vimrc-master/* .
# sh ~/.vim_runtime/install_awesome_vimrc.sh

# vim 补全插件安装
#好多插件让我学一下 见/commands/vim.md 要先装vundle

# oh my tmux
cd
wget https://gitee.com/shaojiemike/oh-my-tmux/repository/blazearchive/master.zip?Expires=1629202041&Signature=Iiolnv2jN6GZM0hBWY09QZAYYPizWCutAMAkhd%2Bwp%2Fo%3D
unzip  oh-my-tmux-master.zip
ln -s -f ~/oh-my-tmux-master/.tmux.conf ~/.tmux.conf
cp ~/oh-my-tmux-master/.tmux.conf.local ~/.tmux.conf.local

# 先把已有的 tmux kill-sesstion -t 1

## install tree
cd $HOME/Download
# download latest tree source to home directory
wget http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz
# unpack
tar xzfv tree-1.8.0.tgz
cd tree-1.8.0/
make
# install to $HOME directory
make install prefix=$HOME/Install/tree
# ADD PATH

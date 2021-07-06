#!/bin/bash

set -v
set -e

# build file
mkdir shaojiemike
cd shaojiemike
export HOME=$PWD
mkdir Download
mkdir Install
mkdir github
cd Install
mkdir lib
mkdir zsh
mkdir autoconf-2.71

# wget autoconfig / zsh
cd ../Download
wget http://home.ustc.edu.cn/~huangyeqi/resources/zsh.tar
wget https://github.com/zsh-users/zsh/archive/refs/tags/zsh-5.8.tar.gz
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.gz
tar xvf zsh.tar -C $HOME
tar zxvf zsh-zsh-5.8.tar.gz -C $HOME/Download
tar zxvf autoconf-2.71.tar.gz -C $HOME/Download

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

# vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# oh my tmux


#!/bin/bash
yum install -y git
yum install -y python-devel python3-devel ruby-devel lua-devel libX11-devel gtk-develi gtk2-devel gtk3-devel ncurses-devel


if [ ! -d "./vim" ]; then
    git clone https://github.com/vim/vim.git
fi

cd vim
# pay attention here check directory correct
sudo ./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib64/python2.7/config/ \
    --enable-python3interp \
    --with-python3-config-dir=/usr/local/lib/python3.9/config-3.9-x86_64-linux-gnu/ \
    --enable-gui=gtk2 \
    --enable-cscope \
    --enable-fail-if-missing \
    --prefix=/usr/local > ../output
cd src
make
make install


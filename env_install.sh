##!/bin/bash
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
    # --enable-pythoninterp \
    # --with-python-config-dir=/usr/lib64/python2.7/config/ \
    --enable-python3interp \
    --with-python3-config-dir=/usr/local/lib/python3.9/config-3.9-x86_64-linux-gnu/ \
    --enable-gui=gtk2 \
    --enable-cscope \
    --enable-fail-if-missing \
    --prefix=/usr/local > output
cd src
make
make install

cd ../../
# make the utilsnips ruler
mkdir -p ~/.vim/bundle/ultisnips/mysnippets/
cp ./cpp.snippets ~/.vim/bundle/ultisnips/mysnippets/


# build c++ lib ctags
echo "input the c++ lib"
read path
echo "ready enter the path: " $path
cd $path
echo "enter the path: " $(pwd)
ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags

# install YCM Relation
yum install -y boost-deve cmake
# access website download http://llvm.org/releases/download.html
# need replace the -DPATH_TO_LLVM_ROOT 
# cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=~/downloads/clang+llvm/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp 


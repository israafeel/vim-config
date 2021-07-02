##!/bin/bash

if [ -f "/etc/redhat-release" ]; then
    YUM='yum'
elif [ -f "/etc/lsb-release" ]; then
    YUM='apt-get'
else
    echo 'I fuck up, man!!!'
    exit 1
fi
echo "package manager is $YUM"

# 1. env install
sudo $YUM install -y git
# ruby, lua, perl, python2, python3
sudo $YUM install -y python-devel python3-devel ruby-devel lua-devel libX11-devel gtk-develi gtk2-devel gtk3-devel ncurses-devel

# 2. deal vim 
if [ ! -d "./vim" ]; then
    git clone https://github.com/vim/vim.git
fi

# fetch env
PY_CONFIG_DIR

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
     --with-python3-config-dir=$PY_CONFIG_DIR \
     --enable-gui=gtk2 \
     --enable-cscope \
     --enable-fail-if-missing \
     --prefix=/usr/local
cd src
make
make install

cd ../../

# 3. deal plugin_manage
if [ ! -d "~/.vim/bundle" ]; then
   mkdir -p ~/.vim/bundle
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# 4. check c++ env need set?
read -p "install c++? (y/n)" is_install_c++
case is_install_c++ in
    [yY])
    # 4.1 make the utilsnips ruler
        mkdir -p ~/.vim/bundle/ultisnips/mysnippets/
        cp ./cpp.snippets ~/.vim/bundle/ultisnips/mysnippets/
            
    # 4.2 build c++ lib ctags
        echo "input the c++ lib"
        read path
        echo "ready enter the path: " $path
        cd $path
        echo "enter the path: " $(pwd)
        ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
          
    # 4.3 install YCM Relation

	;;
	*)
	;;
esac


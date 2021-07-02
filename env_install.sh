##!/bin/bash

finish(){
    cp ./vimrc ~/.vimrc
    exit 0
}

if [ -f "/etc/redhat-release" ]; then
    YUM='yum'
    RELAY='python-devel python3-devel ruby-devel lua-devel libX11-devel gtk-develi gtk2-devel gtk3-devel ncurses-devel'
elif [ -f "/etc/lsb-release" ]; then
    YUM='apt-get'
    RELAY='vim'
else
    echo 'I fuck up, man!!!'
    exit 1
fi
echo "Install start, package manager is $YUM"

# 1. base env install
sudo $YUM install -y git gcc

for sofeware in ruby lua5.3 perl python2 python3 ; do
    echo "check $sofeware"
    CHECK=`whereis $sofeware | grep -w "$sofeware: "`
    echo "$sofeware path: $CHECK"
    if [ -z "$CHECK" ];  then
        echo "install $sofeware"
	sudo $YUM install -y $sofeware
    fi
    if test $? -eq 0; then
        echo "$sofeware had installed"
    else
	echo "$sofeware	install fail"
	exit 1
    fi
done

# 2. install plugin_manage
if [ ! -d '~/.vim/bundle' ]; then
   mkdir -p ~/.vim/bundle
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# 3. install relay
sudo $YUM install -y $RELAY
if [ -f "/etc/lsb-release" ]; then
    finish
fi

# 3. source install vim 
if [ ! -d "./vim" ]; then
    git clone https://github.com/vim/vim.git
fi
cd vim

# fetch env
PY_CONFIG_DIR=`whereis python3 | xargs -n 1 |  grep "lib" | head -n 1`

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

# 4. check c++ env need set?
read -p "install c++? (y/n)" is_install_c
case $is_install_c in
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

finsh

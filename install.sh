#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/powerline/fonts.git
pushd fonts
./install.sh
popd
rm -rf fonts

cp .vimrc ~/
vim +PluginInstall +qall

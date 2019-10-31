#!/bin/bash

# Preparing the home directory
cd ~
mkdir -p .vim/bundle
mkdir -p .vim/autoload
mkdir -p .vim/plugin

# Installing Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Installing plugins
cd ~/.vim/bundle

git clone https://github.com/mattn/emmet-vim
git clone https://github.com/tpope/vim-surround
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/severin-lemaignan/vim-minimap
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/valloric/youcompleteme
git clone https://github.com/matze/vim-move
git clone https://github.com/tkhren/vim-fake
git clone https://github.com/ryanoasis/vim-devicons
git clone https://github.com/itchyny/calendar.vim
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/vim-scripts/cream-showinvisibles

cd ~/.vim/plugin
git clone https://gitlab.com/Dica-Developer/vim-jdb

# Installing colorschemes
cd ~/.vim/bundle

git clone https://github.com/morhetz/gruvbox
git clone https://github.com/lifepillar/vim-solarized8
git clone https://github.com/sainnhe/vim-color-atlantis
git clone https://github.com/jacoborus/tender.vim.git
git clone https://github.com/sainnhe/edge.git

# Get the .vimrc from my github
curl -LSso ~/.vimrc https://raw.githubusercontent.com/mpassarella/vimrc/master/.vimrc

# Configuring YouCompleteMe for java
cd ~/.vim/bundle/youcompleteme

git submodule update --init --recursive
./install.py --java-completer

# END

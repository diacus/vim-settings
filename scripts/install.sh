#!/bin/bash

declare vim_plug_repo=https://raw.githubusercontent.com/junegunn/vim-plug
declare vim_settings_repo=https://raw.githubusercontent.com/diacus/vim-settings

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	$vim_plug_repo/master/plug.vim

curl -fLo ~/.vimrc $vim_settings_repo/main/scripts/main.vim

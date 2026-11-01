#!/bin/bash

declare vim_plug_repo=https://raw.githubusercontent.com/junegunn/vim-plug
declare vim_settings_repo=https://raw.githubusercontent.com/diacus/vim-settings
declare vim_plug_file=$HOME/.vim/autoload/plug.vim
declare vimrc_file=$HOME/.vimrc

info() {
    echo "[vim-settings] $1"
}

die() {
    echo "[vim-settings] ERROR: $1" >&2
    exit 1
}

info "Installing vim-plug in $vim_plug_file"
curl -fsSL -o "$vim_plug_file" --create-dirs \
    "$vim_plug_repo/master/plug.vim" \
    || die "could not download vim-plug"
info "vim-plug installed"

info "Installing the $vimrc_file boilerplate"
curl -fsSL -o "$vimrc_file" \
    "$vim_settings_repo/main/scripts/main.vim" \
    || die "could not download the vimrc boilerplate"
info "vimrc installed"

info "Done. Open vim and run :PlugInstall to install the plugins,"
info "then restart vim to apply all the settings."
#!/usr/bin/env bash
file_location=$(realpath $0)
cfg_dir=$(dirname $file_location)

if ! command -v nvim &> /dev/null; then
    echo "Neovim not installed. Skipping configuration."
    exit 1
fi

if [ -d ~/.config/nvim ]
then
    echo Moving old nvim config to ~/config/nvim_old
    mv ~/.config/nvim ~/.config/nvim_old
fi

set -x 
ln -s $cfg_dir ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"


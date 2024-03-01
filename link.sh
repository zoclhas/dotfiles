#!/bin/bash

current_dir=$PWD

ln -s $current_dir/dotfiles/nvim/ /home/$1/.config/
ln -s $current_dir/dotfiles/zellij/ /home/$1/.config/
ln ./scripts/add_shadow.sh ~/
ln ./.zshrc ~/

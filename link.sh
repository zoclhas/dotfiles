#!/bin/bash

current_dir=$PWD
user=$USER

ln -s $current_dir/dotfiles/nvim/ /home/$user/.config/
ln -s $current_dir/dotfiles/zellij/ /home/$user/.config/
ln ./scripts/add_shadow.sh ~/
ln ./.zshrc ~/

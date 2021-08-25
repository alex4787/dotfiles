#!/bin/bash

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

if [ $SPIN ]; then
	echo ""
fi

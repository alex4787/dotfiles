#!/bin/bash

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/iterm ~/iterm
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# pyenv
curl https://pyenv.run | bash

# Neovim (nightly)
git clone https://github.com/neovim/neovim $HOME/.nvim
cd $HOME/.nvim && sudo make CMAKE_BUILD_TYPE=Release install

if [ $SPIN ]; then
	echo ""
fi

exec $SHELL

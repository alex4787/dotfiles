#!/bin/bash

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/iterm ~/iterm
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# pyenv
if ! command -v pyenv &> /dev/null; then
	curl https://pyenv.run | bash
fi

# ripgrep
if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

# fzf
if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

# Neovim (nightly)
sudo apt purge neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install neovim -y

if [ $SPIN ]; then
	ln -sf ~/dotfiles/.gitconfig-spin ~/.gitconfig
else
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
fi

exec $SHELL

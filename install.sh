#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

# update self
echo "Checking for updates..."
git pull

# Install the tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux plugin manager already installed, updating..."
  cd ~/.tmux/plugins/tpm
  git pull
  cd -
fi

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

if [ ! -d "$XDG_CONFIG_HOME/tmux" ]; then
  mkdir -p $XDG_CONFIG_HOME/tmux
fi

# link ./tmux.conf to $HOME/.tmux.conf
if [ ! -f "$HOME/.tmux.conf" ]; then
  ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
fi

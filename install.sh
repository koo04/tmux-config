#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

if [ ! -d "$XDG_CONFIG_HOME/tmux" ]; then
    mkdir -p "$XDG_CONFIG_HOME/tmux"
fi

ln -s ../tmux-config/ ../.config/tmux/

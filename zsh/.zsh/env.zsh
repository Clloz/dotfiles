#!/bin/zsh

typeset -U path PATH

export LANG=en_US.UTF-8
export TERM=xterm-256color

# XDG config
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_STATE_HOME="$HOME/.local/state"

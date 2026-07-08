#!/bin/zsh

typeset -U path PATH

export LANG=en_US.UTF-8
export TERM=xterm-256color

# XDG config
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_STATE_HOME="$HOME/.local/state"

for editor in nvim vim vi nano; do
  if command -v "$editor" >/dev/null 2>&1; then
    export EDITOR="$editor"
    export VISUAL="$editor"
    break
  fi
done

export PAGER="less"

if command -v nvim >/dev/null 2>&1; then
  export MANPAGER='nvim +Man!'
else
  export MANPAGER='less'
fi

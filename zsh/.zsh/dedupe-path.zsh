#!/bin/zsh

typeset -U path PATH

path=(${path:#${HOME}/.local/bin})
path=(${path:#${HOME}/.cargo/bin})

path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  $path
)

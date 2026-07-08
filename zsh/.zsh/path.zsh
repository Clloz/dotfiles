#!/bin/zsh

# User tools
path=(
  "$HOME/.local/bin"
  $path
)

# Jetbrains Scripts
path+=("$HOME/.jetbrains/bin")

# direnv
eval "$(direnv hook zsh)"

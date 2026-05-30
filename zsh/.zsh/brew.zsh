#!/bin/zsh
# Homebrew config

# macOS Apple Silicon: /opt/homebrew/bin/brew
# macOS Intel:         /usr/local/bin/brew
# Linuxbrew:           /home/linuxbrew/.linuxbrew/bin/brew

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brewdir="cd /opt/homebrew"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  alias brewdir="cd /home/linuxbrew/.linuxbrew"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
  alias brewdir="cd /usr/local"
fi

# Homebrew mirrors
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
#export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
#export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
#export HOMEBREW_NO_INSTALL_FROM_API=1


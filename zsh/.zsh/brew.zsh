#!/bin/zsh
# homebrew zsh config
# 添加 homebrew 到环境变量
#export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"
#export PATH="/opt/homebrew/bin:$PATH"
#export PATH="/opt/homebrew/sbin:$PATH"
# ---- Homebrew (ONCE, correct way) ----
eval "$(/opt/homebrew/bin/brew shellenv)"

# 设置 homebrew 清华源
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
#export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
#export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
#export HOMEBREW_NO_INSTALL_FROM_API=1

#alias
alias brewdir="cd /opt/homebrew"




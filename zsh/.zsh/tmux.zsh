#!/bin/zsh

#source "$ZSH/plugins/tmux/tmux.plugin.zsh"
# SSH 登录远程机器时，自动进入 tmux main session
# 本地 Mac 终端不会触发，因为没有 SSH_CONNECTION
if [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]] && command -v tmux >/dev/null 2>&1; then
  tmux attach-session -t main 2>/dev/null || tmux new-session -s main
fi

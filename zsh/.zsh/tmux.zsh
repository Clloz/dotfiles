#!/bin/zsh

#source "$ZSH/plugins/tmux/tmux.plugin.zsh"

t() {
  local dir
  dir=$(zoxide query -l | fzf) || return

  local name
  name=$(basename "$dir" | tr ' .:' '___')

  if tmux has-session -t "$name" 2>/dev/null; then
    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t "$name"
    else
      tmux attach-session -t "$name"
    fi
  else
    if [[ -n "$TMUX" ]]; then
      tmux new-session -d -s "$name" -c "$dir"
      tmux switch-client -t "$name"
    else
      tmux new-session -s "$name" -c "$dir"
    fi
  fi
}
td() {
  local dir name

  dir=$(zoxide query -l | fzf) || return

  name=$(basename "$dir" | tr ' .:' '___')

  # Session 不存在时才初始化
  if ! tmux has-session -t "=$name" 2>/dev/null; then
    # Window 1: dev
    tmux new-session -d -s "$name" -n dev -c "$dir"

    # Window 2: server
    tmux new-window -d -t "$name:2" -n server -c "$dir"

    # 默认进入 dev
    tmux select-window -t "$name:1"
  fi

  # 连接或切换 Session
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "=$name"
  else
    tmux attach-session -t "=$name"
  fi
}
ts() {
    local session
    session=$(tmux list-sessions -F '#S' | fzf) || return

    if [[ -n "$TMUX" ]]; then
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    fi
}
tw() {
    local target

    target=$(
        tmux list-windows -a -F '#S:#I:#W' |
        fzf
    ) || return

    local session="${target%%:*}"
    local window="${target%:*}"

    if [[ -n "$TMUX" ]]; then
        tmux switch-client -t "$session"
        tmux select-window -t "$window"
    else
        tmux attach-session -t "$session"
        tmux select-window -t "$window"
    fi
}

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
        tmux list-windows -a \
            -F '#S:#I:#W' |
        fzf
    ) || return

    tmux switch-client -t "${target%:*}"
}


# Auto attach tmux on interactive SSH login
if [[ -o login ]] \
  && [[ -n "$SSH_CONNECTION" ]] \
  && [[ -z "$TMUX" ]] \
  && [[ -t 0 ]] \
  && [[ -t 1 ]] \
  && command -v tmux >/dev/null 2>&1; then
  exec tmux new-session -A -s main
fi
